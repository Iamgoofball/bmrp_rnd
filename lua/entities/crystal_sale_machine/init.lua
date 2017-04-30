AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )
include( "shared.lua" )
function ENT:Initialize()
	self:SetMyName(self.my_name)
	self:SetXOffset(self.XOffset)
	self:SetYOffset(self.YOffset)
	self:SetZOffset(self.ZOffset)
	self:SetModel( "models/props_lab/hev_container.mdl")
	self:SetCrystals(0)
	self:SetTotalValue(0)
	self:PhysicsInit( SOLID_VPHYSICS )
	self:SetMoveType( MOVETYPE_VPHYSICS )
	self:SetSolid( SOLID_VPHYSICS )
	self:SetUseType( SIMPLE_USE )
	local phys = self:GetPhysicsObject()
	phys:Wake()
end

function ENT:StartTouch(ent)
	if ent:GetClass() == "tester_crystal" then
		local value = 250
		if ent:GetEffect1Researched() == true then
			value = value + 250
		end
		if ent:GetEffect2Researched() == true then
			value = value + 250
		end
		if ent:GetEffect3Researched() == true then
			value = value + 250
		end
		if ent:GetEffect4Researched() == true then
			value = value + 250
		end
		if IsValid(ent:GetRealOwner()) then
			ent:GetRealOwner():addMoney(value)
			DarkRP.notify( ent:GetRealOwner(), 0, 4, "Mining rebate worth $" .. value .. "!" )
		end
		self:SetTotalValue(self:GetTotalValue() + value)
		self:SetCrystals(self:GetCrystals() + 1)
		ent:Remove()
	end
end