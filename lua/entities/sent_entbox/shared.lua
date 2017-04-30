ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.Author = "Iamgoofball"
ENT.Spawnable = false
ENT.AdminSpawnable = true

ENT.Label_BG = Color( 150, 150, 150 ) -- or in the color format ( Color( r, g, b, a ) )
ENT.Label_TextColor = color_black -- ^^^

BoxBlacklist = {
    ["fadmin_jail"] = true,
    ["meteor"] = true,
    ["door"] = true,
    ["func_"] = true,
    ["player"] = true,
    ["beam"] = true,
    ["worldspawn"] = true,
    ["env_"] = true,
    ["path_"] = true,
    ["prop_physics"] = true,
    ["money_printer"] = true,
    ["gunlab"] = true,
    ["prop_dynamic"] = true,
    ["prop_vehicle_prisoner_pod"] = true,
    ["keypad_wire"] = true,
    ["gmod_button"] = true,
    ["gmod_rtcameraprop"] = true,
    ["gmod_cameraprop"] = true,
    ["gmod_dynamite"] = true,
    ["gmod_thruster"] = true,
    ["gmod_light"] = true,
    ["gmod_lamp"] = true,
    ["sent_entbox"] = true,
    ["mining_rock"] = true,
    ["sent_conveyorbelt"] = true,
	["guncrafting_bench"] = true,
	["microwave"] = true
}


function ENT:Initialize()
	self:SetNWInt("Amount", 0)
	self:SetNWInt("Cost", 0)
	self:SetNWString("MyEntity", "No Entity!")
	self:SetNWString("MyEntityName", "Nothing")
	if SERVER then
		self:SetModel( "models/props_office/c1a2c_foodcrate_01.mdl" )
		self:PhysicsInit( SOLID_VPHYSICS )
		self:SetMoveType( MOVETYPE_VPHYSICS )
		self:SetSolid( SOLID_VPHYSICS )
		self:SetUseType( SIMPLE_USE )
		local phys = self:GetPhysicsObject()
		phys:Wake()
	end
	self.dont_allow_intercepts = 0
end

function ENT:SetupDataTables()
    self:NetworkVar("Entity", 0, "ContentModel")
    self:NetworkVar("Entity", 1, "MyOwner")
end