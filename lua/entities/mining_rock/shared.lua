ENT.Type = "anim"
ENT.Category = "Research And Manufacturing"
ENT.PrintName = "Mining Rock"
ENT.Author = "Iamgoofball"
ENT.Ore = "iron_ore"
ENT.Potential_Ores = {"iron_ore", "copper_ore", "silver_ore", "gold_ore"}
ENT.Ore_Names = {"Iron Ore", "Copper Ore", "Silver Ore", "Gold Ore"}
ENT.MyModel = "models/props/de_inferno/de_inferno_boulder_03.mdl"
ENT.Spawnable = true
ENT.AdminSpawnable = true
function ENT:SetupDataTables()
	
	self:NetworkVar("String", 0, "OreName")

end