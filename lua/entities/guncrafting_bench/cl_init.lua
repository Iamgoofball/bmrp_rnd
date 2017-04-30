include( "shared.lua" )

local LabelBackgroundColor 	= ENT.Label_BG;			
local LabelTextColor 		= ENT.Label_TextColor

function ENT:Draw()
	self.Entity:DrawModel()
	
	local Pos = self:GetPos()
	local Ang = self:GetAngles()
	local txt1 = self.PrintName
	local txt2 = "Crafting: " .. self:GetNWString( "Crafting" )
	local is_crafting = self:GetNWInt("IsCrafting")
	
	surface.SetFont( "HUDNumber5" )
	local TextWidthLabel = surface.GetTextSize( txt1 ) * 2
	local TextWidthBaking = surface.GetTextSize( txt2 ) * 2
	
	Ang:RotateAroundAxis( Ang:Up(), 90 )
	Ang:RotateAroundAxis( Ang:Forward(), 90 )
	
	cam.Start3D2D( Pos + Ang:Up() * 16, Ang, 0.09 )
		draw.WordBox( 6, -TextWidthLabel * 0.5 - 60, -850, txt1, "HUDNumber5", LabelBackgroundColor, LabelTextColor )
	cam.End3D2D()
	cam.Start3D2D( Pos + Ang:Up() * 16, Ang, 0.06 )
		draw.WordBox( 6, -TextWidthBaking * 0.5-100, -1180, txt2, "HUDNumber5", LabelBackgroundColor, LabelTextColor )
	cam.End3D2D()
	cam.Start3D2D( Pos + Ang:Up() * 16, Ang, 0.06 )
		draw.WordBox( 6, -TextWidthBaking * 0.5-100, -1100, "Supplies: ", "HUDNumber5", LabelBackgroundColor, LabelTextColor )
		draw.RoundedBox( 6, -340, -1050, 200, 150, LabelBackgroundColor )
		draw.DrawText("Copper: " .. self:GetNWInt("Copper"), "HUDNumber5", -330, -1040, LabelTextColor)
		draw.DrawText("Gold: " .. self:GetNWInt("Gold"), "HUDNumber5", -330, -1010, LabelTextColor)
		draw.DrawText("Silver: " .. self:GetNWInt("Silver"), "HUDNumber5", -330, -980, LabelTextColor)
		draw.DrawText("Iron: " .. self:GetNWInt("Iron"), "HUDNumber5", -330, -950, LabelTextColor)
	cam.End3D2D()
	cam.Start3D2D( Pos + Ang:Up() * 16, Ang, 0.06 )
		draw.WordBox( 6, -TextWidthBaking * 0.5+150, -1100, "Needed: ", "HUDNumber5", LabelBackgroundColor, LabelTextColor )
		draw.RoundedBox( 6, 40, -1050, 200, 150, LabelBackgroundColor )
		draw.DrawText("Copper: " .. Recipes[self:GetNWInt("CurrentRecipe")].ingredients.copper_ore, "HUDNumber5", 50, -1040, LabelTextColor)
		draw.DrawText("Gold: " .. Recipes[self:GetNWInt("CurrentRecipe")].ingredients.gold_ore, "HUDNumber5", 50, -1010, LabelTextColor)
		draw.DrawText("Silver: " .. Recipes[self:GetNWInt("CurrentRecipe")].ingredients.silver_ore, "HUDNumber5", 50, -980, LabelTextColor)
		draw.DrawText("Iron: " .. Recipes[self:GetNWInt("CurrentRecipe")].ingredients.iron_ore, "HUDNumber5", 50, -950, LabelTextColor)
	cam.End3D2D()
end