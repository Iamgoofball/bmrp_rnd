ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.Author = "Iamgoofball"
ENT.Spawnable = false
ENT.AdminSpawnable = true
ENT.current_supplies = {copper_ore = 0, gold_ore = 0, silver_ore = 0, iron_ore = 0}

ENT.Label_BG = Color( 150, 150, 150 ) -- or in the color format ( Color( r, g, b, a ) )
ENT.Label_TextColor = color_black -- ^^^
ENT.PrintName = "Gun Crafting" -- This is what will be printed on top

function ENT:Initialize()
	self.current_recipe = Recipes[1]
	self.current_recipe_num = 1
	self.current_supplies = {copper_ore = 0, gold_ore = 0, silver_ore = 0, iron_ore = 0}
	self.fuck = "fuck"
	self:SetNWInt("CurrentRecipe", self.current_recipe_num)
	if SERVER then
		self:SetModel( "models/props_lab/console03c.mdl" )
		self:PhysicsInit( SOLID_VPHYSICS )
		self:SetMoveType( MOVETYPE_VPHYSICS )
		self:SetSolid( SOLID_VPHYSICS )
		self:SetUseType( SIMPLE_USE )
		local phys = self:GetPhysicsObject()
		phys:Wake()
		self:SetNWInt("IsCrafting", 0)
		self:SetNWString( "Crafting", self.current_recipe.name )
	end
end

function ENT:StartTouch(ent)
	if ent:GetClass() == "copper_ore" then
		self.current_supplies.copper_ore = self.current_supplies.copper_ore + 1
		self:SetNWInt("Copper", self.current_supplies.copper_ore)
		ent:Remove()
	end
	if ent:GetClass() == "iron_ore" then
		self.current_supplies.iron_ore = self.current_supplies.iron_ore + 1
		self:SetNWInt("Iron", self.current_supplies.iron_ore)
		ent:Remove()
	end
	if ent:GetClass() == "silver_ore" then
		self.current_supplies.silver_ore = self.current_supplies.silver_ore + 1
		self:SetNWInt("Silver", self.current_supplies.silver_ore)
		ent:Remove()
	end
	if ent:GetClass() == "gold_ore" then
		self.current_supplies.gold_ore = self.current_supplies.gold_ore + 1
		self:SetNWInt("Gold", self.current_supplies.gold_ore)
		ent:Remove()
	end
	if self.current_supplies.copper_ore >= self.current_recipe.ingredients.copper_ore and self.current_supplies.iron_ore >= self.current_recipe.ingredients.iron_ore and self.current_supplies.silver_ore >= self.current_recipe.ingredients.silver_ore and self.current_supplies.gold_ore >= self.current_recipe.ingredients.gold_ore then
		self.current_supplies.copper_ore = self.current_supplies.copper_ore - self.current_recipe.ingredients.copper_ore
		self.current_supplies.iron_ore = self.current_supplies.iron_ore - self.current_recipe.ingredients.iron_ore
		self.current_supplies.gold_ore = self.current_supplies.gold_ore - self.current_recipe.ingredients.gold_ore
		self.current_supplies.silver_ore = self.current_supplies.silver_ore - self.current_recipe.ingredients.silver_ore
		self:SetNWInt("Copper", self.current_supplies.copper_ore)
		self:SetNWInt("Iron", self.current_supplies.iron_ore)
		self:SetNWInt("Silver", self.current_supplies.silver_ore)
		self:SetNWInt("Gold", self.current_supplies.gold_ore)
		local gun = ents.Create(self.current_recipe.crafting_result)
		gun:SetPos(self:GetPos() + Vector(0,50,50))
		gun:Spawn()
	end
end