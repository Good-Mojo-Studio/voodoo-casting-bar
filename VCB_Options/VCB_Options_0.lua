-- some variables
local Color = VDW.GetAddonColors("VCB")
local prefixTip = VDW.Prefix("VCB")
local maxW = 128
local finalW = 0
vcbOptions.ExitButton:HookScript("OnEnter", function(self)
	VDW.Tooltip_Show(self, prefixTip, VDWtranslate.Global.CLOSE_THIS_PANEL, Color.Main, "Left")
end)
vcbOptions:RegisterForDrag("LeftButton")
vcbOptions:SetScript("OnDragStart", vcbOptions.StartMoving)
vcbOptions:SetScript("OnDragStop", vcbOptions.StopMovingOrSizing)
vcbOptions.Tab1.Text:SetText(VDWtranslate.Global.PLAYER_CAST_BAR)
vcbOptions.Tab2.Text:SetText(VDWtranslate.Global.TARGET_CAST_BAR)
vcbOptions.Tab3.Text:SetText(VDWtranslate.Global.FOCUS_CAST_BAR)
vcbOptions.Tab4.Text:SetText(VDWtranslate.Global.BOSS_CAST_BAR)
vcbOptions.Tab5.Text:SetText(VDWtranslate.Global.ARENA_CAST_BAR)
vcbOptions.Tab6.Text:SetText(VDWtranslate.Global.P_TAB)
for i = 1, 6, 1 do
	local w = vcbOptions["Tab"..i].Text:GetStringWidth()
	if w > maxW then maxW = w end
end
finalW = math.ceil(maxW + 16)
for i = 1, 6, 1 do
	vcbOptions["Tab"..i].NormalTexture:SetVertexColor(Color.High:GetRGB())
	vcbOptions["Tab"..i]:HookScript("OnLeave", function(self)
		VDW.Tooltip_Hide()
	end)
	vcbOptions["Tab"..i]:HookScript("OnClick", function(self, button, down)
		if button == "LeftButton" and down == false then
			if not vcbOptions["Panel"..i]:IsShown() then  vcbOptions["Panel"..i]:Show() end
		end
	end)
	if i == 1 then
		vcbOptions["Tab"..i]:SetWidth(finalW)
	else
		vcbOptions["Tab"..i]:SetWidth(finalW)
		vcbOptions["Tab"..i]:SetPoint("TOP", vcbOptions["Tab"..i-1], "BOTTOM", 0, 0)
	end
end
for i = 1, 5, 1 do
	vcbOptions["Tab"..i]:HookScript("OnEnter", function(self)
		local word = self.Text:GetText()
		VDW.Tooltip_Show(self, prefixTip, string.format(VDWtranslate.Global.OPTIONS_FOR, word), Color.Main, "Left")
	end)
end
vcbOptions.Tab6:HookScript("OnEnter", function(self)
	VDW.Tooltip_Show(self, prefixTip, VDWtranslate.Global.P_TITLE, Color.Main, "Left")
end)
vcbOptions:SetScript("OnShow", function(self)
	if not vcbOptions.Panel1:IsShown() then vcbOptions.Panel1:Show() end
end)
vcbOptions:HookScript("OnHide", function(self)
	for i = 1, 6, 1 do
		if vcbOptions["Panel"..i]:IsShown() then vcbOptions["Panel"..i]:Hide() end
	end
end)
