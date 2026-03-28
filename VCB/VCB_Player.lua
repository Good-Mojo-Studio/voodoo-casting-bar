-- =========================
-- some variables
-- =========================
local G = VDW.Local.Override
local UNIT = "player"
local Duration
local uninterruptible = false
local castBar = "Cast"
local jailerColor = CreateColorFromRGBAHexString("0A979CFF")
local tradeSkill = false
local interrupted = false
local tChange = 0
local tStart = 0
local tSucceeded = 0
local tSend = 0
local tInterrupted = 0
local tChannelStart = 0
local tChannelUpdate = 0
local tEmpowerUpdate = 0
local lagStart = 0
local lagEnd = 0
local lagTotal = 0
local statusMin = 0
local statusMax = 0
local lagWidth = 0
local lagBarWidth = 0
local _, castName, castText, castTexture, castIsTradeSkill, castNotInterruptible, chanName, chanText, chanTexture, chanIsTradeSkill, chanNotInterruptible, isEmpowered, numStages
local vcbSchool = "Default"
local vcbColor = false
local vcbClass
local vcbInstantClass
local vcbVectorA
local vcbVectorB
local vcbEvokerTicks = 4
local vcbInterruptSpell = 0
local vcbInterruptSpellTable ={}
local iEndTime = 0
VDW.VCB.InterruptSpell = "Interrupting Spell"
-- =========================
-- extra textures
-- =========================
-- copy texture of spell's icon
local iconSpellLeft = PlayerCastingBarFrame:CreateTexture(nil, "ARTWORK", nil, 0)
local iconSpellRight = PlayerCastingBarFrame:CreateTexture(nil, "ARTWORK", nil, 0)
-- spell's shield left
local shieldSpellLeft = PlayerCastingBarFrame:CreateTexture(nil, "BACKGROUND", nil, 0)
shieldSpellLeft:SetAtlas("ui-castingbar-shield")
shieldSpellLeft:SetAlpha(0)
-- spell's shield right
local shieldSpellRight = PlayerCastingBarFrame:CreateTexture(nil, "BACKGROUND", nil, 0)
shieldSpellRight:SetAtlas("ui-castingbar-shield")
shieldSpellRight:SetAlpha(0)
 -- 0.75
-- Text Border Top
local TextBorderTop = PlayerCastingBarFrame:CreateTexture(nil, "BACKGROUND", nil, -7)
TextBorderTop:SetAtlas("ui-castingbar-textbox", false)
TextBorderTop:SetAlpha(0)
-- Text Border Bottom
local TextBorderBottom = PlayerCastingBarFrame:CreateTexture(nil, "BACKGROUND", nil, -7)
TextBorderBottom:SetAtlas("ui-castingbar-textbox", false)
TextBorderBottom:SetAlpha(0)
-- Spell Queue Window Bar
local function VCBSpellQueueBar(var1)
	var1:SetAtlas("UI-CastingBar-Background", false, "NEAREST")
	var1:SetHeight(PlayerCastingBarFrame:GetHeight())
	var1:SetVertexColor(0, 1, 0)
	var1:SetAlpha(0.75)
	var1:Hide()
end
-- SpellQueue Bar 1
local VCBSpellQueueCastBar = PlayerCastingBarFrame:CreateTexture(nil, "ARTWORK", nil, 1)
VCBSpellQueueBar(VCBSpellQueueCastBar)
-- SpellQueue Bar 2
local VCBSpellQueueChannelBar = PlayerCastingBarFrame:CreateTexture(nil, "ARTWORK", nil, 1)
VCBSpellQueueBar(VCBSpellQueueChannelBar)
-- Lag / Latency  Bar
local function VCBlagBars(var1)
	var1:SetAtlas("UI-CastingBar-Background", false, "NEAREST")
	var1:SetHeight(PlayerCastingBarFrame:GetHeight())
	var1:SetVertexColor(1, 0, 0)
	var1:SetAlpha(0.75)
	var1:Hide()
end
-- Lag Bar 1 --
local VCBLagCastBar = PlayerCastingBarFrame:CreateTexture(nil, "ARTWORK", nil, 1)
VCBlagBars(VCBLagCastBar)
-- Lag Bar 2 --
local VCBLagChannelBar = PlayerCastingBarFrame:CreateTexture(nil, "ARTWORK", nil, 1)
VCBlagBars(VCBLagChannelBar)
-- textures of the class icon square
local function ClassIconSquare(self)
	if VDW.PlayerClassID == 1 then
		self:SetSwipeTexture("Interface\\ICONS\\ClassIcon_Warrior.blp")
	elseif VDW.PlayerClassID == 2 then
		self:SetSwipeTexture("Interface\\ICONS\\ClassIcon_Paladin.blp")
	elseif VDW.PlayerClassID == 3 then
		self:SetSwipeTexture("Interface\\ICONS\\ClassIcon_Hunter.blp")
	elseif VDW.PlayerClassID == 4 then
		self:SetSwipeTexture("Interface\\ICONS\\ClassIcon_Rogue.blp")
	elseif VDW.PlayerClassID == 5 then
		self:SetSwipeTexture("Interface\\ICONS\\ClassIcon_Priest.blp")
	elseif VDW.PlayerClassID == 6 then
		self:SetSwipeTexture("Interface\\ICONS\\ClassIcon_DeathKnight.blp")
	elseif VDW.PlayerClassID == 7 then
		self:SetSwipeTexture("Interface\\ICONS\\ClassIcon_Shaman.blp")
	elseif VDW.PlayerClassID == 8 then
		self:SetSwipeTexture("Interface\\ICONS\\ClassIcon_Mage.blp")
	elseif VDW.PlayerClassID == 9 then
		self:SetSwipeTexture("Interface\\ICONS\\ClassIcon_Warlock.blp")
	elseif VDW.PlayerClassID == 10 then
		self:SetSwipeTexture("Interface\\ICONS\\ClassIcon_Monk.blp")
	elseif VDW.PlayerClassID == 11 then
		self:SetSwipeTexture("Interface\\ICONS\\ClassIcon_Druid.blp")
	elseif VDW.PlayerClassID == 12 then
		self:SetSwipeTexture("Interface\\ICONS\\ClassIcon_DemonHunter.blp")
	elseif VDW.PlayerClassID == 13 then
		self:SetSwipeTexture("Interface\\ICONS\\ClassIcon_Evoker.blp")
	end
	vcbVectorA = CreateVector2D(0, 0)
	vcbVectorB = CreateVector2D(1, 1)
	self:SetTexCoordRange(vcbVectorA, vcbVectorB)
end
-- textures of the class icon round
local function ClassIconRound(self)
	self:SetSwipeTexture("interface/hud/uiunitframeclassicons2x")
	if VDW.PlayerClassID == 1 then --Warrior
		vcbVectorA = CreateVector2D(0.478515625, 0.478515625) -- left, top
		vcbVectorB = CreateVector2D(0.712890625, 0.712890625) -- right, bottom
	elseif VDW.PlayerClassID == 2 then --Paladin
		vcbVectorA = CreateVector2D(0.240234375, 0.240234375)
		vcbVectorB = CreateVector2D(0.474609375, 0.474609375)
	elseif VDW.PlayerClassID == 3 then --Hunter
		vcbVectorA = CreateVector2D(0.001953125, 0.240234375)
		vcbVectorB = CreateVector2D(0.236328125, 0.474609375)
	elseif VDW.PlayerClassID == 4 then --Rogue
		vcbVectorA = CreateVector2D(0.716796875, 0.240234375)
		vcbVectorB = CreateVector2D(0.951171875, 0.474609375)
	elseif VDW.PlayerClassID == 5 then --Priest
		vcbVectorA = CreateVector2D(0.478515625, 0.240234375)
		vcbVectorB = CreateVector2D(0.712890625, 0.474609375)
	elseif VDW.PlayerClassID == 6 then --Death Kight
		vcbVectorA = CreateVector2D(0.001953125, 0.236328125)
		vcbVectorB = CreateVector2D(0.001953125, 0.236328125)
	elseif VDW.PlayerClassID == 7 then --Shaman
		vcbVectorA = CreateVector2D(0.240234375, 0.478515625)
		vcbVectorB = CreateVector2D(0.474609375, 0.712890625)
	elseif VDW.PlayerClassID == 8 then --Mage
		vcbVectorA = CreateVector2D(0.001953125, 0.478515625)
		vcbVectorB = CreateVector2D(0.236328125, 0.712890625)
	elseif VDW.PlayerClassID == 9 then --Warlock
		vcbVectorA = CreateVector2D(0.240234375, 0.716796875)
		vcbVectorB = CreateVector2D(0.474609375, 0.951171875)
	elseif VDW.PlayerClassID == 10 then --Monk
		vcbVectorA = CreateVector2D(0.001953125, 0.716796875)
		vcbVectorB = CreateVector2D(0.236328125, 0.951171875)
	elseif VDW.PlayerClassID == 11 then --Druid
		vcbVectorA = CreateVector2D(0.478515625, 0.001953125)
		vcbVectorB = CreateVector2D(0.712890625, 0.236328125)
	elseif VDW.PlayerClassID == 12 then --Demon Hunter
		vcbVectorA = CreateVector2D(0.240234375, 0.001953125)
		vcbVectorB = CreateVector2D(0.474609375, 0.236328125)
	elseif VDW.PlayerClassID == 13 then --Evoker
		vcbVectorA = CreateVector2D(0.716796875, 0.001953125)
		vcbVectorB = CreateVector2D(0.951171875, 0.236328125)
	end
	self:SetTexCoordRange(vcbVectorA, vcbVectorB)
end
-- textures of the hero icon
local function HeroIcon(self)
	self:SetSwipeTexture("interface/talentframe/talentsheroclassicons")
	local chkTalentID = C_ClassTalents.GetLastSelectedSavedConfigID(PlayerUtil.GetCurrentSpecID())
	local hero = C_ClassTalents.GetActiveHeroTalentSpec()
	local subTreeInfo = C_Traits.GetSubTreeInfo(chkTalentID, hero)
	if subTreeInfo.iconElementID == "talents-heroclass-deathknight-deathbringer" then
		vcbVectorA = CreateVector2D(0.00048828125, 0.0009765625)
		vcbVectorB = CreateVector2D(0.09814453125, 0.1962890625)
	elseif subTreeInfo.iconElementID == "talents-heroclass-deathknight-rideroftheapocalypse" then
		vcbVectorA = CreateVector2D(0.00048828125, 0.1982421875)
		vcbVectorB = CreateVector2D(0.09814453125, 0.3935546875)
	elseif subTreeInfo.iconElementID == "talents-heroclass-deathknight-sanlayn" then
		vcbVectorA = CreateVector2D(0.00048828125, 0.3955078125)
		vcbVectorB = CreateVector2D(0.09814453125, 0.5908203125)
	elseif subTreeInfo.iconElementID == "talents-heroclass-demonhunter-aldrachireaver" then
		vcbVectorA = CreateVector2D(0.00048828125, 0.5927734375)
		vcbVectorB = CreateVector2D(0.09814453125, 0.7880859375)
	elseif subTreeInfo.iconElementID == "talents-heroclass-demonhunter-annihilator" then
		vcbVectorA = CreateVector2D(0.00048828125, 0.7900390625)
		vcbVectorB = CreateVector2D(0.09814453125, 0.9853515625)
	elseif subTreeInfo.iconElementID == "talents-heroclass-demonhunter-felscarred" then
		vcbVectorA = CreateVector2D(0.09912109375, 0.0009765625)
		vcbVectorB = CreateVector2D(0.19677734375, 0.1962890625)
	elseif subTreeInfo.iconElementID == "talents-heroclass-demonhunter-felscarred2" then
		vcbVectorA = CreateVector2D(0.09912109375, 0.1982421875)
		vcbVectorB = CreateVector2D(0.19677734375, 0.3935546875)
	elseif subTreeInfo.iconElementID == "talents-heroclass-druid-druidoftheclaw" then
		vcbVectorA = CreateVector2D(0.09912109375, 0.3955078125)
		vcbVectorB = CreateVector2D(0.19677734375, 0.5908203125)
	elseif subTreeInfo.iconElementID == "talents-heroclass-druid-eluneschosen" then
		vcbVectorA = CreateVector2D(0.09912109375, 0.5927734375)
		vcbVectorB = CreateVector2D(0.19677734375, 0.7880859375)
	elseif subTreeInfo.iconElementID == "talents-heroclass-druid-keeperofthegrove" then
		vcbVectorA = CreateVector2D(0.09912109375, 0.7900390625)
		vcbVectorB = CreateVector2D(0.19677734375, 0.9853515625)
	elseif subTreeInfo.iconElementID == "talents-heroclass-druid-wildstalker" then
		vcbVectorA = CreateVector2D(0.19775390625, 0.0009765625)
		vcbVectorB = CreateVector2D(0.29541015625, 0.1962890625)
	elseif subTreeInfo.iconElementID == "talents-heroclass-evoker-chronowarden" then
		vcbVectorA = CreateVector2D(0.19775390625, 0.1982421875)
		vcbVectorB = CreateVector2D(0.29541015625, 0.3935546875)
	elseif subTreeInfo.iconElementID == "talents-heroclass-evoker-flameshaper" then
		vcbVectorA = CreateVector2D(0.19775390625, 0.3955078125)
		vcbVectorB = CreateVector2D(0.29541015625, 0.5908203125)
	elseif subTreeInfo.iconElementID == "talents-heroclass-evoker-scalecommander" then
		vcbVectorA = CreateVector2D(0.19775390625, 0.5927734375)
		vcbVectorB = CreateVector2D(0.29541015625, 0.7880859375)
	elseif subTreeInfo.iconElementID == "talents-heroclass-hunter-darkranger" then
		vcbVectorA = CreateVector2D(0.19775390625, 0.7900390625)
		vcbVectorB = CreateVector2D(0.29541015625, 0.9853515625)
	elseif subTreeInfo.iconElementID == "talents-heroclass-hunter-packleader" then
		vcbVectorA = CreateVector2D(0.29638671875, 0.0009765625)
		vcbVectorB = CreateVector2D(0.39404296875, 0.1962890625)
	elseif subTreeInfo.iconElementID == "talents-heroclass-hunter-sentinel" then
		vcbVectorA = CreateVector2D(0.29638671875, 0.1982421875)
		vcbVectorB = CreateVector2D(0.39404296875, 0.3935546875)
	elseif subTreeInfo.iconElementID == "talents-heroclass-mage-frostfire" then
		vcbVectorA = CreateVector2D(0.29638671875, 0.3955078125)
		vcbVectorB = CreateVector2D(0.39404296875, 0.5908203125)
	elseif subTreeInfo.iconElementID == "talents-heroclass-mage-spellslinger" then
		vcbVectorA = CreateVector2D(0.29638671875, 0.5927734375)
		vcbVectorB = CreateVector2D(0.39404296875, 0.7880859375)
	elseif subTreeInfo.iconElementID == "talents-heroclass-mage-sunfury" then
		vcbVectorA = CreateVector2D(0.29638671875, 0.7900390625)
		vcbVectorB = CreateVector2D(0.39404296875, 0.9853515625)
	elseif subTreeInfo.iconElementID == "talents-heroclass-monk-conduitofthecelestials" then
		vcbVectorA = CreateVector2D(0.39501953125, 0.0009765625)
		vcbVectorB = CreateVector2D(0.49267578125, 0.1962890625)
	elseif subTreeInfo.iconElementID == "talents-heroclass-monk-masterofharmony" then
		vcbVectorA = CreateVector2D(0.39501953125, 0.1982421875)
		vcbVectorB = CreateVector2D(0.49267578125, 0.3935546875)
	elseif subTreeInfo.iconElementID == "talents-heroclass-monk-shadopan" then
		vcbVectorA = CreateVector2D(0.39501953125, 0.3955078125)
		vcbVectorB = CreateVector2D(0.49267578125, 0.5908203125)
	elseif subTreeInfo.iconElementID == "talents-heroclass-paladin-heraldofthesun" then
		vcbVectorA = CreateVector2D(0.39501953125, 0.5927734375)
		vcbVectorB = CreateVector2D(0.49267578125, 0.7880859375)
	elseif subTreeInfo.iconElementID == "talents-heroclass-paladin-lightsmith" then
		vcbVectorA = CreateVector2D(0.39501953125, 0.7900390625)
		vcbVectorB = CreateVector2D(0.49267578125, 0.9853515625)
	elseif subTreeInfo.iconElementID == "talents-heroclass-paladin-templar" then
		vcbVectorA = CreateVector2D(0.49365234375, 0.0009765625)
		vcbVectorB = CreateVector2D(0.59130859375, 0.1962890625)
	elseif subTreeInfo.iconElementID == "talents-heroclass-priest-archon" then
		vcbVectorA = CreateVector2D(0.49365234375, 0.1982421875)
		vcbVectorB = CreateVector2D(0.59130859375, 0.3935546875)
	elseif subTreeInfo.iconElementID == "talents-heroclass-priest-oracle" then
		vcbVectorA = CreateVector2D(0.49365234375, 0.3955078125)
		vcbVectorB = CreateVector2D(0.59130859375, 0.5908203125)
	elseif subTreeInfo.iconElementID == "talents-heroclass-priest-voidweaver" then
		vcbVectorA = CreateVector2D(0.49365234375, 0.5927734375)
		vcbVectorB = CreateVector2D(0.59130859375, 0.7880859375)
	elseif subTreeInfo.iconElementID == "talents-heroclass-rogue-deathstalker" then
		vcbVectorA = CreateVector2D(0.49365234375, 0.7900390625)
		vcbVectorB = CreateVector2D(0.59130859375, 0.9853515625)
	elseif subTreeInfo.iconElementID == "talents-heroclass-rogue-fatebound" then
		vcbVectorA = CreateVector2D(0.59228515625, 0.0009765625)
		vcbVectorB = CreateVector2D(0.68994140625, 0.1962890625)
	elseif subTreeInfo.iconElementID == "talents-heroclass-shaman-totemic" then
		vcbVectorA = CreateVector2D(0.59228515625, 0.1982421875)
		vcbVectorB = CreateVector2D(0.68994140625, 0.3935546875)
	elseif subTreeInfo.iconElementID == "talents-heroclass-warlock-diabolist" then
		vcbVectorA = CreateVector2D(0.59228515625, 0.3955078125)
		vcbVectorB = CreateVector2D(0.68994140625, 0.5908203125)
	elseif subTreeInfo.iconElementID == "talents-heroclass-warlock-hellcaller" then
		vcbVectorA = CreateVector2D(0.59228515625, 0.5927734375)
		vcbVectorB = CreateVector2D(0.68994140625, 0.7880859375)
	elseif subTreeInfo.iconElementID == "talents-heroclass-warlock-soulharvester" then
		vcbVectorA = CreateVector2D(0.59228515625, 0.7900390625)
		vcbVectorB = CreateVector2D(0.68994140625, 0.9853515625)
	elseif subTreeInfo.iconElementID == "talents-heroclass-rogue-trickster" then
		vcbVectorA = CreateVector2D(0.69091796875, 0.0009765625)
		vcbVectorB = CreateVector2D(0.78857421875, 0.1962890625)
	elseif subTreeInfo.iconElementID == "talents-heroclass-warrior-colossus" then
		vcbVectorA = CreateVector2D(0.69091796875, 0.1982421875)
		vcbVectorB = CreateVector2D(0.78857421875, 0.3935546875)
	elseif subTreeInfo.iconElementID == "talents-heroclass-shaman-farseer" then
		vcbVectorA = CreateVector2D(0.78955078125, 0.0009765625)
		vcbVectorB = CreateVector2D(0.88720703125, 0.1962890625)
	elseif subTreeInfo.iconElementID == "talents-heroclass-warrior-mountainthane" then
		vcbVectorA = CreateVector2D(0.78955078125, 0.1982421875)
		vcbVectorB = CreateVector2D(0.88720703125, 0.3935546875)
	elseif subTreeInfo.iconElementID == "talents-heroclass-shaman-stormbringer" then
		vcbVectorA = CreateVector2D(0.88818359375, 0.0009765625)
		vcbVectorB = CreateVector2D(0.98583984375, 0.1962890625)
	elseif subTreeInfo.iconElementID == "talents-heroclass-warrior-slayer" then
		vcbVectorA = CreateVector2D(0.88818359375, 0.1982421875)
		vcbVectorB = CreateVector2D(0.98583984375, 0.3935546875)
	end
	self:SetTexCoordRange(vcbVectorA, vcbVectorB)
end
-- textures of the "Faction Round"
local function FactionIconRound(self)
	if VDW.PlayerFactionInfo.groupTag == "Alliance" then
		self:SetSwipeTexture("Interface\\ICONS\\UI_AllianceIcon-round.blp")
	elseif VDW.PlayerFactionInfo.groupTag == "Horde" then
		self:SetSwipeTexture("Interface\\ICONS\\UI_HordeIcon-round.blp")
	end
	vcbVectorA = CreateVector2D(0, 0)
	vcbVectorB = CreateVector2D(1, 1)
	self:SetTexCoordRange(vcbVectorA, vcbVectorB)
end
-- textures of the "Faction Old"
local function FactionIconOld(self)
	if VDW.PlayerFactionInfo.groupTag == "Alliance" then
		self:SetSwipeTexture("Interface\\ICONS\\UI_Alliance_7LegionMedal.blp")
	elseif VDW.PlayerFactionInfo.groupTag == "Horde" then
		self:SetSwipeTexture("Interface\\ICONS\\UI_Horde_HonorboundMedal.blp")
	end
	vcbVectorA = CreateVector2D(0, 0)
	vcbVectorB = CreateVector2D(1, 1)
	self:SetTexCoordRange(vcbVectorA, vcbVectorB)
end
-- textures of the "Faction New"
local function FactionIconNew(self)
	if VDW.PlayerFactionInfo.groupTag == "Alliance" then
		self:SetSwipeTexture("Interface\\ICONS\\UI_AllianceIcon.blp")
	elseif VDW.PlayerFactionInfo.groupTag == "Horde" then
		self:SetSwipeTexture("Interface\\ICONS\\UI_HordeIcon.blp")
	end
	vcbVectorA = CreateVector2D(0, 0)
	vcbVectorB = CreateVector2D(1, 1)
	self:SetTexCoordRange(vcbVectorA, vcbVectorB)
end
-- Acquire ticks
local function AcquireTicks(i)
	if PlayerCastingBarFrame.vcbTicks[i] then return PlayerCastingBarFrame.vcbTicks[i] end
	local pip = CreateFrame("Frame", nil, PlayerCastingBarFrame, "vcbCastbarPipTemplate")
	pip.BasePip:SetWidth(9)
	pip.BasePip:SetHeight(PlayerCastingBarFrame:GetHeight()-4)
	PlayerCastingBarFrame.vcbTicks[i] = pip
	return pip
end
-- Hide ticks
local function HideTicks()
	for i = 1, #PlayerCastingBarFrame.vcbTicks do
		PlayerCastingBarFrame.vcbTicks[i]:Hide()
	end
end
-- find ticks
local function FindTicks(arg3)
local ticks = 0
-- Essence Font, Spinning Crane Kick
	if arg3 == 191837 or arg3 == 101546 then
		ticks = 3
		return ticks
	end
-- Mind Flay, Insanity, Shifting Power, Crackling Jade Lightning, Fists of Fury, Tranquility, 
	if arg3 == 391403 or arg3 == 47540 or arg3 == 314791 or arg3 == 117952 or arg3 == 113656 or arg3 == 740  then
		ticks = 4
		return ticks
	end
-- Disintegrate
	if arg3 == 356995 then
		ticks = 4
		return ticks
	end
-- Void Torrent, Divine Hymn, Symbol of Hope, Arcane Missiles, Ray of Frost, Drain Life, Drain Soul, Health Funnel
	if arg3 == 263165 or arg3 == 64843 or arg3 == 64901 or arg3 == 5143 or arg3 == 205021 or arg3 == 234153 or arg3 == 198590 or arg3 == 217979 then
		ticks = 5
		return ticks
	end
-- Mind Flay
	if arg3 == 15407 then
		ticks = 6
		return ticks
	end
-- Soothing Mist
	if arg3 == 115175 then
		ticks = 8
		return ticks
	end
	return ticks
end
-- Place ticks
local function LayoutTicks(arg3)
	HideTicks()
	local pcts = FindTicks(arg3)
	if not pcts or pcts == 0 then return end

	local w = PlayerCastingBarFrame:GetWidth()
	local x = 0

	for i = 1, pcts do
		local pip = AcquireTicks(i)
		pip.BasePip:SetWidth(9)
		pip.BasePip:SetHeight(PlayerCastingBarFrame:GetHeight()-4)
		pip:ClearAllPoints()
		pip:SetPoint("CENTER", PlayerCastingBarFrame, "LEFT", x, 0)
		pip:Show()
		x = x + (w / pcts)
	end
end
-- =========================
-- extra texts
-- =========================
-- function for the texts --
local function Texts(var1)
	--[[for i = 9, 18, 1 do
		if VCBsettings.Player.Fonts.Style == "Normal "..i then
			var1:SetFontObject("vdw_NFshadow_"..i)
		end
	end]]
	var1:SetFontObject("GameFontHighlightSmall")
	var1:Hide()
end
-- creating the texts --
local textName = PlayerCastingBarFrame:CreateFontString(nil, "OVERLAY", nil)
local textCurrent = PlayerCastingBarFrame:CreateFontString(nil, "OVERLAY", nil)
local textBoth = PlayerCastingBarFrame:CreateFontString(nil, "OVERLAY", nil)
local textTotal = PlayerCastingBarFrame:CreateFontString(nil, "OVERLAY", nil)
-- =========================
-- interrupting spell
-- =========================
local function interruptingSepll()
	if VDW.PlayerClassID == 1 then --Warrior
		vcbInterruptSpell = 6552
		local spellInfo = C_Spell.GetSpellInfo(vcbInterruptSpell)
		VDW.VCB.InterruptSpell = spellInfo.name
	elseif VDW.PlayerClassID == 2 then --Paladin
		vcbInterruptSpell = 96231
		local spellInfo = C_Spell.GetSpellInfo(vcbInterruptSpell)
		VDW.VCB.InterruptSpell = spellInfo.name
	elseif VDW.PlayerClassID == 3 then --Hunter
		vcbInterruptSpellTable = {147362, 187707,}
	elseif VDW.PlayerClassID == 4 then --Rogue
		vcbInterruptSpell = 1766
		local spellInfo = C_Spell.GetSpellInfo(vcbInterruptSpell)
		VDW.VCB.InterruptSpell = spellInfo.name
	elseif VDW.PlayerClassID == 5 then --Priest
		vcbInterruptSpell = 15487
		local spellInfo = C_Spell.GetSpellInfo(vcbInterruptSpell)
		VDW.VCB.InterruptSpell = spellInfo.name
	elseif VDW.PlayerClassID == 6 then --Death Kight
		vcbInterruptSpell = 47528
		local spellInfo = C_Spell.GetSpellInfo(vcbInterruptSpell)
		VDW.VCB.InterruptSpell = spellInfo.name
	elseif VDW.PlayerClassID == 7 then --Shaman
		vcbInterruptSpell = 57994
		local spellInfo = C_Spell.GetSpellInfo(vcbInterruptSpell)
		VDW.VCB.InterruptSpell = spellInfo.name
	elseif VDW.PlayerClassID == 8 then --Mage
		vcbInterruptSpell = 2139
		local spellInfo = C_Spell.GetSpellInfo(vcbInterruptSpell)
		VDW.VCB.InterruptSpell = spellInfo.name
	elseif VDW.PlayerClassID == 9 then --Warlock
		vcbInterruptSpellTable = {19647, 251523, 132409, 119910, 89766, 171138,}
	elseif VDW.PlayerClassID == 10 then --Monk
		vcbInterruptSpell = 116705
		local spellInfo = C_Spell.GetSpellInfo(vcbInterruptSpell)
		VDW.VCB.InterruptSpell = spellInfo.name
	elseif VDW.PlayerClassID == 11 then --Druid
		vcbInterruptSpell = 106839
		local spellInfo = C_Spell.GetSpellInfo(vcbInterruptSpell)
		VDW.VCB.InterruptSpell = spellInfo.name
	elseif VDW.PlayerClassID == 12 then --Demon Hunter
		vcbInterruptSpell = 183752
		local spellInfo = C_Spell.GetSpellInfo(vcbInterruptSpell)
		VDW.VCB.InterruptSpell = spellInfo.name
	elseif VDW.PlayerClassID == 13 then --Evoker
		vcbInterruptSpell = 351338
		local spellInfo = C_Spell.GetSpellInfo(vcbInterruptSpell)
		VDW.VCB.InterruptSpell = spellInfo.name
	end
end
-- =========================
-- functions protect the options
-- =========================
local optionsTable = {
	{value = "Hide", text = G.OPTIONS_V_HIDE},
	{value = "Show", text = G.OPTIONS_V_SHOW},
	{value = "TopLeft", text = G.OPTIONS_P_TOPLEFT},
	{value = "Left", text = G.OPTIONS_P_LEFT},
	{value = "BottomLeft", text = G.OPTIONS_P_BOTTOMLEFT},
	{value = "Top", text = G.OPTIONS_P_TOP},
	{value = "Center", text = G.OPTIONS_P_CENTER},
	{value = "Bottom", text = G.OPTIONS_P_BOTTOM},
	{value = "TopRight", text = G.OPTIONS_P_TOPRIGHT},
	{value = "Right", text = G.OPTIONS_P_RIGHT},
	{value = "BottomRight", text = G.OPTIONS_P_BOTTOMRIGHT},
	{value = "Both", text = G.OPTIONS_P_BOTH},
	{value = "Default", text = G.OPTIONS_C_DEFAULT},
	{value = "Custom", text = G.OPTIONS_C_CUSTOM},
	{value = "Class", text = G.OPTIONS_C_CLASS},
	{value = "Faction", text = G.OPTIONS_C_FACTION},
	{value = "SpellsSchool", text = G.OPTIONS_C_SPELL},
	{value = "ClassIcon", text = G.OPTIONS_S_CLASS_ICON},
	{value = "HeroIcon", text = G.OPTIONS_S_HERO_ICON},
	{value = "FanctionIcon", text = G.OPTIONS_S_FACTION_ICON},
	{value = "Classic", text = G.OPTIONS_S_CLASSIC},
	{value = "Modern", text = G.OPTIONS_S_MODERN},
	{value = "DefaultBar", text = G.OPTIONS_S_DEFAULT_BAR},
	{value = "Banner", text = G.OPTIONS_S_BANNER},
	{value = "Runes", text = G.OPTIONS_S_RUNES},
	{value = "Ascending", text = G.OPTIONS_D_ASCENDING},
	{value = "Descending", text = G.OPTIONS_D_DESCENDING},
	{value = "Upward", text = G.OPTIONS_D_UPWARD},
	{value = "Downward", text = G.OPTIONS_D_DOWNWARD},
	{value = "Locked", text = G.OPTIONS_LS_LOCKED},
	{value = "Unlocked", text = G.OPTIONS_LS_UNLOCKED},
}
local function ProtectOptions()
	if VCBspecialSettings.Player.Ticks ~= true and VCBspecialSettings.Player.Ticks ~= false then
		if VCBspecialSettings.Player.Ticks.Style ~= G.OPTIONS_V_HIDE then VCBspecialSettings.Player.Ticks = true else VCBspecialSettings.Player.Ticks = false end
	end
	if VCBsettings.Player.LagBar.Visibility == G.OPTIONS_V_SHOW then
		VCBsettings.Player.LagBar.Visibility = true
	elseif VCBsettings.Player.LagBar.Visibility == G.OPTIONS_V_HIDE then
		VCBsettings.Player.LagBar.Visibility = false
	end
	if VCBsettings.Player.QueueBar.Visibility == G.OPTIONS_V_SHOW then
		VCBsettings.Player.QueueBar.Visibility = true
	elseif VCBsettings.Player.QueueBar.Visibility == G.OPTIONS_V_HIDE then
		VCBsettings.Player.QueueBar.Visibility = false
	end
	if VCBsettings.Player.CurrentTimeText.Sec == G.OPTIONS_V_SHOW then
		VCBsettings.Player.CurrentTimeText.Sec = true
	elseif VCBsettings.Player.CurrentTimeText.Sec == G.OPTIONS_V_HIDE then
		VCBsettings.Player.CurrentTimeText.Sec = false
	end
	if VCBsettings.Player.BothTimeText.Sec == G.OPTIONS_V_SHOW then
		VCBsettings.Player.BothTimeText.Sec = true
	elseif VCBsettings.Player.BothTimeText.Sec == G.OPTIONS_V_HIDE then
		VCBsettings.Player.BothTimeText.Sec = false
	end
	if VCBsettings.Player.TotalTimeText.Sec == G.OPTIONS_V_SHOW then
		VCBsettings.Player.TotalTimeText.Sec = true
	elseif VCBsettings.Player.TotalTimeText.Sec == G.OPTIONS_V_HIDE then
		VCBsettings.Player.TotalTimeText.Sec = false
	end
	for k, v in ipairs(optionsTable) do
		if VCBsettings.Player.Icon.Position == v.text then VCBsettings.Player.Icon.Position = v.value end
		if VCBsettings.Player.Shield.Position == v.text then VCBsettings.Player.Shield.Position = v.value end
		if VCBsettings.Player.BorderText.Position == v.text then VCBsettings.Player.BorderText.Position = v.value end
		if VCBsettings.Player.NameText.Position == v.text then VCBsettings.Player.NameText.Position = v.value end
		if VCBsettings.Player.CurrentTimeText.Position == v.text then VCBsettings.Player.CurrentTimeText.Position = v.value end
		if VCBsettings.Player.CurrentTimeText.Direction == v.text then VCBsettings.Player.CurrentTimeText.Direction = v.value end
		if VCBsettings.Player.BothTimeText.Position == v.text then VCBsettings.Player.BothTimeText.Position = v.value end
		if VCBsettings.Player.BothTimeText.Direction == v.text then VCBsettings.Player.BothTimeText.Direction = v.value end
		if VCBsettings.Player.TotalTimeText.Position == v.text then VCBsettings.Player.TotalTimeText.Position = v.value end
		if VCBsettings.Player.StatusBar.Color == v.text then VCBsettings.Player.StatusBar.Color = v.value end
		if VCBsettings.Player.StatusBar.Style == v.text then VCBsettings.Player.StatusBar.Style = v.value end
		if VCBsettings.Player.Border.Color == v.text then VCBsettings.Player.Border.Color = v.value end
		if VCBsettings.Player.Border.Style == v.text then VCBsettings.Player.Border.Style = v.value end
		if VCBsettings.Player.LagBar.Visibility == v.text then VCBsettings.Player.LagBar.Visibility = v.value end
		if VCBsettings.Player.GlobalCooldown.Position == v.text then VCBsettings.Player.GlobalCooldown.Position = v.value end
		if VCBsettings.Player.GlobalCooldown.Bar.Style == v.text then VCBsettings.Player.GlobalCooldown.Bar.Style = v.value end
		if VCBsettings.Player.GlobalCooldown.Bar.Color == v.text then VCBsettings.Player.GlobalCooldown.Bar.Color = v.value end
		if VCBsettings.Player.GlobalCooldown.Bar.BorderStyle == v.text then VCBsettings.Player.GlobalCooldown.Bar.BorderStyle = v.value end
		if VCBsettings.Player.GlobalCooldown.Bar.BorderColor == v.text then VCBsettings.Player.GlobalCooldown.Bar.BorderColor = v.value end
		if VCBsettings.Player.GlobalCooldown.Instant.Style == v.text then VCBsettings.Player.GlobalCooldown.Instant.Style = v.value end
		if VCBsettings.Player.GlobalCooldown.Instant.StastusStyle == v.text then VCBsettings.Player.GlobalCooldown.Instant.StastusStyle = v.value end
		if VCBsettings.Player.GlobalCooldown.Instant.StatusColor == v.text then VCBsettings.Player.GlobalCooldown.Instant.StatusColor = v.value end
		if VCBsettings.Player.GlobalCooldown.Instant.BorderStyle == v.text then VCBsettings.Player.GlobalCooldown.Instant.BorderStyle = v.value end
		if VCBsettings.Player.GlobalCooldown.Instant.BorderColor == v.text then VCBsettings.Player.GlobalCooldown.Instant.BorderColor = v.value end
		if VCBsettings.Player.GlobalCooldown.Instant.TextBorder.Position == v.text then VCBsettings.Player.GlobalCooldown.Instant.TextBorder.Position = v.value end
		if VCBsettings.Player.GlobalCooldown.Instant.Icon.Position == v.text then VCBsettings.Player.GlobalCooldown.Instant.Icon.Position = v.value end
		if VCBsettings.Player.GlobalCooldown.Instant.Name.Position == v.text then VCBsettings.Player.GlobalCooldown.Instant.Name.Position = v.value end
		if VCBsettings.Player.GlobalCooldown.Instant.RemainingTime.Position == v.text then VCBsettings.Player.GlobalCooldown.Instant.RemainingTime.Position = v.value end
		if VCBsettings.Player.Fonts.Color == v.text then VCBsettings.Player.Fonts.Color = v.value end
	end
end
-- =========================
-- functions OnUpdate and OnShow
-- =========================
-- icon position
local function iconPosition(self)
	print("iconPosition is not Working!")
end
-- shield position
local function shieldPosition(uninterruptible)
	print("shieldPosition is not Working!")
end
-- border text position
local function bordertextPosition()
	print("bordertextPosition is not Working!")
end
-- name position
local function namePosition(self)
	print("namePosition is not Working!")
end
-- current time position
local function currentPostion(self)
	print("currentPostion is not Working!")
end
-- both time position
local function bothPostion(self)
	print("bothPostion is not Working!")
end
-- total time position
local function totalPostion(self)
	print("totalPostion is not Working!")
end
-- current time update
local function currentUpdate(self)
	print("currentUpdate is not Working!")
end
-- both time update
local function bothUpdate(self)
	print("bothUpdate is not Working!")
end
-- total time update
local function totalUpdate(self)
	print("totalUpdate is not Working!")
end
-- status bar color
local function statusbarColor(self)
	print("statusbarColor is not Working!")
end
-- status bar style
local function statusbarStyle(self)
	print("statusbarStyle is not Working!")
end
-- border color
local function borderColor(self)
	print("borderColor is not Working!")
end
-- border style
local function borderStyle()
	print("borderStyle is not Working!")
end
-- =========================
-- checking position functions
-- =========================
-- check icon
function VDW.VCB.chkPlayerIconPosition()
	if PlayerCastingBarFrame.showShield then PlayerCastingBarFrame.showShield = false end
	if VCBsettings.Player.Icon.Position ==  "Hide" then
		function iconPosition(self)
			if iconSpellLeft:IsShown() then iconSpellLeft:Hide() end
			if iconSpellRight:IsShown() then iconSpellRight:Hide() end
		end
	elseif VCBsettings.Player.Icon.Position == "Left" then
		function iconPosition(self)
			if not iconSpellLeft:IsShown() then iconSpellLeft:Show() end
			if iconSpellRight:IsShown() then iconSpellRight:Hide() end
		end
	elseif VCBsettings.Player.Icon.Position == "Right" then
		function iconPosition(self)
			if iconSpellLeft:IsShown() then iconSpellLeft:Hide() end
			if not iconSpellRight:IsShown() then iconSpellRight:Show() end
		end
	elseif VCBsettings.Player.Icon.Position == "Both" then
		function iconPosition(self)
			if not iconSpellLeft:IsShown() then iconSpellLeft:Show() end
			if not iconSpellRight:IsShown() then iconSpellRight:Show() end
		end
	end
end
-- check shield
function VDW.VCB.chkPlayerShieldPosition()
	if VCBsettings.Player.Shield.Position == "Hide" then
		function shieldPosition(uninterruptible)
			shieldSpellLeft:SetAlpha(0)
			shieldSpellRight:SetAlpha(0)
		end
	elseif VCBsettings.Player.Shield.Position == "Left" then
		function shieldPosition(uninterruptible)
			shieldSpellLeft:SetAlphaFromBoolean(uninterruptible, 255, 0)
			shieldSpellRight:SetAlpha(0)
		end
	elseif VCBsettings.Player.Shield.Position == "Right" then
		function shieldPosition(uninterruptible)
			shieldSpellLeft:SetAlpha(0)
			shieldSpellRight:SetAlphaFromBoolean(uninterruptible, 255, 0)
		end
	elseif VCBsettings.Player.Shield.Position == "Both" then
		function shieldPosition(uninterruptible)
			shieldSpellLeft:SetAlphaFromBoolean(uninterruptible, 255, 0)
			shieldSpellRight:SetAlphaFromBoolean(uninterruptible, 255, 0)
		end
	end
end
-- check text border
function VDW.VCB.chkPlayerBorderTextPosition()
	if VCBsettings.Player.BorderText.Position == "Hide" then
		function bordertextPosition ()
			TextBorderTop:Hide()
			TextBorderBottom:Hide()
		end
	elseif VCBsettings.Player.BorderText.Position == "Top" then
		function bordertextPosition()
			TextBorderTop:Show()
			TextBorderTop:SetAlpha(0.38)
			TextBorderBottom:Hide()
		end
	elseif VCBsettings.Player.BorderText.Position == "Bottom" then
		function bordertextPosition()
			TextBorderTop:Hide()
			TextBorderBottom:Show()
			TextBorderBottom:SetAlpha(0.38)
		end
	elseif VCBsettings.Player.BorderText.Position == "Both" then
		function bordertextPosition()
			TextBorderTop:Show()
			TextBorderTop:SetAlpha(0.38)
			TextBorderBottom:Show()
			TextBorderBottom:SetAlpha(0.38)
		end
	end
end
-- check name text position
function VDW.VCB.chkNameTxtPlayer()
	if VCBsettings.Player.NameText.Position == "Hide" then
		function namePosition(self)
			if textName:IsShown() then textName:Hide() end
		end
	elseif VCBsettings.Player.NameText.Position == "TopLeft" then
		function namePosition(self)
			textName:ClearAllPoints()
			textName:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 4, 1)
			textName:SetJustifyH("LEFT")
			if not textName:IsShown() then textName:Show() end
		end
	elseif VCBsettings.Player.NameText.Position == "Left" then
		function namePosition(self)
			textName:ClearAllPoints()
			textName:SetPoint("LEFT", self, "LEFT", 4, 0)
			textName:SetJustifyH("LEFT")
			if not textName:IsShown() then textName:Show() end
		end
	elseif VCBsettings.Player.NameText.Position == "BottomLeft" then
		function namePosition(self)
			textName:ClearAllPoints()
			textName:SetPoint("TOPLEFT", self, "BOTTOMLEFT", 4, -1)
			textName:SetJustifyH("LEFT")
			if not textName:IsShown() then textName:Show() end
		end
	elseif VCBsettings.Player.NameText.Position == "Top" then
		function namePosition(self)
			textName:ClearAllPoints()
			textName:SetPoint("BOTTOM", self, "TOP", 0, 1)
			textName:SetJustifyH("CENTER")
			if not textName:IsShown() then textName:Show() end
		end
	elseif VCBsettings.Player.NameText.Position == "Center" then
		function namePosition(self)
			textName:ClearAllPoints()
			textName:SetPoint("CENTER", self, "CENTER", 0, 0)
			textName:SetJustifyH("CENTER")
			if not textName:IsShown() then textName:Show() end
		end
	elseif VCBsettings.Player.NameText.Position == "Bottom" then
		function namePosition(self)
			textName:ClearAllPoints()
			textName:SetPoint("TOP", self, "BOTTOM", 0, -1)
			textName:SetJustifyH("CENTER")
			if not textName:IsShown() then textName:Show() end
		end
	elseif VCBsettings.Player.NameText.Position == "TopRight" then
		function namePosition(self)
			textName:ClearAllPoints()
			textName:SetPoint("BOTTOMRIGHT", self, "TOPRIGHT", -4, 1)
			textName:SetJustifyH("RIGHT")
			if not textName:IsShown() then textName:Show() end
		end
	elseif VCBsettings.Player.NameText.Position == "Right" then
		function namePosition(self)
			textName:ClearAllPoints()
			textName:SetPoint("RIGHT", self, "RIGHT", -4, 0)
			textName:SetJustifyH("RIGHT")
			if not textName:IsShown() then textName:Show() end
		end
	elseif VCBsettings.Player.NameText.Position == "BottomRight" then
		function namePosition(self)
			textName:ClearAllPoints()
			textName:SetPoint("TOPRIGHT", self, "BOTTOMRIGHT", -4, -1)
			textName:SetJustifyH("RIGHT")
			if not textName:IsShown() then textName:Show() end
		end
	end
end
-- check current casting time text position
function VDW.VCB.chkCurrentTxtPlayer()
	if VCBsettings.Player.CurrentTimeText.Position == "Hide" then
		function currentPostion(self)
			if textCurrent:IsShown() then textCurrent:Hide() end
		end
	elseif VCBsettings.Player.CurrentTimeText.Position == "TopLeft" then
		function currentPostion(self)
			textCurrent:ClearAllPoints()
			textCurrent:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 4, 1)
			if not textCurrent:IsShown() then textCurrent:Show() end
		end
	elseif VCBsettings.Player.CurrentTimeText.Position == "Left" then
		function currentPostion(self)
			textCurrent:ClearAllPoints()
			textCurrent:SetPoint("LEFT", self, "LEFT", 4, 0)
			if not textCurrent:IsShown() then textCurrent:Show() end
		end
	elseif VCBsettings.Player.CurrentTimeText.Position == "BottomLeft" then
		function currentPostion(self)
			textCurrent:ClearAllPoints()
			textCurrent:SetPoint("TOPLEFT", self, "BOTTOMLEFT", 4, -1)
			if not textCurrent:IsShown() then textCurrent:Show() end
		end
	elseif VCBsettings.Player.CurrentTimeText.Position == "Top" then
		function currentPostion(self)
			textCurrent:ClearAllPoints()
			textCurrent:SetPoint("BOTTOM", self, "TOP", 0, 1)
			if not textCurrent:IsShown() then textCurrent:Show() end
		end
	elseif VCBsettings.Player.CurrentTimeText.Position == "Center" then
		function currentPostion(self)
			textCurrent:ClearAllPoints()
			textCurrent:SetPoint("CENTER", self, "CENTER", 0, 0)
			if not textCurrent:IsShown() then textCurrent:Show() end
		end
	elseif VCBsettings.Player.CurrentTimeText.Position == "Bottom" then
		function currentPostion(self)
			textCurrent:ClearAllPoints()
			textCurrent:SetPoint("TOP", self, "BOTTOM", 0, -1)
			if not textCurrent:IsShown() then textCurrent:Show() end
		end
	elseif VCBsettings.Player.CurrentTimeText.Position == "TopRight" then
		function currentPostion(self)
			textCurrent:ClearAllPoints()
			textCurrent:SetPoint("BOTTOMRIGHT", self, "TOPRIGHT", -4, 1)
			if not textCurrent:IsShown() then textCurrent:Show() end
		end
	elseif VCBsettings.Player.CurrentTimeText.Position == "Right" then
		function currentPostion(self)
			textCurrent:ClearAllPoints()
			textCurrent:SetPoint("RIGHT", self, "RIGHT", -4, 0)
			if not textCurrent:IsShown() then textCurrent:Show() end
		end
	elseif VCBsettings.Player.CurrentTimeText.Position == "BottomRight" then
		function currentPostion(self)
			textCurrent:ClearAllPoints()
			textCurrent:SetPoint("TOPRIGHT", self, "BOTTOMRIGHT", -4, -1)
			if not textCurrent:IsShown() then textCurrent:Show() end
		end
	end
end
-- check both casting time text position
function VDW.VCB.chkBothTxtPlayer()
	if VCBsettings.Player.BothTimeText.Position == "Hide" then
		function bothPostion(self)
			if textBoth:IsShown() then textBoth:Hide() end
		end
	elseif VCBsettings.Player.BothTimeText.Position == "TopLeft" then
		function bothPostion(self)
			textBoth:ClearAllPoints()
			textBoth:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 4, 1)
			if not textBoth:IsShown() then textBoth:Show() end
		end
	elseif VCBsettings.Player.BothTimeText.Position == "Left" then
		function bothPostion(self)
			textBoth:ClearAllPoints()
			textBoth:SetPoint("LEFT", self, "LEFT", 4, 0)
			if not textBoth:IsShown() then textBoth:Show() end
		end
	elseif VCBsettings.Player.BothTimeText.Position == "BottomLeft" then
		function bothPostion(self)
			textBoth:ClearAllPoints()
			textBoth:SetPoint("TOPLEFT", self, "BOTTOMLEFT", 4, -1)
			if not textBoth:IsShown() then textBoth:Show() end
		end
	elseif VCBsettings.Player.BothTimeText.Position == "Top" then
		function bothPostion(self)
			textBoth:ClearAllPoints()
			textBoth:SetPoint("BOTTOM", self, "TOP", 0, 1)
			if not textBoth:IsShown() then textBoth:Show() end
		end
	elseif VCBsettings.Player.BothTimeText.Position == "Center" then
		function bothPostion(self)
			textBoth:ClearAllPoints()
			textBoth:SetPoint("CENTER", self, "CENTER", 0, 0)
			if not textBoth:IsShown() then textBoth:Show() end
		end
	elseif VCBsettings.Player.BothTimeText.Position == "Bottom" then
		function bothPostion(self)
			textBoth:ClearAllPoints()
			textBoth:SetPoint("TOP", self, "BOTTOM", 0, -1)
			if not textBoth:IsShown() then textBoth:Show() end
		end
	elseif VCBsettings.Player.BothTimeText.Position == "TopRight" then
		function bothPostion(self)
			textBoth:ClearAllPoints()
			textBoth:SetPoint("BOTTOMRIGHT", self, "TOPRIGHT", -4, 1)
			if not textBoth:IsShown() then textBoth:Show() end
		end
	elseif VCBsettings.Player.BothTimeText.Position == "Right" then
		function bothPostion(self)
			textBoth:ClearAllPoints()
			textBoth:SetPoint("RIGHT", self, "RIGHT", -4, 0)
			if not textBoth:IsShown() then textBoth:Show() end
		end
	elseif VCBsettings.Player.BothTimeText.Position == "BottomRight" then
		function bothPostion(self)
			textBoth:ClearAllPoints()
			textBoth:SetPoint("TOPRIGHT", self, "BOTTOMRIGHT", -4, -1)
			if not textBoth:IsShown() then textBoth:Show() end
		end
	end
end
-- check total casting time text position
function VDW.VCB.chkTotalTxtPlayer()
	if VCBsettings.Player.TotalTimeText.Position == "Hide" then
		function totalPostion(self)
			if textTotal:IsShown() then textTotal:Hide() end
		end
	elseif VCBsettings.Player.TotalTimeText.Position == "TopLeft" then
		function totalPostion(self)
			textTotal:ClearAllPoints()
			textTotal:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 4, 1)
			if not textTotal:IsShown() then textTotal:Show() end
		end
	elseif VCBsettings.Player.TotalTimeText.Position == "Left" then
		function totalPostion(self)
			textTotal:ClearAllPoints()
			textTotal:SetPoint("LEFT", self, "LEFT", 4, 0)
			if not textTotal:IsShown() then textTotal:Show() end
		end
	elseif VCBsettings.Player.TotalTimeText.Position == "BottomLeft" then
		function totalPostion(self)
			textTotal:ClearAllPoints()
			textTotal:SetPoint("TOPLEFT", self, "BOTTOMLEFT", 4, -1)
			if not textTotal:IsShown() then textTotal:Show() end
		end
	elseif VCBsettings.Player.TotalTimeText.Position == "Top" then
		function totalPostion(self)
			textTotal:ClearAllPoints()
			textTotal:SetPoint("BOTTOM", self, "TOP", 0, 1)
			if not textTotal:IsShown() then textTotal:Show() end
		end
	elseif VCBsettings.Player.TotalTimeText.Position == "Center" then
		function totalPostion(self)
			textTotal:ClearAllPoints()
			textTotal:SetPoint("CENTER", self, "CENTER", 0, 0)
			if not textTotal:IsShown() then textTotal:Show() end
		end
	elseif VCBsettings.Player.TotalTimeText.Position == "Bottom" then
		function totalPostion(self)
			textTotal:ClearAllPoints()
			textTotal:SetPoint("TOP", self, "BOTTOM", 0, -1)
			if not textTotal:IsShown() then textTotal:Show() end
		end
	elseif VCBsettings.Player.TotalTimeText.Position == "TopRight" then
		function totalPostion(self)
			textTotal:ClearAllPoints()
			textTotal:SetPoint("BOTTOMRIGHT", self, "TOPRIGHT", -4, 1)
			if not textTotal:IsShown() then textTotal:Show() end
		end
	elseif VCBsettings.Player.TotalTimeText.Position == "Right" then
		function totalPostion(self)
			textTotal:ClearAllPoints()
			textTotal:SetPoint("RIGHT", self, "RIGHT", -4, 0)
			if not textTotal:IsShown() then textTotal:Show() end
		end
	elseif VCBsettings.Player.TotalTimeText.Position == "BottomRight" then
		function totalPostion(self)
			textTotal:ClearAllPoints()
			textTotal:SetPoint("TOPRIGHT", self, "BOTTOMRIGHT", -4, -1)
			if not textTotal:IsShown() then textTotal:Show() end
		end
	end
end
-- =========================
-- checking update functions
-- =========================
-- check current casting time update
function VDW.VCB.chkCurrentUpdPlayer()
	if VCBsettings.Player.CurrentTimeText.Position ~= "Hide" then
		if not VCBsettings.Player.CurrentTimeText.Sec then
			if VCBsettings.Player.CurrentTimeText.Decimals == "0" then
				if VCBsettings.Player.CurrentTimeText.Direction == "Ascending" then
					function currentUpdate(self)
						textCurrent:SetText(string.format("%.0f", Duration:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Player.CurrentTimeText.Direction == "Descending" then
					function currentUpdate(self)
						textCurrent:SetText(string.format("%.0f", Duration:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Player.CurrentTimeText.Direction == "Both" then
					function currentUpdate(self)
						if castBar == "Cast" or castBar == "Empower" then
							textCurrent:SetText(string.format("%.0f", Duration:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
						elseif castBar == "Channel" then
							textCurrent:SetText(string.format("%.0f", Duration:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			elseif VCBsettings.Player.CurrentTimeText.Decimals == "1" then
				if VCBsettings.Player.CurrentTimeText.Direction == "Ascending" then
					function currentUpdate(self)
						textCurrent:SetText(string.format("%.1f", Duration:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Player.CurrentTimeText.Direction == "Descending" then
					function currentUpdate(self)
						textCurrent:SetText(string.format("%.1f", Duration:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Player.CurrentTimeText.Direction == "Both" then
					function currentUpdate(self)
						if castBar == "Cast" or castBar == "Empower" then
							textCurrent:SetText(string.format("%.1f", Duration:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
						elseif castBar == "Channel" then
							textCurrent:SetText(string.format("%.1f", Duration:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			elseif VCBsettings.Player.CurrentTimeText.Decimals == "2" then
				if VCBsettings.Player.CurrentTimeText.Direction == "Ascending" then
					function currentUpdate(self)
						textCurrent:SetText(string.format("%.2f", Duration:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Player.CurrentTimeText.Direction == "Descending" then
					function currentUpdate(self)
						textCurrent:SetText(string.format("%.2f", Duration:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Player.CurrentTimeText.Direction == "Both" then
					function currentUpdate(self)
						if castBar == "Cast" or castBar == "Empower" then
							textCurrent:SetText(string.format("%.2f", Duration:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
						elseif castBar == "Channel" then
							textCurrent:SetText(string.format("%.2f", Duration:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			elseif VCBsettings.Player.CurrentTimeText.Decimals == "3" then
				if VCBsettings.Player.CurrentTimeText.Direction == "Ascending" then
					function currentUpdate(self)
						textCurrent:SetText(string.format("%.3f", Duration:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Player.CurrentTimeText.Direction == "Descending" then
					function currentUpdate(self)
						textCurrent:SetText(string.format("%.3f", Duration:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Player.CurrentTimeText.Direction == "Both" then
					function currentUpdate(self)
						if castBar == "Cast" or castBar == "Empower" then
							textCurrent:SetText(string.format("%.3f", Duration:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
						elseif castBar == "Channel" then
							textCurrent:SetText(string.format("%.3f", Duration:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			end
		elseif VCBsettings.Player.CurrentTimeText.Sec then
			if VCBsettings.Player.CurrentTimeText.Decimals == "0" then
				if VCBsettings.Player.CurrentTimeText.Direction == "Ascending" then
					function currentUpdate(self)
						textCurrent:SetText(string.format("%.0f Sec", Duration:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Player.CurrentTimeText.Direction == "Descending" then
					function currentUpdate(self)
						textCurrent:SetText(string.format("%.0f Sec", Duration:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Player.CurrentTimeText.Direction == "Both" then
					function currentUpdate(self)
						if castBar == "Cast" or castBar == "Empower" then
							textCurrent:SetText(string.format("%.0f Sec", Duration:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
						elseif castBar == "Channel" then
							textCurrent:SetText(string.format("%.0f Sec", Duration:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			elseif VCBsettings.Player.CurrentTimeText.Decimals == "1" then
				if VCBsettings.Player.CurrentTimeText.Direction == "Ascending" then
					function currentUpdate(self)
						textCurrent:SetText(string.format("%.1f Sec", Duration:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Player.CurrentTimeText.Direction == "Descending" then
					function currentUpdate(self)
						textCurrent:SetText(string.format("%.1f Sec", Duration:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Player.CurrentTimeText.Direction == "Both" then
					function currentUpdate(self)
						if castBar == "Cast" or castBar == "Empower" then
							textCurrent:SetText(string.format("%.1f Sec", Duration:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
						elseif castBar == "Channel" then
							textCurrent:SetText(string.format("%.1f Sec", Duration:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			elseif VCBsettings.Player.CurrentTimeText.Decimals == "2" then
				if VCBsettings.Player.CurrentTimeText.Direction == "Ascending" then
					function currentUpdate(self)
						textCurrent:SetText(string.format("%.2f Sec", Duration:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Player.CurrentTimeText.Direction == "Descending" then
					function currentUpdate(self)
						textCurrent:SetText(string.format("%.2f Sec", Duration:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Player.CurrentTimeText.Direction == "Both" then
					function currentUpdate(self)
						if castBar == "Cast" or castBar == "Empower" then
							textCurrent:SetText(string.format("%.2f Sec", Duration:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
						elseif castBar == "Channel" then
							textCurrent:SetText(string.format("%.2f Sec", Duration:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			elseif VCBsettings.Player.CurrentTimeText.Decimals == "3" then
				if VCBsettings.Player.CurrentTimeText.Direction == "Ascending" then
					function currentUpdate(self)
						textCurrent:SetText(string.format("%.3f Sec", Duration:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Player.CurrentTimeText.Direction == "Descending" then
					function currentUpdate(self)
						textCurrent:SetText(string.format("%.3f Sec", Duration:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Player.CurrentTimeText.Direction == "Both" then
					function currentUpdate(self)
						if castBar == "Cast" or castBar == "Empower" then
							textCurrent:SetText(string.format("%.3f Sec", Duration:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
						elseif castBar == "Channel" then
							textCurrent:SetText(string.format("%.3f Sec", Duration:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			end
		end
	elseif VCBsettings.Player.CurrentTimeText.Position == "Hide" then
		function currentUpdate(self)
			return
		end
	end
end
-- check both casting time update
function VDW.VCB.chkBothUpdPlayer()
	if VCBsettings.Player.BothTimeText.Position ~= "Hide" then
		if not VCBsettings.Player.BothTimeText.Sec then
			if VCBsettings.Player.BothTimeText.Decimals == "0" then
				if VCBsettings.Player.BothTimeText.Direction == "Ascending" then
					function bothUpdate(self)
						textBoth:SetText(string.format("%.0f / %.0f", Duration:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Player.BothTimeText.Direction == "Descending" then
					function bothUpdate(self)
						textBoth:SetText(string.format("%.0f / %.0f", Duration:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Player.BothTimeText.Direction == "Both" then
					function bothUpdate(self)
						if castBar == "Cast" or castBar == "Empower" then
							textBoth:SetText(string.format("%.0f / %.0f", Duration:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						elseif castBar == "Channel" then
							textBoth:SetText(string.format("%.0f / %.0f", Duration:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			elseif VCBsettings.Player.BothTimeText.Decimals == "1" then
				if VCBsettings.Player.BothTimeText.Direction == "Ascending" then
					function bothUpdate(self)
						textBoth:SetText(string.format("%.1f / %.1f", Duration:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Player.BothTimeText.Direction == "Descending" then
					function bothUpdate(self)
						textBoth:SetText(string.format("%.1f / %.1f", Duration:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Player.BothTimeText.Direction == "Both" then
					function bothUpdate(self)
						if castBar == "Cast" or castBar == "Empower" then
							textBoth:SetText(string.format("%.1f / %.1f", Duration:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						elseif castBar == "Channel" then
							textBoth:SetText(string.format("%.1f / %.1f", Duration:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			elseif VCBsettings.Player.BothTimeText.Decimals == "2" then
				if VCBsettings.Player.BothTimeText.Direction == "Ascending" then
					function bothUpdate(self)
						textBoth:SetText(string.format("%.2f / %.2f", Duration:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Player.BothTimeText.Direction == "Descending" then
					function bothUpdate(self)
						textBoth:SetText(string.format("%.2f / %.2f", Duration:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Player.BothTimeText.Direction == "Both" then
					function bothUpdate(self)
						if castBar == "Cast" or castBar == "Empower" then
							textBoth:SetText(string.format("%.2f / %.2f", Duration:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						elseif castBar == "Channel" then
							textBoth:SetText(string.format("%.2f / %.2f", Duration:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			elseif VCBsettings.Player.BothTimeText.Decimals == "3" then
				if VCBsettings.Player.BothTimeText.Direction == "Ascending" then
					function bothUpdate(self)
						textBoth:SetText(string.format("%.3f / %.3f", Duration:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Player.BothTimeText.Direction == "Descending" then
					function bothUpdate(self)
						textBoth:SetText(string.format("%.3f / %.3f", Duration:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Player.BothTimeText.Direction == "Both" then
					function bothUpdate(self)
						if castBar == "Cast" or castBar == "Empower" then
							textBoth:SetText(string.format("%.3f", Duration:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						elseif castBar == "Channel" then
							textBoth:SetText(string.format("%.3f / %.3f", Duration:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			end
		elseif VCBsettings.Player.BothTimeText.Sec then
			if VCBsettings.Player.BothTimeText.Decimals == "0" then
				if VCBsettings.Player.BothTimeText.Direction == "Ascending" then
					function bothUpdate(self)
						textBoth:SetText(string.format("%.0f / %.0f Sec", Duration:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Player.BothTimeText.Direction == "Descending" then
					function bothUpdate(self)
						textBoth:SetText(string.format("%.0f / %.0f Sec", Duration:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Player.BothTimeText.Direction == "Both" then
					function bothUpdate(self)
						if castBar == "Cast" or castBar == "Empower" then
							textBoth:SetText(string.format("%.0f / %.0f Sec", Duration:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						elseif castBar == "Channel" then
							textBoth:SetText(string.format("%.0f / %.0f Sec", Duration:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			elseif VCBsettings.Player.BothTimeText.Decimals == "1" then
				if VCBsettings.Player.BothTimeText.Direction == "Ascending" then
					function bothUpdate(self)
						textBoth:SetText(string.format("%.1f / %.1f Sec", Duration:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Player.BothTimeText.Direction == "Descending" then
					function bothUpdate(self)
						textBoth:SetText(string.format("%.1f / %.1f Sec", Duration:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Player.BothTimeText.Direction == "Both" then
					function bothUpdate(self)
						if castBar == "Cast" or castBar == "Empower" then
							textBoth:SetText(string.format("%.1f / %.1f Sec", Duration:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						elseif castBar == "Channel" then
							textBoth:SetText(string.format("%.1f / %.1f Sec", Duration:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			elseif VCBsettings.Player.BothTimeText.Decimals == "2" then
				if VCBsettings.Player.BothTimeText.Direction == "Ascending" then
					function bothUpdate(self)
						textBoth:SetText(string.format("%.2f / %.2f Sec", Duration:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Player.BothTimeText.Direction == "Descending" then
					function bothUpdate(self)
						textBoth:SetText(string.format("%.2f / %.2f Sec", Duration:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Player.BothTimeText.Direction == "Both" then
					function bothUpdate(self)
						if castBar == "Cast" or castBar == "Empower" then
							textBoth:SetText(string.format("%.2f / %.2f Sec", Duration:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						elseif castBar == "Channel" then
							textBoth:SetText(string.format("%.2f / %.2f Sec", Duration:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			elseif VCBsettings.Player.BothTimeText.Decimals == "3" then
				if VCBsettings.Player.BothTimeText.Direction == "Ascending" then
					function bothUpdate(self)
						textBoth:SetText(string.format("%.3f / %.3f Sec", Duration:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Player.BothTimeText.Direction == "Descending" then
					function bothUpdate(self)
						textBoth:SetText(string.format("%.3f / %.3f Sec", Duration:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Player.BothTimeText.Direction == "Both" then
					function bothUpdate(self)
						if castBar == "Cast" or castBar == "Empower" then
							textBoth:SetText(string.format("%.3f / %.3f Sec", Duration:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						elseif castBar == "Channel" then
							textBoth:SetText(string.format("%.3f / %.3f Sec", Duration:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			end
		end
	elseif VCBsettings.Player.BothTimeText.Position == "Hide" then
		function bothUpdate(self)
			return
		end
	end
end
-- check both casting time update
function VDW.VCB.chkTotalUpdPlayer()
	if VCBsettings.Player.TotalTimeText.Position ~= "Hide" then
		if not VCBsettings.Player.TotalTimeText.Sec then
			if VCBsettings.Player.TotalTimeText.Decimals == "0" then
				function totalUpdate(self)
					textTotal:SetFormattedText("%.0f", Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime))
				end
			elseif VCBsettings.Player.TotalTimeText.Decimals == "1" then
				function totalUpdate(self)
					textTotal:SetFormattedText("%.1f", Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime))
				end
			elseif VCBsettings.Player.TotalTimeText.Decimals == "2" then
				function totalUpdate(self)
					textTotal:SetFormattedText("%.2f", Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime))
				end
			elseif VCBsettings.Player.TotalTimeText.Decimals == "3" then
				function totalUpdate(self)
					textTotal:SetFormattedText("%.3f", Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime))
				end
			end
		elseif VCBsettings.Player.TotalTimeText.Sec then
			if VCBsettings.Player.TotalTimeText.Decimals == "0" then
				function totalUpdate(self)
					textTotal:SetFormattedText("%.0f sec", Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime))
				end
			elseif VCBsettings.Player.TotalTimeText.Decimals == "1" then
				function totalUpdate(self)
					textTotal:SetFormattedText("%.1f sec", Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime))
				end
			elseif VCBsettings.Player.TotalTimeText.Decimals == "2" then
				function totalUpdate(self)
					textTotal:SetFormattedText("%.2f sec", Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime))
				end
			elseif VCBsettings.Player.TotalTimeText.Decimals == "3" then
				function totalUpdate(self)
					textTotal:SetFormattedText("%.3f sec", Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime))
				end
			end
		end
	elseif VCBsettings.Player.TotalTimeText.Position == "Hide" then
		function totalUpdate(self)
			return
		end
	end
end
-- =========================
-- checking color & style functions
-- =========================
-- check status bar color
function VDW.VCB.chkStatusColorPlayer()
	if VCBsettings.Player.StatusBar.Color == "Default" then
		function statusbarColor(self)
			self:SetStatusBarDesaturated(false)
			self:SetStatusBarColor(1, 1, 1, 1)
			if VCBsettings.Player.StatusBar.Style == "Jailer" then
				self.Spark:SetDesaturated(true)
				self.Spark:SetVertexColor(jailerColor:GetRGB())
				self.ChannelShadow:SetDesaturated(true)
				self.ChannelShadow:SetVertexColor(jailerColor:GetRGB())
				self.StandardGlow:SetDesaturated(true)
				self.StandardGlow:SetVertexColor(jailerColor:GetRGB())
				self.Flash:SetDesaturated(true)
				self.Flash:SetVertexColor(jailerColor:GetRGB())
			else
				self.Spark:SetDesaturated(false)
				self.Spark:SetVertexColor(1, 1, 1, 1)
				self.ChannelShadow:SetDesaturated(false)
				self.ChannelShadow:SetVertexColor(1, 1, 1, 1)
				self.StandardGlow:SetDesaturated(false)
				self.StandardGlow:SetVertexColor(1, 1, 1, 1)
				self.Flash:SetDesaturated(false)
				self.Flash:SetVertexColor(1, 1, 1, 1)
			end
		end
	elseif VCBsettings.Player.StatusBar.Color == "Faction" then
		function statusbarColor(self)
			self:SetStatusBarDesaturated(true)
			self:SetStatusBarColor(VDW.PlayerFactionColor:GetRGB())
			self.Spark:SetDesaturated(true)
			self.Spark:SetVertexColor(VDW.PlayerFactionColor:GetRGB())
			self.ChannelShadow:SetDesaturated(true)
			self.ChannelShadow:SetVertexColor(VDW.PlayerFactionColor:GetRGB())
			self.StandardGlow:SetDesaturated(true)
			self.StandardGlow:SetVertexColor(VDW.PlayerFactionColor:GetRGB())
			self.Flash:SetDesaturated(true)
			self.Flash:SetVertexColor(VDW.PlayerFactionColor:GetRGB())
		end
	elseif VCBsettings.Player.StatusBar.Color == "Class" then
		function statusbarColor(self)
			self:SetStatusBarDesaturated(true)
			self:SetStatusBarColor(VDW.PlayerClassColor:GetRGB())
			self.Spark:SetDesaturated(true)
			self.Spark:SetVertexColor(VDW.PlayerClassColor:GetRGB())
			self.ChannelShadow:SetDesaturated(true)
			self.ChannelShadow:SetVertexColor(VDW.PlayerClassColor:GetRGB())
			self.StandardGlow:SetDesaturated(true)
			self.StandardGlow:SetVertexColor(VDW.PlayerClassColor:GetRGB())
			self.Flash:SetDesaturated(true)
			self.Flash:SetVertexColor(VDW.PlayerClassColor:GetRGB())
		end
	elseif VCBsettings.Player.StatusBar.Color == "SpellsSchool" then
		if VDW.PlayerClassID == 1 then
			vcbClass = VDW.VCB.SpellSchool.Warrior
		elseif VDW.PlayerClassID == 2 then
			vcbClass = VDW.VCB.SpellSchool.Paladin
		elseif VDW.PlayerClassID == 3 then
			vcbClass = VDW.VCB.SpellSchool.Hunter
		elseif VDW.PlayerClassID == 4 then
			vcbClass = VDW.VCB.SpellSchool.Rogue
		elseif VDW.PlayerClassID == 5 then
			vcbClass = VDW.VCB.SpellSchool.Priest
		elseif VDW.PlayerClassID == 6 then
			vcbClass = VDW.VCB.SpellSchool.DeathKight
		elseif VDW.PlayerClassID == 7 then
			vcbClass = VDW.VCB.SpellSchool.Shaman
		elseif VDW.PlayerClassID == 8 then
			vcbClass = VDW.VCB.SpellSchool.Mage
		elseif VDW.PlayerClassID == 9 then
			vcbClass = VDW.VCB.SpellSchool.Warlock
		elseif VDW.PlayerClassID == 10 then
			vcbClass = VDW.VCB.SpellSchool.Monk
		elseif VDW.PlayerClassID == 11 then
			vcbClass = VDW.VCB.SpellSchool.Druid
		elseif VDW.PlayerClassID == 12 then
			vcbClass = VDW.VCB.SpellSchool.DemonHunter
		elseif VDW.PlayerClassID == 13 then
			vcbClass = VDW.VCB.SpellSchool.Evoker
		end
		function statusbarColor(self)
			self:SetStatusBarDesaturated(true)
			self.Spark:SetDesaturated(true)
			self.ChannelShadow:SetDesaturated(true)
			self.StandardGlow:SetDesaturated(true)
			self.Flash:SetDesaturated(true)
			self:SetStatusBarColor(VDW.VCB[vcbSchool.."Color"]:GetRGB())
			self.Spark:SetVertexColor(VDW.VCB[vcbSchool.."Color"]:GetRGB())
			self.ChannelShadow:SetVertexColor(VDW.VCB[vcbSchool.."Color"]:GetRGB())
			self.StandardGlow:SetVertexColor(VDW.VCB[vcbSchool.."Color"]:GetRGB())
			self.Flash:SetVertexColor(VDW.VCB[vcbSchool.."Color"]:GetRGB())
		end
	end
end
local function helpingSchoolColor(arg3)
	vcbSchool = "Default"
	for k, v in pairs (vcbClass) do
		for i, a in pairs (v) do
			if a == arg3 then
				vcbSchool = k 
				vcbColor = true
			end
		end
	end
	if not vcbColor then
		for k, v in pairs (VDW.VCB.Profession) do
			for i, a in pairs (v) do
				if a == arg3 then
					vcbSchool = k 
					vcbColor = true
				end
			end
		end
	end
	if not vcbColor then
		for k, v in pairs (VDW.VCB.Hearthstone) do
			if v == arg3 then
				vcbSchool = k 
				vcbColor = true
			end
		end
	end
	local mountID = C_MountJournal.GetMountFromSpell(arg3)
	if mountID then vcbSchool = "Default" end
end
-- bar status style
function VDW.VCB.chkStatusStylePlayer()
	if VCBsettings.Player.StatusBar.Style == "Default" then
		function statusbarStyle(self)
			return
		end
	elseif VCBsettings.Player.StatusBar.Style == "Jailer" then
		function statusbarStyle(self)
			self:SetStatusBarTexture("jailerstower-scorebar-fill-onfire")
		end
	end
end
-- check border bar color
function VDW.VCB.chkBorderColorPlayer()
if VCBsettings.Player.Border.Color == "Default" then
		function borderColor(self)
			self.Background:SetDesaturated(false)
			self.Border:SetDesaturated(false)
			self.Background:SetVertexColor(1, 1, 1)
			self.Border:SetVertexColor(1, 1, 1)
		end
	elseif VCBsettings.Player.Border.Color == "Faction" then
		function borderColor(self)
			self.Background:SetDesaturated(true)
			self.Border:SetDesaturated(true)
			self.Background:SetVertexColor(VDW.PlayerFactionColor:GetRGB())
			self.Border:SetVertexColor(VDW.PlayerFactionColor:GetRGB())
		end
	elseif VCBsettings.Player.Border.Color == "Class" then
		function borderColor(self)
			self.Background:SetDesaturated(true)
			self.Border:SetDesaturated(true)
			self.Background:SetVertexColor(VDW.PlayerClassColor:GetRGB())
			self.Border:SetVertexColor(VDW.PlayerClassColor:GetRGB())
		end
	end
end
-- check border bar style
function VDW.VCB.chkBorderStylePlayer()
	if VCBsettings.Player.Border.Style == "Default" then
		function borderStyle(self)
			return
		end
	elseif VCBsettings.Player.Border.Style == "Jailer" then
		function borderStyle(self)
			self.Border:SetAtlas("jailerstower-scenario-TitleBG")
			self.Border:ClearAllPoints()
			self.Border:SetPoint("TOPLEFT", self, "TOPLEFT", 0, 12)
			self.Border:SetPoint("BOTTOMRIGHT", self, "BOTTOMRIGHT", 0, -10)
			self.Background:SetAtlas("jailerstower-scorebar-bgright-onfire")
			self.Background:SetDesaturated(true)
		end
	end
end
-- call back the defaul color of status bar
local function defaultColor(self)
	self:SetStatusBarDesaturated(false)
	self:SetStatusBarColor(1, 1, 1)
	self.Background:SetDesaturated(false)
	self.Border:SetDesaturated(false)
	self.Background:SetVertexColor(1, 1, 1)
	self.Border:SetVertexColor(1, 1, 1)
	self.Spark:SetDesaturated(false)
	self.Spark:SetVertexColor(1, 1, 1)
	self.ChannelShadow:SetDesaturated(false)
	self.ChannelShadow:SetVertexColor(1, 1, 1)
	self.StandardGlow:SetDesaturated(false)
	self.StandardGlow:SetVertexColor(1, 1, 1)
	self.Flash:SetDesaturated(false)
	self.Flash:SetVertexColor(1, 1, 1)
end
-- =========================
-- Latency Bar & SpellQueue Bar functions
-- =========================
-- Player Casting Latency Bar
local function PlayerCastLagBar(arg3, tradeSkill)
	lagBarWidth = 0
	VCBLagCastBar:Hide()
	VCBLagChannelBar:Hide()
	if tradeSkill then return else
		local playerSpell1 = IsSpellKnownOrOverridesKnown(arg3)
		local playerSpell2 = IsPlayerSpell(arg3)
		if (playerSpell1 or playerSpell2) and VCBsettings.Player.LagBar.Visibility then
			lagEnd = GetTime()
			lagTotal = (lagEnd - lagStart)
			statusMin, statusMax = PlayerCastingBarFrame:GetMinMaxValues()
			lagWidth = lagTotal / (statusMax - statusMin)
			lagBarWidth = PlayerCastingBarFrame:GetWidth() * lagWidth
			if lagBarWidth == 0 then
				VCBLagCastBar:Hide()
			else
				VCBLagCastBar:ClearAllPoints()
				VCBLagCastBar:SetPoint("RIGHT", PlayerCastingBarFrame, "RIGHT", 0, 0)
				VCBLagCastBar:SetWidth(lagBarWidth)
				VCBLagCastBar:Show()
			end
		end
	end
end
-- Player Channeling Latency Bar
local function PlayerChannelLagBar(arg3, tradeSkill)
	lagBarWidth = 0
	VCBLagCastBar:Hide()
	VCBLagChannelBar:Hide()
	if tradeSkill then return else
		local playerSpell1 = IsSpellKnownOrOverridesKnown(arg3)
		local playerSpell2 = IsPlayerSpell(arg3)
		if (playerSpell1 or playerSpell2) and VCBsettings.Player.LagBar.Visibility then
			lagEnd = GetTime()
			lagTotal = (lagEnd - lagStart)
			statusMin, statusMax = PlayerCastingBarFrame:GetMinMaxValues()
			lagWidth = lagTotal / (statusMax - statusMin)
			lagBarWidth = PlayerCastingBarFrame:GetWidth() * lagWidth
			if lagBarWidth == 0 then
				VCBLagChannelBar:Hide()
			else
				VCBLagChannelBar:ClearAllPoints()
				VCBLagChannelBar:SetPoint("LEFT", PlayerCastingBarFrame, "LEFT", 0, 0)
				VCBLagChannelBar:SetWidth(lagBarWidth)
				VCBLagChannelBar:Show()
			end
		end
	end
end
-- Player Casting SpellQueue Bar --
local function PlayerCastSpellQueueBar(arg3, tradeSkill)
	VCBSpellQueueCastBar:Hide()
	VCBSpellQueueChannelBar:Hide()
		if tradeSkill then return else
		local playerSpell1 = IsSpellKnownOrOverridesKnown(arg3)
		local playerSpell2 = IsPlayerSpell(arg3)
		if (playerSpell1 or playerSpell2) and VCBsettings.Player.QueueBar.Visibility then
			statusMin, statusMax = PlayerCastingBarFrame:GetMinMaxValues()
			local totalCastTime = statusMax - statusMin
			local spellQueueWindow = math.min(GetSpellQueueWindow() / 1000 / totalCastTime, 1)
			local spellQueueWidth = (PlayerCastingBarFrame:GetWidth() * spellQueueWindow) - lagBarWidth
			VCBSpellQueueCastBar:ClearAllPoints()
			VCBSpellQueueCastBar:SetPoint("RIGHT", PlayerCastingBarFrame, "RIGHT", -lagBarWidth, 0)
			VCBSpellQueueCastBar:SetWidth(spellQueueWidth)
			VCBSpellQueueCastBar:Show()
		end
	end
end
-- Player Channeling SpellQueue Bar --
local function PlayerChannelSpellQueueBar(arg3, tradeSkill)
	VCBSpellQueueCastBar:Hide()
	VCBSpellQueueChannelBar:Hide()
	if tradeSkill then return else
		local playerSpell1 = IsSpellKnownOrOverridesKnown(arg3)
		local playerSpell2 = IsPlayerSpell(arg3)
		if (playerSpell1 or playerSpell2) and VCBsettings.Player.QueueBar.Visibility then
			statusMin, statusMax = PlayerCastingBarFrame:GetMinMaxValues()
			local totalCastTime = statusMax - statusMin
			local spellQueueWindow = math.min(GetSpellQueueWindow() / 1000 / totalCastTime, 1)
			local spellQueueWidth = (PlayerCastingBarFrame:GetWidth() * spellQueueWindow) - lagBarWidth
			VCBSpellQueueChannelBar:ClearAllPoints()
			VCBSpellQueueChannelBar:SetPoint("LEFT", PlayerCastingBarFrame, "LEFT", lagBarWidth, 0)
			VCBSpellQueueChannelBar:SetWidth(spellQueueWidth)
			VCBSpellQueueChannelBar:Show()
		end
	end
end
-- Global Cooldown
-- check icon
local function chkIcon()
	vcbGlobalCooldown.Icon:SetScript("OnUpdate", function(self)
		return nil
	end)
	vcbGlobalCooldown.Icon:SetScript("OnCooldownDone", function(self)
		return nil
	end)
	if VCBsettings.Player.GlobalCooldown.Icon.Style == "ClassSquare" then
		ClassIconSquare(vcbGlobalCooldown.Icon)
	elseif VCBsettings.Player.GlobalCooldown.Icon.Style == "ClassRound" then
		ClassIconRound(vcbGlobalCooldown.Icon)
	elseif VCBsettings.Player.GlobalCooldown.Icon.Style == "Hero" then
		HeroIcon(vcbGlobalCooldown.Icon)
	elseif VCBsettings.Player.GlobalCooldown.Icon.Style == "FactionRound" then
		FactionIconRound(vcbGlobalCooldown.Icon)
	elseif VCBsettings.Player.GlobalCooldown.Icon.Style == "FactionOld" then
		FactionIconOld(vcbGlobalCooldown.Icon)
	elseif VCBsettings.Player.GlobalCooldown.Icon.Style == "FactionNew" then
		FactionIconNew(vcbGlobalCooldown.Icon)
	end
end
-- check bar
local function chkBar()
	vcbGlobalCooldown.Icon:SetScript("OnUpdate", function(self)
		local duration = GetTime() - tSend
		vcbGlobalCooldown.Bar:SetValue(duration)
	end)
	vcbGlobalCooldown.Icon:SetScript("OnCooldownDone", function(self)
		vcbGlobalCooldown.Bar:Hide()
	end)
	if VCBsettings.Player.GlobalCooldown.Bar.Color == "Default" then
		vcbGlobalCooldown.Bar:SetStatusBarDesaturated(false)
		vcbGlobalCooldown.Bar:SetStatusBarColor(1, 1, 1, 1)
		if VCBsettings.Player.GlobalCooldown.Bar.Style == "Jailer" then
			vcbGlobalCooldown.Bar.Spark:SetDesaturated(true)
			vcbGlobalCooldown.Bar.Spark:SetVertexColor(jailerColor:GetRGB())
			vcbGlobalCooldown.Bar.ExtraSpark:SetDesaturated(true)
			vcbGlobalCooldown.Bar.ExtraSpark:SetVertexColor(jailerColor:GetRGB())
			vcbGlobalCooldown.Bar.ChannelShadow:SetDesaturated(true)
			vcbGlobalCooldown.Bar.ChannelShadow:SetVertexColor(jailerColor:GetRGB())
			vcbGlobalCooldown.Bar.Flash:SetDesaturated(true)
			vcbGlobalCooldown.Bar.Flash:SetVertexColor(jailerColor:GetRGB())
		else
			vcbGlobalCooldown.Bar.Spark:SetDesaturated(false)
			vcbGlobalCooldown.Bar.Spark:SetVertexColor(1, 1, 1, 1)
			vcbGlobalCooldown.Bar.ExtraSpark:SetDesaturated(false)
			vcbGlobalCooldown.Bar.ExtraSpark:SetVertexColor(1, 1, 1, 1)
			vcbGlobalCooldown.Bar.ChannelShadow:SetDesaturated(false)
			vcbGlobalCooldown.Bar.ChannelShadow:SetVertexColor(1, 1, 1, 1)
			vcbGlobalCooldown.Bar.Flash:SetDesaturated(false)
			vcbGlobalCooldown.Bar.Flash:SetVertexColor(1, 1, 1, 1)
		end
	elseif VCBsettings.Player.GlobalCooldown.Bar.Color == "Class" then
		vcbGlobalCooldown.Bar:SetStatusBarDesaturated(true)
		vcbGlobalCooldown.Bar:SetStatusBarColor(VDW.PlayerClassColor:GetRGB())
		vcbGlobalCooldown.Bar.Spark:SetDesaturated(true)
		vcbGlobalCooldown.Bar.Spark:SetVertexColor(VDW.PlayerClassColor:GetRGB())
		vcbGlobalCooldown.Bar.ExtraSpark:SetDesaturated(true)
		vcbGlobalCooldown.Bar.ExtraSpark:SetVertexColor(VDW.PlayerClassColor:GetRGB())
		vcbGlobalCooldown.Bar.ChannelShadow:SetDesaturated(true)
		vcbGlobalCooldown.Bar.ChannelShadow:SetVertexColor(VDW.PlayerClassColor:GetRGB())
		vcbGlobalCooldown.Bar.Flash:SetDesaturated(true)
		vcbGlobalCooldown.Bar.Flash:SetVertexColor(VDW.PlayerClassColor:GetRGB())
	elseif VCBsettings.Player.GlobalCooldown.Bar.Color == "Faction" then
		vcbGlobalCooldown.Bar:SetStatusBarDesaturated(true)
		vcbGlobalCooldown.Bar:SetStatusBarColor(VDW.PlayerFactionColor:GetRGB())
		vcbGlobalCooldown.Bar.Spark:SetDesaturated(true)
		vcbGlobalCooldown.Bar.Spark:SetVertexColor(VDW.PlayerFactionColor:GetRGB())
		vcbGlobalCooldown.Bar.ExtraSpark:SetDesaturated(true)
		vcbGlobalCooldown.Bar.ExtraSpark:SetVertexColor(VDW.PlayerFactionColor:GetRGB())
		vcbGlobalCooldown.Bar.ChannelShadow:SetDesaturated(true)
		vcbGlobalCooldown.Bar.ChannelShadow:SetVertexColor(VDW.PlayerFactionColor:GetRGB())
		vcbGlobalCooldown.Bar.Flash:SetDesaturated(true)
		vcbGlobalCooldown.Bar.Flash:SetVertexColor(VDW.PlayerFactionColor:GetRGB())
	end
	if VCBsettings.Player.GlobalCooldown.Bar.Style == "Default" then
		vcbGlobalCooldown.Bar:SetStatusBarTexture("ui-castingbar-filling-standard")
	elseif VCBsettings.Player.GlobalCooldown.Bar.Style == "Jailer" then
		vcbGlobalCooldown.Bar:SetStatusBarTexture("jailerstower-scorebar-fill-onfire")
	end
	if VCBsettings.Player.GlobalCooldown.Bar.BorderColor == "Default" then
		vcbGlobalCooldown.Bar.Background:SetDesaturated(false)
		vcbGlobalCooldown.Bar.Border:SetDesaturated(false)
		vcbGlobalCooldown.Bar.Background:SetVertexColor(1, 1, 1)
		vcbGlobalCooldown.Bar.Border:SetVertexColor(1, 1, 1)
	elseif VCBsettings.Player.GlobalCooldown.Bar.BorderColor == "Class" then
		vcbGlobalCooldown.Bar.Background:SetDesaturated(true)
		vcbGlobalCooldown.Bar.Border:SetDesaturated(true)
		vcbGlobalCooldown.Bar.Background:SetVertexColor(VDW.PlayerClassColor:GetRGB())
		vcbGlobalCooldown.Bar.Border:SetVertexColor(VDW.PlayerClassColor:GetRGB())
	elseif VCBsettings.Player.GlobalCooldown.Bar.BorderColor == "Faction" then
		vcbGlobalCooldown.Bar.Background:SetDesaturated(true)
		vcbGlobalCooldown.Bar.Border:SetDesaturated(true)
		vcbGlobalCooldown.Bar.Background:SetVertexColor(VDW.PlayerFactionColor:GetRGB())
		vcbGlobalCooldown.Bar.Border:SetVertexColor(VDW.PlayerFactionColor:GetRGB())
	end
	if VCBsettings.Player.GlobalCooldown.Bar.BorderStyle == "Default" then
		vcbGlobalCooldown.Bar.Border:SetAtlas("ui-castingbar-frame")
		vcbGlobalCooldown.Bar.Border:ClearAllPoints()
		vcbGlobalCooldown.Bar.Border:SetPoint("TOPLEFT", vcbGlobalCooldown.Bar, "TOPLEFT", -1, 2)
		vcbGlobalCooldown.Bar.Border:SetPoint("BOTTOMRIGHT", vcbGlobalCooldown.Bar, "BOTTOMRIGHT", 1, -2)
		vcbGlobalCooldown.Bar.Background:SetAtlas("ui-castingbar-background")
	elseif VCBsettings.Player.GlobalCooldown.Bar.BorderStyle == "Jailer" then
		vcbGlobalCooldown.Bar.Border:SetAtlas("jailerstower-scenario-TitleBG")
		vcbGlobalCooldown.Bar.Border:ClearAllPoints()
		vcbGlobalCooldown.Bar.Border:SetPoint("TOPLEFT", vcbGlobalCooldown.Bar, "TOPLEFT", 0, 12)
		vcbGlobalCooldown.Bar.Border:SetPoint("BOTTOMRIGHT", vcbGlobalCooldown.Bar, "BOTTOMRIGHT", 0, -10)
		vcbGlobalCooldown.Bar.Background:SetAtlas("jailerstower-scorebar-bgright-onfire")
		vcbGlobalCooldown.Bar.Background:SetDesaturated(true)
	end
	if VCBsettings.Player.GlobalCooldown.Bar.Fill == "Standard" then
		vcbGlobalCooldown.Bar:SetFillStyle(Enum.StatusBarFillStyle.Standard)
		vcbGlobalCooldown.Bar.ExtraSpark:Hide()
		vcbGlobalCooldown.Bar.Spark:ClearAllPoints()
		vcbGlobalCooldown.Bar.Spark:SetPoint("CENTER", vcbGlobalCooldown.Bar:GetStatusBarTexture(), "RIGHT")
		vcbGlobalCooldown.Bar.Spark:SetSize(6, 16)
		vcbGlobalCooldown.Bar.Spark:Show()
	elseif VCBsettings.Player.GlobalCooldown.Bar.Fill == "Reversed" then
		vcbGlobalCooldown.Bar:SetFillStyle(Enum.StatusBarFillStyle.Reverse)
		vcbGlobalCooldown.Bar.Spark:Hide()
		vcbGlobalCooldown.Bar.ExtraSpark:ClearAllPoints()
		vcbGlobalCooldown.Bar.ExtraSpark:SetPoint("CENTER", vcbGlobalCooldown.Bar:GetStatusBarTexture(), "LEFT")
		vcbGlobalCooldown.Bar.ExtraSpark:SetSize(6, 16)
		vcbGlobalCooldown.Bar.ExtraSpark:Show()
	elseif VCBsettings.Player.GlobalCooldown.Bar.Fill == "Center" then
		vcbGlobalCooldown.Bar:SetFillStyle(Enum.StatusBarFillStyle.Center)
		vcbGlobalCooldown.Bar.Spark:ClearAllPoints()
		vcbGlobalCooldown.Bar.Spark:SetPoint("CENTER", vcbGlobalCooldown.Bar:GetStatusBarTexture(), "RIGHT")
		vcbGlobalCooldown.Bar.Spark:SetSize(6, 16)
		vcbGlobalCooldown.Bar.Spark:Show()
		vcbGlobalCooldown.Bar.ExtraSpark:ClearAllPoints()
		vcbGlobalCooldown.Bar.ExtraSpark:SetPoint("CENTER", vcbGlobalCooldown.Bar:GetStatusBarTexture(), "LEFT")
		vcbGlobalCooldown.Bar.ExtraSpark:SetSize(6, 16)
		vcbGlobalCooldown.Bar.ExtraSpark:Show()
	end
end
-- check instant
local function chkInstantCastBar()
	vcbGlobalCooldown.Icon:SetScript("OnUpdate", function(self)
		local duration = iEndTime - GetTime()
		vcbGlobalCooldown.Instant:SetValue(duration)
		vcbGlobalCooldown.Instant.textCurrent:SetText(string.format("%.2f", duration))
	end)
	vcbGlobalCooldown.Icon:SetScript("OnCooldownDone", function(self)
		vcbGlobalCooldown.Instant:Hide()
	end)
	vcbGlobalCooldown.Instant:ClearAllPoints()
	vcbGlobalCooldown.Instant:SetPoint("CENTER", PlayerCastingBarFrame, "CENTER", 0, 0)
	vcbGlobalCooldown.Instant:SetSize(VCBsettings.Player.Size.Width, VCBsettings.Player.Size.Height)
	vcbGlobalCooldown.Instant:SetScale(PlayerCastingBarFrame:GetScale())
	
	local borderbW = VCBsettings.Player.Size.Width*1.03
	local borderbH = VCBsettings.Player.Size.Height*1.28
	vcbGlobalCooldown.Instant.Border:ClearAllPoints()
	vcbGlobalCooldown.Instant.Border:SetPoint("CENTER", vcbGlobalCooldown.Instant, "CENTER", 0, 0)
	vcbGlobalCooldown.Instant.Border:SetSize(borderbW, borderbH)
	
	local iconH = VCBsettings.Player.Size.Height*2
	vcbGlobalCooldown.Instant.iconSpellLeft:ClearAllPoints()
	vcbGlobalCooldown.Instant.iconSpellLeft:SetPoint("RIGHT", vcbGlobalCooldown.Instant, "LEFT", -4, -5)
	vcbGlobalCooldown.Instant.iconSpellLeft:SetSize(iconH, iconH)
	vcbGlobalCooldown.Instant.iconSpellRight:ClearAllPoints()
	vcbGlobalCooldown.Instant.iconSpellRight:SetPoint("LEFT", vcbGlobalCooldown.Instant, "RIGHT", 4, -5)
	vcbGlobalCooldown.Instant.iconSpellRight:SetSize(iconH, iconH)
	
	local borderH = VCBsettings.Player.Size.Height/2
	vcbGlobalCooldown.Instant.TextBorderTop:ClearAllPoints()
	vcbGlobalCooldown.Instant.TextBorderTop:SetPoint("BOTTOMLEFT", vcbGlobalCooldown.Instant, "TOPLEFT", 0, -borderH)
	vcbGlobalCooldown.Instant.TextBorderTop:SetPoint("BOTTOMRIGHT", vcbGlobalCooldown.Instant, "TOPRIGHT", 0, -borderH)
	vcbGlobalCooldown.Instant.TextBorderTop:SetHeight(12+borderH)
	vcbGlobalCooldown.Instant.TextBorderBottom:ClearAllPoints()
	vcbGlobalCooldown.Instant.TextBorderBottom:SetPoint("TOPLEFT", vcbGlobalCooldown.Instant, "BOTTOMLEFT", 0, borderH)
	vcbGlobalCooldown.Instant.TextBorderBottom:SetPoint("TOPRIGHT", vcbGlobalCooldown.Instant, "BOTTOMRIGHT", 0, borderH)
	vcbGlobalCooldown.Instant.TextBorderBottom:SetHeight(12+borderH)
	local sparkH = VCBsettings.Player.Size.Height*1.8
	vcbGlobalCooldown.Instant.Spark:SetSize(8, sparkH)
	vcbGlobalCooldown.Instant.ExtraSpark:SetSize(8, sparkH)
	vcbGlobalCooldown.Instant.ChannelShadow:SetSize(VCBsettings.Player.Size.Height, VCBsettings.Player.Size.Height)
	vcbGlobalCooldown.Instant.Spark:ClearAllPoints()
	vcbGlobalCooldown.Instant.Spark:SetPoint("CENTER", vcbGlobalCooldown.Instant:GetStatusBarTexture(), "RIGHT")
	vcbGlobalCooldown.Instant.Spark:Show()
	
	if VCBsettings.Player.GlobalCooldown.Instant.StastusStyle == "Default" then
		vcbGlobalCooldown.Instant:SetStatusBarTexture("ui-castingbar-filling-standard")
	elseif VCBsettings.Player.GlobalCooldown.Instant.StastusStyle == "Jailer" then
		vcbGlobalCooldown.Instant:SetStatusBarTexture("jailerstower-scorebar-fill-onfire")
	end
	if VCBsettings.Player.GlobalCooldown.Instant.StatusColor == "Default" then
	vcbGlobalCooldown.Instant:SetScript("OnShow", function(self)
		self:SetStatusBarDesaturated(false)
		self:SetStatusBarColor(1, 1, 1, 1)
		if VCBsettings.Player.GlobalCooldown.Instant.StastusStyle == "Jailer" then
			self.Spark:SetDesaturated(true)
			self.Spark:SetVertexColor(jailerColor:GetRGB())
			self.ExtraSpark:SetDesaturated(true)
			self.ExtraSpark:SetVertexColor(jailerColor:GetRGB())
			self.ChannelShadow:SetDesaturated(true)
			self.ChannelShadow:SetVertexColor(jailerColor:GetRGB())
			self.Flash:SetDesaturated(true)
			self.Flash:SetVertexColor(jailerColor:GetRGB())
		else
			self.Spark:SetDesaturated(false)
			self.Spark:SetVertexColor(1, 1, 1, 1)
			self.ExtraSpark:SetDesaturated(false)
			self.ExtraSpark:SetVertexColor(1, 1, 1, 1)
			self.ChannelShadow:SetDesaturated(false)
			self.ChannelShadow:SetVertexColor(1, 1, 1, 1)
			self.Flash:SetDesaturated(false)
			self.Flash:SetVertexColor(1, 1, 1, 1)
		end
	end)
	elseif VCBsettings.Player.GlobalCooldown.Instant.StatusColor == "Class" then
		vcbGlobalCooldown.Instant:SetScript("OnShow", function(self)
			self:SetStatusBarDesaturated(true)
			self:SetStatusBarColor(VDW.PlayerClassColor:GetRGB())
			self.Spark:SetDesaturated(true)
			self.Spark:SetVertexColor(VDW.PlayerClassColor:GetRGB())
			self.ExtraSpark:SetDesaturated(true)
			self.ExtraSpark:SetVertexColor(VDW.PlayerClassColor:GetRGB())
			self.ChannelShadow:SetDesaturated(true)
			self.ChannelShadow:SetVertexColor(VDW.PlayerClassColor:GetRGB())
			self.Flash:SetDesaturated(true)
			self.Flash:SetVertexColor(VDW.PlayerClassColor:GetRGB())
		end)
	elseif VCBsettings.Player.GlobalCooldown.Instant.StatusColor == "Faction" then
		vcbGlobalCooldown.Instant:SetScript("OnShow", function(self)
			self:SetStatusBarDesaturated(true)
			self:SetStatusBarColor(VDW.PlayerFactionColor:GetRGB())
			self.Spark:SetDesaturated(true)
			self.Spark:SetVertexColor(VDW.PlayerFactionColor:GetRGB())
			self.ExtraSpark:SetDesaturated(true)
			self.ExtraSpark:SetVertexColor(VDW.PlayerFactionColor:GetRGB())
			self.ChannelShadow:SetDesaturated(true)
			self.ChannelShadow:SetVertexColor(VDW.PlayerFactionColor:GetRGB())
			self.Flash:SetDesaturated(true)
			self.Flash:SetVertexColor(VDW.PlayerFactionColor:GetRGB())
		end)
	elseif VCBsettings.Player.GlobalCooldown.Instant.StatusColor == "SpellsSchool" then
		if VDW.PlayerClassID == 1 then
			vcbInstantClass = VDW.VCB.InstantSpellSchool.Warrior
		elseif VDW.PlayerClassID == 2 then
			vcbInstantClass = VDW.VCB.InstantSpellSchool.Paladin
		elseif VDW.PlayerClassID == 3 then
			vcbInstantClass = VDW.VCB.InstantSpellSchool.Hunter
		elseif VDW.PlayerClassID == 4 then
			vcbInstantClass = VDW.VCB.InstantSpellSchool.Rogue
		elseif VDW.PlayerClassID == 5 then
			vcbInstantClass = VDW.VCB.InstantSpellSchool.Priest
		elseif VDW.PlayerClassID == 6 then
			vcbInstantClass = VDW.VCB.InstantSpellSchool.DeathKight
		elseif VDW.PlayerClassID == 7 then
			vcbInstantClass = VDW.VCB.InstantSpellSchool.Shaman
		elseif VDW.PlayerClassID == 8 then
			vcbInstantClass = VDW.VCB.InstantSpellSchool.Mage
		elseif VDW.PlayerClassID == 9 then
			vcbInstantClass = VDW.VCB.InstantSpellSchool.Warlock
		elseif VDW.PlayerClassID == 10 then
			vcbInstantClass = VDW.VCB.InstantSpellSchool.Monk
		elseif VDW.PlayerClassID == 11 then
			vcbInstantClass = VDW.VCB.InstantSpellSchool.Druid
		elseif VDW.PlayerClassID == 12 then
			vcbInstantClass = VDW.VCB.InstantSpellSchool.DemonHunter
		elseif VDW.PlayerClassID == 13 then
			vcbInstantClass = VDW.VCB.InstantSpellSchool.Evoker
		end
		vcbGlobalCooldown.Instant:SetScript("OnShow", function(self)
			self:SetStatusBarDesaturated(true)
			self:SetStatusBarColor(VDW.VCB[vcbSchool.."Color"]:GetRGB())
			self.Spark:SetDesaturated(true)
			self.Spark:SetVertexColor(VDW.VCB[vcbSchool.."Color"]:GetRGB())
			self.ExtraSpark:SetDesaturated(true)
			self.ExtraSpark:SetVertexColor(VDW.VCB[vcbSchool.."Color"]:GetRGB())
			self.ChannelShadow:SetDesaturated(true)
			self.ChannelShadow:SetVertexColor(VDW.VCB[vcbSchool.."Color"]:GetRGB())
			self.Flash:SetDesaturated(true)
			self.Flash:SetVertexColor(VDW.VCB[vcbSchool.."Color"]:GetRGB())
		end)
	end
	if VCBsettings.Player.GlobalCooldown.Instant.BorderStyle == "Default" then
		vcbGlobalCooldown.Instant.Border:SetAtlas("ui-castingbar-frame")
		vcbGlobalCooldown.Instant.Border:ClearAllPoints()
		vcbGlobalCooldown.Instant.Border:SetPoint("TOPLEFT", vcbGlobalCooldown.Instant, "TOPLEFT", -1, 2)
		vcbGlobalCooldown.Instant.Border:SetPoint("BOTTOMRIGHT", vcbGlobalCooldown.Instant, "BOTTOMRIGHT", 1, -2)
		vcbGlobalCooldown.Instant.Background:SetAtlas("ui-castingbar-background")
	elseif VCBsettings.Player.GlobalCooldown.Instant.BorderStyle == "Jailer" then
		vcbGlobalCooldown.Instant.Border:SetAtlas("jailerstower-scenario-TitleBG")
		vcbGlobalCooldown.Instant.Border:ClearAllPoints()
		vcbGlobalCooldown.Instant.Border:SetPoint("TOPLEFT", vcbGlobalCooldown.Instant, "TOPLEFT", 0, 12)
		vcbGlobalCooldown.Instant.Border:SetPoint("BOTTOMRIGHT", vcbGlobalCooldown.Instant, "BOTTOMRIGHT", 0, -10)
		vcbGlobalCooldown.Instant.Background:SetAtlas("jailerstower-scorebar-bgright-onfire")
		vcbGlobalCooldown.Instant.Background:SetDesaturated(true)
	end
	if VCBsettings.Player.GlobalCooldown.Instant.BorderColor == "Default" then
		vcbGlobalCooldown.Instant.Background:SetDesaturated(false)
		vcbGlobalCooldown.Instant.Border:SetDesaturated(false)
		vcbGlobalCooldown.Instant.Background:SetVertexColor(1, 1, 1)
		vcbGlobalCooldown.Instant.Border:SetVertexColor(1, 1, 1)
	elseif VCBsettings.Player.GlobalCooldown.Instant.BorderColor == "Class" then
		vcbGlobalCooldown.Instant.Background:SetDesaturated(true)
		vcbGlobalCooldown.Instant.Border:SetDesaturated(true)
		vcbGlobalCooldown.Instant.Background:SetVertexColor(VDW.PlayerClassColor:GetRGB())
		vcbGlobalCooldown.Instant.Border:SetVertexColor(VDW.PlayerClassColor:GetRGB())
	elseif VCBsettings.Player.GlobalCooldown.Instant.BorderColor == "Faction" then
		vcbGlobalCooldown.Instant.Background:SetDesaturated(true)
		vcbGlobalCooldown.Instant.Border:SetDesaturated(true)
		vcbGlobalCooldown.Instant.Background:SetVertexColor(VDW.PlayerFactionColor:GetRGB())
		vcbGlobalCooldown.Instant.Border:SetVertexColor(VDW.PlayerFactionColor:GetRGB())
	end
	if VCBsettings.Player.GlobalCooldown.Instant.TextBorder.Position == "Hide" then
		vcbGlobalCooldown.Instant.TextBorderTop:Hide()
		vcbGlobalCooldown.Instant.TextBorderBottom:Hide()
	elseif VCBsettings.Player.GlobalCooldown.Instant.TextBorder.Position == "Top" then
		vcbGlobalCooldown.Instant.TextBorderTop:Show()
		vcbGlobalCooldown.Instant.TextBorderBottom:Hide()
	elseif VCBsettings.Player.GlobalCooldown.Instant.TextBorder.Position == "Bottom" then
		vcbGlobalCooldown.Instant.TextBorderTop:Hide()
		vcbGlobalCooldown.Instant.TextBorderBottom:Show()
	elseif VCBsettings.Player.GlobalCooldown.Instant.TextBorder.Position == "Both" then
		vcbGlobalCooldown.Instant.TextBorderTop:Show()
		vcbGlobalCooldown.Instant.TextBorderBottom:Show()
	end
-- icon
	if VCBsettings.Player.GlobalCooldown.Instant.Icon.Position == "Hide" then
		if vcbGlobalCooldown.Instant.iconSpellLeft:IsShown() then vcbGlobalCooldown.Instant.iconSpellLeft:Hide() end
		if vcbGlobalCooldown.Instant.iconSpellRight:IsShown() then vcbGlobalCooldown.Instant.iconSpellRight:Hide() end
	elseif VCBsettings.Player.GlobalCooldown.Instant.Icon.Position == "Left" then
		if not vcbGlobalCooldown.Instant.iconSpellLeft:IsShown() then vcbGlobalCooldown.Instant.iconSpellLeft:Show() end
		if vcbGlobalCooldown.Instant.iconSpellRight:IsShown() then vcbGlobalCooldown.Instant.iconSpellRight:Hide() end
	elseif VCBsettings.Player.GlobalCooldown.Instant.Icon.Position == "Right" then
		if vcbGlobalCooldown.Instant.iconSpellLeft:IsShown() then vcbGlobalCooldown.Instant.iconSpellLeft:Hide() end
		if not vcbGlobalCooldown.Instant.iconSpellRight:IsShown() then vcbGlobalCooldown.Instant.iconSpellRight:Show() end
	elseif VCBsettings.Player.GlobalCooldown.Instant.Icon.Position == "Both" then
		if not vcbGlobalCooldown.Instant.iconSpellLeft:IsShown() then vcbGlobalCooldown.Instant.iconSpellLeft:Show() end
		if not vcbGlobalCooldown.Instant.iconSpellRight:IsShown() then vcbGlobalCooldown.Instant.iconSpellRight:Show() end
	end
-- name
	if VCBsettings.Player.GlobalCooldown.Instant.Name.Position == "Hide" then
		if vcbGlobalCooldown.Instant.textName:IsShown() then vcbGlobalCooldown.Instant.textName:Hide() end
	elseif VCBsettings.Player.GlobalCooldown.Instant.Name.Position == "TopLeft" then
		vcbGlobalCooldown.Instant.textName:ClearAllPoints()
		vcbGlobalCooldown.Instant.textName:SetPoint("BOTTOMLEFT", vcbGlobalCooldown.Instant, "TOPLEFT", 4, 1)
		vcbGlobalCooldown.Instant.textName:SetJustifyH("LEFT")
		if not vcbGlobalCooldown.Instant.textName:IsShown() then vcbGlobalCooldown.Instant.textName:Show() end
	elseif VCBsettings.Player.GlobalCooldown.Instant.Name.Position == "Left" then
		vcbGlobalCooldown.Instant.textName:ClearAllPoints()
		vcbGlobalCooldown.Instant.textName:SetPoint("LEFT", vcbGlobalCooldown.Instant, "LEFT", 4, 0)
		vcbGlobalCooldown.Instant.textName:SetJustifyH("LEFT")
		if not vcbGlobalCooldown.Instant.textName:IsShown() then vcbGlobalCooldown.Instant.textName:Show() end
	elseif VCBsettings.Player.GlobalCooldown.Instant.Name.Position == "BottomLeft" then
		vcbGlobalCooldown.Instant.textName:ClearAllPoints()
		vcbGlobalCooldown.Instant.textName:SetPoint("TOPLEFT", vcbGlobalCooldown.Instant, "BOTTOMLEFT", 4, -1)
		vcbGlobalCooldown.Instant.textName:SetJustifyH("LEFT")
		if not vcbGlobalCooldown.Instant.textName:IsShown() then vcbGlobalCooldown.Instant.textName:Show() end
	elseif VCBsettings.Player.GlobalCooldown.Instant.Name.Position == "Top" then
		vcbGlobalCooldown.Instant.textName:ClearAllPoints()
		vcbGlobalCooldown.Instant.textName:SetPoint("BOTTOM", vcbGlobalCooldown.Instant, "TOP", 0, 1)
		vcbGlobalCooldown.Instant.textName:SetJustifyH("CENTER")
		if not vcbGlobalCooldown.Instant.textName:IsShown() then vcbGlobalCooldown.Instant.textName:Show() end
	elseif VCBsettings.Player.GlobalCooldown.Instant.Name.Position == "Center" then
		vcbGlobalCooldown.Instant.textName:ClearAllPoints()
		vcbGlobalCooldown.Instant.textName:SetPoint("CENTER", vcbGlobalCooldown.Instant, "CENTER", 0, 0)
		vcbGlobalCooldown.Instant.textName:SetJustifyH("CENTER")
		if not vcbGlobalCooldown.Instant.textName:IsShown() then vcbGlobalCooldown.Instant.textName:Show() end
	elseif VCBsettings.Player.GlobalCooldown.Instant.Name.Position == "Bottom" then
		vcbGlobalCooldown.Instant.textName:ClearAllPoints()
		vcbGlobalCooldown.Instant.textName:SetPoint("TOP", vcbGlobalCooldown.Instant, "BOTTOM", 0, -1)
		vcbGlobalCooldown.Instant.textName:SetJustifyH("CENTER")
		if not vcbGlobalCooldown.Instant.textName:IsShown() then vcbGlobalCooldown.Instant.textName:Show() end
	elseif VCBsettings.Player.GlobalCooldown.Instant.Name.Position == "TopRight" then
		vcbGlobalCooldown.Instant.textName:ClearAllPoints()
		vcbGlobalCooldown.Instant.textName:SetPoint("BOTTOMRIGHT", vcbGlobalCooldown.Instant, "TOPRIGHT", -4, 1)
		vcbGlobalCooldown.Instant.textName:SetJustifyH("RIGHT")
		if not vcbGlobalCooldown.Instant.textName:IsShown() then vcbGlobalCooldown.Instant.textName:Show() end
	elseif VCBsettings.Player.GlobalCooldown.Instant.Name.Position == "Right" then
		vcbGlobalCooldown.Instant.textName:ClearAllPoints()
		vcbGlobalCooldown.Instant.textName:SetPoint("RIGHT", vcbGlobalCooldown.Instant, "RIGHT", -4, 0)
		vcbGlobalCooldown.Instant.textName:SetJustifyH("RIGHT")
		if not vcbGlobalCooldown.Instant.textName:IsShown() then vcbGlobalCooldown.Instant.textName:Show() end
	elseif VCBsettings.Player.GlobalCooldown.Instant.Name.Position == "BottomRight" then
		vcbGlobalCooldown.Instant.textName:ClearAllPoints()
		vcbGlobalCooldown.Instant.textName:SetPoint("TOPRIGHT", vcbGlobalCooldown.Instant, "BOTTOMRIGHT", -4, -1)
		vcbGlobalCooldown.Instant.textName:SetJustifyH("RIGHT")
		if not vcbGlobalCooldown.Instant.textName:IsShown() then vcbGlobalCooldown.Instant.textName:Show() end
	end
-- time
	if VCBsettings.Player.GlobalCooldown.Instant.RemainingTime.Position == "Hide" then
		if vcbGlobalCooldown.Instant.textCurrent:IsShown() then vcbGlobalCooldown.Instant.textCurrent:Hide() end
	elseif VCBsettings.Player.GlobalCooldown.Instant.RemainingTime.Position == "TopLeft" then
		vcbGlobalCooldown.Instant.textCurrent:ClearAllPoints()
		vcbGlobalCooldown.Instant.textCurrent:SetPoint("BOTTOMLEFT", vcbGlobalCooldown.Instant, "TOPLEFT", 4, 1)
		vcbGlobalCooldown.Instant.textCurrent:SetJustifyH("LEFT")
		if not vcbGlobalCooldown.Instant.textCurrent:IsShown() then vcbGlobalCooldown.Instant.textCurrent:Show() end
	elseif VCBsettings.Player.GlobalCooldown.Instant.RemainingTime.Position == "Left" then
		vcbGlobalCooldown.Instant.textCurrent:ClearAllPoints()
		vcbGlobalCooldown.Instant.textCurrent:SetPoint("LEFT", vcbGlobalCooldown.Instant, "LEFT", 4, 0)
		vcbGlobalCooldown.Instant.textCurrent:SetJustifyH("LEFT")
		if not vcbGlobalCooldown.Instant.textCurrent:IsShown() then vcbGlobalCooldown.Instant.textCurrent:Show() end
	elseif VCBsettings.Player.GlobalCooldown.Instant.RemainingTime.Position == "BottomLeft" then
		vcbGlobalCooldown.Instant.textCurrent:ClearAllPoints()
		vcbGlobalCooldown.Instant.textCurrent:SetPoint("TOPLEFT", vcbGlobalCooldown.Instant, "BOTTOMLEFT", 4, -1)
		vcbGlobalCooldown.Instant.textCurrent:SetJustifyH("LEFT")
		if not vcbGlobalCooldown.Instant.textCurrent:IsShown() then vcbGlobalCooldown.Instant.textCurrent:Show() end
	elseif VCBsettings.Player.GlobalCooldown.Instant.RemainingTime.Position == "Top" then
		vcbGlobalCooldown.Instant.textCurrent:ClearAllPoints()
		vcbGlobalCooldown.Instant.textCurrent:SetPoint("BOTTOM", vcbGlobalCooldown.Instant, "TOP", 0, 1)
		vcbGlobalCooldown.Instant.textCurrent:SetJustifyH("CENTER")
		if not vcbGlobalCooldown.Instant.textCurrent:IsShown() then vcbGlobalCooldown.Instant.textCurrent:Show() end
	elseif VCBsettings.Player.GlobalCooldown.Instant.RemainingTime.Position == "Center" then
		vcbGlobalCooldown.Instant.textCurrent:ClearAllPoints()
		vcbGlobalCooldown.Instant.textCurrent:SetPoint("CENTER", vcbGlobalCooldown.Instant, "CENTER", 0, 0)
		vcbGlobalCooldown.Instant.textCurrent:SetJustifyH("CENTER")
		if not vcbGlobalCooldown.Instant.textCurrent:IsShown() then vcbGlobalCooldown.Instant.textCurrent:Show() end
	elseif VCBsettings.Player.GlobalCooldown.Instant.RemainingTime.Position == "Bottom" then
		vcbGlobalCooldown.Instant.textCurrent:ClearAllPoints()
		vcbGlobalCooldown.Instant.textCurrent:SetPoint("TOP", vcbGlobalCooldown.Instant, "BOTTOM", 0, -1)
		vcbGlobalCooldown.Instant.textCurrent:SetJustifyH("CENTER")
		if not vcbGlobalCooldown.Instant.textCurrent:IsShown() then vcbGlobalCooldown.Instant.textCurrent:Show() end
	elseif VCBsettings.Player.GlobalCooldown.Instant.RemainingTime.Position == "TopRight" then
		vcbGlobalCooldown.Instant.textCurrent:ClearAllPoints()
		vcbGlobalCooldown.Instant.textCurrent:SetPoint("BOTTOMRIGHT", vcbGlobalCooldown.Instant, "TOPRIGHT", -4, 1)
		vcbGlobalCooldown.Instant.textCurrent:SetJustifyH("RIGHT")
		if not vcbGlobalCooldown.Instant.textCurrent:IsShown() then vcbGlobalCooldown.Instant.textCurrent:Show() end
	elseif VCBsettings.Player.GlobalCooldown.Instant.RemainingTime.Position == "Right" then
		vcbGlobalCooldown.Instant.textCurrent:ClearAllPoints()
		vcbGlobalCooldown.Instant.textCurrent:SetPoint("RIGHT", vcbGlobalCooldown.Instant, "RIGHT", -4, 0)
		vcbGlobalCooldown.Instant.textCurrent:SetJustifyH("RIGHT")
		if not vcbGlobalCooldown.Instant.textCurrent:IsShown() then vcbGlobalCooldown.Instant.textCurrent:Show() end
	elseif VCBsettings.Player.GlobalCooldown.Instant.RemainingTime.Position == "BottomRight" then
		vcbGlobalCooldown.Instant.textCurrent:ClearAllPoints()
		vcbGlobalCooldown.Instant.textCurrent:SetPoint("TOPRIGHT", vcbGlobalCooldown.Instant, "BOTTOMRIGHT", -4, -1)
		vcbGlobalCooldown.Instant.textCurrent:SetJustifyH("RIGHT")
		if not vcbGlobalCooldown.Instant.textCurrent:IsShown() then vcbGlobalCooldown.Instant.textCurrent:Show() end
	end
end
-- help school
local function helpingInstantSchoolColor(arg3)
	vcbSchool = "Default"
	for k, v in pairs (vcbInstantClass) do
		for i, a in pairs (v) do
			if a == arg3 then
				vcbSchool = k
				vcbColor = true
			end
		end
	end
end
-- check the whole Global Cooldown
function VDW.VCB.chkGlobalCooldownPlayer()
	if VCBsettings.Player.GlobalCooldown.Enable then
		if not vcbGlobalCooldown:IsShown() then vcbGlobalCooldown:Show() end
		if VCBsettings.Player.GlobalCooldown.Position == "Left" then
			vcbGlobalCooldown.Bar:ClearAllPoints()
			vcbGlobalCooldown.Bar:SetPoint("RIGHT", vcbGlobalCooldown, "RIGHT", 0, 0)
			vcbGlobalCooldown:ClearAllPoints()
			vcbGlobalCooldown:SetPoint("RIGHT", PlayerCastingBarFrame, "LEFT", -42, 0)
			if not vcbGlobalCooldown:IsShown() then vcbGlobalCooldown:Show() end
		elseif VCBsettings.Player.GlobalCooldown.Position == "Top" then
			vcbGlobalCooldown.Bar:ClearAllPoints()
			vcbGlobalCooldown.Bar:SetPoint("CENTER", vcbGlobalCooldown, "CENTER", 0, 0)
			vcbGlobalCooldown:ClearAllPoints()
			vcbGlobalCooldown:SetPoint("BOTTOM", PlayerCastingBarFrame, "TOP", 0, 19)
			if not vcbGlobalCooldown:IsShown() then vcbGlobalCooldown:Show() end
		elseif VCBsettings.Player.GlobalCooldown.Position == "Right" then
			vcbGlobalCooldown.Bar:ClearAllPoints()
			vcbGlobalCooldown.Bar:SetPoint("LEFT", vcbGlobalCooldown, "LEFT", 0, 0)
			vcbGlobalCooldown:ClearAllPoints()
			vcbGlobalCooldown:SetPoint("LEFT", PlayerCastingBarFrame, "RIGHT", 42, 0)
			if not vcbGlobalCooldown:IsShown() then vcbGlobalCooldown:Show() end
		elseif VCBsettings.Player.GlobalCooldown.Position == "Bottom" then
			vcbGlobalCooldown.Bar:ClearAllPoints()
			vcbGlobalCooldown.Bar:SetPoint("CENTER", vcbGlobalCooldown, "CENTER", 0, 0)
			vcbGlobalCooldown:ClearAllPoints()
			vcbGlobalCooldown:SetPoint("TOP", PlayerCastingBarFrame, "BOTTOM", 0, -19)
		end
		if VCBsettings.Player.GlobalCooldown.Style == "Icon" then chkIcon() end
		if VCBsettings.Player.GlobalCooldown.Style == "Bar" then chkBar() end
		if VCBsettings.Player.GlobalCooldown.Style == "InstantCastBar" or VCBsettings.Player.GlobalCooldown.Style == "Instant Cast Bar" then chkInstantCastBar() end
	else
		if vcbGlobalCooldown:IsShown() then vcbGlobalCooldown:Hide() end
	end
end

-- check interrupt spell
local function checkInterruptSpell(arg3)
	local interruptCD = false
	if VDW.PlayerClassID == 3 then
		for k,v in pairs(vcbInterruptSpellTable) do
			if arg3 == v then interruptCD = true end
		end
	else
		if arg3 == vcbInterruptSpell then interruptCD = true end 
	end
	if interruptCD then
		C_Timer.After(0.3, function()
			local duration = C_Spell.GetSpellCooldownDuration(arg3)
			vcbInterruptParent.Cooldown:SetCooldownFromDurationObject(duration)
		end)
	end
end
local function checkInterruptSpellPet(arg3)
	local interruptPetCD = false
	for k,v in pairs(vcbInterruptSpellTable) do
		if arg3 == v then interruptPetCD = true end
	end
	if interruptPetCD then
		C_Timer.After(0.3, function()
			local duration = C_Spell.GetSpellCooldownDuration(arg3)
			vcbInterruptParent.Cooldown:SetCooldownFromDurationObject(duration)
		end)
	end
end
-- resize bar
function VDW.VCB.resizeCastBar()
	PlayerCastingBarFrame:SetSize(VCBsettings.Player.Size.Width, VCBsettings.Player.Size.Height)
	PlayerCastingBarFrame.Background:ClearAllPoints()
	PlayerCastingBarFrame.Background:SetPoint("CENTER", PlayerCastingBarFrame, "CENTER", 0, 0)
	PlayerCastingBarFrame.Background:SetSize(VCBsettings.Player.Size.Width, VCBsettings.Player.Size.Height)
	local borderbW = VCBsettings.Player.Size.Width*1.03
	local borderbH = VCBsettings.Player.Size.Height*1.28
	PlayerCastingBarFrame.Border:ClearAllPoints()
	PlayerCastingBarFrame.Border:SetPoint("CENTER", PlayerCastingBarFrame, "CENTER", 0, 0)
	PlayerCastingBarFrame.Border:SetSize(borderbW, borderbH)
	local lagQueueH = VCBsettings.Player.Size.Height*0.8
	VCBLagCastBar:SetHeight(lagQueueH)
	VCBLagChannelBar:SetHeight(lagQueueH)
	VCBSpellQueueCastBar:SetHeight(lagQueueH)
	VCBSpellQueueChannelBar:SetHeight(lagQueueH)
	local shieldH = VCBsettings.Player.Size.Height*3.4
	local shieldW = shieldH*0.9
	local shieldY = VCBsettings.Player.Size.Height*0.4
	local iconH = VCBsettings.Player.Size.Height*2
	local iconY = shieldH*0.1
	shieldSpellLeft:ClearAllPoints()
	shieldSpellLeft:SetPoint("TOPRIGHT", PlayerCastingBarFrame, "TOPLEFT", 2, shieldY)
	shieldSpellLeft:SetSize(shieldW, shieldH)
	shieldSpellRight:ClearAllPoints()
	shieldSpellRight:SetPoint("TOPLEFT", PlayerCastingBarFrame, "TOPRIGHT", -2, shieldY)
	shieldSpellRight:SetSize(shieldW, shieldH)
	iconSpellLeft:ClearAllPoints()
	iconSpellLeft:SetPoint("CENTER", shieldSpellLeft, "CENTER", -1, iconY)
	iconSpellLeft:SetSize(iconH, iconH)
	iconSpellRight:ClearAllPoints()
	iconSpellRight:SetPoint("CENTER", shieldSpellRight, "CENTER", 1, iconY)
	iconSpellRight:SetSize(iconH, iconH)
	local borderH = VCBsettings.Player.Size.Height/2
	TextBorderTop:ClearAllPoints()
	TextBorderTop:SetPoint("BOTTOMLEFT", PlayerCastingBarFrame, "TOPLEFT", 0, -borderH)
	TextBorderTop:SetPoint("BOTTOMRIGHT", PlayerCastingBarFrame, "TOPRIGHT", 0, -borderH)
	TextBorderTop:SetHeight(12+borderH)
	TextBorderBottom:ClearAllPoints()
	TextBorderBottom:SetPoint("TOPLEFT", PlayerCastingBarFrame, "BOTTOMLEFT", 0, borderH)
	TextBorderBottom:SetPoint("TOPRIGHT", PlayerCastingBarFrame, "BOTTOMRIGHT", 0, borderH)
	TextBorderBottom:SetHeight(12+borderH)
	local sparkH = VCBsettings.Player.Size.Height*1.8
	PlayerCastingBarFrame.Spark:SetSize(8, sparkH)
	local bordermW = VCBsettings.Player.Size.Width*1.24
	local bordermH = VCBsettings.Player.Size.Height*1.18
	PlayerCastingBarFrame.BorderMask:SetSize(bordermW, bordermH)
	local standardGlowH = VCBsettings.Player.Size.Height*1.1
	PlayerCastingBarFrame.StandardGlow:SetSize(37, standardGlowH)
	PlayerCastingBarFrame.CraftGlow:SetSize(37, standardGlowH)
	PlayerCastingBarFrame.ChannelShadow:SetSize(VCBsettings.Player.Size.Height, VCBsettings.Player.Size.Height)
	PlayerCastingBarFrame.EnergyGlow:SetScale(1)
	PlayerCastingBarFrame.EnergyMask:SetScale(1)
end
-- hooking bar
local function hookingBar()
-- Hooking Time part 1 --
	PlayerCastingBarFrame:HookScript("OnShow", function(self)
		VDW.VCB.resizeCastBar()
		textName:SetWidth(self:GetWidth() - 8)
		iconPosition(self)
		namePosition(self)
		currentPostion(self)
		bothPostion(self)
		totalPostion(self)
		borderStyle(self)
		borderColor(self)
		bordertextPosition()
	end)
-- Hooking Time part 2 --
	PlayerCastingBarFrame:HookScript("OnUpdate", function(self)
		self.TextBorder:SetAlpha(0)
		self.CastTimeText:SetAlpha(0)
		self.Text:SetAlpha(0)
		if Duration then
			textName:SetText(self.Text:GetText())
			iconSpellLeft:SetTexture(self.Icon:GetTextureFileID())
			iconSpellRight:SetTexture(self.Icon:GetTextureFileID())
			shieldPosition(uninterruptible)
			if interrupted then
				textCurrent:SetText("-")
				textBoth:SetText("- / -")
				textTotal:SetText("-")
			else
				currentUpdate(self)
				bothUpdate(self)
				totalUpdate(self)
			end
			if tradeSkill or castBar == "Empower" then defaultColor(self) else statusbarColor(self) end
			statusbarStyle(self)
		end
	end)
end
-- =========================
-- Events Time
-- =========================
local function EventsTime(self, event, arg1, arg2, arg3, arg4, arg5)
	if event == "PLAYER_LOGIN" then
		ProtectOptions()
		Texts(textName)
		Texts(textCurrent)
		Texts(textBoth)
		Texts(textTotal)
		VDW.VCB.chkPlayerIconPosition()
		VDW.VCB.chkPlayerShieldPosition()
		VDW.VCB.chkPlayerBorderTextPosition()
		VDW.VCB.chkNameTxtPlayer()
		VDW.VCB.chkCurrentTxtPlayer()
		VDW.VCB.chkBothTxtPlayer()
		VDW.VCB.chkTotalTxtPlayer()
		VDW.VCB.chkCurrentUpdPlayer()
		VDW.VCB.chkBothUpdPlayer()
		VDW.VCB.chkTotalUpdPlayer()
		VDW.VCB.chkStatusColorPlayer()
		VDW.VCB.chkStatusStylePlayer()
		VDW.VCB.chkBorderColorPlayer()
		VDW.VCB.chkBorderStylePlayer()
		VDW.VCB.chkGlobalCooldownPlayer()
		VDW.VCB.resizeCastBar()
		if VCBspecialSettings.Player.Ticks then PlayerCastingBarFrame.vcbTicks = {} end
		interruptingSepll()
		hookingBar()
	end
end
vcbZlave:HookScript("OnEvent", EventsTime)
-- events 2
local function EventsTime2(self, event, arg1, arg2, arg3, arg4, arg5)
	if event == "CURRENT_SPELL_CAST_CHANGED" then
		if tSucceeded == GetTime() or tStart == GetTime() or tInterrupted == GetTime() or tChannelStart == GetTime() or tChannelUpdate == GetTime() or tEmpowerUpdate == GetTime() then
			tChange = GetTime()
		else
			lagStart = GetTime()
		end
	elseif event == "UNIT_SPELLCAST_SENT" and arg1 == UNIT then
		tSend = GetTime()
		if VCBsettings.Player.GlobalCooldown.Enable and (VCBsettings.Player.GlobalCooldown.Style == "Icon" or VCBsettings.Player.GlobalCooldown.Style == "Bar") then
			local spellCooldownInfo = C_Spell.GetSpellCooldown(61304)
			if spellCooldownInfo.duration > 0 then
				if VCBsettings.Player.GlobalCooldown.Style == "Icon" then
					vcbGlobalCooldown.Icon:SetAlpha(1)
					vcbGlobalCooldown.Icon:SetCooldown(GetTime(), spellCooldownInfo.duration - (tSend - lagStart))
				elseif VCBsettings.Player.GlobalCooldown.Style == "Bar" then
					vcbGlobalCooldown.Icon:SetAlpha(0)
					vcbGlobalCooldown.Icon:SetCooldown(GetTime(), spellCooldownInfo.duration - (tSend - lagStart))
					vcbGlobalCooldown.Bar:SetMinMaxValues(0, spellCooldownInfo.duration - (tSend - lagStart))
					vcbGlobalCooldown.Bar:Show()
				end
			end
		end
	elseif event == "UNIT_SPELLCAST_START" and arg1 == UNIT then
		vcbColor = false
		castName, castText, castTexture, _, _, castIsTradeSkill, _, castNotInterruptible = UnitCastingInfo(UNIT)
		tStart = GetTime()
		if castName then
			interrupted = false
			tradeSkill = castIsTradeSkill
			uninterruptible = castNotInterruptible
			Duration = UnitCastingDuration(UNIT)
			castBar = "Cast"
			PlayerCastLagBar(arg3, tradeSkill)
			PlayerCastSpellQueueBar(arg3, tradeSkill)
			if VCBsettings.Player.StatusBar.Color == "SpellsSchool" then helpingSchoolColor(arg3) end
		end
	elseif event == "UNIT_SPELLCAST_CHANNEL_START" and arg1 == UNIT then
		vcbColor = false
		chanName, chanText, chanTexture, _, _, chanIsTradeSkill, chanNotInterruptible, _, isEmpowered, numStages = UnitChannelInfo(UNIT)
		tChannelStart = GetTime()
		if chanName then
			interrupted = false
			tradeSkill = chanIsTradeSkill
			uninterruptible = chanNotInterruptible
			Duration = UnitChannelDuration(UNIT)
			castBar = "Channel"
			PlayerChannelLagBar(arg3, tradeSkill)
			PlayerChannelSpellQueueBar(arg3, tradeSkill)
			if VCBsettings.Player.StatusBar.Color == "SpellsSchool" then helpingSchoolColor(arg3) end
			if VCBspecialSettings.Player.Ticks then LayoutTicks(arg3) end
		end
	elseif event == "UNIT_SPELLCAST_EMPOWER_START" and arg1 == UNIT then
		vcbColor = false
		chanName, chanText, chanTexture, _, _, chanIsTradeSkill, chanNotInterruptible, _, isEmpowered, numStages = UnitChannelInfo(UNIT)
		if chanName then
			interrupted = false
			tradeSkill = chanIsTradeSkill
			uninterruptible = chanNotInterruptible
			Duration = UnitEmpoweredChannelDuration(UNIT , true)
			castBar = "Empower"
			VCBLagCastBar:Hide()
			VCBLagChannelBar:Hide()
			VCBSpellQueueCastBar:Hide()
			VCBSpellQueueChannelBar:Hide()
		end
	elseif event == "UNIT_SPELLCAST_INTERRUPTED" and arg1 == UNIT then
		interrupted = true
		tInterrupted = GetTime()
	elseif event == "UNIT_SPELLCAST_SUCCEEDED" and arg1 == UNIT then
		tSucceeded = GetTime()
		checkInterruptSpell(arg3)
		castName = UnitCastingInfo(UNIT)
		chanName = UnitChannelInfo(UNIT)
		if tSend == tSucceeded and not castName and not chanName and VCBsettings.Player.GlobalCooldown.Enable and VCBsettings.Player.GlobalCooldown.Style == "InstantCastBar" then
			local spellCooldownInfo = C_Spell.GetSpellCooldown(61304)
			if spellCooldownInfo.duration > 0 then
				local name = C_Spell.GetSpellName(arg3)
				local iconID = C_Spell.GetSpellTexture(arg3)
				vcbGlobalCooldown.Instant.textName:SetText(name)
				vcbGlobalCooldown.Instant.iconSpellLeft:SetTexture(iconID)
				vcbGlobalCooldown.Instant.iconSpellRight:SetTexture(iconID)
				if VCBsettings.Player.GlobalCooldown.Instant.StatusColor == "SpellsSchool" then helpingInstantSchoolColor(arg3) end
				local maxDuration = spellCooldownInfo.duration - (tSucceeded - lagStart)
				iEndTime = GetTime() + maxDuration
				vcbGlobalCooldown.Icon:SetAlpha(0)
				vcbGlobalCooldown.Icon:SetCooldown(GetTime(), maxDuration)
				vcbGlobalCooldown.Instant:SetMinMaxValues(0, maxDuration)
				vcbGlobalCooldown.Instant:Show()
			end
		end
	elseif event == "UNIT_SPELLCAST_SUCCEEDED" and arg1 == "pet" then
		if VDW.PlayerClassID == 9 then checkInterruptSpellPet(arg3) end
	elseif event == "UNIT_SPELLCAST_CHANNEL_UPDATE" and arg1 == UNIT then
		tChannelUpdate = GetTime()
	elseif event == "UNIT_SPELLCAST_EMPOWER_UPDATE" and arg1 == UNIT then
		tEmpowerUpdate = GetTime()
	elseif event == ("UNIT_SPELLCAST_CHANNEL_STOP" or "UNIT_SPELLCAST_STOP") and arg1 == UNIT then
		if VCBspecialSettings.Player.Ticks then
			HideTicks()
		end
	elseif event == "PLAYER_SPECIALIZATION_CHANGED" then
		VDW.VCB.chkGlobalCooldownPlayer()
	end
end
vcbGlobalCooldown:SetScript("OnEvent", EventsTime2)
