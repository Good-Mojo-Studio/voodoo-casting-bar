-- some variables --
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
-- Taking care of the option panel --
vcbOptions5:ClearAllPoints()
vcbOptions5:SetPoint("TOPLEFT", vcbOptions0, "TOPLEFT", 0, 0)
-- Background of the option panel --
vcbOptions5.BGtexture:SetAtlas("UI-Journeys-BG", false)
vcbOptions5.BGtexture:SetVertexColor(C.High:GetRGB())
vcbOptions5.Logo:SetVertexColor(C.Main:GetRGB())
vcbOptions5.BGtexture:SetDesaturation(0.3)
vcbOptions5.BorderTopRight:SetVertexColor(C.High:GetRGB())
vcbOptions5.BorderBottomRight:SetVertexColor(C.High:GetRGB())
vcbOptions5.BorderRightMiddle:SetVertexColor(C.High:GetRGB())
vcbOptions5.BorderTopLeft:SetVertexColor(C.High:GetRGB())
vcbOptions5.BorderBottomLeft:SetVertexColor(C.High:GetRGB())
vcbOptions5.BorderLeftMiddle:SetVertexColor(C.High:GetRGB())
vcbOptions5.BorderTopMiddle:SetVertexColor(C.High:GetRGB())
vcbOptions5.BorderBottomMiddle:SetVertexColor(C.High:GetRGB())
-- Title of the option panel --
vcbOptions5.Title:SetTextColor(C.Main:GetRGB())
vcbOptions5.Title:SetText(prefixTip.."|nVersion: "..C.High:WrapTextInColorCode(C_AddOns.GetAddOnMetadata("VCB", "Version")))
-- Top text of the option panel --
vcbOptions5.TopTxt:SetTextColor(C.Main:GetRGB())
vcbOptions5.TopTxt:SetText(string.format(L.OPTIONS_FOR, L.ARENA_CAST_BAR))
-- Bottom right text of the option panel --
vcbOptions5.BottomRightTxt:SetTextColor(C.Main:GetRGB())
vcbOptions5.BottomRightTxt:SetText("May the Good "..C.High:WrapTextInColorCode("Mojo").." be with you! ")
-- taking care of the boxes --
vcbOptions5Box1.Title:SetText(L.CURRENT_CAST_TIME)
vcbOptions5Box1:SetHeight(120)
vcbOptions5Box2.Title:SetText(L.BOTH_CAST_TIME)
vcbOptions5Box2:SetHeight(120)
vcbOptions5Box2:SetPoint("TOPLEFT", vcbOptions5Box3, "BOTTOMLEFT", 0, 0)
vcbOptions5Box3.Title:SetText(L.TOTAL_CAST_TIME)
vcbOptions5Box3:SetHeight(120)
vcbOptions5Box3:SetPoint("TOPLEFT", vcbOptions5Box1, "BOTTOMLEFT", 0, 0)
vcbOptions5Box4.Title:SetText(L.SPELL_NAME)
vcbOptions5Box4:SetWidth(138)
vcbOptions5Box4:SetPoint("TOPLEFT", vcbOptions5Box1, "TOPRIGHT", 0, 0)
vcbOptions5Box4a.Title:SetText(L.BORDER_TEXT)
vcbOptions5Box4a:SetWidth(138)
vcbOptions5Box4a:SetPoint("TOPLEFT", vcbOptions5Box4, "TOPRIGHT", 0, 0)
vcbOptions5Box5.Title:SetText(L.SPELL_ICON)
vcbOptions5Box5:SetWidth(138)
vcbOptions5Box5:SetPoint("TOPLEFT", vcbOptions5Box4, "BOTTOMLEFT", 0, 0)
vcbOptions5Box5a.Title:SetText(L.SHIELD_ICON)
vcbOptions5Box5a:SetWidth(138)
vcbOptions5Box5a:SetPoint("TOPLEFT", vcbOptions5Box5, "TOPRIGHT", 0, 0)
vcbOptions5Box6.Title:SetText(L.STATUS_BAR)
vcbOptions5Box6:SetHeight(120)
vcbOptions5Box6:SetPoint("TOPLEFT", vcbOptions5Box5, "BOTTOMLEFT", 0, 0)
vcbOptions5Box7.Title:SetText(L.BAR_BORDER)
vcbOptions5Box7:SetPoint("TOPLEFT", vcbOptions5Box6, "BOTTOMLEFT", 0, 0)
vcbOptions5Box8.Title:SetText(L.UNLOCK_CAST_BAR)
vcbOptions5Box8:SetPoint("TOPLEFT", vcbOptions5Box4a, "TOPRIGHT", 0, 0)
vcbOptions5Box9.Title:SetText(L.CAST_BAR_SIZE)
vcbOptions5Box9:SetHeight(144)
vcbOptions5Box9:SetWidth(210)
vcbOptions5Box9:SetPoint("TOPLEFT", vcbOptions5Box8, "BOTTOMLEFT", 0, 0)
for i = 1, 9, 1 do
	local tW = _G["vcbOptions5Box"..i].Title:GetStringWidth()+16
	local W = _G["vcbOptions5Box"..i]:GetWidth()
	if tW >= W then
		_G["vcbOptions5Box"..i]:SetWidth(_G["vcbOptions5Box"..i].Title:GetStringWidth()+16)
	end
end
-- Coloring the boxes --
for i = 1, 9, 1 do
	_G["vcbOptions5Box"..i].Title:SetTextColor(C.Main:GetRGB())
	_G["vcbOptions5Box"..i].BorderTop:SetVertexColor(C.High:GetRGB())
	_G["vcbOptions5Box"..i].BorderBottom:SetVertexColor(C.High:GetRGB())
	_G["vcbOptions5Box"..i].BorderLeft:SetVertexColor(C.High:GetRGB())
	_G["vcbOptions5Box"..i].BorderRight:SetVertexColor(C.High:GetRGB())
end
for i = 4, 5, 1 do
	_G["vcbOptions5Box"..i.."a"].Title:SetTextColor(C.Main:GetRGB())
	_G["vcbOptions5Box"..i.."a"].BorderTop:SetVertexColor(C.High:GetRGB())
	_G["vcbOptions5Box"..i.."a"].BorderBottom:SetVertexColor(C.High:GetRGB())
	_G["vcbOptions5Box"..i.."a"].BorderLeft:SetVertexColor(C.High:GetRGB())
	_G["vcbOptions5Box"..i.."a"].BorderRight:SetVertexColor(C.High:GetRGB())
end
-- Coloring the pop out buttons --
local function ColoringPopOutButtons(k, var1)
	_G["vcbOptions5Box"..k.."PopOut"..var1].Text:SetTextColor(C.Main:GetRGB())
	_G["vcbOptions5Box"..k.."PopOut"..var1].Title:SetTextColor(C.High:GetRGB())
	_G["vcbOptions5Box"..k.."PopOut"..var1].NormalTexture:SetVertexColor(C.High:GetRGB())
	_G["vcbOptions5Box"..k.."PopOut"..var1].HighlightTexture:SetVertexColor(C.Main:GetRGB())
	_G["vcbOptions5Box"..k.."PopOut"..var1].PushedTexture:SetVertexColor(C.High:GetRGB())
end
-- check button enable - disable --
local function checkButtonEnable(self)
	self:EnableMouse(true)
	self.Text:SetTextColor(C.Main:GetRGB())
end
local function checkButtonDisable(self)
	self:SetChecked(false)
	self:EnableMouse(false)
	self.Text:SetTextColor(0.35, 0.35, 0.35, 0.8)
end
-- pop out button enable - disable --
local function popEnable(self)
	self:EnableMouse(true)
	self:SetAlpha(1)
end
local function popDisable(self)
	self:EnableMouse(false)
	self:SetAlpha(0.35)
end
-- slider enable - disable --
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
-- Mouse Wheel on Sliders --
local function MouseWheelSlider(self, delta)
	if delta == 1 then
		self:SetValue(self:GetValue() + 1)
	elseif delta == -1 then
		self:SetValue(self:GetValue() - 1)
	end
end
-- Pop out 1 Buttons text position  --
for k = 1, 4, 1 do
	_G["vcbOptions5Box"..k.."PopOut1"].Title:SetText(L.POSITION)
	ColoringPopOutButtons(k, 1)
	for i, name in ipairs(textPosition) do
		counter = counter + 1
		local btn = CreateFrame("Button", "vcbOptions5Box"..k.."PopOut1Choice"..i, nil, "vdwPopOutButton")
		_G["vcbOptions5Box"..k.."PopOut1Choice"..i]:ClearAllPoints()
		if i == 1 then
			_G["vcbOptions5Box"..k.."PopOut1Choice"..i]:SetParent(_G["vcbOptions5Box"..k.."PopOut1"])
			_G["vcbOptions5Box"..k.."PopOut1Choice"..i]:SetPoint("TOP", "vcbOptions5Box"..k.."PopOut1", "BOTTOM", 0, 4)
			_G["vcbOptions5Box"..k.."PopOut1Choice"..i]:SetScript("OnShow", function(self)
				self:GetParent():SetNormalAtlas("charactercreate-customize-dropdownbox-hover")
				PlaySound(855, "Master")
			end)
			_G["vcbOptions5Box"..k.."PopOut1Choice"..i]:SetScript("OnHide", function(self)
				self:GetParent():SetNormalAtlas("charactercreate-customize-dropdownbox-open")
				PlaySound(855, "Master")
			end)
		else
			_G["vcbOptions5Box"..k.."PopOut1Choice"..i]:SetParent(_G["vcbOptions5Box"..k.."PopOut1Choice1"])
			_G["vcbOptions5Box"..k.."PopOut1Choice"..i]:SetPoint("TOP", _G["vcbOptions5Box"..k.."PopOut1Choice"..i-1], "BOTTOM", 0, 0)
			_G["vcbOptions5Box"..k.."PopOut1Choice"..i]:Show()
		end
		_G["vcbOptions5Box"..k.."PopOut1Choice"..i].Text:SetText(name.text)
		_G["vcbOptions5Box"..k.."PopOut1Choice"..i]:HookScript("OnClick", function(self, button, down)
			if button == "LeftButton" and down == false then
				if k == 1 then
					VCBsettings["Arena"]["CurrentTimeText"]["Position"] = name.value
					VDW.VCB.chkCurrentTxtArena()
					VDW.VCB.chkCurrentUpdArena()
				elseif k== 2 then
					VCBsettings["Arena"]["BothTimeText"]["Position"] = name.value
					VDW.VCB.chkBothTxtArena()
					VDW.VCB.chkBothUpdArena()
				elseif k == 3 then
					VCBsettings["Arena"]["TotalTimeText"]["Position"] = name.value
					VDW.VCB.chkTotalTxtArena()
					VDW.VCB.chkTotalUpdArena()
				elseif k == 4 then
					VCBsettings["Arena"]["NameText"]["Position"] = name.value
					VDW.VCB.chkNameTxtArena()
				end
				_G["vcbOptions5Box"..k.."PopOut1"].Text:SetText(self.Text:GetText())
				_G["vcbOptions5Box"..k.."PopOut1Choice1"]:Hide()
			end
		end)
		local w = _G["vcbOptions5Box"..k.."PopOut1Choice"..i].Text:GetStringWidth()
		if w > maxW then maxW = w end
	end
	finalW = math.ceil(maxW + 24)
	for i = 1, counter, 1 do
		_G["vcbOptions5Box"..k.."PopOut1Choice"..i]:SetWidth(finalW)
	end
	counter = 0
	maxW = 160
	_G["vcbOptions5Box"..k.."PopOut1"]:HookScript("OnEnter", function(self)
		local parent = self:GetParent()
		local word = parent.Title:GetText()
		VDW.Tooltip_Show(self, prefixTip, string.format(L.POSITION_TIP, word), C.Main)
	end)
	_G["vcbOptions5Box"..k.."PopOut1"]:HookScript("OnLeave", function(self) VDW.Tooltip_Hide() end)
	_G["vcbOptions5Box"..k.."PopOut1"]:HookScript("OnClick", function(self, button, down)
		if button == "LeftButton" and down == false then
			if not _G["vcbOptions5Box"..k.."PopOut1Choice1"]:IsShown() then
				_G["vcbOptions5Box"..k.."PopOut1Choice1"]:Show()
			else
				_G["vcbOptions5Box"..k.."PopOut1Choice1"]:Hide()
			end
		end
	end)
end
-- Pop out 2 Buttons decimals and sec  --
for k = 1, 3, 1 do
-- decimals --
	_G["vcbOptions5Box"..k.."PopOut2"].Title:SetText(L.DECIMALS)
	ColoringPopOutButtons(k, 2)
	for i, name in ipairs(textDecimals) do
		counter = counter + 1
		local btn = CreateFrame("Button", "vcbOptions5Box"..k.."PopOut2Choice"..i, nil, "vdwPopOutButton")
		_G["vcbOptions5Box"..k.."PopOut2Choice"..i]:ClearAllPoints()
		if i == 1 then
			_G["vcbOptions5Box"..k.."PopOut2Choice"..i]:SetParent(_G["vcbOptions5Box"..k.."PopOut2"])
			_G["vcbOptions5Box"..k.."PopOut2Choice"..i]:SetPoint("TOP", "vcbOptions5Box"..k.."PopOut2", "BOTTOM", 0, 4)
			_G["vcbOptions5Box"..k.."PopOut2Choice"..i]:SetScript("OnShow", function(self)
				self:GetParent():SetNormalAtlas("charactercreate-customize-dropdownbox-hover")
				PlaySound(855, "Master")
			end)
			_G["vcbOptions5Box"..k.."PopOut2Choice"..i]:SetScript("OnHide", function(self)
				self:GetParent():SetNormalAtlas("charactercreate-customize-dropdownbox-open")
				PlaySound(855, "Master")
			end)
		else
			_G["vcbOptions5Box"..k.."PopOut2Choice"..i]:SetParent(_G["vcbOptions5Box"..k.."PopOut2Choice1"])
			_G["vcbOptions5Box"..k.."PopOut2Choice"..i]:SetPoint("TOP", _G["vcbOptions5Box"..k.."PopOut2Choice"..i-1], "BOTTOM", 0, 0)
			_G["vcbOptions5Box"..k.."PopOut2Choice"..i]:Show()
		end
		_G["vcbOptions5Box"..k.."PopOut2Choice"..i].Text:SetText(name)
		_G["vcbOptions5Box"..k.."PopOut2Choice"..i]:SetWidth(128)
		_G["vcbOptions5Box"..k.."PopOut2Choice"..i]:HookScript("OnClick", function(self, button, down)
			if button == "LeftButton" and down == false then
				if k == 1 then
					VCBsettings["Arena"]["CurrentTimeText"]["Decimals"] = self.Text:GetText()
					VDW.VCB.chkCurrentUpdArena()
				elseif k== 2 then
					VCBsettings["Arena"]["BothTimeText"]["Decimals"] = self.Text:GetText()
					VDW.VCB.chkBothUpdArena()
				elseif k == 3 then
					VCBsettings["Arena"]["TotalTimeText"]["Decimals"] = self.Text:GetText()
					VDW.VCB.chkTotalUpdArena()
				end
				_G["vcbOptions5Box"..k.."PopOut2"].Text:SetText(self.Text:GetText())
				_G["vcbOptions5Box"..k.."PopOut2Choice1"]:Hide()
			end
		end)
		local w = _G["vcbOptions5Box"..k.."PopOut2Choice"..i].Text:GetStringWidth()
		if w > maxW then maxW = w end
	end
	finalW = math.ceil(maxW + 24)
	for i = 1, counter, 1 do
		_G["vcbOptions5Box"..k.."PopOut2Choice"..i]:SetWidth(finalW)
	end
	counter = 0
	maxW = 160
	_G["vcbOptions5Box"..k.."PopOut2"]:HookScript("OnEnter", function(self)
		VDW.Tooltip_Show(self, prefixTip, L.DECIMALS_TIP, C.Main)
	end)
	_G["vcbOptions5Box"..k.."PopOut2"]:HookScript("OnLeave", function(self) VDW.Tooltip_Hide() end)
	_G["vcbOptions5Box"..k.."PopOut2"]:HookScript("OnClick", function(self, button, down)
		if button == "LeftButton" and down == false then
			if not _G["vcbOptions5Box"..k.."PopOut2Choice1"]:IsShown() then
				_G["vcbOptions5Box"..k.."PopOut2Choice1"]:Show()
			else
				_G["vcbOptions5Box"..k.."PopOut2Choice1"]:Hide()
			end
		end
	end)
-- sec --
	_G["vcbOptions5Box"..k.."PopOut3"].Title:SetText("'Sec'")
	ColoringPopOutButtons(k, 3)
	for i, name in ipairs(textSec) do
		counter = counter + 1
		local btn = CreateFrame("Button", "vcbOptions5Box"..k.."PopOut3Choice"..i, nil, "vdwPopOutButton")
		_G["vcbOptions5Box"..k.."PopOut3Choice"..i]:ClearAllPoints()
		if i == 1 then
			_G["vcbOptions5Box"..k.."PopOut3Choice"..i]:SetParent(_G["vcbOptions5Box"..k.."PopOut3"])
			_G["vcbOptions5Box"..k.."PopOut3Choice"..i]:SetPoint("TOP", "vcbOptions5Box"..k.."PopOut3", "BOTTOM", 0, 4)
			_G["vcbOptions5Box"..k.."PopOut3Choice"..i]:SetScript("OnShow", function(self)
				self:GetParent():SetNormalAtlas("charactercreate-customize-dropdownbox-hover")
				PlaySound(855, "Master")
			end)
			_G["vcbOptions5Box"..k.."PopOut3Choice"..i]:SetScript("OnHide", function(self)
				self:GetParent():SetNormalAtlas("charactercreate-customize-dropdownbox-open")
				PlaySound(855, "Master")
			end)
		else
			_G["vcbOptions5Box"..k.."PopOut3Choice"..i]:SetParent(_G["vcbOptions5Box"..k.."PopOut3Choice1"])
			_G["vcbOptions5Box"..k.."PopOut3Choice"..i]:SetPoint("TOP", _G["vcbOptions5Box"..k.."PopOut3Choice"..i-1], "BOTTOM", 0, 0)
			_G["vcbOptions5Box"..k.."PopOut3Choice"..i]:Show()
		end
		_G["vcbOptions5Box"..k.."PopOut3Choice"..i].Text:SetText(name.text)
		_G["vcbOptions5Box"..k.."PopOut3Choice"..i]:SetWidth(128)
		_G["vcbOptions5Box"..k.."PopOut3Choice"..i]:HookScript("OnClick", function(self, button, down)
			if button == "LeftButton" and down == false then
				if k == 1 then
					VCBsettings["Arena"]["CurrentTimeText"]["Sec"] = name.value
					VDW.VCB.chkCurrentUpdArena()
				elseif k== 2 then
					VCBsettings["Arena"]["BothTimeText"]["Sec"] = name.value
					VDW.VCB.chkBothUpdArena()
				elseif k == 3 then
					VCBsettings["Arena"]["TotalTimeText"]["Sec"] = name.value
					VDW.VCB.chkTotalUpdArena()
				end
				_G["vcbOptions5Box"..k.."PopOut3"].Text:SetText(self.Text:GetText())
				_G["vcbOptions5Box"..k.."PopOut3Choice1"]:Hide()
			end
		end)
		local w = _G["vcbOptions5Box"..k.."PopOut3Choice"..i].Text:GetStringWidth()
		if w > maxW then maxW = w end
	end
	finalW = math.ceil(maxW + 24)
	for i = 1, counter, 1 do
		_G["vcbOptions5Box"..k.."PopOut3Choice"..i]:SetWidth(finalW)
	end
	counter = 0
	maxW = 160
	_G["vcbOptions5Box"..k.."PopOut3"]:HookScript("OnEnter", function(self)
		local word = _G["vcbOptions2Box"..k.."PopOut3"].Title:GetText()
		VDW.Tooltip_Show(self, prefixTip, string.format(L.VISIBILITY_TIP, word), C.Main)
	end)
	_G["vcbOptions5Box"..k.."PopOut3"]:HookScript("OnLeave", function(self) VDW.Tooltip_Hide() end)
	_G["vcbOptions5Box"..k.."PopOut3"]:HookScript("OnClick", function(self, button, down)
		if button == "LeftButton" and down == false then
			if not _G["vcbOptions5Box"..k.."PopOut3Choice1"]:IsShown() then
				_G["vcbOptions5Box"..k.."PopOut3Choice1"]:Show()
			else
				_G["vcbOptions5Box"..k.."PopOut3Choice1"]:Hide()
			end
		end
	end)
end
-- Pop out 4 Buttons Direction  --
for k = 1, 2, 1 do
	_G["vcbOptions5Box"..k.."PopOut4"].Title:SetText(L.DIRECTION)
	ColoringPopOutButtons(k, 4)
	for i, name in ipairs(textDirection) do
		counter = counter + 1
		local btn = CreateFrame("Button", "vcbOptions5Box"..k.."PopOut4Choice"..i, nil, "vdwPopOutButton")
		_G["vcbOptions5Box"..k.."PopOut4Choice"..i]:ClearAllPoints()
		if i == 1 then
			_G["vcbOptions5Box"..k.."PopOut4Choice"..i]:SetParent(_G["vcbOptions5Box"..k.."PopOut4"])
			_G["vcbOptions5Box"..k.."PopOut4Choice"..i]:SetPoint("TOP", "vcbOptions5Box"..k.."PopOut4", "BOTTOM", 0, 4)
			_G["vcbOptions5Box"..k.."PopOut4Choice"..i]:SetScript("OnShow", function(self)
				self:GetParent():SetNormalAtlas("charactercreate-customize-dropdownbox-hover")
				PlaySound(855, "Master")
			end)
			_G["vcbOptions5Box"..k.."PopOut4Choice"..i]:SetScript("OnHide", function(self)
				self:GetParent():SetNormalAtlas("charactercreate-customize-dropdownbox-open")
				PlaySound(855, "Master")
			end)
		else
			_G["vcbOptions5Box"..k.."PopOut4Choice"..i]:SetParent(_G["vcbOptions5Box"..k.."PopOut4Choice1"])
			_G["vcbOptions5Box"..k.."PopOut4Choice"..i]:SetPoint("TOP", _G["vcbOptions5Box"..k.."PopOut4Choice"..i-1], "BOTTOM", 0, 0)
			_G["vcbOptions5Box"..k.."PopOut4Choice"..i]:Show()
		end
		_G["vcbOptions5Box"..k.."PopOut4Choice"..i].Text:SetText(name.text)
		_G["vcbOptions5Box"..k.."PopOut4Choice"..i]:HookScript("OnClick", function(self, button, down)
			if button == "LeftButton" and down == false then
				if k == 1 then
					VCBsettings["Arena"]["CurrentTimeText"]["Direction"] = name.value
					VDW.VCB.chkCurrentUpdArena()
				elseif k== 2 then
					VCBsettings["Arena"]["BothTimeText"]["Direction"] = name.value
					VDW.VCB.chkBothUpdArena()
				end
				_G["vcbOptions5Box"..k.."PopOut4"].Text:SetText(self.Text:GetText())
				_G["vcbOptions5Box"..k.."PopOut4Choice1"]:Hide()
			end
		end)
		local w = _G["vcbOptions5Box"..k.."PopOut4Choice"..i].Text:GetStringWidth()
		if w > maxW then maxW = w end
	end
	finalW = math.ceil(maxW + 24)
	for i = 1, counter, 1 do
		_G["vcbOptions5Box"..k.."PopOut4Choice"..i]:SetWidth(finalW)
	end
	counter = 0
	maxW = 160
	_G["vcbOptions5Box"..k.."PopOut4"]:HookScript("OnEnter", function(self)
		VDW.Tooltip_Show(self, prefixTip, L.DIRECTION_TIP, C.Main)
	end)
	_G["vcbOptions5Box"..k.."PopOut4"]:HookScript("OnLeave", function(self) VDW.Tooltip_Hide() end)
	_G["vcbOptions5Box"..k.."PopOut4"]:HookScript("OnClick", function(self, button, down)
		if button == "LeftButton" and down == false then
			if not _G["vcbOptions5Box"..k.."PopOut4Choice1"]:IsShown() then
				_G["vcbOptions5Box"..k.."PopOut4Choice1"]:Show()
			else
				_G["vcbOptions5Box"..k.."PopOut4Choice1"]:Hide()
			end
		end
	end)
end
-- Border text
ColoringPopOutButtons("4a", 1)
vcbOptions5Box4aPopOut1.Title:SetText(L.POSITION)
for i, name in ipairs(textBorder) do
	counter = counter + 1
	local btn = CreateFrame("Button", "vcbOptions5Box4aPopOut1Choice"..i, nil, "vdwPopOutButton")
	_G["vcbOptions5Box4aPopOut1Choice"..i]:ClearAllPoints()
	if i == 1 then
		_G["vcbOptions5Box4aPopOut1Choice"..i]:SetParent(vcbOptions5Box4aPopOut1)
		_G["vcbOptions5Box4aPopOut1Choice"..i]:SetPoint("TOP", vcbOptions5Box4aPopOut1, "BOTTOM", 0, 4)
		_G["vcbOptions5Box4aPopOut1Choice"..i]:SetScript("OnShow", function(self)
			self:GetParent():SetNormalAtlas("charactercreate-customize-dropdownbox-hover")
			PlaySound(855, "Master")
		end)
		_G["vcbOptions5Box4aPopOut1Choice"..i]:SetScript("OnHide", function(self)
			self:GetParent():SetNormalAtlas("charactercreate-customize-dropdownbox-open")
			PlaySound(855, "Master")
		end)
	else
		_G["vcbOptions5Box4aPopOut1Choice"..i]:SetParent(vcbOptions5Box4aPopOut1Choice1)
		_G["vcbOptions5Box4aPopOut1Choice"..i]:SetPoint("TOP", _G["vcbOptions5Box4aPopOut1Choice"..i-1], "BOTTOM", 0, 0)
		_G["vcbOptions5Box4aPopOut1Choice"..i]:Show()
	end
	_G["vcbOptions5Box4aPopOut1Choice"..i].Text:SetText(name.text)
	_G["vcbOptions5Box4aPopOut1Choice"..i]:HookScript("OnClick", function(self, button, down)
		if button == "LeftButton" and down == false then
			VCBsettings.Arena.BorderText.Position = name.value
			vcbOptions5Box4aPopOut1.Text:SetText(self.Text:GetText())
			VDW.VCB.chkArenaBorderTextPosition()
			vcbOptions5Box4aPopOut1Choice1:Hide()
		end
	end)
	local w = _G["vcbOptions5Box4aPopOut1Choice"..i].Text:GetStringWidth()
	if w > maxW then maxW = w end
end
finalW = math.ceil(maxW + 24)
for i = 1, counter, 1 do
	_G["vcbOptions5Box4aPopOut1Choice"..i]:SetWidth(finalW)
end
counter = 0
maxW = 160
vcbOptions5Box4aPopOut1:HookScript("OnEnter", function(self)
	local parent = self:GetParent()
	local word = parent.Title:GetText()
	VDW.Tooltip_Show(self, prefixTip, string.format(L.POSITION_TIP, word), C.Main)
end)
vcbOptions5Box4aPopOut1:HookScript("OnLeave", function(self) VDW.Tooltip_Hide() end)
vcbOptions5Box4aPopOut1:HookScript("OnClick", function(self, button, down)
	if button == "LeftButton" and down == false then
		if not vcbOptions5Box4aPopOut1Choice1:IsShown() then
			vcbOptions5Box4aPopOut1Choice1:Show()
		else
			vcbOptions5Box4aPopOut1Choice1:Hide()
		end
	end
end)
-- Icon --
ColoringPopOutButtons(5, 1)
vcbOptions5Box5PopOut1.Title:SetText(L.POSITION)
for i, name in ipairs(iconPosition) do
	counter = counter + 1
	local btn = CreateFrame("Button", "vcbOptions5Box5PopOut1Choice"..i, nil, "vdwPopOutButton")
	_G["vcbOptions5Box5PopOut1Choice"..i]:ClearAllPoints()
	if i == 1 then
		_G["vcbOptions5Box5PopOut1Choice"..i]:SetParent(vcbOptions5Box5PopOut1)
		_G["vcbOptions5Box5PopOut1Choice"..i]:SetPoint("TOP", vcbOptions5Box5PopOut1, "BOTTOM", 0, 4)
		_G["vcbOptions5Box5PopOut1Choice"..i]:SetScript("OnShow", function(self)
			self:GetParent():SetNormalAtlas("charactercreate-customize-dropdownbox-hover")
			PlaySound(855, "Master")
		end)
		_G["vcbOptions5Box5PopOut1Choice"..i]:SetScript("OnHide", function(self)
			self:GetParent():SetNormalAtlas("charactercreate-customize-dropdownbox-open")
			PlaySound(855, "Master")
		end)
	else
		_G["vcbOptions5Box5PopOut1Choice"..i]:SetParent(vcbOptions5Box5PopOut1Choice1)
		_G["vcbOptions5Box5PopOut1Choice"..i]:SetPoint("TOP", _G["vcbOptions5Box5PopOut1Choice"..i-1], "BOTTOM", 0, 0)
		_G["vcbOptions5Box5PopOut1Choice"..i]:Show()
	end
	_G["vcbOptions5Box5PopOut1Choice"..i].Text:SetText(name.text)
	_G["vcbOptions5Box5PopOut1Choice"..i]:HookScript("OnClick", function(self, button, down)
		if button == "LeftButton" and down == false then
			VCBsettings["Arena"]["Icon"]["Position"] = name.value
			vcbOptions5Box5PopOut1.Text:SetText(self.Text:GetText())
			VDW.VCB.chkArenaIconPosition()
			vcbOptions5Box5PopOut1Choice1:Hide()
		end
	end)
	local w = _G["vcbOptions5Box5PopOut1Choice"..i].Text:GetStringWidth()
	if w > maxW then maxW = w end
end
finalW = math.ceil(maxW + 24)
for i = 1, counter, 1 do
	_G["vcbOptions5Box5PopOut1Choice"..i]:SetWidth(finalW)
end
counter = 0
maxW = 160
vcbOptions5Box5PopOut1:HookScript("OnEnter", function(self)
	local parent = self:GetParent()
	local word = parent.Title:GetText()
	VDW.Tooltip_Show(self, prefixTip, string.format(L.POSITION_TIP, word), C.Main)
end)
vcbOptions5Box5PopOut1:HookScript("OnLeave", function(self) VDW.Tooltip_Hide() end)
vcbOptions5Box5PopOut1:HookScript("OnClick", function(self, button, down)
	if button == "LeftButton" and down == false then
		if not vcbOptions5Box5PopOut1Choice1:IsShown() then
			vcbOptions5Box5PopOut1Choice1:Show()
		else
			vcbOptions5Box5PopOut1Choice1:Hide()
		end
	end
end)
-- Icon shield
ColoringPopOutButtons("5a", 1)
vcbOptions5Box5aPopOut1.Title:SetText(L.POSITION)
for i, name in ipairs(iconPosition) do
	counter = counter + 1
	local btn = CreateFrame("Button", "vcbOptions5Box5aPopOut1Choice"..i, nil, "vdwPopOutButton")
	_G["vcbOptions5Box5aPopOut1Choice"..i]:ClearAllPoints()
	if i == 1 then
		_G["vcbOptions5Box5aPopOut1Choice"..i]:SetParent(vcbOptions5Box5aPopOut1)
		_G["vcbOptions5Box5aPopOut1Choice"..i]:SetPoint("TOP", vcbOptions5Box5aPopOut1, "BOTTOM", 0, 4)
		_G["vcbOptions5Box5aPopOut1Choice"..i]:SetScript("OnShow", function(self)
			self:GetParent():SetNormalAtlas("charactercreate-customize-dropdownbox-hover")
			PlaySound(855, "Master")
		end)
		_G["vcbOptions5Box5aPopOut1Choice"..i]:SetScript("OnHide", function(self)
			self:GetParent():SetNormalAtlas("charactercreate-customize-dropdownbox-open")
			PlaySound(855, "Master")
		end)
	else
		_G["vcbOptions5Box5aPopOut1Choice"..i]:SetParent(vcbOptions5Box5aPopOut1Choice1)
		_G["vcbOptions5Box5aPopOut1Choice"..i]:SetPoint("TOP", _G["vcbOptions5Box5aPopOut1Choice"..i-1], "BOTTOM", 0, 0)
		_G["vcbOptions5Box5aPopOut1Choice"..i]:Show()
	end
	_G["vcbOptions5Box5aPopOut1Choice"..i].Text:SetText(name.text)
	_G["vcbOptions5Box5aPopOut1Choice"..i]:HookScript("OnClick", function(self, button, down)
		if button == "LeftButton" and down == false then
			VCBsettings["Arena"]["Shield"]["Position"] = name.value
			vcbOptions5Box5aPopOut1.Text:SetText(self.Text:GetText())
			VDW.VCB.chkArenaShieldPosition()
			vcbOptions5Box5aPopOut1Choice1:Hide()
		end
	end)
	local w = _G["vcbOptions5Box5aPopOut1Choice"..i].Text:GetStringWidth()
	if w > maxW then maxW = w end
end
finalW = math.ceil(maxW + 24)
for i = 1, counter, 1 do
	_G["vcbOptions5Box5aPopOut1Choice"..i]:SetWidth(finalW)
end
counter = 0
maxW = 160
vcbOptions5Box5aPopOut1:HookScript("OnEnter", function(self)
	local parent = self:GetParent()
	local word = parent.Title:GetText()
	VDW.Tooltip_Show(self, prefixTip, string.format(L.POSITION_TIP, word), C.Main)
end)
vcbOptions5Box5aPopOut1:HookScript("OnLeave", function(self) VDW.Tooltip_Hide() end)
vcbOptions5Box5aPopOut1:HookScript("OnClick", function(self, button, down)
	if button == "LeftButton" and down == false then
		if not vcbOptions5Box5aPopOut1Choice1:IsShown() then
			vcbOptions5Box5aPopOut1Choice1:Show()
		else
			vcbOptions5Box5aPopOut1Choice1:Hide()
		end
	end
end)
-- color & style of bar & border --
for k = 6, 7, 1 do
-- color --
	ColoringPopOutButtons(k, 1)
	_G["vcbOptions5Box"..k.."PopOut1"].Title:SetText(L.COLOR)
	for i, name in ipairs(barColor) do
		counter = counter + 1
		local btn = CreateFrame("Button", "vcbOptions5Box"..k.."PopOut1Choice"..i, nil, "vdwPopOutButton")
		_G["vcbOptions5Box"..k.."PopOut1Choice"..i]:ClearAllPoints()
		if i == 1 then
			_G["vcbOptions5Box"..k.."PopOut1Choice"..i]:SetParent(_G["vcbOptions5Box"..k.."PopOut1"])
			_G["vcbOptions5Box"..k.."PopOut1Choice"..i]:SetPoint("TOP", _G["vcbOptions5Box"..k.."PopOut1"], "BOTTOM", 0, 4)
			_G["vcbOptions5Box"..k.."PopOut1Choice"..i]:SetScript("OnShow", function(self)
				self:GetParent():SetNormalAtlas("charactercreate-customize-dropdownbox-hover")
				PlaySound(855, "Master")
			end)
			_G["vcbOptions5Box"..k.."PopOut1Choice"..i]:SetScript("OnHide", function(self)
				self:GetParent():SetNormalAtlas("charactercreate-customize-dropdownbox-open")
				PlaySound(855, "Master")
			end)
		else
			_G["vcbOptions5Box"..k.."PopOut1Choice"..i]:SetParent(_G["vcbOptions5Box"..k.."PopOut1Choice1"])
			_G["vcbOptions5Box"..k.."PopOut1Choice"..i]:SetPoint("TOP", _G["vcbOptions5Box"..k.."PopOut1Choice"..i-1], "BOTTOM", 0, 0)
			_G["vcbOptions5Box"..k.."PopOut1Choice"..i]:Show()
		end
		_G["vcbOptions5Box"..k.."PopOut1Choice"..i].Text:SetText(name.text)
		_G["vcbOptions5Box"..k.."PopOut1Choice"..i]:SetWidth(128)
		_G["vcbOptions5Box"..k.."PopOut1Choice"..i]:HookScript("OnClick", function(self, button, down)
			if button == "LeftButton" and down == false then
				if k == 6 then
					VCBsettings["Arena"]["StatusBar"]["Color"] = name.value
					VDW.VCB.chkStatusColorArena()
				elseif k == 7 then
					VCBsettings["Arena"]["Border"]["Color"] = name.value
					VDW.VCB.chkBorderColorArena()
				end
				_G["vcbOptions5Box"..k.."PopOut1"].Text:SetText(self.Text:GetText())
				_G["vcbOptions5Box"..k.."PopOut1Choice1"]:Hide()
			end
		end)
		local w = _G["vcbOptions5Box"..k.."PopOut1Choice"..i].Text:GetStringWidth()
		if w > maxW then maxW = w end
	end
	finalW = math.ceil(maxW + 24)
	for i = 1, counter, 1 do
		_G["vcbOptions5Box"..k.."PopOut1Choice"..i]:SetWidth(finalW)
	end
	counter = 0
	maxW = 160
	_G["vcbOptions5Box"..k.."PopOut1"]:HookScript("OnEnter", function(self)
		local parent = self:GetParent()
		local word = parent.Title:GetText()
		VDW.Tooltip_Show(self, prefixTip, string.format(L.COLOR_TIP, word), C.Main)
	end)
	_G["vcbOptions5Box"..k.."PopOut1"]:HookScript("OnLeave", function(self) VDW.Tooltip_Hide() end)
	_G["vcbOptions5Box"..k.."PopOut1"]:HookScript("OnClick", function(self, button, down)
		if button == "LeftButton" and down == false then
			if not _G["vcbOptions5Box"..k.."PopOut1Choice1"]:IsShown() then
				_G["vcbOptions5Box"..k.."PopOut1Choice1"]:Show()
			else
				_G["vcbOptions5Box"..k.."PopOut1Choice1"]:Hide()
			end
		end
	end)
-- style --
	ColoringPopOutButtons(k, 2)
	_G["vcbOptions5Box"..k.."PopOut2"].Title:SetText(L.STYLE)
	for i, name in ipairs(barStyle) do
		counter = counter + 1
		local btn = CreateFrame("Button", "vcbOptions5Box"..k.."PopOut2Choice"..i, nil, "vdwPopOutButton")
		_G["vcbOptions5Box"..k.."PopOut2Choice"..i]:ClearAllPoints()
		if i == 1 then
			_G["vcbOptions5Box"..k.."PopOut2Choice"..i]:SetParent(_G["vcbOptions5Box"..k.."PopOut2"])
			_G["vcbOptions5Box"..k.."PopOut2Choice"..i]:SetPoint("TOP", "vcbOptions5Box"..k.."PopOut2", "BOTTOM", 0, 4)
			_G["vcbOptions5Box"..k.."PopOut2Choice"..i]:SetScript("OnShow", function(self)
				self:GetParent():SetNormalAtlas("charactercreate-customize-dropdownbox-hover")
				PlaySound(855, "Master")
			end)
			_G["vcbOptions5Box"..k.."PopOut2Choice"..i]:SetScript("OnHide", function(self)
				self:GetParent():SetNormalAtlas("charactercreate-customize-dropdownbox-open")
				PlaySound(855, "Master")
			end)
		else
			_G["vcbOptions5Box"..k.."PopOut2Choice"..i]:SetParent(_G["vcbOptions5Box"..k.."PopOut2Choice1"])
			_G["vcbOptions5Box"..k.."PopOut2Choice"..i]:SetPoint("TOP", _G["vcbOptions5Box"..k.."PopOut2Choice"..i-1], "BOTTOM", 0, 0)
			_G["vcbOptions5Box"..k.."PopOut2Choice"..i]:Show()
		end
		_G["vcbOptions5Box"..k.."PopOut2Choice"..i].Text:SetText(name.text)
		_G["vcbOptions5Box"..k.."PopOut2Choice"..i]:HookScript("OnClick", function(self, button, down)
			if button == "LeftButton" and down == false then
				if k == 6 then
					VCBsettings["Arena"]["StatusBar"]["Style"] = name.value
					VDW.VCB.chkStatusStyleArena()
				elseif k== 7 then
					VCBsettings["Arena"]["Border"]["Style"] = name.value
					VDW.VCB.chkBorderStyleArena()
					C_UI.Reload()
				end
				_G["vcbOptions5Box"..k.."PopOut2"].Text:SetText(self.Text:GetText())
				_G["vcbOptions5Box"..k.."PopOut2Choice1"]:Hide()
			end
		end)
		local w = _G["vcbOptions5Box"..k.."PopOut2Choice"..i].Text:GetStringWidth()
		if w > maxW then maxW = w end
	end
	finalW = math.ceil(maxW + 24)
	for i = 1, counter, 1 do
		_G["vcbOptions5Box"..k.."PopOut2Choice"..i]:SetWidth(finalW)
	end
	counter = 0
	maxW = 160
	_G["vcbOptions5Box"..k.."PopOut2"]:HookScript("OnEnter", function(self)
		local parent = self:GetParent()
		local word = parent.Title:GetText()
		VDW.Tooltip_Show(self, prefixTip, string.format(L.STYLE_TIP, word), C.Main)
	end)
	_G["vcbOptions5Box"..k.."PopOut2"]:HookScript("OnLeave", function(self) VDW.Tooltip_Hide() end)
	_G["vcbOptions5Box"..k.."PopOut2"]:HookScript("OnClick", function(self, button, down)
		if button == "LeftButton" and down == false then
			if not _G["vcbOptions5Box"..k.."PopOut2Choice1"]:IsShown() then
				_G["vcbOptions5Box"..k.."PopOut2Choice1"]:Show()
			else
				_G["vcbOptions5Box"..k.."PopOut2Choice1"]:Hide()
			end
		end
	end)
end
-- check button interrupt color
vcbOptions5Box6CheckButton1.Text:SetText(" Color the bar if my "..VDW.VCB.InterruptSpell.." is on Cooldown.")
vcbOptions5Box6CheckButton1.Text:SetWidth(vcbOptions5Box6:GetWidth()*0.8)
vcbOptions5Box6CheckButton1:SetScript("OnEnter", function(self)
	local word = self.Text:GetText()
	VDW.Tooltip_Show(self, prefixTip, word, C.Main)
end)
vcbOptions5Box6CheckButton1:HookScript("OnLeave", function(self) VDW.Tooltip_Hide() end)
vcbOptions5Box6CheckButton1:HookScript("OnClick", function (self, button)
	if button == "LeftButton" then
		if self:GetChecked() == true then
			VCBsettings.Arena.StatusBar.Interrupt.Show = true
			self.Text:SetTextColor(C.Main:GetRGB())
		elseif self:GetChecked() == false then
			VCBsettings.Arena.StatusBar.Interrupt.Show = false
			self.Text:SetTextColor(0.35, 0.35, 0.35, 0.8)
		end
		VDW.VCB.chkStatusColorArena()
		PlaySound(858, "Master")
	end
end)
-- pop out button Unlock the Castbar --
ColoringPopOutButtons(8, 1)
vcbOptions5Box8PopOut1.Title:SetText(L.LOCKING)
for i, name in ipairs(barLock) do
	counter = counter + 1
	local btn = CreateFrame("Button", "vcbOptions5Box8PopOut1Choice"..i, nil, "vdwPopOutButton")
	_G["vcbOptions5Box8PopOut1Choice"..i]:ClearAllPoints()
	if i == 1 then
		_G["vcbOptions5Box8PopOut1Choice"..i]:SetParent(vcbOptions5Box8PopOut1)
		_G["vcbOptions5Box8PopOut1Choice"..i]:SetPoint("TOP", vcbOptions5Box8PopOut1, "BOTTOM", 0, 4)
		_G["vcbOptions5Box8PopOut1Choice"..i]:SetScript("OnShow", function(self)
			self:GetParent():SetNormalAtlas("charactercreate-customize-dropdownbox-hover")
			PlaySound(855, "Master")
		end)
		_G["vcbOptions5Box8PopOut1Choice"..i]:SetScript("OnHide", function(self)
			self:GetParent():SetNormalAtlas("charactercreate-customize-dropdownbox-open")
			PlaySound(855, "Master")
		end)
	else
		_G["vcbOptions5Box8PopOut1Choice"..i]:SetParent(vcbOptions5Box8PopOut1Choice1)
		_G["vcbOptions5Box8PopOut1Choice"..i]:SetPoint("TOP", _G["vcbOptions5Box8PopOut1Choice"..i-1], "BOTTOM", 0, 0)
		_G["vcbOptions5Box8PopOut1Choice"..i]:Show()
	end
	_G["vcbOptions5Box8PopOut1Choice"..i].Text:SetText(name.text)
	_G["vcbOptions5Box8PopOut1Choice"..i]:HookScript("OnClick", function(self, button, down)
		if button == "LeftButton" and down == false then
			VCBsettings["Arena"]["Lock"] = name.value
			C_UI.Reload()
		end
	end)
	local w = _G["vcbOptions5Box8PopOut1Choice"..i].Text:GetStringWidth()
	if w > maxW then maxW = w end
end
finalW = math.ceil(maxW + 24)
for i = 1, counter, 1 do
	_G["vcbOptions5Box8PopOut1Choice"..i]:SetWidth(finalW)
end
counter = 0
maxW = 160
vcbOptions5Box8PopOut1:HookScript("OnEnter", function(self)
	VDW.Tooltip_Show(self, prefixTip, L.LOCKING_TIP_ARENA, C.Main)
end)
vcbOptions5Box8PopOut1:HookScript("OnLeave", function(self) VDW.Tooltip_Hide() end)
vcbOptions5Box8PopOut1:HookScript("OnClick", function(self, button, down)
	if button == "LeftButton" and down == false then
		if not vcbOptions5Box8PopOut1Choice1:IsShown() then
			vcbOptions5Box8PopOut1Choice1:Show()
		else
			vcbOptions5Box8PopOut1Choice1:Hide()
		end
	end
end)
-- slide bar 1 scale of the bar --
vcbOptions5Box8Slider1.Slider.Thumb:SetVertexColor(C.Main:GetRGB())
vcbOptions5Box8Slider1.Back:GetRegions():SetVertexColor(C.Main:GetRGB())
vcbOptions5Box8Slider1.Forward:GetRegions():SetVertexColor(C.Main:GetRGB())
vcbOptions5Box8Slider1.TopText:SetTextColor(C.High:GetRGB())
vcbOptions5Box8Slider1.MinText:SetTextColor(C.High:GetRGB())
vcbOptions5Box8Slider1.MaxText:SetTextColor(C.High:GetRGB())
vcbOptions5Box8Slider1.MinText:SetText("10%")
vcbOptions5Box8Slider1.MaxText:SetText("200%")
vcbOptions5Box8Slider1.Slider:SetMinMaxValues(10, 200)
-- enter --
vcbOptions5Box8Slider1.Slider:HookScript("OnEnter", function(self)
	VDW.Tooltip_Show(self, prefixTip, L.SLIDER_TIP, C.Main)
end)
-- leave --
vcbOptions5Box8Slider1.Slider:HookScript("OnLeave", function(self) VDW.Tooltip_Hide() end)
-- mouse wheel --
vcbOptions5Box8Slider1.Slider:SetScript("OnMouseWheel", MouseWheelSlider)
-- value change --
vcbOptions5Box8Slider1.Slider:SetScript("OnValueChanged", function (self, value, userInput)
	vcbOptions5Box8Slider1.TopText:SetText(string.format(L.SLIDER_TEXT_SCALE, self:GetValue()).."%")
	VCBsettings["Arena"]["Scale"] = self:GetValue()
	for i = 1, 3, 1 do
		_G["ArenaVCBpreview"..i]:SetScale(VCBsettings["Arena"]["Scale"]/100)
	end
	PlaySound(858, "Master")
end)
-- slide bar 1 width of the bar --
vcbOptions5Box9Slider1.Slider.Thumb:SetVertexColor(C.Main:GetRGB())
vcbOptions5Box9Slider1.Back:GetRegions():SetVertexColor(C.Main:GetRGB())
vcbOptions5Box9Slider1.Forward:GetRegions():SetVertexColor(C.Main:GetRGB())
vcbOptions5Box9Slider1.TopText:SetTextColor(C.High:GetRGB())
vcbOptions5Box9Slider1.MinText:SetTextColor(C.High:GetRGB())
vcbOptions5Box9Slider1.MaxText:SetTextColor(C.High:GetRGB())
vcbOptions5Box9Slider1.MinText:SetText(80)
vcbOptions5Box9Slider1.MaxText:SetText(560)
vcbOptions5Box9Slider1.Slider:SetMinMaxValues(80, 560)
-- enter --
vcbOptions5Box9Slider1.Slider:HookScript("OnEnter", function(self)
	VDW.Tooltip_Show(self, prefixTip, L.SLIDER_TIP, C.Main)
end)
-- leave --
vcbOptions5Box9Slider1.Slider:HookScript("OnLeave", function(self) VDW.Tooltip_Hide() end)
-- mouse wheel --
vcbOptions5Box9Slider1.Slider:SetScript("OnMouseWheel", MouseWheelSlider)
-- value change --
vcbOptions5Box9Slider1.Slider:SetScript("OnValueChanged", function (self, value, userInput)
	vcbOptions5Box9Slider1.TopText:SetText(string.format(L.SLIDER_TEXT_WIDTH, self:GetValue()))
	VCBsettings.Arena.Size.Width = self:GetValue()
	for i = 1, 3, 1 do
		_G["ArenaVCBpreview"..i]:SetSize(VCBsettings.Arena.Size.Width, VCBsettings.Arena.Size.Height)
	end
	if vcbArenaCastbar then VDW.VCB.ArenaCastbarSize() end
	PlaySound(858, "Master")
end)
-- slide bar 2 heigth of the bar --
vcbOptions5Box9Slider2.Slider.Thumb:SetVertexColor(C.Main:GetRGB())
vcbOptions5Box9Slider2.Back:GetRegions():SetVertexColor(C.Main:GetRGB())
vcbOptions5Box9Slider2.Forward:GetRegions():SetVertexColor(C.Main:GetRGB())
vcbOptions5Box9Slider2.TopText:SetTextColor(C.High:GetRGB())
vcbOptions5Box9Slider2.MinText:SetTextColor(C.High:GetRGB())
vcbOptions5Box9Slider2.MaxText:SetTextColor(C.High:GetRGB())
vcbOptions5Box9Slider2.MinText:SetText(2)
vcbOptions5Box9Slider2.MaxText:SetText(80)
vcbOptions5Box9Slider2.Slider:SetMinMaxValues(2, 80)
-- enter --
vcbOptions5Box9Slider2.Slider:HookScript("OnEnter", function(self)
	VDW.Tooltip_Show(self, prefixTip, L.SLIDER_TIP, C.Main)
end)
-- leave --
vcbOptions5Box9Slider2.Slider:HookScript("OnLeave", function(self) VDW.Tooltip_Hide() end)
-- mouse wheel --
vcbOptions5Box9Slider2.Slider:SetScript("OnMouseWheel", MouseWheelSlider)
-- value change --
vcbOptions5Box9Slider2.Slider:SetScript("OnValueChanged", function (self, value, userInput)
	vcbOptions5Box9Slider2.TopText:SetText(string.format(L.SLIDER_TEXT_HEIGHT, self:GetValue()))
	VCBsettings.Arena.Size.Height = self:GetValue()
	for i = 1, 3, 1 do
		_G["ArenaVCBpreview"..i]:SetSize(VCBsettings.Arena.Size.Width, VCBsettings.Arena.Size.Height)
	end
	if vcbArenaCastbar then VDW.VCB.ArenaCastbarSize() end
	PlaySound(858, "Master")
end)
-- taking care of the cast bar preview --
ArenaVCBpreview1.Text:SetText(L.ARENA_CAST_BAR)
-- enter --
ArenaVCBpreview1:SetScript("OnEnter", function(self)
	VDW.Tooltip_Show(self, prefixTip, G.BUTTON_L_CLICK..G.TIP_DRAG_ME, C.Main) 
end)
-- leave --
ArenaVCBpreview1:HookScript("OnLeave", function(self) VDW.Tooltip_Hide() end)
-- Function for stoping the movement --
local function StopMoving(self)
	VCBsettings["Arena"]["Position"]["X"] = Round(self:GetLeft())
	VCBsettings["Arena"]["Position"]["Y"] = Round(self:GetBottom())
	self:StopMovingOrSizing()
end
-- Moving the preview --
ArenaVCBpreview1:RegisterForDrag("LeftButton")
ArenaVCBpreview1:SetScript("OnDragStart", ArenaVCBpreview1.StartMoving)
ArenaVCBpreview1:SetScript("OnDragStop", function(self) StopMoving(self) end)
-- Hiding the preview --
ArenaVCBpreview1:SetScript("OnHide", function(self)
	VCBsettings["Arena"]["Position"]["X"] = Round(self:GetLeft())
	VCBsettings["Arena"]["Position"]["Y"] = Round(self:GetBottom())
end)
-- Checking the Saved Variables --
local function CheckSavedVariables()
	vcbOptions5Box1PopOut1.Text:SetText(textPositionByValue[VCBsettings.Arena.CurrentTimeText.Position] or VDWtranslate.Global.HIDE)
	vcbOptions5Box2PopOut1.Text:SetText(textPositionByValue[VCBsettings.Arena.BothTimeText.Position] or VDWtranslate.Global.HIDE)
	vcbOptions5Box3PopOut1.Text:SetText(textPositionByValue[VCBsettings.Arena.TotalTimeText.Position] or VDWtranslate.Global.HIDE)
	vcbOptions5Box4PopOut1.Text:SetText(textPositionByValue[VCBsettings.Arena.NameText.Position] or VDWtranslate.Global.HIDE)
	vcbOptions5Box1PopOut3.Text:SetText(textSecByValue[VCBsettings.Arena.CurrentTimeText.Sec] or VDWtranslate.Global.HIDE)
	vcbOptions5Box2PopOut3.Text:SetText(textSecByValue[VCBsettings.Arena.BothTimeText.Sec] or VDWtranslate.Global.HIDE)
	vcbOptions5Box3PopOut3.Text:SetText(textSecByValue[VCBsettings.Arena.TotalTimeText.Sec] or VDWtranslate.Global.HIDE)
	vcbOptions5Box1PopOut4.Text:SetText(textDirectionByValue[VCBsettings.Arena.CurrentTimeText.Direction] or VDWtranslate.Global.HIDE)
	vcbOptions5Box2PopOut4.Text:SetText(textDirectionByValue[VCBsettings.Arena.BothTimeText.Direction] or VDWtranslate.Global.HIDE)
	vcbOptions5Box4aPopOut1.Text:SetText(textBorderByValue[VCBsettings.Arena.BorderText.Position] or VDWtranslate.Global.HIDE)
	vcbOptions5Box5PopOut1.Text:SetText(iconPositionByValue[VCBsettings.Arena.Icon.Position] or VDWtranslate.Global.HIDE)
	vcbOptions5Box5aPopOut1.Text:SetText(iconPositionByValue[VCBsettings.Arena.Shield.Position] or VDWtranslate.Global.HIDE)
	vcbOptions5Box6PopOut1.Text:SetText(barColorByValue[VCBsettings.Arena.StatusBar.Color] or VDWtranslate.Global.HIDE)
	vcbOptions5Box7PopOut1.Text:SetText(barColorByValue[VCBsettings.Arena.Border.Color] or VDWtranslate.Global.HIDE)
	vcbOptions5Box6PopOut2.Text:SetText(barStyleByValue[VCBsettings.Arena.StatusBar.Style] or VDWtranslate.Global.HIDE)
	vcbOptions5Box7PopOut2.Text:SetText(barStyleByValue[VCBsettings.Arena.Border.Style] or VDWtranslate.Global.HIDE)
	vcbOptions5Box8PopOut1.Text:SetText(barLockByValue[VCBsettings.Arena.Lock] or VDWtranslate.Global.HIDE)
	vcbOptions5Box1PopOut2.Text:SetText(VCBsettings.Arena.CurrentTimeText.Decimals)
	vcbOptions5Box2PopOut2.Text:SetText(VCBsettings.Arena.BothTimeText.Decimals)
	vcbOptions5Box3PopOut2.Text:SetText(VCBsettings.Arena.TotalTimeText.Decimals)
	if VCBsettings.Arena.StatusBar.Interrupt.Show then
		vcbOptions5Box6CheckButton1:SetChecked(true)
		vcbOptions5Box6CheckButton1.Text:SetTextColor(C.Main:GetRGB())
	else
		vcbOptions5Box6CheckButton1:SetChecked(false)
		vcbOptions5Box6CheckButton1.Text:SetTextColor(0.35, 0.35, 0.35, 0.8)
	end
--	if VCBsettings.Arena.Lock then
--		sliderDisable(vcbOptions5Box8Slider1)
--		sliderDisable(vcbOptions5Box9Slider1)
--		sliderDisable(vcbOptions5Box9Slider2)
		for i = 1, 3, 1 do
			if _G["ArenaVCBpreview"..i]:IsShown() then _G["ArenaVCBpreview"..i]:Hide() end
		end
--	else
--		sliderEnable(vcbOptions5Box8Slider1)
--		sliderEnable(vcbOptions5Box9Slider1)
--		sliderEnable(vcbOptions5Box9Slider2)
--		ArenaVCBpreview1:ClearAllPoints()
--		ArenaVCBpreview1:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", VCBsettings["Arena"]["Position"]["X"], VCBsettings["Arena"]["Position"]["Y"])
--		ArenaVCBpreview1:Show()
--		for i = 2, 3, 1 do
--			_G["ArenaVCBpreview"..i]:ClearAllPoints()
--			_G["ArenaVCBpreview"..i]:SetPoint("TOP", _G["ArenaVCBpreview"..i-1], "BOTTOM", 0, -32)
--			if not _G["ArenaVCBpreview"..i]:IsShown() then _G["ArenaVCBpreview"..i]:Show() end
--		end
--	end
--	vcbOptions5Box8Slider1.Slider:SetValue(VCBsettings["Arena"]["Scale"])
--	vcbOptions5Box9Slider1.Slider:SetValue(VCBsettings.Arena.Size.Width)
--	vcbOptions5Box9Slider2.Slider:SetValue(VCBsettings.Arena.Size.Height)
end
-- Show the option panel --
vcbOptions5:HookScript("OnShow", function(self)
	for i = 1, 4, 1 do
		_G["vcbOptions0Tab"..i].Text:SetTextColor(0.4, 0.4, 0.4, 1)
		if _G["vcbOptions"..i]:IsShown() then _G["vcbOptions"..i]:Hide() end
	end
	vcbOptions0Tab5.Text:SetTextColor(C.High:GetRGB())
	vcbOptions0Tab6.Text:SetTextColor(0.4, 0.4, 0.4, 1)
	if vcbOptions6:IsShown() then vcbOptions6:Hide() end
	CheckSavedVariables()
end)
-- Hide the option panel --
vcbOptions5:HookScript("OnHide", function(self)
	for i = 1, 3, 1 do
			if _G["ArenaVCBpreview"..i]:IsShown() then _G["ArenaVCBpreview"..i]:Hide() end
		end
end)
