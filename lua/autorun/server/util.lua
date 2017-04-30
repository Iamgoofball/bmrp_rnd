local meta = FindMetaTable("Player")
function meta:DoScreenFade(color, fade, hold)
	color = color or Color(255,255,255,255)
	fade = fade or 2
	hold = hold or 0
	umsg.Start("manf_research_dofade", self)
		umsg.String(color.r .. "," .. color.g .. "," .. color.b .. "," .. color.a)
		umsg.Float(fade)
		umsg.Float(hold)
	umsg.End()
end