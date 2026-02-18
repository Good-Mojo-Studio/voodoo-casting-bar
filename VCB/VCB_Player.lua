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
local vcbSchool
local vcbColor = false
local vcbClass
local vcbVectorA
local vcbVectorB
-- =========================
-- extra textures
-- =========================
-- copy texture of spell's icon
local iconSpell = PlayerCastingBarFrame:CreateTexture(nil, "ARTWORK", nil, 0)
iconSpell:Hide()
-- spell's shield left
local shieldX = PlayerCastingBarFrame:GetHeight() * 2.5
local shieldY = shieldX + 4
local shieldSpellLeft = PlayerCastingBarFrame:CreateTexture(nil, "BACKGROUND", nil, 0)
shieldSpellLeft:SetAtlas("ui-castingbar-shield", false)
shieldSpellLeft:SetPoint("RIGHT", PlayerCastingBarFrame, "LEFT", -1, -2)
shieldSpellLeft:SetSize(shieldX, shieldY)
shieldSpellLeft:SetBlendMode("BLEND")
shieldSpellLeft:SetAlpha(0) -- 0.75
-- spell's shield right
local shieldSpellRight = PlayerCastingBarFrame:CreateTexture(nil, "BACKGROUND", nil, 0)
shieldSpellRight:SetAtlas("ui-castingbar-shield", false)
shieldSpellRight:SetPoint("LEFT", PlayerCastingBarFrame, "RIGHT", 1, -2)
shieldSpellRight:SetSize(shieldX, shieldY)
shieldSpellRight:SetBlendMode("BLEND")
shieldSpellRight:SetAlpha(0) -- 0.75
-- Text Border Top
local TextBorderTop = PlayerCastingBarFrame:CreateTexture(nil, "BACKGROUND", nil, -7)
TextBorderTop:SetAtlas("ui-castingbar-textbox", false)
TextBorderTop:SetPoint("TOPLEFT", PlayerCastingBarFrame, "TOPLEFT", 0, 12)
TextBorderTop:SetPoint("BOTTOMRIGHT", PlayerCastingBarFrame, "BOTTOMRIGHT", 0, 4)
TextBorderTop:SetAlpha(0.55)
TextBorderTop:Show()
-- Text Border Bottom
local TextBorderBottom = PlayerCastingBarFrame:CreateTexture(nil, "BACKGROUND", nil, -7)
TextBorderBottom:SetAtlas("ui-castingbar-textbox", false)
TextBorderBottom:SetPoint("TOPLEFT", PlayerCastingBarFrame, "TOPLEFT", 0, -4)
TextBorderBottom:SetPoint("BOTTOMRIGHT", PlayerCastingBarFrame, "BOTTOMRIGHT", 0, -12)
TextBorderBottom:SetAlpha(0.55)
TextBorderBottom:Show()
-- Spell Queue Window Bar
local function VCBSpellQueueBar(var1)
	var1:SetAtlas("UI-CastingBar-Background", false, "NEAREST")
	var1:SetHeight(PlayerCastingBarFrame:GetHeight())
	var1:SetVertexColor(0, 1, 0)
	var1:SetAlpha(0.75)
	var1:Hide()
end
-- SpellQueue Bar 1
local VCBSpellQueueCastBar = PlayerCastingBarFrame:CreateTexture(nil, "BORDER", nil, 0)
VCBSpellQueueBar(VCBSpellQueueCastBar)
-- SpellQueue Bar 2
local VCBSpellQueueChannelBar = PlayerCastingBarFrame:CreateTexture(nil, "ARTWORK", nil, 7)
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
local VCBLagCastBar = PlayerCastingBarFrame:CreateTexture(nil, "BORDER", nil, 0)
VCBlagBars(VCBLagCastBar)
-- Lag Bar 2 --
local VCBLagChannelBar = PlayerCastingBarFrame:CreateTexture(nil, "ARTWORK", nil, 7)
VCBlagBars(VCBLagChannelBar)
-- textures of the class icon
local function ClassIcon(self)
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
-- textures of the factions icon
local function FactionIcon(self)
	if VDW.PlayerFactionInfo.groupTag == "Alliance" then
		self:SetSwipeTexture("Interface\\ICONS\\UI_AllianceIcon-round.blp")
	elseif VDW.PlayerFactionInfo.groupTag == "Horde" then
		self:SetSwipeTexture("Interface\\ICONS\\UI_HordeIcon-round.blp")
	end
	vcbVectorA = CreateVector2D(0, 0)
	vcbVectorB = CreateVector2D(1, 1)
	self:SetTexCoordRange(vcbVectorA, vcbVectorB)
end
-- create Ticks
local function CreateTicks(number, var1)
	local spaceTick = PlayerCastingBarFrame:GetWidth() / number
	if VCBspecialSettings.Player.Ticks.Style == G.OPTIONS_S_MODERN then
		for i = 1, number, 1 do
			local tick = PlayerCastingBarFrame:CreateTexture("vcb"..var1.."Tick"..i, "OVERLAY", nil, 7)
			tick:SetAtlas("ui-castingbar-empower-cursor", false)
			tick:SetDesaturated(false)
			tick:SetHeight(PlayerCastingBarFrame:GetHeight())
			tick:SetWidth(12)
			tick:SetVertexColor(1, 1, 1, 1)
			tick:SetBlendMode("BLEND")
			if i == 1 then
				tick:ClearAllPoints()
				tick:SetPoint("CENTER", PlayerCastingBarFrame, "LEFT", 0, 0)
			else
				tick:ClearAllPoints()
				tick:SetPoint("LEFT", "vcb"..var1.."Tick"..i-1, "LEFT", spaceTick, 0)
			end
			tick:Hide()
		end
	elseif VCBspecialSettings.Player.Ticks.Style == G.OPTIONS_S_CLASSIC then
		for i = 1, number, 1 do
			local tick = PlayerCastingBarFrame:CreateTexture("vcb"..var1.."Tick"..i, "OVERLAY", nil, 7)
			tick:SetAtlas("!Tooltip-Azerite-NineSlice-EdgeLeft", false)
			tick:SetDesaturated(true)
			tick:SetHeight(PlayerCastingBarFrame:GetHeight())
			tick:SetWidth(8)
			tick:SetVertexColor(0.9, 0.9, 0.9, 0.8)
			tick:SetBlendMode("BLEND")
			if i == 1 then
				tick:ClearAllPoints()
				tick:SetPoint("CENTER", PlayerCastingBarFrame, "LEFT", 0, 0)
			else
				tick:ClearAllPoints()
				tick:SetPoint("LEFT", "vcb"..var1.."Tick"..i-1, "LEFT", spaceTick, 0)
			end
			tick:Hide()
		end
	end
end
-- Show Ticks
local function ShowTicks(number, var1)
	for i = 1, number, 1 do
		_G["vcb"..var1.."Tick"..i]:Show()
	end
end
-- Hide Ticks
local function HideTicks(number, var1)
	for i = 1, number, 1 do
		_G["vcb"..var1.."Tick"..i]:Hide()
	end
end
-- Priest
local function ShowPriestTicks(arg3)
-- Mind Flay, Insanity
	if arg3 == 391403 or arg3 == 47540 then
		ShowTicks(4, 1)
-- Void Torrent, Divine Hymn, Symbol of Hope
	elseif arg3 == 263165 or arg3 == 64843 or arg3 == 64901 then
		ShowTicks(5, 2)
-- Mind Flay
	elseif arg3 == 15407 then
		ShowTicks(6, 3)
	end
end
-- Mage
local function ShowMageTicks(arg3)
-- Covenant: Shifting Power
	if arg3 == 314791 then
		ShowTicks(4, 1)
-- Arcane Missiles, Ray of Frost
	elseif arg3 == 5143 or arg3 == 205021 then
		ShowTicks(5, 2)
	end
end
-- Warlock
local function ShowWarlockTicks(arg3)
-- Drain Life, Drain Soul, Health Funnel
	if arg3 == 234153 or arg3 == 198590 or arg3 == 217979 then
		ShowTicks(5, 1)
	end
end
-- Monk
local function ShowMonkTicks(arg3)
-- Essence Font, Spinning Crane Kick
	if arg3 == 191837 or arg3 == 101546 then
		ShowTicks(3, 1)
-- Crackling Jade Lightning, Fists of Fury
	elseif arg3 == 117952 or arg3 == 113656 then
		ShowTicks(4, 2)
-- Soothing Mist
	elseif arg3 == 115175 then
		ShowTicks(8, 3)
	end
end
-- Druid
local function ShowDruidTicks(arg3)
-- Tranquility
	if arg3 == 740 then
		ShowTicks(4, 1)
	end
end
-- Evoker
local function ShowEvokerTicks()
-- Disintegrate
	if vcbEvokerTicksFirstTime then
		for i = 1, 3, 1 do
			_G["vcb"..var1.."Tick"..i]:Show()
		end
	elseif vcbEvokerTicksSecondTime then
		for i = 1, 4, 1 do
			_G["vcb"..var1.."Tick"..i]:Show()
		end
	end
end
-- Create the Ticks
local function vcbCreateTicks()
	if VDW.PlayerClassID == 5 then --Priest
		CreateTicks(4, 1)
		CreateTicks(5, 2)
		CreateTicks(6, 3)
	elseif VDW.PlayerClassID == 8 then --Mage
		CreateTicks(4, 1)
		CreateTicks(5, 2)
	elseif VDW.PlayerClassID == 9 then --Warlock
		CreateTicks(5, 1)
	elseif VDW.PlayerClassID == 10 then --Monk
		CreateTicks(3, 1)
		CreateTicks(4, 2)
		CreateTicks(8, 3)
	elseif VDW.PlayerClassID == 11 then --Druid
		CreateTicks(4, 1)
	elseif VDW.PlayerClassID == 13 then --Evoker
		CreateTicks(3, 1)
		CreateTicks(4, 2)
	end
end
-- Show the Ticks
local function vcbShowTicks(arg3)
	if VDW.PlayerClassID == 5 then ShowPriestTicks(arg3)
	elseif VDW.PlayerClassID == 8 then ShowMageTicks(arg3)
	elseif VDW.PlayerClassID == 9 then ShowWarlockTicks(arg3)
	elseif VDW.PlayerClassID == 10 then ShowMonkTicks(arg3)
	elseif VDW.PlayerClassID == 11 then ShowDruidTicks(arg3)
	elseif VDW.PlayerClassID == 13 then ShowEvokerTicks()
	end
end
-- Hide the Ticks
local function vcbHideTicks()
	if VDW.PlayerClassID == 5 then --Priest
		HideTicks(4, 1)
		HideTicks(5, 2)
		HideTicks(6, 3)
	elseif VDW.PlayerClassID == 8 then --Mage
		HideTicks(4, 1)
		HideTicks(5, 2)
	elseif VDW.PlayerClassID == 9 then --Warlock
		HideTicks(5, 1)
	elseif VDW.PlayerClassID == 10 then --Monk
		HideTicks(3, 1)
		HideTicks(4, 2)
		HideTicks(8, 3)
	elseif VDW.PlayerClassID == 11 then --Druid
		HideTicks(4, 1)
	elseif VDW.PlayerClassID == 13 then --Evoker
		HideTicks(3, 1)
		HideTicks(4, 2)
	end
end
-- =========================
-- extra texts
-- =========================
-- function for the texts --
local function Texts(var1)
	var1:SetFontObject("GameFontHighlightSmall")
	var1:Hide()
end
-- creating the texts --
local textName = PlayerCastingBarFrame:CreateFontString(nil, "OVERLAY", nil)
Texts(textName)
local textCurrent = PlayerCastingBarFrame:CreateFontString(nil, "OVERLAY", nil)
Texts(textCurrent)
local textBoth = PlayerCastingBarFrame:CreateFontString(nil, "OVERLAY", nil)
Texts(textBoth)
local textTotal = PlayerCastingBarFrame:CreateFontString(nil, "OVERLAY", nil)
Texts(textTotal)
-- =========================
-- functions protect the options
-- =========================
local function ProtectOptions()
	local loc = GetLocale()
	if loc ~= VCBspecialSettings.LastLocation then
		for k, v in pairs(VDW.Local.Translate) do
			for i, s in pairs (v) do
				if VCBsettings.Player.Icon.Position == s then
					VCBsettings.Player.Icon.Position = VDW.Local.Translate[loc][i]
				end
				if VCBsettings.Player.Shield.Position == s then
					VCBsettings.Player.Shield.Position = VDW.Local.Translate[loc][i]
				end
				if VCBsettings.Player.TextBorder.Position == s then
					VCBsettings.Player.TextBorder.Position = VDW.Local.Translate[loc][i]
				end
				if VCBsettings.Player.NameText.Position == s then
					VCBsettings.Player.NameText.Position = VDW.Local.Translate[loc][i]
				end
				if VCBsettings.Player.CurrentTimeText.Position == s then
					VCBsettings.Player.CurrentTimeText.Position = VDW.Local.Translate[loc][i]
				end
				if VCBsettings.Player.BothTimeText.Position == s then
					VCBsettings.Player.BothTimeText.Position = VDW.Local.Translate[loc][i]
				end
				if VCBsettings.Player.TotalTimeText.Position == s then
					VCBsettings.Player.TotalTimeText.Position = VDW.Local.Translate[loc][i]
				end
				if VCBsettings.Player.CurrentTimeText.Direction == s then
					VCBsettings.Player.CurrentTimeText.Direction = VDW.Local.Translate[loc][i]
				end
				if VCBsettings.Player.BothTimeText.Direction == s then
					VCBsettings.Player.BothTimeText.Direction = VDW.Local.Translate[loc][i]
				end
				if VCBsettings.Player.CurrentTimeText.Sec == s then
					VCBsettings.Player.CurrentTimeText.Sec = VDW.Local.Translate[loc][i]
				end
				if VCBsettings.Player.BothTimeText.Sec == s then
					VCBsettings.Player.BothTimeText.Sec = VDW.Local.Translate[loc][i]
				end
				if VCBsettings.Player.TotalTimeText.Sec == s then
					VCBsettings.Player.TotalTimeText.Sec = VDW.Local.Translate[loc][i]
				end
				if VCBsettings.Player.StatusBar.Color == s then
					VCBsettings.Player.StatusBar.Color = VDW.Local.Translate[loc][i]
				end
				if VCBsettings.Player.StatusBar.Style == s then
					VCBsettings.Player.StatusBar.Style = VDW.Local.Translate[loc][i]
				end
				if VCBsettings.Player.Border.Color == s then
					VCBsettings.Player.Border.Color = VDW.Local.Translate[loc][i]
				end
				if VCBsettings.Player.Border.Style == s then
					VCBsettings.Player.Border.Style = VDW.Local.Translate[loc][i]
				end
				if VCBsettings.Player.LagBar.Visibility == s then
					VCBsettings.Player.LagBar.Visibility = VDW.Local.Translate[loc][i]
				end
				if VCBsettings.Player.QueueBar.Visibility == s then
					VCBsettings.Player.QueueBar.Visibility = VDW.Local.Translate[loc][i]
				end
				if VCBsettings.Player.GCD.Style == s then
					VCBsettings.Player.GCD.Style = VDW.Local.Translate[loc][i]
				end
				if VCBsettings.Player.GCD.Position == s then
					VCBsettings.Player.GCD.Position = VDW.Local.Translate[loc][i]
				end
				if VCBspecialSettings.Player.Ticks.Style == s then
					VCBspecialSettings.Player.Ticks.Style = VDW.Local.Translate[loc][i]
				end
			end
		end
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
	if VCBsettings.Player.Icon.Position == G.OPTIONS_V_HIDE then
		function iconPosition(self)
			if self.Icon:IsShown() then self.Icon:Hide() end
			if iconSpell:IsShown() then iconSpell:Hide() end
		end
	elseif VCBsettings.Player.Icon.Position == G.OPTIONS_P_LEFT then
		function iconPosition(self)
			self.Icon:ClearAllPoints()
			self.Icon:SetPoint("TOPLEFT", shieldSpellLeft, "TOPLEFT", 6, -6)
			self.Icon:SetPoint("BOTTOMRIGHT", shieldSpellLeft, "BOTTOMRIGHT", -6, 10)
			if not self.Icon:IsShown() then self.Icon:Show() end
			if iconSpell:IsShown() then iconSpell:Hide() end
		end
	elseif VCBsettings.Player.Icon.Position == G.OPTIONS_P_RIGHT then
		function iconPosition(self)
			if self.Icon:IsShown() then self.Icon:Hide() end
			iconSpell:ClearAllPoints()
			iconSpell:SetPoint("TOPLEFT", shieldSpellRight, "TOPLEFT", 6, -6)
			iconSpell:SetPoint("BOTTOMRIGHT", shieldSpellRight, "BOTTOMRIGHT", -6, 10)
			iconSpell:SetTexture(self.Icon:GetTextureFileID())
			if not iconSpell:IsShown() then iconSpell:Show() end
		end
	elseif VCBsettings.Player.Icon.Position == G.OPTIONS_P_BOTH then
		function iconPosition(self)
			self.Icon:ClearAllPoints()
			self.Icon:SetPoint("TOPLEFT", shieldSpellLeft, "TOPLEFT", 6, -6)
			self.Icon:SetPoint("BOTTOMRIGHT", shieldSpellLeft, "BOTTOMRIGHT", -6, 10)
			if not self.Icon:IsShown() then self.Icon:Show() end
			iconSpell:ClearAllPoints()
			iconSpell:SetPoint("TOPLEFT", shieldSpellRight, "TOPLEFT", 6, -6)
			iconSpell:SetPoint("BOTTOMRIGHT", shieldSpellRight, "BOTTOMRIGHT", -6, 10)
			iconSpell:SetTexture(self.Icon:GetTextureFileID())
			if not iconSpell:IsShown() then iconSpell:Show() end
		end
	end
end
-- check shield
function VDW.VCB.chkPlayerShieldPosition()
	if VCBsettings.Player.Shield.Position == G.OPTIONS_V_HIDE then
		function shieldPosition(uninterruptible)
			shieldSpellLeft:SetAlpha(0)
			shieldSpellRight:SetAlpha(0)
		end
	elseif VCBsettings.Player.Shield.Position == G.OPTIONS_P_LEFT then
		function shieldPosition(uninterruptible)
			shieldSpellLeft:SetAlphaFromBoolean(uninterruptible, 150, 0)
			shieldSpellRight:SetAlpha(0)
		end
	elseif VCBsettings.Player.Shield.Position == G.OPTIONS_P_RIGHT then
		function shieldPosition(uninterruptible)
			shieldSpellLeft:SetAlpha(0)
			shieldSpellRight:SetAlphaFromBoolean(uninterruptible, 150, 0)
		end
	elseif VCBsettings.Player.Shield.Position == G.OPTIONS_P_BOTH then
		function shieldPosition(uninterruptible)
			shieldSpellLeft:SetAlphaFromBoolean(uninterruptible, 150, 0)
			shieldSpellRight:SetAlphaFromBoolean(uninterruptible, 150, 0)
		end
	end
end
-- check text border
function VDW.VCB.chkPlayerBorderTextPosition()
	if VCBsettings.Player.BorderText.Position == G.OPTIONS_V_HIDE then
		function bordertextPosition ()
			TextBorderTop:Hide()
			TextBorderBottom:Hide()
		end
	elseif VCBsettings.Player.BorderText.Position == G.OPTIONS_P_TOP then
		function bordertextPosition()
			TextBorderTop:Show()
			TextBorderBottom:Hide()
		end
	elseif VCBsettings.Player.BorderText.Position == G.OPTIONS_P_BOTTOM then
		function bordertextPosition()
			TextBorderTop:Hide()
			TextBorderBottom:Show()
		end
	elseif VCBsettings.Player.BorderText.Position == G.OPTIONS_P_BOTH then
		function bordertextPosition()
			TextBorderTop:Show()
			TextBorderBottom:Show()
		end
	end
end
-- check name text position
function VDW.VCB.chkNameTxtPlayer()
	if VCBsettings.Player.NameText.Position == G.OPTIONS_V_HIDE then
		function namePosition(self)
			if textName:IsShown() then textName:Hide() end
		end
	elseif VCBsettings.Player.NameText.Position == G.OPTIONS_P_TOPLEFT then
		function namePosition(self)
			textName:ClearAllPoints()
			textName:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 4, 1)
			textName:SetJustifyH("LEFT")
			if not textName:IsShown() then textName:Show() end
		end
	elseif VCBsettings.Player.NameText.Position == G.OPTIONS_P_LEFT then
		function namePosition(self)
			textName:ClearAllPoints()
			textName:SetPoint("LEFT", self, "LEFT", 4, 0)
			textName:SetJustifyH("LEFT")
			if not textName:IsShown() then textName:Show() end
		end
	elseif VCBsettings.Player.NameText.Position == G.OPTIONS_P_BOTTOMLEFT then
		function namePosition(self)
			textName:ClearAllPoints()
			textName:SetPoint("TOPLEFT", self, "BOTTOMLEFT", 4, -1)
			textName:SetJustifyH("LEFT")
			if not textName:IsShown() then textName:Show() end
		end
	elseif VCBsettings.Player.NameText.Position == G.OPTIONS_P_TOP then
		function namePosition(self)
			textName:ClearAllPoints()
			textName:SetPoint("BOTTOM", self, "TOP", 0, 1)
			textName:SetJustifyH("CENTER")
			if not textName:IsShown() then textName:Show() end
		end
	elseif VCBsettings.Player.NameText.Position == G.OPTIONS_P_CENTER then
		function namePosition(self)
			textName:ClearAllPoints()
			textName:SetPoint("CENTER", self, "CENTER", 0, 0)
			textName:SetJustifyH("CENTER")
			if not textName:IsShown() then textName:Show() end
		end
	elseif VCBsettings.Player.NameText.Position == G.OPTIONS_P_BOTTOM then
		function namePosition(self)
			textName:ClearAllPoints()
			textName:SetPoint("TOP", self, "BOTTOM", 0, -1)
			textName:SetJustifyH("CENTER")
			if not textName:IsShown() then textName:Show() end
		end
	elseif VCBsettings.Player.NameText.Position == G.OPTIONS_P_TOPRIGHT then
		function namePosition(self)
			textName:ClearAllPoints()
			textName:SetPoint("BOTTOMRIGHT", self, "TOPRIGHT", -4, 1)
			textName:SetJustifyH("RIGHT")
			if not textName:IsShown() then textName:Show() end
		end
	elseif VCBsettings.Player.NameText.Position == G.OPTIONS_P_RIGHT then
		function namePosition(self)
			textName:ClearAllPoints()
			textName:SetPoint("RIGHT", self, "RIGHT", -4, 0)
			textName:SetJustifyH("RIGHT")
			if not textName:IsShown() then textName:Show() end
		end
	elseif VCBsettings.Player.NameText.Position == G.OPTIONS_P_BOTTOMRIGHT then
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
	if VCBsettings.Player.CurrentTimeText.Position == G.OPTIONS_V_HIDE then
		function currentPostion(self)
			if textCurrent:IsShown() then textCurrent:Hide() end
		end
	elseif VCBsettings.Player.CurrentTimeText.Position == G.OPTIONS_P_TOPLEFT then
		function currentPostion(self)
			textCurrent:ClearAllPoints()
			textCurrent:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 4, 1)
			if not textCurrent:IsShown() then textCurrent:Show() end
		end
	elseif VCBsettings.Player.CurrentTimeText.Position == G.OPTIONS_P_LEFT then
		function currentPostion(self)
			textCurrent:ClearAllPoints()
			textCurrent:SetPoint("LEFT", self, "LEFT", 4, 0)
			if not textCurrent:IsShown() then textCurrent:Show() end
		end
	elseif VCBsettings.Player.CurrentTimeText.Position == G.OPTIONS_P_BOTTOMLEFT then
		function currentPostion(self)
			textCurrent:ClearAllPoints()
			textCurrent:SetPoint("TOPLEFT", self, "BOTTOMLEFT", 4, -1)
			if not textCurrent:IsShown() then textCurrent:Show() end
		end
	elseif VCBsettings.Player.CurrentTimeText.Position == G.OPTIONS_P_TOP then
		function currentPostion(self)
			textCurrent:ClearAllPoints()
			textCurrent:SetPoint("BOTTOM", self, "TOP", 0, 1)
			if not textCurrent:IsShown() then textCurrent:Show() end
		end
	elseif VCBsettings.Player.CurrentTimeText.Position == G.OPTIONS_P_CENTER then
		function currentPostion(self)
			textCurrent:ClearAllPoints()
			textCurrent:SetPoint("CENTER", self, "CENTER", 0, 0)
			if not textCurrent:IsShown() then textCurrent:Show() end
		end
	elseif VCBsettings.Player.CurrentTimeText.Position == G.OPTIONS_P_BOTTOM then
		function currentPostion(self)
			textCurrent:ClearAllPoints()
			textCurrent:SetPoint("TOP", self, "BOTTOM", 0, -1)
			if not textCurrent:IsShown() then textCurrent:Show() end
		end
	elseif VCBsettings.Player.CurrentTimeText.Position == G.OPTIONS_P_TOPRIGHT then
		function currentPostion(self)
			textCurrent:ClearAllPoints()
			textCurrent:SetPoint("BOTTOMRIGHT", self, "TOPRIGHT", -4, 1)
			if not textCurrent:IsShown() then textCurrent:Show() end
		end
	elseif VCBsettings.Player.CurrentTimeText.Position == G.OPTIONS_P_RIGHT then
		function currentPostion(self)
			textCurrent:ClearAllPoints()
			textCurrent:SetPoint("RIGHT", self, "RIGHT", -4, 0)
			if not textCurrent:IsShown() then textCurrent:Show() end
		end
	elseif VCBsettings.Player.CurrentTimeText.Position == G.OPTIONS_P_BOTTOMRIGHT then
		function currentPostion(self)
			textCurrent:ClearAllPoints()
			textCurrent:SetPoint("TOPRIGHT", self, "BOTTOMRIGHT", -4, -1)
			if not textCurrent:IsShown() then textCurrent:Show() end
		end
	end
end
-- check both casting time text position
function VDW.VCB.chkBothTxtPlayer()
	if VCBsettings.Player.BothTimeText.Position == G.OPTIONS_V_HIDE then
		function bothPostion(self)
			if textBoth:IsShown() then textBoth:Hide() end
		end
	elseif VCBsettings.Player.BothTimeText.Position == G.OPTIONS_P_TOPLEFT then
		function bothPostion(self)
			textBoth:ClearAllPoints()
			textBoth:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 4, 1)
			if not textBoth:IsShown() then textBoth:Show() end
		end
	elseif VCBsettings.Player.BothTimeText.Position == G.OPTIONS_P_LEFT then
		function bothPostion(self)
			textBoth:ClearAllPoints()
			textBoth:SetPoint("LEFT", self, "LEFT", 4, 0)
			if not textBoth:IsShown() then textBoth:Show() end
		end
	elseif VCBsettings.Player.BothTimeText.Position == G.OPTIONS_P_BOTTOMLEFT then
		function bothPostion(self)
			textBoth:ClearAllPoints()
			textBoth:SetPoint("TOPLEFT", self, "BOTTOMLEFT", 4, -1)
			if not textBoth:IsShown() then textBoth:Show() end
		end
	elseif VCBsettings.Player.BothTimeText.Position == G.OPTIONS_P_TOP then
		function bothPostion(self)
			textBoth:ClearAllPoints()
			textBoth:SetPoint("BOTTOM", self, "TOP", 0, 1)
			if not textBoth:IsShown() then textBoth:Show() end
		end
	elseif VCBsettings.Player.BothTimeText.Position == G.OPTIONS_P_CENTER then
		function bothPostion(self)
			textBoth:ClearAllPoints()
			textBoth:SetPoint("CENTER", self, "CENTER", 0, 0)
			if not textBoth:IsShown() then textBoth:Show() end
		end
	elseif VCBsettings.Player.BothTimeText.Position == G.OPTIONS_P_BOTTOM then
		function bothPostion(self)
			textBoth:ClearAllPoints()
			textBoth:SetPoint("TOP", self, "BOTTOM", 0, -1)
			if not textBoth:IsShown() then textBoth:Show() end
		end
	elseif VCBsettings.Player.BothTimeText.Position == G.OPTIONS_P_TOPRIGHT then
		function bothPostion(self)
			textBoth:ClearAllPoints()
			textBoth:SetPoint("BOTTOMRIGHT", self, "TOPRIGHT", -4, 1)
			if not textBoth:IsShown() then textBoth:Show() end
		end
	elseif VCBsettings.Player.BothTimeText.Position == G.OPTIONS_P_RIGHT then
		function bothPostion(self)
			textBoth:ClearAllPoints()
			textBoth:SetPoint("RIGHT", self, "RIGHT", -4, 0)
			if not textBoth:IsShown() then textBoth:Show() end
		end
	elseif VCBsettings.Player.BothTimeText.Position == G.OPTIONS_P_BOTTOMRIGHT then
		function bothPostion(self)
			textBoth:ClearAllPoints()
			textBoth:SetPoint("TOPRIGHT", self, "BOTTOMRIGHT", -4, -1)
			if not textBoth:IsShown() then textBoth:Show() end
		end
	end
end
-- check total casting time text position
function VDW.VCB.chkTotalTxtPlayer()
	if VCBsettings.Player.TotalTimeText.Position == G.OPTIONS_V_HIDE then
		function totalPostion(self)
			if textTotal:IsShown() then textTotal:Hide() end
		end
	elseif VCBsettings.Player.TotalTimeText.Position == G.OPTIONS_P_TOPLEFT then
		function totalPostion(self)
			textTotal:ClearAllPoints()
			textTotal:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 4, 1)
			if not textTotal:IsShown() then textTotal:Show() end
		end
	elseif VCBsettings.Player.TotalTimeText.Position == G.OPTIONS_P_LEFT then
		function totalPostion(self)
			textTotal:ClearAllPoints()
			textTotal:SetPoint("LEFT", self, "LEFT", 4, 0)
			if not textTotal:IsShown() then textTotal:Show() end
		end
	elseif VCBsettings.Player.TotalTimeText.Position == G.OPTIONS_P_BOTTOMLEFT then
		function totalPostion(self)
			textTotal:ClearAllPoints()
			textTotal:SetPoint("TOPLEFT", self, "BOTTOMLEFT", 4, -1)
			if not textTotal:IsShown() then textTotal:Show() end
		end
	elseif VCBsettings.Player.TotalTimeText.Position == G.OPTIONS_P_TOP then
		function totalPostion(self)
			textTotal:ClearAllPoints()
			textTotal:SetPoint("BOTTOM", self, "TOP", 0, 1)
			if not textTotal:IsShown() then textTotal:Show() end
		end
	elseif VCBsettings.Player.TotalTimeText.Position == G.OPTIONS_P_CENTER then
		function totalPostion(self)
			textTotal:ClearAllPoints()
			textTotal:SetPoint("CENTER", self, "CENTER", 0, 0)
			if not textTotal:IsShown() then textTotal:Show() end
		end
	elseif VCBsettings.Player.TotalTimeText.Position == G.OPTIONS_P_BOTTOM then
		function totalPostion(self)
			textTotal:ClearAllPoints()
			textTotal:SetPoint("TOP", self, "BOTTOM", 0, -1)
			if not textTotal:IsShown() then textTotal:Show() end
		end
	elseif VCBsettings.Player.TotalTimeText.Position == G.OPTIONS_P_TOPRIGHT then
		function totalPostion(self)
			textTotal:ClearAllPoints()
			textTotal:SetPoint("BOTTOMRIGHT", self, "TOPRIGHT", -4, 1)
			if not textTotal:IsShown() then textTotal:Show() end
		end
	elseif VCBsettings.Player.TotalTimeText.Position == G.OPTIONS_P_RIGHT then
		function totalPostion(self)
			textTotal:ClearAllPoints()
			textTotal:SetPoint("RIGHT", self, "RIGHT", -4, 0)
			if not textTotal:IsShown() then textTotal:Show() end
		end
	elseif VCBsettings.Player.TotalTimeText.Position == G.OPTIONS_P_BOTTOMRIGHT then
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
	if VCBsettings.Player.CurrentTimeText.Position ~= G.OPTIONS_V_HIDE then
		if VCBsettings.Player.CurrentTimeText.Sec == G.OPTIONS_V_HIDE then
			if VCBsettings.Player.CurrentTimeText.Decimals == "0" then
				if VCBsettings.Player.CurrentTimeText.Direction == G.OPTIONS_D_ASCENDING then
					function currentUpdate(self)
						textCurrent:SetText(string.format("%.0f", Duration:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Player.CurrentTimeText.Direction == G.OPTIONS_D_DESCENDING then
					function currentUpdate(self)
						textCurrent:SetText(string.format("%.0f", Duration:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Player.CurrentTimeText.Direction == G.OPTIONS_P_BOTH then
					function currentUpdate(self)
						if castBar == "Cast" or castBar == "Empower" then
							textCurrent:SetText(string.format("%.0f", Duration:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
						elseif castBar == "Channel" then
							textCurrent:SetText(string.format("%.0f", Duration:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			elseif VCBsettings.Player.CurrentTimeText.Decimals == "1" then
				if VCBsettings.Player.CurrentTimeText.Direction == G.OPTIONS_D_ASCENDING then
					function currentUpdate(self)
						textCurrent:SetText(string.format("%.1f", Duration:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Player.CurrentTimeText.Direction == G.OPTIONS_D_DESCENDING then
					function currentUpdate(self)
						textCurrent:SetText(string.format("%.1f", Duration:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Player.CurrentTimeText.Direction == G.OPTIONS_P_BOTH then
					function currentUpdate(self)
						if castBar == "Cast" or castBar == "Empower" then
							textCurrent:SetText(string.format("%.1f", Duration:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
						elseif castBar == "Channel" then
							textCurrent:SetText(string.format("%.1f", Duration:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			elseif VCBsettings.Player.CurrentTimeText.Decimals == "2" then
				if VCBsettings.Player.CurrentTimeText.Direction == G.OPTIONS_D_ASCENDING then
					function currentUpdate(self)
						textCurrent:SetText(string.format("%.2f", Duration:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Player.CurrentTimeText.Direction == G.OPTIONS_D_DESCENDING then
					function currentUpdate(self)
						textCurrent:SetText(string.format("%.2f", Duration:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Player.CurrentTimeText.Direction == G.OPTIONS_P_BOTH then
					function currentUpdate(self)
						if castBar == "Cast" or castBar == "Empower" then
							textCurrent:SetText(string.format("%.2f", Duration:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
						elseif castBar == "Channel" then
							textCurrent:SetText(string.format("%.2f", Duration:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			elseif VCBsettings.Player.CurrentTimeText.Decimals == "3" then
				if VCBsettings.Player.CurrentTimeText.Direction == G.OPTIONS_D_ASCENDING then
					function currentUpdate(self)
						textCurrent:SetText(string.format("%.3f", Duration:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Player.CurrentTimeText.Direction == G.OPTIONS_D_DESCENDING then
					function currentUpdate(self)
						textCurrent:SetText(string.format("%.3f", Duration:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Player.CurrentTimeText.Direction == G.OPTIONS_P_BOTH then
					function currentUpdate(self)
						if castBar == "Cast" or castBar == "Empower" then
							textCurrent:SetText(string.format("%.3f", Duration:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
						elseif castBar == "Channel" then
							textCurrent:SetText(string.format("%.3f", Duration:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			end
		elseif VCBsettings.Player.CurrentTimeText.Sec == G.OPTIONS_V_SHOW then
			if VCBsettings.Player.CurrentTimeText.Decimals == "0" then
				if VCBsettings.Player.CurrentTimeText.Direction == G.OPTIONS_D_ASCENDING then
					function currentUpdate(self)
						textCurrent:SetText(string.format("%.0f Sec", Duration:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Player.CurrentTimeText.Direction == G.OPTIONS_D_DESCENDING then
					function currentUpdate(self)
						textCurrent:SetText(string.format("%.0f Sec", Duration:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Player.CurrentTimeText.Direction == G.OPTIONS_P_BOTH then
					function currentUpdate(self)
						if castBar == "Cast" or castBar == "Empower" then
							textCurrent:SetText(string.format("%.0f Sec", Duration:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
						elseif castBar == "Channel" then
							textCurrent:SetText(string.format("%.0f Sec", Duration:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			elseif VCBsettings.Player.CurrentTimeText.Decimals == "1" then
				if VCBsettings.Player.CurrentTimeText.Direction == G.OPTIONS_D_ASCENDING then
					function currentUpdate(self)
						textCurrent:SetText(string.format("%.1f Sec", Duration:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Player.CurrentTimeText.Direction == G.OPTIONS_D_DESCENDING then
					function currentUpdate(self)
						textCurrent:SetText(string.format("%.1f Sec", Duration:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Player.CurrentTimeText.Direction == G.OPTIONS_P_BOTH then
					function currentUpdate(self)
						if castBar == "Cast" or castBar == "Empower" then
							textCurrent:SetText(string.format("%.1f Sec", Duration:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
						elseif castBar == "Channel" then
							textCurrent:SetText(string.format("%.1f Sec", Duration:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			elseif VCBsettings.Player.CurrentTimeText.Decimals == "2" then
				if VCBsettings.Player.CurrentTimeText.Direction == G.OPTIONS_D_ASCENDING then
					function currentUpdate(self)
						textCurrent:SetText(string.format("%.2f Sec", Duration:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Player.CurrentTimeText.Direction == G.OPTIONS_D_DESCENDING then
					function currentUpdate(self)
						textCurrent:SetText(string.format("%.2f Sec", Duration:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Player.CurrentTimeText.Direction == G.OPTIONS_P_BOTH then
					function currentUpdate(self)
						if castBar == "Cast" or castBar == "Empower" then
							textCurrent:SetText(string.format("%.2f Sec", Duration:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
						elseif castBar == "Channel" then
							textCurrent:SetText(string.format("%.2f Sec", Duration:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			elseif VCBsettings.Player.CurrentTimeText.Decimals == "3" then
				if VCBsettings.Player.CurrentTimeText.Direction == G.OPTIONS_D_ASCENDING then
					function currentUpdate(self)
						textCurrent:SetText(string.format("%.3f Sec", Duration:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Player.CurrentTimeText.Direction == G.OPTIONS_D_DESCENDING then
					function currentUpdate(self)
						textCurrent:SetText(string.format("%.3f Sec", Duration:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Player.CurrentTimeText.Direction == G.OPTIONS_P_BOTH then
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
	elseif VCBsettings.Player.CurrentTimeText.Position == G.OPTIONS_V_HIDE then
		function currentUpdate(self)
			return
		end
	end
end
-- check both casting time update
function VDW.VCB.chkBothUpdPlayer()
	if VCBsettings.Player.BothTimeText.Position ~= G.OPTIONS_V_HIDE then
		if VCBsettings.Player.BothTimeText.Sec == G.OPTIONS_V_HIDE then
			if VCBsettings.Player.BothTimeText.Decimals == "0" then
				if VCBsettings.Player.BothTimeText.Direction == G.OPTIONS_D_ASCENDING then
					function bothUpdate(self)
						textBoth:SetText(string.format("%.0f / %.0f", Duration:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Player.BothTimeText.Direction == G.OPTIONS_D_DESCENDING then
					function bothUpdate(self)
						textBoth:SetText(string.format("%.0f / %.0f", Duration:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Player.BothTimeText.Direction == G.OPTIONS_P_BOTH then
					function bothUpdate(self)
						if castBar == "Cast" or castBar == "Empower" then
							textBoth:SetText(string.format("%.0f / %.0f", Duration:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						elseif castBar == "Channel" then
							textBoth:SetText(string.format("%.0f / %.0f", Duration:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			elseif VCBsettings.Player.BothTimeText.Decimals == "1" then
				if VCBsettings.Player.BothTimeText.Direction == G.OPTIONS_D_ASCENDING then
					function bothUpdate(self)
						textBoth:SetText(string.format("%.1f / %.1f", Duration:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Player.BothTimeText.Direction == G.OPTIONS_D_DESCENDING then
					function bothUpdate(self)
						textBoth:SetText(string.format("%.1f / %.1f", Duration:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Player.BothTimeText.Direction == G.OPTIONS_P_BOTH then
					function bothUpdate(self)
						if castBar == "Cast" or castBar == "Empower" then
							textBoth:SetText(string.format("%.1f / %.1f", Duration:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						elseif castBar == "Channel" then
							textBoth:SetText(string.format("%.1f / %.1f", Duration:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			elseif VCBsettings.Player.BothTimeText.Decimals == "2" then
				if VCBsettings.Player.BothTimeText.Direction == G.OPTIONS_D_ASCENDING then
					function bothUpdate(self)
						textBoth:SetText(string.format("%.2f / %.2f", Duration:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Player.BothTimeText.Direction == G.OPTIONS_D_DESCENDING then
					function bothUpdate(self)
						textBoth:SetText(string.format("%.2f / %.2f", Duration:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Player.BothTimeText.Direction == G.OPTIONS_P_BOTH then
					function bothUpdate(self)
						if castBar == "Cast" or castBar == "Empower" then
							textBoth:SetText(string.format("%.2f / %.2f", Duration:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						elseif castBar == "Channel" then
							textBoth:SetText(string.format("%.2f / %.2f", Duration:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			elseif VCBsettings.Player.BothTimeText.Decimals == "3" then
				if VCBsettings.Player.BothTimeText.Direction == G.OPTIONS_D_ASCENDING then
					function bothUpdate(self)
						textBoth:SetText(string.format("%.3f / %.3f", Duration:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Player.BothTimeText.Direction == G.OPTIONS_D_DESCENDING then
					function bothUpdate(self)
						textBoth:SetText(string.format("%.3f / %.3f", Duration:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Player.BothTimeText.Direction == G.OPTIONS_P_BOTH then
					function bothUpdate(self)
						if castBar == "Cast" or castBar == "Empower" then
							textBoth:SetText(string.format("%.3f", Duration:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						elseif castBar == "Channel" then
							textBoth:SetText(string.format("%.3f / %.3f", Duration:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			end
		elseif VCBsettings.Player.BothTimeText.Sec == G.OPTIONS_V_SHOW then
			if VCBsettings.Player.BothTimeText.Decimals == "0" then
				if VCBsettings.Player.BothTimeText.Direction == G.OPTIONS_D_ASCENDING then
					function bothUpdate(self)
						textBoth:SetText(string.format("%.0f / %.0f Sec", Duration:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Player.BothTimeText.Direction == G.OPTIONS_D_DESCENDING then
					function bothUpdate(self)
						textBoth:SetText(string.format("%.0f / %.0f Sec", Duration:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Player.BothTimeText.Direction == G.OPTIONS_P_BOTH then
					function bothUpdate(self)
						if castBar == "Cast" or castBar == "Empower" then
							textBoth:SetText(string.format("%.0f / %.0f Sec", Duration:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						elseif castBar == "Channel" then
							textBoth:SetText(string.format("%.0f / %.0f Sec", Duration:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			elseif VCBsettings.Player.BothTimeText.Decimals == "1" then
				if VCBsettings.Player.BothTimeText.Direction == G.OPTIONS_D_ASCENDING then
					function bothUpdate(self)
						textBoth:SetText(string.format("%.1f / %.1f Sec", Duration:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Player.BothTimeText.Direction == G.OPTIONS_D_DESCENDING then
					function bothUpdate(self)
						textBoth:SetText(string.format("%.1f / %.1f Sec", Duration:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Player.BothTimeText.Direction == G.OPTIONS_P_BOTH then
					function bothUpdate(self)
						if castBar == "Cast" or castBar == "Empower" then
							textBoth:SetText(string.format("%.1f / %.1f Sec", Duration:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						elseif castBar == "Channel" then
							textBoth:SetText(string.format("%.1f / %.1f Sec", Duration:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			elseif VCBsettings.Player.BothTimeText.Decimals == "2" then
				if VCBsettings.Player.BothTimeText.Direction == G.OPTIONS_D_ASCENDING then
					function bothUpdate(self)
						textBoth:SetText(string.format("%.2f / %.2f Sec", Duration:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Player.BothTimeText.Direction == G.OPTIONS_D_DESCENDING then
					function bothUpdate(self)
						textBoth:SetText(string.format("%.2f / %.2f Sec", Duration:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Player.BothTimeText.Direction == G.OPTIONS_P_BOTH then
					function bothUpdate(self)
						if castBar == "Cast" or castBar == "Empower" then
							textBoth:SetText(string.format("%.2f / %.2f Sec", Duration:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						elseif castBar == "Channel" then
							textBoth:SetText(string.format("%.2f / %.2f Sec", Duration:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			elseif VCBsettings.Player.BothTimeText.Decimals == "3" then
				if VCBsettings.Player.BothTimeText.Direction == G.OPTIONS_D_ASCENDING then
					function bothUpdate(self)
						textBoth:SetText(string.format("%.3f / %.3f Sec", Duration:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Player.BothTimeText.Direction == G.OPTIONS_D_DESCENDING then
					function bothUpdate(self)
						textBoth:SetText(string.format("%.3f / %.3f Sec", Duration:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Player.BothTimeText.Direction == G.OPTIONS_P_BOTH then
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
	elseif VCBsettings.Player.BothTimeText.Position == G.OPTIONS_V_HIDE then
		function bothUpdate(self)
			return
		end
	end
end
-- check both casting time update
function VDW.VCB.chkTotalUpdPlayer()
	if VCBsettings.Player.TotalTimeText.Position ~= G.OPTIONS_V_HIDE then
		if VCBsettings.Player.TotalTimeText.Sec == G.OPTIONS_V_HIDE then
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
		elseif VCBsettings.Player.TotalTimeText.Sec == G.OPTIONS_V_SHOW then
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
	elseif VCBsettings.Player.TotalTimeText.Position == G.OPTIONS_V_HIDE then
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
	if VCBsettings.Player.StatusBar.Color == G.OPTIONS_C_DEFAULT then
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
	elseif VCBsettings.Player.StatusBar.Color == G.OPTIONS_C_FACTION then
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
	elseif VCBsettings.Player.StatusBar.Color == G.OPTIONS_C_CLASS then
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
	elseif VCBsettings.Player.StatusBar.Color == G.OPTIONS_C_SPELL then
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
		VDW.VCB.ClassColor = C_ClassColor.GetClassColor(select(2, C_PlayerInfo.GetClass(PlayerLocation:CreateFromUnit("player"))))
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
-- bar status style
function VDW.VCB.chkStatusStylePlayer()
	if VCBsettings.Player.StatusBar.Style == G.OPTIONS_C_DEFAULT then
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
if VCBsettings.Player.Border.Color == G.OPTIONS_C_DEFAULT then
		function borderColor(self)
			self.Background:SetDesaturated(false)
			self.Border:SetDesaturated(false)
			TextBorderTop:SetDesaturated(false)
			TextBorderBottom:SetDesaturated(false)
			self.Background:SetVertexColor(1, 1, 1)
			self.Border:SetVertexColor(1, 1, 1)
			TextBorderTop:SetVertexColor(1, 1, 1)
			TextBorderBottom:SetVertexColor(1, 1, 1)
		end
	elseif VCBsettings.Player.Border.Color == G.OPTIONS_C_FACTION then
		function borderColor(self)
			self.Background:SetDesaturated(true)
			self.Border:SetDesaturated(true)
			TextBorderTop:SetDesaturated(true)
			TextBorderBottom:SetDesaturated(true)
			self.Background:SetVertexColor(VDW.PlayerFactionColor:GetRGB())
			self.Border:SetVertexColor(VDW.PlayerFactionColor:GetRGB())
			TextBorderTop:SetVertexColor(VDW.PlayerFactionColor:GetRGB())
			TextBorderBottom:SetVertexColor(VDW.PlayerFactionColor:GetRGB())
		end
	elseif VCBsettings.Player.Border.Color == G.OPTIONS_C_CLASS then
		function borderColor(self)
			self.Background:SetDesaturated(true)
			self.Border:SetDesaturated(true)
			TextBorderTop:SetDesaturated(true)
			TextBorderBottom:SetDesaturated(true)
			self.Background:SetVertexColor(VDW.PlayerClassColor:GetRGB())
			self.Border:SetVertexColor(VDW.PlayerClassColor:GetRGB())
			TextBorderTop:SetVertexColor(VDW.PlayerClassColor:GetRGB())
			TextBorderBottom:SetVertexColor(VDW.PlayerClassColor:GetRGB())
		end
	end
end
-- check border bar style
function VDW.VCB.chkBorderStylePlayer()
	if VCBsettings.Player.Border.Style == G.OPTIONS_C_DEFAULT then
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
	TextBorderTop:SetDesaturated(false)
	TextBorderBottom:SetDesaturated(false)
	self.Background:SetVertexColor(1, 1, 1)
	self.Border:SetVertexColor(1, 1, 1)
	TextBorderTop:SetVertexColor(1, 1, 1)
	TextBorderBottom:SetVertexColor(1, 1, 1)
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
local function PlayerCastLagBar(arg3)
	lagBarWidth = 0
	local playerSpell1 = IsSpellKnownOrOverridesKnown(arg3)
	local playerSpell2 = IsPlayerSpell(arg3)
	if (playerSpell1 or playerSpell2) and VCBsettings.Player.LagBar.Visibility == G.OPTIONS_V_SHOW then
		lagEnd = GetTime()
		lagTotal = (lagEnd - lagStart)
		statusMin, statusMax = PlayerCastingBarFrame:GetMinMaxValues()
		lagWidth = lagTotal / (statusMax - statusMin)
		lagBarWidth = PlayerCastingBarFrame:GetWidth() * lagWidth
		if lagBarWidth == 0 then
			VCBLagCastBar:Hide()
		else
			VCBLagCastBar:ClearAllPoints()
			VCBLagCastBar:SetWidth(lagBarWidth)
			VCBLagCastBar:SetPoint("RIGHT", PlayerCastingBarFrame, "RIGHT", 0, 0)
			VCBLagCastBar:Show()
		end
	end
end
-- Player Channeling Latency Bar
local function PlayerChannelLagBar(arg3)
	lagBarWidth = 0
	local playerSpell1 = IsSpellKnownOrOverridesKnown(arg3)
	local playerSpell2 = IsPlayerSpell(arg3)
	if (playerSpell1 or playerSpell2) and VCBsettings.Player.LagBar.Visibility == G.OPTIONS_V_SHOW then
		lagEnd = GetTime()
		lagTotal = (lagEnd - lagStart)
		statusMin, statusMax = PlayerCastingBarFrame:GetMinMaxValues()
		lagWidth = lagTotal / (statusMax - statusMin)
		lagBarWidth = PlayerCastingBarFrame:GetWidth() * lagWidth
		if lagBarWidth == 0 then
			VCBLagChannelBar:Hide()
		else
			VCBLagChannelBar:ClearAllPoints()
			VCBLagChannelBar:SetWidth(lagBarWidth)
			VCBLagChannelBar:SetPoint("LEFT", PlayerCastingBarFrame, "LEFT", 0, 0)
			VCBLagChannelBar:Show()
		end
	end
end
-- Player Casting SpellQueue Bar --
local function PlayerCastSpellQueueBar(arg3)
	local playerSpell1 = IsSpellKnownOrOverridesKnown(arg3)
	local playerSpell2 = IsPlayerSpell(arg3)
	if (playerSpell1 or playerSpell2) and VCBsettings.Player.QueueBar.Visibility == G.OPTIONS_V_SHOW then
		statusMin, statusMax = PlayerCastingBarFrame:GetMinMaxValues()
		local totalCastTime = statusMax - statusMin
		local spellQueueWindow = math.min(GetSpellQueueWindow() / 1000 / totalCastTime, 1)
		local spellQueueWidth = (PlayerCastingBarFrame:GetWidth() * spellQueueWindow) - lagBarWidth
		VCBSpellQueueCastBar:ClearAllPoints()
		VCBSpellQueueCastBar:SetWidth(spellQueueWidth)
		VCBSpellQueueCastBar:SetPoint("RIGHT", PlayerCastingBarFrame, "RIGHT", -lagBarWidth, 0)
		VCBSpellQueueCastBar:Show()
	end
end
-- Player Channeling SpellQueue Bar --
local function PlayerChannelSpellQueueBar(arg3)
	local playerSpell1 = IsSpellKnownOrOverridesKnown(arg3)
	local playerSpell2 = IsPlayerSpell(arg3)
	if (playerSpell1 or playerSpell2) and VCBsettings.Player.QueueBar.Visibility == G.OPTIONS_V_SHOW then
		statusMin, statusMax = PlayerCastingBarFrame:GetMinMaxValues()
		local totalCastTime = statusMax - statusMin
		local spellQueueWindow = math.min(GetSpellQueueWindow() / 1000 / totalCastTime, 1)
		local spellQueueWidth = (PlayerCastingBarFrame:GetWidth() * spellQueueWindow) - lagBarWidth
		VCBSpellQueueChannelBar:ClearAllPoints()
		VCBSpellQueueChannelBar:SetWidth(spellQueueWidth)
		VCBSpellQueueChannelBar:SetPoint("LEFT", PlayerCastingBarFrame, "LEFT", lagBarWidth, 0)
		VCBSpellQueueChannelBar:Show()
	end
end
-- Global Cooldown
function VDW.VCB.chkGlobalCooldownPlayer(self)
	if VCBsettings.Player.GCD.Position == G.OPTIONS_V_HIDE then
		if vcbGCDparent:IsShown() then vcbGCDparent:Hide() end
	elseif VCBsettings.Player.GCD.Position == G.OPTIONS_P_LEFT then
		vcbGCD2:ClearAllPoints()
		vcbGCD2:SetPoint("RIGHT", vcbGCDparent, "RIGHT", 0, 0)
		vcbGCDparent:ClearAllPoints()
		vcbGCDparent:SetPoint("RIGHT", PlayerCastingBarFrame, "LEFT", -42, 0)
		if not vcbGCDparent:IsShown() then vcbGCDparent:Show() end
	elseif VCBsettings.Player.GCD.Position == G.OPTIONS_P_TOP then
		vcbGCD2:ClearAllPoints()
		vcbGCD2:SetPoint("CENTER", vcbGCDparent, "CENTER", 0, 0)
		vcbGCDparent:ClearAllPoints()
		vcbGCDparent:SetPoint("BOTTOM", PlayerCastingBarFrame, "TOP", 0, 19)
		if not vcbGCDparent:IsShown() then vcbGCDparent:Show() end
	elseif VCBsettings.Player.GCD.Position == G.OPTIONS_P_RIGHT then
		vcbGCD2:ClearAllPoints()
		vcbGCD2:SetPoint("LEFT", vcbGCDparent, "LEFT", 0, 0)
		vcbGCDparent:ClearAllPoints()
		vcbGCDparent:SetPoint("LEFT", PlayerCastingBarFrame, "RIGHT", 42, 0)
		if not vcbGCDparent:IsShown() then vcbGCDparent:Show() end
	elseif VCBsettings.Player.GCD.Position == G.OPTIONS_P_BOTTOM then
		vcbGCD2:ClearAllPoints()
		vcbGCD2:SetPoint("CENTER", vcbGCDparent, "CENTER", 0, 0)
		vcbGCDparent:ClearAllPoints()
		vcbGCDparent:SetPoint("TOP", PlayerCastingBarFrame, "BOTTOM", 0, -19)
		if not vcbGCDparent:IsShown() then vcbGCDparent:Show() end
	end
	if VCBsettings.Player.GCD.Style == G.OPTIONS_S_CLASS_ICON then
		ClassIcon(self)
	elseif VCBsettings.Player.GCD.Style == G.OPTIONS_S_HERO_ICON then
		HeroIcon(self)
	elseif VCBsettings.Player.GCD.Style == G.OPTIONS_S_FACTION_ICON then
		FactionIcon(self)
	elseif VCBsettings.Player.GCD.Style == G.OPTIONS_S_DEFAULT_BAR then
		vcbGCD2:SetFillStyle(2)
	end
end
-- =========================
-- Events Time
-- =========================
local function EventsTime(self, event, arg1, arg2, arg3, arg4, arg5)
if event == "PLAYER_LOGIN" then
	ProtectOptions()
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
	VDW.VCB.chkGlobalCooldownPlayer(vcbGCD1)
	vcbCreateTicks()
-- Hooking Time part 1 --
		PlayerCastingBarFrame:HookScript("OnShow", function(self)
			textName:SetWidth(self:GetWidth() - 8)
			namePosition(self)
			currentPostion(self)
			bothPostion(self)
			totalPostion(self)
			borderStyle(self)
		end)
-- Hooking Time part 2 --
		PlayerCastingBarFrame:HookScript("OnUpdate", function(self)
			self.TextBorder:SetAlpha(0)
			self.CastTimeText:SetAlpha(0)
			self.Text:SetAlpha(0)
			TextBorderTop:SetAlpha(0.55)
			TextBorderBottom:SetAlpha(0.55)
			if Duration then
				textName:SetText(self.Text:GetText())
				iconPosition(self)
				shieldPosition(uninterruptible)
				bordertextPosition()
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
				borderColor(self)
				if castBar == "Channel" and VCBspecialSettings.Player.Ticks.Style ~= G.OPTIONS_V_HIDE then vcbShowTicks(VCBarg3) end 
			end
		end)
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
		if VCBsettings.Player.GCD.Position ~= G.OPTIONS_V_HIDE then
			local spellCooldownInfo = C_Spell.GetSpellCooldown(61304)
			if spellCooldownInfo.duration > 0 then
				tSend = GetTime()
				if VCBsettings.Player.GCD.Style == G.OPTIONS_S_CLASS_ICON or VCBsettings.Player.GCD.Style == G.OPTIONS_S_HERO_ICON or VCBsettings.Player.GCD.Style == G.OPTIONS_S_FACTION_ICON then
					vcbGCD1:SetAlpha(1)
					vcbGCD1:SetCooldown(GetTime(), spellCooldownInfo.duration - (tSend - lagStart))
				elseif VCBsettings.Player.GCD.Style == G.OPTIONS_S_DEFAULT_BAR then
					vcbGCD1:SetCooldown(GetTime(), spellCooldownInfo.duration - (tSend - lagStart))
					vcbGCD2:SetMinMaxValues(0, spellCooldownInfo.duration - (tSend - lagStart))
					vcbGCD2:Show()
					vcbGCD1:SetAlpha(0)
					vcbGCD1:HookScript("OnUpdate", function(self)
						local duration = GetTime() - tSend
						vcbGCD2:SetValue(duration)
					end)
					vcbGCD1:HookScript("OnCooldownDone", function(self)
						vcbGCD2:Hide()
					end)
				end
			end
		end
	elseif event == "UNIT_SPELLCAST_START" and arg1 == UNIT then
		vcbColor = false
		if VCBspecialSettings.Player.Ticks.Style ~= G.OPTIONS_V_HIDE then vcbHideTicks() end
		castName, castText, castTexture, _, _, castIsTradeSkill, _, castNotInterruptible = UnitCastingInfo(UNIT)
		tStart = GetTime()
		if castName then
			interrupted = false
			tradeSkill = castIsTradeSkill
			uninterruptible = castNotInterruptible
			Duration = UnitCastingDuration(UNIT)
			castBar = "Cast"
			VCBLagCastBar:Hide()
			VCBLagChannelBar:Hide()
			VCBSpellQueueCastBar:Hide()
			VCBSpellQueueChannelBar:Hide()
			PlayerCastLagBar(arg3)
			PlayerCastSpellQueueBar(arg3)
			if VCBsettings.Player.StatusBar.Color == G.OPTIONS_C_SPELL then
				for k, v in pairs (vcbClass) do
					for i, a in pairs (v) do
						if a == arg3 then vcbSchool = k  vcbColor = true end
					end
				end
				if not vcbColor then vcbSchool = "Class" end
				local mountID = C_MountJournal.GetMountFromSpell(arg3)
				if mountID then vcbSchool = "Astral" end
			end
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
			VCBLagCastBar:Hide()
			VCBLagChannelBar:Hide()
			VCBSpellQueueCastBar:Hide()
			VCBSpellQueueChannelBar:Hide()
			PlayerChannelLagBar(arg3)
			PlayerChannelSpellQueueBar(arg3)
			if VCBsettings.Player.StatusBar.Color == G.OPTIONS_C_SPELL then
				for k, v in pairs (vcbClass) do
					for i, a in pairs (v) do
						if a == arg3 then vcbSchool = k end
					end
				end
			end
			VCBarg3 = arg3
		end
	elseif event == "UNIT_SPELLCAST_EMPOWER_START" and arg1 == UNIT then
		if VCBspecialSettings.Player.Ticks.Style ~= G.OPTIONS_V_HIDE then vcbHideTicks() end
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
		if VCBspecialSettings.Player.Ticks.Style ~= G.OPTIONS_V_HIDE then vcbHideTicks() end
	elseif event == "UNIT_SPELLCAST_CHANNEL_UPDATE" and arg1 == UNIT then
		tChannelUpdate = GetTime()
	elseif event == "UNIT_SPELLCAST_EMPOWER_UPDATE" and arg1 == UNIT then
		tEmpowerUpdate = GetTime()
	elseif event == ("UNIT_SPELLCAST_CHANNEL_STOP" or "UNIT_SPELLCAST_STOP") and arg1 == UNIT then
		if VCBspecialSettings.Player.Ticks.Style ~= G.OPTIONS_V_HIDE then vcbHideTicks() end
	elseif event == "PLAYER_SPECIALIZATION_CHANGED" then
		VDW.VCB.chkGlobalCooldownPlayer(vcbGCD1)
	end
end
vcbZlave2:SetScript("OnEvent", EventsTime2)