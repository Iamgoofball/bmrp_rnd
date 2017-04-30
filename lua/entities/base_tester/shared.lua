ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.Category = "Research And Manufacturing"
ENT.PrintName = "Tester Base"
ENT.Author = "Iamgoofball"
ENT.Spawnable = false
ENT.AdminSpawnable = true

ENT.Label_BG = Color( 150, 150, 150 ) -- or in the color format ( Color( r, g, b, a ) )
ENT.Label_TextColor = Color( 0, 0, 0 ) -- ^^^
ENT.my_name = "Tester Base"
ENT.XOffset = 0
ENT.YOffset = 0
ENT.ZOffset = 23
ENT.MyModel = "models/props_lab/server_rack.mdl"
ENT.MyTrigger = 3

function ENT:SetupDataTables()
    self:NetworkVar("String", 0, "MyName")
    self:NetworkVar("Int", 0, "XOffset")
    self:NetworkVar("Int", 1, "YOffset")
    self:NetworkVar("Int", 2, "ZOffset")
    self:NetworkVar("Int", 3, "Trigger")
end