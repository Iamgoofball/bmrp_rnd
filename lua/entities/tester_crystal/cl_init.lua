include( "shared.lua" )
local LabelBackgroundColor 	= ENT.Label_BG	
local LabelTextColor 		= ENT.Label_TextColor

function ENT:Draw()
	self.Entity:DrawModel()
	
	local Pos = self:GetPos()

	-- angle --
	local Ang = self:GetAngles()
	Ang:RotateAroundAxis( Ang:Forward(), 90)
	Ang:RotateAroundAxis( Ang:Right(), 0)
	
	local eyeang = LocalPlayer():EyeAngles().y - 90 -- Face upwards
	local SpinAng = Angle( 0, eyeang, 90 )


	-- position --
	local UpTranslate = 2 + math.sin(CurTime()) * 2 
	local RightTranslate = 0
	local ForwardTranslate = 10

	surface.SetFont( "HUDNumber5" )
	
	Ang:RotateAroundAxis( Ang:Up(), 90 )
	Ang:RotateAroundAxis( Ang:Forward(), 90 )
	
	cam.Start3D2D( Pos + Ang:Up() * 1, Ang, 0.3 )
		if self:GetAnalyzed() == true then
			draw.WordBox( 6, -120 + self:GetXOffset(), -300 + self:GetYOffset(), "Anomaly Crystal", "HUDNumber5", LabelBackgroundColor, LabelTextColor )
			if self:GetEffect1Researched() == true then
				draw.WordBox( 6, -120 + self:GetXOffset(), -250 + self:GetYOffset(), "Effect 1: " .. self:GetEffect1() .. " by " .. self:Num2Trigger(self:GetEffect1Trigger()), "HUDNumber5", LabelBackgroundColor, LabelTextColor )
			else
				draw.WordBox( 6, -120 + self:GetXOffset(), -250 + self:GetYOffset(), "Effect 1: ????", "HUDNumber5", LabelBackgroundColor, LabelTextColor )
			end
			if self:GetEffect2Researched() == true then
				draw.WordBox( 6, -120 + self:GetXOffset(), -200 + self:GetYOffset(), "Effect 2: ".. self:GetEffect2() .. " by " .. self:Num2Trigger(self:GetEffect2Trigger()), "HUDNumber5", LabelBackgroundColor, LabelTextColor )
			else
				draw.WordBox( 6, -120 + self:GetXOffset(), -200 + self:GetYOffset(), "Effect 2: ????", "HUDNumber5", LabelBackgroundColor, LabelTextColor )
			end
			if self:GetEffect3Researched() == true then
				draw.WordBox( 6, -120 + self:GetXOffset(), -150 + self:GetYOffset(), "Effect 3: " .. self:GetEffect3() .. " by " .. self:Num2Trigger(self:GetEffect3Trigger()), "HUDNumber5", LabelBackgroundColor, LabelTextColor )
			else
				draw.WordBox( 6, -120 + self:GetXOffset(), -150 + self:GetYOffset(), "Effect 3: ????", "HUDNumber5", LabelBackgroundColor, LabelTextColor )
			end
			if self:GetEffect4Researched() == true then
				draw.WordBox( 6, -120 + self:GetXOffset(), -100 + self:GetYOffset(), "Effect 4: " .. self:GetEffect4() .. " by " .. self:Num2Trigger(self:GetEffect4Trigger()), "HUDNumber5", LabelBackgroundColor, LabelTextColor )
			else
				draw.WordBox( 6, -120 + self:GetXOffset(), -100 + self:GetYOffset(), "Effect 4: ????", "HUDNumber5", LabelBackgroundColor, LabelTextColor )
			end
		else
			draw.WordBox( 6, -120 + self:GetXOffset(), -100 + self:GetYOffset(), "Anomaly Crystal", "HUDNumber5", LabelBackgroundColor, LabelTextColor )
		end
	cam.End3D2D()
end

-- Triggers:
-- 1. Think
-- 2. Bullets
-- 3. Melee
-- 4. Water
-- 5. Burn
-- 6. Gravity
-- 7. Player
-- 8. Explosion

function ENT:Num2Trigger(num)
	if num == 1 then
		return "Timed"
	end
	if num == 2 then
		return "Ballistic Impact"
	end
	if num == 3 then
		return "Blunt Force"
	end
	if num == 4 then
		return "Water"
	end
	if num == 5 then
		return "High Temperature Exposure"
	end
	if num == 6 then
		return "Gravitational Impact"
	end
	if num == 7 then
		return "Personal Contact"
	end
	if num == 8 then
		return "Explosive Contact"
	end
	return "What the fuck did you just say about me you little bitch"
end