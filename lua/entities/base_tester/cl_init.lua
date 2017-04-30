include( "shared.lua" )

local LabelBackgroundColor 	= ENT.Label_BG;			
local LabelTextColor 		= ENT.Label_TextColor

function ENT:Draw()
	self.Entity:DrawModel()
	
	local Pos = self:GetPos()
	local Ang = self:GetAngles()
	local name = self:GetMyName()

	surface.SetFont( "HUDNumber5" )
	
	Ang:RotateAroundAxis( Ang:Up(), 90 )
	Ang:RotateAroundAxis( Ang:Forward(), 90 )
	
	cam.Start3D2D( Pos + Ang:Up()  * self:GetZOffset(), Ang, 0.3 )
		draw.WordBox( 6, -70 + self:GetXOffset(), -100 + self:GetYOffset(), name, "HUDNumber5", LabelBackgroundColor, LabelTextColor )
	cam.End3D2D()
end