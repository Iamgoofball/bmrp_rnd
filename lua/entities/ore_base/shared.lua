ENT.Type = "anim"
ENT.Category = "Research And Manufacturing"
ENT.PrintName = "Ore Base"
ENT.Author = "Iamgoofball"
ENT.MyModel = "models/prop/drop/silver_ore.mdl"
ENT.Value = 500
ENT.ProcessedForm = "sent_ball"

function ENT:SetupDataTables()
	
	self:NetworkVar("Int", 0, "Value")
	self:NetworkVar("Entity", 0, "RealOwner")
end