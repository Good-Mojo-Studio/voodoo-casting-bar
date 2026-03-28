-- some variables
local G = VDWtranslate.Global
local L = VDWtranslate.VCB.Options
local C = VDW.GetAddonColors("VCB")
local prefixTip = VDW.Prefix("VCB")
local prefixChat = VDW.PrefixChat("VCB")
local maxW = 160
local finalW = 0
local counter = 0
local textPosition = {
	{value = "Hide", text = G.HIDE},
	{value = "TopLeft", text = G.TOPLEFT},
	{value = "Left", text = G.LEFT},
	{value = "BottomLeft", text = G.BOTTOMLEFT},
	{value = "Top", text = G.TOP},
	{value = "Center", text = G.CENTER},
	{value = "Bottom", text = G.BOTTOM},
	{value = "TopRight", text = G.TOPRIGHT},
	{value = "Right", text = G.RIGHT},
	{value = "BottomRight", text = G.BOTTOMRIGHT},
}
local textPositionByValue = {}
for _, option in ipairs(textPosition) do
	textPositionByValue[option.value] = option.text
end
local textSec = {
	{value = false, text = G.HIDE},
	{value = true, text = G.SHOW},
}
local textSecByValue = {}
for _, option in ipairs(textSec) do
	textSecByValue[option.value] = option.text
end
local textDirection = {
	{value = "Ascending", text = G.ASCENDING},
	{value = "Descending", text = G.DESCENDING},
	{value = "Both", text = G.BOTH},
}
local textDirectionByValue = {}
for _, option in ipairs(textDirection) do
	textDirectionByValue[option.value] = option.text
end
local textBorder = {
	{value = "Hide", text = G.HIDE},
	{value = "Top", text = G.TOP},
	{value = "Bottom", text = G.BOTTOM},
	{value = "Both", text = G.BOTH},
}
local textBorderByValue = {}
for _, option in ipairs(textBorder) do
	textBorderByValue[option.value] = option.text
end
local iconPosition = {
	{value = "Hide", text = G.HIDE},
	{value = "Left", text = G.LEFT},
	{value = "Right", text = G.RIGHT},
	{value = "Both", text = G.BOTH},
}
local iconPositionByValue = {}
for _, option in ipairs(iconPosition) do
	iconPositionByValue[option.value] = option.text
end
local barColor = {
	{value = "Default", text = G.DEFAULT},
	{value = "Class", text = G.CLASS},
}
local barColorByValue = {}
for _, option in ipairs(barColor) do
	barColorByValue[option.value] = option.text
end
local barStyle = {
	{value = "Default", text = G.DEFAULT},
	{value = "Jailer", text = "Jailer"},
}
local barStyleByValue = {}
for _, option in ipairs(barStyle) do
	barStyleByValue[option.value] = option.text
end
local barLock = {
	{value = false, text = G.UNLOCKED},
	{value = true, text = G.LOCKED},
}
local barLockByValue = {}
for _, option in ipairs(barLock) do
	barLockByValue[option.value] = option.text
end
local textDecimals = {"0", "1", "2", "3"}
-- Taking care of the option panel
vcbOptions2:ClearAllPoints()
vcbOptions2:SetPoint("TOPLEFT", vcbOptions0, "TOPLEFT", 0, 0)
-- Background of the option panel
vcbOptions2.BGtexture:SetAtlas("UI-Journeys-BG", false)
vcbOptions2.BGtexture:SetVertexColor(C.High:GetRGB())
vcbOptions2.Logo:SetVertexColor(C.Main:GetRGB())
vcbOptions2.BGtexture:SetDesaturation(0.3)
vcbOptions2.BorderTopRight:SetVertexColor(C.High:GetRGB())
vcbOptions2.BorderBottomRight:SetVertexColor(C.High:GetRGB())
vcbOptions2.BorderRightMiddle:SetVertexColor(C.High:GetRGB())
vcbOptions2.BorderTopLeft:SetVertexColor(C.High:GetRGB())
vcbOptions2.BorderBottomLeft:SetVertexColor(C.High:GetRGB())
vcbOptions2.BorderLeftMiddle:SetVertexColor(C.High:GetRGB())
vcbOptions2.BorderTopMiddle:SetVertexColor(C.High:GetRGB())
vcbOptions2.BorderBottomMiddle:SetVertexColor(C.High:GetRGB())
-- Title of the option panel
vcbOptions2.Title:SetTextColor(C.Main:GetRGB())
vcbOptions2.Title:SetText(prefixTip.."|nVersion: "..C.High:WrapTextInColorCode(C_AddOns.GetAddOnMetadata("VCB", "Version")))
-- Top text of the option panel
vcbOptions2.TopTxt:SetTextColor(C.Main:GetRGB())
vcbOptions2.TopTxt:SetText(string.format(L.OPTIONS_FOR, L.TARGET_CAST_BAR))
-- Bottom right text of the option panel
vcbOptions2.BottomRightTxt:SetTextColor(C.Main:GetRGB())
vcbOptions2.BottomRightTxt:SetText("May the Good "..C.High:WrapTextInColorCode("Mojo").." be with you! ")
-- taking care of the boxes
vcbOptions2Box1.Title:SetText(L.CURRENT_CAST_TIME)
vcbOptions2Box1:SetHeight(120)
vcbOptions2Box2.Title:SetText(L.BOTH_CAST_TIME)
vcbOptions2Box2:SetHeight(120)
vcbOptions2Box2:SetPoint("TOPLEFT", vcbOptions2Box3, "BOTTOMLEFT", 0, 0)
vcbOptions2Box3.Title:SetText(L.TOTAL_CAST_TIME)
vcbOptions2Box3:SetHeight(120)
vcbOptions2Box3:SetPoint("TOPLEFT", vcbOptions2Box1, "BOTTOMLEFT", 0, 0)
vcbOptions2Box4.Title:SetText(L.SPELL_NAME)
vcbOptions2Box4:SetWidth(138)
vcbOptions2Box4:SetPoint("TOPLEFT", vcbOptions2Box1, "TOPRIGHT", 0, 0)
vcbOptions2Box4a.Title:SetText(L.BORDER_TEXT)
vcbOptions2Box4a:SetWidth(138)
vcbOptions2Box4a:SetPoint("TOPLEFT", vcbOptions2Box4, "TOPRIGHT", 0, 0)
vcbOptions2Box5.Title:SetText(L.SPELL_ICON)
vcbOptions2Box5:SetWidth(138)
vcbOptions2Box5:SetPoint("TOPLEFT", vcbOptions2Box4, "BOTTOMLEFT", 0, 0)
vcbOptions2Box5a.Title:SetText(L.SHIELD_ICON)
vcbOptions2Box5a:SetWidth(138)
vcbOptions2Box5a:SetPoint("TOPLEFT", vcbOptions2Box5, "TOPRIGHT", 0, 0)
vcbOptions2Box6.Title:SetText(L.STATUS_BAR)
vcbOptions2Box6:SetHeight(120)
vcbOptions2Box6:SetPoint("TOPLEFT", vcbOptions2Box5, "BOTTOMLEFT", 0, 0)
vcbOptions2Box7.Title:SetText(L.BAR_BORDER)
vcbOptions2Box7:SetPoint("TOPLEFT", vcbOptions2Box6, "BOTTOMLEFT", 0, 0)
vcbOptions2Box8.Title:SetText(L.UNLOCK_CAST_BAR)
vcbOptions2Box8:SetPoint("TOPLEFT", vcbOptions2Box4a, "TOPRIGHT", 0, 0)
vcbOptions2Box9.Title:SetText(L.CAST_BAR_SIZE)
vcbOptions2Box9:SetHeight(144)
vcbOptions2Box9:SetWidth(210)
vcbOptions2Box9:SetPoint("TOPLEFT", vcbOptions2Box8, "BOTTOMLEFT", 0, 0)
for i = 1, 9, 1 do
	local tW = _G["vcbOptions2Box"..i].Title:GetStringWidth()+16
	local W = _G["vcbOptions2Box"..i]:GetWidth()
	if tW >= W then
		_G["vcbOptions2Box"..i]:SetWidth(_G["vcbOptions2Box"..i].Title:GetStringWidth()+16)
	end
end
-- Coloring the boxes
for i = 1, 9, 1 do
	_G["vcbOptions2Box"..i].Title:SetTextColor(C.Main:GetRGB())
	_G["vcbOptions2Box"..i].BorderTop:SetVertexColor(C.High:GetRGB())
	_G["vcbOptions2Box"..i].BorderBottom:SetVertexColor(C.High:GetRGB())
	_G["vcbOptions2Box"..i].BorderLeft:SetVertexColor(C.High:GetRGB())
	_G["vcbOptions2Box"..i].BorderRight:SetVertexColor(C.High:GetRGB())
end
for i = 4, 5, 1 do
	_G["vcbOptions2Box"..i.."a"].Title:SetTextColor(C.Main:GetRGB())
	_G["vcbOptions2Box"..i.."a"].BorderTop:SetVertexColor(C.High:GetRGB())
	_G["vcbOptions2Box"..i.."a"].BorderBottom:SetVertexColor(C.High:GetRGB())
	_G["vcbOptions2Box"..i.."a"].BorderLeft:SetVertexColor(C.High:GetRGB())
	_G["vcbOptions2Box"..i.."a"].BorderRight:SetVertexColor(C.High:GetRGB())
end
-- Coloring the pop out buttons
local function ColoringPopOutButtons(k, var1)
	_G["vcbOptions2Box"..k.."PopOut"..var1].Text:SetTextColor(C.Main:GetRGB())
	_G["vcbOptions2Box"..k.."PopOut"..var1].Title:SetTextColor(C.High:GetRGB())
	_G["vcbOptions2Box"..k.."PopOut"..var1].NormalTexture:SetVertexColor(C.High:GetRGB())
	_G["vcbOptions2Box"..k.."PopOut"..var1].HighlightTexture:SetVertexColor(C.Main:GetRGB())
	_G["vcbOptions2Box"..k.."PopOut"..var1].PushedTexture:SetVertexColor(C.High:GetRGB())
end
-- check button enable - disable
local function checkButtonEnable(self)
	self:EnableMouse(true)
	self.Text:SetTextColor(C.Main:GetRGB())
end
local function checkButtonDisable(self)
	self:SetChecked(false)
	self:EnableMouse(false)
	self.Text:SetTextColor(0.35, 0.35, 0.35, 0.8)
end
-- pop out button enable - disable
local function popEnable(self)
	self:EnableMouse(true)
	self:SetAlpha(1)
end
local function popDisable(self)
	self:EnableMouse(false)
	self:SetAlpha(0.35)
end
-- slider enable - disable
local function sliderEnable(self)
	self.Slider:EnableMouse(true)
	self.Back:EnableMouse(true)
	self.Forward:EnableMouse(true)
	self:SetAlpha(1)
end
local function sliderDisable(self)
	self.Slider:EnableMouse(false)
	self.Back:EnableMouse(false)
	self.Forward:EnableMouse(false)
	self:SetAlpha(0.35)
end
-- Mouse Wheel on Sliders
local function MouseWheelSlider(self, delta)
	if delta == 1 then
		self:SetValue(self:GetValue() + 1)
	elseif delta == -1 then
		self:SetValue(self:GetValue() - 1)
	end
end
-- Pop out 1 Buttons text position
for k = 1, 4, 1 do
	_G["vcbOptions2Box"..k.."PopOut1"].Title:SetText(L.POSITION)
	ColoringPopOutButtons(k, 1)
	for i, name in ipairs(textPosition) do
		counter = counter + 1
		local btn = CreateFrame("Button", "vcbOptions2Box"..k.."PopOut1Choice"..i, nil, "vdwPopOutButton")
		_G["vcbOptions2Box"..k.."PopOut1Choice"..i]:ClearAllPoints()
		if i == 1 then
			_G["vcbOptions2Box"..k.."PopOut1Choice"..i]:SetParent(_G["vcbOptions2Box"..k.."PopOut1"])
			_G["vcbOptions2Box"..k.."PopOut1Choice"..i]:SetPoint("TOP", "vcbOptions2Box"..k.."PopOut1", "BOTTOM", 0, 4)
			_G["vcbOptions2Box"..k.."PopOut1Choice"..i]:SetScript("OnShow", function(self)
				self:GetParent():SetNormalAtlas("charactercreate-customize-dropdownbox-hover")
				PlaySound(855, "Master")
			end)
			_G["vcbOptions2Box"..k.."PopOut1Choice"..i]:SetScript("OnHide", function(self)
				self:GetParent():SetNormalAtlas("charactercreate-customize-dropdownbox-open")
				PlaySound(855, "Master")
			end)
		else
			_G["vcbOptions2Box"..k.."PopOut1Choice"..i]:SetParent(_G["vcbOptions2Box"..k.."PopOut1Choice1"])
			_G["vcbOptions2Box"..k.."PopOut1Choice"..i]:SetPoint("TOP", _G["vcbOptions2Box"..k.."PopOut1Choice"..i-1], "BOTTOM", 0, 0)
			_G["vcbOptions2Box"..k.."PopOut1Choice"..i]:Show()
		end
		_G["vcbOptions2Box"..k.."PopOut1Choice"..i].Text:SetText(name.text)
		_G["vcbOptions2Box"..k.."PopOut1Choice"..i]:HookScript("OnClick", function(self, button, down)
			if button == "LeftButton" and down == false then
				if k == 1 then
					VCBsettings.Target.CurrentTimeText.Position = name.value
					VDW.VCB.chkCurrentTxtTarget()
					VDW.VCB.chkCurrentUpdTarget()
				elseif k== 2 then
					VCBsettings.Target.BothTimeText.Position = name.value
					VDW.VCB.chkBothTxtTarget()
					VDW.VCB.chkBothUpdTarget()
				elseif k == 3 then
					VCBsettings.Target.TotalTimeText.Position = name.value
					VDW.VCB.chkTotalTxtTarget()
					VDW.VCB.chkTotalUpdTarget()
				elseif k == 4 then
					VCBsettings.Target.NameText.Position = name.value
					VDW.VCB.chkNameTxtTarget()
				end
				_G["vcbOptions2Box"..k.."PopOut1"].Text:SetText(self.Text:GetText())
				_G["vcbOptions2Box"..k.."PopOut1Choice1"]:Hide()
			end
		end)
		local w = _G["vcbOptions2Box"..k.."PopOut1Choice"..i].Text:GetStringWidth()
		if w > maxW then maxW = w end
	end
	finalW = math.ceil(maxW + 24)
	for i = 1, counter, 1 do
		_G["vcbOptions2Box"..k.."PopOut1Choice"..i]:SetWidth(finalW)
	end
	counter = 0
	maxW = 160
	_G["vcbOptions2Box"..k.."PopOut1"]:HookScript("OnEnter", function(self)
		local parent = self:GetParent()
		local word = parent.Title:GetText()
		VDW.Tooltip_Show(self, prefixTip, string.format(L.POSITION_TIP, word), C.Main)
	end)
	_G["vcbOptions2Box"..k.."PopOut1"]:HookScript("OnLeave", function(self) VDW.Tooltip_Hide() end)
	_G["vcbOptions2Box"..k.."PopOut1"]:HookScript("OnClick", function(self, button, down)
		if button == "LeftButton" and down == false then
			if not _G["vcbOptions2Box"..k.."PopOut1Choice1"]:IsShown() then
				_G["vcbOptions2Box"..k.."PopOut1Choice1"]:Show()
			else
				_G["vcbOptions2Box"..k.."PopOut1Choice1"]:Hide()
			end
		end
	end)
end
-- Pop out 2 Buttons decimals and sec
for k = 1, 3, 1 do
-- decimals
	_G["vcbOptions2Box"..k.."PopOut2"].Title:SetText(L.DECIMALS)
	ColoringPopOutButtons(k, 2)
	for i, name in ipairs(textDecimals) do
		counter = counter + 1
		local btn = CreateFrame("Button", "vcbOptions2Box"..k.."PopOut2Choice"..i, nil, "vdwPopOutButton")
		_G["vcbOptions2Box"..k.."PopOut2Choice"..i]:ClearAllPoints()
		if i == 1 then
			_G["vcbOptions2Box"..k.."PopOut2Choice"..i]:SetParent(_G["vcbOptions2Box"..k.."PopOut2"])
			_G["vcbOptions2Box"..k.."PopOut2Choice"..i]:SetPoint("TOP", "vcbOptions2Box"..k.."PopOut2", "BOTTOM", 0, 4)
			_G["vcbOptions2Box"..k.."PopOut2Choice"..i]:SetScript("OnShow", function(self)
				self:GetParent():SetNormalAtlas("charactercreate-customize-dropdownbox-hover")
				PlaySound(855, "Master")
			end)
			_G["vcbOptions2Box"..k.."PopOut2Choice"..i]:SetScript("OnHide", function(self)
				self:GetParent():SetNormalAtlas("charactercreate-customize-dropdownbox-open")
				PlaySound(855, "Master")
			end)
		else
			_G["vcbOptions2Box"..k.."PopOut2Choice"..i]:SetParent(_G["vcbOptions2Box"..k.."PopOut2Choice1"])
			_G["vcbOptions2Box"..k.."PopOut2Choice"..i]:SetPoint("TOP", _G["vcbOptions2Box"..k.."PopOut2Choice"..i-1], "BOTTOM", 0, 0)
			_G["vcbOptions2Box"..k.."PopOut2Choice"..i]:Show()
		end
		_G["vcbOptions2Box"..k.."PopOut2Choice"..i].Text:SetText(name)
		_G["vcbOptions2Box"..k.."PopOut2Choice"..i]:HookScript("OnClick", function(self, button, down)
			if button == "LeftButton" and down == false then
				if k == 1 then
					VCBsettings.Target.CurrentTimeText.Decimals = self.Text:GetText()
					VDW.VCB.chkCurrentUpdTarget()
				elseif k== 2 then
					VCBsettings.Target.BothTimeText.Decimals = self.Text:GetText()
					VDW.VCB.chkBothUpdTarget()
				elseif k == 3 then
					VCBsettings.Target.TotalTimeText.Decimals = self.Text:GetText()
					VDW.VCB.chkTotalUpdTarget()
				end
				_G["vcbOptions2Box"..k.."PopOut2"].Text:SetText(self.Text:GetText())
				_G["vcbOptions2Box"..k.."PopOut2Choice1"]:Hide()
			end
		end)
		local w = _G["vcbOptions2Box"..k.."PopOut2Choice"..i].Text:GetStringWidth()
		if w > maxW then maxW = w end
	end
	finalW = math.ceil(maxW + 24)
	for i = 1, counter, 1 do
		_G["vcbOptions2Box"..k.."PopOut2Choice"..i]:SetWidth(finalW)
	end
	counter = 0
	maxW = 160
	_G["vcbOptions2Box"..k.."PopOut2"]:HookScript("OnEnter", function(self)
		VDW.Tooltip_Show(self, prefixTip, L.DECIMALS_TIP, C.Main) 
	end)
	_G["vcbOptions2Box"..k.."PopOut2"]:HookScript("OnLeave", function(self) VDW.Tooltip_Hide() end)
	_G["vcbOptions2Box"..k.."PopOut2"]:HookScript("OnClick", function(self, button, down)
		if button == "LeftButton" and down == false then
			if not _G["vcbOptions2Box"..k.."PopOut2Choice1"]:IsShown() then
				_G["vcbOptions2Box"..k.."PopOut2Choice1"]:Show()
			else
				_G["vcbOptions2Box"..k.."PopOut2Choice1"]:Hide()
			end
		end
	end)
-- sec
	_G["vcbOptions2Box"..k.."PopOut3"].Title:SetText("'Sec'")
	ColoringPopOutButtons(k, 3)
	for i, name in ipairs(textSec) do
		counter = counter + 1
		local btn = CreateFrame("Button", "vcbOptions2Box"..k.."PopOut3Choice"..i, nil, "vdwPopOutButton")
		_G["vcbOptions2Box"..k.."PopOut3Choice"..i]:ClearAllPoints()
		if i == 1 then
			_G["vcbOptions2Box"..k.."PopOut3Choice"..i]:SetParent(_G["vcbOptions2Box"..k.."PopOut3"])
			_G["vcbOptions2Box"..k.."PopOut3Choice"..i]:SetPoint("TOP", "vcbOptions2Box"..k.."PopOut3", "BOTTOM", 0, 4)
			_G["vcbOptions2Box"..k.."PopOut3Choice"..i]:SetScript("OnShow", function(self)
				self:GetParent():SetNormalAtlas("charactercreate-customize-dropdownbox-hover")
				PlaySound(855, "Master")
			end)
			_G["vcbOptions2Box"..k.."PopOut3Choice"..i]:SetScript("OnHide", function(self)
				self:GetParent():SetNormalAtlas("charactercreate-customize-dropdownbox-open")
				PlaySound(855, "Master")
			end)
		else
			_G["vcbOptions2Box"..k.."PopOut3Choice"..i]:SetParent(_G["vcbOptions2Box"..k.."PopOut3Choice1"])
			_G["vcbOptions2Box"..k.."PopOut3Choice"..i]:SetPoint("TOP", _G["vcbOptions2Box"..k.."PopOut3Choice"..i-1], "BOTTOM", 0, 0)
			_G["vcbOptions2Box"..k.."PopOut3Choice"..i]:Show()
		end
		_G["vcbOptions2Box"..k.."PopOut3Choice"..i].Text:SetText(name.text)
		_G["vcbOptions2Box"..k.."PopOut3Choice"..i]:HookScript("OnClick", function(self, button, down)
			if button == "LeftButton" and down == false then
				if k == 1 then
					VCBsettings.Target.CurrentTimeText.Sec = name.value
					VDW.VCB.chkCurrentUpdTarget()
				elseif k== 2 then
					VCBsettings.Target.BothTimeText.Sec = name.value
					VDW.VCB.chkBothUpdTarget()
				elseif k == 3 then
					VCBsettings.Target.TotalTimeText.Sec = name.value
					VDW.VCB.chkTotalUpdTarget()
				end
				_G["vcbOptions2Box"..k.."PopOut3"].Text:SetText(self.Text:GetText())
				_G["vcbOptions2Box"..k.."PopOut3Choice1"]:Hide()
			end
		end)
		local w = _G["vcbOptions2Box"..k.."PopOut3Choice"..i].Text:GetStringWidth()
		if w > maxW then maxW = w end
	end
	finalW = math.ceil(maxW + 24)
	for i = 1, counter, 1 do
		_G["vcbOptions2Box"..k.."PopOut3Choice"..i]:SetWidth(finalW)
	end
	counter = 0
	maxW = 160
	_G["vcbOptions2Box"..k.."PopOut3"]:HookScript("OnEnter", function(self)
		local word = _G["vcbOptions2Box"..k.."PopOut3"].Title:GetText()
		VDW.Tooltip_Show(self, prefixTip, string.format(L.VISIBILITY_TIP, word), C.Main) 
	end)
	_G["vcbOptions2Box"..k.."PopOut3"]:HookScript("OnLeave", function(self) VDW.Tooltip_Hide() end)
	_G["vcbOptions2Box"..k.."PopOut3"]:HookScript("OnClick", function(self, button, down)
		if button == "LeftButton" and down == false then
			if not _G["vcbOptions2Box"..k.."PopOut3Choice1"]:IsShown() then
				_G["vcbOptions2Box"..k.."PopOut3Choice1"]:Show()
			else
				_G["vcbOptions2Box"..k.."PopOut3Choice1"]:Hide()
			end
		end
	end)
end
-- Pop out 4 Buttons Direction 
for k = 1, 2, 1 do
	_G["vcbOptions2Box"..k.."PopOut4"].Title:SetText(L.DIRECTION)
	ColoringPopOutButtons(k, 4)
	for i, name in ipairs(textDirection) do
		counter = counter + 1
		local btn = CreateFrame("Button", "vcbOptions2Box"..k.."PopOut4Choice"..i, nil, "vdwPopOutButton")
		_G["vcbOptions2Box"..k.."PopOut4Choice"..i]:ClearAllPoints()
		if i == 1 then
			_G["vcbOptions2Box"..k.."PopOut4Choice"..i]:SetParent(_G["vcbOptions2Box"..k.."PopOut4"])
			_G["vcbOptions2Box"..k.."PopOut4Choice"..i]:SetPoint("TOP", "vcbOptions2Box"..k.."PopOut4", "BOTTOM", 0, 4)
			_G["vcbOptions2Box"..k.."PopOut4Choice"..i]:SetScript("OnShow", function(self)
				self:GetParent():SetNormalAtlas("charactercreate-customize-dropdownbox-hover")
				PlaySound(855, "Master")
			end)
			_G["vcbOptions2Box"..k.."PopOut4Choice"..i]:SetScript("OnHide", function(self)
				self:GetParent():SetNormalAtlas("charactercreate-customize-dropdownbox-open")
				PlaySound(855, "Master")
			end)
		else
			_G["vcbOptions2Box"..k.."PopOut4Choice"..i]:SetParent(_G["vcbOptions2Box"..k.."PopOut4Choice1"])
			_G["vcbOptions2Box"..k.."PopOut4Choice"..i]:SetPoint("TOP", _G["vcbOptions2Box"..k.."PopOut4Choice"..i-1], "BOTTOM", 0, 0)
			_G["vcbOptions2Box"..k.."PopOut4Choice"..i]:Show()
		end
		_G["vcbOptions2Box"..k.."PopOut4Choice"..i].Text:SetText(name.text)
		_G["vcbOptions2Box"..k.."PopOut4Choice"..i]:HookScript("OnClick", function(self, button, down)
			if button == "LeftButton" and down == false then
				if k == 1 then
					VCBsettings.Target.CurrentTimeText.Direction = name.value
					VDW.VCB.chkCurrentUpdTarget()
				elseif k== 2 then
					VCBsettings.Target.BothTimeText.Direction = name.value
					VDW.VCB.chkBothUpdTarget()
				end
				_G["vcbOptions2Box"..k.."PopOut4"].Text:SetText(self.Text:GetText())
				_G["vcbOptions2Box"..k.."PopOut4Choice1"]:Hide()
			end
		end)
		local w = _G["vcbOptions2Box"..k.."PopOut4Choice"..i].Text:GetStringWidth()
		if w > maxW then maxW = w end
	end
	finalW = math.ceil(maxW + 24)
	for i = 1, counter, 1 do
		_G["vcbOptions2Box"..k.."PopOut4Choice"..i]:SetWidth(finalW)
	end
	counter = 0
	maxW = 160
	_G["vcbOptions2Box"..k.."PopOut4"]:HookScript("OnEnter", function(self)
		VDW.Tooltip_Show(self, prefixTip, L.DIRECTION_TIP, C.Main)
	end)
	_G["vcbOptions2Box"..k.."PopOut4"]:HookScript("OnLeave", function(self) VDW.Tooltip_Hide() end)
	_G["vcbOptions2Box"..k.."PopOut4"]:HookScript("OnClick", function(self, button, down)
		if button == "LeftButton" and down == false then
			if not _G["vcbOptions2Box"..k.."PopOut4Choice1"]:IsShown() then
				_G["vcbOptions2Box"..k.."PopOut4Choice1"]:Show()
			else
				_G["vcbOptions2Box"..k.."PopOut4Choice1"]:Hide()
			end
		end
	end)
end
-- Border text
ColoringPopOutButtons("4a", 1)
vcbOptions2Box4aPopOut1.Title:SetText(L.POSITION)
for i, name in ipairs(textBorder) do
	counter = counter + 1
	local btn = CreateFrame("Button", "vcbOptions2Box4aPopOut1Choice"..i, nil, "vdwPopOutButton")
	_G["vcbOptions2Box4aPopOut1Choice"..i]:ClearAllPoints()
	if i == 1 then
		_G["vcbOptions2Box4aPopOut1Choice"..i]:SetParent(vcbOptions2Box4aPopOut1)
		_G["vcbOptions2Box4aPopOut1Choice"..i]:SetPoint("TOP", vcbOptions2Box4aPopOut1, "BOTTOM", 0, 4)
		_G["vcbOptions2Box4aPopOut1Choice"..i]:SetScript("OnShow", function(self)
			self:GetParent():SetNormalAtlas("charactercreate-customize-dropdownbox-hover")
			PlaySound(855, "Master")
		end)
		_G["vcbOptions2Box4aPopOut1Choice"..i]:SetScript("OnHide", function(self)
			self:GetParent():SetNormalAtlas("charactercreate-customize-dropdownbox-open")
			PlaySound(855, "Master")
		end)
	else
		_G["vcbOptions2Box4aPopOut1Choice"..i]:SetParent(vcbOptions2Box4aPopOut1Choice1)
		_G["vcbOptions2Box4aPopOut1Choice"..i]:SetPoint("TOP", _G["vcbOptions2Box4aPopOut1Choice"..i-1], "BOTTOM", 0, 0)
		_G["vcbOptions2Box4aPopOut1Choice"..i]:Show()
	end
	_G["vcbOptions2Box4aPopOut1Choice"..i].Text:SetText(name.text)
	_G["vcbOptions2Box4aPopOut1Choice"..i]:HookScript("OnClick", function(self, button, down)
		if button == "LeftButton" and down == false then
			VCBsettings.Target.BorderText.Position = name.value
			vcbOptions2Box4aPopOut1.Text:SetText(self.Text:GetText())
			VDW.VCB.chkTargetBorderTextPosition()
			vcbOptions2Box4aPopOut1Choice1:Hide()
		end
	end)
	local w = _G["vcbOptions2Box4aPopOut1Choice"..i].Text:GetStringWidth()
	if w > maxW then maxW = w end
end
finalW = math.ceil(maxW + 24)
for i = 1, counter, 1 do
	_G["vcbOptions2Box4aPopOut1Choice"..i]:SetWidth(finalW)
end
counter = 0
maxW = 160
vcbOptions2Box4aPopOut1:HookScript("OnEnter", function(self)
	local parent = self:GetParent()
	local word = parent.Title:GetText()
	VDW.Tooltip_Show(self, prefixTip, string.format(L.POSITION_TIP, word), C.Main)
end)
vcbOptions2Box4aPopOut1:HookScript("OnLeave", function(self) VDW.Tooltip_Hide() end)
vcbOptions2Box4aPopOut1:HookScript("OnClick", function(self, button, down)
	if button == "LeftButton" and down == false then
		if not vcbOptions2Box4aPopOut1Choice1:IsShown() then
			vcbOptions2Box4aPopOut1Choice1:Show()
		else
			vcbOptions2Box4aPopOut1Choice1:Hide()
		end
	end
end)
-- Icon
ColoringPopOutButtons(5, 1)
vcbOptions2Box5PopOut1.Title:SetText(L.POSITION)
for i, name in ipairs(iconPosition) do
	counter = counter + 1
	local btn = CreateFrame("Button", "vcbOptions2Box5PopOut1Choice"..i, nil, "vdwPopOutButton")
	_G["vcbOptions2Box5PopOut1Choice"..i]:ClearAllPoints()
	if i == 1 then
		_G["vcbOptions2Box5PopOut1Choice"..i]:SetParent(vcbOptions2Box5PopOut1)
		_G["vcbOptions2Box5PopOut1Choice"..i]:SetPoint("TOP", vcbOptions2Box5PopOut1, "BOTTOM", 0, 4)
		_G["vcbOptions2Box5PopOut1Choice"..i]:SetScript("OnShow", function(self)
			self:GetParent():SetNormalAtlas("charactercreate-customize-dropdownbox-hover")
			PlaySound(855, "Master")
		end)
		_G["vcbOptions2Box5PopOut1Choice"..i]:SetScript("OnHide", function(self)
			self:GetParent():SetNormalAtlas("charactercreate-customize-dropdownbox-open")
			PlaySound(855, "Master")
		end)
	else
		_G["vcbOptions2Box5PopOut1Choice"..i]:SetParent(vcbOptions2Box5PopOut1Choice1)
		_G["vcbOptions2Box5PopOut1Choice"..i]:SetPoint("TOP", _G["vcbOptions2Box5PopOut1Choice"..i-1], "BOTTOM", 0, 0)
		_G["vcbOptions2Box5PopOut1Choice"..i]:Show()
	end
	_G["vcbOptions2Box5PopOut1Choice"..i].Text:SetText(name.text)
	_G["vcbOptions2Box5PopOut1Choice"..i]:HookScript("OnClick", function(self, button, down)
		if button == "LeftButton" and down == false then
			VCBsettings.Target.Icon.Position = name.value
			vcbOptions2Box5PopOut1.Text:SetText(self.Text:GetText())
			VDW.VCB.chkTargetIconPosition()
			vcbOptions2Box5PopOut1Choice1:Hide()
		end
	end)
	local w = _G["vcbOptions2Box5PopOut1Choice"..i].Text:GetStringWidth()
	if w > maxW then maxW = w end
end
finalW = math.ceil(maxW + 24)
for i = 1, counter, 1 do
	_G["vcbOptions2Box5PopOut1Choice"..i]:SetWidth(finalW)
end
counter = 0
maxW = 160
vcbOptions2Box5PopOut1:HookScript("OnEnter", function(self)
	local parent = self:GetParent()
	local word = parent.Title:GetText()
	VDW.Tooltip_Show(self, prefixTip, string.format(L.POSITION_TIP, word), C.Main)
end)
vcbOptions2Box5PopOut1:HookScript("OnLeave", function(self) VDW.Tooltip_Hide() end)
vcbOptions2Box5PopOut1:HookScript("OnClick", function(self, button, down)
	if button == "LeftButton" and down == false then
		if not vcbOptions2Box5PopOut1Choice1:IsShown() then
			vcbOptions2Box5PopOut1Choice1:Show()
		else
			vcbOptions2Box5PopOut1Choice1:Hide()
		end
	end
end)
-- Icon shield
ColoringPopOutButtons("5a", 1)
vcbOptions2Box5aPopOut1.Title:SetText(L.POSITION)
for i, name in ipairs(iconPosition) do
	counter = counter + 1
	local btn = CreateFrame("Button", "vcbOptions2Box5aPopOut1Choice"..i, nil, "vdwPopOutButton")
	_G["vcbOptions2Box5aPopOut1Choice"..i]:ClearAllPoints()
	if i == 1 then
		_G["vcbOptions2Box5aPopOut1Choice"..i]:SetParent(vcbOptions2Box5aPopOut1)
		_G["vcbOptions2Box5aPopOut1Choice"..i]:SetPoint("TOP", vcbOptions2Box5aPopOut1, "BOTTOM", 0, 4)
		_G["vcbOptions2Box5aPopOut1Choice"..i]:SetScript("OnShow", function(self)
			self:GetParent():SetNormalAtlas("charactercreate-customize-dropdownbox-hover")
			PlaySound(855, "Master")
		end)
		_G["vcbOptions2Box5aPopOut1Choice"..i]:SetScript("OnHide", function(self)
			self:GetParent():SetNormalAtlas("charactercreate-customize-dropdownbox-open")
			PlaySound(855, "Master")
		end)
	else
		_G["vcbOptions2Box5aPopOut1Choice"..i]:SetParent(vcbOptions2Box5aPopOut1Choice1)
		_G["vcbOptions2Box5aPopOut1Choice"..i]:SetPoint("TOP", _G["vcbOptions2Box5aPopOut1Choice"..i-1], "BOTTOM", 0, 0)
		_G["vcbOptions2Box5aPopOut1Choice"..i]:Show()
	end
	_G["vcbOptions2Box5aPopOut1Choice"..i].Text:SetText(name.text)
	_G["vcbOptions2Box5aPopOut1Choice"..i]:HookScript("OnClick", function(self, button, down)
		if button == "LeftButton" and down == false then
			VCBsettings.Target.Shield.Position = name.value
			vcbOptions2Box5aPopOut1.Text:SetText(self.Text:GetText())
			VDW.VCB.chkTargetShieldPosition()
			vcbOptions2Box5aPopOut1Choice1:Hide()
		end
	end)
	local w = _G["vcbOptions2Box5aPopOut1Choice"..i].Text:GetStringWidth()
	if w > maxW then maxW = w end
end
finalW = math.ceil(maxW + 24)
for i = 1, counter, 1 do
	_G["vcbOptions2Box5aPopOut1Choice"..i]:SetWidth(finalW)
end
counter = 0
maxW = 160
vcbOptions2Box5aPopOut1:HookScript("OnEnter", function(self)
	local parent = self:GetParent()
	local word = parent.Title:GetText()
	VDW.Tooltip_Show(self, prefixTip, string.format(L.POSITION_TIP, word), C.Main)
end)
vcbOptions2Box5aPopOut1:HookScript("OnLeave", function(self) VDW.Tooltip_Hide() end)
vcbOptions2Box5aPopOut1:HookScript("OnClick", function(self, button, down)
	if button == "LeftButton" and down == false then
		if not vcbOptions2Box5aPopOut1Choice1:IsShown() then
			vcbOptions2Box5aPopOut1Choice1:Show()
		else
			vcbOptions2Box5aPopOut1Choice1:Hide()
		end
	end
end)
-- color & style of bar & border
for k = 6, 7, 1 do
-- color
	ColoringPopOutButtons(k, 1)
	_G["vcbOptions2Box"..k.."PopOut1"].Title:SetText(L.COLOR)
	for i, name in ipairs(barColor) do
		counter = counter + 1
		local btn = CreateFrame("Button", "vcbOptions2Box"..k.."PopOut1Choice"..i, nil, "vdwPopOutButton")
		_G["vcbOptions2Box"..k.."PopOut1Choice"..i]:ClearAllPoints()
		if i == 1 then
			_G["vcbOptions2Box"..k.."PopOut1Choice"..i]:SetParent(_G["vcbOptions2Box"..k.."PopOut1"])
			_G["vcbOptions2Box"..k.."PopOut1Choice"..i]:SetPoint("TOP", _G["vcbOptions2Box"..k.."PopOut1"], "BOTTOM", 0, 4)
			_G["vcbOptions2Box"..k.."PopOut1Choice"..i]:SetScript("OnShow", function(self)
				self:GetParent():SetNormalAtlas("charactercreate-customize-dropdownbox-hover")
				PlaySound(855, "Master")
			end)
			_G["vcbOptions2Box"..k.."PopOut1Choice"..i]:SetScript("OnHide", function(self)
				self:GetParent():SetNormalAtlas("charactercreate-customize-dropdownbox-open")
				PlaySound(855, "Master")
			end)
		else
			_G["vcbOptions2Box"..k.."PopOut1Choice"..i]:SetParent(_G["vcbOptions2Box"..k.."PopOut1Choice1"])
			_G["vcbOptions2Box"..k.."PopOut1Choice"..i]:SetPoint("TOP", _G["vcbOptions2Box"..k.."PopOut1Choice"..i-1], "BOTTOM", 0, 0)
			_G["vcbOptions2Box"..k.."PopOut1Choice"..i]:Show()
		end
		_G["vcbOptions2Box"..k.."PopOut1Choice"..i].Text:SetText(name.text)
		_G["vcbOptions2Box"..k.."PopOut1Choice"..i]:HookScript("OnClick", function(self, button, down)
			if button == "LeftButton" and down == false then
				if k == 6 then
					VCBsettings.Target.StatusBar.Color = name.value
					VDW.VCB.chkStatusColorTarget()
				elseif k == 7 then
					VCBsettings.Target.Border.Color = name.value
					VDW.VCB.chkBorderColorTarget()
				end
				_G["vcbOptions2Box"..k.."PopOut1"].Text:SetText(self.Text:GetText())
				_G["vcbOptions2Box"..k.."PopOut1Choice1"]:Hide()
			end
		end)
		local w = _G["vcbOptions2Box"..k.."PopOut1Choice"..i].Text:GetStringWidth()
		if w > maxW then maxW = w end
	end
	finalW = math.ceil(maxW + 24)
	for i = 1, counter, 1 do
		_G["vcbOptions2Box"..k.."PopOut1Choice"..i]:SetWidth(finalW)
	end
	counter = 0
	maxW = 160
	_G["vcbOptions2Box"..k.."PopOut1"]:HookScript("OnEnter", function(self)
		local parent = self:GetParent()
		local word = parent.Title:GetText()
		VDW.Tooltip_Show(self, prefixTip, string.format(L.COLOR_TIP, word), C.Main) 
	end)
	_G["vcbOptions2Box"..k.."PopOut1"]:HookScript("OnLeave", function(self) VDW.Tooltip_Hide() end)
	_G["vcbOptions2Box"..k.."PopOut1"]:HookScript("OnClick", function(self, button, down)
		if button == "LeftButton" and down == false then
			if not _G["vcbOptions2Box"..k.."PopOut1Choice1"]:IsShown() then
				_G["vcbOptions2Box"..k.."PopOut1Choice1"]:Show()
			else
				_G["vcbOptions2Box"..k.."PopOut1Choice1"]:Hide()
			end
		end
	end)
-- style
	ColoringPopOutButtons(k, 2)
	_G["vcbOptions2Box"..k.."PopOut2"].Title:SetText(L.STYLE)
	for i, name in ipairs(barStyle) do
		counter = counter + 1
		local btn = CreateFrame("Button", "vcbOptions2Box"..k.."PopOut2Choice"..i, nil, "vdwPopOutButton")
		_G["vcbOptions2Box"..k.."PopOut2Choice"..i]:ClearAllPoints()
		if i == 1 then
			_G["vcbOptions2Box"..k.."PopOut2Choice"..i]:SetParent(_G["vcbOptions2Box"..k.."PopOut2"])
			_G["vcbOptions2Box"..k.."PopOut2Choice"..i]:SetPoint("TOP", "vcbOptions2Box"..k.."PopOut2", "BOTTOM", 0, 4)
			_G["vcbOptions2Box"..k.."PopOut2Choice"..i]:SetScript("OnShow", function(self)
				self:GetParent():SetNormalAtlas("charactercreate-customize-dropdownbox-hover")
				PlaySound(855, "Master")
			end)
			_G["vcbOptions2Box"..k.."PopOut2Choice"..i]:SetScript("OnHide", function(self)
				self:GetParent():SetNormalAtlas("charactercreate-customize-dropdownbox-open")
				PlaySound(855, "Master")
			end)
		else
			_G["vcbOptions2Box"..k.."PopOut2Choice"..i]:SetParent(_G["vcbOptions2Box"..k.."PopOut2Choice1"])
			_G["vcbOptions2Box"..k.."PopOut2Choice"..i]:SetPoint("TOP", _G["vcbOptions2Box"..k.."PopOut2Choice"..i-1], "BOTTOM", 0, 0)
			_G["vcbOptions2Box"..k.."PopOut2Choice"..i]:Show()
		end
		_G["vcbOptions2Box"..k.."PopOut2Choice"..i].Text:SetText(name.text)
		_G["vcbOptions2Box"..k.."PopOut2Choice"..i]:HookScript("OnClick", function(self, button, down)
			if button == "LeftButton" and down == false then
				if k == 6 then
					VCBsettings.Target.StatusBar.Style = name.value
					VDW.VCB.chkStatusStyleTarget()
				elseif k== 7 then
					VCBsettings.Target.Border.Style = name.value
					VDW.VCB.chkBorderStyleTarget()
					C_UI.Reload()
				end
				_G["vcbOptions2Box"..k.."PopOut2"].Text:SetText(self.Text:GetText())
				_G["vcbOptions2Box"..k.."PopOut2Choice1"]:Hide()
			end
		end)
		local w = _G["vcbOptions2Box"..k.."PopOut2Choice"..i].Text:GetStringWidth()
		if w > maxW then maxW = w end
	end
	finalW = math.ceil(maxW + 24)
	for i = 1, counter, 1 do
		_G["vcbOptions2Box"..k.."PopOut2Choice"..i]:SetWidth(finalW)
	end
	counter = 0
	maxW = 160
	_G["vcbOptions2Box"..k.."PopOut2"]:HookScript("OnEnter", function(self)
		local parent = self:GetParent()
		local word = parent.Title:GetText()
		VDW.Tooltip_Show(self, prefixTip, string.format(L.STYLE_TIP, word), C.Main)
	end)
	_G["vcbOptions2Box"..k.."PopOut2"]:HookScript("OnLeave", function(self) VDW.Tooltip_Hide() end)
	_G["vcbOptions2Box"..k.."PopOut2"]:HookScript("OnClick", function(self, button, down)
		if button == "LeftButton" and down == false then
			if not _G["vcbOptions2Box"..k.."PopOut2Choice1"]:IsShown() then
				_G["vcbOptions2Box"..k.."PopOut2Choice1"]:Show()
			else
				_G["vcbOptions2Box"..k.."PopOut2Choice1"]:Hide()
			end
		end
	end)
end
-- check button interrupt color
vcbOptions2Box6CheckButton1.Text:SetText(string.format(L.COLOR_THE_BAR_IF, VDW.VCB.InterruptSpell))
vcbOptions2Box6CheckButton1.Text:SetWidth(vcbOptions2Box6:GetWidth()*0.8)
vcbOptions2Box6CheckButton1:SetScript("OnEnter", function(self)
	local word = self.Text:GetText()
	VDW.Tooltip_Show(self, prefixTip, string.format(L.CHECK_COLOR_THE_BAR_IF_TIP, VDW.VCB.InterruptSpell), C.Main)
end)
vcbOptions2Box6CheckButton1:HookScript("OnLeave", function(self) VDW.Tooltip_Hide() end)
vcbOptions2Box6CheckButton1:HookScript("OnClick", function (self, button)
	if button == "LeftButton" then
		if self:GetChecked() == true then
			VCBsettings.Target.StatusBar.Interrupt.Show = true
			self.Text:SetTextColor(C.Main:GetRGB())
		elseif self:GetChecked() == false then
			VCBsettings.Target.StatusBar.Interrupt.Show = false
			self.Text:SetTextColor(0.35, 0.35, 0.35, 0.8)
		end
		VDW.VCB.chkStatusColorTarget()
		PlaySound(858, "Master")
	end
end)
-- pop out button Unlock the Castbar
ColoringPopOutButtons(8, 1)
vcbOptions2Box8PopOut1.Title:SetText(L.LOCKING)
for i, name in ipairs(barLock) do
	counter = counter + 1
	local btn = CreateFrame("Button", "vcbOptions2Box8PopOut1Choice"..i, nil, "vdwPopOutButton")
	_G["vcbOptions2Box8PopOut1Choice"..i]:ClearAllPoints()
	if i == 1 then
		_G["vcbOptions2Box8PopOut1Choice"..i]:SetParent(vcbOptions2Box8PopOut1)
		_G["vcbOptions2Box8PopOut1Choice"..i]:SetPoint("TOP", vcbOptions2Box8PopOut1, "BOTTOM", 0, 4)
		_G["vcbOptions2Box8PopOut1Choice"..i]:SetScript("OnShow", function(self)
			self:GetParent():SetNormalAtlas("charactercreate-customize-dropdownbox-hover")
			PlaySound(855, "Master")
		end)
		_G["vcbOptions2Box8PopOut1Choice"..i]:SetScript("OnHide", function(self)
			self:GetParent():SetNormalAtlas("charactercreate-customize-dropdownbox-open")
			PlaySound(855, "Master")
		end)
	else
		_G["vcbOptions2Box8PopOut1Choice"..i]:SetParent(vcbOptions2Box8PopOut1Choice1)
		_G["vcbOptions2Box8PopOut1Choice"..i]:SetPoint("TOP", _G["vcbOptions2Box8PopOut1Choice"..i-1], "BOTTOM", 0, 0)
		_G["vcbOptions2Box8PopOut1Choice"..i]:Show()
	end
	_G["vcbOptions2Box8PopOut1Choice"..i].Text:SetText(name.text)
	_G["vcbOptions2Box8PopOut1Choice"..i]:HookScript("OnClick", function(self, button, down)
			if button == "LeftButton" and down == false then
				VCBsettings.Target.Lock = name.value
				C_UI.Reload()
			end
		end)
	local w = _G["vcbOptions2Box8PopOut1Choice"..i].Text:GetStringWidth()
	if w > maxW then maxW = w end
end
finalW = math.ceil(maxW + 24)
for i = 1, counter, 1 do
	_G["vcbOptions2Box8PopOut1Choice"..i]:SetWidth(finalW)
end
counter = 0
maxW = 160
vcbOptions2Box8PopOut1:HookScript("OnEnter", function(self)
	VDW.Tooltip_Show(self, prefixTip, L.LOCKING_TIP_TARGET, C.Main)
end)
vcbOptions2Box8PopOut1:HookScript("OnLeave", function(self) VDW.Tooltip_Hide() end)
vcbOptions2Box8PopOut1:HookScript("OnClick", function(self, button, down)
	if button == "LeftButton" and down == false then
		if not vcbOptions2Box8PopOut1Choice1:IsShown() then
			vcbOptions2Box8PopOut1Choice1:Show()
		else
			vcbOptions2Box8PopOut1Choice1:Hide()
		end
	end
end)
-- slide bar 1 scale of the bar
vcbOptions2Box8Slider1.Slider.Thumb:SetVertexColor(C.Main:GetRGB())
vcbOptions2Box8Slider1.Back:GetRegions():SetVertexColor(C.Main:GetRGB())
vcbOptions2Box8Slider1.Forward:GetRegions():SetVertexColor(C.Main:GetRGB())
vcbOptions2Box8Slider1.TopText:SetTextColor(C.High:GetRGB())
vcbOptions2Box8Slider1.MinText:SetTextColor(C.High:GetRGB())
vcbOptions2Box8Slider1.MaxText:SetTextColor(C.High:GetRGB())
vcbOptions2Box8Slider1.MinText:SetText("10%")
vcbOptions2Box8Slider1.MaxText:SetText("200%")
vcbOptions2Box8Slider1.Slider:SetMinMaxValues(10, 200)
-- enter
vcbOptions2Box8Slider1.Slider:HookScript("OnEnter", function(self)
	VDW.Tooltip_Show(self, prefixTip, L.SLIDER_TIP, C.Main)
end)
-- leave
vcbOptions2Box8Slider1.Slider:HookScript("OnLeave", function(self) VDW.Tooltip_Hide() end)
-- mouse wheel
vcbOptions2Box8Slider1.Slider:SetScript("OnMouseWheel", MouseWheelSlider)
-- value change
vcbOptions2Box8Slider1.Slider:SetScript("OnValueChanged", function (self, value, userInput)
	vcbOptions2Box8Slider1.TopText:SetText(string.format(L.SLIDER_TEXT_SCALE, self:GetValue()).."%")
	VCBsettings.Target.Scale = self:GetValue()
	TargetVCBpreview:SetScale(VCBsettings.Target.Scale/100)
	if vcbTargetCastbar then VDW.VCB.TargetCastbarSize() end
	PlaySound(858, "Master")
end)
-- slide bar 1 width of the bar
vcbOptions2Box9Slider1.Slider.Thumb:SetVertexColor(C.Main:GetRGB())
vcbOptions2Box9Slider1.Back:GetRegions():SetVertexColor(C.Main:GetRGB())
vcbOptions2Box9Slider1.Forward:GetRegions():SetVertexColor(C.Main:GetRGB())
vcbOptions2Box9Slider1.TopText:SetTextColor(C.High:GetRGB())
vcbOptions2Box9Slider1.MinText:SetTextColor(C.High:GetRGB())
vcbOptions2Box9Slider1.MaxText:SetTextColor(C.High:GetRGB())
vcbOptions2Box9Slider1.MinText:SetText(80)
vcbOptions2Box9Slider1.MaxText:SetText(560)
vcbOptions2Box9Slider1.Slider:SetMinMaxValues(80, 560)
-- enter
vcbOptions2Box9Slider1.Slider:HookScript("OnEnter", function(self)
	VDW.Tooltip_Show(self, prefixTip, L.SLIDER_TIP, C.Main)
end)
-- leave
vcbOptions2Box9Slider1.Slider:HookScript("OnLeave", function(self) VDW.Tooltip_Hide() end)
-- mouse wheel
vcbOptions2Box9Slider1.Slider:SetScript("OnMouseWheel", MouseWheelSlider)
-- value change
vcbOptions2Box9Slider1.Slider:SetScript("OnValueChanged", function (self, value, userInput)
	vcbOptions2Box9Slider1.TopText:SetText(string.format(L.SLIDER_TEXT_WIDTH, self:GetValue()))
	VCBsettings.Target.Size.Width = self:GetValue()
	TargetVCBpreview:SetSize(VCBsettings.Target.Size.Width, VCBsettings.Target.Size.Height)
	if vcbTargetCastbar then VDW.VCB.TargetCastbarSize() end
	PlaySound(858, "Master")
end)
-- slide bar 2 heigth of the bar
vcbOptions2Box9Slider2.Slider.Thumb:SetVertexColor(C.Main:GetRGB())
vcbOptions2Box9Slider2.Back:GetRegions():SetVertexColor(C.Main:GetRGB())
vcbOptions2Box9Slider2.Forward:GetRegions():SetVertexColor(C.Main:GetRGB())
vcbOptions2Box9Slider2.TopText:SetTextColor(C.High:GetRGB())
vcbOptions2Box9Slider2.MinText:SetTextColor(C.High:GetRGB())
vcbOptions2Box9Slider2.MaxText:SetTextColor(C.High:GetRGB())
vcbOptions2Box9Slider2.MinText:SetText(2)
vcbOptions2Box9Slider2.MaxText:SetText(80)
vcbOptions2Box9Slider2.Slider:SetMinMaxValues(2, 80)
-- enter
vcbOptions2Box9Slider2.Slider:HookScript("OnEnter", function(self)
	VDW.Tooltip_Show(self, prefixTip, L.SLIDER_TIP, C.Main)
end)
-- leave
vcbOptions2Box9Slider2.Slider:HookScript("OnLeave", function(self) VDW.Tooltip_Hide() end)
-- mouse wheel
vcbOptions2Box9Slider2.Slider:SetScript("OnMouseWheel", MouseWheelSlider)
-- value change
vcbOptions2Box9Slider2.Slider:SetScript("OnValueChanged", function (self, value, userInput)
	vcbOptions2Box9Slider2.TopText:SetText(string.format(L.SLIDER_TEXT_HEIGHT, self:GetValue()))
	VCBsettings.Target.Size.Height = self:GetValue()
	TargetVCBpreview:SetSize(VCBsettings.Target.Size.Width, VCBsettings.Target.Size.Height)
	if vcbTargetCastbar then VDW.VCB.TargetCastbarSize() end
	PlaySound(858, "Master")
end)
-- taking care of the cast bar preview
TargetVCBpreview.Text:SetText(L.TARGET_CAST_BAR)
-- enter
TargetVCBpreview:SetScript("OnEnter", function(self)
	VDW.Tooltip_Show(self, prefixTip, G.BUTTON_L_CLICK..G.TIP_DRAG_ME, C.Main)
end)
-- leave
TargetVCBpreview:HookScript("OnLeave", function(self) VDW.Tooltip_Hide() end)
-- Function for stoping the movement
local function StopMoving(self)
	VCBsettings.Target.Position.X = Round(self:GetLeft())
	VCBsettings.Target.Position.Y = Round(self:GetBottom())
	VDW.VCB.TargetCastbarPosition()
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
-- Checking the Saved Variables
local function CheckSavedVariables()
	vcbOptions2Box1PopOut1.Text:SetText(textPositionByValue[VCBsettings.Target.CurrentTimeText.Position] or VDWtranslate.Global.HIDE)
	vcbOptions2Box2PopOut1.Text:SetText(textPositionByValue[VCBsettings.Target.BothTimeText.Position] or VDWtranslate.Global.HIDE)
	vcbOptions2Box3PopOut1.Text:SetText(textPositionByValue[VCBsettings.Target.TotalTimeText.Position] or VDWtranslate.Global.HIDE)
	vcbOptions2Box4PopOut1.Text:SetText(textPositionByValue[VCBsettings.Target.NameText.Position] or VDWtranslate.Global.HIDE)
	vcbOptions2Box1PopOut3.Text:SetText(textSecByValue[VCBsettings.Target.CurrentTimeText.Sec] or VDWtranslate.Global.HIDE)
	vcbOptions2Box2PopOut3.Text:SetText(textSecByValue[VCBsettings.Target.BothTimeText.Sec] or VDWtranslate.Global.HIDE)
	vcbOptions2Box3PopOut3.Text:SetText(textSecByValue[VCBsettings.Target.TotalTimeText.Sec] or VDWtranslate.Global.HIDE)
	vcbOptions2Box1PopOut4.Text:SetText(textDirectionByValue[VCBsettings.Target.CurrentTimeText.Direction] or VDWtranslate.Global.HIDE)
	vcbOptions2Box2PopOut4.Text:SetText(textDirectionByValue[VCBsettings.Target.BothTimeText.Direction] or VDWtranslate.Global.HIDE)
	vcbOptions2Box4aPopOut1.Text:SetText(textBorderByValue[VCBsettings.Target.BorderText.Position] or VDWtranslate.Global.HIDE)
	vcbOptions2Box5PopOut1.Text:SetText(iconPositionByValue[VCBsettings.Target.Icon.Position] or VDWtranslate.Global.HIDE)
	vcbOptions2Box5aPopOut1.Text:SetText(iconPositionByValue[VCBsettings.Target.Shield.Position] or VDWtranslate.Global.HIDE)
	vcbOptions2Box6PopOut1.Text:SetText(barColorByValue[VCBsettings.Target.StatusBar.Color] or VDWtranslate.Global.HIDE)
	vcbOptions2Box7PopOut1.Text:SetText(barColorByValue[VCBsettings.Target.Border.Color] or VDWtranslate.Global.HIDE)
	vcbOptions2Box6PopOut2.Text:SetText(barStyleByValue[VCBsettings.Target.StatusBar.Style] or VDWtranslate.Global.HIDE)
	vcbOptions2Box7PopOut2.Text:SetText(barStyleByValue[VCBsettings.Target.Border.Style] or VDWtranslate.Global.HIDE)
	vcbOptions2Box8PopOut1.Text:SetText(barLockByValue[VCBsettings.Target.Lock] or VDWtranslate.Global.HIDE)
	vcbOptions2Box1PopOut2.Text:SetText(VCBsettings.Target.CurrentTimeText.Decimals)
	vcbOptions2Box2PopOut2.Text:SetText(VCBsettings.Target.BothTimeText.Decimals)
	vcbOptions2Box3PopOut2.Text:SetText(VCBsettings.Target.TotalTimeText.Decimals)
	if VCBsettings.Target.StatusBar.Interrupt.Show then
		vcbOptions2Box6CheckButton1:SetChecked(true)
		vcbOptions2Box6CheckButton1.Text:SetTextColor(C.Main:GetRGB())
	else
		vcbOptions2Box6CheckButton1:SetChecked(false)
		vcbOptions2Box6CheckButton1.Text:SetTextColor(0.35, 0.35, 0.35, 0.8)
	end
	if VCBsettings.Target.Lock then
		sliderDisable(vcbOptions2Box8Slider1)
		sliderDisable(vcbOptions2Box9Slider1)
		sliderDisable(vcbOptions2Box9Slider2)
		if TargetVCBpreview:IsShown() then TargetVCBpreview:Hide() end
	else
		sliderEnable(vcbOptions2Box8Slider1)
		sliderEnable(vcbOptions2Box9Slider1)
		sliderEnable(vcbOptions2Box9Slider2)
		TargetVCBpreview:ClearAllPoints()
		TargetVCBpreview:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", VCBsettings.Target.Position.X, VCBsettings.Target.Position.Y)
		if not TargetVCBpreview:IsShown() then TargetVCBpreview:Show() end
	end
	vcbOptions2Box8Slider1.Slider:SetValue(VCBsettings.Target.Scale)
	vcbOptions2Box9Slider1.Slider:SetValue(VCBsettings.Target.Size.Width)
	vcbOptions2Box9Slider2.Slider:SetValue(VCBsettings.Target.Size.Height)
end
-- Show the option panel
vcbOptions2:HookScript("OnShow", function(self)
	vcbOptions0Tab1.Text:SetTextColor(0.4, 0.4, 0.4, 1)
	vcbOptions0Tab2.Text:SetTextColor(C.High:GetRGB())
	for i = 3, 6, 1 do
		_G["vcbOptions0Tab"..i].Text:SetTextColor(0.4, 0.4, 0.4, 1)
		if _G["vcbOptions"..i]:IsShown() then _G["vcbOptions"..i]:Hide() end
	end
	if vcbOptions1:IsShown() then vcbOptions1:Hide() end
	CheckSavedVariables()
end)
-- Hide the option panel
vcbOptions2:HookScript("OnHide", function(self)
	if TargetVCBpreview:IsShown() then TargetVCBpreview:Hide() end
end)
