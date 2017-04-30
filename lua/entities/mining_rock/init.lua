AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")
resource.AddFile("materials/gui/mine.png")
function ENT:Initialize()
	
	self:SetModel(self.MyModel)

	self:PhysicsInit(SOLID_VPHYSICS)

	self:SetMoveType(MOVETYPE_NONE)
	self:SetSolid(SOLID_VPHYSICS)
	
	self:DropToFloor()
    local phys = self:GetPhysicsObject()
    phys:Wake()
	phys:EnableMotion(false)
	self:SetAngles(Angle(0,90,0))
	local meme = math.random(#self.Potential_Ores)
	self.Ore = self.Potential_Ores[meme]
	self:SetOreName(self.Ore_Names[meme])
	
end

function ENT:OnTakeDamage(dmg)
	local temp_math = math.random(1,100)
	if temp_math <= 33 then
		local weapon = dmg:GetAttacker():GetActiveWeapon():GetClass()
		if (weapon == "tfa_nmrih_pickaxe") or (weapon == "tfa_nmrih_chainsaw") then
			local ORE1 = ents.Create(self.Ore)
			ORE1:SetPos(self:GetPos() + Vector(0,0,50))
			ORE1:Spawn()
			ORE1:SetRealOwner(dmg:GetAttacker())
		end
	end
end