AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")
function ENT:Initialize()
	
	self:SetModel(self.MyModel)
	
	self:SetModelScale(1,1)

    self:PhysicsInit(SOLID_VPHYSICS)
    self:SetMoveType(MOVETYPE_VPHYSICS)
    self:SetSolid(SOLID_VPHYSICS)
    local phys = self:GetPhysicsObject()
    phys:Wake()
	
	self:SetAngles(Angle(0,90,0))
	
	self:SetValue(self.Value)
	self:SetProcessedForm(self.ProcessedForm)
	phys:SetMass(240)
	
end

hook.Add( "GravGunPickupAllowed", "allow_orepickup", function(ply, ent)
	if scripted_ents.IsBasedOn(ent:GetClass(), "ore_base") then 
		return true
	end
end )