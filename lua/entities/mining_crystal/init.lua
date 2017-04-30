AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

function ENT:Initialize()
	
	self:SetModel(self.MyModel)
	self:SetAngles(Angle(-90,0,0))
	self:SetPos(self:GetPos() + Vector(100,0,0))
	self:DropToFloor()
	self:PhysicsInit(SOLID_VPHYSICS)

	self:SetMoveType(MOVETYPE_NONE)
	self:SetSolid(SOLID_VPHYSICS)
    local phys = self:GetPhysicsObject()
    phys:Wake()
	phys:EnableMotion(false)
	self:DropToFloor()
	self.Ore = "tester_crystal"
	self:SetOreName("Anomaly Crystal")
	
end

function ENT:OnTakeDamage(dmg)
	local temp_math = math.random(1,100)
	if temp_math <= 33 then
		local weapon = dmg:GetAttacker():GetActiveWeapon():GetClass()
		if (weapon == "tfa_nmrih_pickaxe") or (weapon == "tfa_nmrih_chainsaw") then
			local ORE1 = ents.Create(self.Ore)
			ORE1:SetPos(self:GetPos() + Vector(0,0,250))
			ORE1:Spawn()
			ORE1:SetRealOwner(dmg:GetAttacker())
		end
	end
end