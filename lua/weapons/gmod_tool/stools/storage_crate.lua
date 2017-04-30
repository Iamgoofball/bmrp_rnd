TOOL.Category = "Factory"
TOOL.Name = "Storage Crates"
TOOL.ClientConVar[ "cost" ] = 50
if CLIENT then
	language.Add( "tool.storage_crate.name", "Storage Crates Tool" )
	language.Add( "tool.storage_crate.desc", "Allows you to spawn a Storage Crate for entities to sell or move. " )
	language.Add( "tool.storage_crate.0", "Left click to spawn a crate." )
end


function TOOL:LeftClick( trace )
	local pos = trace.HitPos
	local cost = self:GetClientInfo( "cost" )
	if SERVER then
		local cb = ents.Create("sent_entbox")
		cb:SetPos(pos + Vector(0,0,25))
		cb:Spawn()
		cb:DropToFloor()
		cb:SetNWInt("Cost", cost)
		cb:SetMyOwner(self:GetOwner())
		undo.Create( "StorageCrate" )
			undo.SetPlayer(self:GetOwner())
			undo.AddEntity(cb)
			undo.SetCustomUndoText("Undone Storage Crate")
		undo.Finish( "StorageCrate" )
	end
	return true
end

local ConVarsDefault = TOOL:BuildConVarList()

function TOOL.BuildCPanel( CPanel )

	CPanel:AddControl( "Header", { Description = "Allows you create a storage crate and set the price to buy from it." } )

	CPanel:AddControl( "Slider", { Label = "Cost", Command = "storage_crate_cost", Type = "Int", Min = 0, Max = 1000000 } )

end