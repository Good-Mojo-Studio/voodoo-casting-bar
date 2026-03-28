-- =========================
-- some variables
-- =========================
local G = VDW.Local.Override
local jailerColor = CreateColorFromRGBAHexString("0A979CFF")
-- =========================
-- extra textures
-- =========================
local function createExtras()
	for i = 1, 5, 1 do
-- icon spell left
		_G["Boss"..i.."TargetFrameSpellBar"].iconSpellLeft = _G["Boss"..i.."TargetFrameSpellBar"]:CreateTexture(nil, "ARTWORK", nil, 0)
		_G["Boss"..i.."TargetFrameSpellBar"].iconSpellLeft:SetPoint("RIGHT", _G["Boss"..i.."TargetFrameSpellBar"], "LEFT", -2, -5)
		_G["Boss"..i.."TargetFrameSpellBar"].iconSpellLeft:SetSize(20, 20)
-- icon spell right
		_G["Boss"..i.."TargetFrameSpellBar"].iconSpellRight = _G["Boss"..i.."TargetFrameSpellBar"]:CreateTexture(nil, "ARTWORK", nil, 0)
		_G["Boss"..i.."TargetFrameSpellBar"].iconSpellRight:SetPoint("LEFT", _G["Boss"..i.."TargetFrameSpellBar"], "RIGHT", 4, -5)
		_G["Boss"..i.."TargetFrameSpellBar"].iconSpellRight:SetSize(20, 20)
-- shield icon left
		_G["Boss"..i.."TargetFrameSpellBar"].shieldSpellLeft = _G["Boss"..i.."TargetFrameSpellBar"]:CreateTexture(nil, "BACKGROUND", nil, 0)
		_G["Boss"..i.."TargetFrameSpellBar"].shieldSpellLeft:SetPoint("TOPLEFT", -27, 4)
		_G["Boss"..i.."TargetFrameSpellBar"].shieldSpellLeft:SetSize(29, 33)
		_G["Boss"..i.."TargetFrameSpellBar"].shieldSpellLeft:SetAtlas("ui-castingbar-shield")
		_G["Boss"..i.."TargetFrameSpellBar"].shieldSpellLeft:SetAlpha(0)
-- shield icon right
		_G["Boss"..i.."TargetFrameSpellBar"].shieldSpellRight = _G["Boss"..i.."TargetFrameSpellBar"]:CreateTexture(nil, "BACKGROUND", nil, 0)
		_G["Boss"..i.."TargetFrameSpellBar"].shieldSpellRight:SetPoint("TOPRIGHT", 27, 4)
		_G["Boss"..i.."TargetFrameSpellBar"].shieldSpellRight:SetSize(29, 33)
		_G["Boss"..i.."TargetFrameSpellBar"].shieldSpellRight:SetAtlas("ui-castingbar-shield")
		_G["Boss"..i.."TargetFrameSpellBar"].shieldSpellRight:SetAlpha(0)
-- Text Border Top
		_G["Boss"..i.."TargetFrameSpellBar"].TextBorderTop = _G["Boss"..i.."TargetFrameSpellBar"]:CreateTexture(nil, "BACKGROUND", nil, -7)
		_G["Boss"..i.."TargetFrameSpellBar"].TextBorderTop:SetPoint("TOPLEFT", 0, 12)
		_G["Boss"..i.."TargetFrameSpellBar"].TextBorderTop:SetPoint("BOTTOMRIGHT", 0, 0)
		_G["Boss"..i.."TargetFrameSpellBar"].TextBorderTop:SetAtlas("ui-castingbar-textbox")
		_G["Boss"..i.."TargetFrameSpellBar"].TextBorderTop:SetAlpha(0.38)
-- Text Border Bottom
		_G["Boss"..i.."TargetFrameSpellBar"].TextBorderBottom = _G["Boss"..i.."TargetFrameSpellBar"]:CreateTexture(nil, "BACKGROUND", nil, -7)
		_G["Boss"..i.."TargetFrameSpellBar"].TextBorderBottom:SetPoint("TOPLEFT", 0, 0)
		_G["Boss"..i.."TargetFrameSpellBar"].TextBorderBottom:SetPoint("BOTTOMRIGHT", 0, -12)
		_G["Boss"..i.."TargetFrameSpellBar"].TextBorderBottom:SetAtlas("ui-castingbar-textbox")
		_G["Boss"..i.."TargetFrameSpellBar"].TextBorderBottom:SetAlpha(0.38)
-- name text
		_G["Boss"..i.."TargetFrameSpellBar"].textName = _G["Boss"..i.."TargetFrameSpellBar"]:CreateFontString(nil, "OVERLAY", nil)
		_G["Boss"..i.."TargetFrameSpellBar"].textName:SetFontObject("GameFontHighlightSmall")
-- current text
		_G["Boss"..i.."TargetFrameSpellBar"].textCurrent = _G["Boss"..i.."TargetFrameSpellBar"]:CreateFontString(nil, "OVERLAY", nil)
		_G["Boss"..i.."TargetFrameSpellBar"].textCurrent:SetFontObject("GameFontHighlightSmall")
-- both text
		_G["Boss"..i.."TargetFrameSpellBar"].textBoth = _G["Boss"..i.."TargetFrameSpellBar"]:CreateFontString(nil, "OVERLAY", nil)
		_G["Boss"..i.."TargetFrameSpellBar"].textBoth:SetFontObject("GameFontHighlightSmall")
-- total text
		_G["Boss"..i.."TargetFrameSpellBar"].textTotal = _G["Boss"..i.."TargetFrameSpellBar"]:CreateFontString(nil, "OVERLAY", nil)
		_G["Boss"..i.."TargetFrameSpellBar"].textTotal:SetFontObject("GameFontHighlightSmall")
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
	if VCBsettings.Boss.Lock == G.OPTIONS_LS_LOCKED then
		VCBsettings.Boss.Lock = true
	elseif VCBsettings.Boss.Lock == G.OPTIONS_LS_UNLOCKED then
		VCBsettings.Boss.Lock = false
	end
	for k, v in ipairs(optionsTable) do
		if VCBsettings.Boss.Icon.Position == v.text then VCBsettings.Boss.Icon.Position = v.value end
		if VCBsettings.Boss.Shield.Position == v.text then VCBsettings.Boss.Shield.Position = v.value end
		if VCBsettings.Boss.BorderText.Position == v.text then VCBsettings.Boss.BorderText.Position = v.value end
		if VCBsettings.Boss.NameText.Position == v.text then VCBsettings.Boss.NameText.Position = v.value end
		if VCBsettings.Boss.CurrentTimeText.Position == v.text then VCBsettings.Boss.CurrentTimeText.Position = v.value end
		if VCBsettings.Boss.BothTimeText.Position == v.text then VCBsettings.Boss.BothTimeText.Position = v.value end
		if VCBsettings.Boss.TotalTimeText.Position == v.text then VCBsettings.Boss.TotalTimeText.Position = v.value end
		if VCBsettings.Boss.CurrentTimeText.Direction == v.text then VCBsettings.Boss.CurrentTimeText.Direction = v.value end
		if VCBsettings.Boss.BothTimeText.Direction == v.text then VCBsettings.Boss.BothTimeText.Direction = v.value end
		if VCBsettings.Boss.CurrentTimeText.Sec == v.text then VCBsettings.Boss.CurrentTimeText.Sec = v.value end
		if VCBsettings.Boss.BothTimeText.Sec == v.text then VCBsettings.Boss.BothTimeText.Sec = v.value end
		if VCBsettings.Boss.TotalTimeText.Sec == v.text then VCBsettings.Boss.TotalTimeText.Sec = v.value end
		if VCBsettings.Boss.StatusBar.Color == v.text then VCBsettings.Boss.StatusBar.Color = v.value end
		if VCBsettings.Boss.StatusBar.Style == v.text then VCBsettings.Boss.StatusBar.Style = v.value end
		if VCBsettings.Boss.Border.Color == v.text then VCBsettings.Boss.Border.Color = v.value end
		if VCBsettings.Boss.Border.Style == v.text then VCBsettings.Boss.Border.Style = v.value end
		if VCBsettings.Boss.Fonts.Color == v.text then VCBsettings.Boss.Fonts.Color = v.value end
		if VCBsettings.Boss.StatusBar.Interrupt.Color == v.text then VCBsettings.Boss.StatusBar.Interrupt.Color = v.value end
	end
end
-- =========================
-- functions OnUpdate and OnShow
-- =========================
-- icon position
local function iconPosition(self)
	print("iconPosition is not Working!")
end
-- shield icon position
local function shieldPosition(uninterruptible, self)
	print("shieldPosition is not Working!")
end
-- border text position
local function bordertextPosition(self)
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
local function borderColor(self, i)
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
	if VCBsettings.Boss.Icon.Position == "Hide" then
		function iconPosition(self)
			if self.iconSpellLeft:IsShown() then self.iconSpellLeft:Hide() end
			if self.iconSpellRight:IsShown() then self.iconSpellRight:Hide() end
		end
	elseif VCBsettings.Boss.Icon.Position == "Left" then
		function iconPosition(self)
			if not self.iconSpellLeft:IsShown() then self.iconSpellLeft:Show() end
			if self.iconSpellRight:IsShown() then self.iconSpellRight:Hide() end
		end
	elseif VCBsettings.Boss.Icon.Position == "Right" then
		function iconPosition(self)
			if self.iconSpellLeft:IsShown() then self.iconSpellLeft:Hide() end
			if not self.iconSpellRight:IsShown() then self.iconSpellRight:Show() end
		end
	elseif VCBsettings.Boss.Icon.Position == "Both" then	
		function iconPosition(self)
			if not self.iconSpellLeft:IsShown() then self.iconSpellLeft:Show() end
			if not self.iconSpellRight:IsShown() then self.iconSpellRight:Show() end
		end
	end
end
-- check shield
function VDW.VCB.chkBossShieldPosition()
	if VCBsettings.Boss.Shield.Position == "Hide" then
		function shieldPosition(uninterruptible, self)
			self.shieldSpellLeft:SetAlpha(0)
			self.shieldSpellRight:SetAlpha(0)
		end
	elseif VCBsettings.Boss.Shield.Position == "Left" then
		function shieldPosition(uninterruptible, self)
			self.shieldSpellLeft:SetAlphaFromBoolean(uninterruptible, 255, 0)
			self.shieldSpellRight:SetAlpha(0)
		end
	elseif VCBsettings.Boss.Shield.Position == "Right" then
		function shieldPosition(uninterruptible, self)
			self.shieldSpellLeft:SetAlpha(0)
			self.shieldSpellRight:SetAlphaFromBoolean(uninterruptible, 255, 0)
		end
	elseif VCBsettings.Boss.Shield.Position == "Both" then
		function shieldPosition(uninterruptible, self)
			self.shieldSpellLeft:SetAlphaFromBoolean(uninterruptible, 255, 0)
			self.shieldSpellRight:SetAlphaFromBoolean(uninterruptible, 255, 0)
		end
	end
end
-- check text border
function VDW.VCB.chkBossBorderTextPosition()
	if VCBsettings.Boss.BorderText.Position == "Hide" then
		function bordertextPosition(self)
			self.TextBorderTop:Hide()
			self.TextBorderBottom:Hide()
		end
	elseif VCBsettings.Boss.BorderText.Position == "Top" then
		function bordertextPosition(self)
			self.TextBorderTop:Show()
			self.TextBorderBottom:Hide()
		end
	elseif VCBsettings.Boss.BorderText.Position == "Bottom" then
		function bordertextPosition(self)
			self.TextBorderTop:Hide()
			self.TextBorderBottom:Show()
		end
	elseif VCBsettings.Boss.BorderText.Position == "Both" then
		function bordertextPosition(self)
			self.TextBorderTop:Show()
			self.TextBorderBottom:Show()
		end
	end
end
-- check name text position
function VDW.VCB.chkNameTxtBoss()
	if VCBsettings["Boss"]["NameText"]["Position"] == "Hide" then
		function namePosition(self)
			if self.textName:IsShown() then self.textName:Hide() end
		end
	elseif VCBsettings["Boss"]["NameText"]["Position"] == "TopLeft" then
		function namePosition(self)
			self.textName:ClearAllPoints()
			self.textName:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 4, 1)
			self.textName:SetJustifyH("LEFT")
			if not self.textName:IsShown() then self.textName:Show() end
		end
	elseif VCBsettings["Boss"]["NameText"]["Position"] == "Left" then
		function namePosition(self)
			self.textName:ClearAllPoints()
			self.textName:SetPoint("LEFT", self, "LEFT", 4, 0)
			self.textName:SetJustifyH("LEFT")
			if not self.textName:IsShown() then self.textName:Show() end
		end
	elseif VCBsettings["Boss"]["NameText"]["Position"] == "BottomLeft" then
		function namePosition(self)
			self.textName:ClearAllPoints()
			self.textName:SetPoint("TOPLEFT", self, "BOTTOMLEFT", 4, -1)
			self.textName:SetJustifyH("LEFT")
			if not self.textName:IsShown() then self.textName:Show() end
		end
	elseif VCBsettings["Boss"]["NameText"]["Position"] == "Top" then
		function namePosition(self)
			self.textName:ClearAllPoints()
			self.textName:SetPoint("BOTTOM", self, "TOP", 0, 1)
			self.textName:SetJustifyH("CENTER")
			if not self.textName:IsShown() then self.textName:Show() end
			end
	elseif VCBsettings["Boss"]["NameText"]["Position"] == "Center" then
		function namePosition(self)
			self.textName:ClearAllPoints()
			self.textName:SetPoint("CENTER", self, "CENTER", 0, 0)
			self.textName:SetJustifyH("CENTER")
			if not self.textName:IsShown() then self.textName:Show() end
			end
	elseif VCBsettings["Boss"]["NameText"]["Position"] == "Bottom" then
		function namePosition(self)
			self.textName:ClearAllPoints()
			self.textName:SetPoint("TOP", self, "BOTTOM", 0, -1)
			self.textName:SetJustifyH("CENTER")
			if not self.textName:IsShown() then self.textName:Show() end
		end
	elseif VCBsettings["Boss"]["NameText"]["Position"] == "TopRight" then
		function namePosition(self)
			self.textName:ClearAllPoints()
			self.textName:SetPoint("BOTTOMRIGHT", self, "TOPRIGHT", -4, 1)
			self.textName:SetJustifyH("RIGHT")
			if not self.textName:IsShown() then self.textName:Show() end
		end
	elseif VCBsettings["Boss"]["NameText"]["Position"] == "Right" then
		function namePosition(self)
			self.textName:ClearAllPoints()
			self.textName:SetPoint("RIGHT", self, "RIGHT", -4, 0)
			self.textName:SetJustifyH("RIGHT")
			if not self.textName:IsShown() then self.textName:Show() end
		end
	elseif VCBsettings["Boss"]["NameText"]["Position"] == "BottomRight" then
		function namePosition(self)
			self.textName:ClearAllPoints()
			self.textName:SetPoint("TOPRIGHT", self, "BOTTOMRIGHT", -4, -1)
			self.textName:SetJustifyH("RIGHT")
			if not self.textName:IsShown() then self.textName:Show() end
		end
	end
end
-- check current casting time text position
function VDW.VCB.chkCurrentTxtBoss()
	if VCBsettings["Boss"]["CurrentTimeText"]["Position"] == "Hide" then
		function currentPostion(self)
			if self.textCurrent:IsShown() then self.textCurrent:Hide() end
		end
	elseif VCBsettings["Boss"]["CurrentTimeText"]["Position"] == "TopLeft" then
		function currentPostion(self)
			self.textCurrent:ClearAllPoints()
			self.textCurrent:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 4, 1)
			if not self.textCurrent:IsShown() then self.textCurrent:Show() end
		end
	elseif VCBsettings["Boss"]["CurrentTimeText"]["Position"] == "Left" then
		function currentPostion(self)
			self.textCurrent:ClearAllPoints()
			self.textCurrent:SetPoint("LEFT", self, "LEFT", 4, 0)
			if not self.textCurrent:IsShown() then self.textCurrent:Show() end
		end
	elseif VCBsettings["Boss"]["CurrentTimeText"]["Position"] == "BottomLeft" then
		function currentPostion(self)
			self.textCurrent:ClearAllPoints()
			self.textCurrent:SetPoint("TOPLEFT", self, "BOTTOMLEFT", 4, -1)
			if not self.textCurrent:IsShown() then self.textCurrent:Show() end
		end
	elseif VCBsettings["Boss"]["CurrentTimeText"]["Position"] == "Top" then
		function currentPostion(self)
			self.textCurrent:ClearAllPoints()
			self.textCurrent:SetPoint("BOTTOM", self, "TOP", 0, 1)
			if not self.textCurrent:IsShown() then self.textCurrent:Show() end
		end
	elseif VCBsettings["Boss"]["CurrentTimeText"]["Position"] == "Center" then
		function currentPostion(self)
			self.textCurrent:ClearAllPoints()
			self.textCurrent:SetPoint("CENTER", self, "CENTER", 0, 0)
			if not self.textCurrent:IsShown() then self.textCurrent:Show() end
		end
	elseif VCBsettings["Boss"]["CurrentTimeText"]["Position"] == "Bottom" then
		function currentPostion(self)
			self.textCurrent:ClearAllPoints()
			self.textCurrent:SetPoint("TOP", self, "BOTTOM", 0, -1)
			if not self.textCurrent:IsShown() then self.textCurrent:Show() end
		end
	elseif VCBsettings["Boss"]["CurrentTimeText"]["Position"] == "TopRight" then
		function currentPostion(self)
			self.textCurrent:ClearAllPoints()
			self.textCurrent:SetPoint("BOTTOMRIGHT", self, "TOPRIGHT", -4, 1)
			if not self.textCurrent:IsShown() then self.textCurrent:Show() end
		end
	elseif VCBsettings["Boss"]["CurrentTimeText"]["Position"] == "Right" then
		function currentPostion(self)
			self.textCurrent:ClearAllPoints()
			self.textCurrent:SetPoint("RIGHT", self, "RIGHT", -4, 0)
			if not self.textCurrent:IsShown() then self.textCurrent:Show() end
		end
	elseif VCBsettings["Boss"]["CurrentTimeText"]["Position"] == "BottomRight" then
		function currentPostion(self)
			self.textCurrent:ClearAllPoints()
			self.textCurrent:SetPoint("TOPRIGHT", self, "BOTTOMRIGHT", -4, -1)
			if not self.textCurrent:IsShown() then self.textCurrent:Show() end
		end
	end
end
-- check both casting time text position
function VDW.VCB.chkBothTxtBoss()
	if VCBsettings["Boss"]["BothTimeText"]["Position"] == "Hide" then
		function bothPostion(self)
			if self.textBoth:IsShown() then self.textBoth:Hide() end
		end
	elseif VCBsettings["Boss"]["BothTimeText"]["Position"] == "TopLeft" then
		function bothPostion(self)
			self.textBoth:ClearAllPoints()
			self.textBoth:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 4, 1)
			if not self.textBoth:IsShown() then self.textBoth:Show() end
		end
	elseif VCBsettings["Boss"]["BothTimeText"]["Position"] == "Left" then
		function bothPostion(self)
			self.textBoth:ClearAllPoints()
			self.textBoth:SetPoint("LEFT", self, "LEFT", 4, 0)
			if not self.textBoth:IsShown() then self.textBoth:Show() end
		end
	elseif VCBsettings["Boss"]["BothTimeText"]["Position"] == "BottomLeft" then
		function bothPostion(self)
			self.textBoth:ClearAllPoints()
			self.textBoth:SetPoint("TOPLEFT", self, "BOTTOMLEFT", 4, -1)
			if not self.textBoth:IsShown() then self.textBoth:Show() end
		end
	elseif VCBsettings["Boss"]["BothTimeText"]["Position"] == "Top" then
		function bothPostion(self)
			self.textBoth:ClearAllPoints()
			self.textBoth:SetPoint("BOTTOM", self, "TOP", 0, 1)
			if not self.textBoth:IsShown() then self.textBoth:Show() end
		end
	elseif VCBsettings["Boss"]["BothTimeText"]["Position"] == "Center" then
		function bothPostion(self)
			self.textBoth:ClearAllPoints()
			self.textBoth:SetPoint("CENTER", self, "CENTER", 0, 0)
			if not self.textBoth:IsShown() then self.textBoth:Show() end
		end
	elseif VCBsettings["Boss"]["BothTimeText"]["Position"] == "Bottom" then
		function bothPostion(self)
			self.textBoth:ClearAllPoints()
			self.textBoth:SetPoint("TOP", self, "BOTTOM", 0, -1)
			if not self.textBoth:IsShown() then self.textBoth:Show() end
		end
	elseif VCBsettings["Boss"]["BothTimeText"]["Position"] == "TopRight" then
		function bothPostion(self)
			self.textBoth:ClearAllPoints()
			self.textBoth:SetPoint("BOTTOMRIGHT", self, "TOPRIGHT", -4, 1)
			if not self.textBoth:IsShown() then self.textBoth:Show() end
		end
	elseif VCBsettings["Boss"]["BothTimeText"]["Position"] == "Right" then
		function bothPostion(self)
			self.textBoth:ClearAllPoints()
			self.textBoth:SetPoint("RIGHT", self, "RIGHT", -4, 0)
			if not self.textBoth:IsShown() then self.textBoth:Show() end
		end
	elseif VCBsettings["Boss"]["BothTimeText"]["Position"] == "BottomRight" then
		function bothPostion(self)
			self.textBoth:ClearAllPoints()
			self.textBoth:SetPoint("TOPRIGHT", self, "BOTTOMRIGHT", -4, -1)
			if not self.textBoth:IsShown() then self.textBoth:Show() end
		end
	end
end
-- check total casting time text position
function VDW.VCB.chkTotalTxtBoss()
	if VCBsettings["Boss"]["TotalTimeText"]["Position"] == "Hide" then
		function totalPostion(self)
			if self.textTotal:IsShown() then self.textTotal:Hide() end
		end
	elseif VCBsettings["Boss"]["TotalTimeText"]["Position"] == "TopLeft" then
		function totalPostion(self)
			self.textTotal:ClearAllPoints()
			self.textTotal:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 4, 1)
			if not self.textTotal:IsShown() then self.textTotal:Show() end
		end
	elseif VCBsettings["Boss"]["TotalTimeText"]["Position"] == "Left" then
		function totalPostion(self)
			self.textTotal:ClearAllPoints()
			self.textTotal:SetPoint("LEFT", self, "LEFT", 4, 0)
			if not self.textTotal:IsShown() then self.textTotal:Show() end
		end
	elseif VCBsettings["Boss"]["TotalTimeText"]["Position"] == "BottomLeft" then
		function totalPostion(self)
			self.textTotal:ClearAllPoints()
			self.textTotal:SetPoint("TOPLEFT", self, "BOTTOMLEFT", 4, -1)
			if not self.textTotal:IsShown() then self.textTotal:Show() end
		end
	elseif VCBsettings["Boss"]["TotalTimeText"]["Position"] == "Top" then
		function totalPostion(self)
			self.textTotal:ClearAllPoints()
			self.textTotal:SetPoint("BOTTOM", self, "TOP", 0, 1)
			if not self.textTotal:IsShown() then self.textTotal:Show() end
		end
	elseif VCBsettings["Boss"]["TotalTimeText"]["Position"] == "Center" then
		function totalPostion(self)
			self.textTotal:ClearAllPoints()
			self.textTotal:SetPoint("CENTER", self, "CENTER", 0, 0)
			if not self.textTotal:IsShown() then self.textTotal:Show() end
		end
	elseif VCBsettings["Boss"]["TotalTimeText"]["Position"] == "Bottom" then
		function totalPostion(self)
			self.textTotal:ClearAllPoints()
			self.textTotal:SetPoint("TOP", self, "BOTTOM", 0, -1)
			if not self.textTotal:IsShown() then self.textTotal:Show() end
		end
	elseif VCBsettings["Boss"]["TotalTimeText"]["Position"] == "TopRight" then
		function totalPostion(self)
			self.textTotal:ClearAllPoints()
			self.textTotal:SetPoint("BOTTOMRIGHT", self, "TOPRIGHT", -4, 1)
			if not self.textTotal:IsShown() then self.textTotal:Show() end
		end
	elseif VCBsettings["Boss"]["TotalTimeText"]["Position"] == "Right" then
		function totalPostion(self)
			self.textTotal:ClearAllPoints()
			self.textTotal:SetPoint("RIGHT", self, "RIGHT", -4, 0)
			if not self.textTotal:IsShown() then self.textTotal:Show() end
		end
	elseif VCBsettings["Boss"]["TotalTimeText"]["Position"] == "BottomRight" then
		function totalPostion(self)
			self.textTotal:ClearAllPoints()
			self.textTotal:SetPoint("TOPRIGHT", self, "BOTTOMRIGHT", -4, -1)
			if not self.textTotal:IsShown() then self.textTotal:Show() end
		end
	end
end
-- =========================
-- checking update functions
-- =========================
-- check current casting time update
function VDW.VCB.chkCurrentUpdBoss()
	if VCBsettings.Boss.CurrentTimeText.Position ~= "Hide" then
		if VCBsettings.Boss.CurrentTimeText.Sec == "Hide" then
			if VCBsettings.Boss.CurrentTimeText.Decimals == "0" then
				if VCBsettings.Boss.CurrentTimeText.Direction == "Ascending" then
					function currentUpdate(self, i)
						self.textCurrent:SetText(string.format("%.0f", VDW.VCB["BossDuration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Boss.CurrentTimeText.Direction == "Descending" then
					function currentUpdate(self, i)
						self.textCurrent:SetText(string.format("%.0f", VDW.VCB["BossDuration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Boss.CurrentTimeText.Direction == "Both" then
					function currentUpdate(self, i)
						if VDW.VCB["BossCastbar"..i] == "Cast" or VDW.VCB["BossCastbar"..i] == "Empower" then
							self.textCurrent:SetText(string.format("%.0f", VDW.VCB["BossDuration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
						elseif VDW.VCB["BossCastbar"..i] == "Channel" then
							self.textCurrent:SetText(string.format("%.0f", VDW.VCB["BossDuration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			elseif VCBsettings.Boss.CurrentTimeText.Decimals == "1" then
				if VCBsettings.Boss.CurrentTimeText.Direction == "Ascending" then
					function currentUpdate(self, i)
						self.textCurrent:SetText(string.format("%.1f", VDW.VCB["BossDuration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Boss.CurrentTimeText.Direction == "Descending" then
					function currentUpdate(self, i)
						self.textCurrent:SetText(string.format("%.1f", VDW.VCB["BossDuration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Boss.CurrentTimeText.Direction == "Both" then
					function currentUpdate(self, i)
						if VDW.VCB["BossCastbar"..i] == "Cast" or VDW.VCB["BossCastbar"..i] == "Empower" then
							self.textCurrent:SetText(string.format("%.1f", VDW.VCB["BossDuration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
						elseif VDW.VCB["BossCastbar"..i] == "Channel" then
							self.textCurrent:SetText(string.format("%.1f", VDW.VCB["BossDuration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			elseif VCBsettings.Boss.CurrentTimeText.Decimals == "2" then
				if VCBsettings.Boss.CurrentTimeText.Direction == "Ascending" then
					function currentUpdate(self, i)
						self.textCurrent:SetText(string.format("%.2f", VDW.VCB["BossDuration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Boss.CurrentTimeText.Direction == "Descending" then
					function currentUpdate(self, i)
						self.textCurrent:SetText(string.format("%.2f", VDW.VCB["BossDuration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Boss.CurrentTimeText.Direction == "Both" then
					function currentUpdate(self, i)
						if VDW.VCB["BossCastbar"..i] == "Cast" or VDW.VCB["BossCastbar"..i] == "Empower" then
							self.textCurrent:SetText(string.format("%.2f", VDW.VCB["BossDuration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
						elseif VDW.VCB["BossCastbar"..i] == "Channel" then
							self.textCurrent:SetText(string.format("%.2f", VDW.VCB["BossDuration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			elseif VCBsettings.Boss.CurrentTimeText.Decimals == "3" then
				if VCBsettings.Boss.CurrentTimeText.Direction == "Ascending" then
					function currentUpdate(self, i)
						self.textCurrent:SetText(string.format("%.3f", VDW.VCB["BossDuration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Boss.CurrentTimeText.Direction == "Descending" then
					function currentUpdate(self, i)
						self.textCurrent:SetText(string.format("%.3f", VDW.VCB["BossDuration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Boss.CurrentTimeText.Direction == "Both" then
					function currentUpdate(self, i)
						if VDW.VCB["BossCastbar"..i] == "Cast" or VDW.VCB["BossCastbar"..i] == "Empower" then
							self.textCurrent:SetText(string.format("%.3f", VDW.VCB["BossDuration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
						elseif VDW.VCB["BossCastbar"..i] == "Channel" then
							self.textCurrent:SetText(string.format("%.3f", VDW.VCB["BossDuration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			end
		elseif VCBsettings.Boss.CurrentTimeText.Sec == "Show" then
			if VCBsettings.Boss.CurrentTimeText.Decimals == "0" then
				if VCBsettings.Boss.CurrentTimeText.Direction == "Ascending" then
					function currentUpdate(self, i)
						self.textCurrent:SetText(string.format("%.0f Sec", VDW.VCB["BossDuration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Boss.CurrentTimeText.Direction == "Descending" then
					function currentUpdate(self, i)
						self.textCurrent:SetText(string.format("%.0f Sec", VDW.VCB["BossDuration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Boss.CurrentTimeText.Direction == "Both" then
					function currentUpdate(self, i)
						if VDW.VCB["BossCastbar"..i] == "Cast" or VDW.VCB["BossCastbar"..i] == "Empower" then
							self.textCurrent:SetText(string.format("%.0f Sec", VDW.VCB["BossDuration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
						elseif VDW.VCB["BossCastbar"..i] == "Channel" then
							self.textCurrent:SetText(string.format("%.0f Sec", VDW.VCB["BossDuration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			elseif VCBsettings.Boss.CurrentTimeText.Decimals == "1" then
				if VCBsettings.Boss.CurrentTimeText.Direction == "Ascending" then
					function currentUpdate(self, i)
						self.textCurrent:SetText(string.format("%.1f Sec", VDW.VCB["BossDuration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Boss.CurrentTimeText.Direction == "Descending" then
					function currentUpdate(self, i)
						self.textCurrent:SetText(string.format("%.1f Sec", VDW.VCB["BossDuration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Boss.CurrentTimeText.Direction == "Both" then
					function currentUpdate(self, i)
						if VDW.VCB["BossCastbar"..i] == "Cast" or VDW.VCB["BossCastbar"..i] == "Empower" then
							self.textCurrent:SetText(string.format("%.1f Sec", VDW.VCB["BossDuration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
						elseif VDW.VCB["BossCastbar"..i] == "Channel" then
							self.textCurrent:SetText(string.format("%.1f Sec", VDW.VCB["BossDuration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			elseif VCBsettings.Boss.CurrentTimeText.Decimals == "2" then
				if VCBsettings.Boss.CurrentTimeText.Direction == "Ascending" then
					function currentUpdate(self, i)
						self.textCurrent:SetText(string.format("%.2f Sec", VDW.VCB["BossDuration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Boss.CurrentTimeText.Direction == "Descending" then
					function currentUpdate(self, i)
						self.textCurrent:SetText(string.format("%.2f Sec", VDW.VCB["BossDuration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Boss.CurrentTimeText.Direction == "Both" then
					function currentUpdate(self, i)
						if VDW.VCB["BossCastbar"..i] == "Cast" or VDW.VCB["BossCastbar"..i] == "Empower" then
							self.textCurrent:SetText(string.format("%.2f Sec", VDW.VCB["BossDuration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
						elseif VDW.VCB["BossCastbar"..i] == "Channel" then
							self.textCurrent:SetText(string.format("%.2f Sec", VDW.VCB["BossDuration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			elseif VCBsettings.Boss.CurrentTimeText.Decimals == "3" then
				if VCBsettings.Boss.CurrentTimeText.Direction == "Ascending" then
					function currentUpdate(self, i)
						self.textCurrent:SetText(string.format("%.3f Sec", VDW.VCB["BossDuration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Boss.CurrentTimeText.Direction == "Descending" then
					function currentUpdate(self, i)
						self.textCurrent:SetText(string.format("%.3f Sec", VDW.VCB["BossDuration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Boss.CurrentTimeText.Direction == "Both" then
					function currentUpdate(self, i)
						if VDW.VCB["BossCastbar"..i] == "Cast" or VDW.VCB["BossCastbar"..i] == "Empower" then
							self.textCurrent:SetText(string.format("%.3f Sec", VDW.VCB["BossDuration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
						elseif VDW.VCB["BossCastbar"..i] == "Channel" then
							self.textCurrent:SetText(string.format("%.3f Sec", VDW.VCB["BossDuration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			end
		end
	elseif VCBsettings.Boss.CurrentTimeText.Position == "Hide" then
		function currentUpdate(self, i)
			return
		end
	end
end
-- check both casting time update
function VDW.VCB.chkBothUpdBoss()
	if VCBsettings.Boss.BothTimeText.Position ~= "Hide" then
		if VCBsettings.Boss.BothTimeText.Sec == "Hide" then
			if VCBsettings.Boss.BothTimeText.Decimals == "0" then
				if VCBsettings.Boss.BothTimeText.Direction == "Ascending" then
					function bothUpdate(self, i)
						self.textBoth:SetText(string.format("%.0f / %.0f", VDW.VCB["BossDuration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), VDW.VCB["BossDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Boss.BothTimeText.Direction == "Descending" then
					function bothUpdate(self, i)
						self.textBoth:SetText(string.format("%.0f / %.0f", VDW.VCB["BossDuration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), VDW.VCB["BossDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Boss.BothTimeText.Direction == "Both" then
					function bothUpdate(self, i)
						if VDW.VCB["BossCastbar"..i] == "Cast" or VDW.VCB["BossCastbar"..i] == "Empower" then
							self.textBoth:SetText(string.format("%.0f / %.0f", VDW.VCB["BossDuration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), VDW.VCB["BossDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						elseif VDW.VCB["BossCastbar"..i] == "Channel" then
							self.textBoth:SetText(string.format("%.0f / %.0f", VDW.VCB["BossDuration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), VDW.VCB["BossDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			elseif VCBsettings.Boss.BothTimeText.Decimals == "1" then
				if VCBsettings.Boss.BothTimeText.Direction == "Ascending" then
					function bothUpdate(self, i)
						self.textBoth:SetText(string.format("%.1f / %.1f", VDW.VCB["BossDuration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), VDW.VCB["BossDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Boss.BothTimeText.Direction == "Descending" then
					function bothUpdate(self, i)
						self.textBoth:SetText(string.format("%.1f / %.1f", VDW.VCB["BossDuration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), VDW.VCB["BossDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Boss.BothTimeText.Direction == "Both" then
					function bothUpdate(self, i)
						if VDW.VCB["BossCastbar"..i] == "Cast" or VDW.VCB["BossCastbar"..i] == "Empower" then
							self.textBoth:SetText(string.format("%.1f / %.1f", VDW.VCB["BossDuration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), VDW.VCB["BossDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						elseif VDW.VCB["BossCastbar"..i] == "Channel" then
							self.textBoth:SetText(string.format("%.1f / %.1f", VDW.VCB["BossDuration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), VDW.VCB["BossDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			elseif VCBsettings.Boss.BothTimeText.Decimals == "2" then
				if VCBsettings.Boss.BothTimeText.Direction == "Ascending" then
					function bothUpdate(self, i)
						self.textBoth:SetText(string.format("%.2f / %.2f", VDW.VCB["BossDuration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), VDW.VCB["BossDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Boss.BothTimeText.Direction == "Descending" then
					function bothUpdate(self, i)
						self.textBoth:SetText(string.format("%.2f / %.2f", VDW.VCB["BossDuration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), VDW.VCB["BossDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Boss.BothTimeText.Direction == "Both" then
					function bothUpdate(self, i)
						if VDW.VCB["BossCastbar"..i] == "Cast" or VDW.VCB["BossCastbar"..i] == "Empower" then
							self.textBoth:SetText(string.format("%.2f / %.2f", VDW.VCB["BossDuration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), VDW.VCB["BossDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						elseif VDW.VCB["BossCastbar"..i] == "Channel" then
							self.textBoth:SetText(string.format("%.2f / %.2f", VDW.VCB["BossDuration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), VDW.VCB["BossDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			elseif VCBsettings.Boss.BothTimeText.Decimals == "3" then
				if VCBsettings.Boss.BothTimeText.Direction == "Ascending" then
					function bothUpdate(self, i)
						self.textBoth:SetText(string.format("%.3f / %.3f", VDW.VCB["BossDuration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), VDW.VCB["BossDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Boss.BothTimeText.Direction == "Descending" then
					function bothUpdate(self, i)
						self.textBoth:SetText(string.format("%.3f / %.3f", VDW.VCB["BossDuration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), VDW.VCB["BossDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Boss.BothTimeText.Direction == "Both" then
					function bothUpdate(self, i)
						if VDW.VCB["BossCastbar"..i] == "Cast" or VDW.VCB["BossCastbar"..i] == "Empower" then
							self.textBoth:SetText(string.format("%.3f", VDW.VCB["BossDuration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), VDW.VCB["BossDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						elseif VDW.VCB["BossCastbar"..i] == "Channel" then
							self.textBoth:SetText(string.format("%.3f / %.3f", VDW.VCB["BossDuration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), VDW.VCB["BossDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			end
		elseif VCBsettings.Boss.BothTimeText.Sec == "Show" then
			if VCBsettings.Boss.BothTimeText.Decimals == "0" then
				if VCBsettings.Boss.BothTimeText.Direction == "Ascending" then
					function bothUpdate(self, i)
						self.textBoth:SetText(string.format("%.0f / %.0f Sec", VDW.VCB["BossDuration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), VDW.VCB["BossDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Boss.BothTimeText.Direction == "Descending" then
					function bothUpdate(self, i)
						self.textBoth:SetText(string.format("%.0f / %.0f Sec", VDW.VCB["BossDuration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), VDW.VCB["BossDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Boss.BothTimeText.Direction == "Both" then
					function bothUpdate(self, i)
						if VDW.VCB["BossCastbar"..i] == "Cast" or VDW.VCB["BossCastbar"..i] == "Empower" then
							self.textBoth:SetText(string.format("%.0f / %.0f Sec", VDW.VCB["BossDuration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), VDW.VCB["BossDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						elseif VDW.VCB["BossCastbar"..i] == "Channel" then
							self.textBoth:SetText(string.format("%.0f / %.0f Sec", VDW.VCB["BossDuration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), VDW.VCB["BossDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			elseif VCBsettings.Boss.BothTimeText.Decimals == "1" then
				if VCBsettings.Boss.BothTimeText.Direction == "Ascending" then
					function bothUpdate(self, i)
						self.textBoth:SetText(string.format("%.1f / %.1f Sec", VDW.VCB["BossDuration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), VDW.VCB["BossDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Boss.BothTimeText.Direction == "Descending" then
					function bothUpdate(self, i)
						self.textBoth:SetText(string.format("%.1f / %.1f Sec", VDW.VCB["BossDuration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), VDW.VCB["BossDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Boss.BothTimeText.Direction == "Both" then
					function bothUpdate(self, i)
						if VDW.VCB["BossCastbar"..i] == "Cast" or VDW.VCB["BossCastbar"..i] == "Empower" then
							self.textBoth:SetText(string.format("%.1f / %.1f Sec", VDW.VCB["BossDuration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), VDW.VCB["BossDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						elseif VDW.VCB["BossCastbar"..i] == "Channel" then
							self.textBoth:SetText(string.format("%.1f / %.1f Sec", VDW.VCB["BossDuration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), VDW.VCB["BossDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			elseif VCBsettings.Boss.BothTimeText.Decimals == "2" then
				if VCBsettings.Boss.BothTimeText.Direction == "Ascending" then
					function bothUpdate(self, i)
						self.textBoth:SetText(string.format("%.2f / %.2f Sec", VDW.VCB["BossDuration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), VDW.VCB["BossDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Boss.BothTimeText.Direction == "Descending" then
					function bothUpdate(self, i)
						self.textBoth:SetText(string.format("%.2f / %.2f Sec", VDW.VCB["BossDuration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), VDW.VCB["BossDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Boss.BothTimeText.Direction == "Both" then
					function bothUpdate(self, i)
						if VDW.VCB["BossCastbar"..i] == "Cast" or VDW.VCB["BossCastbar"..i] == "Empower" then
							self.textBoth:SetText(string.format("%.2f / %.2f Sec", VDW.VCB["BossDuration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), VDW.VCB["BossDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						elseif VDW.VCB["BossCastbar"..i] == "Channel" then
							self.textBoth:SetText(string.format("%.2f / %.2f Sec", VDW.VCB["BossDuration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), VDW.VCB["BossDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			elseif VCBsettings.Boss.BothTimeText.Decimals == "3" then
				if VCBsettings.Boss.BothTimeText.Direction == "Ascending" then
					function bothUpdate(self, i)
						self.textBoth:SetText(string.format("%.3f / %.3f Sec", VDW.VCB["BossDuration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), VDW.VCB["BossDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Boss.BothTimeText.Direction == "Descending" then
					function bothUpdate(self, i)
						self.textBoth:SetText(string.format("%.3f / %.3f Sec", VDW.VCB["BossDuration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), VDW.VCB["BossDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Boss.BothTimeText.Direction == "Both" then
					function bothUpdate(self, i)
						if VDW.VCB["BossCastbar"..i] == "Cast" or VDW.VCB["BossCastbar"..i] == "Empower" then
							self.textBoth:SetText(string.format("%.3f / %.3f Sec", VDW.VCB["BossDuration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), VDW.VCB["BossDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						elseif VDW.VCB["BossCastbar"..i] == "Channel" then
							self.textBoth:SetText(string.format("%.3f / %.3f Sec", VDW.VCB["BossDuration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), VDW.VCB["BossDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			end
		end
	elseif VCBsettings.Boss.BothTimeText.Position == "Hide" then
		function bothUpdate(self, i)
			return
		end
	end
end
-- check total casting time update
function VDW.VCB.chkTotalUpdBoss()
	if VCBsettings.Boss.TotalTimeText.Position ~= "Hide" then
		if VCBsettings.Boss.TotalTimeText.Sec == "Hide" then
			if VCBsettings.Boss.TotalTimeText.Decimals == "0" then
				function totalUpdate(self, i)
					self.textTotal:SetFormattedText("%.0f", VDW.VCB["BossDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime))
				end
			elseif VCBsettings.Boss.TotalTimeText.Decimals == "1" then
				function totalUpdate(self, i)
					self.textTotal:SetFormattedText("%.1f", VDW.VCB["BossDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime))
				end
			elseif VCBsettings.Boss.TotalTimeText.Decimals == "2" then
				function totalUpdate(self, i)
					self.textTotal:SetFormattedText("%.2f", VDW.VCB["BossDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime))
				end
			elseif VCBsettings.Boss.TotalTimeText.Decimals == "3" then
				function totalUpdate(self, i)
					self.textTotal:SetFormattedText("%.3f", VDW.VCB["BossDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime))
				end
			end
		elseif VCBsettings.Boss.TotalTimeText.Sec == "Show" then
			if VCBsettings.Boss.TotalTimeText.Decimals == "0" then
				function totalUpdate(self, i)
					self.textTotal:SetFormattedText("%.0f sec", VDW.VCB["BossDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime))
				end
			elseif VCBsettings.Boss.TotalTimeText.Decimals == "1" then
				function totalUpdate(self, i)
					self.textTotal:SetFormattedText("%.1f sec", VDW.VCB["BossDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime))
				end
			elseif VCBsettings.Boss.TotalTimeText.Decimals == "2" then
				function totalUpdate(self, i)
					self.textTotal:SetFormattedText("%.2f sec", VDW.VCB["BossDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime))
				end
			elseif VCBsettings.Boss.TotalTimeText.Decimals == "3" then
				function totalUpdate(self, i)
					self.textTotal:SetFormattedText("%.3f sec", VDW.VCB["BossDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime))
				end
			end
		end
	elseif VCBsettings.Boss.TotalTimeText.Position == "Hide" then
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
	if VCBsettings["Boss"]["StatusBar"]["Color"] == "Default" then
		function statusbarColor(self, i)
			self:SetStatusBarDesaturated(false)
			self:SetStatusBarColor(1, 1, 1)
			if VCBsettings.Boss.StatusBar.Style == "Jailer" then
				self.Spark:SetDesaturated(true)
				self.Spark:SetVertexColor(jailerColor:GetRGB())
				self.Flash:SetDesaturated(true)
				self.Flash:SetVertexColor(jailerColor:GetRGB())
			else
				self.Spark:SetDesaturated(false)
				self.Spark:SetVertexColor(1, 1, 1)
				self.Flash:SetDesaturated(false)
				self.Flash:SetVertexColor(1, 1, 1)
			end
		end
	elseif VCBsettings["Boss"]["StatusBar"]["Color"] == "Class" then
		function statusbarColor(self, i)
			self:SetStatusBarDesaturated(true)
			self:SetStatusBarColor(VDW.VCB["ClassColorBoss"..i]:GetRGB())
			self.Spark:SetDesaturated(true)
			self.Spark:SetVertexColor(VDW.VCB["ClassColorBoss"..i]:GetRGB())
			self.Flash:SetDesaturated(true)
			self.Flash:SetVertexColor(VDW.VCB["ClassColorBoss"..i]:GetRGB())
		end
	end
end
-- check border bar color
function VDW.VCB.chkBorderColorBoss()
	if VCBsettings.Boss.Border.Color == "Default" then
		function borderColor(self, i)
			self.Background:SetDesaturated(false)
			self.Border:SetDesaturated(false)
			self.Background:SetVertexColor(1, 1, 1)
			self.Border:SetVertexColor(1, 1, 1)
		end
	elseif VCBsettings.Boss.Border.Color == "Class" then
		function borderColor(self, i)
			self.Background:SetDesaturated(true)
			self.Border:SetDesaturated(true)
			self.Background:SetVertexColor(VDW.VCB["ClassColorBoss"..i]:GetRGB())
			self.Border:SetVertexColor(VDW.VCB["ClassColorBoss"..i]:GetRGB())
		end
	end
end
-- call back the defaul color of status bar
local function defaultColor(self)
	self:SetStatusBarDesaturated(false)
	self:SetStatusBarColor(1, 1, 1)
	if VCBsettings.Boss.StatusBar.Style == "Jailer" then
		self.Spark:SetDesaturated(true)
		self.Spark:SetVertexColor(jailerColor:GetRGB())
		self.Flash:SetDesaturated(true)
		self.Flash:SetVertexColor(jailerColor:GetRGB())
	else
		self.Spark:SetDesaturated(false)
		self.Spark:SetVertexColor(1, 1, 1)
		self.Flash:SetDesaturated(false)
		self.Flash:SetVertexColor(1, 1, 1)
	end
end
-- bar status style
function VDW.VCB.chkStatusStyleBoss()
	if VCBsettings.Boss.StatusBar.Style == "Default" then
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
	if VCBsettings.Boss.Border.Style == "Default" then
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
local function barIsLocked()
	for i = 1, 5, 1 do
-- hook part 1
		_G["Boss"..i.."TargetFrameSpellBar"]:HookScript("OnShow", function(self)
			iconPosition(self)
			self.textName:SetWidth(self:GetWidth() - 8)
			namePosition(self)
			currentPostion(self)
			bothPostion(self)
			totalPostion(self)
			borderStyle(self)
			borderColor(self, i)
			bordertextPosition(self)
		end)
-- hook part 2
		_G["Boss"..i.."TargetFrameSpellBar"]:HookScript("OnUpdate", function(self)
			self.TextBorder:SetAlpha(0)
			self.Text:SetAlpha(0)
			self.BorderShield:SetAlpha(0)
			self.Icon:SetAlpha(0)
			if VDW.VCB["BossDuration"..i] then
				self.textName:SetText(self.Text:GetText())
				self.iconSpellLeft:SetTexture(self.Icon:GetTextureFileID())
				self.iconSpellRight:SetTexture(self.Icon:GetTextureFileID())
				shieldPosition(VDW.VCB["BossUninterruptible"..i], self)
				if VDW.VCB["BossInterrupted"..i] then
					self.textCurrent:SetText("-")
					self.textBoth:SetText("- / -")
					self.textTotal:SetText("-")
				else
					currentUpdate(self, i)
					bothUpdate(self, i)
					totalUpdate(self, i)
				end
				statusbarColor(self, i)
				statusbarStyle(self)
			end
		end)
	end
end
-- =========================
-- class color
-- =========================
for i = 1, 5, 1 do
	_G["Boss"..i.."TargetFrame"]:HookScript("OnUpdate", function(self)
		local classFilename = UnitClassBase("boss"..i)
		if classFilename ~= nil then VDW.VCB["ClassColorBoss"..i] = C_ClassColor.GetClassColor(classFilename) end
	end)
end
-- =========================
-- Events Time
-- =========================
local function EventsTime(self, event, arg1, arg2, arg3, arg4)
	if event == "PLAYER_LOGIN" then
		ProtectOptions()
		createExtras()
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
		barIsLocked()
	elseif event == "UNIT_SPELLCAST_START" then
		for i = 1, 5, 1 do
			if arg1 == "boss"..i then
				local castName, castText, castTex, _, _, isTradeSkill, _, castNotInterruptible = UnitCastingInfo(arg1)
				if castName then
					VDW.VCB["BossDuration"..i] = UnitCastingDuration(arg1)
					VDW.VCB["BossUninterruptible"..i] = castNotInterruptible
					VDW.VCB["BossCastbar"..i] = "Cast"
					VDW.VCB["BossInterrupted"..i] = false
				end
			end
		end
	elseif event == "UNIT_SPELLCAST_CHANNEL_START" then
		for i = 1, 5, 1 do
			if arg1 == "boss"..i then
				local chanName, chanText, chanTex, _, _, isTradeSkill, chanNotInterruptible, _, isEmpowered, numStages = UnitChannelInfo(arg1)
				if chanName then
					VDW.VCB["BossDuration"..i] = UnitCastingDuration(arg1)
					VDW.VCB["BossUninterruptible"..i] = castNotInterruptible
					VDW.VCB["BossCastbar"..i] = "Channel"
					VDW.VCB["BossInterrupted"..i] = false
				end
			end
		end
	elseif event == "UNIT_SPELLCAST_EMPOWER_START" then
		for i = 1, 5, 1 do
			if arg1 == "boss"..i then
				local chanName, chanText, chanTex, _, _, isTradeSkill, chanNotInterruptible, _, isEmpowered, numStages = UnitChannelInfo(arg1)
				if chanName then
					VDW.VCB["BossDuration"..i] = UnitCastingDuration(arg1)
					VDW.VCB["BossUninterruptible"..i] = castNotInterruptible
					VDW.VCB["BossCastbar"..i] = "Empower"
					VDW.VCB["BossInterrupted"..i] = false
				end
			end
		end
	elseif event == "UNIT_SPELLCAST_INTERRUPTED" then
		for i = 1, 5, 1 do
			if arg1 == "boss"..i then
				VDW.VCB["BossInterrupted"..i] = true
			end
		end
	end
end
vcbZlave:HookScript("OnEvent", EventsTime)
