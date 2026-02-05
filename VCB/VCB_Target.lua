-- local variables --
local G = VDW.Local.Override
local textName
local textCurrent
local textBoth
local textTotal
local iconSpell
local shieldSpell
-- protect the options --
local function ProtectOptions()
	local loc = GetLocale()
	if loc ~= VCBspecialSettings["LastLocation"] then
		for k, v in pairs(VDW.Local.Translate) do
			for i, s in pairs (v) do
				if VCBsettings["Target"]["NameText"]["Position"] == s then
					VCBsettings["Target"]["NameText"]["Position"] = VDW.Local.Translate[loc][i]
				end
				if VCBsettings["Target"]["CurrentTimeText"]["Position"] == s then
					VCBsettings["Target"]["CurrentTimeText"]["Position"] = VDW.Local.Translate[loc][i]
				end
				if VCBsettings["Target"]["CurrentTimeText"]["Direction"] == s then
					VCBsettings["Target"]["CurrentTimeText"]["Direction"] = VDW.Local.Translate[loc][i]
				end
				if VCBsettings["Target"]["CurrentTimeText"]["Sec"] == s then
					VCBsettings["Target"]["CurrentTimeText"]["Sec"] = VDW.Local.Translate[loc][i]
				end
				if VCBsettings["Target"]["BothTimeText"]["Position"] == s then
					VCBsettings["Target"]["BothTimeText"]["Position"] = VDW.Local.Translate[loc][i]
				end
				if VCBsettings["Target"]["BothTimeText"]["Direction"] == s then
					VCBsettings["Target"]["BothTimeText"]["Direction"] = VDW.Local.Translate[loc][i]
				end
				if VCBsettings["Target"]["BothTimeText"]["Sec"] == s then
					VCBsettings["Target"]["BothTimeText"]["Sec"] = VDW.Local.Translate[loc][i]
				end
				if VCBsettings["Target"]["TotalTimeText"]["Position"] == s then
					VCBsettings["Target"]["TotalTimeText"]["Position"] = VDW.Local.Translate[loc][i]
				end
				if VCBsettings["Target"]["TotalTimeText"]["Sec"] == s then
					VCBsettings["Target"]["TotalTimeText"]["Sec"] = VDW.Local.Translate[loc][i]
				end
				if VCBsettings["Target"]["Icon"]["Position"] == s then
					VCBsettings["Target"]["Icon"]["Position"] = VDW.Local.Translate[loc][i]
				end
				if VCBsettings["Target"]["Icon"]["Shield"] == s then
					VCBsettings["Target"]["Icon"]["Shield"] = VDW.Local.Translate[loc][i]
				end
				if VCBsettings["Target"]["StatusBar"]["Color"] == s then
					VCBsettings["Target"]["StatusBar"]["Color"] = VDW.Local.Translate[loc][i]
				end
				if VCBsettings["Target"]["StatusBar"]["Style"] == s then
					VCBsettings["Target"]["StatusBar"]["Style"] = VDW.Local.Translate[loc][i]
				end
				if VCBsettings["Target"]["Border"]["Color"] == s then
					VCBsettings["Target"]["Border"]["Color"] = VDW.Local.Translate[loc][i]
				end
				if VCBsettings["Target"]["Border"]["Style"] == s then
					VCBsettings["Target"]["Border"]["Style"] = VDW.Local.Translate[loc][i]
				end
				if VCBsettings["Target"]["Lock"] == s then
					VCBsettings["Target"]["Lock"] = VDW.Local.Translate[loc][i]
				end
			end
		end
	end
end
-- function for the default cast bar --
-- function for the texts --
local function Texts(var1)
	var1:SetFontObject("SystemFont_Shadow_Small")
	var1:SetHeight(TargetFrameSpellBar.Text:GetHeight())
	var1:Hide()
end
-- creating the texts --
textName = TargetFrameSpellBar:CreateFontString(nil, "OVERLAY", nil)
Texts(textName)
textCurrent = TargetFrameSpellBar:CreateFontString(nil, "OVERLAY", nil)
Texts(textCurrent)
textBoth = TargetFrameSpellBar:CreateFontString(nil, "OVERLAY", nil)
Texts(textBoth)
textTotal = TargetFrameSpellBar:CreateFontString(nil, "OVERLAY", nil)
Texts(textTotal)
-- copy texture of spell's icon --
iconSpell = TargetFrameSpellBar:CreateTexture(nil, "ARTWORK", nil, 0)
iconSpell:Hide()
-- copy texture of spell's shield --
shieldSpell = TargetFrameSpellBar:CreateTexture(nil, "BACKGROUND", nil, 0)
shieldSpell:SetAtlas("ui-castingbar-shield", false)
shieldSpell:SetPoint("CENTER", iconSpell, "CENTER", -1, -3)
shieldSpell:SetSize(29, 33)
shieldSpell:SetBlendMode("BLEND")
shieldSpell:SetAlpha(0.75)
shieldSpell:Hide()
-- name position --
local function namePosition(self)
	print("namePosition is not Working!")
end
-- current time position --
local function currentPostion(self)
	print("currentPostion is not Working!")
end
-- both time position --
local function bothPostion(self)
	print("bothPostion is not Working!")
end
-- total time position--
local function totalPostion(self)
	print("totalPostion is not Working!")
end
-- icon position --
local function iconPosition(self)
	print("iconPosition is not Working!")
end
-- current time update --
local function currentUpdate(self)
	print("currentUpdate is not Working!")
end
-- both time update --
local function bothUpdate(self)
	print("bothUpdate is not Working!")
end
-- total time update--
local function totalUpdate(self)
	print("totalUpdate is not Working!")
end
-- cast bar color --
local function castbarColor(self)
	print("castbarColor is not Working!")
end
-- border color --
local function borderColor(self)
	print("borderColor is not Working!")
end
-- position functions --
local function GlobalFunctionsCHK()
-- icon --
	function chkIconTarget()
		TargetFrameSpellBar.Icon:SetSize(20, 20)
		TargetFrameSpellBar.Icon:SetScale(1)
		iconSpell:SetWidth(TargetFrameSpellBar.Icon:GetWidth())
		iconSpell:SetHeight(TargetFrameSpellBar.Icon:GetHeight())
		iconSpell:SetScale(TargetFrameSpellBar.Icon:GetScale())
		if VCBsettings["Target"]["Icon"]["Shield"] == G.OPTIONS_V_HIDE then
			if VCBsettings["Target"]["Icon"]["Position"] == G.OPTIONS_V_HIDE then
				function iconPosition(self)
					if self.Icon:IsShown() then self.Icon:Hide() end
					if iconSpell:IsShown() then iconSpell:Hide() end
					if self.BorderShield:IsShown() then self.BorderShield:Hide() end
					if shieldSpell:IsShown() then shieldSpell:Hide() end
				end
			elseif VCBsettings["Target"]["Icon"]["Position"] == G.OPTIONS_P_LEFT then
				function iconPosition(self)
					if not self.Icon:IsShown() then self.Icon:Show() end
					if iconSpell:IsShown() then iconSpell:Hide() end
					if self.BorderShield:IsShown() then self.BorderShield:Hide() end
					if shieldSpell:IsShown() then shieldSpell:Hide() end
				end
			elseif VCBsettings["Target"]["Icon"]["Position"] == G.OPTIONS_P_RIGHT then
				function iconPosition(self)
					if self.Icon:IsShown() then self.Icon:Hide() end
					iconSpell:ClearAllPoints()
					iconSpell:SetPoint("LEFT", self, "RIGHT", 2, -4)
					iconSpell:SetTexture(self.Icon:GetTextureFileID())
					if not iconSpell:IsShown() then iconSpell:Show() end
					if self.BorderShield:IsShown() then self.BorderShield:Hide() end
					if shieldSpell:IsShown() then shieldSpell:Hide() end
				end
			elseif VCBsettings["Target"]["Icon"]["Position"] == G.OPTIONS_P_BOTH then
				function iconPosition(self)
					if not self.Icon:IsShown() then self.Icon:Show() end
					iconSpell:ClearAllPoints()
					iconSpell:SetPoint("LEFT", self, "RIGHT", 2, -4)
					iconSpell:SetTexture(self.Icon:GetTextureFileID())
					if not iconSpell:IsShown() then iconSpell:Show() end
					if self.BorderShield:IsShown() then self.BorderShield:Hide() end
					if shieldSpell:IsShown() then shieldSpell:Hide() end
				end
			end
		elseif VCBsettings["Target"]["Icon"]["Shield"] == G.OPTIONS_V_SHOW then
			if VCBsettings["Target"]["Icon"]["Position"] == G.OPTIONS_P_LEFT then
				function iconPosition(self)
					if not self.Icon:IsShown() then self.Icon:Show() end
					if iconSpell:IsShown() then iconSpell:Hide() end
					if shieldSpell:IsShown() then shieldSpell:Hide() end
					if self.barType == "uninterruptable" then
						if not self.BorderShield:IsShown() then self.BorderShield:Show() end
					end
				end
			elseif VCBsettings["Target"]["Icon"]["Position"] == G.OPTIONS_P_RIGHT then
				function iconPosition(self)
					if self.Icon:IsShown() then self.Icon:Hide() end
					iconSpell:ClearAllPoints()
					iconSpell:SetPoint("LEFT", self, "RIGHT", 2, -4)
					iconSpell:SetTexture(self.Icon:GetTextureFileID())
					if not iconSpell:IsShown() then iconSpell:Show() end
					if self.BorderShield:IsShown() then self.BorderShield:Hide() end
					if self.barType == "uninterruptable" then
						if not shieldSpell:IsShown() then shieldSpell:Show() end
					else
						if shieldSpell:IsShown() then shieldSpell:Hide() end
					end
				end
			elseif VCBsettings["Target"]["Icon"]["Position"] == G.OPTIONS_P_BOTH then
				function iconPosition(self)
					if not self.Icon:IsShown() then self.Icon:Show() end
					iconSpell:ClearAllPoints()
					iconSpell:SetPoint("LEFT", self, "RIGHT", 2, -4)
					iconSpell:SetTexture(self.Icon:GetTextureFileID())
					if not iconSpell:IsShown() then iconSpell:Show() end
					if self.barType == "uninterruptable" then
						if not self.BorderShield:IsShown() then self.BorderShield:Show() end
						if not shieldSpell:IsShown() then shieldSpell:Show() end
					else
						if shieldSpell:IsShown() then shieldSpell:Hide() end
					end
				end
			end
		end
	end
-- name --
	function chkNameTxtTarget()
		if VCBsettings["Target"]["NameText"]["Position"] == G.OPTIONS_V_HIDE then
			function namePosition(self)
				if textName:IsShown() then textName:Hide() end
			end
		elseif VCBsettings["Target"]["NameText"]["Position"] == G.OPTIONS_P_TOPLEFT then
			function namePosition(self)
				textName:ClearAllPoints()
				textName:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 3, -1)
				textName:SetJustifyH("LEFT")
				if not textName:IsShown() then textName:Show() end
			end
		elseif VCBsettings["Target"]["NameText"]["Position"] == G.OPTIONS_P_LEFT then
			function namePosition(self)
				textName:ClearAllPoints()
				textName:SetPoint("LEFT", self, "LEFT", 4, 1)
				textName:SetJustifyH("LEFT")
				if not textName:IsShown() then textName:Show() end
			end
		elseif VCBsettings["Target"]["NameText"]["Position"] == G.OPTIONS_P_BOTTOMLEFT then
			function namePosition(self)
				textName:ClearAllPoints()
				textName:SetPoint("TOPLEFT", self, "BOTTOMLEFT", 5, 2)
				textName:SetJustifyH("LEFT")
				if not textName:IsShown() then textName:Show() end
			end
		elseif VCBsettings["Target"]["NameText"]["Position"] == G.OPTIONS_P_TOP then
			function namePosition(self)
				textName:ClearAllPoints()
				textName:SetPoint("BOTTOM", self, "TOP", 0, -1)
				textName:SetJustifyH("CENTER")
				if not textName:IsShown() then textName:Show() end
			end
		elseif VCBsettings["Target"]["NameText"]["Position"] == G.OPTIONS_P_CENTER then
			function namePosition(self)
				textName:ClearAllPoints()
				textName:SetPoint("CENTER", self, "CENTER", 0, 1)
				textName:SetJustifyH("CENTER")
				if not textName:IsShown() then textName:Show() end
			end
		elseif VCBsettings["Target"]["NameText"]["Position"] == G.OPTIONS_P_BOTTOM then
			function namePosition(self)
				textName:ClearAllPoints()
				textName:SetPoint("TOP", self, "BOTTOM", 0, 2)
				textName:SetJustifyH("CENTER")
				if not textName:IsShown() then textName:Show() end
			end
		elseif VCBsettings["Target"]["NameText"]["Position"] == G.OPTIONS_P_TOPRIGHT then
			function namePosition(self)
				textName:ClearAllPoints()
				textName:SetPoint("BOTTOMRIGHT", self, "TOPRIGHT", -3, -1)
				textName:SetJustifyH("RIGHT")
				if not textName:IsShown() then textName:Show() end
			end
		elseif VCBsettings["Target"]["NameText"]["Position"] == G.OPTIONS_P_RIGHT then
			function namePosition(self)
				textName:ClearAllPoints()
				textName:SetPoint("RIGHT", self, "RIGHT", -4, 1)
				textName:SetJustifyH("RIGHT")
				if not textName:IsShown() then textName:Show() end
			end
		elseif VCBsettings["Target"]["NameText"]["Position"] == G.OPTIONS_P_BOTTOMRIGHT then
			function namePosition(self)
				textName:ClearAllPoints()
				textName:SetPoint("TOPRIGHT", self, "BOTTOMRIGHT", -5, 2)
				textName:SetJustifyH("RIGHT")
				if not textName:IsShown() then textName:Show() end
			end
		end
	end
-- total time --
	function chkTotalTxtTarget()
		if VCBsettings["Target"]["TotalTimeText"]["Position"] == G.OPTIONS_V_HIDE then
			function totalPostion(self)
				if textTotal:IsShown() then textTotal:Hide() end
			end
		elseif VCBsettings["Target"]["TotalTimeText"]["Position"] == G.OPTIONS_P_TOPLEFT then
			function totalPostion(self)
				textTotal:ClearAllPoints()
				textTotal:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 3, -1)
				if not textTotal:IsShown() then textTotal:Show() end
			end
		elseif VCBsettings["Target"]["TotalTimeText"]["Position"] == G.OPTIONS_P_LEFT then
			function totalPostion(self)
				textTotal:ClearAllPoints()
				textTotal:SetPoint("LEFT", self, "LEFT", 4, 1)
				if not textTotal:IsShown() then textTotal:Show() end
			end
		elseif VCBsettings["Target"]["TotalTimeText"]["Position"] == G.OPTIONS_P_BOTTOMLEFT then
			function totalPostion(self)
				textTotal:ClearAllPoints()
				textTotal:SetPoint("TOPLEFT", self, "BOTTOMLEFT", 5, 2)
				if not textTotal:IsShown() then textTotal:Show() end
			end
		elseif VCBsettings["Target"]["TotalTimeText"]["Position"] == G.OPTIONS_P_TOP then
			function totalPostion(self)
				textTotal:ClearAllPoints()
				textTotal:SetPoint("BOTTOM", self, "TOP", 0, -1)
				if not textTotal:IsShown() then textTotal:Show() end
			end
		elseif VCBsettings["Target"]["TotalTimeText"]["Position"] == G.OPTIONS_P_CENTER then
			function totalPostion(self)
				textTotal:ClearAllPoints()
				textTotal:SetPoint("CENTER", self, "CENTER", 0, 1)
				if not textTotal:IsShown() then textTotal:Show() end
			end
		elseif VCBsettings["Target"]["TotalTimeText"]["Position"] == G.OPTIONS_P_BOTTOM then
			function totalPostion(self)
				textTotal:ClearAllPoints()
				textTotal:SetPoint("TOP", self, "BOTTOM", 0, 2)
				if not textTotal:IsShown() then textTotal:Show() end
			end
		elseif VCBsettings["Target"]["TotalTimeText"]["Position"] == G.OPTIONS_P_TOPRIGHT then
			function totalPostion(self)
				textTotal:ClearAllPoints()
				textTotal:SetPoint("BOTTOMRIGHT", self, "TOPRIGHT", -3, -1)
				if not textTotal:IsShown() then textTotal:Show() end
			end
		elseif VCBsettings["Target"]["TotalTimeText"]["Position"] == G.OPTIONS_P_RIGHT then
			function totalPostion(self)
				textTotal:ClearAllPoints()
				textTotal:SetPoint("RIGHT", self, "RIGHT", -4, 1)
				if not textTotal:IsShown() then textTotal:Show() end
			end
		elseif VCBsettings["Target"]["TotalTimeText"]["Position"] == G.OPTIONS_P_BOTTOMRIGHT then
			function totalPostion(self)
				textTotal:ClearAllPoints()
				textTotal:SetPoint("TOPRIGHT", self, "BOTTOMRIGHT", -5, 2)
				if not textTotal:IsShown() then textTotal:Show() end
			end
		end
	end
-- current time --
	function chkCurrentTxtTarget()
		if VCBsettings["Target"]["CurrentTimeText"]["Position"] == G.OPTIONS_V_HIDE then
			function currentPostion(self)
				if textCurrent:IsShown() then textCurrent:Hide() end
			end
		elseif VCBsettings["Target"]["CurrentTimeText"]["Position"] == G.OPTIONS_P_TOPLEFT then
			function currentPostion(self)
				textCurrent:ClearAllPoints()
				textCurrent:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 3, -1)
				if not textCurrent:IsShown() then textCurrent:Show() end
			end
		elseif VCBsettings["Target"]["CurrentTimeText"]["Position"] == G.OPTIONS_P_LEFT then
			function currentPostion(self)
				textCurrent:ClearAllPoints()
				textCurrent:SetPoint("LEFT", self, "LEFT", 4, 1)
				if not textCurrent:IsShown() then textCurrent:Show() end
			end
		elseif VCBsettings["Target"]["CurrentTimeText"]["Position"] == G.OPTIONS_P_BOTTOMLEFT then
			function currentPostion(self)
				textCurrent:ClearAllPoints()
				textCurrent:SetPoint("TOPLEFT", self, "BOTTOMLEFT", 5, 2)
				if not textCurrent:IsShown() then textCurrent:Show() end
			end
		elseif VCBsettings["Target"]["CurrentTimeText"]["Position"] == G.OPTIONS_P_TOP then
			function currentPostion(self)
				textCurrent:ClearAllPoints()
				textCurrent:SetPoint("BOTTOM", self, "TOP", 0, -1)
				if not textCurrent:IsShown() then textCurrent:Show() end
			end
		elseif VCBsettings["Target"]["CurrentTimeText"]["Position"] == G.OPTIONS_P_CENTER then
			function currentPostion(self)
				textCurrent:ClearAllPoints()
				textCurrent:SetPoint("CENTER", self, "CENTER", 0, 1)
				if not textCurrent:IsShown() then textCurrent:Show() end
			end
		elseif VCBsettings["Target"]["CurrentTimeText"]["Position"] == G.OPTIONS_P_BOTTOM then
			function currentPostion(self)
				textCurrent:ClearAllPoints()
				textCurrent:SetPoint("TOP", self, "BOTTOM", 0, 2)
				if not textCurrent:IsShown() then textCurrent:Show() end
			end
		elseif VCBsettings["Target"]["CurrentTimeText"]["Position"] == G.OPTIONS_P_TOPRIGHT then
			function currentPostion(self)
				textCurrent:ClearAllPoints()
				textCurrent:SetPoint("BOTTOMRIGHT", self, "TOPRIGHT", -3, -1)
				if not textCurrent:IsShown() then textCurrent:Show() end
			end
		elseif VCBsettings["Target"]["CurrentTimeText"]["Position"] == G.OPTIONS_P_RIGHT then
			function currentPostion(self)
				textCurrent:ClearAllPoints()
				textCurrent:SetPoint("RIGHT", self, "RIGHT", -4, 1)
				if not textCurrent:IsShown() then textCurrent:Show() end
			end
		elseif VCBsettings["Target"]["CurrentTimeText"]["Position"] == G.OPTIONS_P_BOTTOMRIGHT then
			function currentPostion(self)
				textCurrent:ClearAllPoints()
				textCurrent:SetPoint("TOPRIGHT", self, "BOTTOMRIGHT", -5, 2)
				if not textCurrent:IsShown() then textCurrent:Show() end
			end
		end
	end
-- both time --
	function chkBothTxtTarget()
		if VCBsettings["Target"]["BothTimeText"]["Position"] == G.OPTIONS_V_HIDE then
			function bothPostion(self)
				if textBoth:IsShown() then textBoth:Hide() end
			end
		elseif VCBsettings["Target"]["BothTimeText"]["Position"] == G.OPTIONS_P_TOPLEFT then
			function bothPostion(self)
				textBoth:ClearAllPoints()
				textBoth:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 3, -1)
				if not textBoth:IsShown() then textBoth:Show() end
			end
		elseif VCBsettings["Target"]["BothTimeText"]["Position"] == G.OPTIONS_P_LEFT then
			function bothPostion(self)
				textBoth:ClearAllPoints()
				textBoth:SetPoint("LEFT", self, "LEFT", 4, 1)
				if not textBoth:IsShown() then textBoth:Show() end
			end
		elseif VCBsettings["Target"]["BothTimeText"]["Position"] == G.OPTIONS_P_BOTTOMLEFT then
			function bothPostion(self)
				textBoth:ClearAllPoints()
				textBoth:SetPoint("TOPLEFT", self, "BOTTOMLEFT", 5, 2)
				if not textBoth:IsShown() then textBoth:Show() end
			end
		elseif VCBsettings["Target"]["BothTimeText"]["Position"] == G.OPTIONS_P_TOP then
			function bothPostion(self)
				textBoth:ClearAllPoints()
				textBoth:SetPoint("BOTTOM", self, "TOP", 0, -1)
				if not textBoth:IsShown() then textBoth:Show() end
			end
		elseif VCBsettings["Target"]["BothTimeText"]["Position"] == G.OPTIONS_P_CENTER then
			function bothPostion(self)
				textBoth:ClearAllPoints()
				textBoth:SetPoint("CENTER", self, "CENTER", 0, 1)
				if not textBoth:IsShown() then textBoth:Show() end
			end
		elseif VCBsettings["Target"]["BothTimeText"]["Position"] == G.OPTIONS_P_BOTTOM then
			function bothPostion(self)
				textBoth:ClearAllPoints()
				textBoth:SetPoint("TOP", self, "BOTTOM", 0, 2)
				if not textBoth:IsShown() then textBoth:Show() end
			end
		elseif VCBsettings["Target"]["BothTimeText"]["Position"] == G.OPTIONS_P_TOPRIGHT then
			function bothPostion(self)
				textBoth:ClearAllPoints()
				textBoth:SetPoint("BOTTOMRIGHT", self, "TOPRIGHT", -3, -1)
				if not textBoth:IsShown() then textBoth:Show() end
			end
		elseif VCBsettings["Target"]["BothTimeText"]["Position"] == G.OPTIONS_P_RIGHT then
			function bothPostion(self)
				textBoth:ClearAllPoints()
				textBoth:SetPoint("RIGHT", self, "RIGHT", -4, 1)
				if not textBoth:IsShown() then textBoth:Show() end
			end
		elseif VCBsettings["Target"]["BothTimeText"]["Position"] == G.OPTIONS_P_BOTTOMRIGHT then
			function bothPostion(self)
				textBoth:ClearAllPoints()
				textBoth:SetPoint("TOPRIGHT", self, "BOTTOMRIGHT", -5, 2)
				if not textBoth:IsShown() then textBoth:Show() end
			end
		end
	end
end
-- update functions --
local function GlobalFunctionsUPD()
-- current time --
	function chkCurrentUpdTarget()
		if VCBsettings["Target"]["CurrentTimeText"]["Position"] ~= G.OPTIONS_V_HIDE then
			if VCBsettings["Target"]["CurrentTimeText"]["Sec"] == G.OPTIONS_V_HIDE then
				if VCBsettings["Target"]["CurrentTimeText"]["Decimals"] == "0" then
					function currentUpdate(self)
						textCurrent:SetFormattedText("%.0f", self.value)
					end
				elseif VCBsettings["Target"]["CurrentTimeText"]["Decimals"] == "1" then
					function currentUpdate(self)
						textCurrent:SetFormattedText("%.1f", self.value)
					end
				elseif VCBsettings["Target"]["CurrentTimeText"]["Decimals"] == "2" then
					function currentUpdate(self)
						textCurrent:SetFormattedText("%.2f", self.value)
					end
				elseif VCBsettings["Target"]["CurrentTimeText"]["Decimals"] == "3" then
					function currentUpdate(self)
						textCurrent:SetFormattedText("%.3f", self.value)
					end
				end
			elseif VCBsettings["Target"]["CurrentTimeText"]["Sec"] == G.OPTIONS_V_SHOW then
				if VCBsettings["Target"]["CurrentTimeText"]["Decimals"] == "0" then
					function currentUpdate(self)
						textCurrent:SetFormattedText("%.0f Sec", self.value)
					end
				elseif VCBsettings["Target"]["CurrentTimeText"]["Decimals"] == "1" then
					function currentUpdate(self)
						textCurrent:SetFormattedText("%.1f Sec", self.value)
					end
				elseif VCBsettings["Target"]["CurrentTimeText"]["Decimals"] == "2" then
					function currentUpdate(self)
						textCurrent:SetFormattedText("%.2f Sec", self.value)
					end
				elseif VCBsettings["Target"]["CurrentTimeText"]["Decimals"] == "3" then
					function currentUpdate(self)
						textCurrent:SetFormattedText("%.3f Sec", self.value)
					end
				end
			end
		else
			function currentUpdate(self)
				return
			end
		end
	end
-- both time --
	function chkBothUpdTarget()
		if VCBsettings["Target"]["BothTimeText"]["Position"] ~= G.OPTIONS_V_HIDE then
			if VCBsettings["Target"]["BothTimeText"]["Sec"] == G.OPTIONS_V_HIDE then
				if VCBsettings["Target"]["BothTimeText"]["Decimals"] == "0" then
					function bothUpdate(self)
						textBoth:SetFormattedText("%.0f/%.0f", self.value, self.maxValue)
					end
				elseif VCBsettings["Target"]["BothTimeText"]["Decimals"] == "1" then
					function bothUpdate(self)
						textBoth:SetFormattedText("%.1f/%.1f", self.value, self.maxValue)
					end
				elseif VCBsettings["Target"]["BothTimeText"]["Decimals"] == "2" then
					function bothUpdate(self)
						textBoth:SetFormattedText("%.2f/%.2f", self.value, self.maxValue)
					end
				elseif VCBsettings["Target"]["BothTimeText"]["Decimals"] == "3" then
					function bothUpdate(self)
						textBoth:SetFormattedText("%.3f/%.3f", self.value, self.maxValue)
					end
				end
			elseif VCBsettings["Target"]["BothTimeText"]["Sec"] == G.OPTIONS_V_SHOW then
				if VCBsettings["Target"]["BothTimeText"]["Decimals"] == "0" then
					function bothUpdate(self)
						textBoth:SetFormattedText("%.0f/%.0f Sec", self.value, self.maxValue)
					end
				elseif VCBsettings["Target"]["BothTimeText"]["Decimals"] == "1" then
					function bothUpdate(self)
						textBoth:SetFormattedText("%.1f/%.1f Sec", self.value, self.maxValue)
					end
				elseif VCBsettings["Target"]["BothTimeText"]["Decimals"] == "2" then
					function bothUpdate(self)
						textBoth:SetFormattedText("%.2f/%.2f Sec", self.value, self.maxValue)
					end
				elseif VCBsettings["Target"]["BothTimeText"]["Decimals"] == "3" then
					function bothUpdate(self)
						textBoth:SetFormattedText("%.3f/%.3f Sec", self.value, self.maxValue)
					end
				end
			end
		else
			function bothUpdate(self)
				return
			end
		end
	end
-- total time --
	function chkTotalUpdTarget()
		if VCBsettings["Target"]["TotalTimeText"]["Position"] ~= G.OPTIONS_V_HIDE then
			if VCBsettings["Target"]["TotalTimeText"]["Sec"] == G.OPTIONS_V_HIDE then
				if VCBsettings["Target"]["TotalTimeText"]["Decimals"] == "0" then
					function totalUpdate(self)
						textTotal:SetFormattedText("%.0f", self.maxValue)
					end
				elseif VCBsettings["Target"]["TotalTimeText"]["Decimals"] == "1" then
					function totalUpdate(self)
						textTotal:SetFormattedText("%.1f", self.maxValue)
					end
				elseif VCBsettings["Target"]["TotalTimeText"]["Decimals"] == "2" then
					function totalUpdate(self)
						textTotal:SetFormattedText("%.2f", self.maxValue)
					end
				elseif VCBsettings["Target"]["TotalTimeText"]["Decimals"] == "3" then
					function totalUpdate(self)
						textTotal:SetFormattedText("%.3f", self.maxValue)
					end
				end
			elseif VCBsettings["Target"]["TotalTimeText"]["Sec"] == G.OPTIONS_V_SHOW then
				if VCBsettings["Target"]["TotalTimeText"]["Decimals"] == "0" then
					function totalUpdate(self)
						textTotal:SetFormattedText("%.0f sec", self.maxValue)
					end
				elseif VCBsettings["Target"]["TotalTimeText"]["Decimals"] == "1" then
					function totalUpdate(self)
						textTotal:SetFormattedText("%.1f sec", self.maxValue)
					end
				elseif VCBsettings["Target"]["TotalTimeText"]["Decimals"] == "2" then
					function totalUpdate(self)
						textTotal:SetFormattedText("%.2f sec", self.maxValue)
					end
				elseif VCBsettings["Target"]["TotalTimeText"]["Decimals"] == "3" then
					function totalUpdate(self)
						textTotal:SetFormattedText("%.3f sec", self.maxValue)
					end
				end
			end
		elseif VCBsettings["Target"]["TotalTimeText"]["Position"] == G.OPTIONS_V_HIDE then
			function totalUpdate(self)
				return
			end
		end
	end
end
-- color function --
local function GlobalFunctionsCLR()
	function chkCastbarColorTarget()
		if VCBsettings["Target"]["StatusBar"]["Color"] == G.OPTIONS_C_DEFAULT then
			function castbarColor(self)
				self:SetStatusBarDesaturated(false)
				self:SetStatusBarColor(1, 1, 1, 1)
				self.Spark:SetDesaturated(false)
				self.Spark:SetVertexColor(1, 1, 1, 1)
				self.Flash:SetDesaturated(false)
				self.Flash:SetVertexColor(1, 1, 1, 1)
			end
		elseif VCBsettings["Target"]["StatusBar"]["Color"] == G.OPTIONS_C_CLASS then
			function castbarColor(self)
				if self.barType == "standard" or self.barType == "channel" or self.barType == "uninterruptable" then
					self:SetStatusBarDesaturated(true)
					self:SetStatusBarColor(vcbClassColorTarget:GetRGB())
					self.Spark:SetDesaturated(true)
					self.Spark:SetVertexColor(vcbClassColorTarget:GetRGB())
					self.Flash:SetDesaturated(true)
					self.Flash:SetVertexColor(vcbClassColorTarget:GetRGB())
				else
					self:SetStatusBarDesaturated(false)
					self:SetStatusBarColor(1, 1, 1, 1)
					self.Spark:SetDesaturated(false)
					self.Spark:SetVertexColor(1, 1, 1, 1)
					self.Flash:SetDesaturated(false)
					self.Flash:SetVertexColor(1, 1, 1, 1)
				end
			end
		end
	end
	function chkBorderColorTarget()
		if VCBsettings["Target"]["Border"]["Color"] == G.OPTIONS_C_DEFAULT then
			function borderColor(self)
				self.Background:SetVertexColor(1, 1, 1, 1)
				self.Border:SetVertexColor(1, 1, 1, 1)
				self.TextBorder:SetVertexColor(1, 1, 1, 1)
			end
		elseif VCBsettings["Target"]["Border"]["Color"] == G.OPTIONS_C_CLASS then
			function borderColor(self)
				self.Background:SetVertexColor(vcbClassColorTarget:GetRGB())
				self.Border:SetVertexColor(vcbClassColorTarget:GetRGB())
				self.TextBorder:SetVertexColor(vcbClassColorTarget:GetRGB())
			end
		end
	end
end
-- position bar --
local function positionBar(self)
	self:SetScale(VCBsettings["Target"]["Scale"]/100)
	self:ClearAllPoints()
	self:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", VCBsettings["Target"]["Position"]["X"], VCBsettings["Target"]["Position"]["Y"])
end
-- Events Time --
local function EventsTime(self, event, arg1, arg2, arg3, arg4)
	if event == "PLAYER_LOGIN" then
		ProtectOptions()
		GlobalFunctionsCHK()
		GlobalFunctionsUPD()
		GlobalFunctionsCLR()
		chkIconTarget()
		chkNameTxtTarget()
		chkCurrentTxtTarget()
		chkBothTxtTarget()
		chkTotalTxtTarget()
		chkCurrentUpdTarget()
		chkBothUpdTarget()
		chkTotalUpdTarget()
		chkCastbarColorTarget()
		chkBorderColorTarget()
-- hook part 1 --
			TargetFrameSpellBar:HookScript("OnShow", function(self)
				textName:SetWidth(self:GetWidth() - 8)
				namePosition(self)
				currentPostion(self)
				bothPostion(self)
				totalPostion(self)
			end)
-- hook part 2 --
		if VCBsettings["Target"]["Lock"] == G.OPTIONS_LS_UNLOCKED then
			TargetFrameSpellBar:HookScript("OnUpdate", function(self)
				positionBar(self)
			end)
		end
		TargetFrameSpellBar:HookScript("OnUpdate", function(self)
			if self.value ~= nil and self.maxValue ~= nil then
				self.Text:SetAlpha(0)
				textName:SetText(self.Text:GetText())
				iconPosition(self)
				currentUpdate(self)
				bothUpdate(self)
				totalUpdate(self)
				castbarColor(self)
				borderColor(self)
			end
		end)
	elseif event == "PLAYER_TARGET_CHANGED" then
		if TargetFrame:IsShown() then
			local classFilename = UnitClassBase("target")
			if classFilename ~= nil then vcbClassColorTarget = C_ClassColor.GetClassColor(classFilename) end
		end
	end
end
vcbZlave:HookScript("OnEvent", EventsTime)
