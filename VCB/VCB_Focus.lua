-- =========================
-- some variables
-- =========================
local G = VDW.Local.Override
local Duration
local uninterruptible = false
local castBar = "Cast"
local tradeSkill = false
local interrupted = false
local interruptedBy
local jailerColor = CreateColorFromRGBAHexString("0A979CFF")
-- =========================
-- extra textures
-- =========================
-- icon spell left
local iconSpellLeft = FocusFrameSpellBar:CreateTexture(nil, "ARTWORK", nil, 0)
iconSpellLeft:Hide()
-- icon spell right
local iconSpellRight = FocusFrameSpellBar:CreateTexture(nil, "ARTWORK", nil, 0)
iconSpellRight:Hide()
-- spell's shield left
local shieldX = FocusFrameSpellBar:GetHeight() * 2.5
local shieldY = shieldX + 4
local shieldSpellLeft = FocusFrameSpellBar:CreateTexture(nil, "BACKGROUND", nil, 0)
shieldSpellLeft:SetAtlas("ui-castingbar-shield", false)
shieldSpellLeft:SetPoint("RIGHT", FocusFrameSpellBar, "LEFT", 0, 0)
shieldSpellLeft:SetSize(shieldX, shieldY)
shieldSpellLeft:SetBlendMode("BLEND")
shieldSpellLeft:SetAlpha(0) -- 0.75
-- spell's shield right
local shieldSpellRight = FocusFrameSpellBar:CreateTexture(nil, "BACKGROUND", nil, 0)
shieldSpellRight:SetAtlas("ui-castingbar-shield", false)
shieldSpellRight:SetPoint("LEFT", FocusFrameSpellBar, "RIGHT", 0, 0)
shieldSpellRight:SetSize(shieldX, shieldY)
shieldSpellRight:SetBlendMode("BLEND")
shieldSpellRight:SetAlpha(0) -- 0.75
-- Text Border Top
local TextBorderTop = FocusFrameSpellBar:CreateTexture(nil, "BACKGROUND", nil, -7)
TextBorderTop:SetAtlas("ui-castingbar-textbox", false)
TextBorderTop:SetPoint("TOPLEFT", FocusFrameSpellBar, "TOPLEFT", 4, 12)
TextBorderTop:SetPoint("BOTTOMRIGHT", FocusFrameSpellBar, "BOTTOMRIGHT", -4, 4)
TextBorderTop:SetAlpha(0.45)
TextBorderTop:Show()
-- Text Border Bottom
local TextBorderBottom = FocusFrameSpellBar:CreateTexture(nil, "BACKGROUND", nil, -7)
TextBorderBottom:SetAtlas("ui-castingbar-textbox", false)
TextBorderBottom:SetPoint("TOPLEFT", FocusFrameSpellBar, "TOPLEFT", 4, -4)
TextBorderBottom:SetPoint("BOTTOMRIGHT", FocusFrameSpellBar, "BOTTOMRIGHT", -4, -12)
TextBorderBottom:SetAlpha(0.45)
TextBorderBottom:Show()
-- =========================
-- extra texts
-- =========================
-- function for the texts
local function Texts(var1)
	var1:SetFontObject("GameFontHighlightSmall")
	var1:Hide()
end
-- creating the texts
local textName = FocusFrameSpellBar:CreateFontString(nil, "OVERLAY", nil)
Texts(textName)
local textCurrent = FocusFrameSpellBar:CreateFontString(nil, "OVERLAY", nil)
Texts(textCurrent)
local textBoth = FocusFrameSpellBar:CreateFontString(nil, "OVERLAY", nil)
Texts(textBoth)
local textTotal = FocusFrameSpellBar:CreateFontString(nil, "OVERLAY", nil)
Texts(textTotal)
-- =========================
-- functions protect the options
-- =========================
local function ProtectOptions()
	local loc = GetLocale()
	if loc ~= VCBspecialSettings["LastLocation"] then
		for k, v in pairs(VDW.Local.Translate) do
			for i, s in pairs (v) do
				if VCBsettings.Focus.Icon.Position == s then
					VCBsettings.Focus.Icon.Position = VDW.Local.Translate[loc][i]
				end
				if VCBsettings.Focus.Shield.Position == s then
					VCBsettings.Focus.Shield.Position = VDW.Local.Translate[loc][i]
				end
				if VCBsettings.Focus.TextBorder.Position == s then
					VCBsettings.Focus.TextBorder.Position = VDW.Local.Translate[loc][i]
				end
				if VCBsettings.Focus.NameText.Position == s then
					VCBsettings.Focus.NameText.Position = VDW.Local.Translate[loc][i]
				end
				if VCBsettings.Focus.CurrentTimeText.Position == s then
					VCBsettings.Focus.CurrentTimeText.Position = VDW.Local.Translate[loc][i]
				end
				if VCBsettings.Focus.BothTimeText.Position == s then
					VCBsettings.Focus.BothTimeText.Position = VDW.Local.Translate[loc][i]
				end
				if VCBsettings.Focus.TotalTimeText.Position == s then
					VCBsettings.Focus.TotalTimeText.Position = VDW.Local.Translate[loc][i]
				end
				if VCBsettings.Focus.CurrentTimeText.Direction == s then
					VCBsettings.Focus.CurrentTimeText.Direction = VDW.Local.Translate[loc][i]
				end
				if VCBsettings.Focus.BothTimeText.Direction == s then
					VCBsettings.Focus.BothTimeText.Direction = VDW.Local.Translate[loc][i]
				end
				if VCBsettings.Focus.CurrentTimeText.Sec == s then
					VCBsettings.Focus.CurrentTimeText.Sec = VDW.Local.Translate[loc][i]
				end
				if VCBsettings.Focus.BothTimeText.Sec == s then
					VCBsettings.Focus.BothTimeText.Sec = VDW.Local.Translate[loc][i]
				end
				if VCBsettings.Focus.TotalTimeText.Sec == s then
					VCBsettings.Focus.TotalTimeText.Sec = VDW.Local.Translate[loc][i]
				end
				if VCBsettings.Focus.StatusBar.Color == s then
					VCBsettings.Focus.StatusBar.Color = VDW.Local.Translate[loc][i]
				end
				if VCBsettings.Focus.StatusBar.Style == s then
					VCBsettings.Focus.StatusBar.Style = VDW.Local.Translate[loc][i]
				end
				if VCBsettings.Focus.Border.Color == s then
					VCBsettings.Focus.Border.Color = VDW.Local.Translate[loc][i]
				end
				if VCBsettings.Focus.Border.Style == s then
					VCBsettings.Focus.Border.Style = VDW.Local.Translate[loc][i]
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
local function bordertextPosition ()
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
-- border color
local function borderColor(self)
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
function VDW.VCB.chkFocusIconPosition()
	if VCBsettings.Focus.Icon.Position == G.OPTIONS_V_HIDE then
		function iconPosition(self)
			if iconSpellLeft:IsShown() then iconSpellLeft:Hide() end
			if iconSpellRight:IsShown() then iconSpellRight:Hide() end
		end
	elseif VCBsettings.Focus.Icon.Position == G.OPTIONS_P_LEFT then
		function iconPosition(self)
			iconSpellLeft:ClearAllPoints()
			iconSpellLeft:SetPoint("TOPLEFT", shieldSpellLeft, "TOPLEFT", 6, -6)
			iconSpellLeft:SetPoint("BOTTOMRIGHT", shieldSpellLeft, "BOTTOMRIGHT", -6, 10)
			iconSpellLeft:SetTexture(self.Icon:GetTextureFileID())
			if not iconSpellLeft:IsShown() then iconSpellLeft:Show() end
			if iconSpellRight:IsShown() then iconSpellRight:Hide() end
		end
	elseif VCBsettings.Focus.Icon.Position == G.OPTIONS_P_RIGHT then
		function iconPosition(self)
			if iconSpellLeft:IsShown() then iconSpellLeft:Hide() end
			iconSpellRight:ClearAllPoints()
			iconSpellRight:SetPoint("TOPLEFT", shieldSpellRight, "TOPLEFT", 6, -6)
			iconSpellRight:SetPoint("BOTTOMRIGHT", shieldSpellRight, "BOTTOMRIGHT", -6, 10)
			iconSpellRight:SetTexture(self.Icon:GetTextureFileID())
			if not iconSpellRight:IsShown() then iconSpellRight:Show() end
		end
	elseif VCBsettings.Focus.Icon.Position == G.OPTIONS_P_BOTH then
		function iconPosition(self)
			iconSpellLeft:ClearAllPoints()
			iconSpellLeft:SetPoint("TOPLEFT", shieldSpellLeft, "TOPLEFT", 6, -6)
			iconSpellLeft:SetPoint("BOTTOMRIGHT", shieldSpellLeft, "BOTTOMRIGHT", -6, 10)
			iconSpellLeft:SetTexture(self.Icon:GetTextureFileID())
			if not iconSpellLeft:IsShown() then iconSpellLeft:Show() end
			iconSpellRight:ClearAllPoints()
			iconSpellRight:SetPoint("TOPLEFT", shieldSpellRight, "TOPLEFT", 6, -6)
			iconSpellRight:SetPoint("BOTTOMRIGHT", shieldSpellRight, "BOTTOMRIGHT", -6, 10)
			iconSpellRight:SetTexture(self.Icon:GetTextureFileID())
			if not iconSpellRight:IsShown() then iconSpellRight:Show() end
		end
	end
end
-- check shield
function VDW.VCB.chkFocusShieldPosition()
	if VCBsettings.Focus.Shield.Position == G.OPTIONS_V_HIDE then
		function shieldPosition(uninterruptible)
			shieldSpellLeft:SetAlpha(0)
			shieldSpellRight:SetAlpha(0)
		end
	elseif VCBsettings.Focus.Shield.Position == G.OPTIONS_P_LEFT then
		function shieldPosition(uninterruptible)
			shieldSpellLeft:SetAlphaFromBoolean(uninterruptible, 150, 0)
			shieldSpellRight:SetAlpha(0)
		end
	elseif VCBsettings.Focus.Shield.Position == G.OPTIONS_P_RIGHT then
		function shieldPosition(uninterruptible)
			shieldSpellLeft:SetAlpha(0)
			shieldSpellRight:SetAlphaFromBoolean(uninterruptible, 150, 0)
		end
	elseif VCBsettings.Focus.Shield.Position == G.OPTIONS_P_BOTH then
		function shieldPosition(uninterruptible)
			shieldSpellLeft:SetAlphaFromBoolean(uninterruptible, 150, 0)
			shieldSpellRight:SetAlphaFromBoolean(uninterruptible, 150, 0)
		end
	end
end
-- check text border
function VDW.VCB.chkFocusBorderTextPosition()
	if VCBsettings.Focus.BorderText.Position == G.OPTIONS_V_HIDE then
		function bordertextPosition ()
			TextBorderTop:Hide()
			TextBorderBottom:Hide()
		end
	elseif VCBsettings.Focus.BorderText.Position == G.OPTIONS_P_TOP then
		function bordertextPosition()
			TextBorderTop:Show()
			TextBorderBottom:Hide()
		end
	elseif VCBsettings.Focus.BorderText.Position == G.OPTIONS_P_BOTTOM then
		function bordertextPosition()
			TextBorderTop:Hide()
			TextBorderBottom:Show()
		end
	elseif VCBsettings.Focus.BorderText.Position == G.OPTIONS_P_BOTH then
		function bordertextPosition()
			TextBorderTop:Show()
			TextBorderBottom:Show()
		end
	end
end
-- check name text position
function VDW.VCB.chkNameTxtFocus()
	if VCBsettings.Focus.NameText.Position == G.OPTIONS_V_HIDE then
		function namePosition(self)
			if textName:IsShown() then textName:Hide() end
		end
	elseif VCBsettings.Focus.NameText.Position == G.OPTIONS_P_TOPLEFT then
		function namePosition(self)
			textName:ClearAllPoints()
			textName:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 4, 1)
			textName:SetJustifyH("LEFT")
			if not textName:IsShown() then textName:Show() end
		end
	elseif VCBsettings.Focus.NameText.Position == G.OPTIONS_P_LEFT then
		function namePosition(self)
			textName:ClearAllPoints()
			textName:SetPoint("LEFT", self, "LEFT", 4, 0)
			textName:SetJustifyH("LEFT")
			if not textName:IsShown() then textName:Show() end
		end
	elseif VCBsettings.Focus.NameText.Position == G.OPTIONS_P_BOTTOMLEFT then
		function namePosition(self)
			textName:ClearAllPoints()
			textName:SetPoint("TOPLEFT", self, "BOTTOMLEFT", 4, -1)
			textName:SetJustifyH("LEFT")
			if not textName:IsShown() then textName:Show() end
		end
	elseif VCBsettings.Focus.NameText.Position == G.OPTIONS_P_TOP then
		function namePosition(self)
			textName:ClearAllPoints()
			textName:SetPoint("BOTTOM", self, "TOP", 0, 1)
			textName:SetJustifyH("CENTER")
			if not textName:IsShown() then textName:Show() end
		end
	elseif VCBsettings.Focus.NameText.Position == G.OPTIONS_P_CENTER then
		function namePosition(self)
			textName:ClearAllPoints()
			textName:SetPoint("CENTER", self, "CENTER", 0, 0)
			textName:SetJustifyH("CENTER")
			if not textName:IsShown() then textName:Show() end
		end
	elseif VCBsettings.Focus.NameText.Position == G.OPTIONS_P_BOTTOM then
		function namePosition(self)
			textName:ClearAllPoints()
			textName:SetPoint("TOP", self, "BOTTOM", 0, -1)
			textName:SetJustifyH("CENTER")
			if not textName:IsShown() then textName:Show() end
		end
	elseif VCBsettings.Focus.NameText.Position == G.OPTIONS_P_TOPRIGHT then
		function namePosition(self)
			textName:ClearAllPoints()
			textName:SetPoint("BOTTOMRIGHT", self, "TOPRIGHT", -4, 1)
			textName:SetJustifyH("RIGHT")
			if not textName:IsShown() then textName:Show() end
		end
	elseif VCBsettings.Focus.NameText.Position == G.OPTIONS_P_RIGHT then
		function namePosition(self)
			textName:ClearAllPoints()
			textName:SetPoint("RIGHT", self, "RIGHT", -4, 0)
			textName:SetJustifyH("RIGHT")
			if not textName:IsShown() then textName:Show() end
		end
	elseif VCBsettings.Focus.NameText.Position == G.OPTIONS_P_BOTTOMRIGHT then
		function namePosition(self)
			textName:ClearAllPoints()
			textName:SetPoint("TOPRIGHT", self, "BOTTOMRIGHT", -4, -1)
			textName:SetJustifyH("RIGHT")
			if not textName:IsShown() then textName:Show() end
		end
	end
end
-- check current casting time text position
function VDW.VCB.chkCurrentTxtFocus()
	if VCBsettings.Focus.CurrentTimeText.Position == G.OPTIONS_V_HIDE then
		function currentPostion(self)
			if textCurrent:IsShown() then textCurrent:Hide() end
		end
	elseif VCBsettings.Focus.CurrentTimeText.Position == G.OPTIONS_P_TOPLEFT then
		function currentPostion(self)
			textCurrent:ClearAllPoints()
			textCurrent:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 4, 1)
			if not textCurrent:IsShown() then textCurrent:Show() end
		end
	elseif VCBsettings.Focus.CurrentTimeText.Position == G.OPTIONS_P_LEFT then
		function currentPostion(self)
			textCurrent:ClearAllPoints()
			textCurrent:SetPoint("LEFT", self, "LEFT", 4, 0)
			if not textCurrent:IsShown() then textCurrent:Show() end
		end
	elseif VCBsettings.Focus.CurrentTimeText.Position == G.OPTIONS_P_BOTTOMLEFT then
		function currentPostion(self)
			textCurrent:ClearAllPoints()
			textCurrent:SetPoint("TOPLEFT", self, "BOTTOMLEFT", 4, -1)
			if not textCurrent:IsShown() then textCurrent:Show() end
		end
	elseif VCBsettings.Focus.CurrentTimeText.Position == G.OPTIONS_P_TOP then
		function currentPostion(self)
			textCurrent:ClearAllPoints()
			textCurrent:SetPoint("BOTTOM", self, "TOP", 0, 1)
			if not textCurrent:IsShown() then textCurrent:Show() end
		end
	elseif VCBsettings.Focus.CurrentTimeText.Position == G.OPTIONS_P_CENTER then
		function currentPostion(self)
			textCurrent:ClearAllPoints()
			textCurrent:SetPoint("CENTER", self, "CENTER", 0, 0)
			if not textCurrent:IsShown() then textCurrent:Show() end
		end
	elseif VCBsettings.Focus.CurrentTimeText.Position == G.OPTIONS_P_BOTTOM then
		function currentPostion(self)
			textCurrent:ClearAllPoints()
			textCurrent:SetPoint("TOP", self, "BOTTOM", 0, -1)
			if not textCurrent:IsShown() then textCurrent:Show() end
		end
	elseif VCBsettings.Focus.CurrentTimeText.Position == G.OPTIONS_P_TOPRIGHT then
		function currentPostion(self)
			textCurrent:ClearAllPoints()
			textCurrent:SetPoint("BOTTOMRIGHT", self, "TOPRIGHT", -4, 1)
			if not textCurrent:IsShown() then textCurrent:Show() end
		end
	elseif VCBsettings.Focus.CurrentTimeText.Position == G.OPTIONS_P_RIGHT then
		function currentPostion(self)
			textCurrent:ClearAllPoints()
			textCurrent:SetPoint("RIGHT", self, "RIGHT", -4, 0)
			if not textCurrent:IsShown() then textCurrent:Show() end
		end
	elseif VCBsettings.Focus.CurrentTimeText.Position == G.OPTIONS_P_BOTTOMRIGHT then
		function currentPostion(self)
			textCurrent:ClearAllPoints()
			textCurrent:SetPoint("TOPRIGHT", self, "BOTTOMRIGHT", -4, -1)
			if not textCurrent:IsShown() then textCurrent:Show() end
		end
	end
end
-- check both casting time text position
function VDW.VCB.chkBothTxtFocus()
	if VCBsettings.Focus.BothTimeText.Position == G.OPTIONS_V_HIDE then
		function bothPostion(self)
			if textBoth:IsShown() then textBoth:Hide() end
		end
	elseif VCBsettings.Focus.BothTimeText.Position == G.OPTIONS_P_TOPLEFT then
		function bothPostion(self)
			textBoth:ClearAllPoints()
			textBoth:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 4, 1)
			if not textBoth:IsShown() then textBoth:Show() end
		end
	elseif VCBsettings.Focus.BothTimeText.Position == G.OPTIONS_P_LEFT then
		function bothPostion(self)
			textBoth:ClearAllPoints()
			textBoth:SetPoint("LEFT", self, "LEFT", 4, 0)
			if not textBoth:IsShown() then textBoth:Show() end
		end
	elseif VCBsettings.Focus.BothTimeText.Position == G.OPTIONS_P_BOTTOMLEFT then
		function bothPostion(self)
			textBoth:ClearAllPoints()
			textBoth:SetPoint("TOPLEFT", self, "BOTTOMLEFT", 4, -1)
			if not textBoth:IsShown() then textBoth:Show() end
		end
	elseif VCBsettings.Focus.BothTimeText.Position == G.OPTIONS_P_TOP then
		function bothPostion(self)
			textBoth:ClearAllPoints()
			textBoth:SetPoint("BOTTOM", self, "TOP", 0, 1)
			if not textBoth:IsShown() then textBoth:Show() end
		end
	elseif VCBsettings.Focus.BothTimeText.Position == G.OPTIONS_P_CENTER then
		function bothPostion(self)
			textBoth:ClearAllPoints()
			textBoth:SetPoint("CENTER", self, "CENTER", 0, 0)
			if not textBoth:IsShown() then textBoth:Show() end
		end
	elseif VCBsettings.Focus.BothTimeText.Position == G.OPTIONS_P_BOTTOM then
		function bothPostion(self)
			textBoth:ClearAllPoints()
			textBoth:SetPoint("TOP", self, "BOTTOM", 0, -1)
			if not textBoth:IsShown() then textBoth:Show() end
		end
	elseif VCBsettings.Focus.BothTimeText.Position == G.OPTIONS_P_TOPRIGHT then
		function bothPostion(self)
			textBoth:ClearAllPoints()
			textBoth:SetPoint("BOTTOMRIGHT", self, "TOPRIGHT", -4, 1)
			if not textBoth:IsShown() then textBoth:Show() end
		end
	elseif VCBsettings.Focus.BothTimeText.Position == G.OPTIONS_P_RIGHT then
		function bothPostion(self)
			textBoth:ClearAllPoints()
			textBoth:SetPoint("RIGHT", self, "RIGHT", -4, 0)
			if not textBoth:IsShown() then textBoth:Show() end
		end
	elseif VCBsettings.Focus.BothTimeText.Position == G.OPTIONS_P_BOTTOMRIGHT then
		function bothPostion(self)
			textBoth:ClearAllPoints()
			textBoth:SetPoint("TOPRIGHT", self, "BOTTOMRIGHT", -4, -1)
			if not textBoth:IsShown() then textBoth:Show() end
		end
	end
end
-- check total casting time text position
function VDW.VCB.chkTotalTxtFocus()
	if VCBsettings.Focus.TotalTimeText.Position == G.OPTIONS_V_HIDE then
		function totalPostion(self)
			if textTotal:IsShown() then textTotal:Hide() end
		end
	elseif VCBsettings.Focus.TotalTimeText.Position == G.OPTIONS_P_TOPLEFT then
		function totalPostion(self)
			textTotal:ClearAllPoints()
			textTotal:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 4, 1)
			if not textTotal:IsShown() then textTotal:Show() end
		end
	elseif VCBsettings.Focus.TotalTimeText.Position == G.OPTIONS_P_LEFT then
		function totalPostion(self)
			textTotal:ClearAllPoints()
			textTotal:SetPoint("LEFT", self, "LEFT", 4, 0)
			if not textTotal:IsShown() then textTotal:Show() end
		end
	elseif VCBsettings.Focus.TotalTimeText.Position == G.OPTIONS_P_BOTTOMLEFT then
		function totalPostion(self)
			textTotal:ClearAllPoints()
			textTotal:SetPoint("TOPLEFT", self, "BOTTOMLEFT", 4, -1)
			if not textTotal:IsShown() then textTotal:Show() end
		end
	elseif VCBsettings.Focus.TotalTimeText.Position == G.OPTIONS_P_TOP then
		function totalPostion(self)
			textTotal:ClearAllPoints()
			textTotal:SetPoint("BOTTOM", self, "TOP", 0, 1)
			if not textTotal:IsShown() then textTotal:Show() end
		end
	elseif VCBsettings.Focus.TotalTimeText.Position == G.OPTIONS_P_CENTER then
		function totalPostion(self)
			textTotal:ClearAllPoints()
			textTotal:SetPoint("CENTER", self, "CENTER", 0, 0)
			if not textTotal:IsShown() then textTotal:Show() end
		end
	elseif VCBsettings.Focus.TotalTimeText.Position == G.OPTIONS_P_BOTTOM then
		function totalPostion(self)
			textTotal:ClearAllPoints()
			textTotal:SetPoint("TOP", self, "BOTTOM", 0, -1)
			if not textTotal:IsShown() then textTotal:Show() end
		end
	elseif VCBsettings.Focus.TotalTimeText.Position == G.OPTIONS_P_TOPRIGHT then
		function totalPostion(self)
			textTotal:ClearAllPoints()
			textTotal:SetPoint("BOTTOMRIGHT", self, "TOPRIGHT", -4, 1)
			if not textTotal:IsShown() then textTotal:Show() end
		end
	elseif VCBsettings.Focus.TotalTimeText.Position == G.OPTIONS_P_RIGHT then
		function totalPostion(self)
			textTotal:ClearAllPoints()
			textTotal:SetPoint("RIGHT", self, "RIGHT", -4, 0)
			if not textTotal:IsShown() then textTotal:Show() end
		end
	elseif VCBsettings.Focus.TotalTimeText.Position == G.OPTIONS_P_BOTTOMRIGHT then
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
function VDW.VCB.chkCurrentUpdFocus()
	if VCBsettings.Focus.CurrentTimeText.Position ~= G.OPTIONS_V_HIDE then
		if VCBsettings.Focus.CurrentTimeText.Sec == G.OPTIONS_V_HIDE then
			if VCBsettings.Focus.CurrentTimeText.Decimals == "0" then
				if VCBsettings.Focus.CurrentTimeText.Direction == G.OPTIONS_D_ASCENDING then
					function currentUpdate(self)
						textCurrent:SetText(string.format("%.0f", Duration:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Focus.CurrentTimeText.Direction == G.OPTIONS_D_DESCENDING then
					function currentUpdate(self)
						textCurrent:SetText(string.format("%.0f", Duration:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Focus.CurrentTimeText.Direction == G.OPTIONS_P_BOTH then
					function currentUpdate(self)
						if castBar == "Cast" or castBar == "Empower" then
							textCurrent:SetText(string.format("%.0f", Duration:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
						elseif castBar == "Channel" then
							textCurrent:SetText(string.format("%.0f", Duration:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			elseif VCBsettings.Focus.CurrentTimeText.Decimals == "1" then
				if VCBsettings.Focus.CurrentTimeText.Direction == G.OPTIONS_D_ASCENDING then
					function currentUpdate(self)
						textCurrent:SetText(string.format("%.1f", Duration:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Focus.CurrentTimeText.Direction == G.OPTIONS_D_DESCENDING then
					function currentUpdate(self)
						textCurrent:SetText(string.format("%.1f", Duration:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Focus.CurrentTimeText.Direction == G.OPTIONS_P_BOTH then
					function currentUpdate(self)
						if castBar == "Cast" or castBar == "Empower" then
							textCurrent:SetText(string.format("%.1f", Duration:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
						elseif castBar == "Channel" then
							textCurrent:SetText(string.format("%.1f", Duration:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			elseif VCBsettings.Focus.CurrentTimeText.Decimals == "2" then
				if VCBsettings.Focus.CurrentTimeText.Direction == G.OPTIONS_D_ASCENDING then
					function currentUpdate(self)
						textCurrent:SetText(string.format("%.2f", Duration:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Focus.CurrentTimeText.Direction == G.OPTIONS_D_DESCENDING then
					function currentUpdate(self)
						textCurrent:SetText(string.format("%.2f", Duration:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Focus.CurrentTimeText.Direction == G.OPTIONS_P_BOTH then
					function currentUpdate(self)
						if castBar == "Cast" or castBar == "Empower" then
							textCurrent:SetText(string.format("%.2f", Duration:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
						elseif castBar == "Channel" then
							textCurrent:SetText(string.format("%.2f", Duration:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			elseif VCBsettings.Focus.CurrentTimeText.Decimals == "3" then
				if VCBsettings.Focus.CurrentTimeText.Direction == G.OPTIONS_D_ASCENDING then
					function currentUpdate(self)
						textCurrent:SetText(string.format("%.3f", Duration:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Focus.CurrentTimeText.Direction == G.OPTIONS_D_DESCENDING then
					function currentUpdate(self)
						textCurrent:SetText(string.format("%.3f", Duration:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Focus.CurrentTimeText.Direction == G.OPTIONS_P_BOTH then
					function currentUpdate(self)
						if castBar == "Cast" or castBar == "Empower" then
							textCurrent:SetText(string.format("%.3f", Duration:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
						elseif castBar == "Channel" then
							textCurrent:SetText(string.format("%.3f", Duration:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			end
		elseif VCBsettings.Focus.CurrentTimeText.Sec == G.OPTIONS_V_SHOW then
			if VCBsettings.Focus.CurrentTimeText.Decimals == "0" then
				if VCBsettings.Focus.CurrentTimeText.Direction == G.OPTIONS_D_ASCENDING then
					function currentUpdate(self)
						textCurrent:SetText(string.format("%.0f Sec", Duration:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Focus.CurrentTimeText.Direction == G.OPTIONS_D_DESCENDING then
					function currentUpdate(self)
						textCurrent:SetText(string.format("%.0f Sec", Duration:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Focus.CurrentTimeText.Direction == G.OPTIONS_P_BOTH then
					function currentUpdate(self)
						if castBar == "Cast" or castBar == "Empower" then
							textCurrent:SetText(string.format("%.0f Sec", Duration:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
						elseif castBar == "Channel" then
							textCurrent:SetText(string.format("%.0f Sec", Duration:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			elseif VCBsettings.Focus.CurrentTimeText.Decimals == "1" then
				if VCBsettings.Focus.CurrentTimeText.Direction == G.OPTIONS_D_ASCENDING then
					function currentUpdate(self)
						textCurrent:SetText(string.format("%.1f Sec", Duration:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Focus.CurrentTimeText.Direction == G.OPTIONS_D_DESCENDING then
					function currentUpdate(self)
						textCurrent:SetText(string.format("%.1f Sec", Duration:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Focus.CurrentTimeText.Direction == G.OPTIONS_P_BOTH then
					function currentUpdate(self)
						if castBar == "Cast" or castBar == "Empower" then
							textCurrent:SetText(string.format("%.1f Sec", Duration:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
						elseif castBar == "Channel" then
							textCurrent:SetText(string.format("%.1f Sec", Duration:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			elseif VCBsettings.Focus.CurrentTimeText.Decimals == "2" then
				if VCBsettings.Focus.CurrentTimeText.Direction == G.OPTIONS_D_ASCENDING then
					function currentUpdate(self)
						textCurrent:SetText(string.format("%.2f Sec", Duration:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Focus.CurrentTimeText.Direction == G.OPTIONS_D_DESCENDING then
					function currentUpdate(self)
						textCurrent:SetText(string.format("%.2f Sec", Duration:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Focus.CurrentTimeText.Direction == G.OPTIONS_P_BOTH then
					function currentUpdate(self)
						if castBar == "Cast" or castBar == "Empower" then
							textCurrent:SetText(string.format("%.2f Sec", Duration:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
						elseif castBar == "Channel" then
							textCurrent:SetText(string.format("%.2f Sec", Duration:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			elseif VCBsettings.Focus.CurrentTimeText.Decimals == "3" then
				if VCBsettings.Focus.CurrentTimeText.Direction == G.OPTIONS_D_ASCENDING then
					function currentUpdate(self)
						textCurrent:SetText(string.format("%.3f Sec", Duration:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Focus.CurrentTimeText.Direction == G.OPTIONS_D_DESCENDING then
					function currentUpdate(self)
						textCurrent:SetText(string.format("%.3f Sec", Duration:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Focus.CurrentTimeText.Direction == G.OPTIONS_P_BOTH then
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
	elseif VCBsettings.Focus.CurrentTimeText.Position == G.OPTIONS_V_HIDE then
		function currentUpdate(self)
			return
		end
	end
end
-- check both casting time update
function VDW.VCB.chkBothUpdFocus()
	if VCBsettings.Focus.BothTimeText.Position ~= G.OPTIONS_V_HIDE then
		if VCBsettings.Focus.BothTimeText.Sec == G.OPTIONS_V_HIDE then
			if VCBsettings.Focus.BothTimeText.Decimals == "0" then
				if VCBsettings.Focus.BothTimeText.Direction == G.OPTIONS_D_ASCENDING then
					function bothUpdate(self)
						textBoth:SetText(string.format("%.0f / %.0f", Duration:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Focus.BothTimeText.Direction == G.OPTIONS_D_DESCENDING then
					function bothUpdate(self)
						textBoth:SetText(string.format("%.0f / %.0f", Duration:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Focus.BothTimeText.Direction == G.OPTIONS_P_BOTH then
					function bothUpdate(self)
						if castBar == "Cast" or castBar == "Empower" then
							textBoth:SetText(string.format("%.0f / %.0f", Duration:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						elseif castBar == "Channel" then
							textBoth:SetText(string.format("%.0f / %.0f", Duration:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			elseif VCBsettings.Focus.BothTimeText.Decimals == "1" then
				if VCBsettings.Focus.BothTimeText.Direction == G.OPTIONS_D_ASCENDING then
					function bothUpdate(self)
						textBoth:SetText(string.format("%.1f / %.1f", Duration:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Focus.BothTimeText.Direction == G.OPTIONS_D_DESCENDING then
					function bothUpdate(self)
						textBoth:SetText(string.format("%.1f / %.1f", Duration:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Focus.BothTimeText.Direction == G.OPTIONS_P_BOTH then
					function bothUpdate(self)
						if castBar == "Cast" or castBar == "Empower" then
							textBoth:SetText(string.format("%.1f / %.1f", Duration:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						elseif castBar == "Channel" then
							textBoth:SetText(string.format("%.1f / %.1f", Duration:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			elseif VCBsettings.Focus.BothTimeText.Decimals == "2" then
				if VCBsettings.Focus.BothTimeText.Direction == G.OPTIONS_D_ASCENDING then
					function bothUpdate(self)
						textBoth:SetText(string.format("%.2f / %.2f", Duration:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Focus.BothTimeText.Direction == G.OPTIONS_D_DESCENDING then
					function bothUpdate(self)
						textBoth:SetText(string.format("%.2f / %.2f", Duration:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Focus.BothTimeText.Direction == G.OPTIONS_P_BOTH then
					function bothUpdate(self)
						if castBar == "Cast" or castBar == "Empower" then
							textBoth:SetText(string.format("%.2f / %.2f", Duration:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						elseif castBar == "Channel" then
							textBoth:SetText(string.format("%.2f / %.2f", Duration:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			elseif VCBsettings.Focus.BothTimeText.Decimals == "3" then
				if VCBsettings.Focus.BothTimeText.Direction == G.OPTIONS_D_ASCENDING then
					function bothUpdate(self)
						textBoth:SetText(string.format("%.3f / %.3f", Duration:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Focus.BothTimeText.Direction == G.OPTIONS_D_DESCENDING then
					function bothUpdate(self)
						textBoth:SetText(string.format("%.3f / %.3f", Duration:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Focus.BothTimeText.Direction == G.OPTIONS_P_BOTH then
					function bothUpdate(self)
						if castBar == "Cast" or castBar == "Empower" then
							textBoth:SetText(string.format("%.3f", Duration:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						elseif castBar == "Channel" then
							textBoth:SetText(string.format("%.3f / %.3f", Duration:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			end
		elseif VCBsettings.Focus.BothTimeText.Sec == G.OPTIONS_V_SHOW then
			if VCBsettings.Focus.BothTimeText.Decimals == "0" then
				if VCBsettings.Focus.BothTimeText.Direction == G.OPTIONS_D_ASCENDING then
					function bothUpdate(self)
						textBoth:SetText(string.format("%.0f / %.0f Sec", Duration:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Focus.BothTimeText.Direction == G.OPTIONS_D_DESCENDING then
					function bothUpdate(self)
						textBoth:SetText(string.format("%.0f / %.0f Sec", Duration:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Focus.BothTimeText.Direction == G.OPTIONS_P_BOTH then
					function bothUpdate(self)
						if castBar == "Cast" or castBar == "Empower" then
							textBoth:SetText(string.format("%.0f / %.0f Sec", Duration:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						elseif castBar == "Channel" then
							textBoth:SetText(string.format("%.0f / %.0f Sec", Duration:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			elseif VCBsettings.Focus.BothTimeText.Decimals == "1" then
				if VCBsettings.Focus.BothTimeText.Direction == G.OPTIONS_D_ASCENDING then
					function bothUpdate(self)
						textBoth:SetText(string.format("%.1f / %.1f Sec", Duration:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Focus.BothTimeText.Direction == G.OPTIONS_D_DESCENDING then
					function bothUpdate(self)
						textBoth:SetText(string.format("%.1f / %.1f Sec", Duration:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Focus.BothTimeText.Direction == G.OPTIONS_P_BOTH then
					function bothUpdate(self)
						if castBar == "Cast" or castBar == "Empower" then
							textBoth:SetText(string.format("%.1f / %.1f Sec", Duration:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						elseif castBar == "Channel" then
							textBoth:SetText(string.format("%.1f / %.1f Sec", Duration:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			elseif VCBsettings.Focus.BothTimeText.Decimals == "2" then
				if VCBsettings.Focus.BothTimeText.Direction == G.OPTIONS_D_ASCENDING then
					function bothUpdate(self)
						textBoth:SetText(string.format("%.2f / %.2f Sec", Duration:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Focus.BothTimeText.Direction == G.OPTIONS_D_DESCENDING then
					function bothUpdate(self)
						textBoth:SetText(string.format("%.2f / %.2f Sec", Duration:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Focus.BothTimeText.Direction == G.OPTIONS_P_BOTH then
					function bothUpdate(self)
						if castBar == "Cast" or castBar == "Empower" then
							textBoth:SetText(string.format("%.2f / %.2f Sec", Duration:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						elseif castBar == "Channel" then
							textBoth:SetText(string.format("%.2f / %.2f Sec", Duration:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			elseif VCBsettings.Focus.BothTimeText.Decimals == "3" then
				if VCBsettings.Focus.BothTimeText.Direction == G.OPTIONS_D_ASCENDING then
					function bothUpdate(self)
						textBoth:SetText(string.format("%.3f / %.3f Sec", Duration:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Focus.BothTimeText.Direction == G.OPTIONS_D_DESCENDING then
					function bothUpdate(self)
						textBoth:SetText(string.format("%.3f / %.3f Sec", Duration:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Focus.BothTimeText.Direction == G.OPTIONS_P_BOTH then
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
	elseif VCBsettings.Focus.BothTimeText.Position == G.OPTIONS_V_HIDE then
		function bothUpdate(self)
			return
		end
	end
end
-- check both casting time update
function VDW.VCB.chkTotalUpdFocus()
	if VCBsettings.Focus.TotalTimeText.Position ~= G.OPTIONS_V_HIDE then
		if VCBsettings.Focus.TotalTimeText.Sec == G.OPTIONS_V_HIDE then
			if VCBsettings.Focus.TotalTimeText.Decimals == "0" then
				function totalUpdate(self)
					textTotal:SetFormattedText("%.0f", Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime))
				end
			elseif VCBsettings.Focus.TotalTimeText.Decimals == "1" then
				function totalUpdate(self)
					textTotal:SetFormattedText("%.1f", Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime))
				end
			elseif VCBsettings.Focus.TotalTimeText.Decimals == "2" then
				function totalUpdate(self)
					textTotal:SetFormattedText("%.2f", Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime))
				end
			elseif VCBsettings.Focus.TotalTimeText.Decimals == "3" then
				function totalUpdate(self)
					textTotal:SetFormattedText("%.3f", Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime))
				end
			end
		elseif VCBsettings.Focus.TotalTimeText.Sec == G.OPTIONS_V_SHOW then
			if VCBsettings.Focus.TotalTimeText.Decimals == "0" then
				function totalUpdate(self)
					textTotal:SetFormattedText("%.0f sec", Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime))
				end
			elseif VCBsettings.Focus.TotalTimeText.Decimals == "1" then
				function totalUpdate(self)
					textTotal:SetFormattedText("%.1f sec", Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime))
				end
			elseif VCBsettings.Focus.TotalTimeText.Decimals == "2" then
				function totalUpdate(self)
					textTotal:SetFormattedText("%.2f sec", Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime))
				end
			elseif VCBsettings.Focus.TotalTimeText.Decimals == "3" then
				function totalUpdate(self)
					textTotal:SetFormattedText("%.3f sec", Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime))
				end
			end
		end
	elseif VCBsettings.Focus.TotalTimeText.Position == G.OPTIONS_V_HIDE then
		function totalUpdate(self)
			return
		end
	end
end
-- =========================
-- checking color & style functions
-- =========================
-- check status bar color
function VDW.VCB.chkStatusColorFocus()
	if VCBsettings.Focus.StatusBar.Color == G.OPTIONS_C_DEFAULT then
		function statusbarColor(self)
			self:SetStatusBarDesaturated(false)
			self:SetStatusBarColor(1, 1, 1, 1)
			if VCBsettings.Focus.StatusBar.Style == "Jailer" then
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
	elseif VCBsettings.Focus.StatusBar.Color == G.OPTIONS_C_CLASS then
		function statusbarColor(self)
			self:SetStatusBarDesaturated(true)
			self:SetStatusBarColor(vcbClassColorFocus:GetRGB())
			self.Spark:SetDesaturated(true)
			self.Spark:SetVertexColor(vcbClassColorFocus:GetRGB())
			self.Flash:SetDesaturated(true)
			self.Flash:SetVertexColor(vcbClassColorFocus:GetRGB())
		end
	end
end
-- check border bar color
function VDW.VCB.chkBorderColorFocus()
	if VCBsettings.Focus.Border.Color == G.OPTIONS_C_DEFAULT then
		function borderColor(self)
			self.Background:SetDesaturated(false)
			self.Border:SetDesaturated(false)
			TextBorderTop:SetDesaturated(false)
			TextBorderBottom:SetDesaturated(false)
			self.Background:SetVertexColor(1, 1, 1, 1)
			self.Border:SetVertexColor(1, 1, 1, 1)
			TextBorderTop:SetVertexColor(1, 1, 1, 1)
			TextBorderBottom:SetVertexColor(1, 1, 1, 1)
		end
	elseif VCBsettings.Focus.Border.Color == G.OPTIONS_C_CLASS then
		function borderColor(self)
			self.Background:SetDesaturated(true)
			self.Border:SetDesaturated(true)
			TextBorderTop:SetDesaturated(true)
			TextBorderBottom:SetDesaturated(true)
			self.Background:SetVertexColor(vcbClassColorFocus:GetRGB())
			self.Border:SetVertexColor(vcbClassColorFocus:GetRGB())
			TextBorderTop:SetVertexColor(vcbClassColorFocus:GetRGB())
			TextBorderBottom:SetVertexColor(vcbClassColorFocus:GetRGB())
		end
	end
end
-- call back the defaul color of status bar
local function defaultColor(self)
	self:SetStatusBarDesaturated(false)
	self:SetStatusBarColor(1, 1, 1, 1)
	if VCBsettings.Focus.StatusBar.Style == "Jailer" then
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
function VDW.VCB.chkStatusStyleFocus()
	if VCBsettings.Focus.StatusBar.Style == G.OPTIONS_C_DEFAULT then
		function statusbarStyle(self)
			return
		end
	elseif VCBsettings.Focus.StatusBar.Style == "Jailer" then
		function statusbarStyle(self)
			self:SetStatusBarTexture("jailerstower-scorebar-fill-onfire")
		end
	end
end
-- check border bar style
function VDW.VCB.chkBorderStyleFocus()
	if VCBsettings.Focus.Border.Style == G.OPTIONS_C_DEFAULT then
		function borderStyle(self)
			return
		end
	elseif VCBsettings.Focus.Border.Style == "Jailer" then
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
-- position bar --
local function positionBar(self)
	self:SetScale(VCBsettings["Focus"]["Scale"]/100)
	self:ClearAllPoints()
	self:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", VCBsettings["Focus"]["Position"]["X"], VCBsettings["Focus"]["Position"]["Y"])
end
-- =========================
-- Events Time
-- =========================
local function EventsTime(self, event, arg1, arg2, arg3, arg4)
	if event == "PLAYER_LOGIN" then
		ProtectOptions()
		VDW.VCB.chkFocusIconPosition()
		VDW.VCB.chkFocusShieldPosition()
		VDW.VCB.chkFocusBorderTextPosition()
		VDW.VCB.chkNameTxtFocus()
		VDW.VCB.chkCurrentTxtFocus()
		VDW.VCB.chkBothTxtFocus()
		VDW.VCB.chkTotalTxtFocus()
		VDW.VCB.chkCurrentUpdFocus()
		VDW.VCB.chkBothUpdFocus()
		VDW.VCB.chkTotalUpdFocus()
		VDW.VCB.chkStatusColorFocus()
		VDW.VCB.chkStatusStyleFocus()
		VDW.VCB.chkBorderColorFocus()
		VDW.VCB.chkBorderStyleFocus()
-- hook part 1 --
			FocusFrameSpellBar:HookScript("OnShow", function(self)
				textName:SetWidth(self:GetWidth() - 8)
				namePosition(self)
				currentPostion(self)
				bothPostion(self)
				totalPostion(self)
				borderStyle(self)
			end)
-- hook part 2 --
		if VCBsettings["Focus"]["Lock"] == G.OPTIONS_LS_UNLOCKED then
			FocusFrameSpellBar:HookScript("OnUpdate", function(self)
				positionBar(self)
			end)
		end
		FocusFrameSpellBar:HookScript("OnUpdate", function(self)
			self.TextBorder:SetAlpha(0)
			self.Text:SetAlpha(0)
			self.BorderShield:SetAlpha(0)
			self.Icon:SetAlpha(0)
			TextBorderTop:SetAlpha(0.45)
			TextBorderBottom:SetAlpha(0.45)
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
				if tradeSkill then defaultColor(self) else statusbarColor(self) end
				statusbarStyle(self)
				borderColor(self)
			end
		end)
	elseif event == "PLAYER_FOCUS_CHANGED" then
		if FocusFrame:IsShown() then
			local castName, castText, castTex, _, _, isTradeSkill, _, castNotInterruptible = UnitCastingInfo("focus")
			local chanName, chanText, chanTex, _, _, isTradeSkill, chanNotInterruptible, _, isEmpowered, numStages = UnitChannelInfo("focus")
			if castName then
				Duration = UnitCastingDuration("focus")
				uninterruptible = castNotInterruptible
				castBar = "Cast"
				tradeSkill = isTradeSkill
			elseif castName and numStages == 0 then
				Duration = UnitChannelDuration("focus")
				uninterruptible = chanNotInterruptible
				castBar = "Channel"
				tradeSkill = isTradeSkill
			elseif castName and numStages > 0 then
				Duration = UnitChannelDuration("focus")
				uninterruptible = chanNotInterruptible
				castBar = "Empower"
				tradeSkill = isTradeSkill
			end
			local classFilename = UnitClassBase("focus")
			if classFilename ~= nil then vcbClassColorFocus = C_ClassColor.GetClassColor(classFilename) end
		end
	elseif event == "UNIT_SPELLCAST_START" and arg1 == "focus" then
		local castName, castText, castTex, _, _, isTradeSkill, _, castNotInterruptible = UnitCastingInfo(arg1)
		if castName then
			Duration = UnitCastingDuration(arg1)
			uninterruptible = castNotInterruptible
			castBar = "Cast"
			tradeSkill = isTradeSkill
			interrupted = false
		end	
	elseif event == "UNIT_SPELLCAST_CHANNEL_START" and arg1 == "focus" then
		local chanName, chanText, chanTex, _, _, isTradeSkill, chanNotInterruptible, _, isEmpowered, numStages = UnitChannelInfo(arg1)
		if chanName then
			Duration = UnitChannelDuration(arg1)
			uninterruptible = chanNotInterruptible
			castBar = "Channel"
			tradeSkill = isTradeSkill
			interrupted = false
		end
	elseif event == "UNIT_SPELLCAST_EMPOWER_START" and arg1 == "focus" then
		local chanName, chanText, chanTex, _, _, isTradeSkill, chanNotInterruptible, _, isEmpowered, numStages = UnitChannelInfo(arg1)
		if chanName then
			Duration = UnitChannelDuration(arg1)
			uninterruptible = chanNotInterruptible
			castBar = "Empower"
			tradeSkill = isTradeSkill
			interrupted = false
		end
	elseif event == "UNIT_SPELLCAST_INTERRUPTED" and arg1 == "focus" then
		interrupted = true
	end
end
vcbZlave:HookScript("OnEvent", EventsTime)