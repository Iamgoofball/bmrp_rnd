ENT.Type = "anim"
ENT.Category = "Research And Manufacturing"
ENT.Base = "mining_rock"
ENT.PrintName = "Crystal Mine"
ENT.Author = "Iamgoofball"
ENT.Ore = "tester_crystal"
ENT.Potential_Ores = {"tester_crystal"}
ENT.Ore_Names = {"Green Crystal"}
ENT.MyModel = "models/props/xenprops1/crystal1.mdl"
ENT.Spawnable = true

function ENT:SetupDataTables()
	self:NetworkVar("String", 0, "Ore")
	self:NetworkVar("String", 1, "OreName")
	self:NetworkVar("Entity", 0, "RealOwner")
end