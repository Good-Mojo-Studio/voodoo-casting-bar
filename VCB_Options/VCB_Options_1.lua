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
local gcdPosition = {
	{value = "Left", text = VDWtranslate.Global.LEFT},
	{value = "Top", text = VDWtranslate.Global.TOP},
	{value = "Right", text = VDWtranslate.Global.RIGHT},
	{value = "Bottom", text = VDWtranslate.Global.BOTTOM},
}
local gcdPositionByValue = {}
for _, option in ipairs(gcdPosition) do
	gcdPositionByValue[option.value] = option.text
end
local gcdStyle = {
	{value = "Icon", text = VDWtranslate.Global.ICON},
	{value = "Bar", text = VDWtranslate.Global.BAR},
	{value = "InstantCastBar", text = "Instant Cast Bar"},
}
local gcdStyleByValue = {}
for _, option in ipairs(gcdStyle) do
	gcdStyleByValue[option.value] = option.text
end
local gcdIconStyle = {
	{value = "ClassSquare", text = VDWtranslate.Global.CLASS_SQUARE},
	{value = "ClassRound", text = VDWtranslate.Global.CLASS_ROUND},
	{value = "Hero", text = VDWtranslate.Global.HERO},
	{value = "FactionRound", text = VDWtranslate.Global.FACTION_ROUND},
	{value = "FactionOld", text = VDWtranslate.Global.FACTION_OLD},
	{value = "FactionNew", text = VDWtranslate.Global.FACTION_NEW},
	{value = "SpellIcon", text = VDWtranslate.Global.SPELL_ICON},
}
local gcdIconStyleByValue = {}
for _, option in ipairs(gcdIconStyle) do
	gcdIconStyleByValue[option.value] = option.text
end
local gcdBarFill = {
	{value = "Standard", text = VDWtranslate.Global.STANDARD},
	{value = "Reversed", text = VDWtranslate.Global.REVERSED},
	{value = "Center", text = VDWtranslate.Global.CENTER},
}
local gcdBarFillByValue = {}
for _, option in ipairs(gcdBarFill) do
	gcdBarFillByValue[option.value] = option.text
end
local instantStyle = {
	{value = "Default", text = VDWtranslate.Global.DEFAULT},
	{value = "Custom", text = VDWtranslate.Global.CUSTOM},
}
local instantStyleByValue = {}
for _, option in ipairs(instantStyle) do
	instantStyleByValue[option.value] = option.text
end
local barColor = {
	{value = "Default", text = VDWtranslate.Global.DEFAULT},
	{value = "Class", text = VDWtranslate.Global.CLASS},
	{value = "Faction", text = VDWtranslate.Global.FACTION},
	{value = "SpellsSchool", text = VDWtranslate.Global.SPELL_SCHOOL},
}
local barColorByValue = {}
for _, option in ipairs(barColor) do
	barColorByValue[option.value] = option.text
end
local borderColor = {
	{value = "Default", text = VDWtranslate.Global.DEFAULT},
	{value = "Class", text = VDWtranslate.Global.CLASS},
	{value = "Faction", text = VDWtranslate.Global.FACTION},
}
local borderColorByValue = {}
for _, option in ipairs(borderColor) do
	borderColorByValue[option.value] = option.text
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
VDW.CreateOptionsPanel(vcbOptions.Panel1, VDW.Background.VCB, Color.Main, Color.High, 0.3, "VCB")
vcbOptions.Panel1.TopTxt:SetText(string.format(VDWtranslate.Global.OPTIONS_FOR, VDWtranslate.Global.PLAYER_CAST_BAR))
-- create the boxes
vcbOptions.Panel1.Box1:SetHeight(120)
vcbOptions.Panel1.Box1.Title:SetText(VDWtranslate.Global.CAST_TIME_CURRENT)
vcbOptions.Panel1.Box2:SetHeight(120)
vcbOptions.Panel1.Box2:SetPoint("TOPLEFT", vcbOptions.Panel1.Box3, "BOTTOMLEFT", 0, 0)
vcbOptions.Panel1.Box2.Title:SetText(VDWtranslate.Global.CAST_TIME_BOTH)
vcbOptions.Panel1.Box3:SetHeight(120)
vcbOptions.Panel1.Box3:SetPoint("TOPLEFT", vcbOptions.Panel1.Box1, "BOTTOMLEFT", 0, 0)
vcbOptions.Panel1.Box3.Title:SetText(VDWtranslate.Global.CAST_TIME_TOTAL)
vcbOptions.Panel1.Box4:SetWidth(138)
vcbOptions.Panel1.Box4:SetPoint("TOPLEFT", vcbOptions.Panel1.Box1, "TOPRIGHT", 0, 0)
vcbOptions.Panel1.Box4.Title:SetText(VDWtranslate.Global.SPELL_NAME)
vcbOptions.Panel1.Box5:SetWidth(138)
vcbOptions.Panel1.Box5:SetPoint("TOPLEFT", vcbOptions.Panel1.Box4, "TOPRIGHT", 0, 0)
vcbOptions.Panel1.Box5.Title:SetText(VDWtranslate.Global.TEXT_BORDER)
vcbOptions.Panel1.Box6:SetWidth(138)
vcbOptions.Panel1.Box6:SetPoint("TOPLEFT", vcbOptions.Panel1.Box4, "BOTTOMLEFT", 0, 0)
vcbOptions.Panel1.Box6.Title:SetText(VDWtranslate.Global.SPELL_ICON)
vcbOptions.Panel1.Box7:SetWidth(138)
vcbOptions.Panel1.Box7:SetPoint("TOPLEFT", vcbOptions.Panel1.Box6, "TOPRIGHT", 0, 0)
vcbOptions.Panel1.Box7.Title:SetText(VDWtranslate.Global.SHIELD_ICON)
vcbOptions.Panel1.Box14:SetPoint("TOPLEFT", vcbOptions.Panel1.Box6, "BOTTOMLEFT", 0, 0)
vcbOptions.Panel1.Box14.Title:SetText(VDWtranslate.Global.BAR_STATUS)
vcbOptions.Panel1.Box15:SetPoint("TOPLEFT", vcbOptions.Panel1.Box14, "BOTTOMLEFT", 0, 0)
vcbOptions.Panel1.Box15.Title:SetText(VDWtranslate.Global.BAR_BORDER)
vcbOptions.Panel1.Box8:SetHeight(112)
vcbOptions.Panel1.Box8:SetPoint("TOPLEFT", vcbOptions.Panel1.Box5, "TOPRIGHT", 0, 0)
vcbOptions.Panel1.Box8.Title:SetText(VDWtranslate.Global.GLOBAL_COOLDOWN)
vcbOptions.Panel1.Box9:SetPoint("TOPLEFT", vcbOptions.Panel1.Box8, "BOTTOMLEFT", 0, 0)
vcbOptions.Panel1.Box9.Title:SetText(VDWtranslate.Global.GLOBAL_COOLDOWN.." "..VDWtranslate.Global.ICON)
vcbOptions.Panel1.Box10:SetHeight(168)
vcbOptions.Panel1.Box10:SetPoint("TOPLEFT", vcbOptions.Panel1.Box8, "BOTTOMLEFT", 0, 0)
vcbOptions.Panel1.Box10.Title:SetText(VDWtranslate.Global.GLOBAL_COOLDOWN.." "..VDWtranslate.Global.BAR)
vcbOptions.Panel1.Box11:SetHeight(248)
vcbOptions.Panel1.Box11:SetPoint("TOPLEFT", vcbOptions.Panel1.Box8, "BOTTOMLEFT", 0, 0)
vcbOptions.Panel1.Box11.Title:SetText("Instant Cast Bar")
vcbOptions.Panel1.Box12:SetWidth(138)
vcbOptions.Panel1.Box12:SetPoint("TOPLEFT", vcbOptions.Panel1.Box17, "BOTTOMLEFT", 0, 0)
vcbOptions.Panel1.Box12.Title:SetText(VDWtranslate.Global.LATENCY_BAR)
vcbOptions.Panel1.Box13:SetWidth(138)
vcbOptions.Panel1.Box13:SetPoint("TOPLEFT", vcbOptions.Panel1.Box12, "BOTTOMLEFT", 0, 0)
vcbOptions.Panel1.Box13.Title:SetText(VDWtranslate.Global.QUEUE_BAR)
vcbOptions.Panel1.Box16:SetWidth(138)
vcbOptions.Panel1.Box16:SetPoint("TOPLEFT", vcbOptions.Panel1.Box13, "BOTTOMLEFT", 0, 0)
vcbOptions.Panel1.Box16.Title:SetText(VDWtranslate.Global.SPELL_TICKS)
vcbOptions.Panel1.Box17:SetHeight(144)
vcbOptions.Panel1.Box17:SetWidth(210)
vcbOptions.Panel1.Box17:SetPoint("TOPLEFT", vcbOptions.Panel1.Box8, "TOPRIGHT", 0, 0)
vcbOptions.Panel1.Box17.Title:SetText(VDWtranslate.Global.CAST_BAR_SIZE)
for i = 1, 17, 1 do
	VDW.CreateOptionsBox(vcbOptions.Panel1, i, Color.Main, Color.High)
end
-- Box 1-4, Pop out 1 text position
for i = 1, 4, 1 do
	vcbOptions.Panel1["Box"..i].PopOut1.Title:SetText(VDWtranslate.Global.POSITION)
	for k, v in ipairs(textPosition) do
		counter = counter + 1
		VDW.CreateOptionsPopOutButtons(vcbOptions.Panel1, i, 1, k, v, Color.Main)
		vcbOptions.Panel1["Box"..i].PopOut1["Choice"..k]:HookScript("OnClick", function(self, button, down)
			if button == "LeftButton" and down == false then
				if i == 1 then
					VCBsettings.Player.CurrentTimeText.Position = v.value
					if VCBsettings.Player.GlobalCooldown.Instant.Style == "Default" then
						VCBsettings.Player.GlobalCooldown.Instant.RemainingTime.Position = VCBsettings.Player.CurrentTimeText.Position
						VCB.chkGlobalCooldownPlayer()
					end
					VCB.chkCurrentTxtPlayer()
					VCB.chkCurrentUpdPlayer()
				elseif i == 2 then
					VCBsettings.Player.BothTimeText.Position = v.value
					if VCBsettings.Player.GlobalCooldown.Instant.Style == "Default" then
						VCBsettings.Player.GlobalCooldown.Instant.RemainingTime.Position = VCBsettings.Player.BothTimeText.Position
						VCB.chkGlobalCooldownPlayer()
					end
					VCB.chkBothTxtPlayer()
					VCB.chkBothUpdPlayer()
				elseif i == 3 then
					VCBsettings.Player.TotalTimeText.Position = v.value
					VCB.chkTotalTxtPlayer()
					VCB.chkTotalUpdPlayer()
				elseif i == 4 then
					VCBsettings.Player.NameText.Position = v.value
					if VCBsettings.Player.GlobalCooldown.Instant.Style == "Default" then
						VCBsettings.Player.GlobalCooldown.Instant.Name.Position = VCBsettings.Player.NameText.Position
						VCB.chkGlobalCooldownPlayer()
					end
					VCB.chkNameTxtPlayer()
				end
				vcbOptions.Panel1["Box"..i].PopOut1.Text:SetText(self.Text:GetText())
				vcbOptions.Panel1["Box"..i].PopOut1.Choice1:Hide()
			end
		end)
		local w = vcbOptions.Panel1["Box"..i].PopOut1["Choice"..k].Text:GetStringWidth()
		if w > maxW then maxW = w end
	end
	finalW = math.ceil(maxW + 24)
	for c = 1, counter, 1 do
		vcbOptions.Panel1["Box"..i].PopOut1["Choice"..c]:SetWidth(finalW)
	end
	counter = 0
	maxW = 160
	VDW.CreateOptionsPopOut(vcbOptions.Panel1, i, 1, Color.Main, Color.High)
	vcbOptions.Panel1["Box"..i].PopOut1:HookScript("OnEnter", function(self)
		local parent = self:GetParent()
		local word = parent.Title:GetText()
		VDW.Tooltip_Show(self, prefixTip, string.format(VDWtranslate.Global.POSITION_TIP, word), Color.Main, "Left")
	end)
end
-- Box 1-3, Pop out 2-3 decimals and sec
for i = 1, 3, 1 do
	for k = 2, 3, 1 do
		if k == 2 then
			vcbOptions.Panel1["Box"..i]["PopOut"..k].Title:SetText(VDWtranslate.Global.DECIMALS)
			for v, name in ipairs(textDecimals) do
				counter = counter + 1
				VDW.CreateOptionsPopOutButtons(vcbOptions.Panel1, i, k, v, name, Color.Main)
				vcbOptions.Panel1["Box"..i]["PopOut"..k]["Choice"..v]:HookScript("OnClick", function(self, button, down)
					if button == "LeftButton" and down == false then
						if i == 1 then
							VCBsettings.Player.CurrentTimeText.Decimals = name.value
							VCB.chkCurrentUpdPlayer()
						elseif i == 2 then
							VCBsettings.Player.BothTimeText.Decimals = name.value
							VCB.chkBothUpdPlayer()
						elseif i == 3 then
							VCBsettings.Player.TotalTimeText.Decimals = name.value
							VCB.chkTotalUpdPlayer()
						end
						vcbOptions.Panel1["Box"..i]["PopOut"..k].Text:SetText(self.Text:GetText())
						vcbOptions.Panel1["Box"..i]["PopOut"..k].Choice1:Hide()
					end
				end)
				local w = vcbOptions.Panel1["Box"..i].PopOut1["Choice"..v].Text:GetStringWidth()
				if w > maxW then maxW = w end
			end
			finalW = math.ceil(maxW + 24)
			for c = 1, counter, 1 do
				vcbOptions.Panel1["Box"..i]["PopOut"..k]["Choice"..c]:SetWidth(finalW)
			end
			counter = 0
			maxW = 160
			vcbOptions.Panel1["Box"..i]["PopOut"..k]:HookScript("OnEnter", function(self)
				VDW.Tooltip_Show(self, prefixTip, VDWtranslate.Global.DECIMALS_TIP, Color.Main, "Left")
			end)
		else
			vcbOptions.Panel1["Box"..i]["PopOut"..k].Title:SetText("'Sec'")
			for v, name in ipairs(textSec) do
				counter = counter + 1
				VDW.CreateOptionsPopOutButtons(vcbOptions.Panel1, i, k, v, name, Color.Main)
				vcbOptions.Panel1["Box"..i]["PopOut"..k]["Choice"..v]:HookScript("OnClick", function(self, button, down)
					if button == "LeftButton" and down == false then
						if i == 1 then
							VCBsettings.Player.CurrentTimeText.Sec = name.value
							VCB.chkCurrentUpdPlayer()
						elseif i == 2 then
							VCBsettings.Player.BothTimeText.Sec = name.value
							VCB.chkBothUpdPlayer()
						elseif i == 3 then
							VCBsettings.Player.TotalTimeText.Sec = name.value
							VCB.chkTotalUpdPlayer()
						end
						vcbOptions.Panel1["Box"..i]["PopOut"..k].Text:SetText(self.Text:GetText())
						vcbOptions.Panel1["Box"..i]["PopOut"..k].Choice1:Hide()
					end
				end)
				local w = vcbOptions.Panel1["Box"..i].PopOut1["Choice"..v].Text:GetStringWidth()
				if w > maxW then maxW = w end
			end
			finalW = math.ceil(maxW + 24)
			for c = 1, counter, 1 do
				vcbOptions.Panel1["Box"..i]["PopOut"..k]["Choice"..c]:SetWidth(finalW)
			end
			counter = 0
			maxW = 160
			vcbOptions.Panel1["Box"..i]["PopOut"..k]:HookScript("OnEnter", function(self)
				local word = vcbOptions.Panel1["Box"..i]["PopOut"..k].Title:GetText()
				VDW.Tooltip_Show(self, prefixTip, string.format(VDWtranslate.Global.VISIBILITY_TIP, word), Color.Main, "Left")
			end)
		end
		VDW.CreateOptionsPopOut(vcbOptions.Panel1, i, k, Color.Main, Color.High)
	end
end
-- Box 1-2, Pop out 4 Buttons Direction
for i = 1, 2, 1 do
	vcbOptions.Panel1["Box"..i].PopOut4.Title:SetText(VDWtranslate.Global.DIRECTION)
	for k, v in ipairs(textDirection) do
		counter = counter + 1
		VDW.CreateOptionsPopOutButtons(vcbOptions.Panel1, i, 4, k, v, Color.Main)
		vcbOptions.Panel1["Box"..i].PopOut4["Choice"..k]:HookScript("OnClick", function(self, button, down)
			if button == "LeftButton" and down == false then
				if i == 1 then
					VCBsettings.Player.CurrentTimeText.Direction = v.value
					VCB.chkCurrentUpdPlayer()
				elseif i == 2 then
					VCBsettings.Player.BothTimeText.Direction = v.value
					VCB.chkBothUpdPlayer()
				end
				vcbOptions.Panel1["Box"..i].PopOut4.Text:SetText(self.Text:GetText())
				vcbOptions.Panel1["Box"..i].PopOut4.Choice1:Hide()
			end
		end)
		local w = vcbOptions.Panel1["Box"..i].PopOut4["Choice"..k].Text:GetStringWidth()
		if w > maxW then maxW = w end
	end
	finalW = math.ceil(maxW + 24)
	for c = 1, counter, 1 do
		vcbOptions.Panel1["Box"..i].PopOut4["Choice"..c]:SetWidth(finalW)
	end
	counter = 0
	maxW = 160
	VDW.CreateOptionsPopOut(vcbOptions.Panel1, i, 4, Color.Main, Color.High)
	vcbOptions.Panel1["Box"..i].PopOut4:HookScript("OnEnter", function(self)
		VDW.Tooltip_Show(self, prefixTip, VDWtranslate.Global.DIRECTION_TIMER_TIP, Color.Main, "Left")
	end)
end
-- Box 5-7, Pop out 1 Buttons Border text, Icon spell, Icon shield
for i = 5, 7, 1 do
	vcbOptions.Panel1["Box"..i].PopOut1.Title:SetText(VDWtranslate.Global.POSITION)
	if i == 5 then
		for k, v in ipairs(textBorder) do
			VDW.CreateOptionsPopOutButtons(vcbOptions.Panel1, i, 1, k, v, Color.Main)
			vcbOptions.Panel1["Box"..i].PopOut1["Choice"..k]:HookScript("OnClick", function(self, button, down)
				if button == "LeftButton" and down == false then
					VCBsettings.Player.BorderText.Position = v.value
					if VCBsettings.Player.GlobalCooldown.Instant.Style == "Default" then
						VCBsettings.Player.GlobalCooldown.Instant.TextBorder.Position = VCBsettings.Player.BorderText.Position
						VCB.chkGlobalCooldownPlayer()
					end
					vcbOptions.Panel1["Box"..i].PopOut1.Text:SetText(self.Text:GetText())
					VCB.chkPlayerBorderTextPosition()
					vcbOptions.Panel1["Box"..i].PopOut1.Choice1:Hide()
				end			
			end)
			local w = vcbOptions.Panel1["Box"..i].PopOut1["Choice"..k].Text:GetStringWidth()
			if w > maxW then maxW = w end
		end
		finalW = math.ceil(maxW + 24)
		for c = 1, counter, 1 do
			vcbOptions.Panel1["Box"..i].PopOut1["Choice"..c]:SetWidth(finalW)
		end
		counter = 0
		maxW = 160
	else
		for k, v in ipairs(iconPosition) do
			VDW.CreateOptionsPopOutButtons(vcbOptions.Panel1, i, 1, k, v, Color.Main)
			vcbOptions.Panel1["Box"..i].PopOut1["Choice"..k]:HookScript("OnClick", function(self, button, down)
				if button == "LeftButton" and down == false then
					if i == 6 then
						VCBsettings.Player.Icon.Position = v.value
						if VCBsettings.Player.GlobalCooldown.Instant.Style == "Default" then
							VCBsettings.Player.GlobalCooldown.Instant.Icon.Position = VCBsettings.Player.Icon.Position
							VCB.chkGlobalCooldownPlayer()
						end
						vcbOptions.Panel1["Box"..i].PopOut1.Text:SetText(self.Text:GetText())
						VCB.chkPlayerIconPosition()
						vcbOptions.Panel1["Box"..i].PopOut1.Choice1:Hide()
					else
						VCBsettings.Player.Shield.Position = v.value
						vcbOptions.Panel1["Box"..i].PopOut1.Text:SetText(self.Text:GetText())
						VCB.chkPlayerShieldPosition()
						vcbOptions.Panel1["Box"..i].PopOut1.Choice1:Hide()
					end
				end
			end)
			local w = vcbOptions.Panel1["Box"..i].PopOut1["Choice"..k].Text:GetStringWidth()
			if w > maxW then maxW = w end
		end
		finalW = math.ceil(maxW + 24)
		for c = 1, counter, 1 do
			vcbOptions.Panel1["Box"..i].PopOut1["Choice"..c]:SetWidth(finalW)
		end
		counter = 0
		maxW = 160
	end
	VDW.CreateOptionsPopOut(vcbOptions.Panel1, i, 1, Color.Main, Color.High)
	vcbOptions.Panel1["Box"..i].PopOut1:HookScript("OnEnter", function(self)
		local parent = self:GetParent()
		local word = parent.Title:GetText()
		VDW.Tooltip_Show(self, prefixTip, string.format(VDWtranslate.Global.POSITION_TIP, word), Color.Main, "Left")
	end)
end
-- Box 14-15, Pop out 1-2 Status & Border bar (color & style)
for i = 14, 15, 1 do
	for k = 1, 2, 1 do
		if k == 1 then
			vcbOptions.Panel1["Box"..i]["PopOut"..k].Title:SetText(VDWtranslate.Global.COLOR)
			if i == 14 then
				for v, name in ipairs(barColor) do
					counter = counter + 1
					VDW.CreateOptionsPopOutButtons(vcbOptions.Panel1, i, k, v, name, Color.Main)
					vcbOptions.Panel1["Box"..i]["PopOut"..k]["Choice"..v]:HookScript("OnClick", function(self, button, down)
						if button == "LeftButton" and down == false then
							VCBsettings.Player.StatusBar.Color = name.value
							if VCBsettings.Player.GlobalCooldown.Instant.Style == "Default" then
								VCBsettings.Player.GlobalCooldown.Instant.StatusColor = VCBsettings.Player.StatusBar.Color
								VCB.chkGlobalCooldownPlayer()
							end
							VCB.chkStatusColorPlayer()
							vcbOptions.Panel1["Box"..i]["PopOut"..k].Text:SetText(self.Text:GetText())
							vcbOptions.Panel1["Box"..i]["PopOut"..k].Choice1:Hide()
						end
					end)
					local w = vcbOptions.Panel1["Box"..i]["PopOut"..k]["Choice"..v].Text:GetStringWidth()
					if w > maxW then maxW = w end
				end
				finalW = math.ceil(maxW + 24)
				for c = 1, counter, 1 do
					vcbOptions.Panel1["Box"..i]["PopOut"..k]["Choice"..c]:SetWidth(finalW)
				end
				counter = 0
				maxW = 160
			else
				for v, name in ipairs(borderColor) do
					counter = counter + 1
					VDW.CreateOptionsPopOutButtons(vcbOptions.Panel1, i, k, v, name, Color.Main)
					vcbOptions.Panel1["Box"..i]["PopOut"..k]["Choice"..v]:HookScript("OnClick", function(self, button, down)
						if button == "LeftButton" and down == false then
							VCBsettings.Player.Border.Color = name.value
							if VCBsettings.Player.GlobalCooldown.Instant.Style == "Default" then
								VCBsettings.Player.GlobalCooldown.Instant.BorderColor = VCBsettings.Player.Border.Color
								VCB.chkGlobalCooldownPlayer()
							end
							VCB.chkBorderColorPlayer()
							vcbOptions.Panel1["Box"..i]["PopOut"..k].Text:SetText(self.Text:GetText())
							vcbOptions.Panel1["Box"..i]["PopOut"..k].Choice1:Hide()
						end
					end)
					local w = vcbOptions.Panel1["Box"..i]["PopOut"..k]["Choice"..v].Text:GetStringWidth()
					if w > maxW then maxW = w end
				end
				finalW = math.ceil(maxW + 24)
				for c = 1, counter, 1 do
					vcbOptions.Panel1["Box"..i]["PopOut"..k]["Choice"..c]:SetWidth(finalW)
				end
				counter = 0
				maxW = 160
			end
			vcbOptions.Panel1["Box"..i]["PopOut"..k]:HookScript("OnEnter", function(self)
				local parent = self:GetParent()
				local word = parent.Title:GetText()
				VDW.Tooltip_Show(self, prefixTip, string.format(VDWtranslate.Global.COLOR_TIP, word), Color.Main, "Left")
			end)
		else
			vcbOptions.Panel1["Box"..i]["PopOut"..k].Title:SetText(VDWtranslate.Global.STYLE)
			if i == 14 then
				for v, name in ipairs(barStyle) do
					counter = counter + 1
					VDW.CreateOptionsPopOutButtons(vcbOptions.Panel1, i, k, v, name, Color.Main)
					vcbOptions.Panel1["Box"..i]["PopOut"..k]["Choice"..v]:HookScript("OnClick", function(self, button, down)
						if button == "LeftButton" and down == false then
							VCBsettings.Player.StatusBar.Style = name.value
							if VCBsettings.Player.GlobalCooldown.Instant.Style == "Default" then
								VCBsettings.Player.GlobalCooldown.Instant.StastusStyle = VCBsettings.Player.StatusBar.Style
								VCB.chkGlobalCooldownPlayer()
							end
							VCB.chkStatusStylePlayer()
							vcbOptions.Panel1["Box"..i]["PopOut"..k].Text:SetText(self.Text:GetText())
							vcbOptions.Panel1["Box"..i]["PopOut"..k].Choice1:Hide()
						end
					end)
					local w = vcbOptions.Panel1["Box"..i]["PopOut"..k]["Choice"..v].Text:GetStringWidth()
					if w > maxW then maxW = w end
				end
				finalW = math.ceil(maxW + 24)
				for c = 1, counter, 1 do
					vcbOptions.Panel1["Box"..i]["PopOut"..k]["Choice"..c]:SetWidth(finalW)
				end
				counter = 0
				maxW = 160
			else
				for v, name in ipairs(borderStyle) do
					counter = counter + 1
					VDW.CreateOptionsPopOutButtons(vcbOptions.Panel1, i, k, v, name, Color.Main)
					vcbOptions.Panel1["Box"..i]["PopOut"..k]["Choice"..v]:HookScript("OnClick", function(self, button, down)
						if button == "LeftButton" and down == false then
							VCBsettings.Player.Border.Style = name.value
							if VCBsettings.Player.GlobalCooldown.Instant.Style == "Default" then
								VCBsettings.Player.GlobalCooldown.Instant.BorderStyle = VCBsettings.Player.Border.Style
								VCB.chkGlobalCooldownPlayer()
							end
							VCB.chkBorderStylePlayer()
							vcbOptions.Panel1["Box"..i]["PopOut"..k].Text:SetText(self.Text:GetText())
							vcbOptions.Panel1["Box"..i]["PopOut"..k].Choice1:Hide()
						end
					end)
					local w = vcbOptions.Panel1["Box"..i]["PopOut"..k]["Choice"..v].Text:GetStringWidth()
					if w > maxW then maxW = w end
				end
				finalW = math.ceil(maxW + 24)
				for c = 1, counter, 1 do
					vcbOptions.Panel1["Box"..i]["PopOut"..k]["Choice"..c]:SetWidth(finalW)
				end
				counter = 0
				maxW = 160
			end
			vcbOptions.Panel1["Box"..i]["PopOut"..k]:HookScript("OnEnter", function(self)
				local parent = self:GetParent()
				local word = parent.Title:GetText()
				VDW.Tooltip_Show(self, prefixTip, string.format(VDWtranslate.Global.STYLE_TIP, word), Color.Main, "Left")
			end)
		end
		VDW.CreateOptionsPopOut(vcbOptions.Panel1, i, k, Color.Main, Color.High)
	end
end
-- Box 12-13, Pop out 1 latency & queue bar
for i = 12, 13, 1 do
	vcbOptions.Panel1["Box"..i].PopOut1.Title:SetText(VDWtranslate.Global.VISIBILITY)
	for k, v in ipairs(textSec) do
		counter = counter + 1
		VDW.CreateOptionsPopOutButtons(vcbOptions.Panel1, i, 1, k, v, Color.Main)
		vcbOptions.Panel1["Box"..i].PopOut1["Choice"..k]:HookScript("OnClick", function(self, button, down)
			if button == "LeftButton" and down == false then
				if i == 12 then
					VCBsettings.Player.LagBar.Visibility = v.value
				else
					VCBsettings.Player.QueueBar.Visibility = v.value
				end
				vcbOptions.Panel1["Box"..i].PopOut1.Text:SetText(self.Text:GetText())
				vcbOptions.Panel1["Box"..i].PopOut1.Choice1:Hide()
			end
		end)
		local w = vcbOptions.Panel1["Box"..i].PopOut1["Choice"..k].Text:GetStringWidth()
		if w > maxW then maxW = w end
	end
	for c = 1, counter, 1 do
		vcbOptions.Panel1["Box"..i].PopOut1["Choice"..c]:SetWidth(finalW)
	end
	counter = 0
	maxW = 160
	vcbOptions.Panel1["Box"..i].PopOut1:HookScript("OnEnter", function(self)
		local parent = self:GetParent()
		local word = parent.Title:GetText()
		VDW.Tooltip_Show(self, prefixTip, string.format(VDWtranslate.Global.VISIBILITY_TIP, word), Color.Main, "Left")
	end)
	VDW.CreateOptionsPopOut(vcbOptions.Panel1, i, 1, Color.Main, Color.High)
end
-- Box 16, Pop out 1 Ticks of the Spell
vcbOptions.Panel1.Box16.PopOut1.Title:SetText(VDWtranslate.Global.VISIBILITY)
for k, v in ipairs(textSec) do
	counter = counter + 1
	VDW.CreateOptionsPopOutButtons(vcbOptions.Panel1, 16, 1, k, v, Color.Main)
	vcbOptions.Panel1.Box16.PopOut1["Choice"..k]:HookScript("OnClick", function(self, button, down)
		if button == "LeftButton" and down == false then
			VCBspecialSettings.Player.Ticks = v.value
			vcbOptions.Panel1.Box16.PopOut1.Text:SetText(self.Text:GetText())
			vcbOptions.Panel1.Box16.PopOut1.Choice1:Hide()
		end
	end)
	local w = vcbOptions.Panel1.Box16.PopOut1["Choice"..k].Text:GetStringWidth()
	if w > maxW then maxW = w end
end
for c = 1, counter, 1 do
	vcbOptions.Panel1.Box16.PopOut1["Choice"..c]:SetWidth(finalW)
end
counter = 0
maxW = 160
vcbOptions.Panel1.Box16.PopOut1:HookScript("OnEnter", function(self)
	local parent = self:GetParent()
	local word = parent.Title:GetText()
	VDW.Tooltip_Show(self, prefixTip, string.format(VDWtranslate.Global.VISIBILITY_TIP, word), Color.Main, "Left")
end)
VDW.CreateOptionsPopOut(vcbOptions.Panel1, 16, 1, Color.Main, Color.High)
-- Box 17, Slider 1-2 width & height
VDW.CreateOptionsSlider("VCB", vcbOptions.Panel1, 17, 1, 80, 320, 80, 320, Color.Main, Color.High)
vcbOptions.Panel1.Box17.Slider1.Slider:SetScript("OnValueChanged", function (self, value, userInput)
	vcbOptions.Panel1.Box17.Slider1.TopText:SetText(VDWtranslate.Global.WIDTH..": "..self:GetValue())
	VCBsettings.Player.Size.Width = self:GetValue()
	VCB.resizeCastBar(PlayerCastingBarFrame)
	PlaySound(858, "Master")
end)
VDW.CreateOptionsSlider("VCB", vcbOptions.Panel1, 17, 2, 8, 40, 8, 40, Color.Main, Color.High)
vcbOptions.Panel1.Box17.Slider2.Slider:SetScript("OnValueChanged", function (self, value, userInput)
	vcbOptions.Panel1.Box17.Slider2.TopText:SetText(VDWtranslate.Global.HEIGHT..": "..self:GetValue())
	VCBsettings.Player.Size.Height = self:GetValue()
	VCB.resizeCastBar(PlayerCastingBarFrame)
	PlaySound(858, "Master")
end)
-- Box 8, Checkbutton 1, PopOut 1-2, enable-disable global cooldown
local function GlobalCooldownStyle()
	if VCBsettings.Player.GlobalCooldown.Style == "Icon" then
		if not vcbOptions.Panel1.Box8.PopOut2:IsShown() then vcbOptions.Panel1.Box8.PopOut2:Show() end
		if not vcbOptions.Panel1.Box9:IsShown() then vcbOptions.Panel1.Box9:Show() end
		if vcbOptions.Panel1.Box10:IsShown() then vcbOptions.Panel1.Box10:Hide() end
		if vcbOptions.Panel1.Box11:IsShown() then vcbOptions.Panel1.Box11:Hide() end
	elseif VCBsettings.Player.GlobalCooldown.Style == "Bar" then
		if not vcbOptions.Panel1.Box8.PopOut2:IsShown() then vcbOptions.Panel1.Box8.PopOut2:Show() end
		if not vcbOptions.Panel1.Box10:IsShown() then vcbOptions.Panel1.Box10:Show() end
		if vcbOptions.Panel1.Box9:IsShown() then vcbOptions.Panel1.Box9:Hide() end
		if vcbOptions.Panel1.Box11:IsShown() then vcbOptions.Panel1.Box11:Hide() end
	elseif VCBsettings.Player.GlobalCooldown.Style == "InstantCastBar" or VCBsettings.Player.GlobalCooldown.Style == "Instant Cast Bar" then
		if vcbOptions.Panel1.Box8.PopOut2:IsShown() then vcbOptions.Panel1.Box8.PopOut2:Hide() end
		if not vcbOptions.Panel1.Box11:IsShown() then vcbOptions.Panel1.Box11:Show() end
		if vcbOptions.Panel1.Box9:IsShown() then vcbOptions.Panel1.Box9:Hide() end
		if vcbOptions.Panel1.Box10:IsShown() then vcbOptions.Panel1.Box10:Hide() end
	end
end
local function GlobalCooldownEnable(self)
	self.Text:SetTextColor(Color.Main:GetRGB())
	self.Text:SetAlpha(1)
	VDW.popEnable(vcbOptions.Panel1.Box8.PopOut1)
	VDW.popEnable(vcbOptions.Panel1.Box8.PopOut2)
	VCBsettings.Player.GlobalCooldown.Enable = true
	GlobalCooldownStyle()
end
local function GlobalCooldownDisable(self)
	self.Text:SetTextColor(0.35, 0.35, 0.35, 0.8)
	VDW.popDisable(vcbOptions.Panel1.Box8.PopOut1)
	VDW.popDisable(vcbOptions.Panel1.Box8.PopOut2)
	VCBsettings.Player.GlobalCooldown.Enable = false
	for i = 9, 11, 1 do
		vcbOptions.Panel1["Box"..i]:Hide()
	end
end
vcbOptions.Panel1.Box8.CheckButton1.Text:SetText(VDWtranslate.Global.ENABLE_GLOBAL_COOLDOWN)
vcbOptions.Panel1.Box8.CheckButton1.Text:SetWidth(vcbOptions.Panel1.Box8:GetWidth()*0.8)
vcbOptions.Panel1.Box8.CheckButton1:SetScript("OnEnter", function(self)
	local word = self.Text:GetText()
	VDW.Tooltip_Show(self, prefixTip, string.format(VDWtranslate.Global.CHECK_IF_YOU_WANT_TO_SHOW, word), Color.Main, "Left")
end)
vcbOptions.Panel1.Box8.CheckButton1:HookScript("OnLeave", function(self) VDW.Tooltip_Hide() end)
vcbOptions.Panel1.Box8.CheckButton1:HookScript("OnClick", function (self, button)
	if button == "LeftButton" then
		if self:GetChecked() == true then
			GlobalCooldownEnable(self)
		elseif self:GetChecked() == false then
			GlobalCooldownDisable(self)
		end
		PlaySound(858, "Master")
	end
end)
-- Box 8, Pop out 1 style of GCD
vcbOptions.Panel1.Box8.PopOut1.Title:SetText(VDWtranslate.Global.STYLE)
for k, v in ipairs(gcdStyle) do
	counter = counter + 1
	VDW.CreateOptionsPopOutButtons(vcbOptions.Panel1, 8, 1, k, v, Color.Main)
	vcbOptions.Panel1.Box8.PopOut1["Choice"..k]:HookScript("OnClick", function(self, button, down)
		if button == "LeftButton" and down == false then
			VCBsettings.Player.GlobalCooldown.Style = v.value
			VCB.chkGlobalCooldownPlayer()
			GlobalCooldownStyle()
			vcbOptions.Panel1.Box8.PopOut1.Text:SetText(self.Text:GetText())
			vcbOptions.Panel1.Box8.PopOut1.Choice1:Hide()
		end
	end)
	local w = vcbOptions.Panel1.Box8.PopOut1["Choice"..k].Text:GetStringWidth()
	if w > maxW then maxW = w end
end
for c = 1, counter, 1 do
	vcbOptions.Panel1.Box8.PopOut1["Choice"..c]:SetWidth(finalW)
end
counter = 0
maxW = 160
vcbOptions.Panel1.Box8.PopOut1:HookScript("OnEnter", function(self)
	local parent = self:GetParent()
	local word = parent.Title:GetText()
	VDW.Tooltip_Show(self, prefixTip, string.format(VDWtranslate.Global.STYLE_TIP, word), Color.Main, "Left")
end)
VDW.CreateOptionsPopOut(vcbOptions.Panel1, 8, 1, Color.Main, Color.High)
-- Box 8, Pop out 2 position of GCD
vcbOptions.Panel1.Box8.PopOut2.Title:SetText(VDWtranslate.Global.POSITION)
for k, v in ipairs(gcdPosition) do
	counter = counter + 1
	VDW.CreateOptionsPopOutButtons(vcbOptions.Panel1, 8, 2, k, v, Color.Main)
	vcbOptions.Panel1.Box8.PopOut2["Choice"..k]:HookScript("OnClick", function(self, button, down)
		if button == "LeftButton" and down == false then
			VCBsettings.Player.GlobalCooldown.Position = v.value
			VCB.chkGlobalCooldownPlayer()
			vcbOptions.Panel1.Box8.PopOut2.Text:SetText(self.Text:GetText())
			vcbOptions.Panel1.Box8.PopOut2.Choice1:Hide()
		end
	end)
	local w = vcbOptions.Panel1.Box8.PopOut2["Choice"..k].Text:GetStringWidth()
	if w > maxW then maxW = w end
end
for c = 1, counter, 1 do
	vcbOptions.Panel1.Box8.PopOut2["Choice"..c]:SetWidth(finalW)
end
counter = 0
maxW = 160
vcbOptions.Panel1.Box8.PopOut2:HookScript("OnEnter", function(self)
	local parent = self:GetParent()
	local word = parent.Title:GetText()
	VDW.Tooltip_Show(self, prefixTip, string.format(VDWtranslate.Global.POSITION_TIP, word), Color.Main, "Left")
end)
VDW.CreateOptionsPopOut(vcbOptions.Panel1, 8, 2, Color.Main, Color.High)
-- Box 9, Pop out 1 style of GCD (icon)
vcbOptions.Panel1.Box9.PopOut1.Title:SetText(VDWtranslate.Global.STYLE)
for k, v in ipairs(gcdIconStyle) do
	counter = counter + 1
	VDW.CreateOptionsPopOutButtons(vcbOptions.Panel1, 9, 1, k, v, Color.Main)
	vcbOptions.Panel1.Box9.PopOut1["Choice"..k]:HookScript("OnClick", function(self, button, down)
		if button == "LeftButton" and down == false then
			VCBsettings.Player.GlobalCooldown.Icon.Style = v.value
			VCB.chkGlobalCooldownPlayer()
			vcbOptions.Panel1.Box9.PopOut1.Text:SetText(self.Text:GetText())
			vcbOptions.Panel1.Box9.PopOut1.Choice1:Hide()
		end
	end)
	local w = vcbOptions.Panel1.Box9.PopOut1["Choice"..k].Text:GetStringWidth()
	if w > maxW then maxW = w end
end
for c = 1, counter, 1 do
	vcbOptions.Panel1.Box9.PopOut1["Choice"..c]:SetWidth(finalW)
end
counter = 0
maxW = 160
vcbOptions.Panel1.Box9.PopOut1:HookScript("OnEnter", function(self)
	local parent = self:GetParent()
	local word = parent.Title:GetText()
	VDW.Tooltip_Show(self, prefixTip, string.format(VDWtranslate.Global.STYLE_TIP, word), Color.Main, "Left")
end)
VDW.CreateOptionsPopOut(vcbOptions.Panel1, 9, 1, Color.Main, Color.High)
-- Box 10-11, PopOut 1-4, bar and border style-color (gcdBar, Instant bar)
for i = 10, 11, 1 do
	for k = 1, 4, 1 do
		if k == 1 then
			vcbOptions.Panel1["Box"..i]["PopOut"..k].Title:SetText(VDWtranslate.Global.BAR.." "..VDWtranslate.Global.STYLE)
			for v, name in pairs(barStyle) do
				counter = counter + 1
				VDW.CreateOptionsPopOutButtons(vcbOptions.Panel1, i, k, v, name, Color.Main)
				vcbOptions.Panel1["Box"..i]["PopOut"..k]["Choice"..v]:HookScript("OnClick", function(self, button, down)
					if button == "LeftButton" and down == false then
						if i == 10 then
							VCBsettings.Player.GlobalCooldown.Bar.Style = name.value
						elseif i == 11 then
							VCBsettings.Player.GlobalCooldown.Instant.StastusStyle = name.value
						end
						VCB.chkGlobalCooldownPlayer()
						vcbOptions.Panel1["Box"..i]["PopOut"..k].Text:SetText(self.Text:GetText())
						vcbOptions.Panel1["Box"..i]["PopOut"..k].Choice1:Hide()
					end
				end)
				local w = vcbOptions.Panel1["Box"..i]["PopOut"..k]["Choice"..v].Text:GetStringWidth()
				if w > maxW then maxW = w end
			end
			for c = 1, counter, 1 do
				vcbOptions.Panel1["Box"..i]["PopOut"..k]["Choice"..c]:SetWidth(finalW)
			end
			counter = 0
			maxW = 160
			vcbOptions.Panel1["Box"..i]["PopOut"..k]:HookScript("OnEnter", function(self)
				VDW.Tooltip_Show(self, prefixTip, string.format(VDWtranslate.Global.STYLE_TIP, VDWtranslate.Global.BAR), Color.Main, "Left")
			end)
		elseif k == 2 then
			vcbOptions.Panel1["Box"..i]["PopOut"..k].Title:SetText(VDWtranslate.Global.BAR.." "..VDWtranslate.Global.COLOR)
			if i == 10 then
				for v, name in pairs(borderColor) do
					counter = counter + 1
					VDW.CreateOptionsPopOutButtons(vcbOptions.Panel1, i, k, v, name, Color.Main)
					vcbOptions.Panel1["Box"..i]["PopOut"..k]["Choice"..v]:HookScript("OnClick", function(self, button, down)
						if button == "LeftButton" and down == false then
							VCBsettings.Player.GlobalCooldown.Bar.Color = name.value
							VCB.chkGlobalCooldownPlayer()
							vcbOptions.Panel1["Box"..i]["PopOut"..k].Text:SetText(self.Text:GetText())
							vcbOptions.Panel1["Box"..i]["PopOut"..k].Choice1:Hide()
						end
					end)
					local w = vcbOptions.Panel1["Box"..i]["PopOut"..k]["Choice"..v].Text:GetStringWidth()
					if w > maxW then maxW = w end
				end
				for c = 1, counter, 1 do
					vcbOptions.Panel1["Box"..i]["PopOut"..k]["Choice"..c]:SetWidth(finalW)
				end
				counter = 0
				maxW = 160
			elseif i == 11 then
				for v, name in pairs(barColor) do
					counter = counter + 1
					VDW.CreateOptionsPopOutButtons(vcbOptions.Panel1, i, k, v, name, Color.Main)
					vcbOptions.Panel1["Box"..i]["PopOut"..k]["Choice"..v]:HookScript("OnClick", function(self, button, down)
						if button == "LeftButton" and down == false then
							VCBsettings.Player.GlobalCooldown.Instant.StatusColor = name.value
							VCB.chkGlobalCooldownPlayer()
							vcbOptions.Panel1["Box"..i]["PopOut"..k].Text:SetText(self.Text:GetText())
							vcbOptions.Panel1["Box"..i]["PopOut"..k].Choice1:Hide()
						end
					end)
					local w = vcbOptions.Panel1["Box"..i]["PopOut"..k]["Choice"..v].Text:GetStringWidth()
					if w > maxW then maxW = w end
				end
				counter = 0
				maxW = 160	
			end
			vcbOptions.Panel1["Box"..i]["PopOut"..k]:HookScript("OnEnter", function(self)
				VDW.Tooltip_Show(self, prefixTip, string.format(VDWtranslate.Global.COLOR_TIP, VDWtranslate.Global.BAR), Color.Main, "Left")
			end)
		elseif k == 3 then
			vcbOptions.Panel1["Box"..i]["PopOut"..k].Title:SetText(VDWtranslate.Global.BORDER.." "..VDWtranslate.Global.STYLE)
			for v, name in pairs(borderStyle) do
				counter = counter + 1
				VDW.CreateOptionsPopOutButtons(vcbOptions.Panel1, i, k, v, name, Color.Main)
				vcbOptions.Panel1["Box"..i]["PopOut"..k]["Choice"..v]:HookScript("OnClick", function(self, button, down)
					if button == "LeftButton" and down == false then
						if i == 10 then
							VCBsettings.Player.GlobalCooldown.Bar.BorderStyle = name.value
						elseif i == 11 then
							VCBsettings.Player.GlobalCooldown.Instant.BorderStyle = name.value
						end
						VCB.chkGlobalCooldownPlayer()
						vcbOptions.Panel1["Box"..i]["PopOut"..k].Text:SetText(self.Text:GetText())
						vcbOptions.Panel1["Box"..i]["PopOut"..k].Choice1:Hide()
					end
				end)
				local w = vcbOptions.Panel1["Box"..i]["PopOut"..k]["Choice"..v].Text:GetStringWidth()
				if w > maxW then maxW = w end
			end
			for c = 1, counter, 1 do
				vcbOptions.Panel1["Box"..i]["PopOut"..k]["Choice"..c]:SetWidth(finalW)
			end
			counter = 0
			maxW = 160
			vcbOptions.Panel1["Box"..i]["PopOut"..k]:HookScript("OnEnter", function(self)
				VDW.Tooltip_Show(self, prefixTip, string.format(VDWtranslate.Global.STYLE_TIP, VDWtranslate.Global.BORDER), Color.Main, "Left")
			end)
		elseif k == 4 then
			vcbOptions.Panel1["Box"..i]["PopOut"..k].Title:SetText(VDWtranslate.Global.BORDER.." "..VDWtranslate.Global.COLOR)
			for v, name in pairs(borderColor) do
				counter = counter + 1
				VDW.CreateOptionsPopOutButtons(vcbOptions.Panel1, i, k, v, name, Color.Main)
				vcbOptions.Panel1["Box"..i]["PopOut"..k]["Choice"..v]:HookScript("OnClick", function(self, button, down)
					if button == "LeftButton" and down == false then
						if i == 10 then
							VCBsettings.Player.GlobalCooldown.Bar.BorderColor = name.value
						elseif i == 11 then
							VCBsettings.Player.GlobalCooldown.Instant.BorderColor = name.value
						end
						VCB.chkGlobalCooldownPlayer()
						vcbOptions.Panel1["Box"..i]["PopOut"..k].Text:SetText(self.Text:GetText())
						vcbOptions.Panel1["Box"..i]["PopOut"..k].Choice1:Hide()
					end
				end)
				local w = vcbOptions.Panel1["Box"..i]["PopOut"..k]["Choice"..v].Text:GetStringWidth()
				if w > maxW then maxW = w end
			end
			for c = 1, counter, 1 do
				vcbOptions.Panel1["Box"..i]["PopOut"..k]["Choice"..c]:SetWidth(finalW)
			end
			counter = 0
			maxW = 160
			vcbOptions.Panel1["Box"..i]["PopOut"..k]:HookScript("OnEnter", function(self)
				VDW.Tooltip_Show(self, prefixTip, string.format(VDWtranslate.Global.COLOR_TIP, VDWtranslate.Global.BORDER), Color.Main, "Left")
			end)
		end
		VDW.CreateOptionsPopOut(vcbOptions.Panel1, i, k, Color.Main, Color.High)
	end
end
-- Box 10, PopOut 5, fill style (gcdBar)
vcbOptions.Panel1.Box10.PopOut5.Title:SetText(VDWtranslate.Global.BAR_FILL)
for k, v in ipairs(gcdBarFill) do
	counter = counter + 1
	VDW.CreateOptionsPopOutButtons(vcbOptions.Panel1, 10, 5, k, v, Color.Main)
	vcbOptions.Panel1.Box10.PopOut5["Choice"..k]:HookScript("OnClick", function(self, button, down)
		if button == "LeftButton" and down == false then
			VCBsettings.Player.GlobalCooldown.Bar.Fill = v.value
			VCB.chkGlobalCooldownPlayer()
			vcbOptions.Panel1.Box10.PopOut5.Text:SetText(self.Text:GetText())
			vcbOptions.Panel1.Box10.PopOut5.Choice1:Hide()
		end
	end)
	local w = vcbOptions.Panel1.Box10.PopOut5["Choice"..k].Text:GetStringWidth()
	if w > maxW then maxW = w end
end
for c = 1, counter, 1 do
	vcbOptions.Panel1.Box10.PopOut5["Choice"..c]:SetWidth(finalW)
end
counter = 0
maxW = 160
vcbOptions.Panel1.Box10.PopOut5:HookScript("OnEnter", function(self)
	local word = self.Title:GetText()
	VDW.Tooltip_Show(self, prefixTip, string.format(VDWtranslate.Global.BAR_FILL_TIP, word), Color.Main, "Left")
end)
VDW.CreateOptionsPopOut(vcbOptions.Panel1, 10, 5, Color.Main, Color.High)
-- Box 11, PopOut 0, custom-default (Instant bar)
local function PopOutInstantCastBar()
	vcbOptions.Panel1.Box11.PopOut1.Text:SetText(barStyleByValue[VCBsettings.Player.GlobalCooldown.Instant.StastusStyle] or VDWtranslate.Global.HIDE)
	vcbOptions.Panel1.Box11.PopOut2.Text:SetText(barColorByValue[VCBsettings.Player.GlobalCooldown.Instant.StatusColor] or VDWtranslate.Global.HIDE)
	vcbOptions.Panel1.Box11.PopOut3.Text:SetText(borderStyleByValue[VCBsettings.Player.GlobalCooldown.Instant.BorderStyle] or VDWtranslate.Global.HIDE)
	vcbOptions.Panel1.Box11.PopOut4.Text:SetText(borderColorByValue[VCBsettings.Player.GlobalCooldown.Instant.BorderColor] or VDWtranslate.Global.HIDE)
	vcbOptions.Panel1.Box11.PopOut5.Text:SetText(textBorderByValue[VCBsettings.Player.GlobalCooldown.Instant.TextBorder.Position] or VDWtranslate.Global.HIDE)
	vcbOptions.Panel1.Box11.PopOut6.Text:SetText(iconPositionByValue[VCBsettings.Player.GlobalCooldown.Instant.Icon.Position] or VDWtranslate.Global.HIDE)
	vcbOptions.Panel1.Box11.PopOut7.Text:SetText(textPositionByValue[VCBsettings.Player.GlobalCooldown.Instant.Name.Position] or VDWtranslate.Global.HIDE)
	vcbOptions.Panel1.Box11.PopOut8.Text:SetText(textPositionByValue[VCBsettings.Player.GlobalCooldown.Instant.RemainingTime.Position] or VDWtranslate.Global.HIDE)
end
vcbOptions.Panel1.Box11.PopOut0.Title:SetText(VDWtranslate.Global.LAYOUT)
for k, v in ipairs(instantStyle) do
	counter = counter + 1
	VDW.CreateOptionsPopOutButtons(vcbOptions.Panel1, 11, 0, k, v, Color.Main)
	vcbOptions.Panel1.Box11.PopOut0["Choice"..k]:HookScript("OnClick", function(self, button, down)
		if button == "LeftButton" and down == false then
			VCBsettings.Player.GlobalCooldown.Instant.Style = v.value
			if VCBsettings.Player.GlobalCooldown.Instant.Style == "Default" then
				VCBsettings.Player.GlobalCooldown.Instant.StastusStyle = VCBsettings.Player.StatusBar.Style
				VCBsettings.Player.GlobalCooldown.Instant.StatusColor = VCBsettings.Player.StatusBar.Color
				VCBsettings.Player.GlobalCooldown.Instant.BorderStyle = VCBsettings.Player.Border.Style
				VCBsettings.Player.GlobalCooldown.Instant.BorderColor = VCBsettings.Player.Border.Color
				VCBsettings.Player.GlobalCooldown.Instant.TextBorder.Position = VCBsettings.Player.BorderText.Position
				VCBsettings.Player.GlobalCooldown.Instant.Icon.Position = VCBsettings.Player.Icon.Position
				VCBsettings.Player.GlobalCooldown.Instant.Name.Position = VCBsettings.Player.NameText.Position
				if VCBsettings.Player.CurrentTimeText.Position ~= "Hide" and VCBsettings.Player.BothTimeText.Position  == "Hide" then
					VCBsettings.Player.GlobalCooldown.Instant.RemainingTime.Position = VCBsettings.Player.CurrentTimeText.Position
				elseif VCBsettings.Player.CurrentTimeText.Position == "Hide" and VCBsettings.Player.BothTimeText.Position  ~= "Hide" then
					VCBsettings.Player.GlobalCooldown.Instant.RemainingTime.Position = VCBsettings.Player.BothTimeText.Position
				elseif VCBsettings.Player.CurrentTimeText.Position ~= "Hide" and VCBsettings.Player.BothTimeText.Position  ~= "Hide" then
					VCBsettings.Player.GlobalCooldown.Instant.RemainingTime.Position = VCBsettings.Player.BothTimeText.Position
				else
					VCBsettings.Player.GlobalCooldown.Instant.RemainingTime.Position = "Hide"
				end
				PopOutInstantCastBar()
			else
				PopOutInstantCastBar()
			end
			VCB.chkGlobalCooldownPlayer()
			vcbOptions.Panel1.Box11.PopOut0.Text:SetText(self.Text:GetText())
			vcbOptions.Panel1.Box11.PopOut0.Choice1:Hide()
		end
	end)
	local w = vcbOptions.Panel1.Box11.PopOut0["Choice"..k].Text:GetStringWidth()
	if w > maxW then maxW = w end
end
for c = 1, counter, 1 do
	vcbOptions.Panel1.Box11.PopOut0["Choice"..c]:SetWidth(finalW)
end
counter = 0
maxW = 160
vcbOptions.Panel1.Box11.PopOut0:HookScript("OnEnter", function(self)
	local parent = self:GetParent()
	local word = parent.Title:GetText()
	VDW.Tooltip_Show(self, prefixTip, string.format(VDWtranslate.Global.LAYOUT_INSTANT_TIP, word), Color.Main, "Left")
end)
VDW.CreateOptionsPopOut(vcbOptions.Panel1, 11, 0, Color.Main, Color.High)
-- Box 11, PopOut 5, textBorder (instant)
vcbOptions.Panel1.Box11.PopOut5.Title:SetText(VDWtranslate.Global.TEXT_BORDER)
for k, v in ipairs(textBorder) do
	counter = counter + 1
	VDW.CreateOptionsPopOutButtons(vcbOptions.Panel1, 11, 5, k, v, Color.Main)
	vcbOptions.Panel1.Box11.PopOut5["Choice"..k]:HookScript("OnClick", function(self, button, down)
		if button == "LeftButton" and down == false then
			VCBsettings.Player.GlobalCooldown.Instant.TextBorder.Position = v.value
			VCB.chkGlobalCooldownPlayer()
			vcbOptions.Panel1.Box11.PopOut5.Text:SetText(self.Text:GetText())
			vcbOptions.Panel1.Box11.PopOut5.Choice1:Hide()
		end
	end)
	local w = vcbOptions.Panel1.Box11.PopOut5["Choice"..k].Text:GetStringWidth()
	if w > maxW then maxW = w end
end
for c = 1, counter, 1 do
	vcbOptions.Panel1.Box11.PopOut5["Choice"..c]:SetWidth(finalW)
end
counter = 0
maxW = 160
vcbOptions.Panel1.Box11.PopOut5:HookScript("OnEnter", function(self)
	local word = self.Title:GetText()
	VDW.Tooltip_Show(self, prefixTip, string.format(VDWtranslate.Global.POSITION_TIP, word), Color.Main, "Left")
end)
VDW.CreateOptionsPopOut(vcbOptions.Panel1, 11, 5, Color.Main, Color.High)
-- Box 11, PopOut 6, spellIcon (instant)
vcbOptions.Panel1.Box11.PopOut6.Title:SetText(VDWtranslate.Global.SPELL_ICON)
for k, v in ipairs(iconPosition) do
	counter = counter + 1
	VDW.CreateOptionsPopOutButtons(vcbOptions.Panel1, 11, 6, k, v, Color.Main)
	vcbOptions.Panel1.Box11.PopOut6["Choice"..k]:HookScript("OnClick", function(self, button, down)
		if button == "LeftButton" and down == false then
			VCBsettings.Player.GlobalCooldown.Instant.Icon.Position = v.value
			VCB.chkGlobalCooldownPlayer()
			vcbOptions.Panel1.Box11.PopOut6.Text:SetText(self.Text:GetText())
			vcbOptions.Panel1.Box11.PopOut6.Choice1:Hide()
		end
	end)
	local w = vcbOptions.Panel1.Box11.PopOut6["Choice"..k].Text:GetStringWidth()
	if w > maxW then maxW = w end
end
for c = 1, counter, 1 do
	vcbOptions.Panel1.Box11.PopOut6["Choice"..c]:SetWidth(finalW)
end
counter = 0
maxW = 160
vcbOptions.Panel1.Box11.PopOut6:HookScript("OnEnter", function(self)
	local word = self.Title:GetText()
	VDW.Tooltip_Show(self, prefixTip, string.format(VDWtranslate.Global.POSITION_TIP, word), Color.Main, "Left")
end)
VDW.CreateOptionsPopOut(vcbOptions.Panel1, 11, 6, Color.Main, Color.High)
-- Box 11, PopOut 7-8, spellName-remainingTime (instant)
for i = 7, 8, 1 do
	if i == 7 then
		vcbOptions.Panel1.Box11["PopOut"..i].Title:SetText(VDWtranslate.Global.SPELL_NAME)
	else
		vcbOptions.Panel1.Box11["PopOut"..i].Title:SetText(VDWtranslate.Global.TIME)
	end
	for k, v in ipairs(textPosition) do
		counter = counter + 1
		VDW.CreateOptionsPopOutButtons(vcbOptions.Panel1, 11, i, k, v, Color.Main)
		vcbOptions.Panel1.Box11["PopOut"..i]["Choice"..k]:HookScript("OnClick", function(self, button, down)
			if button == "LeftButton" and down == false then
				if i == 7 then
					VCBsettings.Player.GlobalCooldown.Instant.Name.Position = v.value
				else
					VCBsettings.Player.GlobalCooldown.Instant.RemainingTime.Position = v.value
				end
				VCB.chkGlobalCooldownPlayer()
				vcbOptions.Panel1.Box11["PopOut"..i].Text:SetText(self.Text:GetText())
				vcbOptions.Panel1.Box11["PopOut"..i].Choice1:Hide()
			end
		end)
		local w = vcbOptions.Panel1.Box11["PopOut"..i]["Choice"..k].Text:GetStringWidth()
		if w > maxW then maxW = w end
	end
	for c = 1, counter, 1 do
		vcbOptions.Panel1.Box11["PopOut"..i]["Choice"..c]:SetWidth(finalW)
	end
	counter = 0
	maxW = 160
	VDW.CreateOptionsPopOut(vcbOptions.Panel1, 11, i, Color.Main, Color.High)
	vcbOptions.Panel1.Box11["PopOut"..i]:HookScript("OnEnter", function(self)
		local word = self.Title:GetText()
		VDW.Tooltip_Show(self, prefixTip, string.format(VDWtranslate.Global.POSITION_TIP, word), Color.Main, "Left")
	end)
end
-- functions for the check
local function PositionDecimalsSec(box, timeText)
	vcbOptions.Panel1["Box"..box].PopOut1.Text:SetText(textPositionByValue[VCBsettings.Player[timeText].Position] or VDWtranslate.Global.HIDE)
	vcbOptions.Panel1["Box"..box].PopOut2.Text:SetText(textDecimalByValue[VCBsettings.Player[timeText].Decimals] or VDWtranslate.Global.HIDE)
	vcbOptions.Panel1["Box"..box].PopOut3.Text:SetText(textSecByValue[VCBsettings.Player[timeText].Sec] or VDWtranslate.Global.HIDE)
end
-- check Saved Variables
local function CheckSavedVariables()
	PositionDecimalsSec(1, "CurrentTimeText")
	PositionDecimalsSec(2, "BothTimeText")
	PositionDecimalsSec(3, "TotalTimeText")
-- direction
	vcbOptions.Panel1.Box1.PopOut4.Text:SetText(textDirectionByValue[VCBsettings.Player.CurrentTimeText.Direction] or VDWtranslate.Global.HIDE)
	vcbOptions.Panel1.Box2.PopOut4.Text:SetText(textDirectionByValue[VCBsettings.Player.BothTimeText.Direction] or VDWtranslate.Global.HIDE)
-- name, borderText, icon, shield position
	vcbOptions.Panel1.Box4.PopOut1.Text:SetText(textPositionByValue[VCBsettings.Player.NameText.Position] or VDWtranslate.Global.HIDE)
	vcbOptions.Panel1.Box5.PopOut1.Text:SetText(textBorderByValue[VCBsettings.Player.BorderText.Position] or VDWtranslate.Global.HIDE)
	vcbOptions.Panel1.Box6.PopOut1.Text:SetText(iconPositionByValue[VCBsettings.Player.Icon.Position] or VDWtranslate.Global.HIDE)
	vcbOptions.Panel1.Box7.PopOut1.Text:SetText(iconPositionByValue[VCBsettings.Player.Shield.Position] or VDWtranslate.Global.HIDE)
-- lagbar, queuebar, ticks visibility
	vcbOptions.Panel1.Box12.PopOut1.Text:SetText(textSecByValue[VCBsettings.Player.LagBar.Visibility] or VDWtranslate.Global.HIDE)
	vcbOptions.Panel1.Box13.PopOut1.Text:SetText(textSecByValue[VCBsettings.Player.QueueBar.Visibility] or VDWtranslate.Global.HIDE)
	vcbOptions.Panel1.Box16.PopOut1.Text:SetText(textSecByValue[VCBspecialSettings.Player.Ticks] or VDWtranslate.Global.HIDE)
-- status, border, size
	vcbOptions.Panel1.Box14.PopOut1.Text:SetText(barColorByValue[VCBsettings.Player.StatusBar.Color] or VDWtranslate.Global.HIDE)
	vcbOptions.Panel1.Box14.PopOut2.Text:SetText(barStyleByValue[VCBsettings.Player.StatusBar.Style] or VDWtranslate.Global.HIDE)
	vcbOptions.Panel1.Box15.PopOut1.Text:SetText(borderColorByValue[VCBsettings.Player.Border.Color] or VDWtranslate.Global.HIDE)
	vcbOptions.Panel1.Box15.PopOut2.Text:SetText(borderStyleByValue[VCBsettings.Player.Border.Style] or VDWtranslate.Global.HIDE)
	vcbOptions.Panel1.Box17.Slider1.Slider:SetValue(VCBsettings.Player.Size.Width)
	vcbOptions.Panel1.Box17.Slider2.Slider:SetValue(VCBsettings.Player.Size.Height)
-- global cooldown
	if VCBsettings.Player.GlobalCooldown.Enable then
		vcbOptions.Panel1.Box8.CheckButton1:SetChecked(true)
		GlobalCooldownEnable(vcbOptions.Panel1.Box8.CheckButton1)
	else
		vcbOptions.Panel1.Box8.CheckButton1:SetChecked(false)
		GlobalCooldownDisable(vcbOptions.Panel1.Box8.CheckButton1)
	end
	vcbOptions.Panel1.Box8.PopOut1.Text:SetText(gcdStyleByValue[VCBsettings.Player.GlobalCooldown.Style] or VDWtranslate.Global.HIDE)
	vcbOptions.Panel1.Box8.PopOut2.Text:SetText(gcdPositionByValue[VCBsettings.Player.GlobalCooldown.Position] or VDWtranslate.Global.HIDE)
-- icon
	vcbOptions.Panel1.Box9.PopOut1.Text:SetText(gcdIconStyleByValue[VCBsettings.Player.GlobalCooldown.Icon.Style] or VDWtranslate.Global.HIDE)
-- bar
	vcbOptions.Panel1.Box10.PopOut1.Text:SetText(barStyleByValue[VCBsettings.Player.GlobalCooldown.Bar.Style] or VDWtranslate.Global.HIDE)
	vcbOptions.Panel1.Box10.PopOut2.Text:SetText(borderColorByValue[VCBsettings.Player.GlobalCooldown.Bar.Color] or VDWtranslate.Global.HIDE)
	vcbOptions.Panel1.Box10.PopOut3.Text:SetText(borderStyleByValue[VCBsettings.Player.GlobalCooldown.Bar.BorderStyle] or VDWtranslate.Global.HIDE)
	vcbOptions.Panel1.Box10.PopOut4.Text:SetText(borderColorByValue[VCBsettings.Player.GlobalCooldown.Bar.BorderColor] or VDWtranslate.Global.HIDE)
	vcbOptions.Panel1.Box10.PopOut5.Text:SetText(gcdBarFillByValue[VCBsettings.Player.GlobalCooldown.Bar.Fill]  or VDWtranslate.Global.HIDE)
-- instant cast bar
	vcbOptions.Panel1.Box11.PopOut0.Text:SetText(instantStyleByValue[VCBsettings.Player.GlobalCooldown.Instant.Style] or VDWtranslate.Global.HIDE)
	PopOutInstantCastBar()
end
-- Show the option panel
vcbOptions.Panel1:HookScript("OnShow", function(self)
	vcbOptions.Tab1.Text:SetTextColor(Color.High:GetRGB())
	for i = 2, 6, 1 do
		vcbOptions["Tab"..i].Text:SetTextColor(0.4, 0.4, 0.4, 1)
		if vcbOptions["Panel"..i]:IsShown() then vcbOptions["Panel"..i]:Hide() end
	end
	CheckSavedVariables()
end)
-- Background of the tabs frame
VDW.CreateBackgroundTab(vcbOptions, "Panel1", "Tab1", VDW.Background.VCB, 0.3, Color.NoHigh, Color.High)
