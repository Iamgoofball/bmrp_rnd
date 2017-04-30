include( "shared.lua" )

local LabelBackgroundColor 	= ENT.Label_BG;			
local LabelTextColor 		= ENT.Label_TextColor

function ENT:Draw()
	self.Entity:DrawModel()
	
	local Pos = self:GetPos()
	local Ang = self:GetAngles()
	local crystals = self:GetCrystals()
	local value = self:GetTotalValue()

	surface.SetFont( "HUDNumber5" )
	
	Ang:RotateAroundAxis( Ang:Up(), 90 )
	Ang:RotateAroundAxis( Ang:Forward(), 90 )
	
	cam.Start3D2D( Pos + Ang:Up()  * self:GetZOffset() * 3, Ang, 0.3 )
		draw.WordBox( 6, -120 + self:GetXOffset(), -350 + self:GetYOffset(), "Crystal Exporter", "HUDNumber5", LabelBackgroundColor, LabelTextColor )
		draw.WordBox( 6, -120 + self:GetXOffset(), -300 + self:GetYOffset(), "Crystals Ready To Export: " .. crystals, "HUDNumber5", LabelBackgroundColor, LabelTextColor )
		draw.WordBox( 6, -120 + self:GetXOffset(), -250 + self:GetYOffset(), "Combined Value: $" .. value, "HUDNumber5", LabelBackgroundColor, LabelTextColor )
	cam.End3D2D()
end