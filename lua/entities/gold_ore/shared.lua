ENT.Type = "anim"
ENT.Base = "ore_base"
ENT.Category = "Research And Manufacturing"
ENT.PrintName = "Gold Ore"
ENT.Author = "Iamgoofball"
ENT.MyModel = "models/prop/drop/gold_ore.mdl"
ENT.Value = 20
ENT.ProcessedForm = "sent_ball"

function ENT:SetupDataTables()
	
	self:NetworkVar("Int", 0, "Value")
	self:NetworkVar("String", 0, "ProcessedForm")
	self:NetworkVar("Entity", 0, "RealOwner")
end