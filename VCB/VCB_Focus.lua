-- =========================
-- some variables
-- =========================
local G = VDW.Local.Override
local UNIT = "focus"
local Duration
local uninterruptible = false
local castBar = "Cast"
local tradeSkill = false
local interrupted = false
local failed = false
local interruptedBy
local jailerColor = CreateColorFromRGBAHexString("0A979CFF")
local vcbClassColorFocus
local _, castName, castText, castTexture, castIsTradeSkill, castNotInterruptible, chanName, chanText, chanTexture, chanIsTradeSkill, chanNotInterruptible, isEmpowered, numStages, castSpellID, chanSpellID
local textName, textCurrent, textBoth, textTotal
local iconSpellLeft, iconSpellRight
local shieldSpellLeft, shieldSpellRight
local TextBorderTop, TextBorderBottom
-- =========================
-- create the bar
-- =========================
local function createBar()
	local castingbar = CreateFrame("StatusBar", "vcbFocusCastbar", UIParent, "vcbCastbarTemplate")
	vcbFocusCastbar:SetStatusBarTexture("ui-castingbar-filling-standard")
	vcbFocusCastbar:Hide()
	vcbFocusCastbar.StagePips = {}
	vcbFocusCastbar.Uninterruptable:ClearAllPoints()
	vcbFocusCastbar.Uninterruptable:SetPoint("TOPLEFT", vcbFocusCastbar:GetStatusBarTexture(), "TOPLEFT")
	vcbFocusCastbar.Uninterruptable:SetPoint("BOTTOMRIGHT", vcbFocusCastbar:GetStatusBarTexture(), "BOTTOMRIGHT")
	vcbFocusCastbar.FadeOutAnim:SetScript("OnFinished", function(self)
		self:GetParent():Hide()
	end)
	vcbFocusCastbar.HoldFadeOutAnim:SetScript("OnFinished", function(self)
		self:GetParent():Hide()
	end)
end
-- Acquire stage pips
local function AcquirePip(i)
	if vcbFocusCastbar.StagePips[i] then return vcbFocusCastbar.StagePips[i] end
	local pip = CreateFrame("Frame", nil, vcbFocusCastbar, "vcbCastbarPipTemplate")
	pip.BasePip:SetWidth(9)
	pip.BasePip:SetHeight(vcbFocusCastbar:GetHeight())
	vcbFocusCastbar.StagePips[i] = pip
	return pip
end
-- Hide stage pips
local function HidePips()
	for i = 1, #vcbFocusCastbar.StagePips do
		vcbFocusCastbar.StagePips[i]:Hide()
	end
end
-- Place stage pips
local function LayoutEmpowerPips(includeHoldAtMaxTime)
	HidePips()
	local pcts = UnitEmpoweredStagePercentages(UNIT, includeHoldAtMaxTime ~= false)
	if not pcts or #pcts == 0 then return end

	local w = vcbFocusCastbar:GetWidth()
	local x = 0

	for i = 1, #pcts - 1 do
		x = x + (pcts[i] * w)
		local pip = AcquirePip(i)
		pip:ClearAllPoints()
		pip:SetPoint("CENTER", vcbFocusCastbar, "LEFT", x, 0)
		pip:Show()
	end
end
-- SetTimerDurationSafe
local function SetTimerDurationSafe(statusBar, durationObj, timerDirection, interpolation)
	if not durationObj then return false end
	timerDirection = timerDirection or Enum.StatusBarTimerDirection.ElapsedTime
	interpolation  = interpolation  or Enum.StatusBarInterpolation.Immediate
-- Correct / documented order: (duration, direction, interpolation)
	if pcall(statusBar.SetTimerDuration, statusBar, durationObj, timerDirection, interpolation) then
		return true
	end
-- Tolerate swapped order (in case you accidentally pass it)
	if pcall(statusBar.SetTimerDuration, statusBar, durationObj, interpolation, timerDirection) then
		return true
	end
-- Fallback
	if pcall(statusBar.SetTimerDuration, statusBar, durationObj) then
		return true
	end

	return false
end
-- Casting bar
local function barIsCasting(arg3)
	SetTimerDurationSafe(vcbFocusCastbar, Duration, Enum.StatusBarTimerDirection.ElapsedTime, Enum.StatusBarInterpolation.Immediate)
	if vcbFocusCastbar.FadeOutAnim:IsPlaying() then vcbFocusCastbar.FadeOutAnim:Stop() end
	if vcbFocusCastbar.HoldFadeOutAnim:IsPlaying() then vcbFocusCastbar.HoldFadeOutAnim:Stop() end
	vcbFocusCastbar:SetStatusBarTexture("ui-castingbar-filling-standard")
	vcbFocusCastbar.Uninterruptable:SetAlphaFromBoolean(uninterruptible, 255, 0)
	vcbFocusCastbar.UninterruptableSpark:SetAlphaFromBoolean(uninterruptible, 255, 0)
	vcbFocusCastbar.Spark:SetAlphaFromBoolean(uninterruptible, 0, 255)
	vcbFocusCastbar:GetStatusBarTexture():SetAlphaFromBoolean(uninterruptible, 0, 255)
	local name = C_Spell.GetSpellName(arg3)
	vcbFocusCastbar.Text:SetText(name)
	local iconID = C_Spell.GetSpellTexture(arg3)
	vcbFocusCastbar.Icon:SetTexture(iconID)
	vcbFocusCastbar.Flash:Hide()
	vcbFocusCastbar:SetAlpha(1)
	vcbFocusCastbar.Spark:Show()
	vcbFocusCastbar:Show()
end
-- Channeling bar
local function barIsChanneling(arg3)
	SetTimerDurationSafe(vcbFocusCastbar, Duration, Enum.StatusBarTimerDirection.RemainingTime, Enum.StatusBarInterpolation.ExponentialEaseOut)
	if vcbFocusCastbar.FadeOutAnim:IsPlaying() then vcbFocusCastbar.FadeOutAnim:Stop() end
	if vcbFocusCastbar.HoldFadeOutAnim:IsPlaying() then vcbFocusCastbar.HoldFadeOutAnim:Stop() end
	vcbFocusCastbar:SetStatusBarTexture("ui-castingbar-filling-channel")
	vcbFocusCastbar.Uninterruptable:SetAlphaFromBoolean(uninterruptible, 255, 0)
	vcbFocusCastbar.UninterruptableSpark:SetAlphaFromBoolean(uninterruptible, 255, 0)
	vcbFocusCastbar.Spark:SetAlphaFromBoolean(uninterruptible, 0, 255)
	vcbFocusCastbar:GetStatusBarTexture():SetAlphaFromBoolean(uninterruptible, 0, 255)
	local name = C_Spell.GetSpellName(arg3)
	vcbFocusCastbar.Text:SetText(name)
	local iconID = C_Spell.GetSpellTexture(arg3)
	vcbFocusCastbar.Icon:SetTexture(iconID)
	vcbFocusCastbar.Flash:Hide()
	vcbFocusCastbar:SetAlpha(1)
	vcbFocusCastbar.Spark:Show()
	vcbFocusCastbar:Show()
end
-- Empowering bar
local function barIsEmpowering(arg3)
	empStart = GetTime()
	LayoutEmpowerPips(true)
	SetTimerDurationSafe(vcbFocusCastbar, Duration, Enum.StatusBarTimerDirection.ElapsedTime, Enum.StatusBarInterpolation.Immediate)
	if vcbFocusCastbar.FadeOutAnim:IsPlaying() then vcbFocusCastbar.FadeOutAnim:Stop() end
	if vcbFocusCastbar.HoldFadeOutAnim:IsPlaying() then vcbFocusCastbar.HoldFadeOutAnim:Stop() end
	vcbFocusCastbar:SetStatusBarTexture("ui-castingbar-tier2-empower")
	vcbFocusCastbar.Uninterruptable:SetAlphaFromBoolean(uninterruptible, 255, 0)
	vcbFocusCastbar.UninterruptableSpark:SetAlphaFromBoolean(uninterruptible, 255, 0)
	vcbFocusCastbar.Spark:SetAlphaFromBoolean(uninterruptible, 0, 255)
	vcbFocusCastbar:GetStatusBarTexture():SetAlphaFromBoolean(uninterruptible, 0, 255)
	local name = C_Spell.GetSpellName(arg3)
	vcbFocusCastbar.Text:SetText(name)
	local iconID = C_Spell.GetSpellTexture(arg3)
	vcbFocusCastbar.Icon:SetTexture(iconID)
	vcbFocusCastbar.Flash:Hide()
	vcbFocusCastbar:SetAlpha(1)
	vcbFocusCastbar.Spark:Show()
	vcbFocusCastbar:Show()
end
-- Stop Casting
local function barCastStop()
	vcbFocusCastbar.Spark:Hide()
	if interrupted then
		if interruptedBy then
			local unitName = UnitNameFromGUID(interruptedBy)
			vcbFocusCastbar.Text:SetText(SPELL_INTERRUPTED_BY:format(unitName))
		else
			vcbFocusCastbar.Text:SetText(INTERRUPTED)
		end
		Duration:Reset()
		vcbFocusCastbar:SetMinMaxValues(0, 0)
		vcbFocusCastbar:SetStatusBarTexture("ui-castingbar-interrupted")
		vcbFocusCastbar:SetToTargetValue()
		vcbFocusCastbar.HoldFadeOutAnim:Play()
	elseif failed then
		vcbFocusCastbar.Text:SetText(FAILED)
		Duration:Reset()
		vcbFocusCastbar:SetMinMaxValues(0, 0)
		vcbFocusCastbar:SetStatusBarTexture("ui-castingbar-interrupted")
		vcbFocusCastbar:SetToTargetValue()
		vcbFocusCastbar.HoldFadeOutAnim:Play()
	else
		vcbFocusCastbar.Flash:Show()
		vcbFocusCastbar:SetStatusBarTexture("ui-castingbar-full-standard")
		vcbFocusCastbar.FadeOutAnim:Play()
	end
end
-- Stop Channeling
local function barChannelStop()
	vcbFocusCastbar.Spark:Hide()
	if interruptedBy then
		local unitName = UnitNameFromGUID(interruptedBy)
		vcbFocusCastbar.Text:SetText(SPELL_INTERRUPTED_BY:format(unitName))
		Duration:Reset()
		vcbFocusCastbar:SetMinMaxValues(0, 0)
		vcbFocusCastbar:SetStatusBarTexture("ui-castingbar-interrupted")
		vcbFocusCastbar:SetToTargetValue()
		vcbFocusCastbar.HoldFadeOutAnim:Play()
	else
		vcbFocusCastbar.Flash:Show()
		vcbFocusCastbar:SetStatusBarTexture("ui-castingbar-full-channel")
		vcbFocusCastbar.FadeOutAnim:Play()
	end
end
-- Stop Empowering
local function barEmpowerStop()
	vcbFocusCastbar.Spark:Hide()
	if interruptedBy then
		local unitName = UnitNameFromGUID(interruptedBy)
		vcbFocusCastbar.Text:SetText(SPELL_INTERRUPTED_BY:format(unitName))
		Duration:Reset()
		vcbFocusCastbar:SetMinMaxValues(0, 0)
		vcbFocusCastbar:SetStatusBarTexture("ui-castingbar-interrupted")
		vcbFocusCastbar:SetToTargetValue()
		vcbFocusCastbar.HoldFadeOutAnim:Play()
	else
		vcbFocusCastbar.Flash:Show()
		vcbFocusCastbar:SetStatusBarTexture("ui-castingbar-tier4-empower")
		vcbFocusCastbar.FadeOutAnim:Play()
	end
	HidePips()
end
-- =========================
-- extra textures
-- =========================
local function createTextures()
-- Text Borders
		local function Borders(var1)
			var1:SetAtlas("ui-castingbar-textbox", true, "LINEAR")
			var1:SetAlpha(1)
		end
	if VCBsettings.Focus.Lock == G.OPTIONS_LS_LOCKED then
		FocusFrameSpellBar.Uninterruptable = FocusFrameSpellBar:CreateTexture(nil, "ARTWORK", nil, 1)
		FocusFrameSpellBar.Uninterruptable:SetAtlas("ui-castingbar-uninterruptable", false, "LINEAR")
		FocusFrameSpellBar.Uninterruptable:ClearAllPoints()
		FocusFrameSpellBar.Uninterruptable:SetPoint("TOPLEFT", FocusFrameSpellBar:GetStatusBarTexture(), "TOPLEFT")
		FocusFrameSpellBar.Uninterruptable:SetPoint("BOTTOMRIGHT", FocusFrameSpellBar:GetStatusBarTexture(), "BOTTOMRIGHT")
		FocusFrameSpellBar.Uninterruptable:SetAlpha(0)
		
		FocusFrameSpellBar.UninterruptableSpark = FocusFrameSpellBar:CreateTexture(nil, "OVERLAY", nil, 1)
		FocusFrameSpellBar.UninterruptableSpark:SetAtlas("ui-castingbar-pip", false, "LINEAR")
		FocusFrameSpellBar.UninterruptableSpark:SetSize(6, 16)
		FocusFrameSpellBar.UninterruptableSpark:ClearAllPoints()
		FocusFrameSpellBar.UninterruptableSpark:SetPoint("CENTER", FocusFrameSpellBar:GetStatusBarTexture(), "LEFT")
		FocusFrameSpellBar.UninterruptableSpark:SetAlpha(0)
-- icon spell left
		iconSpellLeft = FocusFrameSpellBar:CreateTexture(nil, "ARTWORK", nil, 0)
		iconSpellLeft:SetPoint("RIGHT", FocusFrameSpellBar, "LEFT", -2, -5)
		iconSpellLeft:SetSize(20, 20)
-- icon spell right
		iconSpellRight = FocusFrameSpellBar:CreateTexture(nil, "ARTWORK", nil, 0)
		iconSpellRight:SetPoint("LEFT", FocusFrameSpellBar, "RIGHT", 4, -5)
		iconSpellRight:SetSize(20, 20)
-- shield icon left
		shieldSpellLeft = FocusFrameSpellBar:CreateTexture(nil, "BACKGROUND", nil, 0)
		shieldSpellLeft:SetPoint("TOPLEFT", -27, 4)
		shieldSpellLeft:SetSize(29, 33)
		shieldSpellLeft:SetAtlas("ui-castingbar-shield")
		shieldSpellLeft:SetAlpha(0)
-- shield icon right
		shieldSpellRight = FocusFrameSpellBar:CreateTexture(nil, "BACKGROUND", nil, 0)
		shieldSpellRight:SetPoint("LEFT", FocusFrameSpellBar, "RIGHT", 0, 0)
		shieldSpellRight:SetPoint("TOPRIGHT", 27, 4)
		shieldSpellRight:SetSize(29, 33)
		shieldSpellRight:SetAtlas("ui-castingbar-shield")
		shieldSpellRight:SetAlpha(0)
-- Text Border Top
		TextBorderTop = FocusFrameSpellBar:CreateTexture(nil, "BACKGROUND", nil, -7)
		TextBorderTop:SetPoint("TOPLEFT", 0, 12)
		TextBorderTop:SetPoint("BOTTOMRIGHT", 0, 0)
		TextBorderTop:SetAtlas("ui-castingbar-textbox")
		TextBorderTop:SetAlpha(1)
-- Text Border Bottom
		TextBorderBottom = FocusFrameSpellBar:CreateTexture(nil, "BACKGROUND", nil, -7)
		TextBorderBottom:SetPoint("TOPLEFT", 0, 0)
		TextBorderBottom:SetPoint("BOTTOMRIGHT", 0, -12)
		TextBorderBottom:SetAtlas("ui-castingbar-textbox")
		TextBorderBottom:SetAlpha(1)
	
	elseif VCBsettings.Focus.Lock == G.OPTIONS_LS_UNLOCKED then
-- shield icon left
		shieldSpellLeft = vcbFocusCastbar:CreateTexture(nil, "BACKGROUND", nil, 0)
		shieldSpellLeft:SetAtlas("ui-castingbar-shield")
		shieldSpellLeft:SetAlpha(0)
-- shield icon left
		shieldSpellRight = vcbFocusCastbar:CreateTexture(nil, "BACKGROUND", nil, 0)
		shieldSpellRight:SetAtlas("ui-castingbar-shield")
		shieldSpellRight:SetAlpha(0)
-- icon spell left
		iconSpellLeft = vcbFocusCastbar:CreateTexture(nil, "ARTWORK", nil, 0)
		iconSpellLeft:SetPoint("CENTER", shieldSpellLeft, "CENTER", 0, 6)
-- icon spell right
		iconSpellRight = vcbFocusCastbar:CreateTexture(nil, "ARTWORK", nil, 0)
		iconSpellRight:SetPoint("CENTER", shieldSpellRight, "CENTER", 0, 6)
-- Text Border Top
		TextBorderTop = vcbFocusCastbar:CreateTexture(nil, "BACKGROUND", nil, -7)
-- Text Border Bottom
		TextBorderBottom = vcbFocusCastbar:CreateTexture(nil, "BACKGROUND", nil, -7)
	end
	Borders(TextBorderTop)
	Borders(TextBorderBottom)
end
-- =========================
-- extra texts
-- =========================
-- function for the texts
local function createTexts()
	if VCBsettings.Focus.Lock == G.OPTIONS_LS_LOCKED then
		textName = FocusFrameSpellBar:CreateFontString(nil, "OVERLAY", nil)
		textCurrent = FocusFrameSpellBar:CreateFontString(nil, "OVERLAY", nil)
		textBoth = FocusFrameSpellBar:CreateFontString(nil, "OVERLAY", nil)
		textTotal = FocusFrameSpellBar:CreateFontString(nil, "OVERLAY", nil)
	elseif VCBsettings.Focus.Lock == G.OPTIONS_LS_UNLOCKED then
		textName = vcbFocusCastbar:CreateFontString(nil, "OVERLAY", nil)
		textCurrent = vcbFocusCastbar:CreateFontString(nil, "OVERLAY", nil)
		textBoth = vcbFocusCastbar:CreateFontString(nil, "OVERLAY", nil)
		textTotal = vcbFocusCastbar:CreateFontString(nil, "OVERLAY", nil)
	end
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
			if not iconSpellLeft:IsShown() then iconSpellLeft:Show() end
			if iconSpellRight:IsShown() then iconSpellRight:Hide() end
		end
	elseif VCBsettings.Focus.Icon.Position == G.OPTIONS_P_RIGHT then
		function iconPosition(self)
			if iconSpellLeft:IsShown() then iconSpellLeft:Hide() end
			if not iconSpellRight:IsShown() then iconSpellRight:Show() end
		end
	elseif VCBsettings.Focus.Icon.Position == G.OPTIONS_P_BOTH then
		function iconPosition(self)
			if not iconSpellLeft:IsShown() then iconSpellLeft:Show() end
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
	if VCBsettings.Focus.StatusBar.Color == G.OPTIONS_C_DEFAULT and VCBsettings.Focus.StatusBar.Interrupt.Show == true then
		if VCBsettings.Focus.StatusBar.Interrupt.Color == G.OPTIONS_C_DEFAULT then
			function statusbarColor(self)
				if vcbInterruptParent.Cooldown:IsShown() then
					self:SetStatusBarDesaturated(true)
					self.Spark:SetDesaturated(true)
					self.Flash:SetDesaturated(true)
					self:SetStatusBarColor(1, 0.2, 0.1)
					self.Spark:SetVertexColor(1, 0.2, 0.1)
					self.Flash:SetVertexColor(1, 0.2, 0.1)
				else
					self:SetStatusBarDesaturated(false)
					self:SetStatusBarColor(1, 1, 1)
					if VCBsettings.Focus.StatusBar.Style == "Jailer" then
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
			end
		end
	elseif VCBsettings.Focus.StatusBar.Color == G.OPTIONS_C_DEFAULT and VCBsettings.Focus.StatusBar.Interrupt.Show == false then
		function statusbarColor(self)
			self:SetStatusBarDesaturated(false)
			self:SetStatusBarColor(1, 1, 1)
			if VCBsettings.Focus.StatusBar.Style == "Jailer" then
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
	elseif VCBsettings.Focus.StatusBar.Color == G.OPTIONS_C_CLASS and VCBsettings.Focus.StatusBar.Interrupt.Show == true then
		if VCBsettings.Focus.StatusBar.Interrupt.Color == G.OPTIONS_C_DEFAULT then
		function statusbarColor(self)
			self:SetStatusBarDesaturated(true)
			self.Spark:SetDesaturated(true)
			self.Flash:SetDesaturated(true)
			if vcbInterruptParent.Cooldown:IsShown() then
				self:SetStatusBarColor(1, 0.2, 0.1)
				self.Spark:SetVertexColor(1, 0.2, 0.1)
				self.Flash:SetVertexColor(1, 0.2, 0.1)
			else
				self:SetStatusBarColor(vcbClassColorFocus:GetRGB())
				self.Spark:SetVertexColor(vcbClassColorFocus:GetRGB())
				self.Flash:SetVertexColor(vcbClassColorFocus:GetRGB())
			end	
		end
		end
	elseif VCBsettings.Focus.StatusBar.Color == G.OPTIONS_C_CLASS and VCBsettings.Focus.StatusBar.Interrupt.Show == false then
		function statusbarColor(self)
			self:SetStatusBarDesaturated(true)
			self.Spark:SetDesaturated(true)
			self.Flash:SetDesaturated(true)
			self:SetStatusBarColor(vcbClassColorFocus:GetRGB())
			self.Spark:SetVertexColor(vcbClassColorFocus:GetRGB())
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
			self.Background:SetVertexColor(1, 1, 1)
			self.Border:SetVertexColor(1, 1, 1)
			TextBorderTop:SetVertexColor(1, 1, 1)
			TextBorderBottom:SetVertexColor(1, 1, 1)
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
		if self.Uninterruptable then
			self.Uninterruptable:SetDesaturated(false)
			self.Uninterruptable:SetVertexColor(1, 1, 1)
		end
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
-- =========================
-- position & scale bar
-- =========================
function VDW.VCB.FocusCastbarPosition()
	vcbFocusCastbar:ClearAllPoints()
	vcbFocusCastbar:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", VCBsettings.Focus.Position.X, VCBsettings.Focus.Position.Y)
end
function VDW.VCB.FocusCastbarSize()
	vcbFocusCastbar:SetSize(VCBsettings.Focus.Size.Width, VCBsettings.Focus.Size.Height)
	vcbFocusCastbar:SetScale(VCBsettings.Focus.Scale/100)
	local shieldH = VCBsettings.Focus.Size.Height*3.3
	local shieldW = shieldH*0.9
	local shieldY = VCBsettings.Focus.Size.Height*0.4
	local iconH = VCBsettings.Focus.Size.Height*2
	local iconY = shieldH*0.1
	shieldSpellLeft:ClearAllPoints()
	shieldSpellLeft:SetPoint("TOPRIGHT", vcbFocusCastbar, "TOPLEFT", 2, shieldY)
	shieldSpellLeft:SetSize(shieldW, shieldH)
	shieldSpellRight:ClearAllPoints()
	shieldSpellRight:SetPoint("TOPLEFT", vcbFocusCastbar, "TOPRIGHT", -2, shieldY)
	shieldSpellRight:SetSize(shieldW, shieldH)
	iconSpellLeft:ClearAllPoints()
	iconSpellLeft:SetPoint("CENTER", shieldSpellLeft, "CENTER", 1, iconY)
	iconSpellLeft:SetSize(iconH, iconH)
	iconSpellRight:ClearAllPoints()
	iconSpellRight:SetPoint("CENTER", shieldSpellRight, "CENTER", -1, iconY)
	iconSpellRight:SetSize(iconH, iconH)
	local borderH = VCBsettings.Focus.Size.Height/2
	TextBorderTop:ClearAllPoints()
	TextBorderTop:SetPoint("BOTTOMLEFT", vcbFocusCastbar, "TOPLEFT", 0, -borderH)
	TextBorderTop:SetPoint("BOTTOMRIGHT", vcbFocusCastbar, "TOPRIGHT", 0, -borderH)
	TextBorderTop:SetHeight(12+borderH)
	TextBorderBottom:ClearAllPoints()
	TextBorderBottom:SetPoint("TOPLEFT", vcbFocusCastbar, "BOTTOMLEFT", 0, borderH)
	TextBorderBottom:SetPoint("TOPRIGHT", vcbFocusCastbar, "BOTTOMRIGHT", 0, borderH)
	TextBorderBottom:SetHeight(12+borderH)
	local sparkH = VCBsettings.Focus.Size.Height*1.6
	vcbFocusCastbar.Spark:SetSize(6, sparkH)
	vcbFocusCastbar.UninterruptableSpark:SetSize(6, sparkH)
end
-- =========================
-- locked & unlocked
-- =========================
-- locked
local function barIsLocked()
-- hook part 1 --
	FocusFrameSpellBar:HookScript("OnShow", function(self)
		textName:SetWidth(self:GetWidth() - 8)
		iconPosition(self)
		namePosition(self)
		currentPostion(self)
		bothPostion(self)
		totalPostion(self)
		borderStyle(self)
	end)
-- hook part 2 --
FocusFrameSpellBar:HookScript("OnUpdate", function(self)
		self.TextBorder:SetAlpha(0)
		self.Text:SetAlpha(0)
		self.BorderShield:SetAlpha(0)
		self.Icon:SetAlpha(0)
		TextBorderTop:SetAlpha(1)
		TextBorderBottom:SetAlpha(1)
		if Duration then
			textName:SetText(self.Text:GetText())
			iconSpellLeft:SetTexture(self.Icon:GetTextureFileID())
			iconSpellRight:SetTexture(self.Icon:GetTextureFileID())
			shieldPosition(uninterruptible)
			bordertextPosition()
			borderColor(self)
			if interrupted then
				textCurrent:SetText("-")
				textBoth:SetText("- / -")
				textTotal:SetText("-")
			else
				currentUpdate(self)
				bothUpdate(self)
				totalUpdate(self)
			end
			FocusFrameSpellBar.Spark:SetAlphaFromBoolean(uninterruptible, 0, 255)
			FocusFrameSpellBar:GetStatusBarTexture():SetAlphaFromBoolean(uninterruptible, 0, 255)
			FocusFrameSpellBar.Uninterruptable:SetAlphaFromBoolean(uninterruptible, 255, 0)
			FocusFrameSpellBar.UninterruptableSpark:SetAlphaFromBoolean(uninterruptible, 255, 0)
			FocusFrameSpellBar.UninterruptableSpark:ClearAllPoints()
			FocusFrameSpellBar.UninterruptableSpark:SetPoint("CENTER", FocusFrameSpellBar:GetStatusBarTexture(), "RIGHT")
			if tradeSkill then defaultColor(self) else statusbarColor(self) end
			statusbarStyle(self)
		end
	end)
end
-- unlocked
local function barIsUnlocked()
-- hook part 1 --
	vcbFocusCastbar:HookScript("OnShow", function(self)
		textName:SetWidth(self:GetWidth() - 8)
		iconPosition(self)
		namePosition(self)
		currentPostion(self)
		bothPostion(self)
		totalPostion(self)
		borderStyle(self)
	end)
-- hook part 2 --
	vcbFocusCastbar:HookScript("OnUpdate", function(self)
		TextBorderTop:SetAlpha(1)
		TextBorderBottom:SetAlpha(1)
		if Duration then
			self.Spark:ClearAllPoints()
			self.Spark:SetPoint("CENTER", self:GetStatusBarTexture(), "RIGHT")
			textName:SetText(self.Text:GetText())
			iconSpellLeft:SetTexture(self.Icon:GetTextureFileID())
			iconSpellRight:SetTexture(self.Icon:GetTextureFileID())
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
	if FocusFrameSpellBar then
		FocusFrameSpellBar:HookScript("OnUpdate", function(self)
			self:SetAlpha(0)
			if self.HoldFadeOutAnim:IsPlaying() then self.HoldFadeOutAnim:Stop() end
			if self.FadeOutAnim:IsPlaying() then self.FadeOutAnim:Stop() end
		end)
	end
end
-- =========================
-- Events Time
-- =========================
local function EventsTime(self, event, arg1, arg2, arg3, arg4)
	if event == "PLAYER_LOGIN" then
		ProtectOptions()
		if VCBsettings.Focus.Lock == G.OPTIONS_LS_UNLOCKED then createBar() end
		createTextures()
		createTexts()
		if vcbFocusCastbar then
			VDW.VCB.FocusCastbarPosition()
			VDW.VCB.FocusCastbarSize()
		end
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
		if VCBsettings.Focus.Lock == G.OPTIONS_LS_LOCKED then
			barIsLocked()
		elseif VCBsettings.Focus.Lock == G.OPTIONS_LS_UNLOCKED then
			barIsUnlocked()
		end
	elseif event == "PLAYER_FOCUS_CHANGED" then
		if VCBsettings.Focus.Lock == G.OPTIONS_LS_UNLOCKED then vcbFocusCastbar:Hide() end
		local classFilename = UnitClassBase(UNIT)
		if classFilename ~= nil then
			vcbClassColorFocus = C_ClassColor.GetClassColor(classFilename)
			castName, castText, castTexture, _, _, castIsTradeSkill, _, castNotInterruptible, castSpellID = UnitCastingInfo(UNIT)
			chanName, chanText, chanTexture, _, _, chanIsTradeSkill, chanNotInterruptible, chanSpellID, isEmpowered, numStages = UnitChannelInfo(UNIT)
			if castName then
				Duration = UnitCastingDuration(UNIT)
				uninterruptible = castNotInterruptible
				castBar = "Cast"
				tradeSkill = castIsTradeSkill
				if VCBsettings.Focus.Lock == G.OPTIONS_LS_UNLOCKED then barIsCasting(castSpellID) end
			elseif chanName and numStages == 0 then
				Duration = UnitChannelDuration(UNIT)
				uninterruptible = chanNotInterruptible
				castBar = "Channel"
				tradeSkill = chanIsTradeSkill
				if VCBsettings.Focus.Lock == G.OPTIONS_LS_UNLOCKED then barIsChanneling(chanSpellID) end
			elseif chanName and numStages > 0 then
				Duration = UnitEmpoweredChannelDuration(UNIT, true)
				uninterruptible = chanNotInterruptible
				castBar = "Empower"
				tradeSkill = chanIsTradeSkill
				if VCBsettings.Focus.Lock == G.OPTIONS_LS_UNLOCKED then barIsEmpowering(chanSpellID) end
			end
		end
	elseif event == "UNIT_SPELLCAST_START" and arg1 == UNIT then
		failed = false
		castName, castText, castTexture, _, _, castIsTradeSkill, _, castNotInterruptible = UnitCastingInfo(arg1)
		if castName then
			Duration = UnitCastingDuration(arg1)
			uninterruptible = castNotInterruptible
			castBar = "Cast"
			tradeSkill = castIsTradeSkill
			interrupted = false
			if VCBsettings.Focus.Lock == G.OPTIONS_LS_UNLOCKED then barIsCasting(arg3) end
		end	
	elseif event == "UNIT_SPELLCAST_CHANNEL_START" and arg1 == UNIT then
		failed = false
		chanName, chanText, chanTexture, _, _, chanIsTradeSkill, chanNotInterruptible, _, isEmpowered, numStages = UnitChannelInfo(arg1)
		if chanName then
			Duration = UnitChannelDuration(arg1)
			uninterruptible = chanNotInterruptible
			castBar = "Channel"
			tradeSkill = chanIsTradeSkill
			interrupted = false
			if VCBsettings.Focus.Lock == G.OPTIONS_LS_UNLOCKED then barIsChanneling(arg3) end
		end
	elseif event == "UNIT_SPELLCAST_EMPOWER_START" and arg1 == UNIT then
		failed = false
		chanName, chanText, chanTexture, _, _, chanIsTradeSkill, chanNotInterruptible, _, isEmpowered, numStages = UnitChannelInfo(arg1)
		if chanName then
			Duration = UnitEmpoweredChannelDuration(UNIT, true)
			uninterruptible = chanNotInterruptible
			castBar = "Empower"
			tradeSkill = chanIsTradeSkill
			interrupted = false
			if VCBsettings.Focus.Lock == G.OPTIONS_LS_UNLOCKED then barIsEmpowering(arg3) end
		end
	elseif event == "UNIT_SPELLCAST_INTERRUPTED" and arg1 == UNIT then
		interrupted = true
		interruptedBy = arg4
	elseif event == "UNIT_SPELLCAST_FAILED" and arg1 == UNIT then
		failed = true
	elseif event == "UNIT_SPELLCAST_CHANNEL_STOP"and arg1 == UNIT then
		interruptedBy = arg4
		if VCBsettings.Focus.Lock == G.OPTIONS_LS_UNLOCKED then barChannelStop() end
	elseif event == "UNIT_SPELLCAST_EMPOWER_STOP" and arg1 == UNIT then
		interruptedBy = arg5
		if VCBsettings.Focus.Lock == G.OPTIONS_LS_UNLOCKED then barEmpowerStop() end
	elseif event == "UNIT_SPELLCAST_STOP" and arg1 == UNIT then
		if VCBsettings.Focus.Lock == G.OPTIONS_LS_UNLOCKED then barCastStop() end
	end
end
vcbZlave:HookScript("OnEvent", EventsTime)
