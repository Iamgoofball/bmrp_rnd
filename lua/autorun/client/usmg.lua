usermessage.Hook("manf_research_dofade", function(usmg)
	local Col = usmg:ReadString()
	if !Col then return end
	Col = string.Explode(",", Col)
	local color = Color(tonumber(Col[1]), tonumber(Col[2]), tonumber(Col[3]), tonumber(Col[4]))
	local fade = usmg:ReadFloat()
	local hold = usmg:ReadFloat()
	local fadeSc = color.a /fade
	local startFade = CurTime() +hold
	hook.Add("HUDPaint", "manf_research_dofade_paint", function()
		local a = CurTime() < startFade && color.a || math.Clamp(color.a -fadeSc *(CurTime() -startFade), 0, color.a)
		if a == 0 then hook.Remove("HUDPaint", "manf_research_dofade_paint"); return end
		surface.SetDrawColor(color.r, color.g, color.b, a)
		surface.DrawRect(0 , 0, ScrW(), ScrH())
	end)
end)