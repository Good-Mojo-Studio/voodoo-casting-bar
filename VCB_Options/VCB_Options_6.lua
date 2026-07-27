-- some variables
local Color = VDW.GetAddonColors("VCB")
local prefixTip = VDW.Prefix("VCB")
local name = ""
local NameExist = false
local Keys = 0
local maxW = 160
local finalW = 0
local counter = 0
-- finding keys
for k, v in pairs(VCBprofiles) do
	Keys = Keys + 1
end
-- create panel
VDW.CreateOptionsPanel(vcbOptions.Panel6, VDW.Background.VCB, Color.Main, Color.High, 0.3, "VCB")
vcbOptions.Panel6.TopTxt:SetText(string.format(VDWtranslate.Global.P_TITLE))
vcbOptions.Panel6.Box1.Title:SetText(VDWtranslate.Global.P_SUB_CREATE)
vcbOptions.Panel6.Box2.Title:SetText(VDWtranslate.Global.P_SUB_LOAD)
vcbOptions.Panel6.Box3.Title:SetText(VDWtranslate.Global.P_SUB_DELETE)
vcbOptions.Panel6.Box4.Title:SetText(VDWtranslate.Global.IMPORTANT_NOTES)
for i = 1, 4, 1 do
	VDW.CreateOptionsBox(vcbOptions.Panel6, i, Color.Main, Color.High)
end
-- Box 1, EditBox 1, profile save
VDW.CreateEditBox(vcbOptions.Panel6, 1, 1, Color.High)
vcbOptions.Panel6.Box1.EditBox1.WritingLine:HookScript("OnEnter", function(self)
	VDW.Tooltip_Show(self, prefixTip, VDWtranslate.Global.P_TIP_CREATE, Color.Main, "Left")
end)
-- pressing enter
vcbOptions.Panel6.Box1.EditBox1.WritingLine:SetScript("OnEnterPressed", function(self)
	if self:HasText() then
		EditBox_HighlightText(self)
		name = self:GetText()
		NameExist = false
		for k, v in pairs(VCBprofiles) do
			if k == name then NameExist = true end
			if NameExist then
				DEFAULT_CHAT_FRAME:AddMessage(Color.Main:WrapTextInColorCode(VDW.PrefixChat("VCB").." "..VDWtranslate.Global.P_WRN_EXIST))
				UIErrorsFrame:AddExternalWarningMessage(VDWtranslate.Global.P_WRN_EXIST)
				return
			end
		end
		VCBprofiles[name] = {settings = VCBsettings}
		C_UI.Reload()
	else
		DEFAULT_CHAT_FRAME:AddMessage(Color.Main:WrapTextInColorCode(VDW.PrefixChat("VCB").." "..VDWtranslate.Global.P_WRN_NEED))
		UIErrorsFrame:AddExternalWarningMessage(VDWtranslate.Global.P_WRN_NEED)
	end
end)
-- Box 2-3, PopOut 1, profile (load, delete)
for i = 2, 3, 1 do
	vcbOptions.Panel6["Box"..i].PopOut1.Text:SetText(VDWtranslate.Global.LEFT_CLICK)
	VDW.CreateOptionsPopOut(vcbOptions.Panel6, i, 1, Color.Main, Color.High)
	if i == 2 then
		vcbOptions.Panel6["Box"..i].PopOut1:HookScript("OnEnter", function(self)
			VDW.Tooltip_Show(self, prefixTip, VDWtranslate.Global.P_TIP_LOAD, Color.Main, "Left")
		end)
		vcbOptions.Panel6["Box"..i].PopOut1:HookScript("OnClick", function(self, button, down)
			if button == "LeftButton" and down == false then
				if vcbOptions.Panel6["Box"..i].PopOut1.Choice1 == nil then
					DEFAULT_CHAT_FRAME:AddMessage(Color.Main:WrapTextInColorCode(VDW.PrefixChat("VCB").." "..VDWtranslate.Global.P_WRN_LOAD))
					UIErrorsFrame:AddExternalWarningMessage(VDWtranslate.Global.P_WRN_LOAD)
				end
			end
		end)
	else
		vcbOptions.Panel6["Box"..i].PopOut1:HookScript("OnEnter", function(self)
			VDW.Tooltip_Show(self, prefixTip, VDWtranslate.Global.P_TIP_DELETE, Color.Main, "Left")
		end)
		vcbOptions.Panel6["Box"..i].PopOut1:HookScript("OnClick", function(self, button, down)
			if button == "LeftButton" and down == false then
				if vcbOptions.Panel6["Box"..i].PopOut1.Choice1 == nil then
					DEFAULT_CHAT_FRAME:AddMessage(Color.Main:WrapTextInColorCode(VDW.PrefixChat("VCB").." "..VDWtranslate.Global.P_WRN_DELETE))
					UIErrorsFrame:AddExternalWarningMessage(VDWtranslate.Global.P_WRN_DELETE)
				end
			end
		end)
	end
	if counter == 0 and Keys > 0 then
		for k, v in pairs(VCBprofiles) do
			counter = counter + 1
			VDW.CreateOptionsPopOutButtons(vcbOptions.Panel6, i, 1, counter, k, Color.Main)
			vcbOptions.Panel6["Box"..i].PopOut1["Choice"..counter].Text:SetText(k)
			vcbOptions.Panel6["Box"..i].PopOut1["Choice"..counter]:HookScript("OnClick", function(self, button, down)
				if button == "LeftButton" and down == false then
					if i == 2 then
						VCBsettings = VCBprofiles[k]["settings"]
						C_UI.Reload()
					else
						VCBprofiles[k] = nil
						C_UI.Reload()
					end
				end
			end)
			local w = vcbOptions.Panel6["Box"..i].PopOut1["Choice"..counter].Text:GetStringWidth()
			if w > maxW then maxW = w end
		end
		finalW = math.ceil(maxW + 8)
		for c = 1, counter, 1 do
			vcbOptions.Panel6["Box"..i].PopOut1["Choice"..c]:SetWidth(finalW)
		end
		counter = 0
	end
end
-- Box 2, Notes
vcbOptions.Panel6.Box4.Notes:SetTextColor(Color.Main:GetRGB())
vcbOptions.Panel6.Box4.Notes:SetWidth(vcbOptions.Panel6.Box4:GetWidth() - 8)
vcbOptions.Panel6.Box4.Notes:SetText("|A:"..C_AddOns.GetAddOnMetadata("VCB", "IconAtlas")..":16:16|a"..Color.High:WrapTextInColorCode(VDWtranslate.Global.NOTE.." 1: ")..VDWtranslate.Global.NOTES_PROFILES)
-- Show the option panel
vcbOptions.Panel6:HookScript("OnShow", function(self)
	for i = 1, 5, 1 do
		vcbOptions["Tab"..i].Text:SetTextColor(0.4, 0.4, 0.4, 1)
		if vcbOptions["Panel"..i]:IsShown() then vcbOptions["Panel"..i]:Hide() end
	end
	vcbOptions.Tab6.Text:SetTextColor(Color.High:GetRGB())
end)
