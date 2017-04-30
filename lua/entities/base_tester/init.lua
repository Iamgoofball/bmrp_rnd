AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )
include( "shared.lua" )
function ENT:Initialize()
	self:SetMyName(self.my_name)
	self:SetXOffset(self.XOffset)
	self:SetYOffset(self.YOffset)
	self:SetZOffset(self.ZOffset)
	self:SetModel( self.MyModel )
	self:PhysicsInit( SOLID_VPHYSICS )
	self:SetMoveType( MOVETYPE_VPHYSICS )
	self:SetSolid( SOLID_VPHYSICS )
	self:SetUseType( SIMPLE_USE )
	local phys = self:GetPhysicsObject()
	phys:Wake()
	print("FUCK " .. self.MyTrigger)
	print("SHIT " .. self:GetTrigger())
	self:SetTrigger(self.MyTrigger)
	self:SetNWInt("MyTrigger", self.MyTrigger)
end

function ENT:StartTouch(ent)
	if ent:GetClass() == "tester_crystal" then
		if self:GetNWInt("MyTrigger") == 0 then
			ent:SetAnalyzed(true)
		end
		if ent:GetEffect1Trigger() == self:GetNWInt("MyTrigger") then
			ent:SetEffect1Researched(true)
		end
		if ent:GetEffect2Trigger() == self:GetNWInt("MyTrigger") then
			ent:SetEffect2Researched(true)
		end
		if ent:GetEffect3Trigger() == self:GetNWInt("MyTrigger") then
			ent:SetEffect3Researched(true)
		end
		if ent:GetEffect4Trigger() == self:GetNWInt("MyTrigger") then
			ent:SetEffect4Researched(true)
		end
		ent:RunTriggers(self:GetNWInt("MyTrigger"))
		print(self:GetNWInt("MyTrigger"))
	end
end