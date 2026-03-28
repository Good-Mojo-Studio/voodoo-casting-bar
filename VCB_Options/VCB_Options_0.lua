local L = VDWtranslate.VCB.Options
local C = VDW.GetAddonColors("VCB")
local prefixTip = VDW.Prefix("VCB")
local maxW = 128
local finalW = 0
vcbOptions0.ExitButton:HookScript("OnEnter", function(self)
	VDW.Tooltip_Show(self, prefixTip, L.CLOSE_THIS_PANEL, C.Main)
end)
vcbOptions0:RegisterForDrag("LeftButton")
vcbOptions0:SetScript("OnDragStart", vcbOptions0.StartMoving)
vcbOptions0:SetScript("OnDragStop", vcbOptions0.StopMovingOrSizing)
vcbOptions0Tab1.Text:SetText(L.PLAYER_CAST_BAR)
vcbOptions0Tab2.Text:SetText(L.TARGET_CAST_BAR)
vcbOptions0Tab3.Text:SetText(L.FOCUS_CAST_BAR)
vcbOptions0Tab4.Text:SetText(L.BOSS_CAST_BAR)
vcbOptions0Tab5.Text:SetText(L.ARENA_CAST_BAR)
vcbOptions0Tab6.Text:SetText(VDWtranslate.Global.P_TAB)
for i = 1, 6, 1 do
	local w = _G["vcbOptions0Tab"..i].Text:GetStringWidth()
	if w > maxW then maxW = w end
end
finalW = math.ceil(maxW + 16)
for i = 1, 6, 1 do
	_G["vcbOptions0Tab"..i].NormalTexture:SetVertexColor(C.High:GetRGB())
	_G["vcbOptions0Tab"..i]:HookScript("OnLeave", function(self)
		VDW.Tooltip_Hide()
	end)
	_G["vcbOptions0Tab"..i]:HookScript("OnClick", function(self, button, down)
		if button == "LeftButton" and down == false then
			if not _G["vcbOptions"..i]:IsShown() then _G["vcbOptions"..i]:Show() end
		end
	end)
	if i == 1 then
		_G["vcbOptions0Tab"..i]:SetWidth(finalW)
	else
		_G["vcbOptions0Tab"..i]:SetWidth(finalW)
		_G["vcbOptions0Tab"..i]:SetPoint("TOP", _G["vcbOptions0Tab"..i-1], "BOTTOM", 0, 0)
	end
end
for i = 1, 5, 1 do
	_G["vcbOptions0Tab"..i]:HookScript("OnEnter", function(self)
		local word = self.Text:GetText()
		VDW.Tooltip_Show(self, prefixTip, string.format(L.OPTIONS_FOR, word), C.Main)
	end)
end
vcbOptions0Tab6:HookScript("OnEnter", function(self)
	VDW.Tooltip_Show(self, prefixTip, VDWtranslate.Global.P_TITLE, C.Main)
end)
vcbOptions0:SetScript("OnShow", function(self)
	if not vcbOptions1:IsShown() then vcbOptions1:Show() end
end)
vcbOptions0:HookScript("OnHide", function(self)
	for i = 1, 6, 1 do
		if _G["vcbOptions"..i]:IsShown() then _G["vcbOptions"..i]:Hide() end
	end
end)
