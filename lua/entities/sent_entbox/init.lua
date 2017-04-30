AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )
include( "shared.lua" )

function ENT:Use(user)
	if self:GetNWString("MyEntity") != "No Entity!" and self.dont_allow_intercepts != 1 then
		if self:GetMyOwner() != user then
			if user:canAfford(self:GetNWInt("Cost")) then
				user:addMoney(-self:GetNWInt("Cost"))
				self:GetMyOwner():addMoney(self:GetNWInt("Cost"))
			else
				return
			end
		end
		self:SetNWInt("Amount", self:GetNWInt("Amount") - 1)
		if self:GetNWInt("Amount") >= 1 then
			self.dont_allow_intercepts = 1
			timer.Create( "DelayInsertOfStuff", 5, 1, function() self.dont_allow_intercepts = 0 end )
			local ent = ents.Create(self:GetNWString("MyEntity"))
			ent:SetPos(self:GetPos() + Vector(0,0,50))
			ent:Spawn()
		else
			self.dont_allow_intercepts = 1
			timer.Create( "DelayInsertOfStuff", 5, 1, function() self.dont_allow_intercepts = 0 end )
			local ent = ents.Create(self:GetNWString("MyEntity"))
			ent:SetPos(self:GetPos() + Vector(0,0,50))
			ent:Spawn()
			self:SetNWString("MyEntity", "No Entity!")
			self:SetNWString("MyEntityName", "Nothing")
			self:GetContentModel():Remove()
			self:SetContentModel(nil)
		end
	end
end

function ENT:Touch(ent)
	for k,v in pairs(BoxBlacklist) do
		if ent:GetClass() == k then
			return
		end
	end
	if self.dont_allow_intercepts == 1 then
		return
	end
	if !IsValid(ent) or ent:IsWorld() then
		return
	end
	if ent:IsPlayer() then
		return
	end
	if string.find(ent:GetClass(), "prop_") then
		return
	end
	if string.find(ent:GetClass(), "func_") then
		return
	end
	if string.find(ent:GetClass(), "entbox") then
		return
	end
	if string.find(ent:GetClass(), "conveyor") then
		return
	end
	if string.find(ent:GetClass(), "crystal_sale") then
		return
	end
	if scripted_ents.IsBasedOn(ent:GetClass(), "base_tester") then
		return
	end
	if ent:GetClass() == self:GetNWString("MyEntity") then
		print("fuck" .. self:GetNWInt("Amount"))
		local fuck234 = self:GetNWInt("Amount") + 1
		self:SetNWInt("Amount", fuck234)
		ent:Remove()
		self.dont_allow_intercepts = 1
		timer.Create( "DelayInsertOfStuff", 1, 1, function() self.dont_allow_intercepts = 0 end )
		return
	elseif self:GetNWString("MyEntity") == "No Entity!" then
		self:SetNWString("MyEntity", ent:GetClass())
		if ent:IsWeapon() then
			self:SetNWString("MyEntityName", ent:GetPrintName())
		else
			self:SetNWString("MyEntityName", ent.PrintName)
		end
		self:SetNWInt("Amount", 1)
		self:SetContentModel(ents.Create("prop_physics"))
		self:GetContentModel():SetModel(ent:GetModel())
		self:GetContentModel():SetPos(self:GetPos())
		self:GetContentModel():Spawn()
		self:GetContentModel():Activate()
		self:GetContentModel():SetSolid(SOLID_NONE)
		self:GetContentModel():SetParent(self)
		ent:Remove()
		print("shit" .. self:GetNWInt("Amount"))
		self.dont_allow_intercepts = 1
		timer.Create( "DelayInsertOfStuff", 1, 1, function() self.dont_allow_intercepts = 0 end )
		return
	end
end