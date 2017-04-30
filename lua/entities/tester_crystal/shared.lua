ENT.Type = "anim"
ENT.Base = "ore_base"
ENT.Author = "Iamgoofball"
ENT.PrintName = "Anomaly Crystal"
ENT.Spawnable = false
ENT.AdminSpawnable = true
ENT.XOffset = 0
ENT.YOffset = 0
ENT.ZOffset = 1

ENT.Label_BG = Color( 150, 150, 150 ) -- or in the color format ( Color( r, g, b, a ) )
ENT.Label_TextColor = color_black -- ^^^

function ENT:SetupDataTables()
	self:NetworkVar("String", 0, "Effect1")
	self:NetworkVar("String", 1, "Effect2")
	self:NetworkVar("String", 2, "Effect3")
	self:NetworkVar("String", 3, "Effect4")
	self:NetworkVar("Bool", 0, "Effect1Researched")
	self:NetworkVar("Bool", 1, "Effect2Researched")
	self:NetworkVar("Bool", 2, "Effect3Researched")
	self:NetworkVar("Bool", 3, "Effect4Researched")
	self:NetworkVar("Bool", 4, "Analyzed")
    self:NetworkVar("Int", 0, "XOffset")
    self:NetworkVar("Int", 1, "YOffset")
    self:NetworkVar("Int", 2, "ZOffset")
    self:NetworkVar("Int", 3, "Effect1Trigger")
    self:NetworkVar("Int", 4, "Effect2Trigger")
    self:NetworkVar("Int", 5, "Effect3Trigger")
    self:NetworkVar("Int", 6, "Effect4Trigger")
	self:NetworkVar("Entity", 0, "RealOwner")
end