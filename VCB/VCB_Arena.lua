-- some variables
local G = VDW.Local.Override
local jailerColor = CreateColorFromRGBAHexString("0A979CFF")
-- extra objects on bar
local function createExtras()
	for i = 1, 3, 1 do
-- icon spell left
		_G["CompactArenaFrameMember"..i].CastingBarFrame.iconSpellLeft = _G["CompactArenaFrameMember"..i].CastingBarFrame:CreateTexture(nil, "ARTWORK", nil, 0)
		_G["CompactArenaFrameMember"..i].CastingBarFrame.iconSpellLeft:SetPoint("RIGHT", _G["CompactArenaFrameMember"..i].CastingBarFrame, "LEFT", -2, -5)
		_G["CompactArenaFrameMember"..i].CastingBarFrame.iconSpellLeft:SetSize(20, 20)
-- icon spell right
		_G["CompactArenaFrameMember"..i].CastingBarFrame.iconSpellRight = _G["CompactArenaFrameMember"..i].CastingBarFrame:CreateTexture(nil, "ARTWORK", nil, 0)
		_G["CompactArenaFrameMember"..i].CastingBarFrame.iconSpellRight:SetPoint("LEFT", _G["CompactArenaFrameMember"..i].CastingBarFrame, "RIGHT", 4, -5)
		_G["CompactArenaFrameMember"..i].CastingBarFrame.iconSpellRight:SetSize(20, 20)
-- shield icon left
		_G["CompactArenaFrameMember"..i].CastingBarFrame.shieldSpellLeft = _G["CompactArenaFrameMember"..i].CastingBarFrame:CreateTexture(nil, "BACKGROUND", nil, 0)
		_G["CompactArenaFrameMember"..i].CastingBarFrame.shieldSpellLeft:SetPoint("TOPLEFT", -27, 4)
		_G["CompactArenaFrameMember"..i].CastingBarFrame.shieldSpellLeft:SetSize(29, 33)
		_G["CompactArenaFrameMember"..i].CastingBarFrame.shieldSpellLeft:SetAtlas("ui-castingbar-shield")
-- shield icon right
		_G["CompactArenaFrameMember"..i].CastingBarFrame.shieldSpellRight = _G["CompactArenaFrameMember"..i].CastingBarFrame:CreateTexture(nil, "BACKGROUND", nil, 0)
		_G["CompactArenaFrameMember"..i].CastingBarFrame.shieldSpellRight:SetPoint("TOPRIGHT", 27, 4)
		_G["CompactArenaFrameMember"..i].CastingBarFrame.shieldSpellRight:SetSize(29, 33)
		_G["CompactArenaFrameMember"..i].CastingBarFrame.shieldSpellRight:SetAtlas("ui-castingbar-shield")
-- text border Top
		_G["CompactArenaFrameMember"..i].CastingBarFrame.TextBorderTop = _G["CompactArenaFrameMember"..i].CastingBarFrame:CreateTexture(nil, "BACKGROUND", nil, -7)
		_G["CompactArenaFrameMember"..i].CastingBarFrame.TextBorderTop:SetPoint("TOPLEFT", 0, 12)
		_G["CompactArenaFrameMember"..i].CastingBarFrame.TextBorderTop:SetPoint("BOTTOMRIGHT", 0, 0)
		_G["CompactArenaFrameMember"..i].CastingBarFrame.TextBorderTop:SetAtlas("ui-castingbar-textbox")
		_G["CompactArenaFrameMember"..i].CastingBarFrame.TextBorderTop:SetAlpha(0.38)
-- text border Bottom
		_G["CompactArenaFrameMember"..i].CastingBarFrame.TextBorderBottom = _G["CompactArenaFrameMember"..i].CastingBarFrame:CreateTexture(nil, "BACKGROUND", nil, -7)
		_G["CompactArenaFrameMember"..i].CastingBarFrame.TextBorderBottom:SetPoint("TOPLEFT", 0, 0)
		_G["CompactArenaFrameMember"..i].CastingBarFrame.TextBorderBottom:SetPoint("BOTTOMRIGHT", 0, -12)
		_G["CompactArenaFrameMember"..i].CastingBarFrame.TextBorderBottom:SetAtlas("ui-castingbar-textbox")
		_G["CompactArenaFrameMember"..i].CastingBarFrame.TextBorderBottom:SetAlpha(0.38)
-- name text
		_G["CompactArenaFrameMember"..i].CastingBarFrame.textName = _G["CompactArenaFrameMember"..i].CastingBarFrame:CreateFontString(nil, "OVERLAY", nil)
		_G["CompactArenaFrameMember"..i].CastingBarFrame.textName:SetFontObject("GameFontHighlightSmall")
-- current text
		_G["CompactArenaFrameMember"..i].CastingBarFrame.textCurrent = _G["CompactArenaFrameMember"..i].CastingBarFrame:CreateFontString(nil, "OVERLAY", nil)
		_G["CompactArenaFrameMember"..i].CastingBarFrame.textCurrent:SetFontObject("GameFontHighlightSmall")
-- both text
		_G["CompactArenaFrameMember"..i].CastingBarFrame.textBoth = _G["CompactArenaFrameMember"..i].CastingBarFrame:CreateFontString(nil, "OVERLAY", nil)
		_G["CompactArenaFrameMember"..i].CastingBarFrame.textBoth:SetFontObject("GameFontHighlightSmall")
-- total text
		_G["CompactArenaFrameMember"..i].CastingBarFrame.textTotal = _G["CompactArenaFrameMember"..i].CastingBarFrame:CreateFontString(nil, "OVERLAY", nil)
		_G["CompactArenaFrameMember"..i].CastingBarFrame.textTotal:SetFontObject("GameFontHighlightSmall")
	end
end
-- functions OnUpdate and OnShow
-- icon position
local function iconPosition(self)
	print("iconPosition is not Working!")
end
-- shield icon position
local function shieldPosition(uninterruptible, self)
	print("shieldPosition is not Working!")
end
-- text border position
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
local function bothPostion(self)
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
-- checking position functions
-- check icon position
function VDW.VCB.chkArenaIconPosition()
	if VCBsettings.Arena.Icon.Position == "Hide" then
		function iconPosition(self)
			if self.iconSpellLeft:IsShown() then self.iconSpellLeft:Hide() end
			if self.iconSpellRight:IsShown() then self.iconSpellRight:Hide() end
		end
	elseif VCBsettings.Arena.Icon.Position == "Left" then
		function iconPosition(self)
			if not self.iconSpellLeft:IsShown() then self.iconSpellLeft:Show() end
			if self.iconSpellRight:IsShown() then self.iconSpellRight:Hide() end
		end
	elseif VCBsettings.Arena.Icon.Position == "Right" then
		function iconPosition(self)
			if self.iconSpellLeft:IsShown() then self.iconSpellLeft:Hide() end
			if not self.iconSpellRight:IsShown() then self.iconSpellRight:Show() end
		end
	elseif VCBsettings.Arena.Icon.Position == "Both" then	
		function iconPosition(self)
			if not self.iconSpellLeft:IsShown() then self.iconSpellLeft:Show() end
			if not self.iconSpellRight:IsShown() then self.iconSpellRight:Show() end
		end
	end
end
-- check shield position
function VDW.VCB.chkArenaShieldPosition()
	if VCBsettings.Arena.Shield.Position == "Hide" then
		function shieldPosition(uninterruptible, self)
			self.shieldSpellLeft:SetAlpha(0)
			self.shieldSpellRight:SetAlpha(0)
		end
	elseif VCBsettings.Arena.Shield.Position == "Left" then
		function shieldPosition(uninterruptible, self)
			self.shieldSpellLeft:SetAlphaFromBoolean(uninterruptible, 255, 0)
			self.shieldSpellRight:SetAlpha(0)
		end
	elseif VCBsettings.Arena.Shield.Position == "Right" then
		function shieldPosition(uninterruptible, self)
			self.shieldSpellLeft:SetAlpha(0)
			self.shieldSpellRight:SetAlphaFromBoolean(uninterruptible, 255, 0)
		end
	elseif VCBsettings.Arena.Shield.Position == "Both" then
		function shieldPosition(uninterruptible, self)
			self.shieldSpellLeft:SetAlphaFromBoolean(uninterruptible, 255, 0)
			self.shieldSpellRight:SetAlphaFromBoolean(uninterruptible, 255, 0)
		end
	end
end
-- check text border position
function VDW.VCB.chkArenaBorderTextPosition()
	if VCBsettings.Arena.BorderText.Position == "Hide" then
		function bordertextPosition(self)
			self.TextBorderTop:Hide()
			self.TextBorderBottom:Hide()
		end
	elseif VCBsettings.Arena.BorderText.Position == "Top" then
		function bordertextPosition(self)
			self.TextBorderTop:Show()
			self.TextBorderBottom:Hide()
		end
	elseif VCBsettings.Arena.BorderText.Position == "Bottom" then
		function bordertextPosition(self)
			self.TextBorderTop:Hide()
			self.TextBorderBottom:Show()
		end
	elseif VCBsettings.Arena.BorderText.Position == "Both" then
		function bordertextPosition(self)
			self.TextBorderTop:Show()
			self.TextBorderBottom:Show()
		end
	end
end
-- check name text position
function VDW.VCB.chkNameTxtArena()
	if VCBsettings.Arena.NameText.Position == "Hide" then
		function namePosition(self)
			if self.textName:IsShown() then self.textName:Hide() end
		end
	elseif VCBsettings.Arena.NameText.Position == "TopLeft" then
		function namePosition(self)
			self.textName:ClearAllPoints()
			self.textName:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 4, 1)
			self.textName:SetJustifyH("LEFT")
			if not self.textName:IsShown() then self.textName:Show() end
		end
	elseif VCBsettings.Arena.NameText.Position == "Left" then
		function namePosition(self)
			self.textName:ClearAllPoints()
			self.textName:SetPoint("LEFT", self, "LEFT", 4, 0)
			self.textName:SetJustifyH("LEFT")
			if not self.textName:IsShown() then self.textName:Show() end
		end
	elseif VCBsettings.Arena.NameText.Position == "BottomLeft" then
		function namePosition(self)
			self.textName:ClearAllPoints()
			self.textName:SetPoint("TOPLEFT", self, "BOTTOMLEFT", 4, -1)
			self.textName:SetJustifyH("LEFT")
			if not self.textName:IsShown() then self.textName:Show() end
		end
	elseif VCBsettings.Arena.NameText.Position == "Top" then
		function namePosition(self)
			self.textName:ClearAllPoints()
			self.textName:SetPoint("BOTTOM", self, "TOP", 0, 1)
			self.textName:SetJustifyH("CENTER")
			if not self.textName:IsShown() then self.textName:Show() end
			end
	elseif VCBsettings.Arena.NameText.Position == "Center" then
		function namePosition(self)
			self.textName:ClearAllPoints()
			self.textName:SetPoint("CENTER", self, "CENTER", 0, 0)
			self.textName:SetJustifyH("CENTER")
			if not self.textName:IsShown() then self.textName:Show() end
			end
	elseif VCBsettings.Arena.NameText.Position == "Bottom" then
		function namePosition(self)
			self.textName:ClearAllPoints()
			self.textName:SetPoint("TOP", self, "BOTTOM", 0, -1)
			self.textName:SetJustifyH("CENTER")
			if not self.textName:IsShown() then self.textName:Show() end
		end
	elseif VCBsettings.Arena.NameText.Position == "TopRight" then
		function namePosition(self)
			self.textName:ClearAllPoints()
			self.textName:SetPoint("BOTTOMRIGHT", self, "TOPRIGHT", -4, 1)
			self.textName:SetJustifyH("RIGHT")
			if not self.textName:IsShown() then self.textName:Show() end
		end
	elseif VCBsettings.Arena.NameText.Position == "Right" then
		function namePosition(self)
			self.textName:ClearAllPoints()
			self.textName:SetPoint("RIGHT", self, "RIGHT", -4, 0)
			self.textName:SetJustifyH("RIGHT")
			if not self.textName:IsShown() then self.textName:Show() end
		end
	elseif VCBsettings.Arena.NameText.Position == "BottomRight" then
		function namePosition(self)
			self.textName:ClearAllPoints()
			self.textName:SetPoint("TOPRIGHT", self, "BOTTOMRIGHT", -4, -1)
			self.textName:SetJustifyH("RIGHT")
			if not self.textName:IsShown() then self.textName:Show() end
		end
	end
end
-- check current casting time text position
function VDW.VCB.chkCurrentTxtArena()
	if VCBsettings.Arena.CurrentTimeText.Position == "Hide" then
		function currentPostion(self)
			if self.textCurrent:IsShown() then self.textCurrent:Hide() end
		end
	elseif VCBsettings.Arena.CurrentTimeText.Position == "TopLeft" then
		function currentPostion(self)
			self.textCurrent:ClearAllPoints()
			self.textCurrent:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 4, 1)
			if not self.textCurrent:IsShown() then self.textCurrent:Show() end
		end
	elseif VCBsettings.Arena.CurrentTimeText.Position == "Left" then
		function currentPostion(self)
			self.textCurrent:ClearAllPoints()
			self.textCurrent:SetPoint("LEFT", self, "LEFT", 4, 0)
			if not self.textCurrent:IsShown() then self.textCurrent:Show() end
		end
	elseif VCBsettings.Arena.CurrentTimeText.Position == "BottomLeft" then
		function currentPostion(self)
			self.textCurrent:ClearAllPoints()
			self.textCurrent:SetPoint("TOPLEFT", self, "BOTTOMLEFT", 4, -1)
			if not self.textCurrent:IsShown() then self.textCurrent:Show() end
		end
	elseif VCBsettings.Arena.CurrentTimeText.Position == "Top" then
		function currentPostion(self)
			self.textCurrent:ClearAllPoints()
			self.textCurrent:SetPoint("BOTTOM", self, "TOP", 0, 1)
			if not self.textCurrent:IsShown() then self.textCurrent:Show() end
		end
	elseif VCBsettings.Arena.CurrentTimeText.Position == "Center" then
		function currentPostion(self)
			self.textCurrent:ClearAllPoints()
			self.textCurrent:SetPoint("CENTER", self, "CENTER", 0, 0)
			if not self.textCurrent:IsShown() then self.textCurrent:Show() end
		end
	elseif VCBsettings.Arena.CurrentTimeText.Position == "Bottom" then
		function currentPostion(self)
			self.textCurrent:ClearAllPoints()
			self.textCurrent:SetPoint("TOP", self, "BOTTOM", 0, -1)
			if not self.textCurrent:IsShown() then self.textCurrent:Show() end
		end
	elseif VCBsettings.Arena.CurrentTimeText.Position == "TopRight" then
		function currentPostion(self)
			self.textCurrent:ClearAllPoints()
			self.textCurrent:SetPoint("BOTTOMRIGHT", self, "TOPRIGHT", -4, 1)
			if not self.textCurrent:IsShown() then self.textCurrent:Show() end
		end
	elseif VCBsettings.Arena.CurrentTimeText.Position == "Right" then
		function currentPostion(self)
			self.textCurrent:ClearAllPoints()
			self.textCurrent:SetPoint("RIGHT", self, "RIGHT", -4, 0)
			if not self.textCurrent:IsShown() then self.textCurrent:Show() end
		end
	elseif VCBsettings.Arena.CurrentTimeText.Position == "BottomRight" then
		function currentPostion(self)
			self.textCurrent:ClearAllPoints()
			self.textCurrent:SetPoint("TOPRIGHT", self, "BOTTOMRIGHT", -4, -1)
			if not self.textCurrent:IsShown() then self.textCurrent:Show() end
		end
	end
end
-- check both casting time text position
function VDW.VCB.chkBothTxtArena()
	if VCBsettings.Arena.BothTimeText.Position == "Hide" then
		function bothPostion(self)
			if self.textBoth:IsShown() then self.textBoth:Hide() end
		end
	elseif VCBsettings.Arena.BothTimeText.Position == "TopLeft" then
		function bothPostion(self)
			self.textBoth:ClearAllPoints()
			self.textBoth:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 4, 1)
			if not self.textBoth:IsShown() then self.textBoth:Show() end
		end
	elseif VCBsettings.Arena.BothTimeText.Position == "Left" then
		function bothPostion(self)
			self.textBoth:ClearAllPoints()
			self.textBoth:SetPoint("LEFT", self, "LEFT", 4, 0)
			if not self.textBoth:IsShown() then self.textBoth:Show() end
		end
	elseif VCBsettings.Arena.BothTimeText.Position == "BottomLeft" then
		function bothPostion(self)
			self.textBoth:ClearAllPoints()
			self.textBoth:SetPoint("TOPLEFT", self, "BOTTOMLEFT", 4, -1)
			if not self.textBoth:IsShown() then self.textBoth:Show() end
		end
	elseif VCBsettings.Arena.BothTimeText.Position == "Top" then
		function bothPostion(self)
			self.textBoth:ClearAllPoints()
			self.textBoth:SetPoint("BOTTOM", self, "TOP", 0, 1)
			if not self.textBoth:IsShown() then self.textBoth:Show() end
		end
	elseif VCBsettings.Arena.BothTimeText.Position == "Center" then
		function bothPostion(self)
			self.textBoth:ClearAllPoints()
			self.textBoth:SetPoint("CENTER", self, "CENTER", 0, 0)
			if not self.textBoth:IsShown() then self.textBoth:Show() end
		end
	elseif VCBsettings.Arena.BothTimeText.Position == "Bottom" then
		function bothPostion(self)
			self.textBoth:ClearAllPoints()
			self.textBoth:SetPoint("TOP", self, "BOTTOM", 0, -1)
			if not self.textBoth:IsShown() then self.textBoth:Show() end
		end
	elseif VCBsettings.Arena.BothTimeText.Position == "TopRight" then
		function bothPostion(self)
			self.textBoth:ClearAllPoints()
			self.textBoth:SetPoint("BOTTOMRIGHT", self, "TOPRIGHT", -4, 1)
			if not self.textBoth:IsShown() then self.textBoth:Show() end
		end
	elseif VCBsettings.Arena.BothTimeText.Position == "Right" then
		function bothPostion(self)
			self.textBoth:ClearAllPoints()
			self.textBoth:SetPoint("RIGHT", self, "RIGHT", -4, 0)
			if not self.textBoth:IsShown() then self.textBoth:Show() end
		end
	elseif VCBsettings.Arena.BothTimeText.Position == "BottomRight" then
		function bothPostion(self)
			self.textBoth:ClearAllPoints()
			self.textBoth:SetPoint("TOPRIGHT", self, "BOTTOMRIGHT", -4, -1)
			if not self.textBoth:IsShown() then self.textBoth:Show() end
		end
	end
end
-- check total casting time text position
function VDW.VCB.chkTotalTxtArena()
	if VCBsettings.Arena.TotalTimeText.Position == "Hide" then
		function bothPostion(self)
			if self.textTotal:IsShown() then self.textTotal:Hide() end
		end
	elseif VCBsettings.Arena.TotalTimeText.Position == "TopLeft" then
		function bothPostion(self)
			self.textTotal:ClearAllPoints()
			self.textTotal:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 4, 1)
			if not self.textTotal:IsShown() then self.textTotal:Show() end
		end
	elseif VCBsettings.Arena.TotalTimeText.Position == "Left" then
		function bothPostion(self)
			self.textTotal:ClearAllPoints()
			self.textTotal:SetPoint("LEFT", self, "LEFT", 4, 0)
			if not self.textTotal:IsShown() then self.textTotal:Show() end
		end
	elseif VCBsettings.Arena.TotalTimeText.Position == "BottomLeft" then
		function bothPostion(self)
			self.textTotal:ClearAllPoints()
			self.textTotal:SetPoint("TOPLEFT", self, "BOTTOMLEFT", 4, -1)
			if not self.textTotal:IsShown() then self.textTotal:Show() end
		end
	elseif VCBsettings.Arena.TotalTimeText.Position == "Top" then
		function bothPostion(self)
			self.textTotal:ClearAllPoints()
			self.textTotal:SetPoint("BOTTOM", self, "TOP", 0, 1)
			if not self.textTotal:IsShown() then self.textTotal:Show() end
		end
	elseif VCBsettings.Arena.TotalTimeText.Position == "Center" then
		function bothPostion(self)
			self.textTotal:ClearAllPoints()
			self.textTotal:SetPoint("CENTER", self, "CENTER", 0, 0)
			if not self.textTotal:IsShown() then self.textTotal:Show() end
		end
	elseif VCBsettings.Arena.TotalTimeText.Position == "Bottom" then
		function bothPostion(self)
			self.textTotal:ClearAllPoints()
			self.textTotal:SetPoint("TOP", self, "BOTTOM", 0, -1)
			if not self.textTotal:IsShown() then self.textTotal:Show() end
		end
	elseif VCBsettings.Arena.TotalTimeText.Position == "TopRight" then
		function bothPostion(self)
			self.textTotal:ClearAllPoints()
			self.textTotal:SetPoint("BOTTOMRIGHT", self, "TOPRIGHT", -4, 1)
			if not self.textTotal:IsShown() then self.textTotal:Show() end
		end
	elseif VCBsettings.Arena.TotalTimeText.Position == "Right" then
		function bothPostion(self)
			self.textTotal:ClearAllPoints()
			self.textTotal:SetPoint("RIGHT", self, "RIGHT", -4, 0)
			if not self.textTotal:IsShown() then self.textTotal:Show() end
		end
	elseif VCBsettings.Arena.TotalTimeText.Position == "BottomRight" then
		function bothPostion(self)
			self.textTotal:ClearAllPoints()
			self.textTotal:SetPoint("TOPRIGHT", self, "BOTTOMRIGHT", -4, -1)
			if not self.textTotal:IsShown() then self.textTotal:Show() end
		end
	end
end
-- checking update functions
-- check current time update
function VDW.VCB.chkCurrentUpdArena()
	if VCBsettings.Arena.CurrentTimeText.Position ~= "Hide" then
		if VCBsettings.Arena.CurrentTimeText.Sec == "Hide" then
			if VCBsettings.Arena.CurrentTimeText.Decimals == "0" then
				if VCBsettings.Arena.CurrentTimeText.Direction == "Ascending" then
					function currentUpdate(self, i)
						self.textCurrent:SetText(string.format("%.0f", VDW.VCB["ArenaDuration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Arena.CurrentTimeText.Direction == "Descending" then
					function currentUpdate(self, i)
						self.textCurrent:SetText(string.format("%.0f", VDW.VCB["ArenaDuration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Arena.CurrentTimeText.Direction == "Both" then
					function currentUpdate(self, i)
						if VDW.VCB["ArenaCastbar"..i] == "Cast" or VDW.VCB["ArenaCastbar"..i] == "Empower" then
							self.textCurrent:SetText(string.format("%.0f", VDW.VCB["ArenaDuration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
						elseif VDW.VCB["ArenaCastbar"..i] == "Channel" then
							self.textCurrent:SetText(string.format("%.0f", VDW.VCB["ArenaDuration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			elseif VCBsettings.Arena.CurrentTimeText.Decimals == "1" then
				if VCBsettings.Arena.CurrentTimeText.Direction == "Ascending" then
					function currentUpdate(self, i)
						self.textCurrent:SetText(string.format("%.1f", VDW.VCB["ArenaDuration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Arena.CurrentTimeText.Direction == "Descending" then
					function currentUpdate(self, i)
						self.textCurrent:SetText(string.format("%.1f", VDW.VCB["ArenaDuration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Arena.CurrentTimeText.Direction == "Both" then
					function currentUpdate(self, i)
						if VDW.VCB["ArenaCastbar"..i] == "Cast" or VDW.VCB["ArenaCastbar"..i] == "Empower" then
							self.textCurrent:SetText(string.format("%.1f", VDW.VCB["ArenaDuration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
						elseif VDW.VCB["ArenaCastbar"..i] == "Channel" then
							self.textCurrent:SetText(string.format("%.1f", VDW.VCB["ArenaDuration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			elseif VCBsettings.Arena.CurrentTimeText.Decimals == "2" then
				if VCBsettings.Arena.CurrentTimeText.Direction == "Ascending" then
					function currentUpdate(self, i)
						self.textCurrent:SetText(string.format("%.2f", VDW.VCB["ArenaDuration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Arena.CurrentTimeText.Direction == "Descending" then
					function currentUpdate(self, i)
						self.textCurrent:SetText(string.format("%.2f", VDW.VCB["ArenaDuration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Arena.CurrentTimeText.Direction == "Both" then
					function currentUpdate(self, i)
						if VDW.VCB["ArenaCastbar"..i] == "Cast" or VDW.VCB["ArenaCastbar"..i] == "Empower" then
							self.textCurrent:SetText(string.format("%.2f", VDW.VCB["ArenaDuration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
						elseif VDW.VCB["ArenaCastbar"..i] == "Channel" then
							self.textCurrent:SetText(string.format("%.2f", VDW.VCB["ArenaDuration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			elseif VCBsettings.Arena.CurrentTimeText.Decimals == "3" then
				if VCBsettings.Arena.CurrentTimeText.Direction == "Ascending" then
					function currentUpdate(self, i)
						self.textCurrent:SetText(string.format("%.3f", VDW.VCB["ArenaDuration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Arena.CurrentTimeText.Direction == "Descending" then
					function currentUpdate(self, i)
						self.textCurrent:SetText(string.format("%.3f", VDW.VCB["ArenaDuration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Arena.CurrentTimeText.Direction == "Both" then
					function currentUpdate(self, i)
						if VDW.VCB["ArenaCastbar"..i] == "Cast" or VDW.VCB["ArenaCastbar"..i] == "Empower" then
							self.textCurrent:SetText(string.format("%.3f", VDW.VCB["ArenaDuration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
						elseif VDW.VCB["ArenaCastbar"..i] == "Channel" then
							self.textCurrent:SetText(string.format("%.3f", VDW.VCB["ArenaDuration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			end
		elseif VCBsettings.Arena.CurrentTimeText.Sec == "Show" then
			if VCBsettings.Arena.CurrentTimeText.Decimals == "0" then
				if VCBsettings.Arena.CurrentTimeText.Direction == "Ascending" then
					function currentUpdate(self, i)
						self.textCurrent:SetText(string.format("%.0f Sec", VDW.VCB["ArenaDuration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Arena.CurrentTimeText.Direction == "Descending" then
					function currentUpdate(self, i)
						self.textCurrent:SetText(string.format("%.0f Sec", VDW.VCB["ArenaDuration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Arena.CurrentTimeText.Direction == "Both" then
					function currentUpdate(self, i)
						if VDW.VCB["ArenaCastbar"..i] == "Cast" or VDW.VCB["ArenaCastbar"..i] == "Empower" then
							self.textCurrent:SetText(string.format("%.0f Sec", VDW.VCB["ArenaDuration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
						elseif VDW.VCB["ArenaCastbar"..i] == "Channel" then
							self.textCurrent:SetText(string.format("%.0f Sec", VDW.VCB["ArenaDuration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			elseif VCBsettings.Arena.CurrentTimeText.Decimals == "1" then
				if VCBsettings.Arena.CurrentTimeText.Direction == "Ascending" then
					function currentUpdate(self, i)
						self.textCurrent:SetText(string.format("%.1f Sec", VDW.VCB["ArenaDuration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Arena.CurrentTimeText.Direction == "Descending" then
					function currentUpdate(self, i)
						self.textCurrent:SetText(string.format("%.1f Sec", VDW.VCB["ArenaDuration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Arena.CurrentTimeText.Direction == "Both" then
					function currentUpdate(self, i)
						if VDW.VCB["ArenaCastbar"..i] == "Cast" or VDW.VCB["ArenaCastbar"..i] == "Empower" then
							self.textCurrent:SetText(string.format("%.1f Sec", VDW.VCB["ArenaDuration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
						elseif VDW.VCB["ArenaCastbar"..i] == "Channel" then
							self.textCurrent:SetText(string.format("%.1f Sec", VDW.VCB["ArenaDuration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			elseif VCBsettings.Arena.CurrentTimeText.Decimals == "2" then
				if VCBsettings.Arena.CurrentTimeText.Direction == "Ascending" then
					function currentUpdate(self, i)
						self.textCurrent:SetText(string.format("%.2f Sec", VDW.VCB["ArenaDuration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Arena.CurrentTimeText.Direction == "Descending" then
					function currentUpdate(self, i)
						self.textCurrent:SetText(string.format("%.2f Sec", VDW.VCB["ArenaDuration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Arena.CurrentTimeText.Direction == "Both" then
					function currentUpdate(self, i)
						if VDW.VCB["ArenaCastbar"..i] == "Cast" or VDW.VCB["ArenaCastbar"..i] == "Empower" then
							self.textCurrent:SetText(string.format("%.2f Sec", VDW.VCB["ArenaDuration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
						elseif VDW.VCB["ArenaCastbar"..i] == "Channel" then
							self.textCurrent:SetText(string.format("%.2f Sec", VDW.VCB["ArenaDuration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			elseif VCBsettings.Arena.CurrentTimeText.Decimals == "3" then
				if VCBsettings.Arena.CurrentTimeText.Direction == "Ascending" then
					function currentUpdate(self, i)
						self.textCurrent:SetText(string.format("%.3f Sec", VDW.VCB["ArenaDuration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Arena.CurrentTimeText.Direction == "Descending" then
					function currentUpdate(self, i)
						self.textCurrent:SetText(string.format("%.3f Sec", VDW.VCB["ArenaDuration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Arena.CurrentTimeText.Direction == "Both" then
					function currentUpdate(self, i)
						if VDW.VCB["ArenaCastbar"..i] == "Cast" or VDW.VCB["ArenaCastbar"..i] == "Empower" then
							self.textCurrent:SetText(string.format("%.3f Sec", VDW.VCB["ArenaDuration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
						elseif VDW.VCB["ArenaCastbar"..i] == "Channel" then
							self.textCurrent:SetText(string.format("%.3f Sec", VDW.VCB["ArenaDuration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			end
		end
	elseif VCBsettings.Arena.CurrentTimeText.Position == "Hide" then
		function currentUpdate(self, i)
			return
		end
	end
end
-- check both time update
function VDW.VCB.chkBothUpdArena()
	if VCBsettings.Arena.BothTimeText.Position ~= "Hide" then
		if VCBsettings.Arena.BothTimeText.Sec == "Hide" then
			if VCBsettings.Arena.BothTimeText.Decimals == "0" then
				if VCBsettings.Arena.BothTimeText.Direction == "Ascending" then
					function bothUpdate(self, i)
						self.textBoth:SetText(string.format("%.0f / %.0f", VDW.VCB["ArenaDuration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), VDW.VCB["ArenaDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Arena.BothTimeText.Direction == "Descending" then
					function bothUpdate(self, i)
						self.textBoth:SetText(string.format("%.0f / %.0f", VDW.VCB["ArenaDuration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), VDW.VCB["ArenaDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Arena.BothTimeText.Direction == "Both" then
					function bothUpdate(self, i)
						if VDW.VCB["ArenaCastbar"..i] == "Cast" or VDW.VCB["ArenaCastbar"..i] == "Empower" then
							self.textBoth:SetText(string.format("%.0f / %.0f", VDW.VCB["ArenaDuration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), VDW.VCB["ArenaDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						elseif VDW.VCB["ArenaCastbar"..i] == "Channel" then
							self.textBoth:SetText(string.format("%.0f / %.0f", VDW.VCB["ArenaDuration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), VDW.VCB["ArenaDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			elseif VCBsettings.Arena.BothTimeText.Decimals == "1" then
				if VCBsettings.Arena.BothTimeText.Direction == "Ascending" then
					function bothUpdate(self, i)
						self.textBoth:SetText(string.format("%.1f / %.1f", VDW.VCB["ArenaDuration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), VDW.VCB["ArenaDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Arena.BothTimeText.Direction == "Descending" then
					function bothUpdate(self, i)
						self.textBoth:SetText(string.format("%.1f / %.1f", VDW.VCB["ArenaDuration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), VDW.VCB["ArenaDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Arena.BothTimeText.Direction == "Both" then
					function bothUpdate(self, i)
						if VDW.VCB["ArenaCastbar"..i] == "Cast" or VDW.VCB["ArenaCastbar"..i] == "Empower" then
							self.textBoth:SetText(string.format("%.1f / %.1f", VDW.VCB["ArenaDuration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), VDW.VCB["ArenaDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						elseif VDW.VCB["ArenaCastbar"..i] == "Channel" then
							self.textBoth:SetText(string.format("%.1f / %.1f", VDW.VCB["ArenaDuration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), VDW.VCB["ArenaDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			elseif VCBsettings.Arena.BothTimeText.Decimals == "2" then
				if VCBsettings.Arena.BothTimeText.Direction == "Ascending" then
					function bothUpdate(self, i)
						self.textBoth:SetText(string.format("%.2f / %.2f", VDW.VCB["ArenaDuration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), VDW.VCB["ArenaDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Arena.BothTimeText.Direction == "Descending" then
					function bothUpdate(self, i)
						self.textBoth:SetText(string.format("%.2f / %.2f", VDW.VCB["ArenaDuration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), VDW.VCB["ArenaDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Arena.BothTimeText.Direction == "Both" then
					function bothUpdate(self, i)
						if VDW.VCB["ArenaCastbar"..i] == "Cast" or VDW.VCB["ArenaCastbar"..i] == "Empower" then
							self.textBoth:SetText(string.format("%.2f / %.2f", VDW.VCB["ArenaDuration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), VDW.VCB["ArenaDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						elseif VDW.VCB["ArenaCastbar"..i] == "Channel" then
							self.textBoth:SetText(string.format("%.2f / %.2f", VDW.VCB["ArenaDuration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), VDW.VCB["ArenaDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			elseif VCBsettings.Arena.BothTimeText.Decimals == "3" then
				if VCBsettings.Arena.BothTimeText.Direction == "Ascending" then
					function bothUpdate(self, i)
						self.textBoth:SetText(string.format("%.3f / %.3f", VDW.VCB["ArenaDuration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), VDW.VCB["ArenaDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Arena.BothTimeText.Direction == "Descending" then
					function bothUpdate(self, i)
						self.textBoth:SetText(string.format("%.3f / %.3f", VDW.VCB["ArenaDuration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), VDW.VCB["ArenaDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Arena.BothTimeText.Direction == "Both" then
					function bothUpdate(self, i)
						if VDW.VCB["ArenaCastbar"..i] == "Cast" or VDW.VCB["ArenaCastbar"..i] == "Empower" then
							self.textBoth:SetText(string.format("%.3f", VDW.VCB["ArenaDuration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), VDW.VCB["ArenaDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						elseif VDW.VCB["ArenaCastbar"..i] == "Channel" then
							self.textBoth:SetText(string.format("%.3f / %.3f", VDW.VCB["ArenaDuration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), VDW.VCB["ArenaDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			end
		elseif VCBsettings.Arena.BothTimeText.Sec == "Show" then
			if VCBsettings.Arena.BothTimeText.Decimals == "0" then
				if VCBsettings.Arena.BothTimeText.Direction == "Ascending" then
					function bothUpdate(self, i)
						self.textBoth:SetText(string.format("%.0f / %.0f Sec", VDW.VCB["ArenaDuration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), VDW.VCB["ArenaDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Arena.BothTimeText.Direction == "Descending" then
					function bothUpdate(self, i)
						self.textBoth:SetText(string.format("%.0f / %.0f Sec", VDW.VCB["ArenaDuration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), VDW.VCB["ArenaDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Arena.BothTimeText.Direction == "Both" then
					function bothUpdate(self, i)
						if VDW.VCB["ArenaCastbar"..i] == "Cast" or VDW.VCB["ArenaCastbar"..i] == "Empower" then
							self.textBoth:SetText(string.format("%.0f / %.0f Sec", VDW.VCB["ArenaDuration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), VDW.VCB["ArenaDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						elseif VDW.VCB["ArenaCastbar"..i] == "Channel" then
							self.textBoth:SetText(string.format("%.0f / %.0f Sec", VDW.VCB["ArenaDuration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), VDW.VCB["ArenaDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			elseif VCBsettings.Arena.BothTimeText.Decimals == "1" then
				if VCBsettings.Arena.BothTimeText.Direction == "Ascending" then
					function bothUpdate(self, i)
						self.textBoth:SetText(string.format("%.1f / %.1f Sec", VDW.VCB["ArenaDuration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), VDW.VCB["ArenaDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Arena.BothTimeText.Direction == "Descending" then
					function bothUpdate(self, i)
						self.textBoth:SetText(string.format("%.1f / %.1f Sec", VDW.VCB["ArenaDuration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), VDW.VCB["ArenaDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Arena.BothTimeText.Direction == "Both" then
					function bothUpdate(self, i)
						if VDW.VCB["ArenaCastbar"..i] == "Cast" or VDW.VCB["ArenaCastbar"..i] == "Empower" then
							self.textBoth:SetText(string.format("%.1f / %.1f Sec", VDW.VCB["ArenaDuration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), VDW.VCB["ArenaDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						elseif VDW.VCB["ArenaCastbar"..i] == "Channel" then
							self.textBoth:SetText(string.format("%.1f / %.1f Sec", VDW.VCB["ArenaDuration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), VDW.VCB["ArenaDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			elseif VCBsettings.Arena.BothTimeText.Decimals == "2" then
				if VCBsettings.Arena.BothTimeText.Direction == "Ascending" then
					function bothUpdate(self, i)
						self.textBoth:SetText(string.format("%.2f / %.2f Sec", VDW.VCB["ArenaDuration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), VDW.VCB["ArenaDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Arena.BothTimeText.Direction == "Descending" then
					function bothUpdate(self, i)
						self.textBoth:SetText(string.format("%.2f / %.2f Sec", VDW.VCB["ArenaDuration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), VDW.VCB["ArenaDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Arena.BothTimeText.Direction == "Both" then
					function bothUpdate(self, i)
						if VDW.VCB["ArenaCastbar"..i] == "Cast" or VDW.VCB["ArenaCastbar"..i] == "Empower" then
							self.textBoth:SetText(string.format("%.2f / %.2f Sec", VDW.VCB["ArenaDuration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), VDW.VCB["ArenaDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						elseif VDW.VCB["ArenaCastbar"..i] == "Channel" then
							self.textBoth:SetText(string.format("%.2f / %.2f Sec", VDW.VCB["ArenaDuration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), VDW.VCB["ArenaDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			elseif VCBsettings.Arena.BothTimeText.Decimals == "3" then
				if VCBsettings.Arena.BothTimeText.Direction == "Ascending" then
					function bothUpdate(self, i)
						self.textBoth:SetText(string.format("%.3f / %.3f Sec", VDW.VCB["ArenaDuration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), VDW.VCB["ArenaDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Arena.BothTimeText.Direction == "Descending" then
					function bothUpdate(self, i)
						self.textBoth:SetText(string.format("%.3f / %.3f Sec", VDW.VCB["ArenaDuration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), VDW.VCB["ArenaDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Arena.BothTimeText.Direction == "Both" then
					function bothUpdate(self, i)
						if VDW.VCB["ArenaCastbar"..i] == "Cast" or VDW.VCB["ArenaCastbar"..i] == "Empower" then
							self.textBoth:SetText(string.format("%.3f / %.3f Sec", VDW.VCB["ArenaDuration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), VDW.VCB["ArenaDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						elseif VDW.VCB["ArenaCastbar"..i] == "Channel" then
							self.textBoth:SetText(string.format("%.3f / %.3f Sec", VDW.VCB["ArenaDuration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), VDW.VCB["ArenaDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			end
		end
	elseif VCBsettings.Arena.BothTimeText.Position == "Hide" then
		function bothUpdate(self, i)
			return
		end
	end
end
-- check total time update
function VDW.VCB.chkTotalUpdArena()
	if VCBsettings.Arena.TotalTimeText.Position ~= "Hide" then
		if VCBsettings.Arena.TotalTimeText.Sec == "Hide" then
			if VCBsettings.Arena.TotalTimeText.Decimals == "0" then
				function totalUpdate(self, i)
					self.textTotal:SetFormattedText("%.0f", VDW.VCB["ArenaDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime))
				end
			elseif VCBsettings.Arena.TotalTimeText.Decimals == "1" then
				function totalUpdate(self, i)
					self.textTotal:SetFormattedText("%.1f", VDW.VCB["ArenaDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime))
				end
			elseif VCBsettings.Arena.TotalTimeText.Decimals == "2" then
				function totalUpdate(self, i)
					self.textTotal:SetFormattedText("%.2f", VDW.VCB["ArenaDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime))
				end
			elseif VCBsettings.Arena.TotalTimeText.Decimals == "3" then
				function totalUpdate(self, i)
					self.textTotal:SetFormattedText("%.3f", VDW.VCB["ArenaDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime))
				end
			end
		elseif VCBsettings.Arena.TotalTimeText.Sec == "Show" then
			if VCBsettings.Arena.TotalTimeText.Decimals == "0" then
				function totalUpdate(self, i)
					self.textTotal:SetFormattedText("%.0f sec", VDW.VCB["ArenaDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime))
				end
			elseif VCBsettings.Arena.TotalTimeText.Decimals == "1" then
				function totalUpdate(self, i)
					self.textTotal:SetFormattedText("%.1f sec", VDW.VCB["ArenaDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime))
				end
			elseif VCBsettings.Arena.TotalTimeText.Decimals == "2" then
				function totalUpdate(self, i)
					self.textTotal:SetFormattedText("%.2f sec", VDW.VCB["ArenaDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime))
				end
			elseif VCBsettings.Arena.TotalTimeText.Decimals == "3" then
				function totalUpdate(self, i)
					self.textTotal:SetFormattedText("%.3f sec", VDW.VCB["ArenaDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime))
				end
			end
		end
	elseif VCBsettings.Arena.TotalTimeText.Position == "Hide" then
		function totalUpdate(self, i)
			return
		end
	end
end
-- checking color & style functions
-- check status color
function VDW.VCB.chkStatusColorArena()
	if VCBsettings.Arena.StatusBar.Color == "Default" then
		function statusbarColor(self, i)
			self:SetStatusBarDesaturated(false)
			self:SetStatusBarColor(1, 1, 1)
			if VCBsettings.Arena.StatusBar.Style == "Jailer" then
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
	elseif VCBsettings.Arena.StatusBar.Color == "Class" then
		function statusbarColor(self, i)
			if VDW.VCB["ClassColorArena"..i] ~= nil then
				self:SetStatusBarDesaturated(true)
				self:SetStatusBarColor(VDW.VCB["ClassColorArena"..i]:GetRGB())
				self.Spark:SetDesaturated(true)
				self.Spark:SetVertexColor(VDW.VCB["ClassColorArena"..i]:GetRGB())
				self.Flash:SetDesaturated(true)
				self.Flash:SetVertexColor(VDW.VCB["ClassColorArena"..i]:GetRGB())
			end
		end
	end
end
-- check border color
function VDW.VCB.chkBorderColorArena()
	if VCBsettings.Arena.Border.Color == "Default" then
		function borderColor(self, i)
			self.Background:SetDesaturated(false)
			self.Border:SetDesaturated(false)
			self.Background:SetVertexColor(1, 1, 1)
			self.Border:SetVertexColor(1, 1, 1)
		end
	elseif VCBsettings.Arena.Border.Color == "Class" then
		function borderColor(self, i)
			if VDW.VCB["ClassColorArena"..i] ~= nil then
				self.Background:SetDesaturated(true)
				self.Border:SetDesaturated(true)
				self.Background:SetVertexColor(VDW.VCB["ClassColorArena"..i]:GetRGB())
				self.Border:SetVertexColor(VDW.VCB["ClassColorArena"..i]:GetRGB())
			end
		end
	end
end
-- call back the defaul color of status
local function defaultColor(self)
	self:SetStatusBarDesaturated(false)
	self:SetStatusBarColor(1, 1, 1)
	if VCBsettings.Arena.StatusBar.Style == "Jailer" then
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
-- check status style
function VDW.VCB.chkStatusStyleArena()
	if VCBsettings.Arena.StatusBar.Style == "Default" then
		function statusbarStyle(self)
			return
		end
	elseif VCBsettings.Arena.StatusBar.Style == "Jailer" then
		function statusbarStyle(self)
			self:SetStatusBarTexture("jailerstower-scorebar-fill-onfire")
		end
	end
end
-- check border style
function VDW.VCB.chkBorderStyleArena()
	if VCBsettings.Arena.Border.Style == "Default" then
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
-- position & scale bar
-- position bar
local function positionBar(self)
	self:ClearAllPoints()
	self:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", VCBsettings["Arena"]["Position"]["X"], VCBsettings["Arena"]["Position"]["Y"])
end
-- scale bar
local function scaleBar(self)
	self:SetScale(VCBsettings["Arena"]["Scale"]/100)
end
-- hooking while bar is locked
local function barIsLocked()
	for i = 1, 3, 1 do
-- hook part 1
		_G["CompactArenaFrameMember"..i].CastingBarFrame:HookScript("OnShow", function(self)
			self.textName:SetWidth(self:GetWidth() - 8)
			iconPosition(self)
			namePosition(self)
			currentPostion(self)
			bothPostion(self)
			bothPostion(self)
			borderStyle(self)
			borderColor(self, i)
			bordertextPosition(self)
		end)
-- hook part 2
		_G["CompactArenaFrameMember"..i].CastingBarFrame:HookScript("OnUpdate", function(self)
			self.TextBorder:SetAlpha(0)
			self.Text:SetAlpha(0)
			self.BorderShield:SetAlpha(0)
			self.Icon:SetAlpha(0)
			if VDW.VCB["ArenaDuration"..i] then
				self.textName:SetText(self.Text:GetText())
				self.iconSpellLeft:SetTexture(self.Icon:GetTextureFileID())
				self.iconSpellRight:SetTexture(self.Icon:GetTextureFileID())
				shieldPosition(VDW.VCB["ArenaUninterruptible"..i], self)
				if VDW.VCB["ArenaInterrupted"..i] then
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
-- class color
for i = 1, 3, 1 do
	_G["CompactArenaFrameMember"..i]:HookScript("OnUpdate", function(self)
		local classFilename = UnitClassBase("arena"..i)
		if classFilename ~= nil then VDW.VCB["ClassColorArena"..i] = C_ClassColor.GetClassColor(classFilename) end
	end)
end
-- events time
local function EventsTime(self, event, arg1, arg2, arg3, arg4)
	if event == "PLAYER_LOGIN" then
		createExtras()
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
		barIsLocked()
	elseif event == "UNIT_SPELLCAST_START" then
		for i = 1, 3, 1 do
			if arg1 == "arena"..i then
				local castName, castText, castTex, _, _, isTradeSkill, _, castNotInterruptible = UnitCastingInfo(arg1)
				if castName then
					VDW.VCB["ArenaDuration"..i] = UnitCastingDuration(arg1)
					VDW.VCB["ArenaUninterruptible"..i] = castNotInterruptible
					VDW.VCB["ArenaCastbar"..i] = "Cast"
					VDW.VCB["ArenaInterrupted"..i] = false
				end
			end
		end
	elseif event == "UNIT_SPELLCAST_CHANNEL_START" then
		for i = 1, 3, 1 do
			if arg1 == "arena"..i then
				local chanName, chanText, chanTex, _, _, isTradeSkill, chanNotInterruptible, _, isEmpowered, numStages = UnitChannelInfo(arg1)
				if chanName then
					VDW.VCB["ArenaDuration"..i] = UnitCastingDuration(arg1)
					VDW.VCB["ArenaUninterruptible"..i] = castNotInterruptible
					VDW.VCB["ArenaCastbar"..i] = "Channel"
					VDW.VCB["ArenaInterrupted"..i] = false
				end
			end
		end
	elseif event == "UNIT_SPELLCAST_EMPOWER_START" then
		for i = 1, 3, 1 do
			if arg1 == "arena"..i then
				local chanName, chanText, chanTex, _, _, isTradeSkill, chanNotInterruptible, _, isEmpowered, numStages = UnitChannelInfo(arg1)
				if chanName then
					VDW.VCB["ArenaDuration"..i] = UnitCastingDuration(arg1)
					VDW.VCB["ArenaUninterruptible"..i] = castNotInterruptible
					VDW.VCB["ArenaCastbar"..i] = "Empower"
					VDW.VCB["ArenaInterrupted"..i] = false
				end
			end
		end
	elseif event == "UNIT_SPELLCAST_INTERRUPTED" then
		for i = 1, 3, 1 do
			if arg1 == "arena"..i then
				VDW.VCB["ArenaInterrupted"..i] = true
			end
		end
	end
end
vcbZlave:HookScript("OnEvent", EventsTime)
