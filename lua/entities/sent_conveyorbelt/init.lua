AddCSLuaFile( "cl_init.lua" ) -- Make sure clientside
AddCSLuaFile( "shared.lua" )  -- and shared scripts are sent. 
include('shared.lua')

function ENT:Initialize()
	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetMoveType(MOVETYPE_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS) 
	self:SetMaterial( "conveyorbelt/conveyorbelt" )
    local phys = self:GetPhysicsObject()
	phys:Wake()
end
 
function ENT:Touch( hitEnt )
	local speedamount = self:GetMySpeed()
	if IsValid( hitEnt ) && hitEnt:IsPlayer() then
		hitEnt:SetVelocity(self:GetRight() * (speedamount/10) * -1)
	elseif !IsValid( hitEnt ) || !hitEnt:GetPhysicsObject():IsValid() then 
		return 
	end
	if hitEnt:GetClass() == "sent_conveyorbelt" then 
		return 
	end
	if string.find(hitEnt:GetClass(), "prop_") then
		return 
	end
	if string.find(hitEnt:GetClass(), "func_") then
		return
	end
	if scripted_ents.IsBasedOn(ent:GetClass(), "base_tester") then
		return
	end
	hitEnt:SetAngles(self:GetAngles())
	hitEnt:GetPhysicsObject():SetVelocity(self:GetRight() * speedamount * -1)
end