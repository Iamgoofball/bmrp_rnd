include("shared.lua")
resource.AddFile("materials/gui/mine.png")
function ENT:Draw()

	self:DrawModel()
	if self:GetPos():Distance(LocalPlayer():GetPos()) < 350 then
		
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

		cam.Start3D2D(self:GetPos() + self:GetUp() * 90, SpinAng, 0.1)
			surface.SetDrawColor(255,255,255, 255)
			surface.SetMaterial( Material(  "materials/gui/mine.png" ) )
			surface.DrawTexturedRect(-250,-200,500,500)
		cam.End3D2D()

		
	end

end