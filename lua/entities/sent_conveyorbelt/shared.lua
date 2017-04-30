ENT.Type = "anim"
ENT.Base = "base_anim" 
ENT.PrintName		= "Conveyor Belt"
ENT.Author			= "Digaly and Iamgoofball"
ENT.Contact			= ""
ENT.Category		= "Factory"

function ENT:SetupDataTables()
	self:NetworkVar("Int", 0, "MySpeed")
end