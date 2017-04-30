TOOL.Category = "Factory"
TOOL.Name = "Conveyor Belt"
TOOL.ClientConVar[ "speed" ] = 100
if CLIENT then
	language.Add( "tool.conveyor.name", "Conveyor Belt Tool" )
	language.Add( "tool.conveyor.desc", "Allows you to turn a prop into a conveyor belt. " )
	language.Add( "tool.conveyor.0", "Left click to factorize." )
end


function TOOL:LeftClick( trace )
	local ent = trace.Entity
	if !IsValid(ent) or ent:IsWorld() then
		return false
	end
	if ent:IsPlayer() then
		return false
	end
	if string.find(ent:GetClass(), "prop_") then
		local speed = self:GetClientInfo( "speed" )
		if SERVER then
			local cb = ents.Create("sent_conveyorbelt")
			cb:SetModel(ent:GetModel())
			cb:SetPos(ent:GetPos())
			cb:SetAngles(ent:GetAngles())
			cb:SetCreator(self:GetOwner())
			ent:Remove()
			cb:Spawn()
			cb:SetMySpeed(speed)
			cb:SetMaterial( "conveyorbelt/conveyorbelt" )
			undo.Create( "ConveyorBelt" )
				undo.SetPlayer(self:GetOwner())
				undo.AddEntity(cb)
				undo.SetCustomUndoText("Undone Conveyor Belt")
			undo.Finish( "Conveyor Belt" )
		end
		return true
	end
	return false
end

local ConVarsDefault = TOOL:BuildConVarList()

function TOOL.BuildCPanel( CPanel )

	CPanel:AddControl( "Header", { Description = "Allows you to make any prop into a conveyor belt." } )

	CPanel:AddControl( "Slider", { Label = "Speed", Command = "conveyor_speed", Type = "Int", Min = 100, Max = 1000 } )

end