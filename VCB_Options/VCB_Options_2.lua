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
VDW.CreateOptionsPanel(vcbOptions.Panel2, VDW.Background.VCB, Color.Main, Color.High, 0.3, "VCB")
vcbOptions.Panel2.TopTxt:SetText(string.format(VDWtranslate.Global.OPTIONS_FOR, VDWtranslate.Global.TARGET_CAST_BAR))
-- create the boxes
vcbOptions.Panel2.Box1:SetHeight(120)
vcbOptions.Panel2.Box1.Title:SetText(VDWtranslate.Global.CAST_TIME_CURRENT)
vcbOptions.Panel2.Box2:SetHeight(120)
vcbOptions.Panel2.Box2:SetPoint("TOPLEFT", vcbOptions.Panel2.Box3, "BOTTOMLEFT", 0, 0)
vcbOptions.Panel2.Box2.Title:SetText(VDWtranslate.Global.CAST_TIME_BOTH)
vcbOptions.Panel2.Box3:SetHeight(120)
vcbOptions.Panel2.Box3:SetPoint("TOPLEFT", vcbOptions.Panel2.Box1, "BOTTOMLEFT", 0, 0)
vcbOptions.Panel2.Box3.Title:SetText(VDWtranslate.Global.CAST_TIME_TOTAL)
vcbOptions.Panel2.Box4:SetWidth(138)
vcbOptions.Panel2.Box4:SetPoint("TOPLEFT", vcbOptions.Panel2.Box1, "TOPRIGHT", 0, 0)
vcbOptions.Panel2.Box4.Title:SetText(VDWtranslate.Global.SPELL_NAME)
vcbOptions.Panel2.Box5:SetWidth(138)
vcbOptions.Panel2.Box5:SetPoint("TOPLEFT", vcbOptions.Panel2.Box4, "TOPRIGHT", 0, 0)
vcbOptions.Panel2.Box5.Title:SetText(VDWtranslate.Global.TEXT_BORDER)
vcbOptions.Panel2.Box6:SetWidth(138)
vcbOptions.Panel2.Box6:SetPoint("TOPLEFT", vcbOptions.Panel2.Box4, "BOTTOMLEFT", 0, 0)
vcbOptions.Panel2.Box6.Title:SetText(VDWtranslate.Global.SPELL_ICON)
vcbOptions.Panel2.Box7:SetWidth(138)
vcbOptions.Panel2.Box7:SetPoint("TOPLEFT", vcbOptions.Panel2.Box6, "TOPRIGHT", 0, 0)
vcbOptions.Panel2.Box7.Title:SetText(VDWtranslate.Global.SHIELD_ICON)
vcbOptions.Panel2.Box8:SetHeight(120)
vcbOptions.Panel2.Box8:SetPoint("TOPLEFT", vcbOptions.Panel2.Box6, "BOTTOMLEFT", 0, 0)
vcbOptions.Panel2.Box8.Title:SetText(VDWtranslate.Global.BAR_STATUS)
vcbOptions.Panel2.Box9:SetPoint("TOPLEFT", vcbOptions.Panel2.Box8, "BOTTOMLEFT", 0, 0)
vcbOptions.Panel2.Box9.Title:SetText(VDWtranslate.Global.BAR_BORDER)
vcbOptions.Panel2.Box10:SetWidth(210)
vcbOptions.Panel2.Box10:SetHeight(136)
vcbOptions.Panel2.Box10:SetPoint("TOPLEFT", vcbOptions.Panel2.Box5, "TOPRIGHT", 0, 0)
vcbOptions.Panel2.Box10.Title:SetText(VDWtranslate.Global.UNLOCK_CAST_BAR)
vcbOptions.Panel2.Box11:SetWidth(210)
vcbOptions.Panel2.Box11:SetHeight(144)
vcbOptions.Panel2.Box11:SetPoint("TOPLEFT", vcbOptions.Panel2.Box10, "BOTTOMLEFT", 0, 0)
vcbOptions.Panel2.Box11.Title:SetText(VDWtranslate.Global.CAST_BAR_SIZE)
for i = 1, 11, 1 do
	VDW.CreateOptionsBox(vcbOptions.Panel2, i, Color.Main, Color.High)
end
-- Box 1-4, Pop out 1 text position
for i = 1, 4, 1 do
	vcbOptions.Panel2["Box"..i].PopOut1.Title:SetText(VDWtranslate.Global.POSITION)
	for k, v in ipairs(textPosition) do
		counter = counter + 1
		VDW.CreateOptionsPopOutButtons(vcbOptions.Panel2, i, 1, k, v, Color.Main)
		vcbOptions.Panel2["Box"..i].PopOut1["Choice"..k]:HookScript("OnClick", function(self, button, down)
			if button == "LeftButton" and down == false then
				if i == 1 then
					VCBsettings.Target.CurrentTimeText.Position = v.value
					VCB.chkCurrentTxtTarget()
					VCB.chkCurrentUpdTarget()
				elseif i == 2 then
					VCBsettings.Target.BothTimeText.Position = v.value
					VCB.chkBothTxtTarget()
					VCB.chkBothUpdTarget()
				elseif i == 3 then
					VCBsettings.Target.TotalTimeText.Position = v.value
					VCB.chkTotalTxtTarget()
					VCB.chkTotalUpdTarget()
				elseif i == 4 then
					VCBsettings.Target.NameText.Position = v.value
					VCB.chkNameTxtTarget()
				end
				vcbOptions.Panel2["Box"..i].PopOut1.Text:SetText(self.Text:GetText())
				vcbOptions.Panel2["Box"..i].PopOut1.Choice1:Hide()
			end
		end)
		local w = vcbOptions.Panel2["Box"..i].PopOut1["Choice"..k].Text:GetStringWidth()
		if w > maxW then maxW = w end
	end
	finalW = math.ceil(maxW + 24)
	for c = 1, counter, 1 do
		vcbOptions.Panel2["Box"..i].PopOut1["Choice"..c]:SetWidth(finalW)
	end
	counter = 0
	maxW = 160
	VDW.CreateOptionsPopOut(vcbOptions.Panel2, i, 1, Color.Main, Color.High)
	vcbOptions.Panel2["Box"..i].PopOut1:HookScript("OnEnter", function(self)
		local parent = self:GetParent()
		local word = parent.Title:GetText()
		VDW.Tooltip_Show(self, prefixTip, string.format(VDWtranslate.Global.POSITION_TIP, word), Color.Main, "Left")
	end)
end
-- Box 1-3, Pop out 2-3 decimals and sec
for i = 1, 3, 1 do
	for k = 2, 3, 1 do
		if k == 2 then
			vcbOptions.Panel2["Box"..i]["PopOut"..k].Title:SetText(VDWtranslate.Global.DECIMALS)
			for v, name in ipairs(textDecimals) do
				counter = counter + 1
				VDW.CreateOptionsPopOutButtons(vcbOptions.Panel2, i, k, v, name, Color.Main)
				vcbOptions.Panel2["Box"..i]["PopOut"..k]["Choice"..v]:HookScript("OnClick", function(self, button, down)
					if button == "LeftButton" and down == false then
						if i == 1 then
							VCBsettings.Target.CurrentTimeText.Decimals = name.value
							VCB.chkCurrentUpdTarget()
						elseif i == 2 then
							VCBsettings.Target.BothTimeText.Decimals = name.value
							VCB.chkBothUpdTarget()
						elseif i == 3 then
							VCBsettings.Target.TotalTimeText.Decimals = name.value
							VCB.chkTotalUpdTarget()
						end
						vcbOptions.Panel2["Box"..i]["PopOut"..k].Text:SetText(self.Text:GetText())
						vcbOptions.Panel2["Box"..i]["PopOut"..k].Choice1:Hide()
					end
				end)
				local w = vcbOptions.Panel2["Box"..i].PopOut1["Choice"..v].Text:GetStringWidth()
				if w > maxW then maxW = w end
			end
			finalW = math.ceil(maxW + 24)
			for c = 1, counter, 1 do
				vcbOptions.Panel2["Box"..i]["PopOut"..k]["Choice"..c]:SetWidth(finalW)
			end
			counter = 0
			maxW = 160
			vcbOptions.Panel2["Box"..i]["PopOut"..k]:HookScript("OnEnter", function(self)
				VDW.Tooltip_Show(self, prefixTip, VDWtranslate.Global.DECIMALS_TIP, Color.Main, "Left")
			end)
		else
			vcbOptions.Panel2["Box"..i]["PopOut"..k].Title:SetText("'Sec'")
			for v, name in ipairs(textSec) do
				counter = counter + 1
				VDW.CreateOptionsPopOutButtons(vcbOptions.Panel2, i, k, v, name, Color.Main)
				vcbOptions.Panel2["Box"..i]["PopOut"..k]["Choice"..v]:HookScript("OnClick", function(self, button, down)
					if button == "LeftButton" and down == false then
						if i == 1 then
							VCBsettings.Target.CurrentTimeText.Sec = name.value
							VCB.chkCurrentUpdTarget()
						elseif i == 2 then
							VCBsettings.Target.BothTimeText.Sec = name.value
							VCB.chkBothUpdTarget()
						elseif i == 3 then
							VCBsettings.Target.TotalTimeText.Sec = name.value
							VCB.chkTotalUpdTarget()
						end
						vcbOptions.Panel2["Box"..i]["PopOut"..k].Text:SetText(self.Text:GetText())
						vcbOptions.Panel2["Box"..i]["PopOut"..k].Choice1:Hide()
					end
				end)
				local w = vcbOptions.Panel2["Box"..i].PopOut1["Choice"..v].Text:GetStringWidth()
				if w > maxW then maxW = w end
			end
			finalW = math.ceil(maxW + 24)
			for c = 1, counter, 1 do
				vcbOptions.Panel2["Box"..i]["PopOut"..k]["Choice"..c]:SetWidth(finalW)
			end
			counter = 0
			maxW = 160
			vcbOptions.Panel2["Box"..i]["PopOut"..k]:HookScript("OnEnter", function(self)
				local word = vcbOptions.Panel2["Box"..i]["PopOut"..k].Title:GetText()
				VDW.Tooltip_Show(self, prefixTip, string.format(VDWtranslate.Global.VISIBILITY_TIP, word), Color.Main, "Left")
			end)
		end
		VDW.CreateOptionsPopOut(vcbOptions.Panel2, i, k, Color.Main, Color.High)
	end
end
-- Box 1-2, Pop out 4 Buttons Direction
for i = 1, 2, 1 do
	vcbOptions.Panel2["Box"..i].PopOut4.Title:SetText(VDWtranslate.Global.DIRECTION)
	for k, v in ipairs(textDirection) do
		counter = counter + 1
		VDW.CreateOptionsPopOutButtons(vcbOptions.Panel2, i, 4, k, v, Color.Main)
		vcbOptions.Panel2["Box"..i].PopOut4["Choice"..k]:HookScript("OnClick", function(self, button, down)
			if button == "LeftButton" and down == false then
				if i == 1 then
					VCBsettings.Target.CurrentTimeText.Direction = v.value
					VCB.chkCurrentUpdTarget()
				elseif i == 2 then
					VCBsettings.Target.BothTimeText.Direction = v.value
					VCB.chkBothUpdTarget()
				end
				vcbOptions.Panel2["Box"..i].PopOut4.Text:SetText(self.Text:GetText())
				vcbOptions.Panel2["Box"..i].PopOut4.Choice1:Hide()
			end
		end)
		local w = vcbOptions.Panel2["Box"..i].PopOut4["Choice"..k].Text:GetStringWidth()
		if w > maxW then maxW = w end
	end
	finalW = math.ceil(maxW + 24)
	for c = 1, counter, 1 do
		vcbOptions.Panel2["Box"..i].PopOut4["Choice"..c]:SetWidth(finalW)
	end
	counter = 0
	maxW = 160
	VDW.CreateOptionsPopOut(vcbOptions.Panel2, i, 4, Color.Main, Color.High)
	vcbOptions.Panel2["Box"..i].PopOut4:HookScript("OnEnter", function(self)
		VDW.Tooltip_Show(self, prefixTip, VDWtranslate.Global.DIRECTION_TIMER_TIP, Color.Main, "Left")
	end)
end
-- Box 5-7, Pop out 1 Buttons Border text, Icon spell, Icon shield
for i = 5, 7, 1 do
	vcbOptions.Panel2["Box"..i].PopOut1.Title:SetText(VDWtranslate.Global.POSITION)
	if i == 5 then
		for k, v in ipairs(textBorder) do
			VDW.CreateOptionsPopOutButtons(vcbOptions.Panel2, i, 1, k, v, Color.Main)
			vcbOptions.Panel2["Box"..i].PopOut1["Choice"..k]:HookScript("OnClick", function(self, button, down)
				if button == "LeftButton" and down == false then
					VCBsettings.Target.BorderText.Position = v.value
					vcbOptions.Panel2["Box"..i].PopOut1.Text:SetText(self.Text:GetText())
					VCB.chkTargetBorderTextPosition()
					vcbOptions.Panel2["Box"..i].PopOut1.Choice1:Hide()
				end			
			end)
			local w = vcbOptions.Panel2["Box"..i].PopOut1["Choice"..k].Text:GetStringWidth()
			if w > maxW then maxW = w end
		end
		finalW = math.ceil(maxW + 24)
		for c = 1, counter, 1 do
			vcbOptions.Panel2["Box"..i].PopOut1["Choice"..c]:SetWidth(finalW)
		end
		counter = 0
		maxW = 160
	else
		for k, v in ipairs(iconPosition) do
			VDW.CreateOptionsPopOutButtons(vcbOptions.Panel2, i, 1, k, v, Color.Main)
			vcbOptions.Panel2["Box"..i].PopOut1["Choice"..k]:HookScript("OnClick", function(self, button, down)
				if button == "LeftButton" and down == false then
					if i == 6 then
						VCBsettings.Target.Icon.Position = v.value
						VCB.chkTargetIconPosition()
						vcbOptions.Panel2["Box"..i].PopOut1.Text:SetText(self.Text:GetText())
						vcbOptions.Panel2["Box"..i].PopOut1.Choice1:Hide()
					else
						VCBsettings.Target.Shield.Position = v.value
						VCB.chkTargetShieldPosition()
						vcbOptions.Panel2["Box"..i].PopOut1.Text:SetText(self.Text:GetText())
						vcbOptions.Panel2["Box"..i].PopOut1.Choice1:Hide()
					end
				end
			end)
			local w = vcbOptions.Panel2["Box"..i].PopOut1["Choice"..k].Text:GetStringWidth()
			if w > maxW then maxW = w end
		end
		finalW = math.ceil(maxW + 24)
		for c = 1, counter, 1 do
			vcbOptions.Panel2["Box"..i].PopOut1["Choice"..c]:SetWidth(finalW)
		end
		counter = 0
		maxW = 160
	end
	VDW.CreateOptionsPopOut(vcbOptions.Panel2, i, 1, Color.Main, Color.High)
	vcbOptions.Panel2["Box"..i].PopOut1:HookScript("OnEnter", function(self)
		local parent = self:GetParent()
		local word = parent.Title:GetText()
		VDW.Tooltip_Show(self, prefixTip, string.format(VDWtranslate.Global.POSITION_TIP, word), Color.Main, "Left")
	end)
end
-- Box 8-9, Pop out 1-2 Status & Border bar (color & style)
for i = 8, 9, 1 do
	for k = 1, 2, 1 do
		if k == 1 then
			vcbOptions.Panel2["Box"..i]["PopOut"..k].Title:SetText(VDWtranslate.Global.COLOR)
			if i == 8 then
				for v, name in ipairs(barColor) do
					counter = counter + 1
					VDW.CreateOptionsPopOutButtons(vcbOptions.Panel2, i, k, v, name, Color.Main)
					vcbOptions.Panel2["Box"..i]["PopOut"..k]["Choice"..v]:HookScript("OnClick", function(self, button, down)
						if button == "LeftButton" and down == false then
							VCBsettings.Target.StatusBar.Color = name.value
							VCB.chkStatusColorTarget()
							vcbOptions.Panel2["Box"..i]["PopOut"..k].Text:SetText(self.Text:GetText())
							vcbOptions.Panel2["Box"..i]["PopOut"..k].Choice1:Hide()
						end
					end)
					local w = vcbOptions.Panel2["Box"..i]["PopOut"..k]["Choice"..v].Text:GetStringWidth()
					if w > maxW then maxW = w end
				end
				finalW = math.ceil(maxW + 24)
				for c = 1, counter, 1 do
					vcbOptions.Panel2["Box"..i]["PopOut"..k]["Choice"..c]:SetWidth(finalW)
				end
				counter = 0
				maxW = 160
			else
				for v, name in ipairs(barColor) do
					counter = counter + 1
					VDW.CreateOptionsPopOutButtons(vcbOptions.Panel2, i, k, v, name, Color.Main)
					vcbOptions.Panel2["Box"..i]["PopOut"..k]["Choice"..v]:HookScript("OnClick", function(self, button, down)
						if button == "LeftButton" and down == false then
							VCBsettings.Target.Border.Color = name.value
							VCB.chkBorderColorTarget()
							vcbOptions.Panel2["Box"..i]["PopOut"..k].Text:SetText(self.Text:GetText())
							vcbOptions.Panel2["Box"..i]["PopOut"..k].Choice1:Hide()
						end
					end)
					local w = vcbOptions.Panel2["Box"..i]["PopOut"..k]["Choice"..v].Text:GetStringWidth()
					if w > maxW then maxW = w end
				end
				finalW = math.ceil(maxW + 24)
				for c = 1, counter, 1 do
					vcbOptions.Panel2["Box"..i]["PopOut"..k]["Choice"..c]:SetWidth(finalW)
				end
				counter = 0
				maxW = 160
			end
			vcbOptions.Panel2["Box"..i]["PopOut"..k]:HookScript("OnEnter", function(self)
				local parent = self:GetParent()
				local word = parent.Title:GetText()
				VDW.Tooltip_Show(self, prefixTip, string.format(VDWtranslate.Global.COLOR_TIP, word), Color.Main, "Left")
			end)
		else
			vcbOptions.Panel2["Box"..i]["PopOut"..k].Title:SetText(VDWtranslate.Global.STYLE)
			if i == 8 then
				for v, name in ipairs(barStyle) do
					counter = counter + 1
					VDW.CreateOptionsPopOutButtons(vcbOptions.Panel2, i, k, v, name, Color.Main)
					vcbOptions.Panel2["Box"..i]["PopOut"..k]["Choice"..v]:HookScript("OnClick", function(self, button, down)
						if button == "LeftButton" and down == false then
							VCBsettings.Target.StatusBar.Style = name.value
							VCB.chkStatusStyleTarget()
							vcbOptions.Panel2["Box"..i]["PopOut"..k].Text:SetText(self.Text:GetText())
							vcbOptions.Panel2["Box"..i]["PopOut"..k].Choice1:Hide()
						end
					end)
					local w = vcbOptions.Panel2["Box"..i]["PopOut"..k]["Choice"..v].Text:GetStringWidth()
					if w > maxW then maxW = w end
				end
				finalW = math.ceil(maxW + 24)
				for c = 1, counter, 1 do
					vcbOptions.Panel2["Box"..i]["PopOut"..k]["Choice"..c]:SetWidth(finalW)
				end
				counter = 0
				maxW = 160
			else
				for v, name in ipairs(borderStyle) do
					counter = counter + 1
					VDW.CreateOptionsPopOutButtons(vcbOptions.Panel2, i, k, v, name, Color.Main)
					vcbOptions.Panel2["Box"..i]["PopOut"..k]["Choice"..v]:HookScript("OnClick", function(self, button, down)
						if button == "LeftButton" and down == false then
							VCBsettings.Target.Border.Style = name.value
							VCB.chkBorderStyleTarget()
							vcbOptions.Panel2["Box"..i]["PopOut"..k].Text:SetText(self.Text:GetText())
							vcbOptions.Panel2["Box"..i]["PopOut"..k].Choice1:Hide()
						end
					end)
					local w = vcbOptions.Panel2["Box"..i]["PopOut"..k]["Choice"..v].Text:GetStringWidth()
					if w > maxW then maxW = w end
				end
				finalW = math.ceil(maxW + 24)
				for c = 1, counter, 1 do
					vcbOptions.Panel2["Box"..i]["PopOut"..k]["Choice"..c]:SetWidth(finalW)
				end
				counter = 0
				maxW = 160
			end
			vcbOptions.Panel2["Box"..i]["PopOut"..k]:HookScript("OnEnter", function(self)
				local parent = self:GetParent()
				local word = parent.Title:GetText()
				VDW.Tooltip_Show(self, prefixTip, string.format(VDWtranslate.Global.STYLE_TIP, word), Color.Main, "Left")
			end)
		end
		VDW.CreateOptionsPopOut(vcbOptions.Panel2, i, k, Color.Main, Color.High)
	end
end
-- Box 8, Checkbutton 1, interrupt color
vcbOptions.Panel2.Box8.CheckButton1.Text:SetText(string.format(VDWtranslate.Global.COLOR_THE_BAR_IF_COOLDOWN, VCB.InterruptSpell))
vcbOptions.Panel2.Box8.CheckButton1.Text:SetWidth(vcbOptions.Panel2.Box8:GetWidth()*0.8)
vcbOptions.Panel2.Box8.CheckButton1:SetScript("OnEnter", function(self)
	VDW.Tooltip_Show(self, prefixTip, string.format(VDWtranslate.Global.CHECK_IF_YOU_WANT_TO_COLOR_BAR, VCB.InterruptSpell), Color.Main, "Left")
end)
vcbOptions.Panel2.Box8.CheckButton1:HookScript("OnLeave", function(self) VDW.Tooltip_Hide() end)
vcbOptions.Panel2.Box8.CheckButton1:HookScript("OnClick", function (self, button)
	if button == "LeftButton" then
		if self:GetChecked() == true then
			VCBsettings.Target.StatusBar.Interrupt.Show = true
			self.Text:SetTextColor(Color.Main:GetRGB())
			self:SetAlpha(1)
		elseif self:GetChecked() == false then
			VCBsettings.Target.StatusBar.Interrupt.Show = false
			self.Text:SetTextColor(0.35, 0.35, 0.35, 0.8)
		end
		PlaySound(858, "Master")
		VCB.chkStatusColorTarget()
	end
end)
-- Box 10, PopOut 1, lock-unlock bar
vcbOptions.Panel2.Box10.PopOut1.Title:SetText(VDWtranslate.Global.LOCKING)
for k, v in ipairs(barLock) do
	counter = counter + 1
	VDW.CreateOptionsPopOutButtons(vcbOptions.Panel2, 10, 1, k, v, Color.Main)
	vcbOptions.Panel2.Box10.PopOut1["Choice"..k]:HookScript("OnClick", function(self, button, down)
		if button == "LeftButton" and down == false then
			VCBsettings.Target.Lock = v.value
			C_UI.Reload()
		end
	end)
	local w = vcbOptions.Panel2.Box10.PopOut1["Choice"..k].Text:GetStringWidth()
	if w > maxW then maxW = w end
end
for c = 1, counter, 1 do
	vcbOptions.Panel2.Box10.PopOut1["Choice"..c]:SetWidth(finalW)
end
counter = 0
maxW = 160
vcbOptions.Panel2.Box10.PopOut1:HookScript("OnEnter", function(self)
	local parent = self:GetParent()
	local word = parent.Title:GetText()
	VDW.Tooltip_Show(self, prefixTip, string.format(VDWtranslate.Global.LOCKING_TIP_TARGET, word), Color.Main, "Left")
end)
VDW.CreateOptionsPopOut(vcbOptions.Panel2, 10, 1, Color.Main, Color.High)
-- Box 10, Slider 1, scale bar
VDW.CreateOptionsSlider("VCB", vcbOptions.Panel2, 10, 1, "10%", "200%", 10, 200, Color.Main, Color.High)
vcbOptions.Panel2.Box10.Slider1.Slider:SetScript("OnValueChanged", function (self, value, userInput)
	vcbOptions.Panel2.Box10.Slider1.TopText:SetText(VDWtranslate.Global.SCALE..": "..self:GetValue().."%")
	VCBsettings.Target.Scale = self:GetValue()
	TargetVCBpreview:SetScale(VCBsettings.Target.Scale/100)
	if vcbTargetCastbar then VCB.TargetCastbarSize() end
	PlaySound(858, "Master")
end)
-- Box 11, slider 1-2, size width-Height
VDW.CreateOptionsSlider("VCB", vcbOptions.Panel2, 11, 1, 80, 320, 80, 320, Color.Main, Color.High)
vcbOptions.Panel2.Box11.Slider1.Slider:SetScript("OnValueChanged", function (self, value, userInput)
	vcbOptions.Panel2.Box11.Slider1.TopText:SetText(VDWtranslate.Global.WIDTH..": "..self:GetValue())
	VCBsettings.Target.Size.Width = self:GetValue()
	TargetVCBpreview:SetSize(VCBsettings.Target.Size.Width, VCBsettings.Target.Size.Height)
	if vcbTargetCastbar then VCB.TargetCastbarSize() end
	PlaySound(858, "Master")
end)
VDW.CreateOptionsSlider("VCB", vcbOptions.Panel2, 11, 2, 8, 40, 8, 40, Color.Main, Color.High)
vcbOptions.Panel2.Box11.Slider2.Slider:SetScript("OnValueChanged", function (self, value, userInput)
	vcbOptions.Panel2.Box11.Slider2.TopText:SetText(VDWtranslate.Global.HEIGHT..": "..self:GetValue())
	VCBsettings.Target.Size.Height = self:GetValue()
	TargetVCBpreview:SetSize(VCBsettings.Target.Size.Width, VCBsettings.Target.Size.Height)
	if vcbTargetCastbar then VCB.TargetCastbarSize() end
	PlaySound(858, "Master")
end)
-- taking care of the cast bar preview
TargetVCBpreview.Text:SetText(VDWtranslate.Global.TARGET_CAST_BAR)
-- enter
TargetVCBpreview:SetScript("OnEnter", function(self)
	VDW.Tooltip_Show(self, prefixTip, VDWtranslate.Global.LEFT_CLICK.." "..VDWtranslate.Global.DRAG_ME_TO_MOVE, Color.Main)
end)
-- leave
TargetVCBpreview:HookScript("OnLeave", function(self) VDW.Tooltip_Hide() end)
-- Function for stoping the movement
local function StopMoving(self)
	VCBsettings.Target.Position.X = Round(self:GetLeft())
	VCBsettings.Target.Position.Y = Round(self:GetBottom())
	VCB.TargetCastbarPosition()
	self:StopMovingOrSizing()
end
-- Moving the target preview
TargetVCBpreview:RegisterForDrag("LeftButton")
TargetVCBpreview:SetScript("OnDragStart", TargetVCBpreview.StartMoving)
TargetVCBpreview:SetScript("OnDragStop", function(self) StopMoving(self) end)
-- Hiding the target preview
TargetVCBpreview:SetScript("OnHide", function(self)
	VCBsettings.Target.Position.X = Round(self:GetLeft())
	VCBsettings.Target.Position.Y = Round(self:GetBottom())
end)
-- functions for the check
local function PositionDecimalsSec(box, timeText)
	vcbOptions.Panel2["Box"..box].PopOut1.Text:SetText(textPositionByValue[VCBsettings.Target[timeText].Position] or VDWtranslate.Global.HIDE)
	vcbOptions.Panel2["Box"..box].PopOut2.Text:SetText(textDecimalByValue[VCBsettings.Target[timeText].Decimals] or VDWtranslate.Global.HIDE)
	vcbOptions.Panel2["Box"..box].PopOut3.Text:SetText(textSecByValue[VCBsettings.Target[timeText].Sec] or VDWtranslate.Global.HIDE)
end
-- Checking the Saved Variables
local function CheckSavedVariables()
	PositionDecimalsSec(1, "CurrentTimeText")
	PositionDecimalsSec(2, "BothTimeText")
	PositionDecimalsSec(3, "TotalTimeText")
-- direction
	vcbOptions.Panel2.Box1.PopOut4.Text:SetText(textDirectionByValue[VCBsettings.Target.CurrentTimeText.Direction] or VDWtranslate.Global.HIDE)
	vcbOptions.Panel2.Box2.PopOut4.Text:SetText(textDirectionByValue[VCBsettings.Target.BothTimeText.Direction] or VDWtranslate.Global.HIDE)
-- name, borderText, icon, shield position
	vcbOptions.Panel2.Box4.PopOut1.Text:SetText(textPositionByValue[VCBsettings.Target.NameText.Position] or VDWtranslate.Global.HIDE)
	vcbOptions.Panel2.Box5.PopOut1.Text:SetText(textBorderByValue[VCBsettings.Target.BorderText.Position] or VDWtranslate.Global.HIDE)
	vcbOptions.Panel2.Box6.PopOut1.Text:SetText(iconPositionByValue[VCBsettings.Target.Icon.Position] or VDWtranslate.Global.HIDE)
	vcbOptions.Panel2.Box7.PopOut1.Text:SetText(iconPositionByValue[VCBsettings.Target.Shield.Position] or VDWtranslate.Global.HIDE)
-- status, border
	vcbOptions.Panel2.Box8.PopOut1.Text:SetText(barColorByValue[VCBsettings.Target.StatusBar.Color] or VDWtranslate.Global.HIDE)
	vcbOptions.Panel2.Box8.PopOut2.Text:SetText(barStyleByValue[VCBsettings.Target.StatusBar.Style] or VDWtranslate.Global.HIDE)
	vcbOptions.Panel2.Box9.PopOut1.Text:SetText(barColorByValue[VCBsettings.Target.Border.Color] or VDWtranslate.Global.HIDE)
	vcbOptions.Panel2.Box9.PopOut2.Text:SetText(borderStyleByValue[VCBsettings.Target.Border.Style] or VDWtranslate.Global.HIDE)
	if VCBsettings.Target.StatusBar.Interrupt.Show then
		vcbOptions.Panel2.Box8.CheckButton1:SetChecked(true)
		vcbOptions.Panel2.Box8.CheckButton1.Text:SetTextColor(Color.Main:GetRGB())
		vcbOptions.Panel2.Box8.CheckButton1:SetAlpha(1)
	else
		vcbOptions.Panel2.Box8.CheckButton1:SetChecked(false)
		vcbOptions.Panel2.Box8.CheckButton1.Text:SetTextColor(0.35, 0.35, 0.35, 0.8)
	end
-- lock-unlock bar
	vcbOptions.Panel2.Box10.PopOut1.Text:SetText(barLockByValue[VCBsettings.Target.Lock] or VDWtranslate.Global.HIDE)
	if VCBsettings.Target.Lock then
		VDW.sliderDisable(vcbOptions.Panel2.Box10.Slider1)
		VDW.sliderDisable(vcbOptions.Panel2.Box11.Slider1)
		VDW.sliderDisable(vcbOptions.Panel2.Box11.Slider2)
		if TargetVCBpreview:IsShown() then TargetVCBpreview:Hide() end
	else
		VDW.sliderEnable(vcbOptions.Panel2.Box10.Slider1)
		VDW.sliderEnable(vcbOptions.Panel2.Box11.Slider1)
		VDW.sliderEnable(vcbOptions.Panel2.Box11.Slider2)
		TargetVCBpreview:ClearAllPoints()
		TargetVCBpreview:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", VCBsettings.Target.Position.X, VCBsettings.Target.Position.Y)
		if not TargetVCBpreview:IsShown() then TargetVCBpreview:Show() end
	end
	vcbOptions.Panel2.Box10.Slider1.Slider:SetValue(VCBsettings.Target.Scale)
	vcbOptions.Panel2.Box11.Slider1.Slider:SetValue(VCBsettings.Target.Size.Width)
	vcbOptions.Panel2.Box11.Slider2.Slider:SetValue(VCBsettings.Target.Size.Height)
end

-- Show the option panel
vcbOptions.Panel2:HookScript("OnShow", function(self)
	vcbOptions.Tab1.Text:SetTextColor(0.4, 0.4, 0.4, 1)
	vcbOptions.Tab2.Text:SetTextColor(Color.High:GetRGB())
	for i = 3, 6, 1 do
		vcbOptions["Tab"..i].Text:SetTextColor(0.4, 0.4, 0.4, 1)
		if vcbOptions["Panel"..i]:IsShown() then vcbOptions["Panel"..i]:Hide() end
	end
	if vcbOptions.Panel1:IsShown() then vcbOptions.Panel1:Hide() end
	CheckSavedVariables()
end)
-- Hide the option panel
vcbOptions.Panel2:HookScript("OnHide", function(self)
	if TargetVCBpreview:IsShown() then TargetVCBpreview:Hide() end
end)
