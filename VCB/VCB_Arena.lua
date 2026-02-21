-- =========================
-- some variables
-- =========================
local G = VDW.Local.Override
local iconSpellLeft1, iconSpellLeft2, iconSpellLeft3
local iconSpellRight1, iconSpellRight2, iconSpellRight3
local shieldSpellLeft1, shieldSpellLeft2, shieldSpellLeft3
local shieldSpellRight1, shieldSpellRight2, shieldSpellRight3
local TextBorderTop1, TextBorderTop2, TextBorderTop3
local TextBorderBottom1, TextBorderBottom2, TextBorderBottom3
local textName1, textName2, textName3
local textCurrent1, textCurrent2, textCurrent3
local textBoth1, textBoth2, textBoth3
local textTotal1, textTotal2, textTotal3
local Duration1, Duration2, Duration3
local uninterruptible1, uninterruptible2, uninterruptible3
local castBar1, castBar2, castBar3
local interrupted1, interrupted2, interrupted3
local vcbClassColorArena1, vcbClassColorArena2, vcbClassColorArena3
local jailerColor = CreateColorFromRGBAHexString("0A979CFF")
-- =========================
-- extra textures
-- =========================
local function createTextures()
-- shield icons
	local shieldX = Boss1TargetFrameSpellBar:GetHeight() * 2.5
	local shieldY = shieldX + 4
	local function Shields(var1)
	var1:SetAtlas("ui-castingbar-shield", false)
		var1:SetSize(shieldX, shieldY)
		var1:SetBlendMode("BLEND")
		var1:SetAlpha(0) -- 0.75
	end
-- text Borders
	local function Borders(var1)
		var1:SetAtlas("ui-castingbar-textbox", false)
		var1:SetAlpha(0.55)
	end
	for i = 1, 3, 1 do
-- icon spell left
		_G["iconSpellLeft"..i] = _G["CompactArenaFrameMember"..i].CastingBarFrame:CreateTexture(nil, "ARTWORK", nil, 0)
-- icon spell right
		_G["iconSpellRight"..i] = _G["CompactArenaFrameMember"..i].CastingBarFrame:CreateTexture(nil, "ARTWORK", nil, 0)
-- shield icon left
		_G["shieldSpellLeft"..i] = _G["CompactArenaFrameMember"..i].CastingBarFrame:CreateTexture(nil, "BACKGROUND", nil, 0)
		Shields(_G["shieldSpellLeft"..i])
		_G["shieldSpellLeft"..i]:SetPoint("RIGHT", _G["CompactArenaFrameMember"..i].CastingBarFrame, "LEFT", 0, 0)
-- shield icon right
		_G["shieldSpellRight"..i] = _G["CompactArenaFrameMember"..i].CastingBarFrame:CreateTexture(nil, "BACKGROUND", nil, 0)
		Shields(_G["shieldSpellRight"..i])
		_G["shieldSpellRight"..i]:SetPoint("LEFT", _G["CompactArenaFrameMember"..i].CastingBarFrame, "RIGHT", 0, 0)
-- Text Border Top
		_G["TextBorderTop"..i] = _G["CompactArenaFrameMember"..i].CastingBarFrame:CreateTexture(nil, "BACKGROUND", nil, -7)
		Borders(_G["TextBorderTop"..i])
		_G["TextBorderTop"..i]:SetPoint("TOPLEFT", _G["CompactArenaFrameMember"..i].CastingBarFrame, "TOPLEFT", 0, 12)
		_G["TextBorderTop"..i]:SetPoint("BOTTOMRIGHT", _G["CompactArenaFrameMember"..i].CastingBarFrame, "BOTTOMRIGHT", 0, 4)
-- Text Border Bottom
		_G["TextBorderBottom"..i] = _G["CompactArenaFrameMember"..i].CastingBarFrame:CreateTexture(nil, "BACKGROUND", nil, -7)
		Borders(_G["TextBorderBottom"..i])
		_G["TextBorderBottom"..i]:SetPoint("TOPLEFT", _G["CompactArenaFrameMember"..i].CastingBarFrame, "TOPLEFT", 0, -4)
		_G["TextBorderBottom"..i]:SetPoint("BOTTOMRIGHT", _G["CompactArenaFrameMember"..i].CastingBarFrame, "BOTTOMRIGHT", 0, -12)
	end
end
-- =========================
-- extra texts
-- =========================
-- function for the texts
local function createTexts()
	local function Texts(var1)
		var1:SetFontObject("GameFontHighlightSmall")
		var1:Hide()
	end
-- creating the texts
	for i = 1, 3, 1 do
		_G["textName"..i] = _G["CompactArenaFrameMember"..i].CastingBarFrame:CreateFontString(nil, "OVERLAY", nil)
		Texts(_G["textName"..i])
		_G["textCurrent"..i] = _G["CompactArenaFrameMember"..i].CastingBarFrame:CreateFontString(nil, "OVERLAY", nil)
		Texts(_G["textCurrent"..i])
		_G["textBoth"..i] = _G["CompactArenaFrameMember"..i].CastingBarFrame:CreateFontString(nil, "OVERLAY", nil)
		Texts(_G["textBoth"..i])
		_G["textTotal"..i] = _G["CompactArenaFrameMember"..i].CastingBarFrame:CreateFontString(nil, "OVERLAY", nil)
		Texts(_G["textTotal"..i])
	end
end
-- =========================
-- functions protect the options
-- =========================
local function ProtectOptions()
	local loc = GetLocale()
	if loc ~= VCBspecialSettings["LastLocation"] then
		for k, v in pairs(VDW.Local.Translate) do
			for i, s in pairs (v) do
				if VCBsettings.Arena.Icon.Position == s then
					VCBsettings.Arena.Icon.Position = VDW.Local.Translate[loc][i]
				end
				if VCBsettings.Arena.Shield.Position == s then
					VCBsettings.Arena.Shield.Position = VDW.Local.Translate[loc][i]
				end
				if VCBsettings.Arena.TextBorder.Position == s then
					VCBsettings.Arena.TextBorder.Position = VDW.Local.Translate[loc][i]
				end
				if VCBsettings.Arena.NameText.Position == s then
					VCBsettings.Arena.NameText.Position = VDW.Local.Translate[loc][i]
				end
				if VCBsettings.Arena.CurrentTimeText.Position == s then
					VCBsettings.Arena.CurrentTimeText.Position = VDW.Local.Translate[loc][i]
				end
				if VCBsettings.Arena.BothTimeText.Position == s then
					VCBsettings.Arena.BothTimeText.Position = VDW.Local.Translate[loc][i]
				end
				if VCBsettings.Arena.TotalTimeText.Position == s then
					VCBsettings.Arena.TotalTimeText.Position = VDW.Local.Translate[loc][i]
				end
				if VCBsettings.Arena.CurrentTimeText.Direction == s then
					VCBsettings.Arena.CurrentTimeText.Direction = VDW.Local.Translate[loc][i]
				end
				if VCBsettings.Arena.BothTimeText.Direction == s then
					VCBsettings.Arena.BothTimeText.Direction = VDW.Local.Translate[loc][i]
				end
				if VCBsettings.Arena.CurrentTimeText.Sec == s then
					VCBsettings.Arena.CurrentTimeText.Sec = VDW.Local.Translate[loc][i]
				end
				if VCBsettings.Arena.BothTimeText.Sec == s then
					VCBsettings.Arena.BothTimeText.Sec = VDW.Local.Translate[loc][i]
				end
				if VCBsettings.Arena.TotalTimeText.Sec == s then
					VCBsettings.Arena.TotalTimeText.Sec = VDW.Local.Translate[loc][i]
				end
				if VCBsettings.Arena.StatusBar.Color == s then
					VCBsettings.Arena.StatusBar.Color = VDW.Local.Translate[loc][i]
				end
				if VCBsettings.Arena.StatusBar.Style == s then
					VCBsettings.Arena.StatusBar.Style = VDW.Local.Translate[loc][i]
				end
				if VCBsettings.Arena.Border.Color == s then
					VCBsettings.Arena.Border.Color = VDW.Local.Translate[loc][i]
				end
				if VCBsettings.Arena.Border.Style == s then
					VCBsettings.Arena.Border.Style = VDW.Local.Translate[loc][i]
				end
			end
		end
	end
end
-- =========================
-- functions OnUpdate and OnShow
-- =========================
-- icon position
local function iconPosition(self, i)
	print("iconPosition is not Working!")
end
-- shield icon position
local function shieldPosition(uninterruptible, i)
	print("shieldPosition is not Working!")
end
-- border text position
local function bordertextPosition (bordertext1, bordertext2)
	print("bordertextPosition is not Working!")
end
-- name position
local function namePosition(self, i)
	print("namePosition is not Working!")
end
-- current time position
local function currentPostion(self, i)
	print("currentPostion is not Working!")
end
-- both time position
local function bothPostion(self, i)
	print("bothPostion is not Working!")
end
-- total time position
local function totalPostion(self, i)
	print("totalPostion is not Working!")
end
-- current time update
local function currentUpdate(self, i)
	print("currentUpdate is not Working!")
end
-- both time update
local function bothUpdate(self, i)
	print("bothUpdate is not Working!")
end
-- total time update
local function totalUpdate(self, i)
	print("totalUpdate is not Working!")
end
-- status bar color
local function statusbarColor(self, i)
	print("statusbarColor is not Working!")
end
-- border color
local function borderColor(self, i, bordertext1, bordertext2)
	print("borderColor is not Working!")
end
-- status bar style
local function statusbarStyle(self)
	print("statusbarStyle is not Working!")
end
-- border bar style
local function borderStyle(self)
	print("borderStyle is not Working!")
end
-- =========================
-- checking position functions
-- =========================
-- check icon
function VDW.VCB.chkArenaIconPosition()
	if VCBsettings["Arena"]["Icon"]["Position"] == G.OPTIONS_V_HIDE then
		function iconPosition(self, i)
			if _G["iconSpellLeft"..i]:IsShown() then _G["iconSpellLeft"..i]:Hide() end
			if _G["iconSpellRight"..i]:IsShown() then _G["iconSpellRight"..i]:Hide() end
		end
	elseif VCBsettings["Arena"]["Icon"]["Position"] == G.OPTIONS_P_LEFT then
		function iconPosition(self, i)
			_G["iconSpellLeft"..i]:ClearAllPoints()
			_G["iconSpellLeft"..i]:SetPoint("TOPLEFT", _G["shieldSpellLeft"..i], "TOPLEFT", 6, -6)
			_G["iconSpellLeft"..i]:SetPoint("BOTTOMRIGHT", _G["shieldSpellLeft"..i], "BOTTOMRIGHT", -6, 10)
			_G["iconSpellLeft"..i]:SetTexture(self.Icon:GetTextureFileID())
			if not _G["iconSpellLeft"..i]:IsShown() then _G["iconSpellLeft"..i]:Show() end
			if _G["iconSpellRight"..i]:IsShown() then _G["iconSpellRight"..i]:Hide() end
		end
	elseif VCBsettings["Arena"]["Icon"]["Position"] == G.OPTIONS_P_RIGHT then
		function iconPosition(self, i)
			if _G["iconSpellLeft"..i]:IsShown() then _G["iconSpellLeft"..i]:Hide() end
			_G["iconSpellRight"..i]:ClearAllPoints()
			_G["iconSpellRight"..i]:SetPoint("TOPLEFT", _G["shieldSpellRight"..i], "TOPLEFT", 6, -6)
			_G["iconSpellRight"..i]:SetPoint("BOTTOMRIGHT", _G["shieldSpellRight"..i], "BOTTOMRIGHT", -6, 10)
			_G["iconSpellRight"..i]:SetTexture(self.Icon:GetTextureFileID())
			if not _G["iconSpellRight"..i]:IsShown() then _G["iconSpellRight"..i]:Show() end
		end
	elseif VCBsettings["Arena"]["Icon"]["Position"] == G.OPTIONS_P_BOTH then	
		function iconPosition(self, i)
			_G["iconSpellLeft"..i]:ClearAllPoints()
			_G["iconSpellLeft"..i]:SetPoint("TOPLEFT", _G["shieldSpellLeft"..i], "TOPLEFT", 6, -6)
			_G["iconSpellLeft"..i]:SetPoint("BOTTOMRIGHT", _G["shieldSpellLeft"..i], "BOTTOMRIGHT", -6, 10)
			_G["iconSpellLeft"..i]:SetTexture(self.Icon:GetTextureFileID())
			if not _G["iconSpellLeft"..i]:IsShown() then _G["iconSpellLeft"..i]:Show() end
			_G["iconSpellRight"..i]:ClearAllPoints()
			_G["iconSpellRight"..i]:SetPoint("TOPLEFT", _G["shieldSpellRight"..i], "TOPLEFT", 6, -6)
			_G["iconSpellRight"..i]:SetPoint("BOTTOMRIGHT", _G["shieldSpellRight"..i], "BOTTOMRIGHT", -6, 10)
			_G["iconSpellRight"..i]:SetTexture(self.Icon:GetTextureFileID())
			if not _G["iconSpellRight"..i]:IsShown() then _G["iconSpellRight"..i]:Show() end
		end
	end
end
-- check shield
function VDW.VCB.chkArenaShieldPosition()
	if VCBsettings.Arena.Shield.Position == G.OPTIONS_V_HIDE then
		function shieldPosition(uninterruptible, i)
			_G["shieldSpellLeft"..i]:SetAlpha(0)
			_G["shieldSpellRight"..i]:SetAlpha(0)
		end
	elseif VCBsettings.Arena.Shield.Position == G.OPTIONS_P_LEFT then
		function shieldPosition(uninterruptible, i)
			_G["shieldSpellLeft"..i]:SetAlphaFromBoolean(uninterruptible, 150, 0)
			_G["shieldSpellRight"..i]:SetAlpha(0)
		end
	elseif VCBsettings.Arena.Shield.Position == G.OPTIONS_P_RIGHT then
		function shieldPosition(uninterruptible, i)
			_G["shieldSpellLeft"..i]:SetAlpha(0)
			_G["shieldSpellRight"..i]:SetAlphaFromBoolean(uninterruptible, 150, 0)
		end
	elseif VCBsettings.Arena.Shield.Position == G.OPTIONS_P_BOTH then
		function shieldPosition(uninterruptible, i)
			_G["shieldSpellLeft"..i]:SetAlphaFromBoolean(uninterruptible, 150, 0)
			_G["shieldSpellRight"..i]:SetAlphaFromBoolean(uninterruptible, 150, 0)
		end
	end
end
-- check text border
function VDW.VCB.chkArenaBorderTextPosition()
	if VCBsettings.Arena.BorderText.Position == G.OPTIONS_V_HIDE then
		function bordertextPosition (bordertext1, bordertext2)
			bordertext1:Hide()
			bordertext2:Hide()
		end
	elseif VCBsettings.Arena.BorderText.Position == G.OPTIONS_P_TOP then
		function bordertextPosition (bordertext1, bordertext2)
			bordertext1:Show()
			bordertext2:Hide()
		end
	elseif VCBsettings.Arena.BorderText.Position == G.OPTIONS_P_BOTTOM then
		function bordertextPosition (bordertext1, bordertext2)
			bordertext1:Hide()
			bordertext2:Show()
		end
	elseif VCBsettings.Arena.BorderText.Position == G.OPTIONS_P_BOTH then
		function bordertextPosition (bordertext1, bordertext2)
			bordertext1:Show()
			bordertext2:Show()
		end
	end
end
-- check name text position
function VDW.VCB.chkNameTxtArena()
	if VCBsettings["Arena"]["NameText"]["Position"] == G.OPTIONS_V_HIDE then
		function namePosition(self, i)
			if _G["textName"..i]:IsShown() then _G["textName"..i]:Hide() end
		end
	elseif VCBsettings["Arena"]["NameText"]["Position"] == G.OPTIONS_P_TOPLEFT then
		function namePosition(self, i)
			_G["textName"..i]:ClearAllPoints()
			_G["textName"..i]:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 4, 1)
			_G["textName"..i]:SetJustifyH("LEFT")
			if not _G["textName"..i]:IsShown() then _G["textName"..i]:Show() end
		end
	elseif VCBsettings["Arena"]["NameText"]["Position"] == G.OPTIONS_P_LEFT then
		function namePosition(self, i)
			_G["textName"..i]:ClearAllPoints()
			_G["textName"..i]:SetPoint("LEFT", self, "LEFT", 4, 0)
			_G["textName"..i]:SetJustifyH("LEFT")
			if not _G["textName"..i]:IsShown() then _G["textName"..i]:Show() end
		end
	elseif VCBsettings["Arena"]["NameText"]["Position"] == G.OPTIONS_P_BOTTOMLEFT then
		function namePosition(self, i)
			_G["textName"..i]:ClearAllPoints()
			_G["textName"..i]:SetPoint("TOPLEFT", self, "BOTTOMLEFT", 4, -1)
			_G["textName"..i]:SetJustifyH("LEFT")
			if not _G["textName"..i]:IsShown() then _G["textName"..i]:Show() end
		end
	elseif VCBsettings["Arena"]["NameText"]["Position"] == G.OPTIONS_P_TOP then
		function namePosition(self, i)
			_G["textName"..i]:ClearAllPoints()
			_G["textName"..i]:SetPoint("BOTTOM", self, "TOP", 0, 1)
			_G["textName"..i]:SetJustifyH("CENTER")
			if not _G["textName"..i]:IsShown() then _G["textName"..i]:Show() end
			end
	elseif VCBsettings["Arena"]["NameText"]["Position"] == G.OPTIONS_P_CENTER then
		function namePosition(self, i)
			_G["textName"..i]:ClearAllPoints()
			_G["textName"..i]:SetPoint("CENTER", self, "CENTER", 0, 0)
			_G["textName"..i]:SetJustifyH("CENTER")
			if not _G["textName"..i]:IsShown() then _G["textName"..i]:Show() end
			end
	elseif VCBsettings["Arena"]["NameText"]["Position"] == G.OPTIONS_P_BOTTOM then
		function namePosition(self, i)
			_G["textName"..i]:ClearAllPoints()
			_G["textName"..i]:SetPoint("TOP", self, "BOTTOM", 0, -1)
			_G["textName"..i]:SetJustifyH("CENTER")
			if not _G["textName"..i]:IsShown() then _G["textName"..i]:Show() end
		end
	elseif VCBsettings["Arena"]["NameText"]["Position"] == G.OPTIONS_P_TOPRIGHT then
		function namePosition(self, i)
			_G["textName"..i]:ClearAllPoints()
			_G["textName"..i]:SetPoint("BOTTOMRIGHT", self, "TOPRIGHT", -4, 1)
			_G["textName"..i]:SetJustifyH("RIGHT")
			if not _G["textName"..i]:IsShown() then _G["textName"..i]:Show() end
		end
	elseif VCBsettings["Arena"]["NameText"]["Position"] == G.OPTIONS_P_RIGHT then
		function namePosition(self, i)
			_G["textName"..i]:ClearAllPoints()
			_G["textName"..i]:SetPoint("RIGHT", self, "RIGHT", -4, 0)
			_G["textName"..i]:SetJustifyH("RIGHT")
			if not _G["textName"..i]:IsShown() then _G["textName"..i]:Show() end
		end
	elseif VCBsettings["Arena"]["NameText"]["Position"] == G.OPTIONS_P_BOTTOMRIGHT then
		function namePosition(self, i)
			_G["textName"..i]:ClearAllPoints()
			_G["textName"..i]:SetPoint("TOPRIGHT", self, "BOTTOMRIGHT", -4, -1)
			_G["textName"..i]:SetJustifyH("RIGHT")
			if not _G["textName"..i]:IsShown() then _G["textName"..i]:Show() end
		end
	end
end
-- check current casting time text position
function VDW.VCB.chkCurrentTxtArena()
	if VCBsettings["Arena"]["CurrentTimeText"]["Position"] == G.OPTIONS_V_HIDE then
		function currentPostion(self, i)
			if _G["textCurrent"..i]:IsShown() then _G["textCurrent"..i]:Hide() end
		end
	elseif VCBsettings["Arena"]["CurrentTimeText"]["Position"] == G.OPTIONS_P_TOPLEFT then
		function currentPostion(self, i)
			_G["textCurrent"..i]:ClearAllPoints()
			_G["textCurrent"..i]:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 4, 1)
			if not _G["textCurrent"..i]:IsShown() then _G["textCurrent"..i]:Show() end
		end
	elseif VCBsettings["Arena"]["CurrentTimeText"]["Position"] == G.OPTIONS_P_LEFT then
		function currentPostion(self, i)
			_G["textCurrent"..i]:ClearAllPoints()
			_G["textCurrent"..i]:SetPoint("LEFT", self, "LEFT", 4, 0)
			if not _G["textCurrent"..i]:IsShown() then _G["textCurrent"..i]:Show() end
		end
	elseif VCBsettings["Arena"]["CurrentTimeText"]["Position"] == G.OPTIONS_P_BOTTOMLEFT then
		function currentPostion(self, i)
			_G["textCurrent"..i]:ClearAllPoints()
			_G["textCurrent"..i]:SetPoint("TOPLEFT", self, "BOTTOMLEFT", 4, -1)
			if not _G["textCurrent"..i]:IsShown() then _G["textCurrent"..i]:Show() end
		end
	elseif VCBsettings["Arena"]["CurrentTimeText"]["Position"] == G.OPTIONS_P_TOP then
		function currentPostion(self, i)
			_G["textCurrent"..i]:ClearAllPoints()
			_G["textCurrent"..i]:SetPoint("BOTTOM", self, "TOP", 0, 1)
			if not _G["textCurrent"..i]:IsShown() then _G["textCurrent"..i]:Show() end
		end
	elseif VCBsettings["Arena"]["CurrentTimeText"]["Position"] == G.OPTIONS_P_CENTER then
		function currentPostion(self, i)
			_G["textCurrent"..i]:ClearAllPoints()
			_G["textCurrent"..i]:SetPoint("CENTER", self, "CENTER", 0, 0)
			if not _G["textCurrent"..i]:IsShown() then _G["textCurrent"..i]:Show() end
		end
	elseif VCBsettings["Arena"]["CurrentTimeText"]["Position"] == G.OPTIONS_P_BOTTOM then
		function currentPostion(self, i)
			_G["textCurrent"..i]:ClearAllPoints()
			_G["textCurrent"..i]:SetPoint("TOP", self, "BOTTOM", 0, -1)
			if not _G["textCurrent"..i]:IsShown() then _G["textCurrent"..i]:Show() end
		end
	elseif VCBsettings["Arena"]["CurrentTimeText"]["Position"] == G.OPTIONS_P_TOPRIGHT then
		function currentPostion(self, i)
			_G["textCurrent"..i]:ClearAllPoints()
			_G["textCurrent"..i]:SetPoint("BOTTOMRIGHT", self, "TOPRIGHT", -4, 1)
			if not _G["textCurrent"..i]:IsShown() then _G["textCurrent"..i]:Show() end
		end
	elseif VCBsettings["Arena"]["CurrentTimeText"]["Position"] == G.OPTIONS_P_RIGHT then
		function currentPostion(self, i)
			_G["textCurrent"..i]:ClearAllPoints()
			_G["textCurrent"..i]:SetPoint("RIGHT", self, "RIGHT", -4, 0)
			if not _G["textCurrent"..i]:IsShown() then _G["textCurrent"..i]:Show() end
		end
	elseif VCBsettings["Arena"]["CurrentTimeText"]["Position"] == G.OPTIONS_P_BOTTOMRIGHT then
		function currentPostion(self, i)
			_G["textCurrent"..i]:ClearAllPoints()
			_G["textCurrent"..i]:SetPoint("TOPRIGHT", self, "BOTTOMRIGHT", -4, -1)
			if not _G["textCurrent"..i]:IsShown() then _G["textCurrent"..i]:Show() end
		end
	end
end
-- check both casting time text position
function VDW.VCB.chkBothTxtArena()
	if VCBsettings["Arena"]["BothTimeText"]["Position"] == G.OPTIONS_V_HIDE then
		function bothPostion(self, i)
			if _G["textBoth"..i]:IsShown() then _G["textBoth"..i]:Hide() end
		end
	elseif VCBsettings["Arena"]["BothTimeText"]["Position"] == G.OPTIONS_P_TOPLEFT then
		function bothPostion(self, i)
			_G["textBoth"..i]:ClearAllPoints()
			_G["textBoth"..i]:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 4, 1)
			if not _G["textBoth"..i]:IsShown() then _G["textBoth"..i]:Show() end
		end
	elseif VCBsettings["Arena"]["BothTimeText"]["Position"] == G.OPTIONS_P_LEFT then
		function bothPostion(self, i)
			_G["textBoth"..i]:ClearAllPoints()
			_G["textBoth"..i]:SetPoint("LEFT", self, "LEFT", 4, 0)
			if not _G["textBoth"..i]:IsShown() then _G["textBoth"..i]:Show() end
		end
	elseif VCBsettings["Arena"]["BothTimeText"]["Position"] == G.OPTIONS_P_BOTTOMLEFT then
		function bothPostion(self, i)
			_G["textBoth"..i]:ClearAllPoints()
			_G["textBoth"..i]:SetPoint("TOPLEFT", self, "BOTTOMLEFT", 4, -1)
			if not _G["textBoth"..i]:IsShown() then _G["textBoth"..i]:Show() end
		end
	elseif VCBsettings["Arena"]["BothTimeText"]["Position"] == G.OPTIONS_P_TOP then
		function bothPostion(self, i)
			_G["textBoth"..i]:ClearAllPoints()
			_G["textBoth"..i]:SetPoint("BOTTOM", self, "TOP", 0, 1)
			if not _G["textBoth"..i]:IsShown() then _G["textBoth"..i]:Show() end
		end
	elseif VCBsettings["Arena"]["BothTimeText"]["Position"] == G.OPTIONS_P_CENTER then
		function bothPostion(self, i)
			_G["textBoth"..i]:ClearAllPoints()
			_G["textBoth"..i]:SetPoint("CENTER", self, "CENTER", 0, 0)
			if not _G["textBoth"..i]:IsShown() then _G["textBoth"..i]:Show() end
		end
	elseif VCBsettings["Arena"]["BothTimeText"]["Position"] == G.OPTIONS_P_BOTTOM then
		function bothPostion(self, i)
			_G["textBoth"..i]:ClearAllPoints()
			_G["textBoth"..i]:SetPoint("TOP", self, "BOTTOM", 0, -1)
			if not _G["textBoth"..i]:IsShown() then _G["textBoth"..i]:Show() end
		end
	elseif VCBsettings["Arena"]["BothTimeText"]["Position"] == G.OPTIONS_P_TOPRIGHT then
		function bothPostion(self, i)
			_G["textBoth"..i]:ClearAllPoints()
			_G["textBoth"..i]:SetPoint("BOTTOMRIGHT", self, "TOPRIGHT", -4, 1)
			if not _G["textBoth"..i]:IsShown() then _G["textBoth"..i]:Show() end
		end
	elseif VCBsettings["Arena"]["BothTimeText"]["Position"] == G.OPTIONS_P_RIGHT then
		function bothPostion(self, i)
			_G["textBoth"..i]:ClearAllPoints()
			_G["textBoth"..i]:SetPoint("RIGHT", self, "RIGHT", -4, 0)
			if not _G["textBoth"..i]:IsShown() then _G["textBoth"..i]:Show() end
		end
	elseif VCBsettings["Arena"]["BothTimeText"]["Position"] == G.OPTIONS_P_BOTTOMRIGHT then
		function bothPostion(self, i)
			_G["textBoth"..i]:ClearAllPoints()
			_G["textBoth"..i]:SetPoint("TOPRIGHT", self, "BOTTOMRIGHT", -4, -1)
			if not _G["textBoth"..i]:IsShown() then _G["textBoth"..i]:Show() end
		end
	end
end
-- check total casting time text position
function VDW.VCB.chkTotalTxtArena()
	if VCBsettings["Arena"]["TotalTimeText"]["Position"] == G.OPTIONS_V_HIDE then
		function totalPostion(self, i)
			if _G["textTotal"..i]:IsShown() then _G["textTotal"..i]:Hide() end
		end
	elseif VCBsettings["Arena"]["TotalTimeText"]["Position"] == G.OPTIONS_P_TOPLEFT then
		function totalPostion(self, i)
			_G["textTotal"..i]:ClearAllPoints()
			_G["textTotal"..i]:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 4, 1)
			if not _G["textTotal"..i]:IsShown() then _G["textTotal"..i]:Show() end
		end
	elseif VCBsettings["Arena"]["TotalTimeText"]["Position"] == G.OPTIONS_P_LEFT then
		function totalPostion(self, i)
			_G["textTotal"..i]:ClearAllPoints()
			_G["textTotal"..i]:SetPoint("LEFT", self, "LEFT", 4, 0)
			if not _G["textTotal"..i]:IsShown() then _G["textTotal"..i]:Show() end
		end
	elseif VCBsettings["Arena"]["TotalTimeText"]["Position"] == G.OPTIONS_P_BOTTOMLEFT then
		function totalPostion(self, i)
			_G["textTotal"..i]:ClearAllPoints()
			_G["textTotal"..i]:SetPoint("TOPLEFT", self, "BOTTOMLEFT", 4, -1)
			if not _G["textTotal"..i]:IsShown() then _G["textTotal"..i]:Show() end
		end
	elseif VCBsettings["Arena"]["TotalTimeText"]["Position"] == G.OPTIONS_P_TOP then
		function totalPostion(self, i)
			_G["textTotal"..i]:ClearAllPoints()
			_G["textTotal"..i]:SetPoint("BOTTOM", self, "TOP", 0, 1)
			if not _G["textTotal"..i]:IsShown() then _G["textTotal"..i]:Show() end
		end
	elseif VCBsettings["Arena"]["TotalTimeText"]["Position"] == G.OPTIONS_P_CENTER then
		function totalPostion(self, i)
			_G["textTotal"..i]:ClearAllPoints()
			_G["textTotal"..i]:SetPoint("CENTER", self, "CENTER", 0, 0)
			if not _G["textTotal"..i]:IsShown() then _G["textTotal"..i]:Show() end
		end
	elseif VCBsettings["Arena"]["TotalTimeText"]["Position"] == G.OPTIONS_P_BOTTOM then
		function totalPostion(self, i)
			_G["textTotal"..i]:ClearAllPoints()
			_G["textTotal"..i]:SetPoint("TOP", self, "BOTTOM", 0, -1)
			if not _G["textTotal"..i]:IsShown() then _G["textTotal"..i]:Show() end
		end
	elseif VCBsettings["Arena"]["TotalTimeText"]["Position"] == G.OPTIONS_P_TOPRIGHT then
		function totalPostion(self, i)
			_G["textTotal"..i]:ClearAllPoints()
			_G["textTotal"..i]:SetPoint("BOTTOMRIGHT", self, "TOPRIGHT", -4, 1)
			if not _G["textTotal"..i]:IsShown() then _G["textTotal"..i]:Show() end
		end
	elseif VCBsettings["Arena"]["TotalTimeText"]["Position"] == G.OPTIONS_P_RIGHT then
		function totalPostion(self, i)
			_G["textTotal"..i]:ClearAllPoints()
			_G["textTotal"..i]:SetPoint("RIGHT", self, "RIGHT", -4, 0)
			if not _G["textTotal"..i]:IsShown() then _G["textTotal"..i]:Show() end
		end
	elseif VCBsettings["Arena"]["TotalTimeText"]["Position"] == G.OPTIONS_P_BOTTOMRIGHT then
		function totalPostion(self, i)
			_G["textTotal"..i]:ClearAllPoints()
			_G["textTotal"..i]:SetPoint("TOPRIGHT", self, "BOTTOMRIGHT", -4, -1)
			if not _G["textTotal"..i]:IsShown() then _G["textTotal"..i]:Show() end
		end
	end
end
-- =========================
-- checking update functions
-- =========================
-- check current casting time update
function VDW.VCB.chkCurrentUpdArena()
	if VCBsettings.Arena.CurrentTimeText.Position ~= G.OPTIONS_V_HIDE then
		if VCBsettings.Arena.CurrentTimeText.Sec == G.OPTIONS_V_HIDE then
			if VCBsettings.Arena.CurrentTimeText.Decimals == "0" then
				if VCBsettings.Arena.CurrentTimeText.Direction == G.OPTIONS_D_ASCENDING then
					function currentUpdate(self, i)
						_G["textCurrent"..i]:SetText(string.format("%.0f", _G["Duration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Arena.CurrentTimeText.Direction == G.OPTIONS_D_DESCENDING then
					function currentUpdate(self, i)
						_G["textCurrent"..i]:SetText(string.format("%.0f", _G["Duration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Arena.CurrentTimeText.Direction == G.OPTIONS_P_BOTH then
					function currentUpdate(self, i)
						if _G["castBar"..i] == "Cast" or _G["castBar"..i] == "Empower" then
							_G["textCurrent"..i]:SetText(string.format("%.0f", _G["Duration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
						elseif _G["castBar"..i] == "Channel" then
							_G["textCurrent"..i]:SetText(string.format("%.0f", _G["Duration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			elseif VCBsettings.Arena.CurrentTimeText.Decimals == "1" then
				if VCBsettings.Arena.CurrentTimeText.Direction == G.OPTIONS_D_ASCENDING then
					function currentUpdate(self, i)
						_G["textCurrent"..i]:SetText(string.format("%.1f", _G["Duration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Arena.CurrentTimeText.Direction == G.OPTIONS_D_DESCENDING then
					function currentUpdate(self, i)
						_G["textCurrent"..i]:SetText(string.format("%.1f", _G["Duration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Arena.CurrentTimeText.Direction == G.OPTIONS_P_BOTH then
					function currentUpdate(self, i)
						if _G["castBar"..i] == "Cast" or _G["castBar"..i] == "Empower" then
							_G["textCurrent"..i]:SetText(string.format("%.1f", _G["Duration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
						elseif _G["castBar"..i] == "Channel" then
							_G["textCurrent"..i]:SetText(string.format("%.1f", _G["Duration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			elseif VCBsettings.Arena.CurrentTimeText.Decimals == "2" then
				if VCBsettings.Arena.CurrentTimeText.Direction == G.OPTIONS_D_ASCENDING then
					function currentUpdate(self, i)
						_G["textCurrent"..i]:SetText(string.format("%.2f", _G["Duration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Arena.CurrentTimeText.Direction == G.OPTIONS_D_DESCENDING then
					function currentUpdate(self, i)
						_G["textCurrent"..i]:SetText(string.format("%.2f", _G["Duration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Arena.CurrentTimeText.Direction == G.OPTIONS_P_BOTH then
					function currentUpdate(self, i)
						if _G["castBar"..i] == "Cast" or _G["castBar"..i] == "Empower" then
							_G["textCurrent"..i]:SetText(string.format("%.2f", _G["Duration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
						elseif _G["castBar"..i] == "Channel" then
							_G["textCurrent"..i]:SetText(string.format("%.2f", _G["Duration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			elseif VCBsettings.Arena.CurrentTimeText.Decimals == "3" then
				if VCBsettings.Arena.CurrentTimeText.Direction == G.OPTIONS_D_ASCENDING then
					function currentUpdate(self, i)
						_G["textCurrent"..i]:SetText(string.format("%.3f", _G["Duration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Arena.CurrentTimeText.Direction == G.OPTIONS_D_DESCENDING then
					function currentUpdate(self, i)
						_G["textCurrent"..i]:SetText(string.format("%.3f", _G["Duration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Arena.CurrentTimeText.Direction == G.OPTIONS_P_BOTH then
					function currentUpdate(self, i)
						if _G["castBar"..i] == "Cast" or _G["castBar"..i] == "Empower" then
							_G["textCurrent"..i]:SetText(string.format("%.3f", _G["Duration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
						elseif _G["castBar"..i] == "Channel" then
							_G["textCurrent"..i]:SetText(string.format("%.3f", _G["Duration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			end
		elseif VCBsettings.Arena.CurrentTimeText.Sec == G.OPTIONS_V_SHOW then
			if VCBsettings.Arena.CurrentTimeText.Decimals == "0" then
				if VCBsettings.Arena.CurrentTimeText.Direction == G.OPTIONS_D_ASCENDING then
					function currentUpdate(self, i)
						_G["textCurrent"..i]:SetText(string.format("%.0f Sec", _G["Duration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Arena.CurrentTimeText.Direction == G.OPTIONS_D_DESCENDING then
					function currentUpdate(self, i)
						_G["textCurrent"..i]:SetText(string.format("%.0f Sec", _G["Duration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Arena.CurrentTimeText.Direction == G.OPTIONS_P_BOTH then
					function currentUpdate(self, i)
						if _G["castBar"..i] == "Cast" or _G["castBar"..i] == "Empower" then
							_G["textCurrent"..i]:SetText(string.format("%.0f Sec", _G["Duration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
						elseif _G["castBar"..i] == "Channel" then
							_G["textCurrent"..i]:SetText(string.format("%.0f Sec", _G["Duration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			elseif VCBsettings.Arena.CurrentTimeText.Decimals == "1" then
				if VCBsettings.Arena.CurrentTimeText.Direction == G.OPTIONS_D_ASCENDING then
					function currentUpdate(self, i)
						_G["textCurrent"..i]:SetText(string.format("%.1f Sec", _G["Duration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Arena.CurrentTimeText.Direction == G.OPTIONS_D_DESCENDING then
					function currentUpdate(self, i)
						_G["textCurrent"..i]:SetText(string.format("%.1f Sec", _G["Duration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Arena.CurrentTimeText.Direction == G.OPTIONS_P_BOTH then
					function currentUpdate(self, i)
						if _G["castBar"..i] == "Cast" or _G["castBar"..i] == "Empower" then
							_G["textCurrent"..i]:SetText(string.format("%.1f Sec", _G["Duration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
						elseif _G["castBar"..i] == "Channel" then
							_G["textCurrent"..i]:SetText(string.format("%.1f Sec", _G["Duration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			elseif VCBsettings.Arena.CurrentTimeText.Decimals == "2" then
				if VCBsettings.Arena.CurrentTimeText.Direction == G.OPTIONS_D_ASCENDING then
					function currentUpdate(self, i)
						_G["textCurrent"..i]:SetText(string.format("%.2f Sec", _G["Duration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Arena.CurrentTimeText.Direction == G.OPTIONS_D_DESCENDING then
					function currentUpdate(self, i)
						_G["textCurrent"..i]:SetText(string.format("%.2f Sec", _G["Duration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Arena.CurrentTimeText.Direction == G.OPTIONS_P_BOTH then
					function currentUpdate(self, i)
						if _G["castBar"..i] == "Cast" or _G["castBar"..i] == "Empower" then
							_G["textCurrent"..i]:SetText(string.format("%.2f Sec", _G["Duration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
						elseif _G["castBar"..i] == "Channel" then
							_G["textCurrent"..i]:SetText(string.format("%.2f Sec", _G["Duration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			elseif VCBsettings.Arena.CurrentTimeText.Decimals == "3" then
				if VCBsettings.Arena.CurrentTimeText.Direction == G.OPTIONS_D_ASCENDING then
					function currentUpdate(self, i)
						_G["textCurrent"..i]:SetText(string.format("%.3f Sec", _G["Duration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Arena.CurrentTimeText.Direction == G.OPTIONS_D_DESCENDING then
					function currentUpdate(self, i)
						_G["textCurrent"..i]:SetText(string.format("%.3f Sec", _G["Duration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Arena.CurrentTimeText.Direction == G.OPTIONS_P_BOTH then
					function currentUpdate(self, i)
						if _G["castBar"..i] == "Cast" or _G["castBar"..i] == "Empower" then
							_G["textCurrent"..i]:SetText(string.format("%.3f Sec", _G["Duration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
						elseif _G["castBar"..i] == "Channel" then
							_G["textCurrent"..i]:SetText(string.format("%.3f Sec", _G["Duration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			end
		end
	elseif VCBsettings.Arena.CurrentTimeText.Position == G.OPTIONS_V_HIDE then
		function currentUpdate(self, i)
			return
		end
	end
end
-- check both casting time update
function VDW.VCB.chkBothUpdArena()
	if VCBsettings.Arena.BothTimeText.Position ~= G.OPTIONS_V_HIDE then
		if VCBsettings.Arena.BothTimeText.Sec == G.OPTIONS_V_HIDE then
			if VCBsettings.Arena.BothTimeText.Decimals == "0" then
				if VCBsettings.Arena.BothTimeText.Direction == G.OPTIONS_D_ASCENDING then
					function bothUpdate(self, i)
						_G["textBoth"..i]:SetText(string.format("%.0f / %.0f", _G["Duration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), _G["Duration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Arena.BothTimeText.Direction == G.OPTIONS_D_DESCENDING then
					function bothUpdate(self, i)
						_G["textBoth"..i]:SetText(string.format("%.0f / %.0f", _G["Duration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), _G["Duration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Arena.BothTimeText.Direction == G.OPTIONS_P_BOTH then
					function bothUpdate(self, i)
						if _G["castBar"..i] == "Cast" or _G["castBar"..i] == "Empower" then
							_G["textBoth"..i]:SetText(string.format("%.0f / %.0f", _G["Duration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), _G["Duration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						elseif _G["castBar"..i] == "Channel" then
							_G["textBoth"..i]:SetText(string.format("%.0f / %.0f", _G["Duration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), _G["Duration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			elseif VCBsettings.Arena.BothTimeText.Decimals == "1" then
				if VCBsettings.Arena.BothTimeText.Direction == G.OPTIONS_D_ASCENDING then
					function bothUpdate(self, i)
						_G["textBoth"..i]:SetText(string.format("%.1f / %.1f", _G["Duration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), _G["Duration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Arena.BothTimeText.Direction == G.OPTIONS_D_DESCENDING then
					function bothUpdate(self, i)
						_G["textBoth"..i]:SetText(string.format("%.1f / %.1f", _G["Duration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), _G["Duration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Arena.BothTimeText.Direction == G.OPTIONS_P_BOTH then
					function bothUpdate(self, i)
						if _G["castBar"..i] == "Cast" or _G["castBar"..i] == "Empower" then
							_G["textBoth"..i]:SetText(string.format("%.1f / %.1f", _G["Duration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), _G["Duration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						elseif _G["castBar"..i] == "Channel" then
							_G["textBoth"..i]:SetText(string.format("%.1f / %.1f", _G["Duration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), _G["Duration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			elseif VCBsettings.Arena.BothTimeText.Decimals == "2" then
				if VCBsettings.Arena.BothTimeText.Direction == G.OPTIONS_D_ASCENDING then
					function bothUpdate(self, i)
						_G["textBoth"..i]:SetText(string.format("%.2f / %.2f", _G["Duration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), _G["Duration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Arena.BothTimeText.Direction == G.OPTIONS_D_DESCENDING then
					function bothUpdate(self, i)
						_G["textBoth"..i]:SetText(string.format("%.2f / %.2f", _G["Duration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), _G["Duration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Arena.BothTimeText.Direction == G.OPTIONS_P_BOTH then
					function bothUpdate(self, i)
						if _G["castBar"..i] == "Cast" or _G["castBar"..i] == "Empower" then
							_G["textBoth"..i]:SetText(string.format("%.2f / %.2f", _G["Duration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), _G["Duration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						elseif _G["castBar"..i] == "Channel" then
							_G["textBoth"..i]:SetText(string.format("%.2f / %.2f", _G["Duration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), _G["Duration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			elseif VCBsettings.Arena.BothTimeText.Decimals == "3" then
				if VCBsettings.Arena.BothTimeText.Direction == G.OPTIONS_D_ASCENDING then
					function bothUpdate(self, i)
						_G["textBoth"..i]:SetText(string.format("%.3f / %.3f", _G["Duration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), _G["Duration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Arena.BothTimeText.Direction == G.OPTIONS_D_DESCENDING then
					function bothUpdate(self, i)
						_G["textBoth"..i]:SetText(string.format("%.3f / %.3f", _G["Duration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), _G["Duration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Arena.BothTimeText.Direction == G.OPTIONS_P_BOTH then
					function bothUpdate(self, i)
						if _G["castBar"..i] == "Cast" or _G["castBar"..i] == "Empower" then
							_G["textBoth"..i]:SetText(string.format("%.3f", _G["Duration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), _G["Duration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						elseif _G["castBar"..i] == "Channel" then
							_G["textBoth"..i]:SetText(string.format("%.3f / %.3f", _G["Duration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), _G["Duration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			end
		elseif VCBsettings.Arena.BothTimeText.Sec == G.OPTIONS_V_SHOW then
			if VCBsettings.Arena.BothTimeText.Decimals == "0" then
				if VCBsettings.Arena.BothTimeText.Direction == G.OPTIONS_D_ASCENDING then
					function bothUpdate(self, i)
						_G["textBoth"..i]:SetText(string.format("%.0f / %.0f Sec", _G["Duration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), _G["Duration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Arena.BothTimeText.Direction == G.OPTIONS_D_DESCENDING then
					function bothUpdate(self, i)
						_G["textBoth"..i]:SetText(string.format("%.0f / %.0f Sec", _G["Duration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), _G["Duration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Arena.BothTimeText.Direction == G.OPTIONS_P_BOTH then
					function bothUpdate(self, i)
						if _G["castBar"..i] == "Cast" or _G["castBar"..i] == "Empower" then
							_G["textBoth"..i]:SetText(string.format("%.0f / %.0f Sec", _G["Duration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), _G["Duration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						elseif _G["castBar"..i] == "Channel" then
							_G["textBoth"..i]:SetText(string.format("%.0f / %.0f Sec", _G["Duration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), _G["Duration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			elseif VCBsettings.Arena.BothTimeText.Decimals == "1" then
				if VCBsettings.Arena.BothTimeText.Direction == G.OPTIONS_D_ASCENDING then
					function bothUpdate(self, i)
						_G["textBoth"..i]:SetText(string.format("%.1f / %.1f Sec", _G["Duration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), _G["Duration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Arena.BothTimeText.Direction == G.OPTIONS_D_DESCENDING then
					function bothUpdate(self, i)
						_G["textBoth"..i]:SetText(string.format("%.1f / %.1f Sec", _G["Duration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), _G["Duration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Arena.BothTimeText.Direction == G.OPTIONS_P_BOTH then
					function bothUpdate(self, i)
						if _G["castBar"..i] == "Cast" or _G["castBar"..i] == "Empower" then
							_G["textBoth"..i]:SetText(string.format("%.1f / %.1f Sec", _G["Duration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), _G["Duration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						elseif _G["castBar"..i] == "Channel" then
							_G["textBoth"..i]:SetText(string.format("%.1f / %.1f Sec", _G["Duration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), _G["Duration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			elseif VCBsettings.Arena.BothTimeText.Decimals == "2" then
				if VCBsettings.Arena.BothTimeText.Direction == G.OPTIONS_D_ASCENDING then
					function bothUpdate(self, i)
						_G["textBoth"..i]:SetText(string.format("%.2f / %.2f Sec", _G["Duration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), _G["Duration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Arena.BothTimeText.Direction == G.OPTIONS_D_DESCENDING then
					function bothUpdate(self, i)
						_G["textBoth"..i]:SetText(string.format("%.2f / %.2f Sec", _G["Duration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), _G["Duration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Arena.BothTimeText.Direction == G.OPTIONS_P_BOTH then
					function bothUpdate(self, i)
						if _G["castBar"..i] == "Cast" or _G["castBar"..i] == "Empower" then
							_G["textBoth"..i]:SetText(string.format("%.2f / %.2f Sec", _G["Duration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), _G["Duration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						elseif _G["castBar"..i] == "Channel" then
							_G["textBoth"..i]:SetText(string.format("%.2f / %.2f Sec", _G["Duration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), _G["Duration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			elseif VCBsettings.Arena.BothTimeText.Decimals == "3" then
				if VCBsettings.Arena.BothTimeText.Direction == G.OPTIONS_D_ASCENDING then
					function bothUpdate(self, i)
						_G["textBoth"..i]:SetText(string.format("%.3f / %.3f Sec", _G["Duration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), _G["Duration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Arena.BothTimeText.Direction == G.OPTIONS_D_DESCENDING then
					function bothUpdate(self, i)
						_G["textBoth"..i]:SetText(string.format("%.3f / %.3f Sec", _G["Duration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), _G["Duration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Arena.BothTimeText.Direction == G.OPTIONS_P_BOTH then
					function bothUpdate(self, i)
						if _G["castBar"..i] == "Cast" or _G["castBar"..i] == "Empower" then
							_G["textBoth"..i]:SetText(string.format("%.3f / %.3f Sec", _G["Duration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), _G["Duration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						elseif _G["castBar"..i] == "Channel" then
							_G["textBoth"..i]:SetText(string.format("%.3f / %.3f Sec", _G["Duration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), _G["Duration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			end
		end
	elseif VCBsettings.Arena.BothTimeText.Position == G.OPTIONS_V_HIDE then
		function bothUpdate(self, i)
			return
		end
	end
end
-- check total casting time update
function VDW.VCB.chkTotalUpdArena()
	if VCBsettings.Arena.TotalTimeText.Position ~= G.OPTIONS_V_HIDE then
		if VCBsettings.Arena.TotalTimeText.Sec == G.OPTIONS_V_HIDE then
			if VCBsettings.Arena.TotalTimeText.Decimals == "0" then
				function totalUpdate(self, i)
					_G["textTotal"..i]:SetFormattedText("%.0f", _G["Duration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime))
				end
			elseif VCBsettings.Arena.TotalTimeText.Decimals == "1" then
				function totalUpdate(self, i)
					_G["textTotal"..i]:SetFormattedText("%.1f", _G["Duration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime))
				end
			elseif VCBsettings.Arena.TotalTimeText.Decimals == "2" then
				function totalUpdate(self, i)
					_G["textTotal"..i]:SetFormattedText("%.2f", _G["Duration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime))
				end
			elseif VCBsettings.Arena.TotalTimeText.Decimals == "3" then
				function totalUpdate(self, i)
					_G["textTotal"..i]:SetFormattedText("%.3f", _G["Duration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime))
				end
			end
		elseif VCBsettings.Arena.TotalTimeText.Sec == G.OPTIONS_V_SHOW then
			if VCBsettings.Arena.TotalTimeText.Decimals == "0" then
				function totalUpdate(self, i)
					_G["textTotal"..i]:SetFormattedText("%.0f sec", _G["Duration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime))
				end
			elseif VCBsettings.Arena.TotalTimeText.Decimals == "1" then
				function totalUpdate(self, i)
					_G["textTotal"..i]:SetFormattedText("%.1f sec", _G["Duration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime))
				end
			elseif VCBsettings.Arena.TotalTimeText.Decimals == "2" then
				function totalUpdate(self, i)
					_G["textTotal"..i]:SetFormattedText("%.2f sec", _G["Duration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime))
				end
			elseif VCBsettings.Arena.TotalTimeText.Decimals == "3" then
				function totalUpdate(self, i)
					_G["textTotal"..i]:SetFormattedText("%.3f sec", _G["Duration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime))
				end
			end
		end
	elseif VCBsettings.Arena.TotalTimeText.Position == G.OPTIONS_V_HIDE then
		function totalUpdate(self, i)
			return
		end
	end
end
-- =========================
-- checking color & style functions
-- =========================
-- check status bar color
function VDW.VCB.chkStatusColorArena()
	if VCBsettings["Arena"]["StatusBar"]["Color"] == G.OPTIONS_C_DEFAULT then
		function statusbarColor(self, i)
			self:SetStatusBarDesaturated(false)
			self:SetStatusBarColor(1, 1, 1, 1)
			if VCBsettings.Arena.StatusBar.Style == "Jailer" then
				self.Spark:SetDesaturated(true)
				self.Spark:SetVertexColor(jailerColor:GetRGB())
				self.Flash:SetDesaturated(true)
				self.Flash:SetVertexColor(jailerColor:GetRGB())
			else
				self.Spark:SetDesaturated(false)
				self.Spark:SetVertexColor(1, 1, 1, 1)
				self.Flash:SetDesaturated(false)
				self.Flash:SetVertexColor(1, 1, 1, 1)
			end
		end
	elseif VCBsettings["Arena"]["StatusBar"]["Color"] == G.OPTIONS_C_CLASS then
		function statusbarColor(self, i)
			self:SetStatusBarDesaturated(true)
			self:SetStatusBarColor(_G["vcbClassColorArena"..i]:GetRGB())
			self.Spark:SetDesaturated(true)
			self.Spark:SetVertexColor(_G["vcbClassColorArena"..i]:GetRGB())
			self.Flash:SetDesaturated(true)
			self.Flash:SetVertexColor(_G["vcbClassColorArena"..i]:GetRGB())
		end
	end
end
-- check border bar color
function VDW.VCB.chkBorderColorArena()
	if VCBsettings.Arena.Border.Color == G.OPTIONS_C_DEFAULT then
		function borderColor(self, i, bordertext1, bordertext2)
			self.Background:SetDesaturated(false)
			self.Border:SetDesaturated(false)
			bordertext1:SetDesaturated(false)
			bordertext2:SetDesaturated(false)
			self.Background:SetVertexColor(1, 1, 1, 1)
			self.Border:SetVertexColor(1, 1, 1, 1)
			bordertext1:SetVertexColor(1, 1, 1)
			bordertext2:SetVertexColor(1, 1, 1)
		end
	elseif VCBsettings.Arena.Border.Color == G.OPTIONS_C_CLASS then
		function borderColor(self, i, bordertext1, bordertext2)
			self.Background:SetDesaturated(true)
			self.Border:SetDesaturated(true)
			bordertext1:SetDesaturated(true)
			bordertext2:SetDesaturated(true)
			self.Background:SetVertexColor(_G["vcbClassColorArena"..i]:GetRGB())
			self.Border:SetVertexColor(_G["vcbClassColorArena"..i]:GetRGB())
			bordertext1:SetVertexColor(_G["vcbClassColorArena"..i]:GetRGB())
			bordertext2:SetVertexColor(_G["vcbClassColorArena"..i]:GetRGB())
		end
	end
end
-- call back the defaul color of status bar
local function defaultColor(self)
	self:SetStatusBarDesaturated(false)
	self:SetStatusBarColor(1, 1, 1, 1)
	if VCBsettings.Arena.StatusBar.Style == "Jailer" then
		self.Spark:SetDesaturated(true)
		self.Spark:SetVertexColor(jailerColor:GetRGB())
		self.Flash:SetDesaturated(true)
		self.Flash:SetVertexColor(jailerColor:GetRGB())
	else
		self.Spark:SetDesaturated(false)
		self.Spark:SetVertexColor(1, 1, 1, 1)
		self.Flash:SetDesaturated(false)
		self.Flash:SetVertexColor(1, 1, 1, 1)
	end
end
-- bar status style
function VDW.VCB.chkStatusStyleArena()
	if VCBsettings.Arena.StatusBar.Style == G.OPTIONS_C_DEFAULT then
		function statusbarStyle(self)
			return
		end
	elseif VCBsettings.Arena.StatusBar.Style == "Jailer" then
		function statusbarStyle(self)
			self:SetStatusBarTexture("jailerstower-scorebar-fill-onfire")
		end
	end
end
-- check border bar style
function VDW.VCB.chkBorderStyleArena()
	if VCBsettings.Arena.Border.Style == G.OPTIONS_C_DEFAULT then
		function borderStyle(self)
			return
		end
	elseif VCBsettings.Arena.Border.Style == "Jailer" then
		function borderStyle(self)
			self.Border:SetAtlas("jailerstower-scenario-TitleBG")
			self.Border:ClearAllPoints()
			self.Border:SetPoint("TOPLEFT", self, "TOPLEFT", 0, 9)
			self.Border:SetPoint("BOTTOMRIGHT", self, "BOTTOMRIGHT", 0, -7)
			self.Background:SetAtlas("jailerstower-scorebar-bgright-onfire")
			self.Background:SetDesaturated(true)
		end
	end
end
-- =========================
-- position & scale bar
-- =========================
-- position bar
local function positionBar(self)
	self:ClearAllPoints()
	self:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", VCBsettings["Arena"]["Position"]["X"], VCBsettings["Arena"]["Position"]["Y"])
end
-- scale bar
local function scaleBar(self)
	self:SetScale(VCBsettings["Arena"]["Scale"]/100)
end
-- =========================
-- class color
-- =========================
for i = 1, 3, 1 do
	_G["CompactArenaFrameMember"..i]:HookScript("OnUpdate", function(self)
		local classFilename = UnitClassBase("arena"..i)
		if classFilename ~= nil then _G["vcbClassColorArena"..i] = C_ClassColor.GetClassColor(classFilename) end
	end)
end
-- =========================
-- Events Time
-- =========================
local function EventsTime(self, event, arg1, arg2, arg3, arg4)
	if event == "PLAYER_LOGIN" then
		ProtectOptions()
		createTextures()
		createTexts()
		VDW.VCB.chkArenaIconPosition()
		VDW.VCB.chkArenaShieldPosition()
		VDW.VCB.chkArenaBorderTextPosition()
		VDW.VCB.chkNameTxtArena()
		VDW.VCB.chkCurrentTxtArena()
		VDW.VCB.chkBothTxtArena()
		VDW.VCB.chkTotalTxtArena()
		VDW.VCB.chkCurrentUpdArena()
		VDW.VCB.chkBothUpdArena()
		VDW.VCB.chkTotalUpdArena()
		VDW.VCB.chkStatusColorArena()
		VDW.VCB.chkBorderColorArena()
		VDW.VCB.chkStatusStyleArena()
		VDW.VCB.chkBorderStyleArena()
		for i = 1, 3, 1 do
-- hook part 1
			_G["CompactArenaFrameMember"..i].CastingBarFrame:HookScript("OnShow", function(self)
				_G["textName"..i]:SetWidth(self:GetWidth() - 8)
				namePosition(self, i)
				currentPostion(self, i)
				bothPostion(self, i)
				totalPostion(self, i)
				borderStyle(self)
			end)
-- hook part 2 A
			_G["CompactArenaFrameMember"..i].CastingBarFrame:HookScript("OnUpdate", function(self)
				self.TextBorder:SetAlpha(0)
				self.Text:SetAlpha(0)
				self.BorderShield:SetAlpha(0)
				self.Icon:SetAlpha(0)
				_G["TextBorderTop"..i]:SetAlpha(0.55)
				_G["TextBorderBottom"..i]:SetAlpha(0.55)
				if _G["Duration"..i] then
					_G["textName"..i]:SetText(self.Text:GetText())
					iconPosition(self, i)
					shieldPosition(_G["uninterruptible"..i], i)
					bordertextPosition (_G["TextBorderTop"..i], _G["TextBorderBottom"..i])
					if interrupted then
						_G["textCurrent"..i]:SetText("-")
						_G["textBoth"..i]:SetText("- / -")
						_G["textTotal"..i]:SetText("-")
					else
						currentUpdate(self, i)
						bothUpdate(self, i)
						totalUpdate(self, i)
					end
					statusbarColor(self, i)
					borderColor(self, i, _G["TextBorderTop"..i], _G["TextBorderBottom"..i])
					statusbarStyle(self)
				end
			end)
		end
-- hook part 2 B
		if VCBsettings["Arena"]["Lock"] == G.OPTIONS_LS_UNLOCKED then
			CompactArenaFrameMember1.CastingBarFrame:HookScript("OnUpdate", function(self)
				positionBar(self)
				scaleBar(self)
			end)
			for i=2, 3, 1 do
				_G["CompactArenaFrameMember"..i].CastingBarFrame:HookScript("OnUpdate", function(self)
					self:ClearAllPoints()
					self:SetPoint("TOP", _G["CompactArenaFrameMember"..i-1].CastingBarFrame, "BOTTOM", 0, -32)
					scaleBar(self)
				end)
			end
		end
	elseif event == "UNIT_SPELLCAST_START" then
		for i = 1, 3, 1 do
			if arg1 == "arena"..i then
				local castName, castText, castTex, _, _, isTradeSkill, _, castNotInterruptible = UnitCastingInfo(arg1)
				if castName then
					_G["Duration"..i] = UnitCastingDuration(arg1)
					_G["uninterruptible"..i] = castNotInterruptible
					_G["castBar"..i] = "Cast"
					_G["interrupted"..i] = false
				end
			end
		end
	elseif event == "UNIT_SPELLCAST_CHANNEL_START" then
		for i = 1, 3, 1 do
			if arg1 == "arena"..i then
				local chanName, chanText, chanTex, _, _, isTradeSkill, chanNotInterruptible, _, isEmpowered, numStages = UnitChannelInfo(arg1)
				if chanName then
					_G["Duration"..i] = UnitCastingDuration(arg1)
					_G["uninterruptible"..i] = castNotInterruptible
					_G["castBar"..i] = "Channel"
					_G["interrupted"..i] = false
				end
			end
		end
	elseif event == "UNIT_SPELLCAST_EMPOWER_START" then
		for i = 1, 3, 1 do
			if arg1 == "arena"..i then
				local chanName, chanText, chanTex, _, _, isTradeSkill, chanNotInterruptible, _, isEmpowered, numStages = UnitChannelInfo(arg1)
				if chanName then
					_G["Duration"..i] = UnitCastingDuration(arg1)
					_G["uninterruptible"..i] = castNotInterruptible
					_G["castBar"..i] = "Empower"
					_G["interrupted"..i] = false
				end
			end
		end
	elseif event == "UNIT_SPELLCAST_INTERRUPTED" then
		for i = 1, 3, 1 do
			if arg1 == "arena"..i then
				_G["interrupted"..i] = true
			end
		end
	end
end
vcbZlave:HookScript("OnEvent", EventsTime)
