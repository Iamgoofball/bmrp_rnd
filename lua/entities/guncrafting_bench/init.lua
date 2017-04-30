AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )
include( "shared.lua" )

function ENT:Use(user)
	if(self.crafting == 1) then
		local time_left = math.Round(self.craft_time / 6, 0)
		DarkRP.notify( user, 0, 4, "The crafting bench is crafting, check back in " .. time_left .. " seconds.")
		return
	end
	if self.current_recipe_num == #Recipes then
		self.current_recipe = Recipes[1]
		self.current_recipe_num = 1
	else
		self.current_recipe_num = self.current_recipe_num + 1
		self.current_recipe = Recipes[self.current_recipe_num]
	end
	self:SetNWInt("CurrentRecipe", self.current_recipe_num)
	self:SetNWString( "Crafting", self.current_recipe.name )
end



hook.Add( "PlayerCanPickupWeapon", "noDoublePickup", function( ply, wep )
	if ( ply:HasWeapon( wep:GetClass() ) ) then return false end
end )