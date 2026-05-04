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
	FocusFrameSpellBar.Uninterruptable = FocusFrameSpellBar:CreateTexture(nil, "ARTWORK", nil, 1)
	FocusFrameSpellBar.Uninterruptable:SetAtlas("ui-castingbar-uninterruptable", false, "LINEAR")
	FocusFrameSpellBar.Uninterruptable:ClearAllPoints()
	FocusFrameSpellBar.Uninterruptable:SetPoint("TOPLEFT", FocusFrameSpellBar:GetStatusBarTexture(), "TOPLEFT")
	FocusFrameSpellBar.Uninterruptable:SetPoint("BOTTOMRIGHT", FocusFrameSpellBar:GetStatusBarTexture(), "BOTTOMRIGHT")
	FocusFrameSpellBar.Uninterruptable:SetAlpha(0)
	FocusFrameSpellBar.UninterruptableSpark = FocusFrameSpellBar:CreateTexture(nil, "OVERLAY", nil, 1)
	FocusFrameSpellBar.UninterruptableSpark:SetAtlas("ui-castingbar-pip", false, "LINEAR")
	FocusFrameSpellBar.UninterruptableSpark:SetSize(6, 16)
	FocusFrameSpellBar.UninterruptableSpark:SetAlpha(0)
-- icon spell left
	FocusFrameSpellBar.iconSpellLeft = FocusFrameSpellBar:CreateTexture(nil, "ARTWORK", nil, 0)
	FocusFrameSpellBar.iconSpellLeft:SetPoint("RIGHT", FocusFrameSpellBar, "LEFT", -2, -5)
	FocusFrameSpellBar.iconSpellLeft:SetSize(20, 20)
-- icon spell right
	FocusFrameSpellBar.iconSpellRight = FocusFrameSpellBar:CreateTexture(nil, "ARTWORK", nil, 0)
	FocusFrameSpellBar.iconSpellRight:SetPoint("LEFT", FocusFrameSpellBar, "RIGHT", 4, -5)
	FocusFrameSpellBar.iconSpellRight:SetSize(20, 20)
-- shield icon left
	FocusFrameSpellBar.shieldSpellLeft = FocusFrameSpellBar:CreateTexture(nil, "BACKGROUND", nil, 0)
	FocusFrameSpellBar.shieldSpellLeft:SetPoint("TOPLEFT", -27, 4)
	FocusFrameSpellBar.shieldSpellLeft:SetSize(29, 33)
	FocusFrameSpellBar.shieldSpellLeft:SetAtlas("ui-castingbar-shield")
	FocusFrameSpellBar.shieldSpellLeft:SetAlpha(0)
-- shield icon right
	FocusFrameSpellBar.shieldSpellRight = FocusFrameSpellBar:CreateTexture(nil, "BACKGROUND", nil, 0)
	FocusFrameSpellBar.shieldSpellRight:SetPoint("TOPRIGHT", 27, 4)
	FocusFrameSpellBar.shieldSpellRight:SetSize(29, 33)
	FocusFrameSpellBar.shieldSpellRight:SetAtlas("ui-castingbar-shield")
	FocusFrameSpellBar.shieldSpellRight:SetAlpha(0)
-- Text Border Top
	FocusFrameSpellBar.TextBorderTop = FocusFrameSpellBar:CreateTexture(nil, "BACKGROUND", nil, -7)
	FocusFrameSpellBar.TextBorderTop:SetPoint("TOPLEFT", 0, 12)
	FocusFrameSpellBar.TextBorderTop:SetPoint("BOTTOMRIGHT", 0, 0)
	FocusFrameSpellBar.TextBorderTop:SetAtlas("ui-castingbar-textbox")
	FocusFrameSpellBar.TextBorderTop:SetAlpha(0.38)
-- Text Border Bottom
	FocusFrameSpellBar.TextBorderBottom = FocusFrameSpellBar:CreateTexture(nil, "BACKGROUND", nil, -7)
	FocusFrameSpellBar.TextBorderBottom:SetPoint("TOPLEFT", 0, 0)
	FocusFrameSpellBar.TextBorderBottom:SetPoint("BOTTOMRIGHT", 0, -12)
	FocusFrameSpellBar.TextBorderBottom:SetAtlas("ui-castingbar-textbox")
	FocusFrameSpellBar.TextBorderBottom:SetAlpha(0.38)
end
-- =========================
-- extra texts
-- =========================
-- function for the texts
local function createTexts()
	FocusFrameSpellBar.textName = FocusFrameSpellBar:CreateFontString(nil, "OVERLAY", nil)
	FocusFrameSpellBar.textCurrent = FocusFrameSpellBar:CreateFontString(nil, "OVERLAY", nil)
	FocusFrameSpellBar.textBoth = FocusFrameSpellBar:CreateFontString(nil, "OVERLAY", nil)
	FocusFrameSpellBar.textTotal = FocusFrameSpellBar:CreateFontString(nil, "OVERLAY", nil)
	local function Texts(var1)
		var1:SetFontObject("GameFontHighlightSmall")
		var1:Hide()
	end
	Texts(FocusFrameSpellBar.textName)
	Texts(FocusFrameSpellBar.textCurrent)
	Texts(FocusFrameSpellBar.textBoth)
	Texts(FocusFrameSpellBar.textTotal)
end
-- =========================
-- functions OnUpdate and OnShow
-- =========================
-- icon position
local function iconPosition(self)
	print("iconPosition is not Working!")
end
-- shield position
local function shieldPosition(uninterruptible, self)
	print("shieldPosition is not Working!")
end
-- border text position
local function bordertextPosition (self)
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
	if VCBsettings.Focus.Icon.Position == "Hide" then
		function iconPosition(self)
			if self.iconSpellLeft:IsShown() then self.iconSpellLeft:Hide() end
			if self.iconSpellRight:IsShown() then self.iconSpellRight:Hide() end
		end
	elseif VCBsettings.Focus.Icon.Position == "Left" then
		function iconPosition(self)
			if not self.iconSpellLeft:IsShown() then self.iconSpellLeft:Show() end
			if self.iconSpellRight:IsShown() then self.iconSpellRight:Hide() end
		end
	elseif VCBsettings.Focus.Icon.Position == "Right" then
		function iconPosition(self)
			if self.iconSpellLeft:IsShown() then self.iconSpellLeft:Hide() end
			if not self.iconSpellRight:IsShown() then self.iconSpellRight:Show() end
		end
	elseif VCBsettings.Focus.Icon.Position == "Both" then
		function iconPosition(self)
			if not self.iconSpellLeft:IsShown() then self.iconSpellLeft:Show() end
			if not self.iconSpellRight:IsShown() then self.iconSpellRight:Show() end
		end
	end
end
-- check shield
function VDW.VCB.chkFocusShieldPosition()
	if VCBsettings.Focus.Shield.Position == "Hide" then
		function shieldPosition(uninterruptible, self)
			self.shieldSpellLeft:SetAlpha(0)
			self.shieldSpellRight:SetAlpha(0)
		end
	elseif VCBsettings.Focus.Shield.Position == "Left" then
		function shieldPosition(uninterruptible, self)
			self.shieldSpellLeft:SetAlphaFromBoolean(uninterruptible, 255, 0)
			self.shieldSpellRight:SetAlpha(0)
		end
	elseif VCBsettings.Focus.Shield.Position == "Right" then
		function shieldPosition(uninterruptible, self)
			self.shieldSpellLeft:SetAlpha(0)
			self.shieldSpellRight:SetAlphaFromBoolean(uninterruptible, 255, 0)
		end
	elseif VCBsettings.Focus.Shield.Position == "Both" then
		function shieldPosition(uninterruptible, self)
			self.shieldSpellLeft:SetAlphaFromBoolean(uninterruptible, 255, 0)
			self.shieldSpellRight:SetAlphaFromBoolean(uninterruptible, 255, 0)
		end
	end
end
-- check text border
function VDW.VCB.chkFocusBorderTextPosition()
	if VCBsettings.Focus.BorderText.Position == "Hide" then
		function bordertextPosition (self)
			self.TextBorderTop:Hide()
			self.TextBorderBottom:Hide()
		end
	elseif VCBsettings.Focus.BorderText.Position == "Top" then
		function bordertextPosition(self)
			self.TextBorderTop:Show()
			self.TextBorderBottom:Hide()
		end
	elseif VCBsettings.Focus.BorderText.Position == "Bottom" then
		function bordertextPosition(self)
			self.TextBorderTop:Hide()
			self.TextBorderBottom:Show()
		end
	elseif VCBsettings.Focus.BorderText.Position == "Both" then
		function bordertextPosition(self)
			self.TextBorderTop:Show()
			self.TextBorderBottom:Show()
		end
	end
end
-- check name text position
function VDW.VCB.chkNameTxtFocus()
	if VCBsettings.Focus.NameText.Position == "Hide" then
		function namePosition(self)
			if self.textName:IsShown() then self.textName:Hide() end
		end
	elseif VCBsettings.Focus.NameText.Position == "TopLeft" then
		function namePosition(self)
			self.textName:ClearAllPoints()
			self.textName:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 4, 1)
			self.textName:SetJustifyH("LEFT")
			if not self.textName:IsShown() then self.textName:Show() end
		end
	elseif VCBsettings.Focus.NameText.Position == "Left" then
		function namePosition(self)
			self.textName:ClearAllPoints()
			self.textName:SetPoint("LEFT", self, "LEFT", 4, 0)
			self.textName:SetJustifyH("LEFT")
			if not self.textName:IsShown() then self.textName:Show() end
		end
	elseif VCBsettings.Focus.NameText.Position == "BottomLeft" then
		function namePosition(self)
			self.textName:ClearAllPoints()
			self.textName:SetPoint("TOPLEFT", self, "BOTTOMLEFT", 4, -1)
			self.textName:SetJustifyH("LEFT")
			if not self.textName:IsShown() then self.textName:Show() end
		end
	elseif VCBsettings.Focus.NameText.Position == "Top" then
		function namePosition(self)
			self.textName:ClearAllPoints()
			self.textName:SetPoint("BOTTOM", self, "TOP", 0, 1)
			self.textName:SetJustifyH("CENTER")
			if not self.textName:IsShown() then self.textName:Show() end
		end
	elseif VCBsettings.Focus.NameText.Position == "Center" then
		function namePosition(self)
			self.textName:ClearAllPoints()
			self.textName:SetPoint("CENTER", self, "CENTER", 0, 0)
			self.textName:SetJustifyH("CENTER")
			if not self.textName:IsShown() then self.textName:Show() end
		end
	elseif VCBsettings.Focus.NameText.Position == "Bottom" then
		function namePosition(self)
			self.textName:ClearAllPoints()
			self.textName:SetPoint("TOP", self, "BOTTOM", 0, -1)
			self.textName:SetJustifyH("CENTER")
			if not self.textName:IsShown() then self.textName:Show() end
		end
	elseif VCBsettings.Focus.NameText.Position == "TopRight" then
		function namePosition(self)
			self.textName:ClearAllPoints()
			self.textName:SetPoint("BOTTOMRIGHT", self, "TOPRIGHT", -4, 1)
			self.textName:SetJustifyH("RIGHT")
			if not self.textName:IsShown() then self.textName:Show() end
		end
	elseif VCBsettings.Focus.NameText.Position == "Right" then
		function namePosition(self)
			self.textName:ClearAllPoints()
			self.textName:SetPoint("RIGHT", self, "RIGHT", -4, 0)
			self.textName:SetJustifyH("RIGHT")
			if not self.textName:IsShown() then self.textName:Show() end
		end
	elseif VCBsettings.Focus.NameText.Position == "BottomRight" then
		function namePosition(self)
			self.textName:ClearAllPoints()
			self.textName:SetPoint("TOPRIGHT", self, "BOTTOMRIGHT", -4, -1)
			self.textName:SetJustifyH("RIGHT")
			if not self.textName:IsShown() then self.textName:Show() end
		end
	end
end
-- check current casting time text position
function VDW.VCB.chkCurrentTxtFocus()
	if VCBsettings.Focus.CurrentTimeText.Position == "Hide" then
		function currentPostion(self)
			if self.textCurrent:IsShown() then self.textCurrent:Hide() end
		end
	elseif VCBsettings.Focus.CurrentTimeText.Position == "TopLeft" then
		function currentPostion(self)
			self.textCurrent:ClearAllPoints()
			self.textCurrent:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 4, 1)
			if not self.textCurrent:IsShown() then self.textCurrent:Show() end
		end
	elseif VCBsettings.Focus.CurrentTimeText.Position == "Left" then
		function currentPostion(self)
			self.textCurrent:ClearAllPoints()
			self.textCurrent:SetPoint("LEFT", self, "LEFT", 4, 0)
			if not self.textCurrent:IsShown() then self.textCurrent:Show() end
		end
	elseif VCBsettings.Focus.CurrentTimeText.Position == "BottomLeft" then
		function currentPostion(self)
			self.textCurrent:ClearAllPoints()
			self.textCurrent:SetPoint("TOPLEFT", self, "BOTTOMLEFT", 4, -1)
			if not self.textCurrent:IsShown() then self.textCurrent:Show() end
		end
	elseif VCBsettings.Focus.CurrentTimeText.Position == "Top" then
		function currentPostion(self)
			self.textCurrent:ClearAllPoints()
			self.textCurrent:SetPoint("BOTTOM", self, "TOP", 0, 1)
			if not self.textCurrent:IsShown() then self.textCurrent:Show() end
		end
	elseif VCBsettings.Focus.CurrentTimeText.Position == "Center" then
		function currentPostion(self)
			self.textCurrent:ClearAllPoints()
			self.textCurrent:SetPoint("CENTER", self, "CENTER", 0, 0)
			if not self.textCurrent:IsShown() then self.textCurrent:Show() end
		end
	elseif VCBsettings.Focus.CurrentTimeText.Position == "Bottom" then
		function currentPostion(self)
			self.textCurrent:ClearAllPoints()
			self.textCurrent:SetPoint("TOP", self, "BOTTOM", 0, -1)
			if not self.textCurrent:IsShown() then self.textCurrent:Show() end
		end
	elseif VCBsettings.Focus.CurrentTimeText.Position == "TopRight" then
		function currentPostion(self)
			self.textCurrent:ClearAllPoints()
			self.textCurrent:SetPoint("BOTTOMRIGHT", self, "TOPRIGHT", -4, 1)
			if not self.textCurrent:IsShown() then self.textCurrent:Show() end
		end
	elseif VCBsettings.Focus.CurrentTimeText.Position == "Right" then
		function currentPostion(self)
			self.textCurrent:ClearAllPoints()
			self.textCurrent:SetPoint("RIGHT", self, "RIGHT", -4, 0)
			if not self.textCurrent:IsShown() then self.textCurrent:Show() end
		end
	elseif VCBsettings.Focus.CurrentTimeText.Position == "BottomRight" then
		function currentPostion(self)
			self.textCurrent:ClearAllPoints()
			self.textCurrent:SetPoint("TOPRIGHT", self, "BOTTOMRIGHT", -4, -1)
			if not self.textCurrent:IsShown() then self.textCurrent:Show() end
		end
	end
end
-- check both casting time text position
function VDW.VCB.chkBothTxtFocus()
	if VCBsettings.Focus.BothTimeText.Position == "Hide" then
		function bothPostion(self)
			if self.textBoth:IsShown() then self.textBoth:Hide() end
		end
	elseif VCBsettings.Focus.BothTimeText.Position == "TopLeft" then
		function bothPostion(self)
			self.textBoth:ClearAllPoints()
			self.textBoth:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 4, 1)
			if not self.textBoth:IsShown() then self.textBoth:Show() end
		end
	elseif VCBsettings.Focus.BothTimeText.Position == "Left" then
		function bothPostion(self)
			self.textBoth:ClearAllPoints()
			self.textBoth:SetPoint("LEFT", self, "LEFT", 4, 0)
			if not self.textBoth:IsShown() then self.textBoth:Show() end
		end
	elseif VCBsettings.Focus.BothTimeText.Position == "BottomLeft" then
		function bothPostion(self)
			self.textBoth:ClearAllPoints()
			self.textBoth:SetPoint("TOPLEFT", self, "BOTTOMLEFT", 4, -1)
			if not self.textBoth:IsShown() then self.textBoth:Show() end
		end
	elseif VCBsettings.Focus.BothTimeText.Position == "Top" then
		function bothPostion(self)
			self.textBoth:ClearAllPoints()
			self.textBoth:SetPoint("BOTTOM", self, "TOP", 0, 1)
			if not self.textBoth:IsShown() then self.textBoth:Show() end
		end
	elseif VCBsettings.Focus.BothTimeText.Position == "Center" then
		function bothPostion(self)
			self.textBoth:ClearAllPoints()
			self.textBoth:SetPoint("CENTER", self, "CENTER", 0, 0)
			if not self.textBoth:IsShown() then self.textBoth:Show() end
		end
	elseif VCBsettings.Focus.BothTimeText.Position == "Bottom" then
		function bothPostion(self)
			self.textBoth:ClearAllPoints()
			self.textBoth:SetPoint("TOP", self, "BOTTOM", 0, -1)
			if not self.textBoth:IsShown() then self.textBoth:Show() end
		end
	elseif VCBsettings.Focus.BothTimeText.Position == "TopRight" then
		function bothPostion(self)
			self.textBoth:ClearAllPoints()
			self.textBoth:SetPoint("BOTTOMRIGHT", self, "TOPRIGHT", -4, 1)
			if not self.textBoth:IsShown() then self.textBoth:Show() end
		end
	elseif VCBsettings.Focus.BothTimeText.Position == "Right" then
		function bothPostion(self)
			self.textBoth:ClearAllPoints()
			self.textBoth:SetPoint("RIGHT", self, "RIGHT", -4, 0)
			if not self.textBoth:IsShown() then self.textBoth:Show() end
		end
	elseif VCBsettings.Focus.BothTimeText.Position == "BottomRight" then
		function bothPostion(self)
			self.textBoth:ClearAllPoints()
			self.textBoth:SetPoint("TOPRIGHT", self, "BOTTOMRIGHT", -4, -1)
			if not self.textBoth:IsShown() then self.textBoth:Show() end
		end
	end
end
-- check total casting time text position
function VDW.VCB.chkTotalTxtFocus()
	if VCBsettings.Focus.TotalTimeText.Position == "Hide" then
		function totalPostion(self)
			if self.textTotal:IsShown() then self.textTotal:Hide() end
		end
	elseif VCBsettings.Focus.TotalTimeText.Position == "TopLeft" then
		function totalPostion(self)
			self.textTotal:ClearAllPoints()
			self.textTotal:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 4, 1)
			if not self.textTotal:IsShown() then self.textTotal:Show() end
		end
	elseif VCBsettings.Focus.TotalTimeText.Position == "Left" then
		function totalPostion(self)
			self.textTotal:ClearAllPoints()
			self.textTotal:SetPoint("LEFT", self, "LEFT", 4, 0)
			if not self.textTotal:IsShown() then self.textTotal:Show() end
		end
	elseif VCBsettings.Focus.TotalTimeText.Position == "BottomLeft" then
		function totalPostion(self)
			self.textTotal:ClearAllPoints()
			self.textTotal:SetPoint("TOPLEFT", self, "BOTTOMLEFT", 4, -1)
			if not self.textTotal:IsShown() then self.textTotal:Show() end
		end
	elseif VCBsettings.Focus.TotalTimeText.Position == "Top" then
		function totalPostion(self)
			self.textTotal:ClearAllPoints()
			self.textTotal:SetPoint("BOTTOM", self, "TOP", 0, 1)
			if not self.textTotal:IsShown() then self.textTotal:Show() end
		end
	elseif VCBsettings.Focus.TotalTimeText.Position == "Center" then
		function totalPostion(self)
			self.textTotal:ClearAllPoints()
			self.textTotal:SetPoint("CENTER", self, "CENTER", 0, 0)
			if not self.textTotal:IsShown() then self.textTotal:Show() end
		end
	elseif VCBsettings.Focus.TotalTimeText.Position == "Bottom" then
		function totalPostion(self)
			self.textTotal:ClearAllPoints()
			self.textTotal:SetPoint("TOP", self, "BOTTOM", 0, -1)
			if not self.textTotal:IsShown() then self.textTotal:Show() end
		end
	elseif VCBsettings.Focus.TotalTimeText.Position == "TopRight" then
		function totalPostion(self)
			self.textTotal:ClearAllPoints()
			self.textTotal:SetPoint("BOTTOMRIGHT", self, "TOPRIGHT", -4, 1)
			if not self.textTotal:IsShown() then self.textTotal:Show() end
		end
	elseif VCBsettings.Focus.TotalTimeText.Position == "Right" then
		function totalPostion(self)
			self.textTotal:ClearAllPoints()
			self.textTotal:SetPoint("RIGHT", self, "RIGHT", -4, 0)
			if not self.textTotal:IsShown() then self.textTotal:Show() end
		end
	elseif VCBsettings.Focus.TotalTimeText.Position == "BottomRight" then
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
function VDW.VCB.chkCurrentUpdFocus()
	if VCBsettings.Focus.CurrentTimeText.Position ~= "Hide" then
		if VCBsettings.Focus.CurrentTimeText.Sec == "Hide" then
			if VCBsettings.Focus.CurrentTimeText.Decimals == "0" then
				if VCBsettings.Focus.CurrentTimeText.Direction == "Ascending" then
					function currentUpdate(self)
						self.textCurrent:SetText(string.format("%.0f", Duration:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Focus.CurrentTimeText.Direction == "Descending" then
					function currentUpdate(self)
						self.textCurrent:SetText(string.format("%.0f", Duration:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Focus.CurrentTimeText.Direction == "Both" then
					function currentUpdate(self)
						if castBar == "Cast" or castBar == "Empower" then
							self.textCurrent:SetText(string.format("%.0f", Duration:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
						elseif castBar == "Channel" then
							self.textCurrent:SetText(string.format("%.0f", Duration:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			elseif VCBsettings.Focus.CurrentTimeText.Decimals == "1" then
				if VCBsettings.Focus.CurrentTimeText.Direction == "Ascending" then
					function currentUpdate(self)
						self.textCurrent:SetText(string.format("%.1f", Duration:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Focus.CurrentTimeText.Direction == "Descending" then
					function currentUpdate(self)
						self.textCurrent:SetText(string.format("%.1f", Duration:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Focus.CurrentTimeText.Direction == "Both" then
					function currentUpdate(self)
						if castBar == "Cast" or castBar == "Empower" then
							self.textCurrent:SetText(string.format("%.1f", Duration:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
						elseif castBar == "Channel" then
							self.textCurrent:SetText(string.format("%.1f", Duration:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			elseif VCBsettings.Focus.CurrentTimeText.Decimals == "2" then
				if VCBsettings.Focus.CurrentTimeText.Direction == "Ascending" then
					function currentUpdate(self)
						self.textCurrent:SetText(string.format("%.2f", Duration:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Focus.CurrentTimeText.Direction == "Descending" then
					function currentUpdate(self)
						self.textCurrent:SetText(string.format("%.2f", Duration:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Focus.CurrentTimeText.Direction == "Both" then
					function currentUpdate(self)
						if castBar == "Cast" or castBar == "Empower" then
							self.textCurrent:SetText(string.format("%.2f", Duration:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
						elseif castBar == "Channel" then
							self.textCurrent:SetText(string.format("%.2f", Duration:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			elseif VCBsettings.Focus.CurrentTimeText.Decimals == "3" then
				if VCBsettings.Focus.CurrentTimeText.Direction == "Ascending" then
					function currentUpdate(self)
						self.textCurrent:SetText(string.format("%.3f", Duration:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Focus.CurrentTimeText.Direction == "Descending" then
					function currentUpdate(self)
						self.textCurrent:SetText(string.format("%.3f", Duration:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Focus.CurrentTimeText.Direction == "Both" then
					function currentUpdate(self)
						if castBar == "Cast" or castBar == "Empower" then
							self.textCurrent:SetText(string.format("%.3f", Duration:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
						elseif castBar == "Channel" then
							self.textCurrent:SetText(string.format("%.3f", Duration:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			end
		elseif VCBsettings.Focus.CurrentTimeText.Sec == "Show" then
			if VCBsettings.Focus.CurrentTimeText.Decimals == "0" then
				if VCBsettings.Focus.CurrentTimeText.Direction == "Ascending" then
					function currentUpdate(self)
						self.textCurrent:SetText(string.format("%.0f Sec", Duration:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Focus.CurrentTimeText.Direction == "Descending" then
					function currentUpdate(self)
						self.textCurrent:SetText(string.format("%.0f Sec", Duration:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Focus.CurrentTimeText.Direction == "Both" then
					function currentUpdate(self)
						if castBar == "Cast" or castBar == "Empower" then
							self.textCurrent:SetText(string.format("%.0f Sec", Duration:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
						elseif castBar == "Channel" then
							self.textCurrent:SetText(string.format("%.0f Sec", Duration:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			elseif VCBsettings.Focus.CurrentTimeText.Decimals == "1" then
				if VCBsettings.Focus.CurrentTimeText.Direction == "Ascending" then
					function currentUpdate(self)
						self.textCurrent:SetText(string.format("%.1f Sec", Duration:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Focus.CurrentTimeText.Direction == "Descending" then
					function currentUpdate(self)
						self.textCurrent:SetText(string.format("%.1f Sec", Duration:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Focus.CurrentTimeText.Direction == "Both" then
					function currentUpdate(self)
						if castBar == "Cast" or castBar == "Empower" then
							self.textCurrent:SetText(string.format("%.1f Sec", Duration:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
						elseif castBar == "Channel" then
							self.textCurrent:SetText(string.format("%.1f Sec", Duration:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			elseif VCBsettings.Focus.CurrentTimeText.Decimals == "2" then
				if VCBsettings.Focus.CurrentTimeText.Direction == "Ascending" then
					function currentUpdate(self)
						self.textCurrent:SetText(string.format("%.2f Sec", Duration:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Focus.CurrentTimeText.Direction == "Descending" then
					function currentUpdate(self)
						self.textCurrent:SetText(string.format("%.2f Sec", Duration:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Focus.CurrentTimeText.Direction == "Both" then
					function currentUpdate(self)
						if castBar == "Cast" or castBar == "Empower" then
							self.textCurrent:SetText(string.format("%.2f Sec", Duration:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
						elseif castBar == "Channel" then
							self.textCurrent:SetText(string.format("%.2f Sec", Duration:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			elseif VCBsettings.Focus.CurrentTimeText.Decimals == "3" then
				if VCBsettings.Focus.CurrentTimeText.Direction == "Ascending" then
					function currentUpdate(self)
						self.textCurrent:SetText(string.format("%.3f Sec", Duration:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Focus.CurrentTimeText.Direction == "Descending" then
					function currentUpdate(self)
						self.textCurrent:SetText(string.format("%.3f Sec", Duration:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Focus.CurrentTimeText.Direction == "Both" then
					function currentUpdate(self)
						if castBar == "Cast" or castBar == "Empower" then
							self.textCurrent:SetText(string.format("%.3f Sec", Duration:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
						elseif castBar == "Channel" then
							self.textCurrent:SetText(string.format("%.3f Sec", Duration:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			end
		end
	elseif VCBsettings.Focus.CurrentTimeText.Position == "Hide" then
		function currentUpdate(self)
			return
		end
	end
end
-- check both casting time update
function VDW.VCB.chkBothUpdFocus()
	if VCBsettings.Focus.BothTimeText.Position ~= "Hide" then
		if VCBsettings.Focus.BothTimeText.Sec == "Hide" then
			if VCBsettings.Focus.BothTimeText.Decimals == "0" then
				if VCBsettings.Focus.BothTimeText.Direction == "Ascending" then
					function bothUpdate(self)
						self.textBoth:SetText(string.format("%.0f / %.0f", Duration:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Focus.BothTimeText.Direction == "Descending" then
					function bothUpdate(self)
						self.textBoth:SetText(string.format("%.0f / %.0f", Duration:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Focus.BothTimeText.Direction == "Both" then
					function bothUpdate(self)
						if castBar == "Cast" or castBar == "Empower" then
							self.textBoth:SetText(string.format("%.0f / %.0f", Duration:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						elseif castBar == "Channel" then
							self.textBoth:SetText(string.format("%.0f / %.0f", Duration:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			elseif VCBsettings.Focus.BothTimeText.Decimals == "1" then
				if VCBsettings.Focus.BothTimeText.Direction == "Ascending" then
					function bothUpdate(self)
						self.textBoth:SetText(string.format("%.1f / %.1f", Duration:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Focus.BothTimeText.Direction == "Descending" then
					function bothUpdate(self)
						self.textBoth:SetText(string.format("%.1f / %.1f", Duration:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Focus.BothTimeText.Direction == "Both" then
					function bothUpdate(self)
						if castBar == "Cast" or castBar == "Empower" then
							self.textBoth:SetText(string.format("%.1f / %.1f", Duration:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						elseif castBar == "Channel" then
							self.textBoth:SetText(string.format("%.1f / %.1f", Duration:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			elseif VCBsettings.Focus.BothTimeText.Decimals == "2" then
				if VCBsettings.Focus.BothTimeText.Direction == "Ascending" then
					function bothUpdate(self)
						self.textBoth:SetText(string.format("%.2f / %.2f", Duration:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Focus.BothTimeText.Direction == "Descending" then
					function bothUpdate(self)
						self.textBoth:SetText(string.format("%.2f / %.2f", Duration:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Focus.BothTimeText.Direction == "Both" then
					function bothUpdate(self)
						if castBar == "Cast" or castBar == "Empower" then
							self.textBoth:SetText(string.format("%.2f / %.2f", Duration:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						elseif castBar == "Channel" then
							self.textBoth:SetText(string.format("%.2f / %.2f", Duration:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			elseif VCBsettings.Focus.BothTimeText.Decimals == "3" then
				if VCBsettings.Focus.BothTimeText.Direction == "Ascending" then
					function bothUpdate(self)
						self.textBoth:SetText(string.format("%.3f / %.3f", Duration:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Focus.BothTimeText.Direction == "Descending" then
					function bothUpdate(self)
						self.textBoth:SetText(string.format("%.3f / %.3f", Duration:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Focus.BothTimeText.Direction == "Both" then
					function bothUpdate(self)
						if castBar == "Cast" or castBar == "Empower" then
							self.textBoth:SetText(string.format("%.3f", Duration:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						elseif castBar == "Channel" then
							self.textBoth:SetText(string.format("%.3f / %.3f", Duration:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			end
		elseif VCBsettings.Focus.BothTimeText.Sec == "Show" then
			if VCBsettings.Focus.BothTimeText.Decimals == "0" then
				if VCBsettings.Focus.BothTimeText.Direction == "Ascending" then
					function bothUpdate(self)
						self.textBoth:SetText(string.format("%.0f / %.0f Sec", Duration:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Focus.BothTimeText.Direction == "Descending" then
					function bothUpdate(self)
						self.textBoth:SetText(string.format("%.0f / %.0f Sec", Duration:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Focus.BothTimeText.Direction == "Both" then
					function bothUpdate(self)
						if castBar == "Cast" or castBar == "Empower" then
							self.textBoth:SetText(string.format("%.0f / %.0f Sec", Duration:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						elseif castBar == "Channel" then
							self.textBoth:SetText(string.format("%.0f / %.0f Sec", Duration:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			elseif VCBsettings.Focus.BothTimeText.Decimals == "1" then
				if VCBsettings.Focus.BothTimeText.Direction == "Ascending" then
					function bothUpdate(self)
						self.textBoth:SetText(string.format("%.1f / %.1f Sec", Duration:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Focus.BothTimeText.Direction == "Descending" then
					function bothUpdate(self)
						self.textBoth:SetText(string.format("%.1f / %.1f Sec", Duration:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Focus.BothTimeText.Direction == "Both" then
					function bothUpdate(self)
						if castBar == "Cast" or castBar == "Empower" then
							self.textBoth:SetText(string.format("%.1f / %.1f Sec", Duration:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						elseif castBar == "Channel" then
							self.textBoth:SetText(string.format("%.1f / %.1f Sec", Duration:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			elseif VCBsettings.Focus.BothTimeText.Decimals == "2" then
				if VCBsettings.Focus.BothTimeText.Direction == "Ascending" then
					function bothUpdate(self)
						self.textBoth:SetText(string.format("%.2f / %.2f Sec", Duration:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Focus.BothTimeText.Direction == "Descending" then
					function bothUpdate(self)
						self.textBoth:SetText(string.format("%.2f / %.2f Sec", Duration:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Focus.BothTimeText.Direction == "Both" then
					function bothUpdate(self)
						if castBar == "Cast" or castBar == "Empower" then
							self.textBoth:SetText(string.format("%.2f / %.2f Sec", Duration:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						elseif castBar == "Channel" then
							self.textBoth:SetText(string.format("%.2f / %.2f Sec", Duration:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			elseif VCBsettings.Focus.BothTimeText.Decimals == "3" then
				if VCBsettings.Focus.BothTimeText.Direction == "Ascending" then
					function bothUpdate(self)
						self.textBoth:SetText(string.format("%.3f / %.3f Sec", Duration:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Focus.BothTimeText.Direction == "Descending" then
					function bothUpdate(self)
						self.textBoth:SetText(string.format("%.3f / %.3f Sec", Duration:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Focus.BothTimeText.Direction == "Both" then
					function bothUpdate(self)
						if castBar == "Cast" or castBar == "Empower" then
							self.textBoth:SetText(string.format("%.3f / %.3f Sec", Duration:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						elseif castBar == "Channel" then
							self.textBoth:SetText(string.format("%.3f / %.3f Sec", Duration:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			end
		end
	elseif VCBsettings.Focus.BothTimeText.Position == "Hide" then
		function bothUpdate(self)
			return
		end
	end
end
-- check both casting time update
function VDW.VCB.chkTotalUpdFocus()
	if VCBsettings.Focus.TotalTimeText.Position ~= "Hide" then
		if VCBsettings.Focus.TotalTimeText.Sec == "Hide" then
			if VCBsettings.Focus.TotalTimeText.Decimals == "0" then
				function totalUpdate(self)
					self.textTotal:SetFormattedText("%.0f", Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime))
				end
			elseif VCBsettings.Focus.TotalTimeText.Decimals == "1" then
				function totalUpdate(self)
					self.textTotal:SetFormattedText("%.1f", Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime))
				end
			elseif VCBsettings.Focus.TotalTimeText.Decimals == "2" then
				function totalUpdate(self)
					self.textTotal:SetFormattedText("%.2f", Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime))
				end
			elseif VCBsettings.Focus.TotalTimeText.Decimals == "3" then
				function totalUpdate(self)
					self.textTotal:SetFormattedText("%.3f", Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime))
				end
			end
		elseif VCBsettings.Focus.TotalTimeText.Sec == "Show" then
			if VCBsettings.Focus.TotalTimeText.Decimals == "0" then
				function totalUpdate(self)
					self.textTotal:SetFormattedText("%.0f sec", Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime))
				end
			elseif VCBsettings.Focus.TotalTimeText.Decimals == "1" then
				function totalUpdate(self)
					self.textTotal:SetFormattedText("%.1f sec", Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime))
				end
			elseif VCBsettings.Focus.TotalTimeText.Decimals == "2" then
				function totalUpdate(self)
					self.textTotal:SetFormattedText("%.2f sec", Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime))
				end
			elseif VCBsettings.Focus.TotalTimeText.Decimals == "3" then
				function totalUpdate(self)
					self.textTotal:SetFormattedText("%.3f sec", Duration:GetTotalDuration(Enum.DurationTimeModifier.RealTime))
				end
			end
		end
	elseif VCBsettings.Focus.TotalTimeText.Position == "Hide" then
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
	if VCBsettings.Focus.StatusBar.Color == "Default" and VCBsettings.Focus.StatusBar.Interrupt.Show == true then
		if VCBsettings.Focus.StatusBar.Interrupt.Color == "Default" then
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
	elseif VCBsettings.Focus.StatusBar.Color == "Default" and VCBsettings.Focus.StatusBar.Interrupt.Show == false then
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
	elseif VCBsettings.Focus.StatusBar.Color == "Class" and VCBsettings.Focus.StatusBar.Interrupt.Show == true then
		if VCBsettings.Focus.StatusBar.Interrupt.Color == "Default" then
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
	elseif VCBsettings.Focus.StatusBar.Color == "Class" and VCBsettings.Focus.StatusBar.Interrupt.Show == false then
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
	if VCBsettings.Focus.Border.Color == "Default" then
		function borderColor(self)
			self.Background:SetDesaturated(false)
			self.Border:SetDesaturated(false)
			self.Background:SetVertexColor(1, 1, 1)
			self.Border:SetVertexColor(1, 1, 1)
		end
	elseif VCBsettings.Focus.Border.Color == "Class" then
		function borderColor(self)
			self.Background:SetDesaturated(true)
			self.Border:SetDesaturated(true)
			self.Background:SetVertexColor(vcbClassColorFocus:GetRGB())
			self.Border:SetVertexColor(vcbClassColorFocus:GetRGB())
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
	if VCBsettings.Focus.StatusBar.Style == "Default" then
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
	if VCBsettings.Focus.Border.Style == "Default" then
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
	vcbFocusCastbar.shieldSpellLeft:ClearAllPoints()
	vcbFocusCastbar.shieldSpellLeft:SetPoint("TOPRIGHT", vcbFocusCastbar, "TOPLEFT", 2, shieldY)
	vcbFocusCastbar.shieldSpellLeft:SetSize(shieldW, shieldH)
	vcbFocusCastbar.shieldSpellRight:ClearAllPoints()
	vcbFocusCastbar.shieldSpellRight:SetPoint("TOPLEFT", vcbFocusCastbar, "TOPRIGHT", -2, shieldY)
	vcbFocusCastbar.shieldSpellRight:SetSize(shieldW, shieldH)
	vcbFocusCastbar.iconSpellLeft:ClearAllPoints()
	vcbFocusCastbar.iconSpellLeft:SetPoint("CENTER", vcbFocusCastbar.shieldSpellLeft, "CENTER", 1, iconY)
	vcbFocusCastbar.iconSpellLeft:SetSize(iconH, iconH)
	vcbFocusCastbar.iconSpellRight:ClearAllPoints()
	vcbFocusCastbar.iconSpellRight:SetPoint("CENTER", vcbFocusCastbar.shieldSpellRight, "CENTER", -1, iconY)
	vcbFocusCastbar.iconSpellRight:SetSize(iconH, iconH)
	local borderH = VCBsettings.Focus.Size.Height/2
	vcbFocusCastbar.TextBorderTop:ClearAllPoints()
	vcbFocusCastbar.TextBorderTop:SetPoint("BOTTOMLEFT", vcbFocusCastbar, "TOPLEFT", 0, -borderH)
	vcbFocusCastbar.TextBorderTop:SetPoint("BOTTOMRIGHT", vcbFocusCastbar, "TOPRIGHT", 0, -borderH)
	vcbFocusCastbar.TextBorderTop:SetHeight(12+borderH)
	vcbFocusCastbar.TextBorderBottom:ClearAllPoints()
	vcbFocusCastbar.TextBorderBottom:SetPoint("TOPLEFT", vcbFocusCastbar, "BOTTOMLEFT", 0, borderH)
	vcbFocusCastbar.TextBorderBottom:SetPoint("TOPRIGHT", vcbFocusCastbar, "BOTTOMRIGHT", 0, borderH)
	vcbFocusCastbar.TextBorderBottom:SetHeight(12+borderH)
	local sparkH = VCBsettings.Focus.Size.Height*1.6
	vcbFocusCastbar.Spark:SetSize(6, sparkH)
	vcbFocusCastbar.UninterruptableSpark:SetSize(6, sparkH)
end
-- =========================
-- locked & unlocked
-- =========================
-- locked
local function barIsLocked()
-- hook part 1
	FocusFrameSpellBar:HookScript("OnShow", function(self)
		self.textName:SetWidth(self:GetWidth() - 8)
		iconPosition(self)
		namePosition(self)
		currentPostion(self)
		bothPostion(self)
		totalPostion(self)
		borderStyle(self)
		borderColor(self)
		bordertextPosition(self)
	end)
-- hook part 2
	FocusFrameSpellBar:HookScript("OnUpdate", function(self)
		self.TextBorder:SetAlpha(0)
		self.Text:SetAlpha(0)
		self.BorderShield:SetAlpha(0)
		self.Icon:SetAlpha(0)
		if Duration then
			self.textName:SetText(self.Text:GetText())
			self.iconSpellLeft:SetTexture(self.Icon:GetTextureFileID())
			self.iconSpellRight:SetTexture(self.Icon:GetTextureFileID())
			shieldPosition(uninterruptible, self)
			if interrupted then
				self.textCurrent:SetText("-")
				self.textBoth:SetText("- / -")
				self.textTotal:SetText("-")
			else
				currentUpdate(self)
				bothUpdate(self)
				totalUpdate(self)
			end
			self.Spark:SetAlphaFromBoolean(uninterruptible, 0, 255)
			self:GetStatusBarTexture():SetAlphaFromBoolean(uninterruptible, 0, 255)
			self.Uninterruptable:SetAlphaFromBoolean(uninterruptible, 255, 0)
			self.UninterruptableSpark:SetAlphaFromBoolean(uninterruptible, 255, 0)
			self.UninterruptableSpark:ClearAllPoints()
			self.UninterruptableSpark:SetPoint("CENTER", self:GetStatusBarTexture(), "RIGHT")
			if tradeSkill then defaultColor(self) else statusbarColor(self) end
			statusbarStyle(self)
		end
	end)
end
-- unlocked
local function barIsUnlocked()
-- hook part 1
	vcbFocusCastbar:HookScript("OnShow", function(self)
		self.textName:SetWidth(self:GetWidth() - 8)
		iconPosition(self)
		namePosition(self)
		currentPostion(self)
		bothPostion(self)
		totalPostion(self)
		borderStyle(self)
		borderColor(self)
		bordertextPosition(self)
	end)
-- hook part 2
	vcbFocusCastbar:HookScript("OnUpdate", function(self)
		if Duration then
			self.Spark:ClearAllPoints()
			self.Spark:SetPoint("CENTER", self:GetStatusBarTexture(), "RIGHT")
			self.UninterruptableSpark:ClearAllPoints()
			self.UninterruptableSpark:SetPoint("CENTER", self:GetStatusBarTexture(), "RIGHT")
			self.textName:SetText(self.Text:GetText())
			self.iconSpellLeft:SetTexture(self.Icon:GetTextureFileID())
			self.iconSpellRight:SetTexture(self.Icon:GetTextureFileID())
			shieldPosition(uninterruptible, self)
			if interrupted then
				self.textCurrent:SetText("-")
				self.textBoth:SetText("- / -")
				self.textTotal:SetText("-")
			else
				currentUpdate(self)
				bothUpdate(self)
				totalUpdate(self)
			end
			if tradeSkill then defaultColor(self) else statusbarColor(self) end
			statusbarStyle(self)
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
		if VCBsettings.Focus.Lock then
			createTextures()
			createTexts()
			barIsLocked()
		else
			createBar()
			VDW.VCB.FocusCastbarPosition()
			VDW.VCB.FocusCastbarSize()
			barIsUnlocked()
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
	elseif event == "PLAYER_FOCUS_CHANGED" then
		if not VCBsettings.Focus.Lock then vcbFocusCastbar:Hide() end
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
				if not VCBsettings.Focus.Lock then barIsCasting(castSpellID) end
			elseif chanName and numStages == 0 then
				Duration = UnitChannelDuration(UNIT)
				uninterruptible = chanNotInterruptible
				castBar = "Channel"
				tradeSkill = chanIsTradeSkill
				if not VCBsettings.Focus.Lock then barIsChanneling(chanSpellID) end
			elseif chanName and numStages > 0 then
				Duration = UnitEmpoweredChannelDuration(UNIT, true)
				uninterruptible = chanNotInterruptible
				castBar = "Empower"
				tradeSkill = chanIsTradeSkill
				if not VCBsettings.Focus.Lock then barIsEmpowering(chanSpellID) end
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
			if not VCBsettings.Focus.Lock then barIsCasting(arg3) end
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
			if not VCBsettings.Focus.Lock then barIsChanneling(arg3) end
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
			if not VCBsettings.Focus.Lock then barIsEmpowering(arg3) end
		end
	elseif event == "UNIT_SPELLCAST_INTERRUPTED" and arg1 == UNIT then
		interrupted = true
		interruptedBy = arg4
	elseif event == "UNIT_SPELLCAST_FAILED" and arg1 == UNIT then
		failed = true
	elseif event == "UNIT_SPELLCAST_CHANNEL_STOP"and arg1 == UNIT then
		interruptedBy = arg4
		if not VCBsettings.Focus.Lock then barChannelStop() end
	elseif event == "UNIT_SPELLCAST_EMPOWER_STOP" and arg1 == UNIT then
		interruptedBy = arg5
		if not VCBsettings.Focus.Lock then barEmpowerStop() end
	elseif event == "UNIT_SPELLCAST_STOP" and arg1 == UNIT then
		if not VCBsettings.Focus.Lock then barCastStop() end
	end
end
vcbZlave:HookScript("OnEvent", EventsTime)
