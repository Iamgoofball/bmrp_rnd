AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )
include( "shared.lua" )

function ENT:Initialize()
	self:SetXOffset(self.XOffset)
	self:SetYOffset(self.YOffset)
	self:SetZOffset(self.ZOffset)
	self:SetModel( "models/props/xenprops/crystal2.mdl" )
	self:PhysicsInit( SOLID_VPHYSICS )
	self:SetMoveType( MOVETYPE_VPHYSICS )
	self:SetSolid( SOLID_VPHYSICS )
	self:SetUseType( SIMPLE_USE )
	local phys = self:GetPhysicsObject()
	phys:Wake()
	local triggers = {1,2,3,4,5,6,7,8}
	local effects = {"Xeno Portal", "Damage", "Heal", "Energize HEV Suits", "Bluespace Multi-Carbon Swap", "Bluespace Swap", "Disorient"}

	local pick1 = table.Random(effects)
	local trigger1 = table.Random(triggers)
	while pick1 == "Xeno Portal" and trigger1 == 1 do
		pick1 = table.Random(effects)
		trigger1 = table.Random(triggers)
	end
	table.RemoveByValue(triggers, trigger1)
	table.RemoveByValue(effects, pick1)

	local pick2 = table.Random(effects)
	local trigger2 = table.Random(triggers)
	while pick2 == "Xeno Portal" and trigger2 == 1 do
		pick2 = table.Random(effects)
		trigger2 = table.Random(triggers)
	end
	table.RemoveByValue(effects, pick2)
	table.RemoveByValue(triggers, trigger2)

	local pick3 = table.Random(effects)
	local trigger3 = table.Random(triggers)
	while pick3 == "Xeno Portal" and trigger3 == 1 do
		pick3 = table.Random(effects)
		trigger3 = table.Random(triggers)
	end
	table.RemoveByValue(effects, pick3)
	table.RemoveByValue(triggers, trigger3)

	local pick4 = table.Random(effects)
	local trigger4 = table.Random(triggers)
	while pick4 == "Xeno Portal" and trigger4 == 1 do
		pick4 = table.Random(effects)
		trigger4 = table.Random(triggers)
	end
	table.RemoveByValue(effects, pick4)
	table.RemoveByValue(triggers, trigger4)
	
	self:SetEffect1(pick1)
	self:SetEffect2(pick2)
	self:SetEffect3(pick3)
	self:SetEffect4(pick4)

	self:SetEffect1Trigger(trigger1)
	self:SetEffect2Trigger(trigger2)
	self:SetEffect3Trigger(trigger3)
	self:SetEffect4Trigger(trigger4)
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

function ENT:Think()
	self:RunTriggers(1)
	if self:WaterLevel() > 3 then
		self:RunTriggers(4)
	end
	self:NextThink( CurTime() + 10 )
	return true
end

function ENT:StartTouch(ent)
	if ent:IsPlayer() then
		self:RunTriggers(7)
	end
end

function ENT:OnTakeDamage(dmg)
	if dmg:IsDamageType(DMG_BULLET) or dmg:IsDamageType(DMG_BUCKSHOT) or dmg:IsDamageType(DMG_AIRBOAT) then
		self:RunTriggers(2)
	end
	if dmg:IsDamageType(DMG_BURN) or dmg:IsDamageType(DMG_ENERGYBEAM) then
		self:RunTriggers(5)
	end
	if dmg:IsDamageType(DMG_CLUB) or dmg:IsDamageType(DMG_SLASH) then
		self:RunTriggers(3)
	end
	if dmg:IsDamageType(DMG_CRUSH) then
		self:RunTriggers(6)
	end
	if dmg:IsDamageType(DMG_BLAST) then
		self:RunTriggers(8)
	end
end

function ENT:RunTriggers(num)
	local all_nearby_ents = ents.FindInSphere(self:GetPos(), 500)
	if self:GetEffect1Trigger() == num then
		self:MyTriggerEffect(self:GetEffect1(), all_nearby_ents)
	end
	if self:GetEffect2Trigger() == num then
		self:MyTriggerEffect(self:GetEffect2(), all_nearby_ents)
	end
	if self:GetEffect3Trigger() == num then
		self:MyTriggerEffect(self:GetEffect3(), all_nearby_ents)
	end
	if self:GetEffect4Trigger() == num then
		self:MyTriggerEffect(self:GetEffect4(), all_nearby_ents)
	end
end

-- Effects
-- 1. Spawn Enemy
-- 2. Damage
-- 3. Heal
-- 4. Charge Armor
-- 5. Swap Locations W/ Person
-- 6. Swap Two People's Locations
-- 7. Viewpunch


-- here be dragons
function ENT:MyTriggerEffect(effect, nearby_ents)
	if effect == "Xeno Portal" then
		local npcs = {"monster_hound_eye", "npc_headcrab", "monster_alien_slv", "npc_bullsquid", "npc_friendly"}
		local created_npc = ents.Create(table.Random(npcs)) self:GetPos()
		if not util.IsInWorld(self:GetPos() + Vector(0,0,2)) then return end
		created_npc:SetPos(self:GetPos())
		created_npc:Spawn()
		cleanup.Add(nil, "npcs", created_npc)
	end
	
	if effect == "Damage" then
		for k,v in pairs(nearby_ents) do
			if v:IsPlayer() then
				v:TakeDamage(math.random(10,25), self)
			end
		end
	end
	if effect == "Heal" then
		for k,v in pairs(nearby_ents) do
			if v:IsPlayer() then
				v:SetHealth( math.min( v:GetMaxHealth(), v:Health() + math.random(10,25) ) )
			end
		end
	end
	if effect == "Energize HEV Suits" then
		for k,v in pairs(nearby_ents) do
			if v:IsPlayer() then
				v:SetArmor(math.Clamp(v:Armor() + math.random(10,25), 0, 100))
			end
		end
	end
	if effect == "Bluespace Multi-Carbon Swap" then
		local all_players = {}
		for k,v in pairs(nearby_ents) do
			if v:IsPlayer() then
				table.insert(all_players, v)
			end
		end
		if #all_players >= 2 then
			local player1 = table.Random(all_players)
			table.RemoveByValue(all_players, player1)
			local player2 = table.Random(all_players)
			local p1pos = player1:GetPos()
			local p1ang = player1:GetAngles()
			local p2pos = player2:GetPos()
			local p2ang = player2:GetAngles()
			player1:SetPos(p2pos)
			player1:SetAngles(p2ang)
			player2:SetPos(p1pos)
			player2:SetAngles(p1ang)
			player1:DoScreenFade(Color(0, 255, 0, 200), 0.3, 0)
			player2:DoScreenFade(Color(0, 255, 0, 200), 0.3, 0)
		end
	end
	if effect == "Bluespace Swap" then
		local all_players = {}
		for k,v in pairs(nearby_ents) do
			if v:IsPlayer() then
				table.insert(all_players, v)
			end
		end
		if #all_players >= 1 then
			local player = table.Random(all_players)
			local ppos = player:GetPos()
			local spos = self:GetPos()
			player:SetPos(spos)
			player:DoScreenFade(Color(0, 255, 0, 200), 0.3, 0)
			self:SetPos(ppos)
		end
	end
	if effect == "Disorient" then
		for k,v in pairs(nearby_ents) do
			if v:IsPlayer() then
				v:ViewPunch(Angle( math.random(-20, 20), math.random(-20, 20), math.random(-20, 20)))
			end
		end
	end
end
	