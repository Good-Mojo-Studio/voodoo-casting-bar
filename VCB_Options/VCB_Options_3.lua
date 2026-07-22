-- some variables
local Color = VDW.GetAddonColors("VCB")
local prefixTip = VDW.Prefix("VCB")
local maxW = 160
local finalW = 0
local counter = 0
local textPosition = {
	{value = "Hide", text = VDWtranslate.Global.HIDE},
	{value = "TopLeft", text = VDWtranslate.Global.TOPLEFT},
	{value = "Left", text = VDWtranslate.Global.LEFT},
	{value = "BottomLeft", text = VDWtranslate.Global.BOTTOMLEFT},
	{value = "Top", text = VDWtranslate.Global.TOP},
	{value = "Center", text = VDWtranslate.Global.CENTER},
	{value = "Bottom", text = VDWtranslate.Global.BOTTOM},
	{value = "TopRight", text = VDWtranslate.Global.TOPRIGHT},
	{value = "Right", text = VDWtranslate.Global.RIGHT},
	{value = "BottomRight", text = VDWtranslate.Global.BOTTOMRIGHT},
}
local textPositionByValue = {}
for _, option in ipairs(textPosition) do
	textPositionByValue[option.value] = option.text
end
local textSec = {
	{value = false, text = VDWtranslate.Global.HIDE},
	{value = true, text = VDWtranslate.Global.SHOW},
}
local textSecByValue = {}
for _, option in ipairs(textSec) do
	textSecByValue[option.value] = option.text
end
local textDirection = {
	{value = "Ascending", text = VDWtranslate.Global.ASCENDING},
	{value = "Descending", text = VDWtranslate.Global.DESCENDING},
	{value = "Both", text = VDWtranslate.Global.BOTH},
}
local textDirectionByValue = {}
for _, option in ipairs(textDirection) do
	textDirectionByValue[option.value] = option.text
end
local textBorder = {
	{value = "Hide", text = VDWtranslate.Global.HIDE},
	{value = "Top", text = VDWtranslate.Global.TOP},
	{value = "Bottom", text = VDWtranslate.Global.BOTTOM},
	{value = "Both", text = VDWtranslate.Global.BOTH},
}
local textBorderByValue = {}
for _, option in ipairs(textBorder) do
	textBorderByValue[option.value] = option.text
end
local iconPosition = {
	{value = "Hide", text = VDWtranslate.Global.HIDE},
	{value = "Left", text = VDWtranslate.Global.LEFT},
	{value = "Right", text = VDWtranslate.Global.RIGHT},
	{value = "Both", text = VDWtranslate.Global.BOTH},
}
local iconPositionByValue = {}
for _, option in ipairs(iconPosition) do
	iconPositionByValue[option.value] = option.text
end
local barColor = {
	{value = "Default", text = VDWtranslate.Global.DEFAULT},
	{value = "Class", text = VDWtranslate.Global.CLASS},
}
local barColorByValue = {}
for _, option in ipairs(barColor) do
	barColorByValue[option.value] = option.text
end
local barStyle = {
	{value = "Default", text = VDWtranslate.Global.DEFAULT},
	{value = "Jailer", text = "Jailer"},
}
local barStyleByValue = {}
for _, option in ipairs(barStyle) do
	barStyleByValue[option.value] = option.text
end
local borderStyle = {
	{value = "Default", text = VDWtranslate.Global.DEFAULT},
	{value = "Jailer", text = "Jailer"},
}
local borderStyleByValue = {}
for _, option in ipairs(borderStyle) do
	borderStyleByValue[option.value] = option.text
end
local barLock = {
	{value = false, text = VDWtranslate.Global.UNLOCKED},
	{value = true, text = VDWtranslate.Global.LOCKED},
}
local barLockByValue = {}
for _, option in ipairs(barLock) do
	barLockByValue[option.value] = option.text
end
local textDecimals = {
	{value = "0", text = "0"},
	{value = "1", text = "1"},
	{value = "2", text = "2"},
	{value = "3", text = "3"},
}
local textDecimalByValue = {}
for _, option in ipairs(textDecimals) do
	textDecimalByValue[option.value] = option.text
end
-- create panel
VDW.CreateOptionsPanel(vcbOptions.Panel3, VDW.Background.VCB, Color.Main, Color.High, 0.3, "VCB")
vcbOptions.Panel3.TopTxt:SetText(string.format(VDWtranslate.Global.OPTIONS_FOR, VDWtranslate.Global.FOCUS_CAST_BAR))
-- create the boxes
vcbOptions.Panel3.Box1:SetHeight(120)
vcbOptions.Panel3.Box1.Title:SetText(VDWtranslate.Global.CAST_TIME_CURRENT)
vcbOptions.Panel3.Box2:SetHeight(120)
vcbOptions.Panel3.Box2:SetPoint("TOPLEFT", vcbOptions.Panel3.Box3, "BOTTOMLEFT", 0, 0)
vcbOptions.Panel3.Box2.Title:SetText(VDWtranslate.Global.CAST_TIME_BOTH)
vcbOptions.Panel3.Box3:SetHeight(120)
vcbOptions.Panel3.Box3:SetPoint("TOPLEFT", vcbOptions.Panel3.Box1, "BOTTOMLEFT", 0, 0)
vcbOptions.Panel3.Box3.Title:SetText(VDWtranslate.Global.CAST_TIME_TOTAL)
vcbOptions.Panel3.Box4:SetWidth(138)
vcbOptions.Panel3.Box4:SetPoint("TOPLEFT", vcbOptions.Panel3.Box1, "TOPRIGHT", 0, 0)
vcbOptions.Panel3.Box4.Title:SetText(VDWtranslate.Global.SPELL_NAME)
vcbOptions.Panel3.Box5:SetWidth(138)
vcbOptions.Panel3.Box5:SetPoint("TOPLEFT", vcbOptions.Panel3.Box4, "TOPRIGHT", 0, 0)
vcbOptions.Panel3.Box5.Title:SetText(VDWtranslate.Global.TEXT_BORDER)
vcbOptions.Panel3.Box6:SetWidth(138)
vcbOptions.Panel3.Box6:SetPoint("TOPLEFT", vcbOptions.Panel3.Box4, "BOTTOMLEFT", 0, 0)
vcbOptions.Panel3.Box6.Title:SetText(VDWtranslate.Global.SPELL_ICON)
vcbOptions.Panel3.Box7:SetWidth(138)
vcbOptions.Panel3.Box7:SetPoint("TOPLEFT", vcbOptions.Panel3.Box6, "TOPRIGHT", 0, 0)
vcbOptions.Panel3.Box7.Title:SetText(VDWtranslate.Global.SHIELD_ICON)
vcbOptions.Panel3.Box8:SetHeight(120)
vcbOptions.Panel3.Box8:SetPoint("TOPLEFT", vcbOptions.Panel3.Box6, "BOTTOMLEFT", 0, 0)
vcbOptions.Panel3.Box8.Title:SetText(VDWtranslate.Global.BAR_STATUS)
vcbOptions.Panel3.Box9:SetPoint("TOPLEFT", vcbOptions.Panel3.Box8, "BOTTOMLEFT", 0, 0)
vcbOptions.Panel3.Box9.Title:SetText(VDWtranslate.Global.BAR_BORDER)
vcbOptions.Panel3.Box10:SetWidth(210)
vcbOptions.Panel3.Box10:SetHeight(136)
vcbOptions.Panel3.Box10:SetPoint("TOPLEFT", vcbOptions.Panel3.Box5, "TOPRIGHT", 0, 0)
vcbOptions.Panel3.Box10.Title:SetText(VDWtranslate.Global.UNLOCK_CAST_BAR)
vcbOptions.Panel3.Box11:SetWidth(210)
vcbOptions.Panel3.Box11:SetHeight(144)
vcbOptions.Panel3.Box11:SetPoint("TOPLEFT", vcbOptions.Panel3.Box10, "BOTTOMLEFT", 0, 0)
vcbOptions.Panel3.Box11.Title:SetText(VDWtranslate.Global.CAST_BAR_SIZE)
for i = 1, 11, 1 do
	VDW.CreateOptionsBox(vcbOptions.Panel3, i, Color.Main, Color.High)
end
-- Box 1-4, PopOut 1, text position
for i = 1, 4, 1 do
	vcbOptions.Panel3["Box"..i].PopOut1.Title:SetText(VDWtranslate.Global.POSITION)
	for k, v in ipairs(textPosition) do
		counter = counter + 1
		VDW.CreateOptionsPopOutButtons(vcbOptions.Panel3, i, 1, k, v, Color.Main)
		vcbOptions.Panel3["Box"..i].PopOut1["Choice"..k]:HookScript("OnClick", function(self, button, down)
			if button == "LeftButton" and down == false then
				if i == 1 then
					VCBsettings.Focus.CurrentTimeText.Position = v.value
					VCB.chkCurrentTxtFocus()
					VCB.chkCurrentUpdFocus()
				elseif i == 2 then
					VCBsettings.Focus.BothTimeText.Position = v.value
					VCB.chkBothTxtFocus()
					VCB.chkBothUpdFocus()
				elseif i == 3 then
					VCBsettings.Focus.TotalTimeText.Position = v.value
					VCB.chkTotalTxtFocus()
					VCB.chkTotalUpdFocus()
				elseif i == 4 then
					VCBsettings.Focus.NameText.Position = v.value
					VCB.chkNameTxtFocus()
				end
				vcbOptions.Panel3["Box"..i].PopOut1.Text:SetText(self.Text:GetText())
				vcbOptions.Panel3["Box"..i].PopOut1.Choice1:Hide()
			end
		end)
		local w = vcbOptions.Panel3["Box"..i].PopOut1["Choice"..k].Text:GetStringWidth()
		if w > maxW then maxW = w end
	end
	finalW = math.ceil(maxW + 24)
	for c = 1, counter, 1 do
		vcbOptions.Panel3["Box"..i].PopOut1["Choice"..c]:SetWidth(finalW)
	end
	counter = 0
	maxW = 160
	VDW.CreateOptionsPopOut(vcbOptions.Panel3, i, 1, Color.Main, Color.High)
	vcbOptions.Panel3["Box"..i].PopOut1:HookScript("OnEnter", function(self)
		local parent = self:GetParent()
		local word = parent.Title:GetText()
		VDW.Tooltip_Show(self, prefixTip, string.format(VDWtranslate.Global.POSITION_TIP, word), Color.Main, "Left")
	end)
end
-- Box 1-3, PopOut 2-3, decimals, sec
for i = 1, 3, 1 do
	for k = 2, 3, 1 do
		if k == 2 then
			vcbOptions.Panel3["Box"..i]["PopOut"..k].Title:SetText(VDWtranslate.Global.DECIMALS)
			for v, name in ipairs(textDecimals) do
				counter = counter + 1
				VDW.CreateOptionsPopOutButtons(vcbOptions.Panel3, i, k, v, name, Color.Main)
				vcbOptions.Panel3["Box"..i]["PopOut"..k]["Choice"..v]:HookScript("OnClick", function(self, button, down)
					if button == "LeftButton" and down == false then
						if i == 1 then
							VCBsettings.Focus.CurrentTimeText.Decimals = name.value
							VCB.chkCurrentUpdFocus()
						elseif i == 2 then
							VCBsettings.Focus.BothTimeText.Decimals = name.value
							VCB.chkBothUpdFocus()
						elseif i == 3 then
							VCBsettings.Focus.TotalTimeText.Decimals = name.value
							VCB.chkTotalUpdFocus()
						end
						vcbOptions.Panel3["Box"..i]["PopOut"..k].Text:SetText(self.Text:GetText())
						vcbOptions.Panel3["Box"..i]["PopOut"..k].Choice1:Hide()
					end
				end)
				local w = vcbOptions.Panel3["Box"..i].PopOut1["Choice"..v].Text:GetStringWidth()
				if w > maxW then maxW = w end
			end
			finalW = math.ceil(maxW + 24)
			for c = 1, counter, 1 do
				vcbOptions.Panel3["Box"..i]["PopOut"..k]["Choice"..c]:SetWidth(finalW)
			end
			counter = 0
			maxW = 160
			vcbOptions.Panel3["Box"..i]["PopOut"..k]:HookScript("OnEnter", function(self)
				VDW.Tooltip_Show(self, prefixTip, VDWtranslate.Global.DECIMALS_TIP, Color.Main, "Left")
			end)
		else
			vcbOptions.Panel3["Box"..i]["PopOut"..k].Title:SetText("'Sec'")
			for v, name in ipairs(textSec) do
				counter = counter + 1
				VDW.CreateOptionsPopOutButtons(vcbOptions.Panel3, i, k, v, name, Color.Main)
				vcbOptions.Panel3["Box"..i]["PopOut"..k]["Choice"..v]:HookScript("OnClick", function(self, button, down)
					if button == "LeftButton" and down == false then
						if i == 1 then
							VCBsettings.Focus.CurrentTimeText.Sec = name.value
							VCB.chkCurrentUpdFocus()
						elseif i == 2 then
							VCBsettings.Focus.BothTimeText.Sec = name.value
							VCB.chkBothUpdFocus()
						elseif i == 3 then
							VCBsettings.Focus.TotalTimeText.Sec = name.value
							VCB.chkTotalUpdFocus()
						end
						vcbOptions.Panel3["Box"..i]["PopOut"..k].Text:SetText(self.Text:GetText())
						vcbOptions.Panel3["Box"..i]["PopOut"..k].Choice1:Hide()
					end
				end)
				local w = vcbOptions.Panel3["Box"..i].PopOut1["Choice"..v].Text:GetStringWidth()
				if w > maxW then maxW = w end
			end
			finalW = math.ceil(maxW + 24)
			for c = 1, counter, 1 do
				vcbOptions.Panel3["Box"..i]["PopOut"..k]["Choice"..c]:SetWidth(finalW)
			end
			counter = 0
			maxW = 160
			vcbOptions.Panel3["Box"..i]["PopOut"..k]:HookScript("OnEnter", function(self)
				local word = vcbOptions.Panel3["Box"..i]["PopOut"..k].Title:GetText()
				VDW.Tooltip_Show(self, prefixTip, string.format(VDWtranslate.Global.VISIBILITY_TIP, word), Color.Main, "Left")
			end)
		end
		VDW.CreateOptionsPopOut(vcbOptions.Panel3, i, k, Color.Main, Color.High)
	end
end
-- Box 1-2, PopOut 4, timer direction
for i = 1, 2, 1 do
	vcbOptions.Panel3["Box"..i].PopOut4.Title:SetText(VDWtranslate.Global.DIRECTION)
	for k, v in ipairs(textDirection) do
		counter = counter + 1
		VDW.CreateOptionsPopOutButtons(vcbOptions.Panel3, i, 4, k, v, Color.Main)
		vcbOptions.Panel3["Box"..i].PopOut4["Choice"..k]:HookScript("OnClick", function(self, button, down)
			if button == "LeftButton" and down == false then
				if i == 1 then
					VCBsettings.Focus.CurrentTimeText.Direction = v.value
					VCB.chkCurrentUpdFocus()
				elseif i == 2 then
					VCBsettings.Focus.BothTimeText.Direction = v.value
					VCB.chkBothUpdFocus()
				end
				vcbOptions.Panel3["Box"..i].PopOut4.Text:SetText(self.Text:GetText())
				vcbOptions.Panel3["Box"..i].PopOut4.Choice1:Hide()
			end
		end)
		local w = vcbOptions.Panel3["Box"..i].PopOut4["Choice"..k].Text:GetStringWidth()
		if w > maxW then maxW = w end
	end
	finalW = math.ceil(maxW + 24)
	for c = 1, counter, 1 do
		vcbOptions.Panel3["Box"..i].PopOut4["Choice"..c]:SetWidth(finalW)
	end
	counter = 0
	maxW = 160
	VDW.CreateOptionsPopOut(vcbOptions.Panel3, i, 4, Color.Main, Color.High)
	vcbOptions.Panel3["Box"..i].PopOut4:HookScript("OnEnter", function(self)
		VDW.Tooltip_Show(self, prefixTip, VDWtranslate.Global.DIRECTION_TIMER_TIP, Color.Main, "Left")
	end)
end
-- Box 5-7, PopOut 1, text border, spell icon, shield icon
for i = 5, 7, 1 do
	vcbOptions.Panel3["Box"..i].PopOut1.Title:SetText(VDWtranslate.Global.POSITION)
	if i == 5 then
		for k, v in ipairs(textBorder) do
			VDW.CreateOptionsPopOutButtons(vcbOptions.Panel3, i, 1, k, v, Color.Main)
			vcbOptions.Panel3["Box"..i].PopOut1["Choice"..k]:HookScript("OnClick", function(self, button, down)
				if button == "LeftButton" and down == false then
					VCBsettings.Focus.BorderText.Position = v.value
					vcbOptions.Panel3["Box"..i].PopOut1.Text:SetText(self.Text:GetText())
					VCB.chkFocusBorderTextPosition()
					vcbOptions.Panel3["Box"..i].PopOut1.Choice1:Hide()
				end			
			end)
			local w = vcbOptions.Panel3["Box"..i].PopOut1["Choice"..k].Text:GetStringWidth()
			if w > maxW then maxW = w end
		end
		finalW = math.ceil(maxW + 24)
		for c = 1, counter, 1 do
			vcbOptions.Panel3["Box"..i].PopOut1["Choice"..c]:SetWidth(finalW)
		end
		counter = 0
		maxW = 160
	else
		for k, v in ipairs(iconPosition) do
			VDW.CreateOptionsPopOutButtons(vcbOptions.Panel3, i, 1, k, v, Color.Main)
			vcbOptions.Panel3["Box"..i].PopOut1["Choice"..k]:HookScript("OnClick", function(self, button, down)
				if button == "LeftButton" and down == false then
					if i == 6 then
						VCBsettings.Focus.Icon.Position = v.value
						VCB.chkFocusIconPosition()
						vcbOptions.Panel3["Box"..i].PopOut1.Text:SetText(self.Text:GetText())
						vcbOptions.Panel3["Box"..i].PopOut1.Choice1:Hide()
					else
						VCBsettings.Focus.Shield.Position = v.value
						VCB.chkFocusShieldPosition()
						vcbOptions.Panel3["Box"..i].PopOut1.Text:SetText(self.Text:GetText())
						vcbOptions.Panel3["Box"..i].PopOut1.Choice1:Hide()
					end
				end
			end)
			local w = vcbOptions.Panel3["Box"..i].PopOut1["Choice"..k].Text:GetStringWidth()
			if w > maxW then maxW = w end
		end
		finalW = math.ceil(maxW + 24)
		for c = 1, counter, 1 do
			vcbOptions.Panel3["Box"..i].PopOut1["Choice"..c]:SetWidth(finalW)
		end
		counter = 0
		maxW = 160
	end
	VDW.CreateOptionsPopOut(vcbOptions.Panel3, i, 1, Color.Main, Color.High)
	vcbOptions.Panel3["Box"..i].PopOut1:HookScript("OnEnter", function(self)
		local parent = self:GetParent()
		local word = parent.Title:GetText()
		VDW.Tooltip_Show(self, prefixTip, string.format(VDWtranslate.Global.POSITION_TIP, word), Color.Main, "Left")
	end)
end
-- Box 8-9, PopOut 1-2, bar status, bar border (color, style)
for i = 8, 9, 1 do
	for k = 1, 2, 1 do
		if k == 1 then
			vcbOptions.Panel3["Box"..i]["PopOut"..k].Title:SetText(VDWtranslate.Global.COLOR)
			if i == 8 then
				for v, name in ipairs(barColor) do
					counter = counter + 1
					VDW.CreateOptionsPopOutButtons(vcbOptions.Panel3, i, k, v, name, Color.Main)
					vcbOptions.Panel3["Box"..i]["PopOut"..k]["Choice"..v]:HookScript("OnClick", function(self, button, down)
						if button == "LeftButton" and down == false then
							VCBsettings.Focus.StatusBar.Color = name.value
							VCB.chkStatusColorFocus()
							vcbOptions.Panel3["Box"..i]["PopOut"..k].Text:SetText(self.Text:GetText())
							vcbOptions.Panel3["Box"..i]["PopOut"..k].Choice1:Hide()
						end
					end)
					local w = vcbOptions.Panel3["Box"..i]["PopOut"..k]["Choice"..v].Text:GetStringWidth()
					if w > maxW then maxW = w end
				end
				finalW = math.ceil(maxW + 24)
				for c = 1, counter, 1 do
					vcbOptions.Panel3["Box"..i]["PopOut"..k]["Choice"..c]:SetWidth(finalW)
				end
				counter = 0
				maxW = 160
			else
				for v, name in ipairs(barColor) do
					counter = counter + 1
					VDW.CreateOptionsPopOutButtons(vcbOptions.Panel3, i, k, v, name, Color.Main)
					vcbOptions.Panel3["Box"..i]["PopOut"..k]["Choice"..v]:HookScript("OnClick", function(self, button, down)
						if button == "LeftButton" and down == false then
							VCBsettings.Focus.Border.Color = name.value
							VCB.chkBorderColorFocus()
							vcbOptions.Panel3["Box"..i]["PopOut"..k].Text:SetText(self.Text:GetText())
							vcbOptions.Panel3["Box"..i]["PopOut"..k].Choice1:Hide()
						end
					end)
					local w = vcbOptions.Panel3["Box"..i]["PopOut"..k]["Choice"..v].Text:GetStringWidth()
					if w > maxW then maxW = w end
				end
				finalW = math.ceil(maxW + 24)
				for c = 1, counter, 1 do
					vcbOptions.Panel3["Box"..i]["PopOut"..k]["Choice"..c]:SetWidth(finalW)
				end
				counter = 0
				maxW = 160
			end
			vcbOptions.Panel3["Box"..i]["PopOut"..k]:HookScript("OnEnter", function(self)
				local parent = self:GetParent()
				local word = parent.Title:GetText()
				VDW.Tooltip_Show(self, prefixTip, string.format(VDWtranslate.Global.COLOR_TIP, word), Color.Main, "Left")
			end)
		else
			vcbOptions.Panel3["Box"..i]["PopOut"..k].Title:SetText(VDWtranslate.Global.STYLE)
			if i == 8 then
				for v, name in ipairs(barStyle) do
					counter = counter + 1
					VDW.CreateOptionsPopOutButtons(vcbOptions.Panel3, i, k, v, name, Color.Main)
					vcbOptions.Panel3["Box"..i]["PopOut"..k]["Choice"..v]:HookScript("OnClick", function(self, button, down)
						if button == "LeftButton" and down == false then
							VCBsettings.Focus.StatusBar.Style = name.value
							VCB.chkStatusStyleFocus()
							vcbOptions.Panel3["Box"..i]["PopOut"..k].Text:SetText(self.Text:GetText())
							vcbOptions.Panel3["Box"..i]["PopOut"..k].Choice1:Hide()
						end
					end)
					local w = vcbOptions.Panel3["Box"..i]["PopOut"..k]["Choice"..v].Text:GetStringWidth()
					if w > maxW then maxW = w end
				end
				finalW = math.ceil(maxW + 24)
				for c = 1, counter, 1 do
					vcbOptions.Panel3["Box"..i]["PopOut"..k]["Choice"..c]:SetWidth(finalW)
				end
				counter = 0
				maxW = 160
			else
				for v, name in ipairs(borderStyle) do
					counter = counter + 1
					VDW.CreateOptionsPopOutButtons(vcbOptions.Panel3, i, k, v, name, Color.Main)
					vcbOptions.Panel3["Box"..i]["PopOut"..k]["Choice"..v]:HookScript("OnClick", function(self, button, down)
						if button == "LeftButton" and down == false then
							VCBsettings.Focus.Border.Style = name.value
							VCB.chkBorderStyleFocus()
							vcbOptions.Panel3["Box"..i]["PopOut"..k].Text:SetText(self.Text:GetText())
							vcbOptions.Panel3["Box"..i]["PopOut"..k].Choice1:Hide()
						end
					end)
					local w = vcbOptions.Panel3["Box"..i]["PopOut"..k]["Choice"..v].Text:GetStringWidth()
					if w > maxW then maxW = w end
				end
				finalW = math.ceil(maxW + 24)
				for c = 1, counter, 1 do
					vcbOptions.Panel3["Box"..i]["PopOut"..k]["Choice"..c]:SetWidth(finalW)
				end
				counter = 0
				maxW = 160
			end
			vcbOptions.Panel3["Box"..i]["PopOut"..k]:HookScript("OnEnter", function(self)
				local parent = self:GetParent()
				local word = parent.Title:GetText()
				VDW.Tooltip_Show(self, prefixTip, string.format(VDWtranslate.Global.STYLE_TIP, word), Color.Main, "Left")
			end)
		end
		VDW.CreateOptionsPopOut(vcbOptions.Panel3, i, k, Color.Main, Color.High)
	end
end
-- Box 8, CheckButton 1, interrupt color
vcbOptions.Panel3.Box8.CheckButton1.Text:SetText(string.format(VDWtranslate.Global.COLOR_THE_BAR_IF_COOLDOWN, VCB.InterruptSpell))
vcbOptions.Panel3.Box8.CheckButton1.Text:SetWidth(vcbOptions.Panel3.Box8:GetWidth()*0.8)
vcbOptions.Panel3.Box8.CheckButton1:SetScript("OnEnter", function(self)
	local word = self.Text:GetText()
	VDW.Tooltip_Show(self, prefixTip, string.format(VDWtranslate.Global.CHECK_IF_YOU_WANT_TO_COLOR_BAR, VCB.InterruptSpell), Color.Main, "Left")
end)
vcbOptions.Panel3.Box8.CheckButton1:HookScript("OnLeave", function(self) VDW.Tooltip_Hide() end)
vcbOptions.Panel3.Box8.CheckButton1:HookScript("OnClick", function (self, button)
	if button == "LeftButton" then
		if self:GetChecked() == true then
			VCBsettings.Focus.StatusBar.Interrupt.Show = true
			self.Text:SetTextColor(Color.Main:GetRGB())
			self:SetAlpha(1)
		elseif self:GetChecked() == false then
			VCBsettings.Focus.StatusBar.Interrupt.Show = false
			self.Text:SetTextColor(0.35, 0.35, 0.35, 0.8)
		end
		PlaySound(858, "Master")
		VCB.chkStatusColorFocus()
	end
end)
-- Box 10, PopOut 1, lock-unlock bar
vcbOptions.Panel3.Box10.PopOut1.Title:SetText(VDWtranslate.Global.LOCKING)
for k, v in ipairs(barLock) do
	counter = counter + 1
	VDW.CreateOptionsPopOutButtons(vcbOptions.Panel3, 10, 1, k, v, Color.Main)
	vcbOptions.Panel3.Box10.PopOut1["Choice"..k]:HookScript("OnClick", function(self, button, down)
		if button == "LeftButton" and down == false then
			VCBsettings.Focus.Lock = v.value
			C_UI.Reload()
		end
	end)
	local w = vcbOptions.Panel3.Box10.PopOut1["Choice"..k].Text:GetStringWidth()
	if w > maxW then maxW = w end
end
for c = 1, counter, 1 do
	vcbOptions.Panel3.Box10.PopOut1["Choice"..c]:SetWidth(finalW)
end
counter = 0
maxW = 160
vcbOptions.Panel3.Box10.PopOut1:HookScript("OnEnter", function(self)
	local parent = self:GetParent()
	local word = parent.Title:GetText()
	VDW.Tooltip_Show(self, prefixTip, string.format(VDWtranslate.Global.LOCKING_TIP_FOCUS, word), Color.Main, "Left")
end)
VDW.CreateOptionsPopOut(vcbOptions.Panel3, 10, 1, Color.Main, Color.High)
-- Box 10, Slider 1, scale bar
VDW.CreateOptionsSlider("VCB", vcbOptions.Panel3, 10, 1, "10%", "200%", 10, 200, Color.Main, Color.High)
vcbOptions.Panel3.Box10.Slider1.Slider:SetScript("OnValueChanged", function (self, value, userInput)
	vcbOptions.Panel3.Box10.Slider1.TopText:SetText(VDWtranslate.Global.SCALE..": "..self:GetValue().."%")
	VCBsettings.Focus.Scale = self:GetValue()
	FocusVCBpreview:SetScale(VCBsettings.Focus.Scale/100)
	if vcbFocusCastbar then VCB.FocusCastbarSize() end
	PlaySound(858, "Master")
end)
-- Box 11, Slider 1-2, size width-height
VDW.CreateOptionsSlider("VCB", vcbOptions.Panel3, 11, 1, 80, 320, 80, 320, Color.Main, Color.High)
vcbOptions.Panel3.Box11.Slider1.Slider:SetScript("OnValueChanged", function (self, value, userInput)
	vcbOptions.Panel3.Box11.Slider1.TopText:SetText(VDWtranslate.Global.WIDTH..": "..self:GetValue())
	VCBsettings.Focus.Size.Width = self:GetValue()
	FocusVCBpreview:SetSize(VCBsettings.Focus.Size.Width, VCBsettings.Focus.Size.Height)
	if vcbFocusCastbar then VCB.FocusCastbarSize() end
	PlaySound(858, "Master")
end)
VDW.CreateOptionsSlider("VCB", vcbOptions.Panel3, 11, 2, 8, 40, 8, 40, Color.Main, Color.High)
vcbOptions.Panel3.Box11.Slider2.Slider:SetScript("OnValueChanged", function (self, value, userInput)
	vcbOptions.Panel3.Box11.Slider2.TopText:SetText(VDWtranslate.Global.HEIGHT..": "..self:GetValue())
	VCBsettings.Focus.Size.Height = self:GetValue()
	FocusVCBpreview:SetSize(VCBsettings.Focus.Size.Width, VCBsettings.Focus.Size.Height)
	if vcbFocusCastbar then VCB.FocusCastbarSize() end
	PlaySound(858, "Master")
end)
-- cast bar preview
FocusVCBpreview.Text:SetText(VDWtranslate.Global.FOCUS_CAST_BAR)
FocusVCBpreview:SetScript("OnEnter", function(self)
	VDW.Tooltip_Show(self, prefixTip, VDWtranslate.Global.LEFT_CLICK.." "..VDWtranslate.Global.DRAG_ME_TO_MOVE, Color.Main)
end)
FocusVCBpreview:HookScript("OnLeave", function(self) VDW.Tooltip_Hide() end)
-- stop moving
local function StopMoving(self)
	VCBsettings.Focus.Position.X = Round(self:GetLeft())
	VCBsettings.Focus.Position.Y = Round(self:GetBottom())
	VCB.FocusCastbarPosition()
	self:StopMovingOrSizing()
end
-- move preview
FocusVCBpreview:RegisterForDrag("LeftButton")
FocusVCBpreview:SetScript("OnDragStart", FocusVCBpreview.StartMoving)
FocusVCBpreview:SetScript("OnDragStop", function(self) StopMoving(self) end)
-- hide preview
FocusVCBpreview:SetScript("OnHide", function(self)
	VCBsettings.Focus.Position.X = Round(self:GetLeft())
	VCBsettings.Focus.Position.Y = Round(self:GetBottom())
end)
-- functions for the check
local function PositionDecimalsSec(box, timeText)
	vcbOptions.Panel3["Box"..box].PopOut1.Text:SetText(textPositionByValue[VCBsettings.Focus[timeText].Position] or VDWtranslate.Global.HIDE)
	vcbOptions.Panel3["Box"..box].PopOut2.Text:SetText(textDecimalByValue[VCBsettings.Focus[timeText].Decimals] or VDWtranslate.Global.HIDE)
	vcbOptions.Panel3["Box"..box].PopOut3.Text:SetText(textSecByValue[VCBsettings.Focus[timeText].Sec] or VDWtranslate.Global.HIDE)
end
-- Check Saved Variables
local function CheckSavedVariables()
	PositionDecimalsSec(1, "CurrentTimeText")
	PositionDecimalsSec(2, "BothTimeText")
	PositionDecimalsSec(3, "TotalTimeText")
-- direction
	vcbOptions.Panel3.Box1.PopOut4.Text:SetText(textDirectionByValue[VCBsettings.Focus.CurrentTimeText.Direction] or VDWtranslate.Global.HIDE)
	vcbOptions.Panel3.Box2.PopOut4.Text:SetText(textDirectionByValue[VCBsettings.Focus.BothTimeText.Direction] or VDWtranslate.Global.HIDE)
-- name, borderText, icon, shield position
	vcbOptions.Panel3.Box4.PopOut1.Text:SetText(textPositionByValue[VCBsettings.Focus.NameText.Position] or VDWtranslate.Global.HIDE)
	vcbOptions.Panel3.Box5.PopOut1.Text:SetText(textBorderByValue[VCBsettings.Focus.BorderText.Position] or VDWtranslate.Global.HIDE)
	vcbOptions.Panel3.Box6.PopOut1.Text:SetText(iconPositionByValue[VCBsettings.Focus.Icon.Position] or VDWtranslate.Global.HIDE)
	vcbOptions.Panel3.Box7.PopOut1.Text:SetText(iconPositionByValue[VCBsettings.Focus.Shield.Position] or VDWtranslate.Global.HIDE)
-- status, border
	vcbOptions.Panel3.Box8.PopOut1.Text:SetText(barColorByValue[VCBsettings.Focus.StatusBar.Color] or VDWtranslate.Global.HIDE)
	vcbOptions.Panel3.Box8.PopOut2.Text:SetText(barStyleByValue[VCBsettings.Focus.StatusBar.Style] or VDWtranslate.Global.HIDE)
	vcbOptions.Panel3.Box9.PopOut1.Text:SetText(barColorByValue[VCBsettings.Focus.Border.Color] or VDWtranslate.Global.HIDE)
	vcbOptions.Panel3.Box9.PopOut2.Text:SetText(borderStyleByValue[VCBsettings.Focus.Border.Style] or VDWtranslate.Global.HIDE)
	if VCBsettings.Focus.StatusBar.Interrupt.Show then
		vcbOptions.Panel3.Box8.CheckButton1:SetChecked(true)
		vcbOptions.Panel3.Box8.CheckButton1.Text:SetTextColor(Color.Main:GetRGB())
		vcbOptions.Panel3.Box8.CheckButton1:SetAlpha(1)
	else
		vcbOptions.Panel3.Box8.CheckButton1:SetChecked(false)
		vcbOptions.Panel3.Box8.CheckButton1.Text:SetTextColor(0.35, 0.35, 0.35, 0.8)
	end
-- lock-unlock bar
	vcbOptions.Panel3.Box10.PopOut1.Text:SetText(barLockByValue[VCBsettings.Focus.Lock] or VDWtranslate.Global.HIDE)
	if VCBsettings.Focus.Lock then
		VDW.sliderDisable(vcbOptions.Panel3.Box10.Slider1)
		VDW.sliderDisable(vcbOptions.Panel3.Box11.Slider1)
		VDW.sliderDisable(vcbOptions.Panel3.Box11.Slider2)
		if FocusVCBpreview:IsShown() then FocusVCBpreview:Hide() end
	else
		VDW.sliderEnable(vcbOptions.Panel3.Box10.Slider1)
		VDW.sliderEnable(vcbOptions.Panel3.Box11.Slider1)
		VDW.sliderEnable(vcbOptions.Panel3.Box11.Slider2)
		FocusVCBpreview:ClearAllPoints()
		FocusVCBpreview:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", VCBsettings.Focus.Position.X, VCBsettings.Focus.Position.Y)
		if not FocusVCBpreview:IsShown() then FocusVCBpreview:Show() end
	end
	vcbOptions.Panel3.Box10.Slider1.Slider:SetValue(VCBsettings.Focus.Scale)
	vcbOptions.Panel3.Box11.Slider1.Slider:SetValue(VCBsettings.Focus.Size.Width)
	vcbOptions.Panel3.Box11.Slider2.Slider:SetValue(VCBsettings.Focus.Size.Height)
end
-- show the option panel
vcbOptions.Panel3:HookScript("OnShow", function(self)
	for i = 1, 2, 1 do
		vcbOptions["Tab"..i].Text:SetTextColor(0.4, 0.4, 0.4, 1)
		if vcbOptions["Panel"..i]:IsShown() then vcbOptions["Panel"..i]:Hide() end
	end
	vcbOptions.Tab3.Text:SetTextColor(Color.High:GetRGB())
	for i = 4, 6, 1 do
		vcbOptions["Tab"..i].Text:SetTextColor(0.4, 0.4, 0.4, 1)
		if vcbOptions["Panel"..i]:IsShown() then vcbOptions["Panel"..i]:Hide() end
	end
	CheckSavedVariables()
end)
-- hide the option panel
vcbOptions.Panel3:HookScript("OnHide", function(self)
	if FocusVCBpreview:IsShown() then FocusVCBpreview:Hide() end
end)
