-- =========================
-- some variables
-- =========================
local G = VDW.Local.Override
local iconSpellLeft1, iconSpellLeft2, iconSpellLeft3, iconSpellLeft4, iconSpellLeft5
local iconSpellRight1, iconSpellRight2, iconSpellRight3, iconSpellRight4, iconSpellRight5
local shieldSpellLeft1, shieldSpellLeft2, shieldSpellLeft3, shieldSpellLeft4, shieldSpellLeft5
local shieldSpellRight1, shieldSpellRight2, shieldSpellRight3, shieldSpellRight4, shieldSpellRight5
local TextBorderTop1, TextBorderTop2, TextBorderTop3, TextBorderTop4, TextBorderTop5
local TextBorderBottom1, TextBorderBottom2, TextBorderBottom3, TextBorderBottom4, TextBorderBottom5
local textName1, textName2, textName3, textName4, textName5
local textCurrent1, textCurrent2, textCurrent3, textCurrent4, textCurrent5
local textBoth1, textBoth2, textBoth3, textBoth4, textBoth5
local textTotal1, textTotal2, textTotal3, textTotal4, textTotal5
local Duration1, Duration2, Duration3, Duration4, Duration5
local uninterruptible1, uninterruptible2, uninterruptible3, uninterruptible4, uninterruptible5
local castBar1, castBar2, castBar3, castBar4, castBar5
local interrupted1, interrupted2, interrupted3, interrupted4, interrupted5
local vcbClassColorBoss1, vcbClassColorBoss2, vcbClassColorBoss3, vcbClassColorBoss4, vcbClassColorBoss5
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
	for i = 1, 5, 1 do
-- icon spell left
		_G["iconSpellLeft"..i] = _G["Boss"..i.."TargetFrameSpellBar"]:CreateTexture(nil, "ARTWORK", nil, 0)
-- icon spell right
		_G["iconSpellRight"..i] = _G["Boss"..i.."TargetFrameSpellBar"]:CreateTexture(nil, "ARTWORK", nil, 0)
-- shield icon left
		_G["shieldSpellLeft"..i] = _G["Boss"..i.."TargetFrameSpellBar"]:CreateTexture(nil, "BACKGROUND", nil, 0)
		Shields(_G["shieldSpellLeft"..i])
		_G["shieldSpellLeft"..i]:SetPoint("RIGHT", _G["Boss"..i.."TargetFrameSpellBar"], "LEFT", 0, 0)
-- shield icon right
		_G["shieldSpellRight"..i] = _G["Boss"..i.."TargetFrameSpellBar"]:CreateTexture(nil, "BACKGROUND", nil, 0)
		Shields(_G["shieldSpellRight"..i])
		_G["shieldSpellRight"..i]:SetPoint("LEFT", _G["Boss"..i.."TargetFrameSpellBar"], "RIGHT", 0, 0)
-- Text Border Top
		_G["TextBorderTop"..i] = _G["Boss"..i.."TargetFrameSpellBar"]:CreateTexture(nil, "BACKGROUND", nil, -7)
		Borders(_G["TextBorderTop"..i])
		_G["TextBorderTop"..i]:SetPoint("TOPLEFT", _G["Boss"..i.."TargetFrameSpellBar"], "TOPLEFT", 0, 12)
		_G["TextBorderTop"..i]:SetPoint("BOTTOMRIGHT", _G["Boss"..i.."TargetFrameSpellBar"], "BOTTOMRIGHT", 0, 4)
-- Text Border Bottom
		_G["TextBorderBottom"..i] = _G["Boss"..i.."TargetFrameSpellBar"]:CreateTexture(nil, "BACKGROUND", nil, -7)
		Borders(_G["TextBorderBottom"..i])
		_G["TextBorderBottom"..i]:SetPoint("TOPLEFT", _G["Boss"..i.."TargetFrameSpellBar"], "TOPLEFT", 0, -4)
		_G["TextBorderBottom"..i]:SetPoint("BOTTOMRIGHT", _G["Boss"..i.."TargetFrameSpellBar"], "BOTTOMRIGHT", 0, -12)
	end
end
-- =========================
-- extra texts
-- =========================
-- function for the texts
local function createTexts()
	local function Texts(var1)
		var1:SetFontObject("GameFontHighlightSmall")
	end
-- creating the texts
	for i = 1, 5, 1 do
		_G["textName"..i] = _G["Boss"..i.."TargetFrameSpellBar"]:CreateFontString(nil, "OVERLAY", nil)
		Texts(_G["textName"..i])
		_G["textCurrent"..i] = _G["Boss"..i.."TargetFrameSpellBar"]:CreateFontString(nil, "OVERLAY", nil)
		Texts(_G["textCurrent"..i])
		_G["textBoth"..i] = _G["Boss"..i.."TargetFrameSpellBar"]:CreateFontString(nil, "OVERLAY", nil)
		Texts(_G["textBoth"..i])
		_G["textTotal"..i] = _G["Boss"..i.."TargetFrameSpellBar"]:CreateFontString(nil, "OVERLAY", nil)
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
				if VCBsettings.Boss.Icon.Position == s then
					VCBsettings.Boss.Icon.Position = VDW.Local.Translate[loc][i]
				end
				if VCBsettings.Boss.Shield.Position == s then
					VCBsettings.Boss.Shield.Position = VDW.Local.Translate[loc][i]
				end
				if VCBsettings.Boss.TextBorder.Position == s then
					VCBsettings.Boss.TextBorder.Position = VDW.Local.Translate[loc][i]
				end
				if VCBsettings.Boss.NameText.Position == s then
					VCBsettings.Boss.NameText.Position = VDW.Local.Translate[loc][i]
				end
				if VCBsettings.Boss.CurrentTimeText.Position == s then
					VCBsettings.Boss.CurrentTimeText.Position = VDW.Local.Translate[loc][i]
				end
				if VCBsettings.Boss.BothTimeText.Position == s then
					VCBsettings.Boss.BothTimeText.Position = VDW.Local.Translate[loc][i]
				end
				if VCBsettings.Boss.TotalTimeText.Position == s then
					VCBsettings.Boss.TotalTimeText.Position = VDW.Local.Translate[loc][i]
				end
				if VCBsettings.Boss.CurrentTimeText.Direction == s then
					VCBsettings.Boss.CurrentTimeText.Direction = VDW.Local.Translate[loc][i]
				end
				if VCBsettings.Boss.BothTimeText.Direction == s then
					VCBsettings.Boss.BothTimeText.Direction = VDW.Local.Translate[loc][i]
				end
				if VCBsettings.Boss.CurrentTimeText.Sec == s then
					VCBsettings.Boss.CurrentTimeText.Sec = VDW.Local.Translate[loc][i]
				end
				if VCBsettings.Boss.BothTimeText.Sec == s then
					VCBsettings.Boss.BothTimeText.Sec = VDW.Local.Translate[loc][i]
				end
				if VCBsettings.Boss.TotalTimeText.Sec == s then
					VCBsettings.Boss.TotalTimeText.Sec = VDW.Local.Translate[loc][i]
				end
				if VCBsettings.Boss.StatusBar.Color == s then
					VCBsettings.Boss.StatusBar.Color = VDW.Local.Translate[loc][i]
				end
				if VCBsettings.Boss.StatusBar.Style == s then
					VCBsettings.Boss.StatusBar.Style = VDW.Local.Translate[loc][i]
				end
				if VCBsettings.Boss.Border.Color == s then
					VCBsettings.Boss.Border.Color = VDW.Local.Translate[loc][i]
				end
				if VCBsettings.Boss.Border.Style == s then
					VCBsettings.Boss.Border.Style = VDW.Local.Translate[loc][i]
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
function VDW.VCB.chkBossIconPosition()
	if VCBsettings["Boss"]["Icon"]["Position"] == G.OPTIONS_V_HIDE then
		function iconPosition(self, i)
			if _G["iconSpellLeft"..i]:IsShown() then _G["iconSpellLeft"..i]:Hide() end
			if _G["iconSpellRight"..i]:IsShown() then _G["iconSpellRight"..i]:Hide() end
		end
	elseif VCBsettings["Boss"]["Icon"]["Position"] == G.OPTIONS_P_LEFT then
		function iconPosition(self, i)
			_G["iconSpellLeft"..i]:ClearAllPoints()
			_G["iconSpellLeft"..i]:SetPoint("TOPLEFT", _G["shieldSpellLeft"..i], "TOPLEFT", 6, -6)
			_G["iconSpellLeft"..i]:SetPoint("BOTTOMRIGHT", _G["shieldSpellLeft"..i], "BOTTOMRIGHT", -6, 10)
			_G["iconSpellLeft"..i]:SetTexture(self.Icon:GetTextureFileID())
			if not _G["iconSpellLeft"..i]:IsShown() then _G["iconSpellLeft"..i]:Show() end
			if _G["iconSpellRight"..i]:IsShown() then _G["iconSpellRight"..i]:Hide() end
		end
	elseif VCBsettings["Boss"]["Icon"]["Position"] == G.OPTIONS_P_RIGHT then
		function iconPosition(self, i)
			if _G["iconSpellLeft"..i]:IsShown() then _G["iconSpellLeft"..i]:Hide() end
			_G["iconSpellRight"..i]:ClearAllPoints()
			_G["iconSpellRight"..i]:SetPoint("TOPLEFT", _G["shieldSpellRight"..i], "TOPLEFT", 6, -6)
			_G["iconSpellRight"..i]:SetPoint("BOTTOMRIGHT", _G["shieldSpellRight"..i], "BOTTOMRIGHT", -6, 10)
			_G["iconSpellRight"..i]:SetTexture(self.Icon:GetTextureFileID())
			if not _G["iconSpellRight"..i]:IsShown() then _G["iconSpellRight"..i]:Show() end
		end
	elseif VCBsettings["Boss"]["Icon"]["Position"] == G.OPTIONS_P_BOTH then	
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
function VDW.VCB.chkBossShieldPosition()
	if VCBsettings.Boss.Shield.Position == G.OPTIONS_V_HIDE then
		function shieldPosition(uninterruptible, i)
			_G["shieldSpellLeft"..i]:SetAlpha(0)
			_G["shieldSpellRight"..i]:SetAlpha(0)
		end
	elseif VCBsettings.Boss.Shield.Position == G.OPTIONS_P_LEFT then
		function shieldPosition(uninterruptible, i)
			_G["shieldSpellLeft"..i]:SetAlphaFromBoolean(uninterruptible, 150, 0)
			_G["shieldSpellRight"..i]:SetAlpha(0)
		end
	elseif VCBsettings.Boss.Shield.Position == G.OPTIONS_P_RIGHT then
		function shieldPosition(uninterruptible, i)
			_G["shieldSpellLeft"..i]:SetAlpha(0)
			_G["shieldSpellRight"..i]:SetAlphaFromBoolean(uninterruptible, 150, 0)
		end
	elseif VCBsettings.Boss.Shield.Position == G.OPTIONS_P_BOTH then
		function shieldPosition(uninterruptible, i)
			_G["shieldSpellLeft"..i]:SetAlphaFromBoolean(uninterruptible, 150, 0)
			_G["shieldSpellRight"..i]:SetAlphaFromBoolean(uninterruptible, 150, 0)
		end
	end
end
-- check text border
function VDW.VCB.chkBossBorderTextPosition()
	if VCBsettings.Boss.BorderText.Position == G.OPTIONS_V_HIDE then
		function bordertextPosition (bordertext1, bordertext2)
			bordertext1:Hide()
			bordertext2:Hide()
		end
	elseif VCBsettings.Boss.BorderText.Position == G.OPTIONS_P_TOP then
		function bordertextPosition (bordertext1, bordertext2)
			bordertext1:Show()
			bordertext2:Hide()
		end
	elseif VCBsettings.Boss.BorderText.Position == G.OPTIONS_P_BOTTOM then
		function bordertextPosition (bordertext1, bordertext2)
			bordertext1:Hide()
			bordertext2:Show()
		end
	elseif VCBsettings.Boss.BorderText.Position == G.OPTIONS_P_BOTH then
		function bordertextPosition (bordertext1, bordertext2)
			bordertext1:Show()
			bordertext2:Show()
		end
	end
end
-- check name text position
function VDW.VCB.chkNameTxtBoss()
	if VCBsettings["Boss"]["NameText"]["Position"] == G.OPTIONS_V_HIDE then
		function namePosition(self, i)
			if _G["textName"..i]:IsShown() then _G["textName"..i]:Hide() end
		end
	elseif VCBsettings["Boss"]["NameText"]["Position"] == G.OPTIONS_P_TOPLEFT then
		function namePosition(self, i)
			_G["textName"..i]:ClearAllPoints()
			_G["textName"..i]:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 4, 1)
			_G["textName"..i]:SetJustifyH("LEFT")
			if not _G["textName"..i]:IsShown() then _G["textName"..i]:Show() end
		end
	elseif VCBsettings["Boss"]["NameText"]["Position"] == G.OPTIONS_P_LEFT then
		function namePosition(self, i)
			_G["textName"..i]:ClearAllPoints()
			_G["textName"..i]:SetPoint("LEFT", self, "LEFT", 4, 0)
			_G["textName"..i]:SetJustifyH("LEFT")
			if not _G["textName"..i]:IsShown() then _G["textName"..i]:Show() end
		end
	elseif VCBsettings["Boss"]["NameText"]["Position"] == G.OPTIONS_P_BOTTOMLEFT then
		function namePosition(self, i)
			_G["textName"..i]:ClearAllPoints()
			_G["textName"..i]:SetPoint("TOPLEFT", self, "BOTTOMLEFT", 4, -1)
			_G["textName"..i]:SetJustifyH("LEFT")
			if not _G["textName"..i]:IsShown() then _G["textName"..i]:Show() end
		end
	elseif VCBsettings["Boss"]["NameText"]["Position"] == G.OPTIONS_P_TOP then
		function namePosition(self, i)
			_G["textName"..i]:ClearAllPoints()
			_G["textName"..i]:SetPoint("BOTTOM", self, "TOP", 0, 1)
			_G["textName"..i]:SetJustifyH("CENTER")
			if not _G["textName"..i]:IsShown() then _G["textName"..i]:Show() end
			end
	elseif VCBsettings["Boss"]["NameText"]["Position"] == G.OPTIONS_P_CENTER then
		function namePosition(self, i)
			_G["textName"..i]:ClearAllPoints()
			_G["textName"..i]:SetPoint("CENTER", self, "CENTER", 0, 0)
			_G["textName"..i]:SetJustifyH("CENTER")
			if not _G["textName"..i]:IsShown() then _G["textName"..i]:Show() end
			end
	elseif VCBsettings["Boss"]["NameText"]["Position"] == G.OPTIONS_P_BOTTOM then
		function namePosition(self, i)
			_G["textName"..i]:ClearAllPoints()
			_G["textName"..i]:SetPoint("TOP", self, "BOTTOM", 0, -1)
			_G["textName"..i]:SetJustifyH("CENTER")
			if not _G["textName"..i]:IsShown() then _G["textName"..i]:Show() end
		end
	elseif VCBsettings["Boss"]["NameText"]["Position"] == G.OPTIONS_P_TOPRIGHT then
		function namePosition(self, i)
			_G["textName"..i]:ClearAllPoints()
			_G["textName"..i]:SetPoint("BOTTOMRIGHT", self, "TOPRIGHT", -4, 1)
			_G["textName"..i]:SetJustifyH("RIGHT")
			if not _G["textName"..i]:IsShown() then _G["textName"..i]:Show() end
		end
	elseif VCBsettings["Boss"]["NameText"]["Position"] == G.OPTIONS_P_RIGHT then
		function namePosition(self, i)
			_G["textName"..i]:ClearAllPoints()
			_G["textName"..i]:SetPoint("RIGHT", self, "RIGHT", -4, 0)
			_G["textName"..i]:SetJustifyH("RIGHT")
			if not _G["textName"..i]:IsShown() then _G["textName"..i]:Show() end
		end
	elseif VCBsettings["Boss"]["NameText"]["Position"] == G.OPTIONS_P_BOTTOMRIGHT then
		function namePosition(self, i)
			_G["textName"..i]:ClearAllPoints()
			_G["textName"..i]:SetPoint("TOPRIGHT", self, "BOTTOMRIGHT", -4, -1)
			_G["textName"..i]:SetJustifyH("RIGHT")
			if not _G["textName"..i]:IsShown() then _G["textName"..i]:Show() end
		end
	end
end
-- check current casting time text position
function VDW.VCB.chkCurrentTxtBoss()
	if VCBsettings["Boss"]["CurrentTimeText"]["Position"] == G.OPTIONS_V_HIDE then
		function currentPostion(self, i)
			if _G["textCurrent"..i]:IsShown() then _G["textCurrent"..i]:Hide() end
		end
	elseif VCBsettings["Boss"]["CurrentTimeText"]["Position"] == G.OPTIONS_P_TOPLEFT then
		function currentPostion(self, i)
			_G["textCurrent"..i]:ClearAllPoints()
			_G["textCurrent"..i]:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 4, 1)
			if not _G["textCurrent"..i]:IsShown() then _G["textCurrent"..i]:Show() end
		end
	elseif VCBsettings["Boss"]["CurrentTimeText"]["Position"] == G.OPTIONS_P_LEFT then
		function currentPostion(self, i)
			_G["textCurrent"..i]:ClearAllPoints()
			_G["textCurrent"..i]:SetPoint("LEFT", self, "LEFT", 4, 0)
			if not _G["textCurrent"..i]:IsShown() then _G["textCurrent"..i]:Show() end
		end
	elseif VCBsettings["Boss"]["CurrentTimeText"]["Position"] == G.OPTIONS_P_BOTTOMLEFT then
		function currentPostion(self, i)
			_G["textCurrent"..i]:ClearAllPoints()
			_G["textCurrent"..i]:SetPoint("TOPLEFT", self, "BOTTOMLEFT", 4, -1)
			if not _G["textCurrent"..i]:IsShown() then _G["textCurrent"..i]:Show() end
		end
	elseif VCBsettings["Boss"]["CurrentTimeText"]["Position"] == G.OPTIONS_P_TOP then
		function currentPostion(self, i)
			_G["textCurrent"..i]:ClearAllPoints()
			_G["textCurrent"..i]:SetPoint("BOTTOM", self, "TOP", 0, 1)
			if not _G["textCurrent"..i]:IsShown() then _G["textCurrent"..i]:Show() end
		end
	elseif VCBsettings["Boss"]["CurrentTimeText"]["Position"] == G.OPTIONS_P_CENTER then
		function currentPostion(self, i)
			_G["textCurrent"..i]:ClearAllPoints()
			_G["textCurrent"..i]:SetPoint("CENTER", self, "CENTER", 0, 0)
			if not _G["textCurrent"..i]:IsShown() then _G["textCurrent"..i]:Show() end
		end
	elseif VCBsettings["Boss"]["CurrentTimeText"]["Position"] == G.OPTIONS_P_BOTTOM then
		function currentPostion(self, i)
			_G["textCurrent"..i]:ClearAllPoints()
			_G["textCurrent"..i]:SetPoint("TOP", self, "BOTTOM", 0, -1)
			if not _G["textCurrent"..i]:IsShown() then _G["textCurrent"..i]:Show() end
		end
	elseif VCBsettings["Boss"]["CurrentTimeText"]["Position"] == G.OPTIONS_P_TOPRIGHT then
		function currentPostion(self, i)
			_G["textCurrent"..i]:ClearAllPoints()
			_G["textCurrent"..i]:SetPoint("BOTTOMRIGHT", self, "TOPRIGHT", -4, 1)
			if not _G["textCurrent"..i]:IsShown() then _G["textCurrent"..i]:Show() end
		end
	elseif VCBsettings["Boss"]["CurrentTimeText"]["Position"] == G.OPTIONS_P_RIGHT then
		function currentPostion(self, i)
			_G["textCurrent"..i]:ClearAllPoints()
			_G["textCurrent"..i]:SetPoint("RIGHT", self, "RIGHT", -4, 0)
			if not _G["textCurrent"..i]:IsShown() then _G["textCurrent"..i]:Show() end
		end
	elseif VCBsettings["Boss"]["CurrentTimeText"]["Position"] == G.OPTIONS_P_BOTTOMRIGHT then
		function currentPostion(self, i)
			_G["textCurrent"..i]:ClearAllPoints()
			_G["textCurrent"..i]:SetPoint("TOPRIGHT", self, "BOTTOMRIGHT", -4, -1)
			if not _G["textCurrent"..i]:IsShown() then _G["textCurrent"..i]:Show() end
		end
	end
end
-- check both casting time text position
function VDW.VCB.chkBothTxtBoss()
	if VCBsettings["Boss"]["BothTimeText"]["Position"] == G.OPTIONS_V_HIDE then
		function bothPostion(self, i)
			if _G["textBoth"..i]:IsShown() then _G["textBoth"..i]:Hide() end
		end
	elseif VCBsettings["Boss"]["BothTimeText"]["Position"] == G.OPTIONS_P_TOPLEFT then
		function bothPostion(self, i)
			_G["textBoth"..i]:ClearAllPoints()
			_G["textBoth"..i]:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 4, 1)
			if not _G["textBoth"..i]:IsShown() then _G["textBoth"..i]:Show() end
		end
	elseif VCBsettings["Boss"]["BothTimeText"]["Position"] == G.OPTIONS_P_LEFT then
		function bothPostion(self, i)
			_G["textBoth"..i]:ClearAllPoints()
			_G["textBoth"..i]:SetPoint("LEFT", self, "LEFT", 4, 0)
			if not _G["textBoth"..i]:IsShown() then _G["textBoth"..i]:Show() end
		end
	elseif VCBsettings["Boss"]["BothTimeText"]["Position"] == G.OPTIONS_P_BOTTOMLEFT then
		function bothPostion(self, i)
			_G["textBoth"..i]:ClearAllPoints()
			_G["textBoth"..i]:SetPoint("TOPLEFT", self, "BOTTOMLEFT", 4, -1)
			if not _G["textBoth"..i]:IsShown() then _G["textBoth"..i]:Show() end
		end
	elseif VCBsettings["Boss"]["BothTimeText"]["Position"] == G.OPTIONS_P_TOP then
		function bothPostion(self, i)
			_G["textBoth"..i]:ClearAllPoints()
			_G["textBoth"..i]:SetPoint("BOTTOM", self, "TOP", 0, 1)
			if not _G["textBoth"..i]:IsShown() then _G["textBoth"..i]:Show() end
		end
	elseif VCBsettings["Boss"]["BothTimeText"]["Position"] == G.OPTIONS_P_CENTER then
		function bothPostion(self, i)
			_G["textBoth"..i]:ClearAllPoints()
			_G["textBoth"..i]:SetPoint("CENTER", self, "CENTER", 0, 0)
			if not _G["textBoth"..i]:IsShown() then _G["textBoth"..i]:Show() end
		end
	elseif VCBsettings["Boss"]["BothTimeText"]["Position"] == G.OPTIONS_P_BOTTOM then
		function bothPostion(self, i)
			_G["textBoth"..i]:ClearAllPoints()
			_G["textBoth"..i]:SetPoint("TOP", self, "BOTTOM", 0, -1)
			if not _G["textBoth"..i]:IsShown() then _G["textBoth"..i]:Show() end
		end
	elseif VCBsettings["Boss"]["BothTimeText"]["Position"] == G.OPTIONS_P_TOPRIGHT then
		function bothPostion(self, i)
			_G["textBoth"..i]:ClearAllPoints()
			_G["textBoth"..i]:SetPoint("BOTTOMRIGHT", self, "TOPRIGHT", -4, 1)
			if not _G["textBoth"..i]:IsShown() then _G["textBoth"..i]:Show() end
		end
	elseif VCBsettings["Boss"]["BothTimeText"]["Position"] == G.OPTIONS_P_RIGHT then
		function bothPostion(self, i)
			_G["textBoth"..i]:ClearAllPoints()
			_G["textBoth"..i]:SetPoint("RIGHT", self, "RIGHT", -4, 0)
			if not _G["textBoth"..i]:IsShown() then _G["textBoth"..i]:Show() end
		end
	elseif VCBsettings["Boss"]["BothTimeText"]["Position"] == G.OPTIONS_P_BOTTOMRIGHT then
		function bothPostion(self, i)
			_G["textBoth"..i]:ClearAllPoints()
			_G["textBoth"..i]:SetPoint("TOPRIGHT", self, "BOTTOMRIGHT", -4, -1)
			if not _G["textBoth"..i]:IsShown() then _G["textBoth"..i]:Show() end
		end
	end
end
-- check total casting time text position
function VDW.VCB.chkTotalTxtBoss()
	if VCBsettings["Boss"]["TotalTimeText"]["Position"] == G.OPTIONS_V_HIDE then
		function totalPostion(self, i)
			if _G["textTotal"..i]:IsShown() then _G["textTotal"..i]:Hide() end
		end
	elseif VCBsettings["Boss"]["TotalTimeText"]["Position"] == G.OPTIONS_P_TOPLEFT then
		function totalPostion(self, i)
			_G["textTotal"..i]:ClearAllPoints()
			_G["textTotal"..i]:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 4, 1)
			if not _G["textTotal"..i]:IsShown() then _G["textTotal"..i]:Show() end
		end
	elseif VCBsettings["Boss"]["TotalTimeText"]["Position"] == G.OPTIONS_P_LEFT then
		function totalPostion(self, i)
			_G["textTotal"..i]:ClearAllPoints()
			_G["textTotal"..i]:SetPoint("LEFT", self, "LEFT", 4, 0)
			if not _G["textTotal"..i]:IsShown() then _G["textTotal"..i]:Show() end
		end
	elseif VCBsettings["Boss"]["TotalTimeText"]["Position"] == G.OPTIONS_P_BOTTOMLEFT then
		function totalPostion(self, i)
			_G["textTotal"..i]:ClearAllPoints()
			_G["textTotal"..i]:SetPoint("TOPLEFT", self, "BOTTOMLEFT", 4, -1)
			if not _G["textTotal"..i]:IsShown() then _G["textTotal"..i]:Show() end
		end
	elseif VCBsettings["Boss"]["TotalTimeText"]["Position"] == G.OPTIONS_P_TOP then
		function totalPostion(self, i)
			_G["textTotal"..i]:ClearAllPoints()
			_G["textTotal"..i]:SetPoint("BOTTOM", self, "TOP", 0, 1)
			if not _G["textTotal"..i]:IsShown() then _G["textTotal"..i]:Show() end
		end
	elseif VCBsettings["Boss"]["TotalTimeText"]["Position"] == G.OPTIONS_P_CENTER then
		function totalPostion(self, i)
			_G["textTotal"..i]:ClearAllPoints()
			_G["textTotal"..i]:SetPoint("CENTER", self, "CENTER", 0, 0)
			if not _G["textTotal"..i]:IsShown() then _G["textTotal"..i]:Show() end
		end
	elseif VCBsettings["Boss"]["TotalTimeText"]["Position"] == G.OPTIONS_P_BOTTOM then
		function totalPostion(self, i)
			_G["textTotal"..i]:ClearAllPoints()
			_G["textTotal"..i]:SetPoint("TOP", self, "BOTTOM", 0, -1)
			if not _G["textTotal"..i]:IsShown() then _G["textTotal"..i]:Show() end
		end
	elseif VCBsettings["Boss"]["TotalTimeText"]["Position"] == G.OPTIONS_P_TOPRIGHT then
		function totalPostion(self, i)
			_G["textTotal"..i]:ClearAllPoints()
			_G["textTotal"..i]:SetPoint("BOTTOMRIGHT", self, "TOPRIGHT", -4, 1)
			if not _G["textTotal"..i]:IsShown() then _G["textTotal"..i]:Show() end
		end
	elseif VCBsettings["Boss"]["TotalTimeText"]["Position"] == G.OPTIONS_P_RIGHT then
		function totalPostion(self, i)
			_G["textTotal"..i]:ClearAllPoints()
			_G["textTotal"..i]:SetPoint("RIGHT", self, "RIGHT", -4, 0)
			if not _G["textTotal"..i]:IsShown() then _G["textTotal"..i]:Show() end
		end
	elseif VCBsettings["Boss"]["TotalTimeText"]["Position"] == G.OPTIONS_P_BOTTOMRIGHT then
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
function VDW.VCB.chkCurrentUpdBoss()
	if VCBsettings.Boss.CurrentTimeText.Position ~= G.OPTIONS_V_HIDE then
		if VCBsettings.Boss.CurrentTimeText.Sec == G.OPTIONS_V_HIDE then
			if VCBsettings.Boss.CurrentTimeText.Decimals == "0" then
				if VCBsettings.Boss.CurrentTimeText.Direction == G.OPTIONS_D_ASCENDING then
					function currentUpdate(self, i)
						_G["textCurrent"..i]:SetText(string.format("%.0f", _G["Duration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Boss.CurrentTimeText.Direction == G.OPTIONS_D_DESCENDING then
					function currentUpdate(self, i)
						_G["textCurrent"..i]:SetText(string.format("%.0f", _G["Duration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Boss.CurrentTimeText.Direction == G.OPTIONS_P_BOTH then
					function currentUpdate(self, i)
						if _G["castBar"..i] == "Cast" or _G["castBar"..i] == "Empower" then
							_G["textCurrent"..i]:SetText(string.format("%.0f", _G["Duration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
						elseif _G["castBar"..i] == "Channel" then
							_G["textCurrent"..i]:SetText(string.format("%.0f", _G["Duration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			elseif VCBsettings.Boss.CurrentTimeText.Decimals == "1" then
				if VCBsettings.Boss.CurrentTimeText.Direction == G.OPTIONS_D_ASCENDING then
					function currentUpdate(self, i)
						_G["textCurrent"..i]:SetText(string.format("%.1f", _G["Duration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Boss.CurrentTimeText.Direction == G.OPTIONS_D_DESCENDING then
					function currentUpdate(self, i)
						_G["textCurrent"..i]:SetText(string.format("%.1f", _G["Duration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Boss.CurrentTimeText.Direction == G.OPTIONS_P_BOTH then
					function currentUpdate(self, i)
						if _G["castBar"..i] == "Cast" or _G["castBar"..i] == "Empower" then
							_G["textCurrent"..i]:SetText(string.format("%.1f", _G["Duration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
						elseif _G["castBar"..i] == "Channel" then
							_G["textCurrent"..i]:SetText(string.format("%.1f", _G["Duration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			elseif VCBsettings.Boss.CurrentTimeText.Decimals == "2" then
				if VCBsettings.Boss.CurrentTimeText.Direction == G.OPTIONS_D_ASCENDING then
					function currentUpdate(self, i)
						_G["textCurrent"..i]:SetText(string.format("%.2f", _G["Duration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Boss.CurrentTimeText.Direction == G.OPTIONS_D_DESCENDING then
					function currentUpdate(self, i)
						_G["textCurrent"..i]:SetText(string.format("%.2f", _G["Duration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Boss.CurrentTimeText.Direction == G.OPTIONS_P_BOTH then
					function currentUpdate(self, i)
						if _G["castBar"..i] == "Cast" or _G["castBar"..i] == "Empower" then
							_G["textCurrent"..i]:SetText(string.format("%.2f", _G["Duration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
						elseif _G["castBar"..i] == "Channel" then
							_G["textCurrent"..i]:SetText(string.format("%.2f", _G["Duration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			elseif VCBsettings.Boss.CurrentTimeText.Decimals == "3" then
				if VCBsettings.Boss.CurrentTimeText.Direction == G.OPTIONS_D_ASCENDING then
					function currentUpdate(self, i)
						_G["textCurrent"..i]:SetText(string.format("%.3f", _G["Duration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Boss.CurrentTimeText.Direction == G.OPTIONS_D_DESCENDING then
					function currentUpdate(self, i)
						_G["textCurrent"..i]:SetText(string.format("%.3f", _G["Duration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Boss.CurrentTimeText.Direction == G.OPTIONS_P_BOTH then
					function currentUpdate(self, i)
						if _G["castBar"..i] == "Cast" or _G["castBar"..i] == "Empower" then
							_G["textCurrent"..i]:SetText(string.format("%.3f", _G["Duration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
						elseif _G["castBar"..i] == "Channel" then
							_G["textCurrent"..i]:SetText(string.format("%.3f", _G["Duration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			end
		elseif VCBsettings.Boss.CurrentTimeText.Sec == G.OPTIONS_V_SHOW then
			if VCBsettings.Boss.CurrentTimeText.Decimals == "0" then
				if VCBsettings.Boss.CurrentTimeText.Direction == G.OPTIONS_D_ASCENDING then
					function currentUpdate(self, i)
						_G["textCurrent"..i]:SetText(string.format("%.0f Sec", _G["Duration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Boss.CurrentTimeText.Direction == G.OPTIONS_D_DESCENDING then
					function currentUpdate(self, i)
						_G["textCurrent"..i]:SetText(string.format("%.0f Sec", _G["Duration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Boss.CurrentTimeText.Direction == G.OPTIONS_P_BOTH then
					function currentUpdate(self, i)
						if _G["castBar"..i] == "Cast" or _G["castBar"..i] == "Empower" then
							_G["textCurrent"..i]:SetText(string.format("%.0f Sec", _G["Duration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
						elseif _G["castBar"..i] == "Channel" then
							_G["textCurrent"..i]:SetText(string.format("%.0f Sec", _G["Duration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			elseif VCBsettings.Boss.CurrentTimeText.Decimals == "1" then
				if VCBsettings.Boss.CurrentTimeText.Direction == G.OPTIONS_D_ASCENDING then
					function currentUpdate(self, i)
						_G["textCurrent"..i]:SetText(string.format("%.1f Sec", _G["Duration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Boss.CurrentTimeText.Direction == G.OPTIONS_D_DESCENDING then
					function currentUpdate(self, i)
						_G["textCurrent"..i]:SetText(string.format("%.1f Sec", _G["Duration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Boss.CurrentTimeText.Direction == G.OPTIONS_P_BOTH then
					function currentUpdate(self, i)
						if _G["castBar"..i] == "Cast" or _G["castBar"..i] == "Empower" then
							_G["textCurrent"..i]:SetText(string.format("%.1f Sec", _G["Duration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
						elseif _G["castBar"..i] == "Channel" then
							_G["textCurrent"..i]:SetText(string.format("%.1f Sec", _G["Duration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			elseif VCBsettings.Boss.CurrentTimeText.Decimals == "2" then
				if VCBsettings.Boss.CurrentTimeText.Direction == G.OPTIONS_D_ASCENDING then
					function currentUpdate(self, i)
						_G["textCurrent"..i]:SetText(string.format("%.2f Sec", _G["Duration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Boss.CurrentTimeText.Direction == G.OPTIONS_D_DESCENDING then
					function currentUpdate(self, i)
						_G["textCurrent"..i]:SetText(string.format("%.2f Sec", _G["Duration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Boss.CurrentTimeText.Direction == G.OPTIONS_P_BOTH then
					function currentUpdate(self, i)
						if _G["castBar"..i] == "Cast" or _G["castBar"..i] == "Empower" then
							_G["textCurrent"..i]:SetText(string.format("%.2f Sec", _G["Duration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
						elseif _G["castBar"..i] == "Channel" then
							_G["textCurrent"..i]:SetText(string.format("%.2f Sec", _G["Duration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			elseif VCBsettings.Boss.CurrentTimeText.Decimals == "3" then
				if VCBsettings.Boss.CurrentTimeText.Direction == G.OPTIONS_D_ASCENDING then
					function currentUpdate(self, i)
						_G["textCurrent"..i]:SetText(string.format("%.3f Sec", _G["Duration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Boss.CurrentTimeText.Direction == G.OPTIONS_D_DESCENDING then
					function currentUpdate(self, i)
						_G["textCurrent"..i]:SetText(string.format("%.3f Sec", _G["Duration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Boss.CurrentTimeText.Direction == G.OPTIONS_P_BOTH then
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
	elseif VCBsettings.Boss.CurrentTimeText.Position == G.OPTIONS_V_HIDE then
		function currentUpdate(self, i)
			return
		end
	end
end
-- check both casting time update
function VDW.VCB.chkBothUpdBoss()
	if VCBsettings.Boss.BothTimeText.Position ~= G.OPTIONS_V_HIDE then
		if VCBsettings.Boss.BothTimeText.Sec == G.OPTIONS_V_HIDE then
			if VCBsettings.Boss.BothTimeText.Decimals == "0" then
				if VCBsettings.Boss.BothTimeText.Direction == G.OPTIONS_D_ASCENDING then
					function bothUpdate(self, i)
						_G["textBoth"..i]:SetText(string.format("%.0f / %.0f", _G["Duration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), _G["Duration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Boss.BothTimeText.Direction == G.OPTIONS_D_DESCENDING then
					function bothUpdate(self, i)
						_G["textBoth"..i]:SetText(string.format("%.0f / %.0f", _G["Duration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), _G["Duration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Boss.BothTimeText.Direction == G.OPTIONS_P_BOTH then
					function bothUpdate(self, i)
						if _G["castBar"..i] == "Cast" or _G["castBar"..i] == "Empower" then
							_G["textBoth"..i]:SetText(string.format("%.0f / %.0f", _G["Duration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), _G["Duration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						elseif _G["castBar"..i] == "Channel" then
							_G["textBoth"..i]:SetText(string.format("%.0f / %.0f", _G["Duration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), _G["Duration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			elseif VCBsettings.Boss.BothTimeText.Decimals == "1" then
				if VCBsettings.Boss.BothTimeText.Direction == G.OPTIONS_D_ASCENDING then
					function bothUpdate(self, i)
						_G["textBoth"..i]:SetText(string.format("%.1f / %.1f", _G["Duration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), _G["Duration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Boss.BothTimeText.Direction == G.OPTIONS_D_DESCENDING then
					function bothUpdate(self, i)
						_G["textBoth"..i]:SetText(string.format("%.1f / %.1f", _G["Duration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), _G["Duration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Boss.BothTimeText.Direction == G.OPTIONS_P_BOTH then
					function bothUpdate(self, i)
						if _G["castBar"..i] == "Cast" or _G["castBar"..i] == "Empower" then
							_G["textBoth"..i]:SetText(string.format("%.1f / %.1f", _G["Duration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), _G["Duration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						elseif _G["castBar"..i] == "Channel" then
							_G["textBoth"..i]:SetText(string.format("%.1f / %.1f", _G["Duration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), _G["Duration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			elseif VCBsettings.Boss.BothTimeText.Decimals == "2" then
				if VCBsettings.Boss.BothTimeText.Direction == G.OPTIONS_D_ASCENDING then
					function bothUpdate(self, i)
						_G["textBoth"..i]:SetText(string.format("%.2f / %.2f", _G["Duration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), _G["Duration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Boss.BothTimeText.Direction == G.OPTIONS_D_DESCENDING then
					function bothUpdate(self, i)
						_G["textBoth"..i]:SetText(string.format("%.2f / %.2f", _G["Duration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), _G["Duration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Boss.BothTimeText.Direction == G.OPTIONS_P_BOTH then
					function bothUpdate(self, i)
						if _G["castBar"..i] == "Cast" or _G["castBar"..i] == "Empower" then
							_G["textBoth"..i]:SetText(string.format("%.2f / %.2f", _G["Duration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), _G["Duration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						elseif _G["castBar"..i] == "Channel" then
							_G["textBoth"..i]:SetText(string.format("%.2f / %.2f", _G["Duration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), _G["Duration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			elseif VCBsettings.Boss.BothTimeText.Decimals == "3" then
				if VCBsettings.Boss.BothTimeText.Direction == G.OPTIONS_D_ASCENDING then
					function bothUpdate(self, i)
						_G["textBoth"..i]:SetText(string.format("%.3f / %.3f", _G["Duration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), _G["Duration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Boss.BothTimeText.Direction == G.OPTIONS_D_DESCENDING then
					function bothUpdate(self, i)
						_G["textBoth"..i]:SetText(string.format("%.3f / %.3f", _G["Duration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), _G["Duration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Boss.BothTimeText.Direction == G.OPTIONS_P_BOTH then
					function bothUpdate(self, i)
						if _G["castBar"..i] == "Cast" or _G["castBar"..i] == "Empower" then
							_G["textBoth"..i]:SetText(string.format("%.3f", _G["Duration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), _G["Duration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						elseif _G["castBar"..i] == "Channel" then
							_G["textBoth"..i]:SetText(string.format("%.3f / %.3f", _G["Duration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), _G["Duration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			end
		elseif VCBsettings.Boss.BothTimeText.Sec == G.OPTIONS_V_SHOW then
			if VCBsettings.Boss.BothTimeText.Decimals == "0" then
				if VCBsettings.Boss.BothTimeText.Direction == G.OPTIONS_D_ASCENDING then
					function bothUpdate(self, i)
						_G["textBoth"..i]:SetText(string.format("%.0f / %.0f Sec", _G["Duration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), _G["Duration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Boss.BothTimeText.Direction == G.OPTIONS_D_DESCENDING then
					function bothUpdate(self, i)
						_G["textBoth"..i]:SetText(string.format("%.0f / %.0f Sec", _G["Duration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), _G["Duration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Boss.BothTimeText.Direction == G.OPTIONS_P_BOTH then
					function bothUpdate(self, i)
						if _G["castBar"..i] == "Cast" or _G["castBar"..i] == "Empower" then
							_G["textBoth"..i]:SetText(string.format("%.0f / %.0f Sec", _G["Duration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), _G["Duration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						elseif _G["castBar"..i] == "Channel" then
							_G["textBoth"..i]:SetText(string.format("%.0f / %.0f Sec", _G["Duration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), _G["Duration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			elseif VCBsettings.Boss.BothTimeText.Decimals == "1" then
				if VCBsettings.Boss.BothTimeText.Direction == G.OPTIONS_D_ASCENDING then
					function bothUpdate(self, i)
						_G["textBoth"..i]:SetText(string.format("%.1f / %.1f Sec", _G["Duration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), _G["Duration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Boss.BothTimeText.Direction == G.OPTIONS_D_DESCENDING then
					function bothUpdate(self, i)
						_G["textBoth"..i]:SetText(string.format("%.1f / %.1f Sec", _G["Duration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), _G["Duration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Boss.BothTimeText.Direction == G.OPTIONS_P_BOTH then
					function bothUpdate(self, i)
						if _G["castBar"..i] == "Cast" or _G["castBar"..i] == "Empower" then
							_G["textBoth"..i]:SetText(string.format("%.1f / %.1f Sec", _G["Duration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), _G["Duration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						elseif _G["castBar"..i] == "Channel" then
							_G["textBoth"..i]:SetText(string.format("%.1f / %.1f Sec", _G["Duration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), _G["Duration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			elseif VCBsettings.Boss.BothTimeText.Decimals == "2" then
				if VCBsettings.Boss.BothTimeText.Direction == G.OPTIONS_D_ASCENDING then
					function bothUpdate(self, i)
						_G["textBoth"..i]:SetText(string.format("%.2f / %.2f Sec", _G["Duration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), _G["Duration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Boss.BothTimeText.Direction == G.OPTIONS_D_DESCENDING then
					function bothUpdate(self, i)
						_G["textBoth"..i]:SetText(string.format("%.2f / %.2f Sec", _G["Duration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), _G["Duration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Boss.BothTimeText.Direction == G.OPTIONS_P_BOTH then
					function bothUpdate(self, i)
						if _G["castBar"..i] == "Cast" or _G["castBar"..i] == "Empower" then
							_G["textBoth"..i]:SetText(string.format("%.2f / %.2f Sec", _G["Duration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), _G["Duration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						elseif _G["castBar"..i] == "Channel" then
							_G["textBoth"..i]:SetText(string.format("%.2f / %.2f Sec", _G["Duration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), _G["Duration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			elseif VCBsettings.Boss.BothTimeText.Decimals == "3" then
				if VCBsettings.Boss.BothTimeText.Direction == G.OPTIONS_D_ASCENDING then
					function bothUpdate(self, i)
						_G["textBoth"..i]:SetText(string.format("%.3f / %.3f Sec", _G["Duration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), _G["Duration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Boss.BothTimeText.Direction == G.OPTIONS_D_DESCENDING then
					function bothUpdate(self, i)
						_G["textBoth"..i]:SetText(string.format("%.3f / %.3f Sec", _G["Duration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), _G["Duration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Boss.BothTimeText.Direction == G.OPTIONS_P_BOTH then
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
	elseif VCBsettings.Boss.BothTimeText.Position == G.OPTIONS_V_HIDE then
		function bothUpdate(self, i)
			return
		end
	end
end
-- check total casting time update
function VDW.VCB.chkTotalUpdBoss()
	if VCBsettings.Boss.TotalTimeText.Position ~= G.OPTIONS_V_HIDE then
		if VCBsettings.Boss.TotalTimeText.Sec == G.OPTIONS_V_HIDE then
			if VCBsettings.Boss.TotalTimeText.Decimals == "0" then
				function totalUpdate(self, i)
					_G["textTotal"..i]:SetFormattedText("%.0f", _G["Duration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime))
				end
			elseif VCBsettings.Boss.TotalTimeText.Decimals == "1" then
				function totalUpdate(self, i)
					_G["textTotal"..i]:SetFormattedText("%.1f", _G["Duration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime))
				end
			elseif VCBsettings.Boss.TotalTimeText.Decimals == "2" then
				function totalUpdate(self, i)
					_G["textTotal"..i]:SetFormattedText("%.2f", _G["Duration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime))
				end
			elseif VCBsettings.Boss.TotalTimeText.Decimals == "3" then
				function totalUpdate(self, i)
					_G["textTotal"..i]:SetFormattedText("%.3f", _G["Duration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime))
				end
			end
		elseif VCBsettings.Boss.TotalTimeText.Sec == G.OPTIONS_V_SHOW then
			if VCBsettings.Boss.TotalTimeText.Decimals == "0" then
				function totalUpdate(self, i)
					_G["textTotal"..i]:SetFormattedText("%.0f sec", _G["Duration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime))
				end
			elseif VCBsettings.Boss.TotalTimeText.Decimals == "1" then
				function totalUpdate(self, i)
					_G["textTotal"..i]:SetFormattedText("%.1f sec", _G["Duration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime))
				end
			elseif VCBsettings.Boss.TotalTimeText.Decimals == "2" then
				function totalUpdate(self, i)
					_G["textTotal"..i]:SetFormattedText("%.2f sec", _G["Duration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime))
				end
			elseif VCBsettings.Boss.TotalTimeText.Decimals == "3" then
				function totalUpdate(self, i)
					_G["textTotal"..i]:SetFormattedText("%.3f sec", _G["Duration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime))
				end
			end
		end
	elseif VCBsettings.Boss.TotalTimeText.Position == G.OPTIONS_V_HIDE then
		function totalUpdate(self, i)
			return
		end
	end
end
-- =========================
-- checking color & style functions
-- =========================
-- check status bar color
function VDW.VCB.chkStatusColorBoss()
	if VCBsettings["Boss"]["StatusBar"]["Color"] == G.OPTIONS_C_DEFAULT then
		function statusbarColor(self, i)
			self:SetStatusBarDesaturated(false)
			self:SetStatusBarColor(1, 1, 1, 1)
			if VCBsettings.Boss.StatusBar.Style == "Jailer" then
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
	elseif VCBsettings["Boss"]["StatusBar"]["Color"] == G.OPTIONS_C_CLASS then
		function statusbarColor(self, i)
			self:SetStatusBarDesaturated(true)
			self:SetStatusBarColor(_G["vcbClassColorBoss"..i]:GetRGB())
			self.Spark:SetDesaturated(true)
			self.Spark:SetVertexColor(_G["vcbClassColorBoss"..i]:GetRGB())
			self.Flash:SetDesaturated(true)
			self.Flash:SetVertexColor(_G["vcbClassColorBoss"..i]:GetRGB())
		end
	end
end
-- check border bar color
function VDW.VCB.chkBorderColorBoss()
	if VCBsettings.Boss.Border.Color == G.OPTIONS_C_DEFAULT then
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
	elseif VCBsettings.Boss.Border.Color == G.OPTIONS_C_CLASS then
		function borderColor(self, i, bordertext1, bordertext2)
			self.Background:SetDesaturated(true)
			self.Border:SetDesaturated(true)
			bordertext1:SetDesaturated(true)
			bordertext2:SetDesaturated(true)
			self.Background:SetVertexColor(_G["vcbClassColorBoss"..i]:GetRGB())
			self.Border:SetVertexColor(_G["vcbClassColorBoss"..i]:GetRGB())
			bordertext1:SetVertexColor(_G["vcbClassColorBoss"..i]:GetRGB())
			bordertext2:SetVertexColor(_G["vcbClassColorBoss"..i]:GetRGB())
		end
	end
end
-- call back the defaul color of status bar
local function defaultColor(self)
	self:SetStatusBarDesaturated(false)
	self:SetStatusBarColor(1, 1, 1, 1)
	if VCBsettings.Boss.StatusBar.Style == "Jailer" then
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
function VDW.VCB.chkStatusStyleBoss()
	if VCBsettings.Boss.StatusBar.Style == G.OPTIONS_C_DEFAULT then
		function statusbarStyle(self)
			return
		end
	elseif VCBsettings.Boss.StatusBar.Style == "Jailer" then
		function statusbarStyle(self)
			self:SetStatusBarTexture("jailerstower-scorebar-fill-onfire")
		end
	end
end
-- check border bar style
function VDW.VCB.chkBorderStyleBoss()
	if VCBsettings.Boss.Border.Style == G.OPTIONS_C_DEFAULT then
		function borderStyle(self)
			return
		end
	elseif VCBsettings.Boss.Border.Style == "Jailer" then
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
	self:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", VCBsettings["Boss"]["Position"]["X"], VCBsettings["Boss"]["Position"]["Y"])
end
-- scale bar
local function scaleBar(self)
	self:SetScale(VCBsettings["Boss"]["Scale"]/100)
end
-- =========================
-- class color
-- =========================
for i = 1, 5, 1 do
	_G["Boss"..i.."TargetFrame"]:HookScript("OnUpdate", function(self)
		local classFilename = UnitClassBase("boss"..i)
		if classFilename ~= nil then _G["vcbClassColorBoss"..i] = C_ClassColor.GetClassColor(classFilename) end
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
		VDW.VCB.chkBossIconPosition()
		VDW.VCB.chkBossShieldPosition()
		VDW.VCB.chkBossBorderTextPosition()
		VDW.VCB.chkNameTxtBoss()
		VDW.VCB.chkCurrentTxtBoss()
		VDW.VCB.chkBothTxtBoss()
		VDW.VCB.chkTotalTxtBoss()
		VDW.VCB.chkCurrentUpdBoss()
		VDW.VCB.chkBothUpdBoss()
		VDW.VCB.chkTotalUpdBoss()
		VDW.VCB.chkStatusColorBoss()
		VDW.VCB.chkBorderColorBoss()
		VDW.VCB.chkStatusStyleBoss()
		VDW.VCB.chkBorderStyleBoss()
		for i = 1, 5, 1 do
-- hook part 1
			_G["Boss"..i.."TargetFrameSpellBar"]:HookScript("OnShow", function(self)
				_G["textName"..i]:SetWidth(self:GetWidth() - 8)
				namePosition(self, i)
				currentPostion(self, i)
				bothPostion(self, i)
				totalPostion(self, i)
				borderStyle(self)
			end)
-- hook part 2 A
			_G["Boss"..i.."TargetFrameSpellBar"]:HookScript("OnUpdate", function(self)
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
		if VCBsettings["Boss"]["Lock"] == G.OPTIONS_LS_UNLOCKED then
			Boss1TargetFrameSpellBar:HookScript("OnUpdate", function(self)
				positionBar(self)
				scaleBar(self)
			end)
			for i=2, 5, 1 do
				_G["Boss"..i.."TargetFrameSpellBar"]:HookScript("OnUpdate", function(self)
					self:ClearAllPoints()
					self:SetPoint("TOP", _G["Boss"..(i-1).."TargetFrameSpellBar"], "BOTTOM", 0, -32)
					scaleBar(self)
				end)
			end
		end
	elseif event == "UNIT_SPELLCAST_START" then
		for i = 1, 5, 1 do
			if arg1 == "boss"..i then
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
		for i = 1, 5, 1 do
			if arg1 == "boss"..i then
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
		for i = 1, 5, 1 do
			if arg1 == "boss"..i then
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
		for i = 1, 5, 1 do
			if arg1 == "boss"..i then
				_G["interrupted"..i] = true
			end
		end
	end
end
vcbZlave:HookScript("OnEvent", EventsTime)
