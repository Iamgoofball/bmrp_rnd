AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )
include( "shared.lua" )
function ENT:Initialize()
	self:SetMyName(self.my_name)
	self:SetXOffset(self.XOffset)
	self:SetYOffset(self.YOffset)
	self:SetZOffset(self.ZOffset)
	self:SetModel( self.MyModel )
	self:SetTrigger(self.trigger)
	self:PhysicsInit( SOLID_VPHYSICS )
	self:SetMoveType( MOVETYPE_VPHYSICS )
	self:SetSolid( SOLID_VPHYSICS )
	self:SetUseType( SIMPLE_USE )
	local phys = self:GetPhysicsObject()
	phys:Wake()
end

function ENT:Use(act, call)
	for k,v in pairs(ents.GetAll()) do
		if v:GetClass() == "crystal_sale_machine" then
			local cash_made = v:GetTotalValue()
			local crystals_sold = v:GetCrystals()
			call:addMoney(cash_made)
			DarkRP.notify( call, 0, 4, "You export " .. crystals_sold .. " crystals for $" .. cash_made .. "!" )
			v:SetTotalValue(0)
			v:SetCrystals(0)
		end
	end
end