-- =========================
-- some variables
-- =========================
local G = VDW.Local.Override
local UNIT = "target"
local Duration
local uninterruptible = false
local castBar = "Cast"
local tradeSkill = false
local interrupted = false
local interruptedBy
local jailerColor = CreateColorFromRGBAHexString("0A979CFF")
local vcbClassColorTarget
local _, castName, castText, castTexture, castIsTradeSkill, castNotInterruptible, chanName, chanText, chanTexture, chanIsTradeSkill, chanNotInterruptible, isEmpowered, numStages
local textName, textCurrent, textBoth, textTotal
local iconSpellLeft, iconSpellRight
local shieldSpellLeft, shieldSpellRight
local TextBorderTop, TextBorderBottom
-- =========================
-- extra textures
-- =========================
local function createTextures()
-- icon spell left
	iconSpellLeft = TargetFrameSpellBar:CreateTexture(nil, "ARTWORK", nil, 0)
-- icon spell right
	iconSpellRight = TargetFrameSpellBar:CreateTexture(nil, "ARTWORK", nil, 0)
-- shield icons
	local shieldX = TargetFrameSpellBar:GetHeight() * 2.5
	local shieldY = shieldX + 4
	local function Shields(var1)
		var1:SetAtlas("ui-castingbar-shield", false)
		var1:SetSize(shieldX, shieldY)
		var1:SetBlendMode("BLEND")
		var1:SetAlpha(0) -- 0.75
	end
-- shield icon left
	shieldSpellLeft = TargetFrameSpellBar:CreateTexture(nil, "BACKGROUND", nil, 0)
	Shields(shieldSpellLeft)
	shieldSpellLeft:SetPoint("RIGHT", TargetFrameSpellBar, "LEFT", 0, 0)
-- shield icon left
	shieldSpellRight = TargetFrameSpellBar:CreateTexture(nil, "BACKGROUND", nil, 0)
	Shields(shieldSpellRight)
	shieldSpellRight:SetPoint("LEFT", TargetFrameSpellBar, "RIGHT", 0, 0)
-- Text Borders
	local function Borders(var1)
		var1:SetAtlas("ui-castingbar-textbox", false)
		var1:SetAlpha(0.55)
	end
-- Text Border Top
	TextBorderTop = TargetFrameSpellBar:CreateTexture(nil, "BACKGROUND", nil, -7)
	Borders(TextBorderTop)
	TextBorderTop:SetPoint("TOPLEFT", TargetFrameSpellBar, "TOPLEFT", 0, 12)
	TextBorderTop:SetPoint("BOTTOMRIGHT", TargetFrameSpellBar, "BOTTOMRIGHT", 0, 4)
-- Text Border Bottom
	TextBorderBottom = TargetFrameSpellBar:CreateTexture(nil, "BACKGROUND", nil, -7)
	Borders(TextBorderBottom)
	TextBorderBottom:SetPoint("TOPLEFT", TargetFrameSpellBar, "TOPLEFT", 0, -4)
	TextBorderBottom:SetPoint("BOTTOMRIGHT", TargetFrameSpellBar, "BOTTOMRIGHT", 0, -12)
end
-- =========================
-- extra texts
-- =========================
-- function for the texts
local function createTexts()
	textName = TargetFrameSpellBar:CreateFontString(nil, "OVERLAY", nil)
	textCurrent = TargetFrameSpellBar:CreateFontString(nil, "OVERLAY", nil)
	textBoth = TargetFrameSpellBar:CreateFontString(nil, "OVERLAY", nil)
	textTotal = TargetFrameSpellBar:CreateFontString(nil, "OVERLAY", nil)
	local function Texts(var1)
		var1:SetFontObject("GameFontHighlightSmall")
		var1:Hide()
	end
	Texts(textName)
	Texts(textCurrent)
	Texts(textBoth)
	Texts(textTotal)
end
-- =========================
-- functions protect the options
-- =========================
local function ProtectOptions()
	local loc = GetLocale()
	if loc ~= VCBspecialSettings["LastLocation"] then
		for k, v in pairs(VDW.Local.Translate) do
			for i, s in pairs (v) do
				if VCBsettings.Target.Icon.Position == s then
					VCBsettings.Target.Icon.Position = VDW.Local.Translate[loc][i]
				end
				if VCBsettings.Target.Shield.Position == s then
					VCBsettings.Target.Shield.Position = VDW.Local.Translate[loc][i]
				end
				if VCBsettings.Target.TextBorder.Position == s then
					VCBsettings.Target.TextBorder.Position = VDW.Local.Translate[loc][i]
				end
				if VCBsettings.Target.NameText.Position == s then
					VCBsettings.Target.NameText.Position = VDW.Local.Translate[loc][i]
				end
				if VCBsettings.Target.CurrentTimeText.Position == s then
					VCBsettings.Target.CurrentTimeText.Position = VDW.Local.Translate[loc][i]
				end
				if VCBsettings.Target.BothTimeText.Position == s then
					VCBsettings.Target.BothTimeText.Position = VDW.Local.Translate[loc][i]
				end
				if VCBsettings.Target.TotalTimeText.Position == s then
					VCBsettings.Target.TotalTimeText.Position = VDW.Local.Translate[loc][i]
				end
				if VCBsettings.Target.CurrentTimeText.Direction == s then
					VCBsettings.Target.CurrentTimeText.Direction = VDW.Local.Translate[loc][i]
				end
				if VCBsettings.Target.BothTimeText.Direction == s then
					VCBsettings.Target.BothTimeText.Direction = VDW.Local.Translate[loc][i]
				end
				if VCBsettings.Target.CurrentTimeText.Sec == s then
					VCBsettings.Target.CurrentTimeText.Sec = VDW.Local.Translate[loc][i]
				end
				if VCBsettings.Target.BothTimeText.Sec == s then
					VCBsettings.Target.BothTimeText.Sec = VDW.Local.Translate[loc][i]
				end
				if VCBsettings.Target.TotalTimeText.Sec == s then
					VCBsettings.Target.TotalTimeText.Sec = VDW.Local.Translate[loc][i]
				end
				if VCBsettings.Target.StatusBar.Color == s then
					VCBsettings.Target.StatusBar.Color = VDW.Local.Translate[loc][i]
				end
				if VCBsettings.Target.StatusBar.Style == s then
					VCBsettings.Target.StatusBar.Style = VDW.Local.Translate[loc][i]
				end
				if VCBsettings.Target.Border.Color == s then
					VCBsettings.Target.Border.Color = VDW.Local.Translate[loc][i]
				end
				if VCBsettings.Target.Border.Style == s then
					VCBsettings.Target.Border.Style = VDW.Local.Translate[loc][i]
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
function VDW.VCB.chkTargetIconPosition()
	if VCBsettings.Target.Icon.Position == G.OPTIONS_V_HIDE then
		function iconPosition(self)
			if iconSpellLeft:IsShown() then iconSpellLeft:Hide() end
			if iconSpellRight:IsShown() then iconSpellRight:Hide() end
		end
	elseif VCBsettings.Target.Icon.Position == G.OPTIONS_P_LEFT then
		function iconPosition(self)
			iconSpellLeft:ClearAllPoints()
			iconSpellLeft:SetPoint("TOPLEFT", shieldSpellLeft, "TOPLEFT", 6, -6)
			iconSpellLeft:SetPoint("BOTTOMRIGHT", shieldSpellLeft, "BOTTOMRIGHT", -6, 10)
			iconSpellLeft:SetTexture(self.Icon:GetTextureFileID())
			if not iconSpellLeft:IsShown() then iconSpellLeft:Show() end
			if iconSpellRight:IsShown() then iconSpellRight:Hide() end
		end
	elseif VCBsettings.Target.Icon.Position == G.OPTIONS_P_RIGHT then
		function iconPosition(self)
			if iconSpellLeft:IsShown() then iconSpellLeft:Hide() end
			iconSpellRight:ClearAllPoints()
			iconSpellRight:SetPoint("TOPLEFT", shieldSpellRight, "TOPLEFT", 6, -6)
			iconSpellRight:SetPoint("BOTTOMRIGHT", shieldSpellRight, "BOTTOMRIGHT", -6, 10)
			iconSpellRight:SetTexture(self.Icon:GetTextureFileID())
			if not iconSpellRight:IsShown() then iconSpellRight:Show() end
		end
	elseif VCBsettings.Target.Icon.Position == G.OPTIONS_P_BOTH then
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
function VDW.VCB.chkTargetShieldPosition()
	if VCBsettings.Target.Shield.Position == G.OPTIONS_V_HIDE then
		function shieldPosition(uninterruptible)
			shieldSpellLeft:SetAlpha(0)
			shieldSpellRight:SetAlpha(0)
		end
	elseif VCBsettings.Target.Shield.Position == G.OPTIONS_P_LEFT then
		function shieldPosition(uninterruptible)
			shieldSpellLeft:SetAlphaFromBoolean(uninterruptible, 150, 0)
			shieldSpellRight:SetAlpha(0)
		end
	elseif VCBsettings.Target.Shield.Position == G.OPTIONS_P_RIGHT then
		function shieldPosition(uninterruptible)
			shieldSpellLeft:SetAlpha(0)
			shieldSpellRight:SetAlphaFromBoolean(uninterruptible, 150, 0)
		end
	elseif VCBsettings.Target.Shield.Position == G.OPTIONS_P_BOTH then
		function shieldPosition(uninterruptible)
			shieldSpellLeft:SetAlphaFromBoolean(uninterruptible, 150, 0)
			shieldSpellRight:SetAlphaFromBoolean(uninterruptible, 150, 0)
		end
	end
end
-- check text border
function VDW.VCB.chkTargetBorderTextPosition()
	if VCBsettings.Target.BorderText.Position == G.OPTIONS_V_HIDE then
		function bordertextPosition ()
			TextBorderTop:Hide()
			TextBorderBottom:Hide()
		end
	elseif VCBsettings.Target.BorderText.Position == G.OPTIONS_P_TOP then
		function bordertextPosition()
			TextBorderTop:Show()
			TextBorderBottom:Hide()
		end
	elseif VCBsettings.Target.BorderText.Position == G.OPTIONS_P_BOTTOM then
		function bordertextPosition()
			TextBorderTop:Hide()
			TextBorderBottom:Show()
		end
	elseif VCBsettings.Target.BorderText.Position == G.OPTIONS_P_BOTH then
		function bordertextPosition()
			TextBorderTop:Show()
			TextBorderBottom:Show()
		end
	end
end
-- check name text position
function VDW.VCB.chkNameTxtTarget()
	if VCBsettings.Target.NameText.Position == G.OPTIONS_V_HIDE then
		function namePosition(self)
			if textName:IsShown() then textName:Hide() end
		end
	elseif VCBsettings.Target.NameText.Position == G.OPTIONS_P_TOPLEFT then
		function namePosition(self)
			textName:ClearAllPoints()
			textName:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 4, 1)
			textName:SetJustifyH("LEFT")
			if not textName:IsShown() then textName:Show() end
		end
	elseif VCBsettings.Target.NameText.Position == G.OPTIONS_P_LEFT then
		function namePosition(self)
			textName:ClearAllPoints()
			textName:SetPoint("LEFT", self, "LEFT", 4, 0)
			textName:SetJustifyH("LEFT")
			if not textName:IsShown() then textName:Show() end
		end
	elseif VCBsettings.Target.NameText.Position == G.OPTIONS_P_BOTTOMLEFT then
		function namePosition(self)
			textName:ClearAllPoints()
			textName:SetPoint("TOPLEFT", self, "BOTTOMLEFT", 4, -1)
			textName:SetJustifyH("LEFT")
			if not textName:IsShown() then textName:Show() end
		end
	elseif VCBsettings.Target.NameText.Position == G.OPTIONS_P_TOP then
		function namePosition(self)
			textName:ClearAllPoints()
			textName:SetPoint("BOTTOM", self, "TOP", 0, 1)
			textName:SetJustifyH("CENTER")
			if not textName:IsShown() then textName:Show() end
		end
	elseif VCBsettings.Target.NameText.Position == G.OPTIONS_P_CENTER then
		function namePosition(self)
			textName:ClearAllPoints()
			textName:SetPoint("CENTER", self, "CENTER", 0, 0)
			textName:SetJustifyH("CENTER")
			if not textName:IsShown() then textName:Show() end
		end
	elseif VCBsettings.Target.NameText.Position == G.OPTIONS_P_BOTTOM then
		function namePosition(self)
			textName:ClearAllPoints()
			textName:SetPoint("TOP", self, "BOTTOM", 0, -1)
			textName:SetJustifyH("CENTER")
			if not textName:IsShown() then textName:Show() end
		end
	elseif VCBsettings.Target.NameText.Position == G.OPTIONS_P_TOPRIGHT then
		function namePosition(self)
			textName:ClearAllPoints()
			textName:SetPoint("BOTTOMRIGHT", self, "TOPRIGHT", -4, 1)
			textName:SetJustifyH("RIGHT")
			if not textName:IsShown() then textName:Show() end
		end
	elseif VCBsettings.Target.NameText.Position == G.OPTIONS_P_RIGHT then
		function namePosition(self)
			textName:ClearAllPoints()
			textName:SetPoint("RIGHT", self, "RIGHT", -4, 0)
			textName:SetJustifyH("RIGHT")
			if not textName:IsShown() then textName:Show() end
		end
	elseif VCBsettings.Target.NameText.Position == G.OPTIONS_P_BOTTOMRIGHT then
		function namePosition(self)
			textName:ClearAllPoints()
			textName:SetPoint("TOPRIGHT", self, "BOTTOMRIGHT", -4, -1)
			textName:SetJustifyH("RIGHT")
			if not textName:IsShown() then textName:Show() end
		end
	end
end
-- check current casting time text position
function VDW.VCB.chkCurrentTxtTarget()
	if VCBsettings.Target.CurrentTimeText.Position == G.OPTIONS_V_HIDE then
		function currentPostion(self)
			if textCurrent:IsShown() then textCurrent:Hide() end
		end
	elseif VCBsettings.Target.CurrentTimeText.Position == G.OPTIONS_P_TOPLEFT then
		function currentPostion(self)
			textCurrent:ClearAllPoints()
			textCurrent:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 4, 1)
			if not textCurrent:IsShown() then textCurrent:Show() end
		end
	elseif VCBsettings.Target.CurrentTimeText.Position == G.OPTIONS_P_LEFT then
		function currentPostion(self)
			textCurrent:ClearAllPoints()
			textCurrent:SetPoint("LEFT", self, "LEFT", 4, 0)
			if not textCurrent:IsShown() then textCurrent:Show() end
		end
	elseif VCBsettings.Target.CurrentTimeText.Position == G.OPTIONS_P_BOTTOMLEFT then
		function currentPostion(self)
			textCurrent:ClearAllPoints()
			textCurrent:SetPoint("TOPLEFT", self, "BOTTOMLEFT", 4, -1)
			if not textCurrent:IsShown() then textCurrent:Show() end
		end
	elseif VCBsettings.Target.CurrentTimeText.Position == G.OPTIONS_P_TOP then
		function currentPostion(self)
			textCurrent:ClearAllPoints()
			textCurrent:SetPoint("BOTTOM", self, "TOP", 0, 1)
			if not textCurrent:IsShown() then textCurrent:Show() end
		end
	elseif VCBsettings.Target.CurrentTimeText.Position == G.OPTIONS_P_CENTER then
		function currentPostion(self)
			textCurrent:ClearAllPoints()
			textCurrent:SetPoint("CENTER", self, "CENTER", 0, 0)
			if not textCurrent:IsShown() then textCurrent:Show() end
		end
	elseif VCBsettings.Target.CurrentTimeText.Position == G.OPTIONS_P_BOTTOM then
		function currentPostion(self)
			textCurrent:ClearAllPoints()
			textCurrent:SetPoint("TOP", self, "BOTTOM", 0, -1)
			if not textCurrent:IsShown() then textCurrent:Show() end
		end
	elseif VCBsettings.Target.CurrentTimeText.Position == G.OPTIONS_P_TOPRIGHT then
		function currentPostion(self)
			textCurrent:ClearAllPoints()
			textCurrent:SetPoint("BOTTOMRIGHT", self, "TOPRIGHT", -4, 1)
			if not textCurrent:IsShown() then textCurrent:Show() end
		end
	elseif VCBsettings.Target.CurrentTimeText.Position == G.OPTIONS_P_RIGHT then
		function currentPostion(self)
			textCurrent:ClearAllPoints()
			textCurrent:SetPoint("RIGHT", self, "RIGHT", -4, 0)
			if not textCurrent:IsShown() then textCurrent:Show() end
		end
	elseif VCBsettings.Target.CurrentTimeText.Position == G.OPTIONS_P_BOTTOMRIGHT then
		function currentPostion(self)
			textCurrent:ClearAllPoints()
			textCurrent:SetPoint("TOPRIGHT", self, "BOTTOMRIGHT", -4, -1)
			if not textCurrent:IsShown() then textCurrent:Show() end
		end
	end
end
-- check both casting time text position
function VDW.VCB.chkBothTxtTarget()
	if VCBsettings.Target.BothTimeText.Position == G.OPTIONS_V_HIDE then
		function bothPostion(self)
			if textBoth:IsShown() then textBoth:Hide() end
		end
	elseif VCBsettings.Target.BothTimeText.Position == G.OPTIONS_P_TOPLEFT then
		function bothPostion(self)
			textBoth:ClearAllPoints()
			textBoth:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 4, 1)
			if not textBoth:IsShown() then textBoth:Show() end
		end
	elseif VCBsettings.Target.BothTimeText.Position == G.OPTIONS_P_LEFT then
		function bothPostion(self)
			textBoth:ClearAllPoints()
			textBoth:SetPoint("LEFT", self, "LEFT", 4, 0)
			if not textBoth:IsShown() then textBoth:Show() end
		end
	elseif VCBsettings.Target.BothTimeText.Position == G.OPTIONS_P_BOTTOMLEFT then
		function bothPostion(self)
			textBoth:ClearAllPoints()
			textBoth:SetPoint("TOPLEFT", self, "BOTTOMLEFT", 4, -1)
			if not textBoth:IsShown() then textBoth:Show() end
		end
	elseif VCBsettings.Target.BothTimeText.Position == G.OPTIONS_P_TOP then
		function bothPostion(self)
			textBoth:ClearAllPoints()
			textBoth:SetPoint("BOTTOM", self, "TOP", 0, 1)
			if not textBoth:IsShown() then textBoth:Show() end
		end
	elseif VCBsettings.Target.BothTimeText.Position == G.OPTIONS_P_CENTER then
		function bothPostion(self)
			textBoth:ClearAllPoints()
			textBoth:SetPoint("CENTER", self, "CENTER", 0, 0)
			if not textBoth:IsShown() then textBoth:Show() end
		end
	elseif VCBsettings.Target.BothTimeText.Position == G.OPTIONS_P_BOTTOM then
		function bothPostion(self)
			textBoth:ClearAllPoints()
			textBoth:SetPoint("TOP", self, "BOTTOM", 0, -1)
			if not textBoth:IsShown() then textBoth:Show() end
		end
	elseif VCBsettings.Target.BothTimeText.Position == G.OPTIONS_P_TOPRIGHT then
		function bothPostion(self)
			textBoth:ClearAllPoints()
			textBoth:SetPoint("BOTTOMRIGHT", self, "TOPRIGHT", -4, 1)
			if not textBoth:IsShown() then textBoth:Show() end
		end
	elseif VCBsettings.Target.BothTimeText.Position == G.OPTIONS_P_RIGHT then
		function bothPostion(self)
			textBoth:ClearAllPoints()
			textBoth:SetPoint("RIGHT", self, "RIGHT", -4, 0)
			if not textBoth:IsShown() then textBoth:Show() end
		end
	elseif VCBsettings.Target.BothTimeText.Position == G.OPTIONS_P_BOTTOMRIGHT then
		function bothPostion(self)
			textBoth:ClearAllPoints()
			textBoth:SetPoint("TOPRIGHT", self, "BOTTOMRIGHT", -4, -1)
			if not textBoth:IsShown() then textBoth:Show() end
		end
	end
end
-- check total casting time text position
function VDW.VCB.chkTotalTxtTarget()
	if VCBsettings.Target.TotalTimeText.Position == G.OPTIONS_V_HIDE then
		function totalPostion(self)
			if textTotal:IsShown() then textTotal:Hide() end
		end
	elseif VCBsettings.Target.TotalTimeText.Position == G.OPTIONS_P_TOPLEFT then
		function totalPostion(self)
			textTotal:ClearAllPoints()
			textTotal:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 4, 1)
			if not textTotal:IsShown() then textTotal:Show() end
		end
	elseif VCBsettings.Target.TotalTimeText.Position == G.OPTIONS_P_LEFT then
		function totalPostion(self)
			textTotal:ClearAllPoints()
			textTotal:SetPoint("LEFT", self, "LEFT", 4, 0)
			if not textTotal:IsShown() then textTotal:Show() end
		end
	elseif VCBsettings.Target.TotalTimeText.Position == G.OPTIONS_P_BOTTOMLEFT then
		function totalPostion(self)
			textTotal:ClearAllPoints()
			textTotal:SetPoint("TOPLEFT", self, "BOTTOMLEFT", 4, -1)
			if not textTotal:IsShown() then textTotal:Show() end
		end
	elseif VCBsettings.Target.TotalTimeText.Position == G.OPTIONS_P_TOP then
		function totalPostion(self)
			textTotal:ClearAllPoints()
			textTotal:SetPoint("BOTTOM", self, "TOP", 0, 1)
			if not textTotal:IsShown() then textTotal:Show() end
		end
	elseif VCBsettings.Target.TotalTimeText.Position == G.OPTIONS_P_CENTER then
		function totalPostion(self)
			textTotal:ClearAllPoints()
			textTotal:SetPoint("CENTER", self, "CENTER", 0, 0)
			if not textTotal:IsShown() then textTotal:Show() end
		end
	elseif VCBsettings.Target.TotalTimeText.Position == G.OPTIONS_P_BOTTOM then
		function totalPostion(self)
			textTotal:ClearAllPoints()
			textTotal:SetPoint("TOP", self, "BOTTOM", 0, -1)
			if not textTotal:IsShown() then textTotal:Show() end
		end
	elseif VCBsettings.Target.TotalTimeText.Position == G.OPTIONS_P_TOPRIGHT then
		function totalPostion(self)
			textTotal:ClearAllPoints()
			textTotal:SetPoint("BOTTOMRIGHT", self, "TOPRIGHT", -4, 1)
			if not textTotal:IsShown() then textTotal:Show() end
		end
	elseif VCBsettings.Target.TotalTimeText.Position == G.OPTIONS_P_RIGHT then
		function totalPostion(self)
			textTotal:ClearAllPoints()
			textTotal:SetPoint("RIGHT", self, "RIGHT", -4, 0)
			if not textTotal:IsShown() then textTotal:Show() end
		end
	elseif VCBsettings.Target.TotalTimeText.Position == G.OPTIONS_P_BOTTOMRIGHT then
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
function VDW.VCB.chkCurrentUpdTarget()
	if VCBsettings.Target.CurrentTimeText.Position ~= G.OPTIONS_V_HIDE then
		if VCBsettings.Target.CurrentTimeText.Sec == G.OPTIONS_V_HIDE then
			if VCBsettings.Target.CurrentTimeText.Decimals == "0" then
				if VCBsettings.Target.CurrentTimeText.Direction == G.OPTIONS_D_ASCENDING then
					function currentUpdate(self)
						textCurrent:SetText(string.format("%.0f", Duration:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Target.CurrentTimeText.Direction == G.OPTIONS_D_DESCENDING then
					function currentUpdate(self)
						textCurrent:SetText(string.format("%.0f", Duration:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Target.CurrentTimeText.Direction == G.OPTIONS_P_BOTH then
					function currentUpdate(self)
						if castBar == "Cast" or castBar == "Empower" then
							textCurrent:SetText(string.format("%.0f", Duration:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
						elseif castBar == "Channel" then
							textCurrent:SetText(string.format("%.0f", Duration:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			elseif VCBsettings.Target.CurrentTimeText.Decimals == "1" then
				if VCBsettings.Target.CurrentTimeText.Direction == G.OPTIONS_D_ASCENDING then
					function currentUpdate(self)
						textCurrent:SetText(string.format("%.1f", Duration:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Target.CurrentTimeText.Direction == G.OPTIONS_D_DESCENDING then
					function currentUpdate(self)
						textCurrent:SetText(string.format("%.1f", Duration:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Target.CurrentTimeText.Direction == G.OPTIONS_P_BOTH then
					function currentUpdate(self)
						if castBar == "Cast" or castBar == "Empower" then
							textCurrent:SetText(string.format("%.1f", Duration:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
						elseif castBar == "Channel" then
							textCurrent:SetText(string.format("%.1f", Duration:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			elseif VCBsettings.Target.CurrentTimeText.Decimals == "2" then
				if VCBsettings.Target.CurrentTimeText.Direction == G.OPTIONS_D_ASCENDING then
					function currentUpdate(self)
						textCurrent:SetText(string.format("%.2f", Duration:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Target.CurrentTimeText.Direction == G.OPTIONS_D_DESCENDING then
					function currentUpdate(self)
						textCurrent:SetText(string.format("%.2f", Duration:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Target.CurrentTimeText.Direction == G.OPTIONS_P_BOTH then
					function currentUpdate(self)
						if castBar == "Cast" or castBar == "Empower" then
							textCurrent:SetText(string.format("%.2f", Duration:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
						elseif castBar == "Channel" then
							textCurrent:SetText(string.format("%.2f", Duration:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			elseif VCBsettings.Target.CurrentTimeText.Decimals == "3" then
				if VCBsettings.Target.CurrentTimeText.Direction == G.OPTIONS_D_ASCENDING then
					function currentUpdate(self)
						textCurrent:SetText(string.format("%.3f", Duration:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Target.CurrentTimeText.Direction == G.OPTIONS_D_DESCENDING then
					function currentUpdate(self)
						textCurrent:SetText(string.format("%.3f", Duration:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Target.CurrentTimeText.Direction == G.OPTIONS_P_BOTH then
					function currentUpdate(self)
						if castBar == "Cast" or castBar == "Empower" then
							textCurrent:SetText(string.format("%.3f", Duration:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
						elseif castBar == "Channel" then
							textCurrent:SetText(string.format("%.3f", Duration:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			end
		elseif VCBsettings.Target.CurrentTimeText.Sec == G.OPTIONS_V_SHOW then
			if VCBsettings.Target.CurrentTimeText.Decimals == "0" then
				if VCBsettings.Target.CurrentTimeText.Direction == G.OPTIONS_D_ASCENDING then
					function currentUpdate(self)
						textCurrent:SetText(string.format("%.0f Sec", Duration:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Target.CurrentTimeText.Direction == G.OPTIONS_D_DESCENDING then
					function currentUpdate(self)
						textCurrent:SetText(string.format("%.0f Sec", Duration:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Target.CurrentTimeText.Direction == G.OPTIONS_P_BOTH then
					function currentUpdate(self)
						if castBar == "Cast" or castBar == "Empower" then
							textCurrent:SetText(string.format("%.0f Sec", Duration:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
						elseif castBar == "Channel" then
							textCurrent:SetText(string.format("%.0f Sec", Duration:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			elseif VCBsettings.Target.CurrentTimeText.Decimals == "1" then
				if VCBsettings.Target.CurrentTimeText.Direction == G.OPTIONS_D_ASCENDING then
					function currentUpdate(self)
						textCurrent:SetText(string.format("%.1f Sec", Duration:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Target.CurrentTimeText.Direction == G.OPTIONS_D_DESCENDING then
					function currentUpdate(self)
						textCurrent:SetText(string.format("%.1f Sec", Duration:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Target.CurrentTimeText.Direction == G.OPTIONS_P_BOTH then
					function currentUpdate(self)
						if castBar == "Cast" or castBar == "Empower" then
							textCurrent:SetText(string.format("%.1f Sec", Duration:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
						elseif castBar == "Channel" then
							textCurrent:SetText(string.format("%.1f Sec", Duration:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			elseif VCBsettings.Target.CurrentTimeText.Decimals == "2" then
				if VCBsettings.Target.CurrentTimeText.Direction == G.OPTIONS_D_ASCENDING then
					function currentUpdate(self)
						textCurrent:SetText(string.format("%.2f Sec", Duration:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Target.CurrentTimeText.Direction == G.OPTIONS_D_DESCENDING then
					function currentUpdate(self)
						textCurrent:SetText(string.format("%.2f Sec", Duration:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Target.CurrentTimeText.Direction == G.OPTIONS_P_BOTH then
					function currentUpdate(self)
						if castBar == "Cast" or castBar == "Empower" then
							textCurrent:SetText(string.format("%.2f Sec", Duration:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
						elseif castBar == "Channel" then
							textCurrent:SetText(string.format("%.2f Sec", Duration:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			elseif VCBsettings.Target.CurrentTimeText.Decimals == "3" then
				if VCBsettings.Target.CurrentTimeText.Direction == G.OPTIONS_D_ASCENDING then
					function currentUpdate(self)
						textCurrent:SetText(string.format("%.3f Sec", Duration:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Target.CurrentTimeText.Direction == G.OPTIONS_D_DESCENDING then
					function currentUpdate(self)
						textCurrent:SetText(string.format("%.3f Sec", Duration:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Target.CurrentTimeText.Direction == G.OPTIONS_P_BOTH then
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
	elseif VCBsettings.Target.CurrentTimeText.Position == G.OPTIONS_V_HIDE then
		function currentUpdate(self)
			return
		end
	end
end
-- check both casting time update
function VDW.VCB.chkBothUpdTarget()
	if VCBsettings.Target.BothTimeText.Position ~= G.OPTIONS_V_HIDE then
		if VCBsettings.Target.BothTimeText.Sec == G.OPTIONS_V_HIDE then
			if VCBsettings.Target.BothTimeText.Decimals == "0" then
				if VCBsettings.Target.BothTimeText.Direction == G.OPTIONS_D_ASCENDING then
					function bothUpdate(self)
						textBoth:SetText(string.format("%.0f / %.0f", Duration:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Target.BothTimeText.Direction == G.OPTIONS_D_DESCENDING then
					function bothUpdate(self)
						textBoth:SetText(string.format("%.0f / %.0f", Duration:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Target.BothTimeText.Direction == G.OPTIONS_P_BOTH then
					function bothUpdate(self)
						if castBar == "Cast" or castBar == "Empower" then
							textBoth:SetText(string.format("%.0f / %.0f", Duration:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						elseif castBar == "Channel" then
							textBoth:SetText(string.format("%.0f / %.0f", Duration:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			elseif VCBsettings.Target.BothTimeText.Decimals == "1" then
				if VCBsettings.Target.BothTimeText.Direction == G.OPTIONS_D_ASCENDING then
					function bothUpdate(self)
						textBoth:SetText(string.format("%.1f / %.1f", Duration:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Target.BothTimeText.Direction == G.OPTIONS_D_DESCENDING then
					function bothUpdate(self)
						textBoth:SetText(string.format("%.1f / %.1f", Duration:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Target.BothTimeText.Direction == G.OPTIONS_P_BOTH then
					function bothUpdate(self)
						if castBar == "Cast" or castBar == "Empower" then
							textBoth:SetText(string.format("%.1f / %.1f", Duration:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						elseif castBar == "Channel" then
							textBoth:SetText(string.format("%.1f / %.1f", Duration:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			elseif VCBsettings.Target.BothTimeText.Decimals == "2" then
				if VCBsettings.Target.BothTimeText.Direction == G.OPTIONS_D_ASCENDING then
					function bothUpdate(self)
						textBoth:SetText(string.format("%.2f / %.2f", Duration:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Target.BothTimeText.Direction == G.OPTIONS_D_DESCENDING then
					function bothUpdate(self)
						textBoth:SetText(string.format("%.2f / %.2f", Duration:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Target.BothTimeText.Direction == G.OPTIONS_P_BOTH then
					function bothUpdate(self)
						if castBar == "Cast" or castBar == "Empower" then
							textBoth:SetText(string.format("%.2f / %.2f", Duration:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						elseif castBar == "Channel" then
							textBoth:SetText(string.format("%.2f / %.2f", Duration:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			elseif VCBsettings.Target.BothTimeText.Decimals == "3" then
				if VCBsettings.Target.BothTimeText.Direction == G.OPTIONS_D_ASCENDING then
					function bothUpdate(self)
						textBoth:SetText(string.format("%.3f / %.3f", Duration:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Target.BothTimeText.Direction == G.OPTIONS_D_DESCENDING then
					function bothUpdate(self)
						textBoth:SetText(string.format("%.3f / %.3f", Duration:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Target.BothTimeText.Direction == G.OPTIONS_P_BOTH then
					function bothUpdate(self)
						if castBar == "Cast" or castBar == "Empower" then
							textBoth:SetText(string.format("%.3f", Duration:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						elseif castBar == "Channel" then
							textBoth:SetText(string.format("%.3f / %.3f", Duration:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			end
		elseif VCBsettings.Target.BothTimeText.Sec == G.OPTIONS_V_SHOW then
			if VCBsettings.Target.BothTimeText.Decimals == "0" then
				if VCBsettings.Target.BothTimeText.Direction == G.OPTIONS_D_ASCENDING then
					function bothUpdate(self)
						textBoth:SetText(string.format("%.0f / %.0f Sec", Duration:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Target.BothTimeText.Direction == G.OPTIONS_D_DESCENDING then
					function bothUpdate(self)
						textBoth:SetText(string.format("%.0f / %.0f Sec", Duration:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Target.BothTimeText.Direction == G.OPTIONS_P_BOTH then
					function bothUpdate(self)
						if castBar == "Cast" or castBar == "Empower" then
							textBoth:SetText(string.format("%.0f / %.0f Sec", Duration:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						elseif castBar == "Channel" then
							textBoth:SetText(string.format("%.0f / %.0f Sec", Duration:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			elseif VCBsettings.Target.BothTimeText.Decimals == "1" then
				if VCBsettings.Target.BothTimeText.Direction == G.OPTIONS_D_ASCENDING then
					function bothUpdate(self)
						textBoth:SetText(string.format("%.1f / %.1f Sec", Duration:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Target.BothTimeText.Direction == G.OPTIONS_D_DESCENDING then
					function bothUpdate(self)
						textBoth:SetText(string.format("%.1f / %.1f Sec", Duration:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Target.BothTimeText.Direction == G.OPTIONS_P_BOTH then
					function bothUpdate(self)
						if castBar == "Cast" or castBar == "Empower" then
							textBoth:SetText(string.format("%.1f / %.1f Sec", Duration:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						elseif castBar == "Channel" then
							textBoth:SetText(string.format("%.1f / %.1f Sec", Duration:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			elseif VCBsettings.Target.BothTimeText.Decimals == "2" then
				if VCBsettings.Target.BothTimeText.Direction == G.OPTIONS_D_ASCENDING then
					function bothUpdate(self)
						textBoth:SetText(string.format("%.2f / %.2f Sec", Duration:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Target.BothTimeText.Direction == G.OPTIONS_D_DESCENDING then
					function bothUpdate(self)
						textBoth:SetText(string.format("%.2f / %.2f Sec", Duration:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Target.BothTimeText.Direction == G.OPTIONS_P_BOTH then
					function bothUpdate(self)
						if castBar == "Cast" or castBar == "Empower" then
							textBoth:SetText(string.format("%.2f / %.2f Sec", Duration:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						elseif castBar == "Channel" then
							textBoth:SetText(string.format("%.2f / %.2f Sec", Duration:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			elseif VCBsettings.Target.BothTimeText.Decimals == "3" then
				if VCBsettings.Target.BothTimeText.Direction == G.OPTIONS_D_ASCENDING then
					function bothUpdate(self)
						textBoth:SetText(string.format("%.3f / %.3f Sec", Duration:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Target.BothTimeText.Direction == G.OPTIONS_D_DESCENDING then
					function bothUpdate(self)
						textBoth:SetText(string.format("%.3f / %.3f Sec", Duration:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Target.BothTimeText.Direction == G.OPTIONS_P_BOTH then
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
	elseif VCBsettings.Target.BothTimeText.Position == G.OPTIONS_V_HIDE then
		function bothUpdate(self)
			return
		end
	end
end
-- check total casting time update
function VDW.VCB.chkTotalUpdTarget()
	if VCBsettings.Target.TotalTimeText.Position ~= G.OPTIONS_V_HIDE then
		if VCBsettings.Target.TotalTimeText.Sec == G.OPTIONS_V_HIDE then
			if VCBsettings.Target.TotalTimeText.Decimals == "0" then
				function totalUpdate(self)
					textTotal:SetFormattedText("%.0f", Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime))
				end
			elseif VCBsettings.Target.TotalTimeText.Decimals == "1" then
				function totalUpdate(self)
					textTotal:SetFormattedText("%.1f", Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime))
				end
			elseif VCBsettings.Target.TotalTimeText.Decimals == "2" then
				function totalUpdate(self)
					textTotal:SetFormattedText("%.2f", Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime))
				end
			elseif VCBsettings.Target.TotalTimeText.Decimals == "3" then
				function totalUpdate(self)
					textTotal:SetFormattedText("%.3f", Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime))
				end
			end
		elseif VCBsettings.Target.TotalTimeText.Sec == G.OPTIONS_V_SHOW then
			if VCBsettings.Target.TotalTimeText.Decimals == "0" then
				function totalUpdate(self)
					textTotal:SetFormattedText("%.0f sec", Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime))
				end
			elseif VCBsettings.Target.TotalTimeText.Decimals == "1" then
				function totalUpdate(self)
					textTotal:SetFormattedText("%.1f sec", Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime))
				end
			elseif VCBsettings.Target.TotalTimeText.Decimals == "2" then
				function totalUpdate(self)
					textTotal:SetFormattedText("%.2f sec", Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime))
				end
			elseif VCBsettings.Target.TotalTimeText.Decimals == "3" then
				function totalUpdate(self)
					textTotal:SetFormattedText("%.3f sec", Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime))
				end
			end
		end
	elseif VCBsettings.Target.TotalTimeText.Position == G.OPTIONS_V_HIDE then
		function totalUpdate(self)
			return
		end
	end
end
-- =========================
-- checking color & style functions
-- =========================
-- check status bar color
function VDW.VCB.chkStatusColorTarget()
	if VCBsettings.Target.StatusBar.Color == G.OPTIONS_C_DEFAULT then
		function statusbarColor(self)
			self:SetStatusBarDesaturated(false)
			self:SetStatusBarColor(1, 1, 1, 1)
			if VCBsettings.Target.StatusBar.Style == "Jailer" then
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
	elseif VCBsettings.Target.StatusBar.Color == G.OPTIONS_C_CLASS then
		function statusbarColor(self)
			self:SetStatusBarDesaturated(true)
			self:SetStatusBarColor(vcbClassColorTarget:GetRGB())
			self.Spark:SetDesaturated(true)
			self.Spark:SetVertexColor(vcbClassColorTarget:GetRGB())
			self.Flash:SetDesaturated(true)
			self.Flash:SetVertexColor(vcbClassColorTarget:GetRGB())
		end
	end
end
-- check border bar color
function VDW.VCB.chkBorderColorTarget()
	if VCBsettings.Target.Border.Color == G.OPTIONS_C_DEFAULT then
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
	elseif VCBsettings.Target.Border.Color == G.OPTIONS_C_CLASS then
		function borderColor(self)
			self.Background:SetDesaturated(true)
			self.Border:SetDesaturated(true)
			TextBorderTop:SetDesaturated(true)
			TextBorderBottom:SetDesaturated(true)
			self.Background:SetVertexColor(vcbClassColorTarget:GetRGB())
			self.Border:SetVertexColor(vcbClassColorTarget:GetRGB())
			TextBorderTop:SetVertexColor(vcbClassColorTarget:GetRGB())
			TextBorderBottom:SetVertexColor(vcbClassColorTarget:GetRGB())
		end
	end
end
-- call back the defaul color of status bar
local function defaultColor(self)
	self:SetStatusBarDesaturated(false)
	self:SetStatusBarColor(1, 1, 1, 1)
	if VCBsettings.Target.StatusBar.Style == "Jailer" then
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
function VDW.VCB.chkStatusStyleTarget()
	if VCBsettings.Target.StatusBar.Style == G.OPTIONS_C_DEFAULT then
		function statusbarStyle(self)
			return
		end
	elseif VCBsettings.Target.StatusBar.Style == "Jailer" then
		function statusbarStyle(self)
			self:SetStatusBarTexture("jailerstower-scorebar-fill-onfire")
		end
	end
end
-- check border bar style
function VDW.VCB.chkBorderStyleTarget()
	if VCBsettings.Target.Border.Style == G.OPTIONS_C_DEFAULT then
		function borderStyle(self)
			return
		end
	elseif VCBsettings.Target.Border.Style == "Jailer" then
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
local function positionBar(self)
	self:SetScale(VCBsettings.Target.Scale/100)
	self:ClearAllPoints()
	self:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", VCBsettings.Target.Position.X, VCBsettings.Target.Position.Y)
end
-- =========================
-- Events Time
-- =========================
local function EventsTime(self, event, arg1, arg2, arg3, arg4)
	if event == "PLAYER_LOGIN" then
		ProtectOptions()
		createTextures()
		createTexts()
		VDW.VCB.chkTargetIconPosition()
		VDW.VCB.chkTargetShieldPosition()
		VDW.VCB.chkTargetBorderTextPosition()
		VDW.VCB.chkNameTxtTarget()
		VDW.VCB.chkCurrentTxtTarget()
		VDW.VCB.chkBothTxtTarget()
		VDW.VCB.chkTotalTxtTarget()
		VDW.VCB.chkCurrentUpdTarget()
		VDW.VCB.chkBothUpdTarget()
		VDW.VCB.chkTotalUpdTarget()
		VDW.VCB.chkStatusColorTarget()
		VDW.VCB.chkBorderColorTarget()
		VDW.VCB.chkStatusStyleTarget()
		VDW.VCB.chkBorderStyleTarget()
-- hook part 1 --
			TargetFrameSpellBar:HookScript("OnShow", function(self)
				textName:SetWidth(self:GetWidth() - 8)
				namePosition(self)
				currentPostion(self)
				bothPostion(self)
				totalPostion(self)
				borderStyle(self)
			end)
-- hook part 2 --
		if VCBsettings.Target.Lock == G.OPTIONS_LS_UNLOCKED then
			TargetFrameSpellBar:HookScript("OnUpdate", function(self)
				positionBar(self)
			end)
		end
		TargetFrameSpellBar:HookScript("OnUpdate", function(self)
			self.TextBorder:SetAlpha(0)
			self.Text:SetAlpha(0)
			self.BorderShield:SetAlpha(0)
			self.Icon:SetAlpha(0)
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
				if tradeSkill then defaultColor(self) else statusbarColor(self) end
				statusbarStyle(self)
				borderColor(self)
			end
		end)
	elseif event == "PLAYER_TARGET_CHANGED" then
		if TargetFrame:IsShown() then
			castName, castText, castTexture, _, _, castIsTradeSkill, _, castNotInterruptible = UnitCastingInfo(UNIT)
			chanName, chanText, chanTexture, _, _, chanIsTradeSkill, chanNotInterruptible, _, isEmpowered, numStages = UnitChannelInfo(UNIT)
			if castName then
				Duration = UnitCastingDuration(UNIT)
				uninterruptible = castNotInterruptible
				castBar = "Cast"
				tradeSkill = castIsTradeSkill
			elseif chanName and numStages == 0 then
				Duration = UnitChannelDuration(UNIT)
				uninterruptible = chanNotInterruptible
				castBar = "Channel"
				tradeSkill = chanIsTradeSkill
			elseif chanName and numStages > 0 then
				Duration = UnitEmpoweredChannelDuration(UNIT, true)
				uninterruptible = chanNotInterruptible
				castBar = "Empower"
				tradeSkill = chanIsTradeSkill
			end
			local classFilename = UnitClassBase(UNIT)
			if classFilename ~= nil then vcbClassColorTarget = C_ClassColor.GetClassColor(classFilename) end
		end
	elseif event == "UNIT_SPELLCAST_START" and arg1 == UNIT then
		castName, castText, castTexture, _, _, castIsTradeSkill, _, castNotInterruptible = UnitCastingInfo(arg1)
		if castName then
			Duration = UnitCastingDuration(arg1)
			uninterruptible = castNotInterruptible
			castBar = "Cast"
			tradeSkill = castIsTradeSkill
			interrupted = false
		end	
	elseif event == "UNIT_SPELLCAST_CHANNEL_START" and arg1 == UNIT then
		chanName, chanText, chanTexture, _, _, chanIsTradeSkill, chanNotInterruptible, _, isEmpowered, numStages = UnitChannelInfo(arg1)
		if chanName then
			Duration = UnitChannelDuration(arg1)
			uninterruptible = chanNotInterruptible
			castBar = "Channel"
			tradeSkill = chanIsTradeSkill
			interrupted = false
		end
	elseif event == "UNIT_SPELLCAST_EMPOWER_START" and arg1 == UNIT then
		chanName, chanText, chanTexture, _, _, chanIsTradeSkill, chanNotInterruptible, _, isEmpowered, numStages = UnitChannelInfo(arg1)
		if chanName then
			Duration = UnitEmpoweredChannelDuration(UNIT, true)
			uninterruptible = chanNotInterruptible
			castBar = "Empower"
			tradeSkill = chanIsTradeSkill
			interrupted = false
		end
	elseif event == "UNIT_SPELLCAST_INTERRUPTED" and arg1 == UNIT then
		interrupted = true
	end
end
vcbZlave:HookScript("OnEvent", EventsTime)