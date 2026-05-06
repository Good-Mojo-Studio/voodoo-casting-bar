-- some variables --
local G = VDWtranslate.Global
local L = VDWtranslate.VCB.Options
local C = VDW.GetAddonColors("VCB")
local prefixTip = VDW.Prefix("VCB")
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
local gcdPosition = {
	{value = "Left", text = G.LEFT},
	{value = "Top", text = G.TOP},
	{value = "Right", text = G.RIGHT},
	{value = "Bottom", text = G.BOTTOM},
}
local gcdPositionByValue = {}
for _, option in ipairs(gcdPosition) do
	gcdPositionByValue[option.value] = option.text
end
local gcdStyle = {
	{value = "Icon", text = G.ICON},
	{value = "Bar", text = G.BAR},
	{value = "InstantCastBar", text = "Instant Cast Bar"},
}
local gcdStyleByValue = {}
for _, option in ipairs(gcdStyle) do
	gcdStyleByValue[option.value] = option.text
end
local gcdIconStyle = {
	{value = "ClassSquare", text = G.CLASS_SQUARE},
	{value = "ClassRound", text = G.CLASS_ROUND},
	{value = "Hero", text = G.HERO},
	{value = "FactionRound", text = G.FACTION_ROUND},
	{value = "FactionOld", text = G.FACTION_OLD},
	{value = "FactionNew", text = G.FACTION_NEW},
}
local gcdIconStyleByValue = {}
for _, option in ipairs(gcdIconStyle) do
	gcdIconStyleByValue[option.value] = option.text
end
local gcdBarFill = {
	{value = "Standard", text = G.STANDARD},
	{value = "Reversed", text = G.REVERSED},
	{value = "Center", text = G.CENTER},
}
local gcdBarFillByValue = {}
for _, option in ipairs(gcdBarFill) do
	gcdBarFillByValue[option.value] = option.text
end
local instantStyle = {
	{value = "Default", text = G.DEFAULT},
	{value = "Custom", text = G.CUSTOM},
}
local instantStyleByValue = {}
for _, option in ipairs(instantStyle) do
	instantStyleByValue[option.value] = option.text
end
local barColor = {
	{value = "Default", text = G.DEFAULT},
	{value = "Class", text = G.CLASS},
	{value = "Faction", text = G.FACTION},
	{value = "SpellsSchool", text = G.SPELL_SCHOOL},
}
local barColorByValue = {}
for _, option in ipairs(barColor) do
	barColorByValue[option.value] = option.text
end
local borderColor = {
	{value = "Default", text = G.DEFAULT},
	{value = "Class", text = G.CLASS},
	{value = "Faction", text = G.FACTION},
}
local borderColorByValue = {}
for _, option in ipairs(borderColor) do
	borderColorByValue[option.value] = option.text
end
local barStyle = {
	{value = "Default", text = G.DEFAULT},
	{value = "Jailer", text = "Jailer"},
}
local barStyleByValue = {}
for _, option in ipairs(barStyle) do
	barStyleByValue[option.value] = option.text
end
local borderStyle = {
	{value = "Default", text = G.DEFAULT},
	{value = "Jailer", text = "Jailer"},
}
local borderStyleByValue = {}
for _, option in ipairs(borderStyle) do
	borderStyleByValue[option.value] = option.text
end
local textDecimals = {"0", "1", "2", "3"}
-- Taking care of the option panel --
vcbOptions1:ClearAllPoints()
vcbOptions1:SetPoint("TOPLEFT", vcbOptions0, "TOPLEFT", 0, 0)
-- Background of the option panel --
vcbOptions1.BGtexture:SetAtlas("UI-Journeys-BG", false)
vcbOptions1.BGtexture:SetVertexColor(C.High:GetRGB())
vcbOptions1.BGtexture:SetDesaturation(0.3)
vcbOptions1.Logo:SetVertexColor(C.Main:GetRGB())
vcbOptions1.BorderTopRight:SetVertexColor(C.High:GetRGB())
vcbOptions1.BorderBottomRight:SetVertexColor(C.High:GetRGB())
vcbOptions1.BorderRightMiddle:SetVertexColor(C.High:GetRGB())
vcbOptions1.BorderTopLeft:SetVertexColor(C.High:GetRGB())
vcbOptions1.BorderBottomLeft:SetVertexColor(C.High:GetRGB())
vcbOptions1.BorderLeftMiddle:SetVertexColor(C.High:GetRGB())
vcbOptions1.BorderTopMiddle:SetVertexColor(C.High:GetRGB())
vcbOptions1.BorderBottomMiddle:SetVertexColor(C.High:GetRGB())
-- Title of the option panel --
vcbOptions1.Title:SetTextColor(C.Main:GetRGB())
vcbOptions1.Title:SetText(prefixTip.."|nVersion: "..C.High:WrapTextInColorCode(C_AddOns.GetAddOnMetadata("VCB", "Version")))
-- Top text of the option panel --
vcbOptions1.TopTxt:SetTextColor(C.Main:GetRGB())
vcbOptions1.TopTxt:SetText(string.format(L.OPTIONS_FOR, L.PLAYER_CAST_BAR))
-- Bottom right text of the option panel --
vcbOptions1.BottomRightTxt:SetTextColor(C.Main:GetRGB())
vcbOptions1.BottomRightTxt:SetText("May the Good "..C.High:WrapTextInColorCode("Mojo").." be with you! ")
-- taking care of the boxes --
vcbOptions1Box1.Title:SetText(L.CURRENT_CAST_TIME)
vcbOptions1Box1:SetHeight(120)
vcbOptions1Box2.Title:SetText(L.BOTH_CAST_TIME)
vcbOptions1Box2:SetHeight(120)
vcbOptions1Box2:SetPoint("TOPLEFT", vcbOptions1Box3, "BOTTOMLEFT", 0, 0)
vcbOptions1Box3.Title:SetText(L.TOTAL_CAST_TIME)
vcbOptions1Box3:SetHeight(120)
vcbOptions1Box3:SetPoint("TOPLEFT", vcbOptions1Box1, "BOTTOMLEFT", 0, 0)
vcbOptions1Box4.Title:SetText(L.SPELL_NAME)
vcbOptions1Box4:SetWidth(138)
vcbOptions1Box4:SetPoint("TOPLEFT", vcbOptions1Box1, "TOPRIGHT", 0, 0)
vcbOptions1Box4a.Title:SetText(L.BORDER_TEXT)
vcbOptions1Box4a:SetWidth(138)
vcbOptions1Box4a:SetPoint("TOPLEFT", vcbOptions1Box4, "TOPRIGHT", 0, 0)
vcbOptions1Box5.Title:SetText(L.SPELL_ICON)
vcbOptions1Box5:SetWidth(138)
vcbOptions1Box5:SetPoint("TOPLEFT", vcbOptions1Box4, "BOTTOMLEFT", 0, 0)
vcbOptions1Box5a.Title:SetText(L.SHIELD_ICON)
vcbOptions1Box5a:SetWidth(138)
vcbOptions1Box5a:SetPoint("TOPLEFT", vcbOptions1Box5, "TOPRIGHT", 0, 0)
vcbOptions1Box9.Title:SetText(L.STATUS_BAR)
vcbOptions1Box9:SetPoint("TOPLEFT", vcbOptions1Box5, "BOTTOMLEFT", 0, 0)
vcbOptions1Box10.Title:SetText(L.BAR_BORDER)
vcbOptions1Box10:SetPoint("TOPLEFT", vcbOptions1Box9, "BOTTOMLEFT", 0, 0)
vcbOptions1Box6:SetHeight(112)
vcbOptions1Box6.Title:SetText(L.GLOBAL_COOLDOWN)
vcbOptions1Box6:SetPoint("TOPLEFT", vcbOptions1Box4a, "TOPRIGHT", 0, 0)
vcbOptions1Box6a.Title:SetText(L.GLOBAL_COOLDOWN.." "..G.ICON)
vcbOptions1Box6a:SetPoint("TOPLEFT", vcbOptions1Box6, "BOTTOMLEFT", 0, 0)
vcbOptions1Box6b:SetHeight(168)
vcbOptions1Box6b.Title:SetText(L.GLOBAL_COOLDOWN.." "..G.BAR)
vcbOptions1Box6b:SetPoint("TOPLEFT", vcbOptions1Box6, "BOTTOMLEFT", 0, 0)
vcbOptions1Box6c:SetHeight(248)
vcbOptions1Box6c.Title:SetText("Instant Cast Bar")
vcbOptions1Box6c:SetPoint("TOPLEFT", vcbOptions1Box6, "BOTTOMLEFT", 0, 0)
vcbOptions1Box7.Title:SetText(L.LATENCY_BAR)
vcbOptions1Box7:SetWidth(138)
vcbOptions1Box7:SetPoint("TOPLEFT", vcbOptions1Box12, "BOTTOMLEFT", 0, 0)
vcbOptions1Box8.Title:SetText(L.QUEUE_BAR)
vcbOptions1Box8:SetWidth(138)
vcbOptions1Box8:SetPoint("TOPLEFT", vcbOptions1Box7, "BOTTOMLEFT", 0, 0)
vcbOptions1Box11.Title:SetText(L.SPELL_TICKS)
vcbOptions1Box11:SetWidth(138)
vcbOptions1Box11:SetPoint("TOPLEFT", vcbOptions1Box8, "BOTTOMLEFT", 0, 0)
vcbOptions1Box12.Title:SetText(L.CAST_BAR_SIZE)
vcbOptions1Box12:SetHeight(144)
vcbOptions1Box12:SetWidth(210)
vcbOptions1Box12:SetPoint("TOPLEFT", vcbOptions1Box6, "TOPRIGHT", 0, 0)
-- Coloring the boxes --
for i = 1, 12, 1 do
	local tW = _G["vcbOptions1Box"..i].Title:GetStringWidth()+16
	local W = _G["vcbOptions1Box"..i]:GetWidth()
	if tW >= W then
		_G["vcbOptions1Box"..i]:SetWidth(tW)
	end
	_G["vcbOptions1Box"..i].Title:SetTextColor(C.Main:GetRGB())
	_G["vcbOptions1Box"..i].BorderTop:SetVertexColor(C.High:GetRGB())
	_G["vcbOptions1Box"..i].BorderBottom:SetVertexColor(C.High:GetRGB())
	_G["vcbOptions1Box"..i].BorderLeft:SetVertexColor(C.High:GetRGB())
	_G["vcbOptions1Box"..i].BorderRight:SetVertexColor(C.High:GetRGB())
end
for i = 4, 6, 1 do
	local tW = _G["vcbOptions1Box"..i.."a"].Title:GetStringWidth()+16
	local W = _G["vcbOptions1Box"..i.."a"]:GetWidth()
	if tW >= W then
		_G["vcbOptions1Box"..i.."a"]:SetWidth(tW)
	end
	_G["vcbOptions1Box"..i.."a"].Title:SetTextColor(C.Main:GetRGB())
	_G["vcbOptions1Box"..i.."a"].BorderTop:SetVertexColor(C.High:GetRGB())
	_G["vcbOptions1Box"..i.."a"].BorderBottom:SetVertexColor(C.High:GetRGB())
	_G["vcbOptions1Box"..i.."a"].BorderLeft:SetVertexColor(C.High:GetRGB())
	_G["vcbOptions1Box"..i.."a"].BorderRight:SetVertexColor(C.High:GetRGB())
end
local tW = vcbOptions1Box6b.Title:GetStringWidth()+16
local W = vcbOptions1Box6b:GetWidth()
if tW >= W then
	vcbOptions1Box6b:SetWidth(tW)
end
vcbOptions1Box6b.Title:SetTextColor(C.Main:GetRGB())
vcbOptions1Box6b.BorderTop:SetVertexColor(C.High:GetRGB())
vcbOptions1Box6b.BorderBottom:SetVertexColor(C.High:GetRGB())
vcbOptions1Box6b.BorderLeft:SetVertexColor(C.High:GetRGB())
vcbOptions1Box6b.BorderRight:SetVertexColor(C.High:GetRGB())
local tW = vcbOptions1Box6c.Title:GetStringWidth()+16
local W = vcbOptions1Box6c:GetWidth()
if tW >= W then
	vcbOptions1Box6c:SetWidth(tW)
end
vcbOptions1Box6c.Title:SetTextColor(C.Main:GetRGB())
vcbOptions1Box6c.BorderTop:SetVertexColor(C.High:GetRGB())
vcbOptions1Box6c.BorderBottom:SetVertexColor(C.High:GetRGB())
vcbOptions1Box6c.BorderLeft:SetVertexColor(C.High:GetRGB())
vcbOptions1Box6c.BorderRight:SetVertexColor(C.High:GetRGB())
-- Coloring the pop out buttons --
local function ColoringPopOutButtons(k, var1)
	_G["vcbOptions1Box"..k.."PopOut"..var1].Text:SetTextColor(C.Main:GetRGB())
	_G["vcbOptions1Box"..k.."PopOut"..var1].Title:SetTextColor(C.High:GetRGB())
	_G["vcbOptions1Box"..k.."PopOut"..var1].NormalTexture:SetVertexColor(C.High:GetRGB())
	_G["vcbOptions1Box"..k.."PopOut"..var1].HighlightTexture:SetVertexColor(C.Main:GetRGB())
	_G["vcbOptions1Box"..k.."PopOut"..var1].PushedTexture:SetVertexColor(C.High:GetRGB())
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
	_G["vcbOptions1Box"..k.."PopOut1"].Title:SetText(L.POSITION)
	ColoringPopOutButtons(k, 1)
	for i, name in ipairs(textPosition) do
		counter = counter + 1
		local btn = CreateFrame("Button", "vcbOptions1Box"..k.."PopOut1Choice"..i, nil, "vdwPopOutButton")
		_G["vcbOptions1Box"..k.."PopOut1Choice"..i]:ClearAllPoints()
		if i == 1 then
			_G["vcbOptions1Box"..k.."PopOut1Choice"..i]:SetParent(_G["vcbOptions1Box"..k.."PopOut1"])
			_G["vcbOptions1Box"..k.."PopOut1Choice"..i]:SetPoint("TOP", "vcbOptions1Box"..k.."PopOut1", "BOTTOM", 0, 4)
			_G["vcbOptions1Box"..k.."PopOut1Choice"..i]:SetScript("OnShow", function(self)
				self:GetParent():SetNormalAtlas("charactercreate-customize-dropdownbox-hover")
				PlaySound(855, "Master")
			end)
			_G["vcbOptions1Box"..k.."PopOut1Choice"..i]:SetScript("OnHide", function(self)
				self:GetParent():SetNormalAtlas("charactercreate-customize-dropdownbox-open")
				PlaySound(855, "Master")
			end)
		else
			_G["vcbOptions1Box"..k.."PopOut1Choice"..i]:SetParent(_G["vcbOptions1Box"..k.."PopOut1Choice1"])
			_G["vcbOptions1Box"..k.."PopOut1Choice"..i]:SetPoint("TOP", _G["vcbOptions1Box"..k.."PopOut1Choice"..i-1], "BOTTOM", 0, 0)
			_G["vcbOptions1Box"..k.."PopOut1Choice"..i]:Show()
		end
		_G["vcbOptions1Box"..k.."PopOut1Choice"..i].Text:SetText(name.text)
		_G["vcbOptions1Box"..k.."PopOut1Choice"..i]:HookScript("OnClick", function(self, button, down)
			if button == "LeftButton" and down == false then
				if k == 1 then
					VCBsettings.Player.CurrentTimeText.Position = name.value
					if VCBsettings.Player.GlobalCooldown.Instant.Style == "Default" then
						VCBsettings.Player.GlobalCooldown.Instant.RemainingTime.Position = VCBsettings.Player.CurrentTimeText.Position
						VDW.VCB.chkGlobalCooldownPlayer()
					end
					VDW.VCB.chkCurrentTxtPlayer()
					VDW.VCB.chkCurrentUpdPlayer()
				elseif k== 2 then
					VCBsettings.Player.BothTimeText.Position = name.value
					if VCBsettings.Player.GlobalCooldown.Instant.Style == "Default" then
						VCBsettings.Player.GlobalCooldown.Instant.RemainingTime.Position = VCBsettings.Player.BothTimeText.Position
						VDW.VCB.chkGlobalCooldownPlayer()
					end
					VDW.VCB.chkBothTxtPlayer()
					VDW.VCB.chkBothUpdPlayer()
				elseif k == 3 then
					VCBsettings.Player.TotalTimeText.Position = name.value
					VDW.VCB.chkTotalTxtPlayer()
					VDW.VCB.chkTotalUpdPlayer()
				elseif k == 4 then
					VCBsettings.Player.NameText.Position = name.value
					if VCBsettings.Player.GlobalCooldown.Instant.Style == "Default" then
						VCBsettings.Player.GlobalCooldown.Instant.Name.Position = VCBsettings.Player.NameText.Position
						VDW.VCB.chkGlobalCooldownPlayer()
					end
					VDW.VCB.chkNameTxtPlayer()
				end
				_G["vcbOptions1Box"..k.."PopOut1"].Text:SetText(self.Text:GetText())
				_G["vcbOptions1Box"..k.."PopOut1Choice1"]:Hide()
			end
		end)
		local w = _G["vcbOptions1Box"..k.."PopOut1Choice"..i].Text:GetStringWidth()
		if w > maxW then maxW = w end
	end
	finalW = math.ceil(maxW + 24)
	for i = 1, counter, 1 do
		_G["vcbOptions1Box"..k.."PopOut1Choice"..i]:SetWidth(finalW)
	end
	counter = 0
	maxW = 160
	_G["vcbOptions1Box"..k.."PopOut1"]:HookScript("OnEnter", function(self)
		local parent = self:GetParent()
		local word = parent.Title:GetText()
		VDW.Tooltip_Show(self, prefixTip, string.format(L.POSITION_TIP, word), C.Main)
	end)
	_G["vcbOptions1Box"..k.."PopOut1"]:HookScript("OnLeave", function(self) VDW.Tooltip_Hide() end)
	_G["vcbOptions1Box"..k.."PopOut1"]:HookScript("OnClick", function(self, button, down)
		if button == "LeftButton" and down == false then
			if not _G["vcbOptions1Box"..k.."PopOut1Choice1"]:IsShown() then
				_G["vcbOptions1Box"..k.."PopOut1Choice1"]:Show()
			else
				_G["vcbOptions1Box"..k.."PopOut1Choice1"]:Hide()
			end
		end
	end)
end
-- Pop out 2 Buttons decimals and sec  --
for k = 1, 3, 1 do
-- decimals --
	_G["vcbOptions1Box"..k.."PopOut2"].Title:SetText(L.DECIMALS)
	ColoringPopOutButtons(k, 2)
	for i, name in ipairs(textDecimals) do
		counter = counter + 1
		local btn = CreateFrame("Button", "vcbOptions1Box"..k.."PopOut2Choice"..i, nil, "vdwPopOutButton")
		_G["vcbOptions1Box"..k.."PopOut2Choice"..i]:ClearAllPoints()
		if i == 1 then
			_G["vcbOptions1Box"..k.."PopOut2Choice"..i]:SetParent(_G["vcbOptions1Box"..k.."PopOut2"])
			_G["vcbOptions1Box"..k.."PopOut2Choice"..i]:SetPoint("TOP", "vcbOptions1Box"..k.."PopOut2", "BOTTOM", 0, 4)
			_G["vcbOptions1Box"..k.."PopOut2Choice"..i]:SetScript("OnShow", function(self)
				self:GetParent():SetNormalAtlas("charactercreate-customize-dropdownbox-hover")
				PlaySound(855, "Master")
			end)
			_G["vcbOptions1Box"..k.."PopOut2Choice"..i]:SetScript("OnHide", function(self)
				self:GetParent():SetNormalAtlas("charactercreate-customize-dropdownbox-open")
				PlaySound(855, "Master")
			end)
		else
			_G["vcbOptions1Box"..k.."PopOut2Choice"..i]:SetParent(_G["vcbOptions1Box"..k.."PopOut2Choice1"])
			_G["vcbOptions1Box"..k.."PopOut2Choice"..i]:SetPoint("TOP", _G["vcbOptions1Box"..k.."PopOut2Choice"..i-1], "BOTTOM", 0, 0)
			_G["vcbOptions1Box"..k.."PopOut2Choice"..i]:Show()
		end
		_G["vcbOptions1Box"..k.."PopOut2Choice"..i].Text:SetText(name)
		_G["vcbOptions1Box"..k.."PopOut2Choice"..i]:HookScript("OnClick", function(self, button, down)
			if button == "LeftButton" and down == false then
				if k == 1 then
					VCBsettings.Player.CurrentTimeText.Decimals = self.Text:GetText()
					VDW.VCB.chkCurrentUpdPlayer()
				elseif k== 2 then
					VCBsettings.Player.BothTimeText.Decimals = self.Text:GetText()
					VDW.VCB.chkBothUpdPlayer()
				elseif k == 3 then
					VCBsettings.Player.TotalTimeText.Decimals = self.Text:GetText()
					VDW.VCB.chkTotalUpdPlayer()
				end
				_G["vcbOptions1Box"..k.."PopOut2"].Text:SetText(self.Text:GetText())
				_G["vcbOptions1Box"..k.."PopOut2Choice1"]:Hide()
			end
		end)
		local w = _G["vcbOptions1Box"..k.."PopOut2Choice"..i].Text:GetStringWidth()
		if w > maxW then maxW = w end
	end
	finalW = math.ceil(maxW + 24)
	for i = 1, counter, 1 do
		_G["vcbOptions1Box"..k.."PopOut2Choice"..i]:SetWidth(finalW)
	end
	counter = 0
	maxW = 160
	_G["vcbOptions1Box"..k.."PopOut2"]:HookScript("OnEnter", function(self)
		VDW.Tooltip_Show(self, prefixTip, L.DECIMALS_TIP, C.Main)
	end)
	_G["vcbOptions1Box"..k.."PopOut2"]:HookScript("OnLeave", function(self) VDW.Tooltip_Hide() end)
	_G["vcbOptions1Box"..k.."PopOut2"]:HookScript("OnClick", function(self, button, down)
		if button == "LeftButton" and down == false then
			if not _G["vcbOptions1Box"..k.."PopOut2Choice1"]:IsShown() then
				_G["vcbOptions1Box"..k.."PopOut2Choice1"]:Show()
			else
				_G["vcbOptions1Box"..k.."PopOut2Choice1"]:Hide()
			end
		end
	end)
-- sec --
	_G["vcbOptions1Box"..k.."PopOut3"].Title:SetText("'Sec'")
	ColoringPopOutButtons(k, 3)
	for i, name in ipairs(textSec) do
		counter = counter + 1
		local btn = CreateFrame("Button", "vcbOptions1Box"..k.."PopOut3Choice"..i, nil, "vdwPopOutButton")
		_G["vcbOptions1Box"..k.."PopOut3Choice"..i]:ClearAllPoints()
		if i == 1 then
			_G["vcbOptions1Box"..k.."PopOut3Choice"..i]:SetParent(_G["vcbOptions1Box"..k.."PopOut3"])
			_G["vcbOptions1Box"..k.."PopOut3Choice"..i]:SetPoint("TOP", "vcbOptions1Box"..k.."PopOut3", "BOTTOM", 0, 4)
			_G["vcbOptions1Box"..k.."PopOut3Choice"..i]:SetScript("OnShow", function(self)
				self:GetParent():SetNormalAtlas("charactercreate-customize-dropdownbox-hover")
				PlaySound(855, "Master")
			end)
			_G["vcbOptions1Box"..k.."PopOut3Choice"..i]:SetScript("OnHide", function(self)
				self:GetParent():SetNormalAtlas("charactercreate-customize-dropdownbox-open")
				PlaySound(855, "Master")
			end)
		else
			_G["vcbOptions1Box"..k.."PopOut3Choice"..i]:SetParent(_G["vcbOptions1Box"..k.."PopOut3Choice1"])
			_G["vcbOptions1Box"..k.."PopOut3Choice"..i]:SetPoint("TOP", _G["vcbOptions1Box"..k.."PopOut3Choice"..i-1], "BOTTOM", 0, 0)
			_G["vcbOptions1Box"..k.."PopOut3Choice"..i]:Show()
		end
		_G["vcbOptions1Box"..k.."PopOut3Choice"..i].Text:SetText(name.text)
		_G["vcbOptions1Box"..k.."PopOut3Choice"..i]:HookScript("OnClick", function(self, button, down)
			if button == "LeftButton" and down == false then
				if k == 1 then
					VCBsettings.Player.CurrentTimeText.Sec = name.value
					VDW.VCB.chkCurrentUpdPlayer()
				elseif k== 2 then
					VCBsettings.Player.BothTimeText.Sec = name.value
					VDW.VCB.chkBothUpdPlayer()
				elseif k == 3 then
					VCBsettings.Player.TotalTimeText.Sec = name.value
					VDW.VCB.chkTotalUpdPlayer()
				end
				_G["vcbOptions1Box"..k.."PopOut3"].Text:SetText(self.Text:GetText())
				_G["vcbOptions1Box"..k.."PopOut3Choice1"]:Hide()
			end
		end)
		local w = _G["vcbOptions1Box"..k.."PopOut3Choice"..i].Text:GetStringWidth()
		if w > maxW then maxW = w end
	end
	finalW = math.ceil(maxW + 24)
	for i = 1, counter, 1 do
		_G["vcbOptions1Box"..k.."PopOut3Choice"..i]:SetWidth(finalW)
	end
	counter = 0
	maxW = 160
	_G["vcbOptions1Box"..k.."PopOut3"]:HookScript("OnEnter", function(self)
		local word = _G["vcbOptions1Box"..k.."PopOut3"].Title:GetText()
		VDW.Tooltip_Show(self, prefixTip, string.format(L.VISIBILITY_TIP, word), C.Main)
	end)
	_G["vcbOptions1Box"..k.."PopOut3"]:HookScript("OnLeave", function(self) VDW.Tooltip_Hide() end)
	_G["vcbOptions1Box"..k.."PopOut3"]:HookScript("OnClick", function(self, button, down)
		if button == "LeftButton" and down == false then
			if not _G["vcbOptions1Box"..k.."PopOut3Choice1"]:IsShown() then
				_G["vcbOptions1Box"..k.."PopOut3Choice1"]:Show()
			else
				_G["vcbOptions1Box"..k.."PopOut3Choice1"]:Hide()
			end
		end
	end)
end
-- Pop out 4 Buttons Direction  --
for k = 1, 2, 1 do
	_G["vcbOptions1Box"..k.."PopOut4"].Title:SetText(L.DIRECTION)
	ColoringPopOutButtons(k, 4)
	for i, name in ipairs(textDirection) do
		counter = counter + 1
		local btn = CreateFrame("Button", "vcbOptions1Box"..k.."PopOut4Choice"..i, nil, "vdwPopOutButton")
		_G["vcbOptions1Box"..k.."PopOut4Choice"..i]:ClearAllPoints()
		if i == 1 then
			_G["vcbOptions1Box"..k.."PopOut4Choice"..i]:SetParent(_G["vcbOptions1Box"..k.."PopOut4"])
			_G["vcbOptions1Box"..k.."PopOut4Choice"..i]:SetPoint("TOP", "vcbOptions1Box"..k.."PopOut4", "BOTTOM", 0, 4)
			_G["vcbOptions1Box"..k.."PopOut4Choice"..i]:SetScript("OnShow", function(self)
				self:GetParent():SetNormalAtlas("charactercreate-customize-dropdownbox-hover")
				PlaySound(855, "Master")
			end)
			_G["vcbOptions1Box"..k.."PopOut4Choice"..i]:SetScript("OnHide", function(self)
				self:GetParent():SetNormalAtlas("charactercreate-customize-dropdownbox-open")
				PlaySound(855, "Master")
			end)
		else
			_G["vcbOptions1Box"..k.."PopOut4Choice"..i]:SetParent(_G["vcbOptions1Box"..k.."PopOut4Choice1"])
			_G["vcbOptions1Box"..k.."PopOut4Choice"..i]:SetPoint("TOP", _G["vcbOptions1Box"..k.."PopOut4Choice"..i-1], "BOTTOM", 0, 0)
			_G["vcbOptions1Box"..k.."PopOut4Choice"..i]:Show()
		end
		_G["vcbOptions1Box"..k.."PopOut4Choice"..i].Text:SetText(name.text)
		_G["vcbOptions1Box"..k.."PopOut4Choice"..i]:HookScript("OnClick", function(self, button, down)
			if button == "LeftButton" and down == false then
				if k == 1 then
					VCBsettings.Player.CurrentTimeText.Direction = name.value
					VDW.VCB.chkCurrentUpdPlayer()
				elseif k== 2 then
					VCBsettings.Player.BothTimeText.Direction = name.value
					VDW.VCB.chkBothUpdPlayer()
				end
				_G["vcbOptions1Box"..k.."PopOut4"].Text:SetText(self.Text:GetText())
				_G["vcbOptions1Box"..k.."PopOut4Choice1"]:Hide()
			end
		end)
		local w = _G["vcbOptions1Box"..k.."PopOut4Choice"..i].Text:GetStringWidth()
		if w > maxW then maxW = w end
	end
	finalW = math.ceil(maxW + 24)
	for i = 1, counter, 1 do
		_G["vcbOptions1Box"..k.."PopOut4Choice"..i]:SetWidth(finalW)
	end
	counter = 0
	maxW = 160
	_G["vcbOptions1Box"..k.."PopOut4"]:HookScript("OnEnter", function(self)
		VDW.Tooltip_Show(self, prefixTip, L.DIRECTION_TIP, C.Main)
	end)
	_G["vcbOptions1Box"..k.."PopOut4"]:HookScript("OnLeave", function(self) VDW.Tooltip_Hide() end)
	_G["vcbOptions1Box"..k.."PopOut4"]:HookScript("OnClick", function(self, button, down)
		if button == "LeftButton" and down == false then
			if not _G["vcbOptions1Box"..k.."PopOut4Choice1"]:IsShown() then
				_G["vcbOptions1Box"..k.."PopOut4Choice1"]:Show()
			else
				_G["vcbOptions1Box"..k.."PopOut4Choice1"]:Hide()
			end
		end
	end)
end
-- Border text
ColoringPopOutButtons("4a", 1)
vcbOptions1Box4aPopOut1.Title:SetText(L.POSITION)
for i, name in ipairs(textBorder) do
	counter = counter + 1
	local btn = CreateFrame("Button", "vcbOptions1Box4aPopOut1Choice"..i, nil, "vdwPopOutButton")
	_G["vcbOptions1Box4aPopOut1Choice"..i]:ClearAllPoints()
	if i == 1 then
		_G["vcbOptions1Box4aPopOut1Choice"..i]:SetParent(vcbOptions1Box4aPopOut1)
		_G["vcbOptions1Box4aPopOut1Choice"..i]:SetPoint("TOP", vcbOptions1Box4aPopOut1, "BOTTOM", 0, 4)
		_G["vcbOptions1Box4aPopOut1Choice"..i]:SetScript("OnShow", function(self)
			self:GetParent():SetNormalAtlas("charactercreate-customize-dropdownbox-hover")
			PlaySound(855, "Master")
		end)
		_G["vcbOptions1Box4aPopOut1Choice"..i]:SetScript("OnHide", function(self)
			self:GetParent():SetNormalAtlas("charactercreate-customize-dropdownbox-open")
			PlaySound(855, "Master")
		end)
	else
		_G["vcbOptions1Box4aPopOut1Choice"..i]:SetParent(vcbOptions1Box4aPopOut1Choice1)
		_G["vcbOptions1Box4aPopOut1Choice"..i]:SetPoint("TOP", _G["vcbOptions1Box4aPopOut1Choice"..i-1], "BOTTOM", 0, 0)
		_G["vcbOptions1Box4aPopOut1Choice"..i]:Show()
	end
	_G["vcbOptions1Box4aPopOut1Choice"..i].Text:SetText(name.text)
	_G["vcbOptions1Box4aPopOut1Choice"..i]:HookScript("OnClick", function(self, button, down)
		if button == "LeftButton" and down == false then
			VCBsettings.Player.BorderText.Position = name.value
			if VCBsettings.Player.GlobalCooldown.Instant.Style == "Default" then
				VCBsettings.Player.GlobalCooldown.Instant.TextBorder.Position = VCBsettings.Player.BorderText.Position
				VDW.VCB.chkGlobalCooldownPlayer()
			end
			vcbOptions1Box4aPopOut1.Text:SetText(self.Text:GetText())
			VDW.VCB.chkPlayerBorderTextPosition()
			vcbOptions1Box4aPopOut1Choice1:Hide()
		end
	end)
	local w = _G["vcbOptions1Box4aPopOut1Choice"..i].Text:GetStringWidth()
	if w > maxW then maxW = w end
end
finalW = math.ceil(maxW + 24)
for i = 1, counter, 1 do
	_G["vcbOptions1Box4aPopOut1Choice"..i]:SetWidth(finalW)
end
counter = 0
maxW = 160
vcbOptions1Box4aPopOut1:HookScript("OnEnter", function(self)
	local parent = self:GetParent()
	local word = parent.Title:GetText()
	VDW.Tooltip_Show(self, prefixTip, string.format(L.POSITION_TIP, word), C.Main)
end)
vcbOptions1Box4aPopOut1:HookScript("OnLeave", function(self) VDW.Tooltip_Hide() end)
vcbOptions1Box4aPopOut1:HookScript("OnClick", function(self, button, down)
	if button == "LeftButton" and down == false then
		if not vcbOptions1Box4aPopOut1Choice1:IsShown() then
			vcbOptions1Box4aPopOut1Choice1:Show()
		else
			vcbOptions1Box4aPopOut1Choice1:Hide()
		end
	end
end)
-- Icon spell
ColoringPopOutButtons(5, 1)
vcbOptions1Box5PopOut1.Title:SetText(L.POSITION)
for i, name in ipairs(iconPosition) do
	counter = counter + 1
	local btn = CreateFrame("Button", "vcbOptions1Box5PopOut1Choice"..i, nil, "vdwPopOutButton")
	_G["vcbOptions1Box5PopOut1Choice"..i]:ClearAllPoints()
	if i == 1 then
		_G["vcbOptions1Box5PopOut1Choice"..i]:SetParent(vcbOptions1Box5PopOut1)
		_G["vcbOptions1Box5PopOut1Choice"..i]:SetPoint("TOP", vcbOptions1Box5PopOut1, "BOTTOM", 0, 4)
		_G["vcbOptions1Box5PopOut1Choice"..i]:SetScript("OnShow", function(self)
			self:GetParent():SetNormalAtlas("charactercreate-customize-dropdownbox-hover")
			PlaySound(855, "Master")
		end)
		_G["vcbOptions1Box5PopOut1Choice"..i]:SetScript("OnHide", function(self)
			self:GetParent():SetNormalAtlas("charactercreate-customize-dropdownbox-open")
			PlaySound(855, "Master")
		end)
	else
		_G["vcbOptions1Box5PopOut1Choice"..i]:SetParent(vcbOptions1Box5PopOut1Choice1)
		_G["vcbOptions1Box5PopOut1Choice"..i]:SetPoint("TOP", _G["vcbOptions1Box5PopOut1Choice"..i-1], "BOTTOM", 0, 0)
		_G["vcbOptions1Box5PopOut1Choice"..i]:Show()
	end
	_G["vcbOptions1Box5PopOut1Choice"..i].Text:SetText(name.text)
	_G["vcbOptions1Box5PopOut1Choice"..i]:HookScript("OnClick", function(self, button, down)
		if button == "LeftButton" and down == false then
			VCBsettings.Player.Icon.Position = name.value
			if VCBsettings.Player.GlobalCooldown.Instant.Style == "Default" then
				VCBsettings.Player.GlobalCooldown.Instant.Icon.Position = VCBsettings.Player.Icon.Position
				VDW.VCB.chkGlobalCooldownPlayer()
			end
			vcbOptions1Box5PopOut1.Text:SetText(self.Text:GetText())
			VDW.VCB.chkPlayerIconPosition()
			vcbOptions1Box5PopOut1Choice1:Hide()
		end
	end)
	local w = _G["vcbOptions1Box5PopOut1Choice"..i].Text:GetStringWidth()
	if w > maxW then maxW = w end
end
finalW = math.ceil(maxW + 24)
for i = 1, counter, 1 do
	_G["vcbOptions1Box5PopOut1Choice"..i]:SetWidth(finalW)
end
counter = 0
maxW = 160
vcbOptions1Box5PopOut1:HookScript("OnEnter", function(self)
	local parent = self:GetParent()
	local word = parent.Title:GetText()
	VDW.Tooltip_Show(self, prefixTip, string.format(L.POSITION_TIP, word), C.Main)
end)
vcbOptions1Box5PopOut1:HookScript("OnLeave", function(self) VDW.Tooltip_Hide() end)
vcbOptions1Box5PopOut1:HookScript("OnClick", function(self, button, down)
	if button == "LeftButton" and down == false then
		if not vcbOptions1Box5PopOut1Choice1:IsShown() then
			vcbOptions1Box5PopOut1Choice1:Show()
		else
			vcbOptions1Box5PopOut1Choice1:Hide()
		end
	end
end)
-- Icon shield
ColoringPopOutButtons("5a", 1)
vcbOptions1Box5aPopOut1.Title:SetText(L.POSITION)
for i, name in ipairs(iconPosition) do
	counter = counter + 1
	local btn = CreateFrame("Button", "vcbOptions1Box5aPopOut1Choice"..i, nil, "vdwPopOutButton")
	_G["vcbOptions1Box5aPopOut1Choice"..i]:ClearAllPoints()
	if i == 1 then
		_G["vcbOptions1Box5aPopOut1Choice"..i]:SetParent(vcbOptions1Box5aPopOut1)
		_G["vcbOptions1Box5aPopOut1Choice"..i]:SetPoint("TOP", vcbOptions1Box5aPopOut1, "BOTTOM", 0, 4)
		_G["vcbOptions1Box5aPopOut1Choice"..i]:SetScript("OnShow", function(self)
			self:GetParent():SetNormalAtlas("charactercreate-customize-dropdownbox-hover")
			PlaySound(855, "Master")
		end)
		_G["vcbOptions1Box5aPopOut1Choice"..i]:SetScript("OnHide", function(self)
			self:GetParent():SetNormalAtlas("charactercreate-customize-dropdownbox-open")
			PlaySound(855, "Master")
		end)
	else
		_G["vcbOptions1Box5aPopOut1Choice"..i]:SetParent(vcbOptions1Box5aPopOut1Choice1)
		_G["vcbOptions1Box5aPopOut1Choice"..i]:SetPoint("TOP", _G["vcbOptions1Box5aPopOut1Choice"..i-1], "BOTTOM", 0, 0)
		_G["vcbOptions1Box5aPopOut1Choice"..i]:Show()
	end
	_G["vcbOptions1Box5aPopOut1Choice"..i].Text:SetText(name.text)
	_G["vcbOptions1Box5aPopOut1Choice"..i]:HookScript("OnClick", function(self, button, down)
		if button == "LeftButton" and down == false then
			VCBsettings.Player.Shield.Position = name.value
			vcbOptions1Box5aPopOut1.Text:SetText(self.Text:GetText())
			VDW.VCB.chkPlayerShieldPosition()
			vcbOptions1Box5aPopOut1Choice1:Hide()
		end
	end)
	local w = _G["vcbOptions1Box5aPopOut1Choice"..i].Text:GetStringWidth()
	if w > maxW then maxW = w end
end
finalW = math.ceil(maxW + 24)
for i = 1, counter, 1 do
	_G["vcbOptions1Box5aPopOut1Choice"..i]:SetWidth(finalW)
end
counter = 0
maxW = 160
vcbOptions1Box5aPopOut1:HookScript("OnEnter", function(self)
	local parent = self:GetParent()
	local word = parent.Title:GetText()
	VDW.Tooltip_Show(self, prefixTip, string.format(L.POSITION_TIP, word), C.Main)
end)
vcbOptions1Box5aPopOut1:HookScript("OnLeave", function(self) VDW.Tooltip_Hide() end)
vcbOptions1Box5aPopOut1:HookScript("OnClick", function(self, button, down)
	if button == "LeftButton" and down == false then
		if not vcbOptions1Box5aPopOut1Choice1:IsShown() then
			vcbOptions1Box5aPopOut1Choice1:Show()
		else
			vcbOptions1Box5aPopOut1Choice1:Hide()
		end
	end
end)
-- Global Cooldown --
-- GCD hide / show
vcbOptions1Box6CheckButton1.Text:SetText(L.ENABLE_GLOBAL_COOLDOWN)
vcbOptions1Box6CheckButton1.Text:SetWidth(vcbOptions1Box6:GetWidth()*0.8)
vcbOptions1Box6CheckButton1:SetScript("OnEnter", function(self)
	local word = self.Text:GetText()
	VDW.Tooltip_Show(self, prefixTip, string.format(L.CHECK_IF_YOU_WANT_TO_TIP, word), C.Main)
end)
vcbOptions1Box6CheckButton1:HookScript("OnLeave", function(self) VDW.Tooltip_Hide() end)
vcbOptions1Box6CheckButton1:HookScript("OnClick", function (self, button)
	if button == "LeftButton" then
		if self:GetChecked() == true then
			VCBsettings.Player.GlobalCooldown.Enable = true
			popEnable(vcbOptions1Box6PopOut2)
			popEnable(vcbOptions1Box6aPopOut1)
			popEnable(vcbOptions1Box6bPopOut1)
			popEnable(vcbOptions1Box6bPopOut2)
			popEnable(vcbOptions1Box6bPopOut3)
			popEnable(vcbOptions1Box6bPopOut4)
			popEnable(vcbOptions1Box6bPopOut5)
			popEnable(vcbOptions1Box6cPopOut1)
			self.Text:SetTextColor(C.Main:GetRGB())
		elseif self:GetChecked() == false then
			VCBsettings.Player.GlobalCooldown.Enable = false
			popDisable(vcbOptions1Box6PopOut2)
			popDisable(vcbOptions1Box6aPopOut1)
			popDisable(vcbOptions1Box6bPopOut1)
			popDisable(vcbOptions1Box6bPopOut2)
			popDisable(vcbOptions1Box6bPopOut3)
			popDisable(vcbOptions1Box6bPopOut4)
			popDisable(vcbOptions1Box6bPopOut5)
			popDisable(vcbOptions1Box6cPopOut1)
			self.Text:SetTextColor(0.35, 0.35, 0.35, 0.8)
		end
		PlaySound(858, "Master")
	end
end)
-- GCD position
ColoringPopOutButtons(6, 1)
vcbOptions1Box6PopOut1.Title:SetText(L.POSITION)
for i, name in ipairs(gcdPosition) do
	counter = counter + 1
	local btn = CreateFrame("Button", "vcbOptions1Box6PopOut1Choice"..i, nil, "vdwPopOutButton")
	_G["vcbOptions1Box6PopOut1Choice"..i]:ClearAllPoints()
	if i == 1 then
		_G["vcbOptions1Box6PopOut1Choice"..i]:SetParent(vcbOptions1Box6PopOut1)
		_G["vcbOptions1Box6PopOut1Choice"..i]:SetPoint("TOP", vcbOptions1Box6PopOut1, "BOTTOM", 0, 4)
		_G["vcbOptions1Box6PopOut1Choice"..i]:SetScript("OnShow", function(self)
			self:GetParent():SetNormalAtlas("charactercreate-customize-dropdownbox-hover")
			PlaySound(855, "Master")
		end)
		_G["vcbOptions1Box6PopOut1Choice"..i]:SetScript("OnHide", function(self)
			self:GetParent():SetNormalAtlas("charactercreate-customize-dropdownbox-open")
			PlaySound(855, "Master")
		end)
	else
		_G["vcbOptions1Box6PopOut1Choice"..i]:SetParent(vcbOptions1Box6PopOut1Choice1)
		_G["vcbOptions1Box6PopOut1Choice"..i]:SetPoint("TOP", _G["vcbOptions1Box6PopOut1Choice"..i-1], "BOTTOM", 0, 0)
		_G["vcbOptions1Box6PopOut1Choice"..i]:Show()
	end
	_G["vcbOptions1Box6PopOut1Choice"..i].Text:SetText(name.text)
	_G["vcbOptions1Box6PopOut1Choice"..i]:HookScript("OnClick", function(self, button, down)
		if button == "LeftButton" and down == false then
			VCBsettings.Player.GlobalCooldown.Position = name.value
			vcbOptions1Box6PopOut1.Text:SetText(self.Text:GetText())
			VDW.VCB.chkGlobalCooldownPlayer()
			vcbOptions1Box6PopOut1Choice1:Hide()
		end
	end)
	local w = _G["vcbOptions1Box6PopOut1Choice"..i].Text:GetStringWidth()
	if w > maxW then maxW = w end
end
finalW = math.ceil(maxW + 24)
for i = 1, counter, 1 do
	_G["vcbOptions1Box6PopOut1Choice"..i]:SetWidth(finalW)
end
counter = 0
maxW = 160
vcbOptions1Box6PopOut1:HookScript("OnEnter", function(self)
	local parent = self:GetParent()
	local word = parent.Title:GetText()
	VDW.Tooltip_Show(self, prefixTip, string.format(L.POSITION_TIP, word), C.Main)
end)
vcbOptions1Box6PopOut1:HookScript("OnLeave", function(self) VDW.Tooltip_Hide() end)
vcbOptions1Box6PopOut1:HookScript("OnClick", function(self, button, down)
	if button == "LeftButton" and down == false then
		if not vcbOptions1Box6PopOut1Choice1:IsShown() then
			vcbOptions1Box6PopOut1Choice1:Show()
		else
			vcbOptions1Box6PopOut1Choice1:Hide()
		end
	end
end)
-- GCD style
ColoringPopOutButtons(6, 2)
vcbOptions1Box6PopOut2.Title:SetText(L.STYLE)
for i, name in ipairs(gcdStyle) do
	counter = counter + 1
	local btn = CreateFrame("Button", "vcbOptions1Box6PopOut2Choice"..i, nil, "vdwPopOutButton")
	_G["vcbOptions1Box6PopOut2Choice"..i]:ClearAllPoints()
	if i == 1 then
		_G["vcbOptions1Box6PopOut2Choice"..i]:SetParent(vcbOptions1Box6PopOut2)
		_G["vcbOptions1Box6PopOut2Choice"..i]:SetPoint("TOP", vcbOptions1Box6PopOut2, "BOTTOM", 0, 4)
		_G["vcbOptions1Box6PopOut2Choice"..i]:SetScript("OnShow", function(self)
			self:GetParent():SetNormalAtlas("charactercreate-customize-dropdownbox-hover")
			PlaySound(855, "Master")
		end)
		_G["vcbOptions1Box6PopOut2Choice"..i]:SetScript("OnHide", function(self)
			self:GetParent():SetNormalAtlas("charactercreate-customize-dropdownbox-open")
			PlaySound(855, "Master")
		end)
	else
		_G["vcbOptions1Box6PopOut2Choice"..i]:SetParent(vcbOptions1Box6PopOut2Choice1)
		_G["vcbOptions1Box6PopOut2Choice"..i]:SetPoint("TOP", _G["vcbOptions1Box6PopOut2Choice"..i-1], "BOTTOM", 0, 0)
		_G["vcbOptions1Box6PopOut2Choice"..i]:Show()
	end
	_G["vcbOptions1Box6PopOut2Choice"..i].Text:SetText(name.text)
	_G["vcbOptions1Box6PopOut2Choice"..i]:HookScript("OnClick", function(self, button, down)
		if button == "LeftButton" and down == false then
			VCBsettings.Player.GlobalCooldown.Style = name.value
			vcbOptions1Box6PopOut2.Text:SetText(self.Text:GetText())
			VDW.VCB.chkGlobalCooldownPlayer()
			vcbOptions1Box6PopOut2Choice1:Hide()
			if VCBsettings.Player.GlobalCooldown.Style == "Icon" then
				if not vcbOptions1Box6a:IsShown() then vcbOptions1Box6a:Show() end
				if vcbOptions1Box6b:IsShown() then vcbOptions1Box6b:Hide() end
				if vcbOptions1Box6c:IsShown() then vcbOptions1Box6c:Hide() end
				popEnable(vcbOptions1Box6PopOut1)
			elseif VCBsettings.Player.GlobalCooldown.Style == "Bar" then
				if vcbOptions1Box6a:IsShown() then vcbOptions1Box6a:Hide() end
				if not vcbOptions1Box6b:IsShown() then vcbOptions1Box6b:Show() end
				if vcbOptions1Box6c:IsShown() then vcbOptions1Box6c:Hide() end
				popEnable(vcbOptions1Box6PopOut1)
			elseif VCBsettings.Player.GlobalCooldown.Style == "InstantCastBar" then
				if vcbOptions1Box6a:IsShown() then vcbOptions1Box6a:Hide() end
				if vcbOptions1Box6b:IsShown() then vcbOptions1Box6b:Hide() end
				if not vcbOptions1Box6c:IsShown() then vcbOptions1Box6c:Show() end
				popDisable(vcbOptions1Box6PopOut1)
			end
		end
	end)
	local w = _G["vcbOptions1Box6PopOut2Choice"..i].Text:GetStringWidth()
	if w > maxW then maxW = w end
end
finalW = math.ceil(maxW + 24)
for i = 1, counter, 1 do
	_G["vcbOptions1Box6PopOut2Choice"..i]:SetWidth(finalW)
end
counter = 0
maxW = 160
vcbOptions1Box6PopOut2:HookScript("OnEnter", function(self)
	local parent = self:GetParent()
	local word = parent.Title:GetText()
	VDW.Tooltip_Show(self, prefixTip, string.format(L.STYLE_TIP, word), C.Main)
end)
vcbOptions1Box6PopOut2:HookScript("OnLeave", function(self) VDW.Tooltip_Hide() end)
vcbOptions1Box6PopOut2:HookScript("OnClick", function(self, button, down)
	if button == "LeftButton" and down == false then
		if not vcbOptions1Box6PopOut2Choice1:IsShown() then
			vcbOptions1Box6PopOut2Choice1:Show()
		else
			vcbOptions1Box6PopOut2Choice1:Hide()
		end
	end
end)
-- GCD icon style
ColoringPopOutButtons("6a", 1)
vcbOptions1Box6aPopOut1.Title:SetText(L.STYLE)
for i, name in ipairs(gcdIconStyle) do
	counter = counter + 1
	local btn = CreateFrame("Button", "vcbOptions1Box6aPopOut1Choice"..i, nil, "vdwPopOutButton")
	_G["vcbOptions1Box6aPopOut1Choice"..i]:ClearAllPoints()
	if i == 1 then
		_G["vcbOptions1Box6aPopOut1Choice"..i]:SetParent(vcbOptions1Box6aPopOut1)
		_G["vcbOptions1Box6aPopOut1Choice"..i]:SetPoint("TOP", vcbOptions1Box6aPopOut1, "BOTTOM", 0, 4)
		_G["vcbOptions1Box6aPopOut1Choice"..i]:SetScript("OnShow", function(self)
			self:GetParent():SetNormalAtlas("charactercreate-customize-dropdownbox-hover")
			PlaySound(855, "Master")
		end)
		_G["vcbOptions1Box6aPopOut1Choice"..i]:SetScript("OnHide", function(self)
			self:GetParent():SetNormalAtlas("charactercreate-customize-dropdownbox-open")
			PlaySound(855, "Master")
		end)
	else
		_G["vcbOptions1Box6aPopOut1Choice"..i]:SetParent(vcbOptions1Box6aPopOut1Choice1)
		_G["vcbOptions1Box6aPopOut1Choice"..i]:SetPoint("TOP", _G["vcbOptions1Box6aPopOut1Choice"..i-1], "BOTTOM", 0, 0)
		_G["vcbOptions1Box6aPopOut1Choice"..i]:Show()
	end
	_G["vcbOptions1Box6aPopOut1Choice"..i].Text:SetText(name.text)
	_G["vcbOptions1Box6aPopOut1Choice"..i]:HookScript("OnClick", function(self, button, down)
		if button == "LeftButton" and down == false then
			VCBsettings.Player.GlobalCooldown.Icon.Style = name.value
			vcbOptions1Box6aPopOut1.Text:SetText(self.Text:GetText())
			VDW.VCB.chkGlobalCooldownPlayer()
			vcbOptions1Box6aPopOut1Choice1:Hide()
		end
	end)
	local w = _G["vcbOptions1Box6aPopOut1Choice"..i].Text:GetStringWidth()
	if w > maxW then maxW = w end
end
finalW = math.ceil(maxW + 24)
for i = 1, counter, 1 do
	_G["vcbOptions1Box6aPopOut1Choice"..i]:SetWidth(finalW)
end
counter = 0
maxW = 160
vcbOptions1Box6aPopOut1:HookScript("OnEnter", function(self)
	local parent = self:GetParent()
	local word = parent.Title:GetText()
	VDW.Tooltip_Show(self, prefixTip, string.format(L.STYLE_TIP, word), C.Main)
end)
vcbOptions1Box6aPopOut1:HookScript("OnLeave", function(self) VDW.Tooltip_Hide() end)
vcbOptions1Box6aPopOut1:HookScript("OnClick", function(self, button, down)
	if button == "LeftButton" and down == false then
		if not vcbOptions1Box6aPopOut1Choice1:IsShown() then
			vcbOptions1Box6aPopOut1Choice1:Show()
		else
			vcbOptions1Box6aPopOut1Choice1:Hide()
		end
	end
end)
-- GCD bar style
ColoringPopOutButtons("6b", 1)
vcbOptions1Box6bPopOut1.Title:SetText(G.BAR.." "..L.STYLE)
for i, name in ipairs(barStyle) do
	counter = counter + 1
	local btn = CreateFrame("Button", "vcbOptions1Box6bPopOut1Choice"..i, nil, "vdwPopOutButton")
	_G["vcbOptions1Box6bPopOut1Choice"..i]:ClearAllPoints()
	if i == 1 then
		_G["vcbOptions1Box6bPopOut1Choice"..i]:SetParent(vcbOptions1Box6bPopOut1)
		_G["vcbOptions1Box6bPopOut1Choice"..i]:SetPoint("TOP", vcbOptions1Box6bPopOut1, "BOTTOM", 0, 4)
		_G["vcbOptions1Box6bPopOut1Choice"..i]:SetScript("OnShow", function(self)
			self:GetParent():SetNormalAtlas("charactercreate-customize-dropdownbox-hover")
			PlaySound(855, "Master")
		end)
		_G["vcbOptions1Box6bPopOut1Choice"..i]:SetScript("OnHide", function(self)
			self:GetParent():SetNormalAtlas("charactercreate-customize-dropdownbox-open")
			PlaySound(855, "Master")
		end)
	else
		_G["vcbOptions1Box6bPopOut1Choice"..i]:SetParent(vcbOptions1Box6bPopOut1Choice1)
		_G["vcbOptions1Box6bPopOut1Choice"..i]:SetPoint("TOP", _G["vcbOptions1Box6bPopOut1Choice"..i-1], "BOTTOM", 0, 0)
		_G["vcbOptions1Box6bPopOut1Choice"..i]:Show()
	end
	_G["vcbOptions1Box6bPopOut1Choice"..i].Text:SetText(name.text)
	_G["vcbOptions1Box6bPopOut1Choice"..i]:HookScript("OnClick", function(self, button, down)
		if button == "LeftButton" and down == false then
			VCBsettings.Player.GlobalCooldown.Bar.Style = name.value
			vcbOptions1Box6bPopOut1.Text:SetText(self.Text:GetText())
			VDW.VCB.chkGlobalCooldownPlayer()
			vcbOptions1Box6bPopOut1Choice1:Hide()
		end
	end)
	local w = _G["vcbOptions1Box6bPopOut1Choice"..i].Text:GetStringWidth()
	if w > maxW then maxW = w end
end
finalW = math.ceil(maxW + 24)
for i = 1, counter, 1 do
	_G["vcbOptions1Box6bPopOut1Choice"..i]:SetWidth(finalW)
end
counter = 0
maxW = 160
vcbOptions1Box6bPopOut1:HookScript("OnEnter", function(self)
	local word = self.Title:GetText()
	VDW.Tooltip_Show(self, prefixTip, string.format(L.SELECT_TIP, word), C.Main)
end)
vcbOptions1Box6bPopOut1:HookScript("OnLeave", function(self) VDW.Tooltip_Hide() end)
vcbOptions1Box6bPopOut1:HookScript("OnClick", function(self, button, down)
	if button == "LeftButton" and down == false then
		if not vcbOptions1Box6bPopOut1Choice1:IsShown() then
			vcbOptions1Box6bPopOut1Choice1:Show()
		else
			vcbOptions1Box6bPopOut1Choice1:Hide()
		end
	end
end)
-- GCD bar color
ColoringPopOutButtons("6b", 2)
vcbOptions1Box6bPopOut2.Title:SetText(G.BAR.." "..L.COLOR)
for i, name in ipairs(borderColor) do
	counter = counter + 1
	local btn = CreateFrame("Button", "vcbOptions1Box6bPopOut2Choice"..i, nil, "vdwPopOutButton")
	_G["vcbOptions1Box6bPopOut2Choice"..i]:ClearAllPoints()
	if i == 1 then
		_G["vcbOptions1Box6bPopOut2Choice"..i]:SetParent(vcbOptions1Box6bPopOut2)
		_G["vcbOptions1Box6bPopOut2Choice"..i]:SetPoint("TOP", vcbOptions1Box6bPopOut2, "BOTTOM", 0, 4)
		_G["vcbOptions1Box6bPopOut2Choice"..i]:SetScript("OnShow", function(self)
			self:GetParent():SetNormalAtlas("charactercreate-customize-dropdownbox-hover")
			PlaySound(855, "Master")
		end)
		_G["vcbOptions1Box6bPopOut2Choice"..i]:SetScript("OnHide", function(self)
			self:GetParent():SetNormalAtlas("charactercreate-customize-dropdownbox-open")
			PlaySound(855, "Master")
		end)
	else
		_G["vcbOptions1Box6bPopOut2Choice"..i]:SetParent(vcbOptions1Box6bPopOut2Choice1)
		_G["vcbOptions1Box6bPopOut2Choice"..i]:SetPoint("TOP", _G["vcbOptions1Box6bPopOut2Choice"..i-1], "BOTTOM", 0, 0)
		_G["vcbOptions1Box6bPopOut2Choice"..i]:Show()
	end
	_G["vcbOptions1Box6bPopOut2Choice"..i].Text:SetText(name.text)
	_G["vcbOptions1Box6bPopOut2Choice"..i]:HookScript("OnClick", function(self, button, down)
		if button == "LeftButton" and down == false then
			VCBsettings.Player.GlobalCooldown.Bar.Color = name.value
			vcbOptions1Box6bPopOut2.Text:SetText(self.Text:GetText())
			VDW.VCB.chkGlobalCooldownPlayer()
			vcbOptions1Box6bPopOut2Choice1:Hide()
		end
	end)
	local w = _G["vcbOptions1Box6bPopOut2Choice"..i].Text:GetStringWidth()
	if w > maxW then maxW = w end
end
finalW = math.ceil(maxW + 24)
for i = 1, counter, 1 do
	_G["vcbOptions1Box6bPopOut2Choice"..i]:SetWidth(finalW)
end
counter = 0
maxW = 160
vcbOptions1Box6bPopOut2:HookScript("OnEnter", function(self)
	local word = self.Title:GetText()
	VDW.Tooltip_Show(self, prefixTip, string.format(L.SELECT_TIP, word), C.Main)
end)
vcbOptions1Box6bPopOut2:HookScript("OnLeave", function(self) VDW.Tooltip_Hide() end)
vcbOptions1Box6bPopOut2:HookScript("OnClick", function(self, button, down)
	if button == "LeftButton" and down == false then
		if not vcbOptions1Box6bPopOut2Choice1:IsShown() then
			vcbOptions1Box6bPopOut2Choice1:Show()
		else
			vcbOptions1Box6bPopOut2Choice1:Hide()
		end
	end
end)
-- GCD bar border style
ColoringPopOutButtons("6b", 3)
vcbOptions1Box6bPopOut3.Title:SetText(G.BORDER.." "..L.STYLE)
for i, name in ipairs(borderStyle) do
	counter = counter + 1
	local btn = CreateFrame("Button", "vcbOptions1Box6bPopOut3Choice"..i, nil, "vdwPopOutButton")
	_G["vcbOptions1Box6bPopOut3Choice"..i]:ClearAllPoints()
	if i == 1 then
		_G["vcbOptions1Box6bPopOut3Choice"..i]:SetParent(vcbOptions1Box6bPopOut3)
		_G["vcbOptions1Box6bPopOut3Choice"..i]:SetPoint("TOP", vcbOptions1Box6bPopOut3, "BOTTOM", 0, 4)
		_G["vcbOptions1Box6bPopOut3Choice"..i]:SetScript("OnShow", function(self)
			self:GetParent():SetNormalAtlas("charactercreate-customize-dropdownbox-hover")
			PlaySound(855, "Master")
		end)
		_G["vcbOptions1Box6bPopOut3Choice"..i]:SetScript("OnHide", function(self)
			self:GetParent():SetNormalAtlas("charactercreate-customize-dropdownbox-open")
			PlaySound(855, "Master")
		end)
	else
		_G["vcbOptions1Box6bPopOut3Choice"..i]:SetParent(vcbOptions1Box6bPopOut3Choice1)
		_G["vcbOptions1Box6bPopOut3Choice"..i]:SetPoint("TOP", _G["vcbOptions1Box6bPopOut3Choice"..i-1], "BOTTOM", 0, 0)
		_G["vcbOptions1Box6bPopOut3Choice"..i]:Show()
	end
	_G["vcbOptions1Box6bPopOut3Choice"..i].Text:SetText(name.text)
	_G["vcbOptions1Box6bPopOut3Choice"..i]:HookScript("OnClick", function(self, button, down)
		if button == "LeftButton" and down == false then
			VCBsettings.Player.GlobalCooldown.Bar.BorderStyle = name.value
			vcbOptions1Box6bPopOut3.Text:SetText(self.Text:GetText())
			VDW.VCB.chkGlobalCooldownPlayer()
			vcbOptions1Box6bPopOut3Choice1:Hide()
		end
	end)
	local w = _G["vcbOptions1Box6bPopOut3Choice"..i].Text:GetStringWidth()
	if w > maxW then maxW = w end
end
finalW = math.ceil(maxW + 24)
for i = 1, counter, 1 do
	_G["vcbOptions1Box6bPopOut3Choice"..i]:SetWidth(finalW)
end
counter = 0
maxW = 160
vcbOptions1Box6bPopOut3:HookScript("OnEnter", function(self)
	local word = self.Title:GetText()
	VDW.Tooltip_Show(self, prefixTip, string.format(L.SELECT_TIP, word), C.Main)
end)
vcbOptions1Box6bPopOut3:HookScript("OnLeave", function(self) VDW.Tooltip_Hide() end)
vcbOptions1Box6bPopOut3:HookScript("OnClick", function(self, button, down)
	if button == "LeftButton" and down == false then
		if not vcbOptions1Box6bPopOut3Choice1:IsShown() then
			vcbOptions1Box6bPopOut3Choice1:Show()
		else
			vcbOptions1Box6bPopOut3Choice1:Hide()
		end
	end
end)
-- GCD bar border color
ColoringPopOutButtons("6b", 4)
vcbOptions1Box6bPopOut4.Title:SetText(G.BORDER.." "..L.COLOR)
for i, name in ipairs(borderColor) do
	counter = counter + 1
	local btn = CreateFrame("Button", "vcbOptions1Box6bPopOut4Choice"..i, nil, "vdwPopOutButton")
	_G["vcbOptions1Box6bPopOut4Choice"..i]:ClearAllPoints()
	if i == 1 then
		_G["vcbOptions1Box6bPopOut4Choice"..i]:SetParent(vcbOptions1Box6bPopOut4)
		_G["vcbOptions1Box6bPopOut4Choice"..i]:SetPoint("TOP", vcbOptions1Box6bPopOut4, "BOTTOM", 0, 4)
		_G["vcbOptions1Box6bPopOut4Choice"..i]:SetScript("OnShow", function(self)
			self:GetParent():SetNormalAtlas("charactercreate-customize-dropdownbox-hover")
			PlaySound(855, "Master")
		end)
		_G["vcbOptions1Box6bPopOut4Choice"..i]:SetScript("OnHide", function(self)
			self:GetParent():SetNormalAtlas("charactercreate-customize-dropdownbox-open")
			PlaySound(855, "Master")
		end)
	else
		_G["vcbOptions1Box6bPopOut4Choice"..i]:SetParent(vcbOptions1Box6bPopOut4Choice1)
		_G["vcbOptions1Box6bPopOut4Choice"..i]:SetPoint("TOP", _G["vcbOptions1Box6bPopOut4Choice"..i-1], "BOTTOM", 0, 0)
		_G["vcbOptions1Box6bPopOut4Choice"..i]:Show()
	end
	_G["vcbOptions1Box6bPopOut4Choice"..i].Text:SetText(name.text)
	_G["vcbOptions1Box6bPopOut4Choice"..i]:HookScript("OnClick", function(self, button, down)
		if button == "LeftButton" and down == false then
			VCBsettings.Player.GlobalCooldown.Bar.BorderColor = name.value
			vcbOptions1Box6bPopOut4.Text:SetText(self.Text:GetText())
			VDW.VCB.chkGlobalCooldownPlayer()
			vcbOptions1Box6bPopOut4Choice1:Hide()
		end
	end)
	local w = _G["vcbOptions1Box6bPopOut4Choice"..i].Text:GetStringWidth()
	if w > maxW then maxW = w end
end
finalW = math.ceil(maxW + 24)
for i = 1, counter, 1 do
	_G["vcbOptions1Box6bPopOut4Choice"..i]:SetWidth(finalW)
end
counter = 0
maxW = 160
vcbOptions1Box6bPopOut4:HookScript("OnEnter", function(self)
	local word = self.Title:GetText()
	VDW.Tooltip_Show(self, prefixTip, string.format(L.SELECT_TIP, word), C.Main)
end)
vcbOptions1Box6bPopOut4:HookScript("OnLeave", function(self) VDW.Tooltip_Hide() end)
vcbOptions1Box6bPopOut4:HookScript("OnClick", function(self, button, down)
	if button == "LeftButton" and down == false then
		if not vcbOptions1Box6bPopOut4Choice1:IsShown() then
			vcbOptions1Box6bPopOut4Choice1:Show()
		else
			vcbOptions1Box6bPopOut4Choice1:Hide()
		end
	end
end)
-- GCD bar fill
ColoringPopOutButtons("6b", 5)
vcbOptions1Box6bPopOut5.Title:SetText(L.BAR_FILL)
for i, name in ipairs(gcdBarFill) do
	counter = counter + 1
	local btn = CreateFrame("Button", "vcbOptions1Box6bPopOut5Choice"..i, nil, "vdwPopOutButton")
	_G["vcbOptions1Box6bPopOut5Choice"..i]:ClearAllPoints()
	if i == 1 then
		_G["vcbOptions1Box6bPopOut5Choice"..i]:SetParent(vcbOptions1Box6bPopOut5)
		_G["vcbOptions1Box6bPopOut5Choice"..i]:SetPoint("TOP", vcbOptions1Box6bPopOut5, "BOTTOM", 0, 4)
		_G["vcbOptions1Box6bPopOut5Choice"..i]:SetScript("OnShow", function(self)
			self:GetParent():SetNormalAtlas("charactercreate-customize-dropdownbox-hover")
			PlaySound(855, "Master")
		end)
		_G["vcbOptions1Box6bPopOut5Choice"..i]:SetScript("OnHide", function(self)
			self:GetParent():SetNormalAtlas("charactercreate-customize-dropdownbox-open")
			PlaySound(855, "Master")
		end)
	else
		_G["vcbOptions1Box6bPopOut5Choice"..i]:SetParent(vcbOptions1Box6bPopOut5Choice1)
		_G["vcbOptions1Box6bPopOut5Choice"..i]:SetPoint("TOP", _G["vcbOptions1Box6bPopOut5Choice"..i-1], "BOTTOM", 0, 0)
		_G["vcbOptions1Box6bPopOut5Choice"..i]:Show()
	end
	_G["vcbOptions1Box6bPopOut5Choice"..i].Text:SetText(name.text)
	_G["vcbOptions1Box6bPopOut5Choice"..i]:HookScript("OnClick", function(self, button, down)
		if button == "LeftButton" and down == false then
			VCBsettings.Player.GlobalCooldown.Bar.Fill = name.value
			vcbOptions1Box6bPopOut5.Text:SetText(self.Text:GetText())
			VDW.VCB.chkGlobalCooldownPlayer()
			vcbOptions1Box6bPopOut5Choice1:Hide()
		end
	end)
	local w = _G["vcbOptions1Box6bPopOut5Choice"..i].Text:GetStringWidth()
	if w > maxW then maxW = w end
end
finalW = math.ceil(maxW + 24)
for i = 1, counter, 1 do
	_G["vcbOptions1Box6bPopOut5Choice"..i]:SetWidth(finalW)
end
counter = 0
maxW = 160
vcbOptions1Box6bPopOut5:HookScript("OnEnter", function(self)
	local word = self.Title:GetText()
	VDW.Tooltip_Show(self, prefixTip, string.format(L.TIP_BAR_FILL, word), C.Main)
end)
vcbOptions1Box6bPopOut5:HookScript("OnLeave", function(self) VDW.Tooltip_Hide() end)
vcbOptions1Box6bPopOut5:HookScript("OnClick", function(self, button, down)
	if button == "LeftButton" and down == false then
		if not vcbOptions1Box6bPopOut5Choice1:IsShown() then
			vcbOptions1Box6bPopOut5Choice1:Show()
		else
			vcbOptions1Box6bPopOut5Choice1:Hide()
		end
	end
end)
-- instant cast bar default / custom
ColoringPopOutButtons("6c", 1)
vcbOptions1Box6cPopOut1.Title:SetText("Layout")
for i, name in ipairs(instantStyle) do
	counter = counter + 1
	local btn = CreateFrame("Button", "vcbOptions1Box6cPopOut1Choice"..i, nil, "vdwPopOutButton")
	_G["vcbOptions1Box6cPopOut1Choice"..i]:ClearAllPoints()
	if i == 1 then
		_G["vcbOptions1Box6cPopOut1Choice"..i]:SetParent(vcbOptions1Box6cPopOut1)
		_G["vcbOptions1Box6cPopOut1Choice"..i]:SetPoint("TOP", vcbOptions1Box6cPopOut1, "BOTTOM", 0, 4)
		_G["vcbOptions1Box6cPopOut1Choice"..i]:SetScript("OnShow", function(self)
			self:GetParent():SetNormalAtlas("charactercreate-customize-dropdownbox-hover")
			PlaySound(855, "Master")
		end)
		_G["vcbOptions1Box6cPopOut1Choice"..i]:SetScript("OnHide", function(self)
			self:GetParent():SetNormalAtlas("charactercreate-customize-dropdownbox-open")
			PlaySound(855, "Master")
		end)
	else
		_G["vcbOptions1Box6cPopOut1Choice"..i]:SetParent(vcbOptions1Box6cPopOut1Choice1)
		_G["vcbOptions1Box6cPopOut1Choice"..i]:SetPoint("TOP", _G["vcbOptions1Box6cPopOut1Choice"..i-1], "BOTTOM", 0, 0)
		_G["vcbOptions1Box6cPopOut1Choice"..i]:Show()
	end
	_G["vcbOptions1Box6cPopOut1Choice"..i].Text:SetText(name.text)
	_G["vcbOptions1Box6cPopOut1Choice"..i]:HookScript("OnClick", function(self, button, down)
		if button == "LeftButton" and down == false then
			VCBsettings.Player.GlobalCooldown.Instant.Style = name.value
			vcbOptions1Box6cPopOut1.Text:SetText(self.Text:GetText())
			VDW.VCB.chkGlobalCooldownPlayer()
			vcbOptions1Box6cPopOut1Choice1:Hide()
			if VCBsettings.Player.GlobalCooldown.Instant.Style == "Custom" then
				popEnable(vcbOptions1Box6cPopOut2)
				popEnable(vcbOptions1Box6cPopOut3)
				popEnable(vcbOptions1Box6cPopOut4)
				popEnable(vcbOptions1Box6cPopOut5)
				popEnable(vcbOptions1Box6cPopOut6)
				popEnable(vcbOptions1Box6cPopOut7)
				popEnable(vcbOptions1Box6cPopOut8)
				popEnable(vcbOptions1Box6cPopOut9)
			elseif VCBsettings.Player.GlobalCooldown.Instant.Style == "Default" then
				VCBsettings.Player.GlobalCooldown.Instant.StastusStyle = VCBsettings.Player.StatusBar.Style
				VCBsettings.Player.GlobalCooldown.Instant.StatusColor = VCBsettings.Player.StatusBar.Color
				VCBsettings.Player.GlobalCooldown.Instant.BorderStyle = VCBsettings.Player.Border.Style
				VCBsettings.Player.GlobalCooldown.Instant.BorderColor = VCBsettings.Player.Border.Color
				VCBsettings.Player.GlobalCooldown.Instant.TextBorder.Position = VCBsettings.Player.BorderText.Position
				VCBsettings.Player.GlobalCooldown.Instant.Icon.Position = VCBsettings.Player.Icon.Position
				VCBsettings.Player.GlobalCooldown.Instant.Name.Position = VCBsettings.Player.NameText.Position
				if VCBsettings.Player.CurrentTimeText.Position ~= "Hide" then
					VCBsettings.Player.GlobalCooldown.Instant.RemainingTime.Position = VCBsettings.Player.CurrentTimeText.Position
				else
					VCBsettings.Player.GlobalCooldown.Instant.RemainingTime.Position = "Hide"
				end
				if VCBsettings.Player.BothTimeText.Position ~= "Hide" then
					VCBsettings.Player.GlobalCooldown.Instant.RemainingTime.Position = VCBsettings.Player.BothTimeText.Position
				else
					VCBsettings.Player.GlobalCooldown.Instant.RemainingTime.Position = "Hide"
				end
				popDisable(vcbOptions1Box6cPopOut2)
				popDisable(vcbOptions1Box6cPopOut3)
				popDisable(vcbOptions1Box6cPopOut4)
				popDisable(vcbOptions1Box6cPopOut5)
				popDisable(vcbOptions1Box6cPopOut6)
				popDisable(vcbOptions1Box6cPopOut7)
				popDisable(vcbOptions1Box6cPopOut8)
				popDisable(vcbOptions1Box6cPopOut9)
			end
			VDW.VCB.chkGlobalCooldownPlayer()
		end
	end)
	local w = _G["vcbOptions1Box6cPopOut1Choice"..i].Text:GetStringWidth()
	if w > maxW then maxW = w end
end
finalW = math.ceil(maxW + 24)
for i = 1, counter, 1 do
	_G["vcbOptions1Box6cPopOut1Choice"..i]:SetWidth(finalW)
end
counter = 0
maxW = 160
vcbOptions1Box6cPopOut1:HookScript("OnEnter", function(self)
	local parent = self:GetParent()
	local word = parent.Title:GetText()
	VDW.Tooltip_Show(self, prefixTip, string.format(L.TIP_INSTANT_LAYOUT, word), C.Main)
end)
vcbOptions1Box6cPopOut1:HookScript("OnLeave", function(self) VDW.Tooltip_Hide() end)
vcbOptions1Box6cPopOut1:HookScript("OnClick", function(self, button, down)
	if button == "LeftButton" and down == false then
		if not vcbOptions1Box6cPopOut1Choice1:IsShown() then
			vcbOptions1Box6cPopOut1Choice1:Show()
		else
			vcbOptions1Box6cPopOut1Choice1:Hide()
		end
	end
end)
-- instant cast bar style
ColoringPopOutButtons("6c", 2)
vcbOptions1Box6cPopOut2.Title:SetText(G.BAR.." "..L.STYLE)
for i, name in ipairs(barStyle) do
	counter = counter + 1
	local btn = CreateFrame("Button", "vcbOptions1Box6cPopOut2Choice"..i, nil, "vdwPopOutButton")
	_G["vcbOptions1Box6cPopOut2Choice"..i]:ClearAllPoints()
	if i == 1 then
		_G["vcbOptions1Box6cPopOut2Choice"..i]:SetParent(vcbOptions1Box6cPopOut2)
		_G["vcbOptions1Box6cPopOut2Choice"..i]:SetPoint("TOP", vcbOptions1Box6cPopOut2, "BOTTOM", 0, 4)
		_G["vcbOptions1Box6cPopOut2Choice"..i]:SetScript("OnShow", function(self)
			self:GetParent():SetNormalAtlas("charactercreate-customize-dropdownbox-hover")
			PlaySound(855, "Master")
		end)
		_G["vcbOptions1Box6cPopOut2Choice"..i]:SetScript("OnHide", function(self)
			self:GetParent():SetNormalAtlas("charactercreate-customize-dropdownbox-open")
			PlaySound(855, "Master")
		end)
	else
		_G["vcbOptions1Box6cPopOut2Choice"..i]:SetParent(vcbOptions1Box6cPopOut2Choice1)
		_G["vcbOptions1Box6cPopOut2Choice"..i]:SetPoint("TOP", _G["vcbOptions1Box6cPopOut2Choice"..i-1], "BOTTOM", 0, 0)
		_G["vcbOptions1Box6cPopOut2Choice"..i]:Show()
	end
	_G["vcbOptions1Box6cPopOut2Choice"..i].Text:SetText(name.text)
	_G["vcbOptions1Box6cPopOut2Choice"..i]:HookScript("OnClick", function(self, button, down)
		if button == "LeftButton" and down == false then
			VCBsettings.Player.GlobalCooldown.Instant.StastusStyle = name.value
			vcbOptions1Box6cPopOut2.Text:SetText(self.Text:GetText())
			VDW.VCB.chkGlobalCooldownPlayer()
			vcbOptions1Box6cPopOut2Choice1:Hide()
		end
	end)
	local w = _G["vcbOptions1Box6cPopOut2Choice"..i].Text:GetStringWidth()
	if w > maxW then maxW = w end
end
finalW = math.ceil(maxW + 24)
for i = 1, counter, 1 do
	_G["vcbOptions1Box6cPopOut2Choice"..i]:SetWidth(finalW)
end
counter = 0
maxW = 160
vcbOptions1Box6cPopOut2:HookScript("OnEnter", function(self)
	local word = self.Title:GetText()
	VDW.Tooltip_Show(self, prefixTip, string.format(L.SELECT_TIP, word), C.Main)
end)
vcbOptions1Box6cPopOut2:HookScript("OnLeave", function(self) VDW.Tooltip_Hide() end)
vcbOptions1Box6cPopOut2:HookScript("OnClick", function(self, button, down)
	if button == "LeftButton" and down == false then
		if not vcbOptions1Box6cPopOut2Choice1:IsShown() then
			vcbOptions1Box6cPopOut2Choice1:Show()
		else
			vcbOptions1Box6cPopOut2Choice1:Hide()
		end
	end
end)
-- instant cast bar color
ColoringPopOutButtons("6c", 3)
vcbOptions1Box6cPopOut3.Title:SetText(G.BAR.." "..L.COLOR)
for i, name in ipairs(barColor) do
	counter = counter + 1
	local btn = CreateFrame("Button", "vcbOptions1Box6cPopOut3Choice"..i, nil, "vdwPopOutButton")
	_G["vcbOptions1Box6cPopOut3Choice"..i]:ClearAllPoints()
	if i == 1 then
		_G["vcbOptions1Box6cPopOut3Choice"..i]:SetParent(vcbOptions1Box6cPopOut3)
		_G["vcbOptions1Box6cPopOut3Choice"..i]:SetPoint("TOP", vcbOptions1Box6cPopOut3, "BOTTOM", 0, 4)
		_G["vcbOptions1Box6cPopOut3Choice"..i]:SetScript("OnShow", function(self)
			self:GetParent():SetNormalAtlas("charactercreate-customize-dropdownbox-hover")
			PlaySound(855, "Master")
		end)
		_G["vcbOptions1Box6cPopOut3Choice"..i]:SetScript("OnHide", function(self)
			self:GetParent():SetNormalAtlas("charactercreate-customize-dropdownbox-open")
			PlaySound(855, "Master")
		end)
	else
		_G["vcbOptions1Box6cPopOut3Choice"..i]:SetParent(vcbOptions1Box6cPopOut3Choice1)
		_G["vcbOptions1Box6cPopOut3Choice"..i]:SetPoint("TOP", _G["vcbOptions1Box6cPopOut3Choice"..i-1], "BOTTOM", 0, 0)
		_G["vcbOptions1Box6cPopOut3Choice"..i]:Show()
	end
	_G["vcbOptions1Box6cPopOut3Choice"..i].Text:SetText(name.text)
	_G["vcbOptions1Box6cPopOut3Choice"..i]:HookScript("OnClick", function(self, button, down)
		if button == "LeftButton" and down == false then
			VCBsettings.Player.GlobalCooldown.Instant.StatusColor = name.value
			vcbOptions1Box6cPopOut3.Text:SetText(self.Text:GetText())
			VDW.VCB.chkGlobalCooldownPlayer()
			vcbOptions1Box6cPopOut3Choice1:Hide()
		end
	end)
	local w = _G["vcbOptions1Box6cPopOut3Choice"..i].Text:GetStringWidth()
	if w > maxW then maxW = w end
end
finalW = math.ceil(maxW + 24)
for i = 1, counter, 1 do
	_G["vcbOptions1Box6cPopOut3Choice"..i]:SetWidth(finalW)
end
counter = 0
maxW = 160
vcbOptions1Box6cPopOut3:HookScript("OnEnter", function(self)
	local word = self.Title:GetText()
	VDW.Tooltip_Show(self, prefixTip, string.format(L.SELECT_TIP, word), C.Main)
end)
vcbOptions1Box6cPopOut3:HookScript("OnLeave", function(self) VDW.Tooltip_Hide() end)
vcbOptions1Box6cPopOut3:HookScript("OnClick", function(self, button, down)
	if button == "LeftButton" and down == false then
		if not vcbOptions1Box6cPopOut3Choice1:IsShown() then
			vcbOptions1Box6cPopOut3Choice1:Show()
		else
			vcbOptions1Box6cPopOut3Choice1:Hide()
		end
	end
end)
-- instant cast bar border style
ColoringPopOutButtons("6c", 4)
vcbOptions1Box6cPopOut4.Title:SetText(G.BORDER.." "..L.STYLE)
for i, name in ipairs(borderStyle) do
	counter = counter + 1
	local btn = CreateFrame("Button", "vcbOptions1Box6cPopOut4Choice"..i, nil, "vdwPopOutButton")
	_G["vcbOptions1Box6cPopOut4Choice"..i]:ClearAllPoints()
	if i == 1 then
		_G["vcbOptions1Box6cPopOut4Choice"..i]:SetParent(vcbOptions1Box6cPopOut4)
		_G["vcbOptions1Box6cPopOut4Choice"..i]:SetPoint("TOP", vcbOptions1Box6cPopOut4, "BOTTOM", 0, 4)
		_G["vcbOptions1Box6cPopOut4Choice"..i]:SetScript("OnShow", function(self)
			self:GetParent():SetNormalAtlas("charactercreate-customize-dropdownbox-hover")
			PlaySound(855, "Master")
		end)
		_G["vcbOptions1Box6cPopOut4Choice"..i]:SetScript("OnHide", function(self)
			self:GetParent():SetNormalAtlas("charactercreate-customize-dropdownbox-open")
			PlaySound(855, "Master")
		end)
	else
		_G["vcbOptions1Box6cPopOut4Choice"..i]:SetParent(vcbOptions1Box6cPopOut4Choice1)
		_G["vcbOptions1Box6cPopOut4Choice"..i]:SetPoint("TOP", _G["vcbOptions1Box6cPopOut4Choice"..i-1], "BOTTOM", 0, 0)
		_G["vcbOptions1Box6cPopOut4Choice"..i]:Show()
	end
	_G["vcbOptions1Box6cPopOut4Choice"..i].Text:SetText(name.text)
	_G["vcbOptions1Box6cPopOut4Choice"..i]:HookScript("OnClick", function(self, button, down)
		if button == "LeftButton" and down == false then
			VCBsettings.Player.GlobalCooldown.Instant.BorderStyle = name.value
			vcbOptions1Box6cPopOut4.Text:SetText(self.Text:GetText())
			VDW.VCB.chkGlobalCooldownPlayer()
			vcbOptions1Box6cPopOut4Choice1:Hide()
		end
	end)
	local w = _G["vcbOptions1Box6cPopOut4Choice"..i].Text:GetStringWidth()
	if w > maxW then maxW = w end
end
finalW = math.ceil(maxW + 24)
for i = 1, counter, 1 do
	_G["vcbOptions1Box6cPopOut4Choice"..i]:SetWidth(finalW)
end
counter = 0
maxW = 160
vcbOptions1Box6cPopOut4:HookScript("OnEnter", function(self)
	local word = self.Title:GetText()
	VDW.Tooltip_Show(self, prefixTip, string.format(L.SELECT_TIP, word), C.Main)
end)
vcbOptions1Box6cPopOut4:HookScript("OnLeave", function(self) VDW.Tooltip_Hide() end)
vcbOptions1Box6cPopOut4:HookScript("OnClick", function(self, button, down)
	if button == "LeftButton" and down == false then
		if not vcbOptions1Box6cPopOut4Choice1:IsShown() then
			vcbOptions1Box6cPopOut4Choice1:Show()
		else
			vcbOptions1Box6cPopOut4Choice1:Hide()
		end
	end
end)
-- instant cast bar border color
ColoringPopOutButtons("6c", 5)
vcbOptions1Box6cPopOut5.Title:SetText(G.BORDER.." "..L.COLOR)
for i, name in ipairs(borderColor) do
	counter = counter + 1
	local btn = CreateFrame("Button", "vcbOptions1Box6cPopOut5Choice"..i, nil, "vdwPopOutButton")
	_G["vcbOptions1Box6cPopOut5Choice"..i]:ClearAllPoints()
	if i == 1 then
		_G["vcbOptions1Box6cPopOut5Choice"..i]:SetParent(vcbOptions1Box6cPopOut5)
		_G["vcbOptions1Box6cPopOut5Choice"..i]:SetPoint("TOP", vcbOptions1Box6cPopOut5, "BOTTOM", 0, 4)
		_G["vcbOptions1Box6cPopOut5Choice"..i]:SetScript("OnShow", function(self)
			self:GetParent():SetNormalAtlas("charactercreate-customize-dropdownbox-hover")
			PlaySound(855, "Master")
		end)
		_G["vcbOptions1Box6cPopOut5Choice"..i]:SetScript("OnHide", function(self)
			self:GetParent():SetNormalAtlas("charactercreate-customize-dropdownbox-open")
			PlaySound(855, "Master")
		end)
	else
		_G["vcbOptions1Box6cPopOut5Choice"..i]:SetParent(vcbOptions1Box6cPopOut5Choice1)
		_G["vcbOptions1Box6cPopOut5Choice"..i]:SetPoint("TOP", _G["vcbOptions1Box6cPopOut5Choice"..i-1], "BOTTOM", 0, 0)
		_G["vcbOptions1Box6cPopOut5Choice"..i]:Show()
	end
	_G["vcbOptions1Box6cPopOut5Choice"..i].Text:SetText(name.text)
	_G["vcbOptions1Box6cPopOut5Choice"..i]:HookScript("OnClick", function(self, button, down)
		if button == "LeftButton" and down == false then
			VCBsettings.Player.GlobalCooldown.Instant.BorderColor = name.value
			vcbOptions1Box6cPopOut5.Text:SetText(self.Text:GetText())
			VDW.VCB.chkGlobalCooldownPlayer()
			vcbOptions1Box6cPopOut5Choice1:Hide()
		end
	end)
	local w = _G["vcbOptions1Box6cPopOut5Choice"..i].Text:GetStringWidth()
	if w > maxW then maxW = w end
end
finalW = math.ceil(maxW + 24)
for i = 1, counter, 1 do
	_G["vcbOptions1Box6cPopOut5Choice"..i]:SetWidth(finalW)
end
counter = 0
maxW = 160
vcbOptions1Box6cPopOut5:HookScript("OnEnter", function(self)
	local word = self.Title:GetText()
	VDW.Tooltip_Show(self, prefixTip, string.format(L.SELECT_TIP, word), C.Main)
end)
vcbOptions1Box6cPopOut5:HookScript("OnLeave", function(self) VDW.Tooltip_Hide() end)
vcbOptions1Box6cPopOut5:HookScript("OnClick", function(self, button, down)
	if button == "LeftButton" and down == false then
		if not vcbOptions1Box6cPopOut5Choice1:IsShown() then
			vcbOptions1Box6cPopOut5Choice1:Show()
		else
			vcbOptions1Box6cPopOut5Choice1:Hide()
		end
	end
end)
-- instant cast bar text border
ColoringPopOutButtons("6c", 6)
vcbOptions1Box6cPopOut6.Title:SetText(L.BORDER_TEXT)
for i, name in ipairs(textBorder) do
	counter = counter + 1
	local btn = CreateFrame("Button", "vcbOptions1Box6cPopOut6Choice"..i, nil, "vdwPopOutButton")
	_G["vcbOptions1Box6cPopOut6Choice"..i]:ClearAllPoints()
	if i == 1 then
		_G["vcbOptions1Box6cPopOut6Choice"..i]:SetParent(vcbOptions1Box6cPopOut6)
		_G["vcbOptions1Box6cPopOut6Choice"..i]:SetPoint("TOP", vcbOptions1Box6cPopOut6, "BOTTOM", 0, 4)
		_G["vcbOptions1Box6cPopOut6Choice"..i]:SetScript("OnShow", function(self)
			self:GetParent():SetNormalAtlas("charactercreate-customize-dropdownbox-hover")
			PlaySound(855, "Master")
		end)
		_G["vcbOptions1Box6cPopOut6Choice"..i]:SetScript("OnHide", function(self)
			self:GetParent():SetNormalAtlas("charactercreate-customize-dropdownbox-open")
			PlaySound(855, "Master")
		end)
	else
		_G["vcbOptions1Box6cPopOut6Choice"..i]:SetParent(vcbOptions1Box6cPopOut6Choice1)
		_G["vcbOptions1Box6cPopOut6Choice"..i]:SetPoint("TOP", _G["vcbOptions1Box6cPopOut6Choice"..i-1], "BOTTOM", 0, 0)
		_G["vcbOptions1Box6cPopOut6Choice"..i]:Show()
	end
	_G["vcbOptions1Box6cPopOut6Choice"..i].Text:SetText(name.text)
	_G["vcbOptions1Box6cPopOut6Choice"..i]:HookScript("OnClick", function(self, button, down)
		if button == "LeftButton" and down == false then
			VCBsettings.Player.GlobalCooldown.Instant.TextBorder.Position = name.value
			vcbOptions1Box6cPopOut6.Text:SetText(self.Text:GetText())
			VDW.VCB.chkGlobalCooldownPlayer()
			vcbOptions1Box6cPopOut6Choice1:Hide()
		end
	end)
	local w = _G["vcbOptions1Box6cPopOut6Choice"..i].Text:GetStringWidth()
	if w > maxW then maxW = w end
end
finalW = math.ceil(maxW + 24)
for i = 1, counter, 1 do
	_G["vcbOptions1Box6cPopOut6Choice"..i]:SetWidth(finalW)
end
counter = 0
maxW = 160
vcbOptions1Box6cPopOut6:HookScript("OnEnter", function(self)
	local word = self.Title:GetText()
	VDW.Tooltip_Show(self, prefixTip, string.format(L.POSITION_TIP, word), C.Main)
end)
vcbOptions1Box6cPopOut6:HookScript("OnLeave", function(self) VDW.Tooltip_Hide() end)
vcbOptions1Box6cPopOut6:HookScript("OnClick", function(self, button, down)
	if button == "LeftButton" and down == false then
		if not vcbOptions1Box6cPopOut6Choice1:IsShown() then
			vcbOptions1Box6cPopOut6Choice1:Show()
		else
			vcbOptions1Box6cPopOut6Choice1:Hide()
		end
	end
end)
-- instant cast bar icon
ColoringPopOutButtons("6c", 7)
vcbOptions1Box6cPopOut7.Title:SetText(L.SPELL_ICON)
for i, name in ipairs(iconPosition) do
	counter = counter + 1
	local btn = CreateFrame("Button", "vcbOptions1Box6cPopOut7Choice"..i, nil, "vdwPopOutButton")
	_G["vcbOptions1Box6cPopOut7Choice"..i]:ClearAllPoints()
	if i == 1 then
		_G["vcbOptions1Box6cPopOut7Choice"..i]:SetParent(vcbOptions1Box6cPopOut7)
		_G["vcbOptions1Box6cPopOut7Choice"..i]:SetPoint("TOP", vcbOptions1Box6cPopOut7, "BOTTOM", 0, 4)
		_G["vcbOptions1Box6cPopOut7Choice"..i]:SetScript("OnShow", function(self)
			self:GetParent():SetNormalAtlas("charactercreate-customize-dropdownbox-hover")
			PlaySound(855, "Master")
		end)
		_G["vcbOptions1Box6cPopOut7Choice"..i]:SetScript("OnHide", function(self)
			self:GetParent():SetNormalAtlas("charactercreate-customize-dropdownbox-open")
			PlaySound(855, "Master")
		end)
	else
		_G["vcbOptions1Box6cPopOut7Choice"..i]:SetParent(vcbOptions1Box6cPopOut7Choice1)
		_G["vcbOptions1Box6cPopOut7Choice"..i]:SetPoint("TOP", _G["vcbOptions1Box6cPopOut7Choice"..i-1], "BOTTOM", 0, 0)
		_G["vcbOptions1Box6cPopOut7Choice"..i]:Show()
	end
	_G["vcbOptions1Box6cPopOut7Choice"..i].Text:SetText(name.text)
	_G["vcbOptions1Box6cPopOut7Choice"..i]:HookScript("OnClick", function(self, button, down)
		if button == "LeftButton" and down == false then
			VCBsettings.Player.GlobalCooldown.Instant.Icon.Position = name.value
			vcbOptions1Box6cPopOut7.Text:SetText(self.Text:GetText())
			VDW.VCB.chkGlobalCooldownPlayer()
			vcbOptions1Box6cPopOut7Choice1:Hide()
		end
	end)
	local w = _G["vcbOptions1Box6cPopOut7Choice"..i].Text:GetStringWidth()
	if w > maxW then maxW = w end
end
finalW = math.ceil(maxW + 24)
for i = 1, counter, 1 do
	_G["vcbOptions1Box6cPopOut7Choice"..i]:SetWidth(finalW)
end
counter = 0
maxW = 160
vcbOptions1Box6cPopOut7:HookScript("OnEnter", function(self)
	local word = self.Title:GetText()
	VDW.Tooltip_Show(self, prefixTip, string.format(L.POSITION_TIP, word), C.Main)
end)
vcbOptions1Box6cPopOut7:HookScript("OnLeave", function(self) VDW.Tooltip_Hide() end)
vcbOptions1Box6cPopOut7:HookScript("OnClick", function(self, button, down)
	if button == "LeftButton" and down == false then
		if not vcbOptions1Box6cPopOut7Choice1:IsShown() then
			vcbOptions1Box6cPopOut7Choice1:Show()
		else
			vcbOptions1Box6cPopOut7Choice1:Hide()
		end
	end
end)
-- instant cast bar name
ColoringPopOutButtons("6c", 8)
vcbOptions1Box6cPopOut8.Title:SetText(L.SPELL_NAME)
for i, name in ipairs(textPosition) do
	counter = counter + 1
	local btn = CreateFrame("Button", "vcbOptions1Box6cPopOut8Choice"..i, nil, "vdwPopOutButton")
	_G["vcbOptions1Box6cPopOut8Choice"..i]:ClearAllPoints()
	if i == 1 then
		_G["vcbOptions1Box6cPopOut8Choice"..i]:SetParent(vcbOptions1Box6cPopOut8)
		_G["vcbOptions1Box6cPopOut8Choice"..i]:SetPoint("TOP", vcbOptions1Box6cPopOut8, "BOTTOM", 0, 4)
		_G["vcbOptions1Box6cPopOut8Choice"..i]:SetScript("OnShow", function(self)
			self:GetParent():SetNormalAtlas("charactercreate-customize-dropdownbox-hover")
			PlaySound(855, "Master")
		end)
		_G["vcbOptions1Box6cPopOut8Choice"..i]:SetScript("OnHide", function(self)
			self:GetParent():SetNormalAtlas("charactercreate-customize-dropdownbox-open")
			PlaySound(855, "Master")
		end)
	else
		_G["vcbOptions1Box6cPopOut8Choice"..i]:SetParent(vcbOptions1Box6cPopOut8Choice1)
		_G["vcbOptions1Box6cPopOut8Choice"..i]:SetPoint("TOP", _G["vcbOptions1Box6cPopOut8Choice"..i-1], "BOTTOM", 0, 0)
		_G["vcbOptions1Box6cPopOut8Choice"..i]:Show()
	end
	_G["vcbOptions1Box6cPopOut8Choice"..i].Text:SetText(name.text)
	_G["vcbOptions1Box6cPopOut8Choice"..i]:HookScript("OnClick", function(self, button, down)
		if button == "LeftButton" and down == false then
			VCBsettings.Player.GlobalCooldown.Instant.Name.Position = name.value
			vcbOptions1Box6cPopOut8.Text:SetText(self.Text:GetText())
			VDW.VCB.chkGlobalCooldownPlayer()
			vcbOptions1Box6cPopOut8Choice1:Hide()
		end
	end)
	local w = _G["vcbOptions1Box6cPopOut8Choice"..i].Text:GetStringWidth()
	if w > maxW then maxW = w end
end
finalW = math.ceil(maxW + 24)
for i = 1, counter, 1 do
	_G["vcbOptions1Box6cPopOut8Choice"..i]:SetWidth(finalW)
end
counter = 0
maxW = 160
vcbOptions1Box6cPopOut8:HookScript("OnEnter", function(self)
	local word = self.Title:GetText()
	VDW.Tooltip_Show(self, prefixTip, string.format(L.POSITION_TIP, word), C.Main)
end)
vcbOptions1Box6cPopOut8:HookScript("OnLeave", function(self) VDW.Tooltip_Hide() end)
vcbOptions1Box6cPopOut8:HookScript("OnClick", function(self, button, down)
	if button == "LeftButton" and down == false then
		if not vcbOptions1Box6cPopOut8Choice1:IsShown() then
			vcbOptions1Box6cPopOut8Choice1:Show()
		else
			vcbOptions1Box6cPopOut8Choice1:Hide()
		end
	end
end)
-- -- instant cast bar remaining time
ColoringPopOutButtons("6c", 9)
vcbOptions1Box6cPopOut9.Title:SetText(L.TIME)
for i, name in ipairs(textPosition) do
	counter = counter + 1
	local btn = CreateFrame("Button", "vcbOptions1Box6cPopOut9Choice"..i, nil, "vdwPopOutButton")
	_G["vcbOptions1Box6cPopOut9Choice"..i]:ClearAllPoints()
	if i == 1 then
		_G["vcbOptions1Box6cPopOut9Choice"..i]:SetParent(vcbOptions1Box6cPopOut9)
		_G["vcbOptions1Box6cPopOut9Choice"..i]:SetPoint("TOP", vcbOptions1Box6cPopOut9, "BOTTOM", 0, 4)
		_G["vcbOptions1Box6cPopOut9Choice"..i]:SetScript("OnShow", function(self)
			self:GetParent():SetNormalAtlas("charactercreate-customize-dropdownbox-hover")
			PlaySound(855, "Master")
		end)
		_G["vcbOptions1Box6cPopOut9Choice"..i]:SetScript("OnHide", function(self)
			self:GetParent():SetNormalAtlas("charactercreate-customize-dropdownbox-open")
			PlaySound(855, "Master")
		end)
	else
		_G["vcbOptions1Box6cPopOut9Choice"..i]:SetParent(vcbOptions1Box6cPopOut9Choice1)
		_G["vcbOptions1Box6cPopOut9Choice"..i]:SetPoint("TOP", _G["vcbOptions1Box6cPopOut9Choice"..i-1], "BOTTOM", 0, 0)
		_G["vcbOptions1Box6cPopOut9Choice"..i]:Show()
	end
	_G["vcbOptions1Box6cPopOut9Choice"..i].Text:SetText(name.text)
	_G["vcbOptions1Box6cPopOut9Choice"..i]:HookScript("OnClick", function(self, button, down)
		if button == "LeftButton" and down == false then
			VCBsettings.Player.GlobalCooldown.Instant.RemainingTime.Position = name.value
			vcbOptions1Box6cPopOut9.Text:SetText(self.Text:GetText())
			VDW.VCB.chkGlobalCooldownPlayer()
			vcbOptions1Box6cPopOut9Choice1:Hide()
		end
	end)
	local w = _G["vcbOptions1Box6cPopOut9Choice"..i].Text:GetStringWidth()
	if w > maxW then maxW = w end
end
finalW = math.ceil(maxW + 24)
for i = 1, counter, 1 do
	_G["vcbOptions1Box6cPopOut9Choice"..i]:SetWidth(finalW)
end
counter = 0
maxW = 160
vcbOptions1Box6cPopOut9:HookScript("OnEnter", function(self)
	local word = self.Title:GetText()
	VDW.Tooltip_Show(self, prefixTip, string.format(L.POSITION_TIP, word), C.Main)
end)
vcbOptions1Box6cPopOut9:HookScript("OnLeave", function(self) VDW.Tooltip_Hide() end)
vcbOptions1Box6cPopOut9:HookScript("OnClick", function(self, button, down)
	if button == "LeftButton" and down == false then
		if not vcbOptions1Box6cPopOut9Choice1:IsShown() then
			vcbOptions1Box6cPopOut9Choice1:Show()
		else
			vcbOptions1Box6cPopOut9Choice1:Hide()
		end
	end
end)
-- lag bar, queue bar --
for k = 7, 8, 1 do
	ColoringPopOutButtons(k, 1)
	_G["vcbOptions1Box"..k.."PopOut1"].Title:SetText(L.VISIBILITY)
	for i, name in ipairs(textSec) do
		counter = counter + 1
		local btn = CreateFrame("Button", "vcbOptions1Box"..k.."PopOut1Choice"..i, nil, "vdwPopOutButton")
		_G["vcbOptions1Box"..k.."PopOut1Choice"..i]:ClearAllPoints()
		if i == 1 then
			_G["vcbOptions1Box"..k.."PopOut1Choice"..i]:SetParent(_G["vcbOptions1Box"..k.."PopOut1"])
			_G["vcbOptions1Box"..k.."PopOut1Choice"..i]:SetPoint("TOP", _G["vcbOptions1Box"..k.."PopOut1"], "BOTTOM", 0, 4)
			_G["vcbOptions1Box"..k.."PopOut1Choice"..i]:SetScript("OnShow", function(self)
				self:GetParent():SetNormalAtlas("charactercreate-customize-dropdownbox-hover")
				PlaySound(855, "Master")
			end)
			_G["vcbOptions1Box"..k.."PopOut1Choice"..i]:SetScript("OnHide", function(self)
				self:GetParent():SetNormalAtlas("charactercreate-customize-dropdownbox-open")
				PlaySound(855, "Master")
			end)
		else
			_G["vcbOptions1Box"..k.."PopOut1Choice"..i]:SetParent(_G["vcbOptions1Box"..k.."PopOut1Choice1"])
			_G["vcbOptions1Box"..k.."PopOut1Choice"..i]:SetPoint("TOP", _G["vcbOptions1Box"..k.."PopOut1Choice"..i-1], "BOTTOM", 0, 0)
			_G["vcbOptions1Box"..k.."PopOut1Choice"..i]:Show()
		end
		_G["vcbOptions1Box"..k.."PopOut1Choice"..i].Text:SetText(name.text)
		_G["vcbOptions1Box"..k.."PopOut1Choice"..i]:HookScript("OnClick", function(self, button, down)
			if button == "LeftButton" and down == false then
				if k == 7 then
					VCBsettings.Player.LagBar.Visibility = name.value
				elseif k == 8 then
					VCBsettings.Player.QueueBar.Visibility = name.value
				end
				_G["vcbOptions1Box"..k.."PopOut1"].Text:SetText(self.Text:GetText())
				_G["vcbOptions1Box"..k.."PopOut1Choice1"]:Hide()
			end
		end)
		local w = _G["vcbOptions1Box"..k.."PopOut1Choice"..i].Text:GetStringWidth()
		if w > maxW then maxW = w end
	end
	finalW = math.ceil(maxW + 24)
	for i = 1, counter, 1 do
		_G["vcbOptions1Box"..k.."PopOut1Choice"..i]:SetWidth(finalW)
	end
	counter = 0
	maxW = 160
	_G["vcbOptions1Box"..k.."PopOut1"]:HookScript("OnEnter", function(self)
		local parent = self:GetParent()
		local word = parent.Title:GetText()
		VDW.Tooltip_Show(self, prefixTip, string.format(L.VISIBILITY_TIP, word), C.Main)
	end)
	_G["vcbOptions1Box"..k.."PopOut1"]:HookScript("OnLeave", function(self) VDW.Tooltip_Hide() end)
	_G["vcbOptions1Box"..k.."PopOut1"]:HookScript("OnClick", function(self, button, down)
		if button == "LeftButton" and down == false then
			if not _G["vcbOptions1Box"..k.."PopOut1Choice1"]:IsShown() then
				_G["vcbOptions1Box"..k.."PopOut1Choice1"]:Show()
			else
				_G["vcbOptions1Box"..k.."PopOut1Choice1"]:Hide()
			end
		end
	end)
end
-- color & style of bar & border --
-- color status bar
ColoringPopOutButtons(9, 1)
	vcbOptions1Box9PopOut1.Title:SetText(L.COLOR)
for i, name in ipairs(barColor) do
	counter = counter + 1
	local btn = CreateFrame("Button", "vcbOptions1Box9PopOut1Choice"..i, nil, "vdwPopOutButton")
	_G["vcbOptions1Box9PopOut1Choice"..i]:ClearAllPoints()
	if i == 1 then
		_G["vcbOptions1Box9PopOut1Choice"..i]:SetParent(vcbOptions1Box9PopOut1)
		_G["vcbOptions1Box9PopOut1Choice"..i]:SetPoint("TOP", vcbOptions1Box9PopOut1, "BOTTOM", 0, 4)
		_G["vcbOptions1Box9PopOut1Choice"..i]:SetScript("OnShow", function(self)
			self:GetParent():SetNormalAtlas("charactercreate-customize-dropdownbox-hover")
			PlaySound(855, "Master")
		end)
		_G["vcbOptions1Box9PopOut1Choice"..i]:SetScript("OnHide", function(self)
			self:GetParent():SetNormalAtlas("charactercreate-customize-dropdownbox-open")
			PlaySound(855, "Master")
		end)
	else
		_G["vcbOptions1Box9PopOut1Choice"..i]:SetParent(vcbOptions1Box9PopOut1Choice1)
		_G["vcbOptions1Box9PopOut1Choice"..i]:SetPoint("TOP", _G["vcbOptions1Box9PopOut1Choice"..i-1], "BOTTOM", 0, 0)
		_G["vcbOptions1Box9PopOut1Choice"..i]:Show()
	end
	_G["vcbOptions1Box9PopOut1Choice"..i].Text:SetText(name.text)
	_G["vcbOptions1Box9PopOut1Choice"..i]:HookScript("OnClick", function(self, button, down)
		if button == "LeftButton" and down == false then
			VCBsettings.Player.StatusBar.Color = name.value
			if VCBsettings.Player.GlobalCooldown.Instant.Style == "Default" then
				VCBsettings.Player.GlobalCooldown.Instant.StatusColor = VCBsettings.Player.StatusBar.Color
				VDW.VCB.chkGlobalCooldownPlayer()
			end
			VDW.VCB.chkStatusColorPlayer()
			vcbOptions1Box9PopOut1.Text:SetText(self.Text:GetText())
			vcbOptions1Box9PopOut1Choice1:Hide()
		end
	end)
	local w = _G["vcbOptions1Box9PopOut1Choice"..i].Text:GetStringWidth()
	if w > maxW then maxW = w end
end
finalW = math.ceil(maxW + 24)
for i = 1, counter, 1 do
	_G["vcbOptions1Box9PopOut1Choice"..i]:SetWidth(finalW)
end
counter = 0
maxW = 160
vcbOptions1Box9PopOut1:HookScript("OnEnter", function(self)
	local parent = self:GetParent()
	local word = parent.Title:GetText()
	VDW.Tooltip_Show(self, prefixTip, string.format(L.COLOR_TIP, word), C.Main)
end)
vcbOptions1Box9PopOut1:HookScript("OnLeave", function(self) VDW.Tooltip_Hide() end)
vcbOptions1Box9PopOut1:HookScript("OnClick", function(self, button, down)
	if button == "LeftButton" and down == false then
		if not vcbOptions1Box9PopOut1Choice1:IsShown() then
			vcbOptions1Box9PopOut1Choice1:Show()
		else
			vcbOptions1Box9PopOut1Choice1:Hide()
		end
	end
end)
-- color border  bar
ColoringPopOutButtons(10, 1)
	vcbOptions1Box10PopOut1.Title:SetText(L.COLOR)
for i, name in ipairs(borderColor) do
	counter = counter + 1
	local btn = CreateFrame("Button", "vcbOptions1Box10PopOut1Choice"..i, nil, "vdwPopOutButton")
	_G["vcbOptions1Box10PopOut1Choice"..i]:ClearAllPoints()
	if i == 1 then
		_G["vcbOptions1Box10PopOut1Choice"..i]:SetParent(vcbOptions1Box10PopOut1)
		_G["vcbOptions1Box10PopOut1Choice"..i]:SetPoint("TOP", vcbOptions1Box10PopOut1, "BOTTOM", 0, 4)
		_G["vcbOptions1Box10PopOut1Choice"..i]:SetScript("OnShow", function(self)
			self:GetParent():SetNormalAtlas("charactercreate-customize-dropdownbox-hover")
			PlaySound(855, "Master")
		end)
		_G["vcbOptions1Box10PopOut1Choice"..i]:SetScript("OnHide", function(self)
			self:GetParent():SetNormalAtlas("charactercreate-customize-dropdownbox-open")
			PlaySound(855, "Master")
		end)
	else
		_G["vcbOptions1Box10PopOut1Choice"..i]:SetParent(vcbOptions1Box10PopOut1Choice1)
		_G["vcbOptions1Box10PopOut1Choice"..i]:SetPoint("TOP", _G["vcbOptions1Box10PopOut1Choice"..i-1], "BOTTOM", 0, 0)
		_G["vcbOptions1Box10PopOut1Choice"..i]:Show()
	end
	_G["vcbOptions1Box10PopOut1Choice"..i].Text:SetText(name.text)
	_G["vcbOptions1Box10PopOut1Choice"..i]:HookScript("OnClick", function(self, button, down)
		if button == "LeftButton" and down == false then
			VCBsettings.Player.Border.Color = name.value
			if VCBsettings.Player.GlobalCooldown.Instant.Style == "Default" then
				VCBsettings.Player.GlobalCooldown.Instant.BorderColor = VCBsettings.Player.Border.Color
				VDW.VCB.chkGlobalCooldownPlayer()
			end
			VDW.VCB.chkBorderColorPlayer()
			vcbOptions1Box10PopOut1.Text:SetText(self.Text:GetText())
			vcbOptions1Box10PopOut1Choice1:Hide()
		end
	end)
	local w = _G["vcbOptions1Box10PopOut1Choice"..i].Text:GetStringWidth()
	if w > maxW then maxW = w end
end
finalW = math.ceil(maxW + 24)
for i = 1, counter, 1 do
	_G["vcbOptions1Box10PopOut1Choice"..i]:SetWidth(finalW)
end
counter = 0
maxW = 160
vcbOptions1Box10PopOut1:HookScript("OnEnter", function(self)
	local parent = self:GetParent()
	local word = parent.Title:GetText()
	VDW.Tooltip_Show(self, prefixTip, string.format(L.COLOR_TIP, word), C.Main)
end)
vcbOptions1Box10PopOut1:HookScript("OnLeave", function(self) VDW.Tooltip_Hide() end)
vcbOptions1Box10PopOut1:HookScript("OnClick", function(self, button, down)
	if button == "LeftButton" and down == false then
		if not vcbOptions1Box10PopOut1Choice1:IsShown() then
			vcbOptions1Box10PopOut1Choice1:Show()
		else
			vcbOptions1Box10PopOut1Choice1:Hide()
		end
	end
end)
-- style status
ColoringPopOutButtons(9, 2)
vcbOptions1Box9PopOut2.Title:SetText(L.STYLE)
for i, name in ipairs(barStyle) do
	counter = counter + 1
	local btn = CreateFrame("Button", "vcbOptions1Box9PopOut2Choice"..i, nil, "vdwPopOutButton")
	_G["vcbOptions1Box9PopOut2Choice"..i]:ClearAllPoints()
	if i == 1 then
		_G["vcbOptions1Box9PopOut2Choice"..i]:SetParent(vcbOptions1Box9PopOut2)
		_G["vcbOptions1Box9PopOut2Choice"..i]:SetPoint("TOP", vcbOptions1Box9PopOut2, "BOTTOM", 0, 4)
		_G["vcbOptions1Box9PopOut2Choice"..i]:SetScript("OnShow", function(self)
			self:GetParent():SetNormalAtlas("charactercreate-customize-dropdownbox-hover")
			PlaySound(855, "Master")
		end)
		_G["vcbOptions1Box9PopOut2Choice"..i]:SetScript("OnHide", function(self)
			self:GetParent():SetNormalAtlas("charactercreate-customize-dropdownbox-open")
			PlaySound(855, "Master")
		end)
	else
		_G["vcbOptions1Box9PopOut2Choice"..i]:SetParent(vcbOptions1Box9PopOut2Choice1)
		_G["vcbOptions1Box9PopOut2Choice"..i]:SetPoint("TOP", _G["vcbOptions1Box9PopOut2Choice"..i-1], "BOTTOM", 0, 0)
		_G["vcbOptions1Box9PopOut2Choice"..i]:Show()
	end
	_G["vcbOptions1Box9PopOut2Choice"..i].Text:SetText(name.text)
	_G["vcbOptions1Box9PopOut2Choice"..i]:HookScript("OnClick", function(self, button, down)
		if button == "LeftButton" and down == false then
			VCBsettings.Player.StatusBar.Style = name.value
			if VCBsettings.Player.GlobalCooldown.Instant.Style == "Default" then
				VCBsettings.Player.GlobalCooldown.Instant.StastusStyle = VCBsettings.Player.StatusBar.Style
				VDW.VCB.chkGlobalCooldownPlayer()
			end
			VDW.VCB.chkStatusStylePlayer()
			vcbOptions1Box9PopOut2.Text:SetText(self.Text:GetText())
			vcbOptions1Box9PopOut2Choice1:Hide()
		end
	end)
	local w = _G["vcbOptions1Box9PopOut2Choice"..i].Text:GetStringWidth()
	if w > maxW then maxW = w end
end
finalW = math.ceil(maxW + 24)
for i = 1, counter, 1 do
	_G["vcbOptions1Box9PopOut2Choice"..i]:SetWidth(finalW)
end
counter = 0
maxW = 160
vcbOptions1Box9PopOut2:HookScript("OnEnter", function(self)
	local parent = self:GetParent()
	local word = parent.Title:GetText()
	VDW.Tooltip_Show(self, prefixTip, string.format(L.STYLE_TIP, word), C.Main)
end)
vcbOptions1Box9PopOut2:HookScript("OnLeave", function(self) VDW.Tooltip_Hide() end)
vcbOptions1Box9PopOut2:HookScript("OnClick", function(self, button, down)
	if button == "LeftButton" and down == false then
		if not vcbOptions1Box9PopOut2Choice1:IsShown() then
			vcbOptions1Box9PopOut2Choice1:Show()
		else
			vcbOptions1Box9PopOut2Choice1:Hide()
		end
	end
end)
-- style border
ColoringPopOutButtons(10, 2)
vcbOptions1Box10PopOut2.Title:SetText(L.STYLE)
for i, name in ipairs(borderStyle) do
	counter = counter + 1
	local btn = CreateFrame("Button", "vcbOptions1Box10PopOut2Choice"..i, nil, "vdwPopOutButton")
	_G["vcbOptions1Box10PopOut2Choice"..i]:ClearAllPoints()
	if i == 1 then
		_G["vcbOptions1Box10PopOut2Choice"..i]:SetParent(vcbOptions1Box10PopOut2)
		_G["vcbOptions1Box10PopOut2Choice"..i]:SetPoint("TOP", vcbOptions1Box10PopOut2, "BOTTOM", 0, 4)
		_G["vcbOptions1Box10PopOut2Choice"..i]:SetScript("OnShow", function(self)
			self:GetParent():SetNormalAtlas("charactercreate-customize-dropdownbox-hover")
			PlaySound(855, "Master")
		end)
		_G["vcbOptions1Box10PopOut2Choice"..i]:SetScript("OnHide", function(self)
			self:GetParent():SetNormalAtlas("charactercreate-customize-dropdownbox-open")
			PlaySound(855, "Master")
		end)
	else
		_G["vcbOptions1Box10PopOut2Choice"..i]:SetParent(vcbOptions1Box10PopOut2Choice1)
		_G["vcbOptions1Box10PopOut2Choice"..i]:SetPoint("TOP", _G["vcbOptions1Box10PopOut2Choice"..i-1], "BOTTOM", 0, 0)
		_G["vcbOptions1Box10PopOut2Choice"..i]:Show()
	end
	_G["vcbOptions1Box10PopOut2Choice"..i].Text:SetText(name.text)
	_G["vcbOptions1Box10PopOut2Choice"..i]:HookScript("OnClick", function(self, button, down)
		if button == "LeftButton" and down == false then
			VCBsettings.Player.Border.Style = name.value
			if VCBsettings.Player.GlobalCooldown.Instant.Style == "Default" then
				VCBsettings.Player.GlobalCooldown.Instant.BorderStyle = VCBsettings.Player.Border.Style
				VDW.VCB.chkGlobalCooldownPlayer()
			end
			vcbOptions1Box10PopOut2.Text:SetText(self.Text:GetText())
			vcbOptions1Box10PopOut2Choice1:Hide()
			C_UI.Reload()
		end
	end)
	local w = _G["vcbOptions1Box10PopOut2Choice"..i].Text:GetStringWidth()
	if w > maxW then maxW = w end
end
finalW = math.ceil(maxW + 24)
for i = 1, counter, 1 do
	_G["vcbOptions1Box10PopOut2Choice"..i]:SetWidth(finalW)
end
counter = 0
maxW = 160
vcbOptions1Box10PopOut2:HookScript("OnEnter", function(self)
	local parent = self:GetParent()
	local word = parent.Title:GetText()
	VDW.Tooltip_Show(self, prefixTip, string.format(L.STYLE_TIP, word), C.Main)
end)
vcbOptions1Box10PopOut2:HookScript("OnLeave", function(self) VDW.Tooltip_Hide() end)
vcbOptions1Box10PopOut2:HookScript("OnClick", function(self, button, down)
	if button == "LeftButton" and down == false then
		if not vcbOptions1Box10PopOut2Choice1:IsShown() then
			vcbOptions1Box10PopOut2Choice1:Show()
		else
			vcbOptions1Box10PopOut2Choice1:Hide()
		end
	end
end)
-- Ticks of the spells --
ColoringPopOutButtons(11, 1)
vcbOptions1Box11PopOut1.Title:SetText(L.STYLE)
for i, name in ipairs(textSec) do
	counter = counter + 1
	local btn = CreateFrame("Button", "vcbOptions1Box11PopOut1Choice"..i, nil, "vdwPopOutButton")
	_G["vcbOptions1Box11PopOut1Choice"..i]:ClearAllPoints()
	if i == 1 then
		_G["vcbOptions1Box11PopOut1Choice"..i]:SetParent(vcbOptions1Box11PopOut1)
		_G["vcbOptions1Box11PopOut1Choice"..i]:SetPoint("TOP", vcbOptions1Box11PopOut1, "BOTTOM", 0, 4)
		_G["vcbOptions1Box11PopOut1Choice"..i]:SetScript("OnShow", function(self)
			self:GetParent():SetNormalAtlas("charactercreate-customize-dropdownbox-hover")
			PlaySound(855, "Master")
		end)
		_G["vcbOptions1Box11PopOut1Choice"..i]:SetScript("OnHide", function(self)
			self:GetParent():SetNormalAtlas("charactercreate-customize-dropdownbox-open")
			PlaySound(855, "Master")
		end)
	else
		_G["vcbOptions1Box11PopOut1Choice"..i]:SetParent(vcbOptions1Box11PopOut1Choice1)
		_G["vcbOptions1Box11PopOut1Choice"..i]:SetPoint("TOP", _G["vcbOptions1Box11PopOut1Choice"..i-1], "BOTTOM", 0, 0)
		_G["vcbOptions1Box11PopOut1Choice"..i]:Show()
	end
	_G["vcbOptions1Box11PopOut1Choice"..i].Text:SetText(name.text)
	_G["vcbOptions1Box11PopOut1Choice"..i]:HookScript("OnClick", function(self, button, down)
		if button == "LeftButton" and down == false then
			VCBspecialSettings.Player.Ticks = name.value
			vcbOptions1Box11PopOut1.Text:SetText(self.Text:GetText())
			vcbOptions1Box11PopOut1Choice1:Hide()
			C_UI.Reload()
		end
end)
	local w = _G["vcbOptions1Box11PopOut1Choice"..i].Text:GetStringWidth()
	if w > maxW then maxW = w end
end
finalW = math.ceil(maxW + 24)
for i = 1, counter, 1 do
	_G["vcbOptions1Box11PopOut1Choice"..i]:SetWidth(finalW)
end
counter = 0
maxW = 160
vcbOptions1Box11PopOut1:HookScript("OnEnter", function(self)
	local parent = self:GetParent()
	local word = parent.Title:GetText()
	VDW.Tooltip_Show(self, prefixTip, string.format(L.SPELL_TICKS_TIP, word), C.Main)
end)
vcbOptions1Box11PopOut1:HookScript("OnLeave", function(self) VDW.Tooltip_Hide() end)
vcbOptions1Box11PopOut1:HookScript("OnClick", function(self, button, down)
	if button == "LeftButton" and down == false then
		if not vcbOptions1Box11PopOut1Choice1:IsShown() then
			vcbOptions1Box11PopOut1Choice1:Show()
		else
			vcbOptions1Box11PopOut1Choice1:Hide()
		end
	end
end)
-- slide bar 1 width of the bar --
vcbOptions1Box12Slider1.Slider.Thumb:SetVertexColor(C.Main:GetRGB())
vcbOptions1Box12Slider1.Back:GetRegions():SetVertexColor(C.Main:GetRGB())
vcbOptions1Box12Slider1.Forward:GetRegions():SetVertexColor(C.Main:GetRGB())
vcbOptions1Box12Slider1.TopText:SetTextColor(C.High:GetRGB())
vcbOptions1Box12Slider1.MinText:SetTextColor(C.High:GetRGB())
vcbOptions1Box12Slider1.MaxText:SetTextColor(C.High:GetRGB())
vcbOptions1Box12Slider1.MinText:SetText(80)
vcbOptions1Box12Slider1.MaxText:SetText(560)
vcbOptions1Box12Slider1.Slider:SetMinMaxValues(80, 560)
-- enter --
vcbOptions1Box12Slider1.Slider:HookScript("OnEnter", function(self)
	VDW.Tooltip_Show(self, prefixTip, L.SLIDER_TIP, C.Main)
end)
-- leave --
vcbOptions1Box12Slider1.Slider:HookScript("OnLeave", function(self) VDW.Tooltip_Hide() end)
-- mouse wheel --
vcbOptions1Box12Slider1.Slider:SetScript("OnMouseWheel", MouseWheelSlider)
-- value change --
vcbOptions1Box12Slider1.Slider:SetScript("OnValueChanged", function (self, value, userInput)
	vcbOptions1Box12Slider1.TopText:SetText(string.format(L.SLIDER_TEXT_WIDTH, self:GetValue()))
	VCBsettings.Player.Size.Width = self:GetValue()
	VDW.VCB.resizeCastBar(PlayerCastingBarFrame)
	PlaySound(858, "Master")
end)
-- slide bar 2 heigth of the bar --
vcbOptions1Box12Slider2.Slider.Thumb:SetVertexColor(C.Main:GetRGB())
vcbOptions1Box12Slider2.Back:GetRegions():SetVertexColor(C.Main:GetRGB())
vcbOptions1Box12Slider2.Forward:GetRegions():SetVertexColor(C.Main:GetRGB())
vcbOptions1Box12Slider2.TopText:SetTextColor(C.High:GetRGB())
vcbOptions1Box12Slider2.MinText:SetTextColor(C.High:GetRGB())
vcbOptions1Box12Slider2.MaxText:SetTextColor(C.High:GetRGB())
vcbOptions1Box12Slider2.MinText:SetText(2)
vcbOptions1Box12Slider2.MaxText:SetText(80)
vcbOptions1Box12Slider2.Slider:SetMinMaxValues(2, 80)
-- enter --
vcbOptions1Box12Slider2.Slider:HookScript("OnEnter", function(self)
	VDW.Tooltip_Show(self, prefixTip, L.SLIDER_TIP, C.Main)
end)
-- leave --
vcbOptions1Box12Slider2.Slider:HookScript("OnLeave", function(self) VDW.Tooltip_Hide() end)
-- mouse wheel --
vcbOptions1Box12Slider2.Slider:SetScript("OnMouseWheel", MouseWheelSlider)
-- value change --
vcbOptions1Box12Slider2.Slider:SetScript("OnValueChanged", function (self, value, userInput)
	vcbOptions1Box12Slider2.TopText:SetText(string.format(L.SLIDER_TEXT_HEIGHT, self:GetValue()))
	VCBsettings.Player.Size.Height = self:GetValue()
	VDW.VCB.resizeCastBar(PlayerCastingBarFrame)
	PlaySound(858, "Master")
end)
-- Checking the Saved Variables --
local function CheckSavedVariables()
	vcbOptions1Box5PopOut1.Text:SetText(iconPositionByValue[VCBsettings.Player.Icon.Position] or VDWtranslate.Global.HIDE)
	vcbOptions1Box5aPopOut1.Text:SetText(iconPositionByValue[VCBsettings.Player.Shield.Position] or VDWtranslate.Global.HIDE)
	vcbOptions1Box6cPopOut7.Text:SetText(iconPositionByValue[VCBsettings.Player.GlobalCooldown.Instant.Icon.Position] or VDWtranslate.Global.HIDE)
	vcbOptions1Box1PopOut1.Text:SetText(textPositionByValue[VCBsettings.Player.CurrentTimeText.Position] or VDWtranslate.Global.HIDE)
	vcbOptions1Box2PopOut1.Text:SetText(textPositionByValue[VCBsettings.Player.BothTimeText.Position] or VDWtranslate.Global.HIDE)
	vcbOptions1Box3PopOut1.Text:SetText(textPositionByValue[VCBsettings.Player.TotalTimeText.Position] or VDWtranslate.Global.HIDE)
	vcbOptions1Box4PopOut1.Text:SetText(textPositionByValue[VCBsettings.Player.NameText.Position] or VDWtranslate.Global.HIDE)
	vcbOptions1Box6cPopOut8.Text:SetText(textPositionByValue[VCBsettings.Player.GlobalCooldown.Instant.Name.Position] or VDWtranslate.Global.HIDE)
	vcbOptions1Box6cPopOut9.Text:SetText(textPositionByValue[VCBsettings.Player.GlobalCooldown.Instant.RemainingTime.Position] or VDWtranslate.Global.HIDE)
	vcbOptions1Box1PopOut3.Text:SetText(textSecByValue[VCBsettings.Player.CurrentTimeText.Sec] or VDWtranslate.Global.HIDE)
	vcbOptions1Box2PopOut3.Text:SetText(textSecByValue[VCBsettings.Player.BothTimeText.Sec] or VDWtranslate.Global.HIDE)
	vcbOptions1Box3PopOut3.Text:SetText(textSecByValue[VCBsettings.Player.TotalTimeText.Sec] or VDWtranslate.Global.HIDE)
	vcbOptions1Box11PopOut1.Text:SetText(textSecByValue[VCBspecialSettings.Player.Ticks] or VDWtranslate.Global.HIDE)
	vcbOptions1Box7PopOut1.Text:SetText(textSecByValue[VCBsettings.Player.LagBar.Visibility] or VDWtranslate.Global.HIDE)
	vcbOptions1Box8PopOut1.Text:SetText(textSecByValue[VCBsettings.Player.QueueBar.Visibility] or VDWtranslate.Global.HIDE)
	vcbOptions1Box1PopOut4.Text:SetText(textDirectionByValue[VCBsettings.Player.CurrentTimeText.Direction] or VDWtranslate.Global.HIDE)
	vcbOptions1Box2PopOut4.Text:SetText(textDirectionByValue[VCBsettings.Player.BothTimeText.Direction] or VDWtranslate.Global.HIDE)
	vcbOptions1Box4aPopOut1.Text:SetText(textBorderByValue[VCBsettings.Player.BorderText.Position] or VDWtranslate.Global.HIDE)
	vcbOptions1Box6cPopOut6.Text:SetText(textBorderByValue[VCBsettings.Player.GlobalCooldown.Instant.TextBorder.Position] or VDWtranslate.Global.HIDE)
	vcbOptions1Box6PopOut2.Text:SetText(gcdStyleByValue[VCBsettings.Player.GlobalCooldown.Style] or VDWtranslate.Global.HIDE)
	vcbOptions1Box6aPopOut1.Text:SetText(gcdIconStyleByValue[VCBsettings.Player.GlobalCooldown.Icon.Style] or VDWtranslate.Global.HIDE)
	vcbOptions1Box6bPopOut5.Text:SetText(gcdBarFillByValue[VCBsettings.Player.GlobalCooldown.Bar.Fill]  or VDWtranslate.Global.HIDE)
	vcbOptions1Box6cPopOut1.Text:SetText(instantStyleByValue[VCBsettings.Player.GlobalCooldown.Instant.Style] or VDWtranslate.Global.HIDE)
	vcbOptions1Box9PopOut1.Text:SetText(barColorByValue[VCBsettings.Player.StatusBar.Color] or VDWtranslate.Global.HIDE)
	vcbOptions1Box6cPopOut3.Text:SetText(barColorByValue[VCBsettings.Player.GlobalCooldown.Instant.StatusColor] or VDWtranslate.Global.HIDE)
	vcbOptions1Box10PopOut1.Text:SetText(borderColorByValue[VCBsettings.Player.Border.Color] or VDWtranslate.Global.HIDE)
	vcbOptions1Box6bPopOut2.Text:SetText(borderColorByValue[VCBsettings.Player.GlobalCooldown.Bar.Color] or VDWtranslate.Global.HIDE)
	vcbOptions1Box6bPopOut4.Text:SetText(borderColorByValue[VCBsettings.Player.GlobalCooldown.Bar.BorderColor] or VDWtranslate.Global.HIDE)
	vcbOptions1Box6cPopOut5.Text:SetText(borderColorByValue[VCBsettings.Player.GlobalCooldown.Instant.BorderColor] or VDWtranslate.Global.HIDE)
	vcbOptions1Box9PopOut2.Text:SetText(barStyleByValue[VCBsettings.Player.StatusBar.Style] or VDWtranslate.Global.HIDE)
	vcbOptions1Box6bPopOut1.Text:SetText(barStyleByValue[VCBsettings.Player.GlobalCooldown.Bar.Style] or VDWtranslate.Global.HIDE)
	vcbOptions1Box6cPopOut2.Text:SetText(barStyleByValue[VCBsettings.Player.GlobalCooldown.Instant.StastusStyle] or VDWtranslate.Global.HIDE)
	vcbOptions1Box10PopOut2.Text:SetText(borderStyleByValue[VCBsettings.Player.Border.Style] or VDWtranslate.Global.HIDE)
	vcbOptions1Box6bPopOut3.Text:SetText(borderStyleByValue[VCBsettings.Player.GlobalCooldown.Bar.BorderStyle] or VDWtranslate.Global.HIDE)
	vcbOptions1Box6cPopOut4.Text:SetText(borderStyleByValue[VCBsettings.Player.GlobalCooldown.Instant.BorderStyle] or VDWtranslate.Global.HIDE)
	vcbOptions1Box6PopOut1.Text:SetText(VCBsettings.Player.GlobalCooldown.Position)
	vcbOptions1Box6PopOut1.Text:SetText(gcdPositionByValue[VCBsettings.Player.GlobalCooldown.Position] or VDWtranslate.Global.HIDE)
	vcbOptions1Box1PopOut2.Text:SetText(VCBsettings.Player.CurrentTimeText.Decimals)
	vcbOptions1Box2PopOut2.Text:SetText(VCBsettings.Player.BothTimeText.Decimals)
	vcbOptions1Box3PopOut2.Text:SetText(VCBsettings.Player.TotalTimeText.Decimals)
	vcbOptions1Box12Slider1.Slider:SetValue(VCBsettings.Player.Size.Width)
	vcbOptions1Box12Slider2.Slider:SetValue(VCBsettings.Player.Size.Height)
	if VCBsettings.Player.GlobalCooldown.Enable then
		vcbOptions1Box6CheckButton1:SetChecked(true)
		popEnable(vcbOptions1Box6PopOut2)
		popEnable(vcbOptions1Box6aPopOut1)
		popEnable(vcbOptions1Box6bPopOut1)
		popEnable(vcbOptions1Box6bPopOut2)
		popEnable(vcbOptions1Box6bPopOut3)
		popEnable(vcbOptions1Box6bPopOut4)
		popEnable(vcbOptions1Box6bPopOut5)
		popEnable(vcbOptions1Box6cPopOut1)
		vcbOptions1Box6CheckButton1.Text:SetTextColor(C.Main:GetRGB())
	else
		vcbOptions1Box6CheckButton1:SetChecked(false)
		popDisable(vcbOptions1Box6PopOut2)
		popDisable(vcbOptions1Box6aPopOut1)
		popDisable(vcbOptions1Box6bPopOut1)
		popDisable(vcbOptions1Box6bPopOut2)
		popDisable(vcbOptions1Box6bPopOut3)
		popDisable(vcbOptions1Box6bPopOut4)
		popDisable(vcbOptions1Box6bPopOut5)
		popDisable(vcbOptions1Box6cPopOut1)
		vcbOptions1Box6CheckButton1.Text:SetTextColor(0.35, 0.35, 0.35, 0.8)
	end
	if VCBsettings.Player.GlobalCooldown.Style == "Icon" then
		if not vcbOptions1Box6a:IsShown() then vcbOptions1Box6a:Show() end
		if vcbOptions1Box6b:IsShown() then vcbOptions1Box6b:Hide() end
		if vcbOptions1Box6c:IsShown() then vcbOptions1Box6c:Hide() end
		popEnable(vcbOptions1Box6PopOut1)
	elseif VCBsettings.Player.GlobalCooldown.Style == "Bar" then
		if vcbOptions1Box6a:IsShown() then vcbOptions1Box6a:Hide() end
		if not vcbOptions1Box6b:IsShown() then vcbOptions1Box6b:Show() end
		if vcbOptions1Box6c:IsShown() then vcbOptions1Box6c:Hide() end
		popEnable(vcbOptions1Box6PopOut1)
	elseif VCBsettings.Player.GlobalCooldown.Style == "InstantCastBar" or VCBsettings.Player.GlobalCooldown.Style == "Instant Cast Bar" then
		if vcbOptions1Box6a:IsShown() then vcbOptions1Box6a:Hide() end
		if vcbOptions1Box6b:IsShown() then vcbOptions1Box6b:Hide() end
		if not vcbOptions1Box6c:IsShown() then vcbOptions1Box6c:Show() end
		popDisable(vcbOptions1Box6PopOut1)
	end
	if VCBsettings.Player.GlobalCooldown.Instant.Style == "Custom" then
		popEnable(vcbOptions1Box6cPopOut2)
		popEnable(vcbOptions1Box6cPopOut3)
		popEnable(vcbOptions1Box6cPopOut4)
		popEnable(vcbOptions1Box6cPopOut5)
		popEnable(vcbOptions1Box6cPopOut6)
		popEnable(vcbOptions1Box6cPopOut7)
		popEnable(vcbOptions1Box6cPopOut8)
		popEnable(vcbOptions1Box6cPopOut9)
	elseif VCBsettings.Player.GlobalCooldown.Instant.Style == "Default" then
		popDisable(vcbOptions1Box6cPopOut2)
		popDisable(vcbOptions1Box6cPopOut3)
		popDisable(vcbOptions1Box6cPopOut4)
		popDisable(vcbOptions1Box6cPopOut5)
		popDisable(vcbOptions1Box6cPopOut6)
		popDisable(vcbOptions1Box6cPopOut7)
		popDisable(vcbOptions1Box6cPopOut8)
		popDisable(vcbOptions1Box6cPopOut9)
	end
end
-- Show the option panel --
vcbOptions1:HookScript("OnShow", function(self)
	vcbOptions0Tab1.Text:SetTextColor(C.High:GetRGB())
	for i = 2, 6, 1 do
		_G["vcbOptions0Tab"..i].Text:SetTextColor(0.4, 0.4, 0.4, 1)
		if _G["vcbOptions"..i]:IsShown() then _G["vcbOptions"..i]:Hide() end
	end
	CheckSavedVariables()
end)
-- Background of the tabs frame --
local OptionsW = vcbOptions1:GetWidth()
vcbOptions0:SetWidth(vcbOptions0Tab1:GetWidth() + OptionsW)
vcbOptions0:SetHeight(vcbOptions1:GetHeight())
vcbOptions0.BGtexture:ClearAllPoints()
vcbOptions0.BGtexture:SetPoint("TOPRIGHT", vcbOptions0, "TOPRIGHT", 0, 0)
vcbOptions0.BGtexture:SetPoint("BOTTOMLEFT", vcbOptions0, "BOTTOMLEFT", OptionsW, 0)
vcbOptions0.BGtexture:SetAtlas("UI-Journeys-BG", false)
vcbOptions0.BGtexture:SetDesaturation(0.3)
vcbOptions0.BGtexture:SetGradient("VERTICAL", C.NoHigh, C.High)
