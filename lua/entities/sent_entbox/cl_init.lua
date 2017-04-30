include( "shared.lua" )

local LabelBackgroundColor 	= ENT.Label_BG;			
local LabelTextColor 		= ENT.Label_TextColor

function ENT:Draw()
	self.Entity:DrawModel()
	
	local Pos = self:GetPos()
	local Ang = self:GetAngles()
	local cost = self:GetNWInt("Cost")
	local ent_name = self:GetNWString("MyEntityName")
	local amount = self:GetNWInt("Amount")
	local model2 = self:GetContentModel()
	
	
	if IsValid(model2) then
		self:DrawContentModel()
	end
	surface.SetFont( "HUDNumber5" )
	local TextWidthName = surface.GetTextSize( ent_name ) * 2
	local TextWidthCost = surface.GetTextSize( cost ) * 2
	local TextWidthAmount = surface.GetTextSize( amount ) * 2
	
	Ang:RotateAroundAxis( Ang:Up(), 90 )
	Ang:RotateAroundAxis( Ang:Forward(), 90 )
	
	cam.Start3D2D( Pos + Ang:Up() * 23, Ang, 0.2 )
		draw.WordBox( 6, -TextWidthName * 0.5 +35, -200, ent_name, "HUDNumber5", LabelBackgroundColor, LabelTextColor )
	cam.End3D2D()
	if cost != 0 then
		cam.Start3D2D( Pos + Ang:Up() * 23, Ang, 0.2 )
			draw.WordBox( 6, -TextWidthCost * 0.5+20, -150, "$" .. cost, "HUDNumber5", LabelBackgroundColor, LabelTextColor )
		cam.End3D2D()
	end
	cam.Start3D2D( Pos + Ang:Up() * 23, Ang, 0.15 )
		draw.WordBox( 6, -TextWidthAmount * 0.5-60, -100, "Amount: " .. amount, "HUDNumber5", LabelBackgroundColor, LabelTextColor )
	cam.End3D2D()
end

function ENT:DrawContentModel() -- lifted from shipments
    self:GetContentModel():SetNoDraw(true)

    local pos = self:GetPos()
    local ang = self:GetAngles()

    -- Position the gun
    local gunPos = self:GetAngles():Up() * 40 + ang:Up() * (math.sin(CurTime() * 3) * 8)
    self:GetContentModel():SetPos(pos + gunPos)

    -- Make it dance
    ang:RotateAroundAxis(ang:Up(), (CurTime() * 180) % 360)
    self:GetContentModel():SetAngles(ang)

    -- Draw the model
    self:GetContentModel():DrawModel()
end