-- =========================
-- some variables
-- =========================
local G = VDW.Local.Override
local jailerColor = CreateColorFromRGBAHexString("0A979CFF")
-- =========================
-- extra textures
-- =========================
local function createTextures()
-- icon spell left
	VDW.VCB.ArenaIconSpellLeft1 = CompactArenaFrameMember1.CastingBarFrame:CreateTexture(nil, "ARTWORK", nil, 0)
	VDW.VCB.ArenaIconSpellLeft1:SetPoint("RIGHT", CompactArenaFrameMember1.CastingBarFrame, "LEFT", -2, -5)
	VDW.VCB.ArenaIconSpellLeft1:SetSize(20, 20)
	VDW.VCB.ArenaIconSpellLeft2 = CompactArenaFrameMember2.CastingBarFrame:CreateTexture(nil, "ARTWORK", nil, 0)
	VDW.VCB.ArenaIconSpellLeft2:SetPoint("RIGHT", CompactArenaFrameMember2.CastingBarFrame, "LEFT", -2, -5)
	VDW.VCB.ArenaIconSpellLeft2:SetSize(20, 20)
	VDW.VCB.ArenaIconSpellLeft3  = CompactArenaFrameMember3.CastingBarFrame:CreateTexture(nil, "ARTWORK", nil, 0)
	VDW.VCB.ArenaIconSpellLeft3:SetPoint("RIGHT", CompactArenaFrameMember3.CastingBarFrame, "LEFT", -2, -5)
	VDW.VCB.ArenaIconSpellLeft3:SetSize(20, 20)
-- icon spell right
	VDW.VCB.ArenaIconSpellRight1 = CompactArenaFrameMember1.CastingBarFrame:CreateTexture(nil, "ARTWORK", nil, 0)
	VDW.VCB.ArenaIconSpellRight1:SetPoint("LEFT", CompactArenaFrameMember1.CastingBarFrame, "RIGHT", 4, -5)
	VDW.VCB.ArenaIconSpellRight1:SetSize(20, 20)
	VDW.VCB.ArenaIconSpellRight2 = CompactArenaFrameMember2.CastingBarFrame:CreateTexture(nil, "ARTWORK", nil, 0)
	VDW.VCB.ArenaIconSpellRight2:SetPoint("LEFT", CompactArenaFrameMember2.CastingBarFrame, "RIGHT", 4, -5)
	VDW.VCB.ArenaIconSpellRight2:SetSize(20, 20)
	VDW.VCB.ArenaIconSpellRight3  = CompactArenaFrameMember3.CastingBarFrame:CreateTexture(nil, "ARTWORK", nil, 0)
	VDW.VCB.ArenaIconSpellRight3:SetPoint("LEFT", CompactArenaFrameMember3.CastingBarFrame, "RIGHT", 4, -5)
	VDW.VCB.ArenaIconSpellRight3:SetSize(20, 20)
-- shield icon left
	VDW.VCB.ArenaIconShieldLeft1 = CompactArenaFrameMember1.CastingBarFrame:CreateTexture(nil, "BACKGROUND", nil, 0)
	VDW.VCB.ArenaIconShieldLeft1:SetPoint("TOPLEFT", -27, 4)
	VDW.VCB.ArenaIconShieldLeft1:SetSize(29, 33)
	VDW.VCB.ArenaIconShieldLeft1:SetAtlas("ui-castingbar-shield")
	VDW.VCB.ArenaIconShieldLeft2 = CompactArenaFrameMember2.CastingBarFrame:CreateTexture(nil, "BACKGROUND", nil, 0)
	VDW.VCB.ArenaIconShieldLeft2:SetPoint("TOPLEFT", -27, 4)
	VDW.VCB.ArenaIconShieldLeft2:SetSize(29, 33)
	VDW.VCB.ArenaIconShieldLeft2:SetAtlas("ui-castingbar-shield")
	VDW.VCB.ArenaIconShieldLeft3  = CompactArenaFrameMember3.CastingBarFrame:CreateTexture(nil, "BACKGROUND", nil, 0)
	VDW.VCB.ArenaIconShieldLeft3:SetPoint("TOPLEFT", -27, 4)
	VDW.VCB.ArenaIconShieldLeft3:SetSize(29, 33)
	VDW.VCB.ArenaIconShieldLeft3:SetAtlas("ui-castingbar-shield")
-- shield icon right
	VDW.VCB.ArenaIconShieldRight1 = CompactArenaFrameMember1.CastingBarFrame:CreateTexture(nil, "BACKGROUND", nil, 0)
	VDW.VCB.ArenaIconShieldRight1:SetPoint("TOPRIGHT", 27, 4)
	VDW.VCB.ArenaIconShieldRight1:SetSize(29, 33)
	VDW.VCB.ArenaIconShieldRight1:SetAtlas("ui-castingbar-shield")
	VDW.VCB.ArenaIconShieldRight2 = CompactArenaFrameMember2.CastingBarFrame:CreateTexture(nil, "BACKGROUND", nil, 0)
	VDW.VCB.ArenaIconShieldRight2:SetPoint("TOPRIGHT", 27, 4)
	VDW.VCB.ArenaIconShieldRight2:SetSize(29, 33)
	VDW.VCB.ArenaIconShieldRight2:SetAtlas("ui-castingbar-shield")
	VDW.VCB.ArenaIconShieldRight3 = CompactArenaFrameMember3.CastingBarFrame:CreateTexture(nil, "BACKGROUND", nil, 0)
	VDW.VCB.ArenaIconShieldRight3:SetPoint("TOPRIGHT", 27, 4)
	VDW.VCB.ArenaIconShieldRight3:SetSize(29, 33)
	VDW.VCB.ArenaIconShieldRight3:SetAtlas("ui-castingbar-shield")
-- Text Border Top
	VDW.VCB.ArenaTextBorderTop1 = CompactArenaFrameMember1.CastingBarFrame:CreateTexture(nil, "BACKGROUND", nil, -7)
	VDW.VCB.ArenaTextBorderTop1:SetPoint("TOPLEFT", 0, 12)
	VDW.VCB.ArenaTextBorderTop1:SetPoint("BOTTOMRIGHT", 0, 0)
	VDW.VCB.ArenaTextBorderTop1:SetAtlas("ui-castingbar-textbox")
	VDW.VCB.ArenaTextBorderTop2 = CompactArenaFrameMember2.CastingBarFrame:CreateTexture(nil, "BACKGROUND", nil, -7)
	VDW.VCB.ArenaTextBorderTop2:SetPoint("TOPLEFT", 0, 12)
	VDW.VCB.ArenaTextBorderTop2:SetPoint("BOTTOMRIGHT", 0, 0)
	VDW.VCB.ArenaTextBorderTop2:SetAtlas("ui-castingbar-textbox")
	VDW.VCB.ArenaTextBorderTop3 = CompactArenaFrameMember3.CastingBarFrame:CreateTexture(nil, "BACKGROUND", nil, -7)
	VDW.VCB.ArenaTextBorderTop3:SetPoint("TOPLEFT", 0, 12)
	VDW.VCB.ArenaTextBorderTop3:SetPoint("BOTTOMRIGHT", 0, 0)
	VDW.VCB.ArenaTextBorderTop3:SetAtlas("ui-castingbar-textbox")
-- Text Border Bottom
	VDW.VCB.ArenaTextBorderBottom1 = CompactArenaFrameMember1.CastingBarFrame:CreateTexture(nil, "BACKGROUND", nil, -7)
	VDW.VCB.ArenaTextBorderBottom1:SetPoint("TOPLEFT", 0, 0)
	VDW.VCB.ArenaTextBorderBottom1:SetPoint("BOTTOMRIGHT", 0, -12)
	VDW.VCB.ArenaTextBorderBottom1:SetAtlas("ui-castingbar-textbox")
	VDW.VCB.ArenaTextBorderBottom2 = CompactArenaFrameMember2.CastingBarFrame:CreateTexture(nil, "BACKGROUND", nil, -7)
	VDW.VCB.ArenaTextBorderBottom2:SetPoint("TOPLEFT", 0, 0)
	VDW.VCB.ArenaTextBorderBottom2:SetPoint("BOTTOMRIGHT", 0, -12)
	VDW.VCB.ArenaTextBorderBottom2:SetAtlas("ui-castingbar-textbox")
	VDW.VCB.ArenaTextBorderBottom3 = CompactArenaFrameMember3.CastingBarFrame:CreateTexture(nil, "BACKGROUND", nil, -7)
	VDW.VCB.ArenaTextBorderBottom3:SetPoint("TOPLEFT", 0, 0)
	VDW.VCB.ArenaTextBorderBottom3:SetPoint("BOTTOMRIGHT", 0, -12)
end
-- =========================
-- extra texts
-- =========================
-- function for the texts
local function createTexts()
VDW.VCB.ArenaTextName1 = CompactArenaFrameMember1.CastingBarFrame:CreateFontString(nil, "OVERLAY", nil)
	VDW.VCB.ArenaTextName1:SetFontObject("GameFontHighlightSmall")
	VDW.VCB.ArenaTextName2 = CompactArenaFrameMember2.CastingBarFrame:CreateFontString(nil, "OVERLAY", nil)
	VDW.VCB.ArenaTextName2:SetFontObject("GameFontHighlightSmall")
	VDW.VCB.ArenaTextName3 = CompactArenaFrameMember3.CastingBarFrame:CreateFontString(nil, "OVERLAY", nil)
	VDW.VCB.ArenaTextName3:SetFontObject("GameFontHighlightSmall")
	
	VDW.VCB.ArenaTextCurrent1 = CompactArenaFrameMember1.CastingBarFrame:CreateFontString(nil, "OVERLAY", nil)
	VDW.VCB.ArenaTextCurrent1:SetFontObject("GameFontHighlightSmall")
	VDW.VCB.ArenaTextCurrent2 = CompactArenaFrameMember2.CastingBarFrame:CreateFontString(nil, "OVERLAY", nil)
	VDW.VCB.ArenaTextCurrent2:SetFontObject("GameFontHighlightSmall")
	VDW.VCB.ArenaTextCurrent3 = CompactArenaFrameMember3.CastingBarFrame:CreateFontString(nil, "OVERLAY", nil)
	VDW.VCB.ArenaTextCurrent3:SetFontObject("GameFontHighlightSmall")
	
	VDW.VCB.ArenaTextBoth1 = CompactArenaFrameMember1.CastingBarFrame:CreateFontString(nil, "OVERLAY", nil)
	VDW.VCB.ArenaTextBoth1:SetFontObject("GameFontHighlightSmall")
	VDW.VCB.ArenaTextBoth2 = CompactArenaFrameMember2.CastingBarFrame:CreateFontString(nil, "OVERLAY", nil)
	VDW.VCB.ArenaTextBoth2:SetFontObject("GameFontHighlightSmall")
	VDW.VCB.ArenaTextBoth3 = CompactArenaFrameMember3.CastingBarFrame:CreateFontString(nil, "OVERLAY", nil)
	VDW.VCB.ArenaTextBoth3:SetFontObject("GameFontHighlightSmall")
	
	VDW.VCB.ArenaTextTotal1 = CompactArenaFrameMember1.CastingBarFrame:CreateFontString(nil, "OVERLAY", nil)
	VDW.VCB.ArenaTextTotal1:SetFontObject("GameFontHighlightSmall")
	VDW.VCB.ArenaTextTotal2 = CompactArenaFrameMember2.CastingBarFrame:CreateFontString(nil, "OVERLAY", nil)
	VDW.VCB.ArenaTextTotal2:SetFontObject("GameFontHighlightSmall")
	VDW.VCB.ArenaTextTotal3 = CompactArenaFrameMember3.CastingBarFrame:CreateFontString(nil, "OVERLAY", nil)
	VDW.VCB.ArenaTextTotal3:SetFontObject("GameFontHighlightSmall")
end
-- =========================
-- functions protect the options
-- =========================
local function ProtectOptions()
	local loc = GetLocale()
	if loc ~= VCBspecialSettings["LastLocation"] then
		for k, v in pairs(VDW.Local.Translate) do
			for i, s in pairs (v) do
				if VCBsettings.Arena.Icon.Position == s then
					VCBsettings.Arena.Icon.Position = VDW.Local.Translate[loc][i]
				end
				if VCBsettings.Arena.Shield.Position == s then
					VCBsettings.Arena.Shield.Position = VDW.Local.Translate[loc][i]
				end
				if VCBsettings.Arena.TextBorder.Position == s then
					VCBsettings.Arena.TextBorder.Position = VDW.Local.Translate[loc][i]
				end
				if VCBsettings.Arena.NameText.Position == s then
					VCBsettings.Arena.NameText.Position = VDW.Local.Translate[loc][i]
				end
				if VCBsettings.Arena.CurrentTimeText.Position == s then
					VCBsettings.Arena.CurrentTimeText.Position = VDW.Local.Translate[loc][i]
				end
				if VCBsettings.Arena.BothTimeText.Position == s then
					VCBsettings.Arena.BothTimeText.Position = VDW.Local.Translate[loc][i]
				end
				if VCBsettings.Arena.TotalTimeText.Position == s then
					VCBsettings.Arena.TotalTimeText.Position = VDW.Local.Translate[loc][i]
				end
				if VCBsettings.Arena.CurrentTimeText.Direction == s then
					VCBsettings.Arena.CurrentTimeText.Direction = VDW.Local.Translate[loc][i]
				end
				if VCBsettings.Arena.BothTimeText.Direction == s then
					VCBsettings.Arena.BothTimeText.Direction = VDW.Local.Translate[loc][i]
				end
				if VCBsettings.Arena.CurrentTimeText.Sec == s then
					VCBsettings.Arena.CurrentTimeText.Sec = VDW.Local.Translate[loc][i]
				end
				if VCBsettings.Arena.BothTimeText.Sec == s then
					VCBsettings.Arena.BothTimeText.Sec = VDW.Local.Translate[loc][i]
				end
				if VCBsettings.Arena.TotalTimeText.Sec == s then
					VCBsettings.Arena.TotalTimeText.Sec = VDW.Local.Translate[loc][i]
				end
				if VCBsettings.Arena.StatusBar.Color == s then
					VCBsettings.Arena.StatusBar.Color = VDW.Local.Translate[loc][i]
				end
				if VCBsettings.Arena.StatusBar.Style == s then
					VCBsettings.Arena.StatusBar.Style = VDW.Local.Translate[loc][i]
				end
				if VCBsettings.Arena.Border.Color == s then
					VCBsettings.Arena.Border.Color = VDW.Local.Translate[loc][i]
				end
				if VCBsettings.Arena.Border.Style == s then
					VCBsettings.Arena.Border.Style = VDW.Local.Translate[loc][i]
				end
			end
		end
	end
end
-- =========================
-- functions OnUpdate and OnShow
-- =========================
-- icon position
local function iconPosition(i)
	print("iconPosition is not Working!")
end
-- shield icon position
local function shieldPosition(uninterruptible, i)
	print("shieldPosition is not Working!")
end
-- border text position
local function bordertextPosition (i)
	print("bordertextPosition is not Working!")
end
-- name position
local function namePosition(self, i)
	print("namePosition is not Working!")
end
-- current time position
local function currentPostion(self, i)
	print("currentPostion is not Working!")
end
-- both time position
local function bothPostion(self, i)
	print("bothPostion is not Working!")
end
-- total time position
local function totalPostion(self, i)
	print("totalPostion is not Working!")
end
-- current time update
local function currentUpdate(i)
	print("currentUpdate is not Working!")
end
-- both time update
local function bothUpdate(i)
	print("bothUpdate is not Working!")
end
-- total time update
local function totalUpdate(i)
	print("totalUpdate is not Working!")
end
-- status bar color
local function statusbarColor(self, i)
	print("statusbarColor is not Working!")
end
-- border color
local function borderColor(self, i)
	print("borderColor is not Working!")
end
-- status bar style
local function statusbarStyle(self)
	print("statusbarStyle is not Working!")
end
-- border bar style
local function borderStyle(self)
	print("borderStyle is not Working!")
end
-- =========================
-- checking position functions
-- =========================
-- check icon
function VDW.VCB.chkArenaIconPosition()
	if VCBsettings["Arena"]["Icon"]["Position"] == G.OPTIONS_V_HIDE then
		function iconPosition(i)
			if VDW.VCB["ArenaIconSpellLeft"..i]:IsShown() then VDW.VCB["ArenaIconSpellLeft"..i]:Hide() end
			if VDW.VCB["ArenaIconSpellRight"..i]:IsShown() then VDW.VCB["ArenaIconSpellRight"..i]:Hide() end
		end
	elseif VCBsettings["Arena"]["Icon"]["Position"] == G.OPTIONS_P_LEFT then
		function iconPosition(i)
			if not VDW.VCB["ArenaIconSpellLeft"..i]:IsShown() then VDW.VCB["ArenaIconSpellLeft"..i]:Show() end
			if VDW.VCB["ArenaIconSpellRight"..i]:IsShown() then VDW.VCB["ArenaIconSpellRight"..i]:Hide() end
		end
	elseif VCBsettings["Arena"]["Icon"]["Position"] == G.OPTIONS_P_RIGHT then
		function iconPosition(i)
			if VDW.VCB["ArenaIconSpellLeft"..i]:IsShown() then VDW.VCB["ArenaIconSpellLeft"..i]:Hide() end
			if not VDW.VCB["ArenaIconSpellRight"..i]:IsShown() then VDW.VCB["ArenaIconSpellRight"..i]:Show() end
		end
	elseif VCBsettings["Arena"]["Icon"]["Position"] == G.OPTIONS_P_BOTH then	
		function iconPosition(i)
			if not VDW.VCB["ArenaIconSpellLeft"..i]:IsShown() then VDW.VCB["ArenaIconSpellLeft"..i]:Show() end
			if not VDW.VCB["ArenaIconSpellRight"..i]:IsShown() then VDW.VCB["ArenaIconSpellRight"..i]:Show() end
		end
	end
end
-- check shield
function VDW.VCB.chkArenaShieldPosition()
	if VCBsettings.Arena.Shield.Position == G.OPTIONS_V_HIDE then
		function shieldPosition(uninterruptible, i)
			VDW.VCB["ArenaIconShieldLeft"..i]:SetAlpha(0)
			VDW.VCB["ArenaIconShieldRight"..i]:SetAlpha(0)
		end
	elseif VCBsettings.Arena.Shield.Position == G.OPTIONS_P_LEFT then
		function shieldPosition(uninterruptible, i)
			VDW.VCB["ArenaIconShieldLeft"..i]:SetAlphaFromBoolean(uninterruptible, 255, 0)
			VDW.VCB["ArenaIconShieldRight"..i]:SetAlpha(0)
		end
	elseif VCBsettings.Arena.Shield.Position == G.OPTIONS_P_RIGHT then
		function shieldPosition(uninterruptible, i)
			VDW.VCB["ArenaIconShieldLeft"..i]:SetAlpha(0)
			VDW.VCB["ArenaIconShieldRight"..i]:SetAlphaFromBoolean(uninterruptible, 255, 0)
		end
	elseif VCBsettings.Arena.Shield.Position == G.OPTIONS_P_BOTH then
		function shieldPosition(uninterruptible, i)
			VDW.VCB["ArenaIconShieldLeft"..i]:SetAlphaFromBoolean(uninterruptible, 255, 0)
			VDW.VCB["ArenaIconShieldRight"..i]:SetAlphaFromBoolean(uninterruptible, 255, 0)
		end
	end
end
-- check text border
function VDW.VCB.chkArenaBorderTextPosition()
	if VCBsettings.Arena.BorderText.Position == G.OPTIONS_V_HIDE then
		function bordertextPosition(i)
			VDW.VCB["ArenaTextBorderTop"..i]:Hide()
			VDW.VCB["ArenaTextBorderBottom"..i]:Hide()
		end
	elseif VCBsettings.Arena.BorderText.Position == G.OPTIONS_P_TOP then
		function bordertextPosition(i)
			VDW.VCB["ArenaTextBorderTop"..i]:Show()
			VDW.VCB["ArenaTextBorderBottom"..i]:Hide()
		end
	elseif VCBsettings.Arena.BorderText.Position == G.OPTIONS_P_BOTTOM then
		function bordertextPosition(i)
			VDW.VCB["ArenaTextBorderTop"..i]:Hide()
			VDW.VCB["ArenaTextBorderBottom"..i]:Show()
		end
	elseif VCBsettings.Arena.BorderText.Position == G.OPTIONS_P_BOTH then
		function bordertextPosition(i)
			VDW.VCB["ArenaTextBorderTop"..i]:Show()
			VDW.VCB["ArenaTextBorderBottom"..i]:Show()
		end
	end
end
-- check name text position
function VDW.VCB.chkNameTxtArena()
	if VCBsettings["Arena"]["NameText"]["Position"] == G.OPTIONS_V_HIDE then
		function namePosition(self, i)
			if VDW.VCB["ArenaTextName"..i]:IsShown() then VDW.VCB["ArenaTextName"..i]:Hide() end
		end
	elseif VCBsettings["Arena"]["NameText"]["Position"] == G.OPTIONS_P_TOPLEFT then
		function namePosition(self, i)
			VDW.VCB["ArenaTextName"..i]:ClearAllPoints()
			VDW.VCB["ArenaTextName"..i]:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 4, 1)
			VDW.VCB["ArenaTextName"..i]:SetJustifyH("LEFT")
			if not VDW.VCB["ArenaTextName"..i]:IsShown() then VDW.VCB["ArenaTextName"..i]:Show() end
		end
	elseif VCBsettings["Arena"]["NameText"]["Position"] == G.OPTIONS_P_LEFT then
		function namePosition(self, i)
			VDW.VCB["ArenaTextName"..i]:ClearAllPoints()
			VDW.VCB["ArenaTextName"..i]:SetPoint("LEFT", self, "LEFT", 4, 0)
			VDW.VCB["ArenaTextName"..i]:SetJustifyH("LEFT")
			if not VDW.VCB["ArenaTextName"..i]:IsShown() then VDW.VCB["ArenaTextName"..i]:Show() end
		end
	elseif VCBsettings["Arena"]["NameText"]["Position"] == G.OPTIONS_P_BOTTOMLEFT then
		function namePosition(self, i)
			VDW.VCB["ArenaTextName"..i]:ClearAllPoints()
			VDW.VCB["ArenaTextName"..i]:SetPoint("TOPLEFT", self, "BOTTOMLEFT", 4, -1)
			VDW.VCB["ArenaTextName"..i]:SetJustifyH("LEFT")
			if not VDW.VCB["ArenaTextName"..i]:IsShown() then VDW.VCB["ArenaTextName"..i]:Show() end
		end
	elseif VCBsettings["Arena"]["NameText"]["Position"] == G.OPTIONS_P_TOP then
		function namePosition(self, i)
			VDW.VCB["ArenaTextName"..i]:ClearAllPoints()
			VDW.VCB["ArenaTextName"..i]:SetPoint("BOTTOM", self, "TOP", 0, 1)
			VDW.VCB["ArenaTextName"..i]:SetJustifyH("CENTER")
			if not VDW.VCB["ArenaTextName"..i]:IsShown() then VDW.VCB["ArenaTextName"..i]:Show() end
			end
	elseif VCBsettings["Arena"]["NameText"]["Position"] == G.OPTIONS_P_CENTER then
		function namePosition(self, i)
			VDW.VCB["ArenaTextName"..i]:ClearAllPoints()
			VDW.VCB["ArenaTextName"..i]:SetPoint("CENTER", self, "CENTER", 0, 0)
			VDW.VCB["ArenaTextName"..i]:SetJustifyH("CENTER")
			if not VDW.VCB["ArenaTextName"..i]:IsShown() then VDW.VCB["ArenaTextName"..i]:Show() end
			end
	elseif VCBsettings["Arena"]["NameText"]["Position"] == G.OPTIONS_P_BOTTOM then
		function namePosition(self, i)
			VDW.VCB["ArenaTextName"..i]:ClearAllPoints()
			VDW.VCB["ArenaTextName"..i]:SetPoint("TOP", self, "BOTTOM", 0, -1)
			VDW.VCB["ArenaTextName"..i]:SetJustifyH("CENTER")
			if not VDW.VCB["ArenaTextName"..i]:IsShown() then VDW.VCB["ArenaTextName"..i]:Show() end
		end
	elseif VCBsettings["Arena"]["NameText"]["Position"] == G.OPTIONS_P_TOPRIGHT then
		function namePosition(self, i)
			VDW.VCB["ArenaTextName"..i]:ClearAllPoints()
			VDW.VCB["ArenaTextName"..i]:SetPoint("BOTTOMRIGHT", self, "TOPRIGHT", -4, 1)
			VDW.VCB["ArenaTextName"..i]:SetJustifyH("RIGHT")
			if not VDW.VCB["ArenaTextName"..i]:IsShown() then VDW.VCB["ArenaTextName"..i]:Show() end
		end
	elseif VCBsettings["Arena"]["NameText"]["Position"] == G.OPTIONS_P_RIGHT then
		function namePosition(self, i)
			VDW.VCB["ArenaTextName"..i]:ClearAllPoints()
			VDW.VCB["ArenaTextName"..i]:SetPoint("RIGHT", self, "RIGHT", -4, 0)
			VDW.VCB["ArenaTextName"..i]:SetJustifyH("RIGHT")
			if not VDW.VCB["ArenaTextName"..i]:IsShown() then VDW.VCB["ArenaTextName"..i]:Show() end
		end
	elseif VCBsettings["Arena"]["NameText"]["Position"] == G.OPTIONS_P_BOTTOMRIGHT then
		function namePosition(self, i)
			VDW.VCB["ArenaTextName"..i]:ClearAllPoints()
			VDW.VCB["ArenaTextName"..i]:SetPoint("TOPRIGHT", self, "BOTTOMRIGHT", -4, -1)
			VDW.VCB["ArenaTextName"..i]:SetJustifyH("RIGHT")
			if not VDW.VCB["ArenaTextName"..i]:IsShown() then VDW.VCB["ArenaTextName"..i]:Show() end
		end
	end
end
-- check current casting time text position
function VDW.VCB.chkCurrentTxtArena()
	if VCBsettings["Arena"]["CurrentTimeText"]["Position"] == G.OPTIONS_V_HIDE then
		function currentPostion(self, i)
			if VDW.VCB["ArenaTextCurrent"..i]:IsShown() then VDW.VCB["ArenaTextCurrent"..i]:Hide() end
		end
	elseif VCBsettings["Arena"]["CurrentTimeText"]["Position"] == G.OPTIONS_P_TOPLEFT then
		function currentPostion(self, i)
			VDW.VCB["ArenaTextCurrent"..i]:ClearAllPoints()
			VDW.VCB["ArenaTextCurrent"..i]:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 4, 1)
			if not VDW.VCB["ArenaTextCurrent"..i]:IsShown() then VDW.VCB["ArenaTextCurrent"..i]:Show() end
		end
	elseif VCBsettings["Arena"]["CurrentTimeText"]["Position"] == G.OPTIONS_P_LEFT then
		function currentPostion(self, i)
			VDW.VCB["ArenaTextCurrent"..i]:ClearAllPoints()
			VDW.VCB["ArenaTextCurrent"..i]:SetPoint("LEFT", self, "LEFT", 4, 0)
			if not VDW.VCB["ArenaTextCurrent"..i]:IsShown() then VDW.VCB["ArenaTextCurrent"..i]:Show() end
		end
	elseif VCBsettings["Arena"]["CurrentTimeText"]["Position"] == G.OPTIONS_P_BOTTOMLEFT then
		function currentPostion(self, i)
			VDW.VCB["ArenaTextCurrent"..i]:ClearAllPoints()
			VDW.VCB["ArenaTextCurrent"..i]:SetPoint("TOPLEFT", self, "BOTTOMLEFT", 4, -1)
			if not VDW.VCB["ArenaTextCurrent"..i]:IsShown() then VDW.VCB["ArenaTextCurrent"..i]:Show() end
		end
	elseif VCBsettings["Arena"]["CurrentTimeText"]["Position"] == G.OPTIONS_P_TOP then
		function currentPostion(self, i)
			VDW.VCB["ArenaTextCurrent"..i]:ClearAllPoints()
			VDW.VCB["ArenaTextCurrent"..i]:SetPoint("BOTTOM", self, "TOP", 0, 1)
			if not VDW.VCB["ArenaTextCurrent"..i]:IsShown() then VDW.VCB["ArenaTextCurrent"..i]:Show() end
		end
	elseif VCBsettings["Arena"]["CurrentTimeText"]["Position"] == G.OPTIONS_P_CENTER then
		function currentPostion(self, i)
			VDW.VCB["ArenaTextCurrent"..i]:ClearAllPoints()
			VDW.VCB["ArenaTextCurrent"..i]:SetPoint("CENTER", self, "CENTER", 0, 0)
			if not VDW.VCB["ArenaTextCurrent"..i]:IsShown() then VDW.VCB["ArenaTextCurrent"..i]:Show() end
		end
	elseif VCBsettings["Arena"]["CurrentTimeText"]["Position"] == G.OPTIONS_P_BOTTOM then
		function currentPostion(self, i)
			VDW.VCB["ArenaTextCurrent"..i]:ClearAllPoints()
			VDW.VCB["ArenaTextCurrent"..i]:SetPoint("TOP", self, "BOTTOM", 0, -1)
			if not VDW.VCB["ArenaTextCurrent"..i]:IsShown() then VDW.VCB["ArenaTextCurrent"..i]:Show() end
		end
	elseif VCBsettings["Arena"]["CurrentTimeText"]["Position"] == G.OPTIONS_P_TOPRIGHT then
		function currentPostion(self, i)
			VDW.VCB["ArenaTextCurrent"..i]:ClearAllPoints()
			VDW.VCB["ArenaTextCurrent"..i]:SetPoint("BOTTOMRIGHT", self, "TOPRIGHT", -4, 1)
			if not VDW.VCB["ArenaTextCurrent"..i]:IsShown() then VDW.VCB["ArenaTextCurrent"..i]:Show() end
		end
	elseif VCBsettings["Arena"]["CurrentTimeText"]["Position"] == G.OPTIONS_P_RIGHT then
		function currentPostion(self, i)
			VDW.VCB["ArenaTextCurrent"..i]:ClearAllPoints()
			VDW.VCB["ArenaTextCurrent"..i]:SetPoint("RIGHT", self, "RIGHT", -4, 0)
			if not VDW.VCB["ArenaTextCurrent"..i]:IsShown() then VDW.VCB["ArenaTextCurrent"..i]:Show() end
		end
	elseif VCBsettings["Arena"]["CurrentTimeText"]["Position"] == G.OPTIONS_P_BOTTOMRIGHT then
		function currentPostion(self, i)
			VDW.VCB["ArenaTextCurrent"..i]:ClearAllPoints()
			VDW.VCB["ArenaTextCurrent"..i]:SetPoint("TOPRIGHT", self, "BOTTOMRIGHT", -4, -1)
			if not VDW.VCB["ArenaTextCurrent"..i]:IsShown() then VDW.VCB["ArenaTextCurrent"..i]:Show() end
		end
	end
end
-- check both casting time text position
function VDW.VCB.chkBothTxtArena()
	if VCBsettings["Arena"]["BothTimeText"]["Position"] == G.OPTIONS_V_HIDE then
		function bothPostion(self, i)
			if VDW.VCB["ArenaTextBoth"..i]:IsShown() then VDW.VCB["ArenaTextBoth"..i]:Hide() end
		end
	elseif VCBsettings["Arena"]["BothTimeText"]["Position"] == G.OPTIONS_P_TOPLEFT then
		function bothPostion(self, i)
			VDW.VCB["ArenaTextBoth"..i]:ClearAllPoints()
			VDW.VCB["ArenaTextBoth"..i]:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 4, 1)
			if not VDW.VCB["ArenaTextBoth"..i]:IsShown() then VDW.VCB["ArenaTextBoth"..i]:Show() end
		end
	elseif VCBsettings["Arena"]["BothTimeText"]["Position"] == G.OPTIONS_P_LEFT then
		function bothPostion(self, i)
			VDW.VCB["ArenaTextBoth"..i]:ClearAllPoints()
			VDW.VCB["ArenaTextBoth"..i]:SetPoint("LEFT", self, "LEFT", 4, 0)
			if not VDW.VCB["ArenaTextBoth"..i]:IsShown() then VDW.VCB["ArenaTextBoth"..i]:Show() end
		end
	elseif VCBsettings["Arena"]["BothTimeText"]["Position"] == G.OPTIONS_P_BOTTOMLEFT then
		function bothPostion(self, i)
			VDW.VCB["ArenaTextBoth"..i]:ClearAllPoints()
			VDW.VCB["ArenaTextBoth"..i]:SetPoint("TOPLEFT", self, "BOTTOMLEFT", 4, -1)
			if not VDW.VCB["ArenaTextBoth"..i]:IsShown() then VDW.VCB["ArenaTextBoth"..i]:Show() end
		end
	elseif VCBsettings["Arena"]["BothTimeText"]["Position"] == G.OPTIONS_P_TOP then
		function bothPostion(self, i)
			VDW.VCB["ArenaTextBoth"..i]:ClearAllPoints()
			VDW.VCB["ArenaTextBoth"..i]:SetPoint("BOTTOM", self, "TOP", 0, 1)
			if not VDW.VCB["ArenaTextBoth"..i]:IsShown() then VDW.VCB["ArenaTextBoth"..i]:Show() end
		end
	elseif VCBsettings["Arena"]["BothTimeText"]["Position"] == G.OPTIONS_P_CENTER then
		function bothPostion(self, i)
			VDW.VCB["ArenaTextBoth"..i]:ClearAllPoints()
			VDW.VCB["ArenaTextBoth"..i]:SetPoint("CENTER", self, "CENTER", 0, 0)
			if not VDW.VCB["ArenaTextBoth"..i]:IsShown() then VDW.VCB["ArenaTextBoth"..i]:Show() end
		end
	elseif VCBsettings["Arena"]["BothTimeText"]["Position"] == G.OPTIONS_P_BOTTOM then
		function bothPostion(self, i)
			VDW.VCB["ArenaTextBoth"..i]:ClearAllPoints()
			VDW.VCB["ArenaTextBoth"..i]:SetPoint("TOP", self, "BOTTOM", 0, -1)
			if not VDW.VCB["ArenaTextBoth"..i]:IsShown() then VDW.VCB["ArenaTextBoth"..i]:Show() end
		end
	elseif VCBsettings["Arena"]["BothTimeText"]["Position"] == G.OPTIONS_P_TOPRIGHT then
		function bothPostion(self, i)
			VDW.VCB["ArenaTextBoth"..i]:ClearAllPoints()
			VDW.VCB["ArenaTextBoth"..i]:SetPoint("BOTTOMRIGHT", self, "TOPRIGHT", -4, 1)
			if not VDW.VCB["ArenaTextBoth"..i]:IsShown() then VDW.VCB["ArenaTextBoth"..i]:Show() end
		end
	elseif VCBsettings["Arena"]["BothTimeText"]["Position"] == G.OPTIONS_P_RIGHT then
		function bothPostion(self, i)
			VDW.VCB["ArenaTextBoth"..i]:ClearAllPoints()
			VDW.VCB["ArenaTextBoth"..i]:SetPoint("RIGHT", self, "RIGHT", -4, 0)
			if not VDW.VCB["ArenaTextBoth"..i]:IsShown() then VDW.VCB["ArenaTextBoth"..i]:Show() end
		end
	elseif VCBsettings["Arena"]["BothTimeText"]["Position"] == G.OPTIONS_P_BOTTOMRIGHT then
		function bothPostion(self, i)
			VDW.VCB["ArenaTextBoth"..i]:ClearAllPoints()
			VDW.VCB["ArenaTextBoth"..i]:SetPoint("TOPRIGHT", self, "BOTTOMRIGHT", -4, -1)
			if not VDW.VCB["ArenaTextBoth"..i]:IsShown() then VDW.VCB["ArenaTextBoth"..i]:Show() end
		end
	end
end
-- check total casting time text position
function VDW.VCB.chkTotalTxtArena()
	if VCBsettings["Arena"]["TotalTimeText"]["Position"] == G.OPTIONS_V_HIDE then
		function totalPostion(self, i)
			if VDW.VCB["ArenaTextTotal"..i]:IsShown() then VDW.VCB["ArenaTextTotal"..i]:Hide() end
		end
	elseif VCBsettings["Arena"]["TotalTimeText"]["Position"] == G.OPTIONS_P_TOPLEFT then
		function totalPostion(self, i)
			VDW.VCB["ArenaTextTotal"..i]:ClearAllPoints()
			VDW.VCB["ArenaTextTotal"..i]:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 4, 1)
			if not VDW.VCB["ArenaTextTotal"..i]:IsShown() then VDW.VCB["ArenaTextTotal"..i]:Show() end
		end
	elseif VCBsettings["Arena"]["TotalTimeText"]["Position"] == G.OPTIONS_P_LEFT then
		function totalPostion(self, i)
			VDW.VCB["ArenaTextTotal"..i]:ClearAllPoints()
			VDW.VCB["ArenaTextTotal"..i]:SetPoint("LEFT", self, "LEFT", 4, 0)
			if not VDW.VCB["ArenaTextTotal"..i]:IsShown() then VDW.VCB["ArenaTextTotal"..i]:Show() end
		end
	elseif VCBsettings["Arena"]["TotalTimeText"]["Position"] == G.OPTIONS_P_BOTTOMLEFT then
		function totalPostion(self, i)
			VDW.VCB["ArenaTextTotal"..i]:ClearAllPoints()
			VDW.VCB["ArenaTextTotal"..i]:SetPoint("TOPLEFT", self, "BOTTOMLEFT", 4, -1)
			if not VDW.VCB["ArenaTextTotal"..i]:IsShown() then VDW.VCB["ArenaTextTotal"..i]:Show() end
		end
	elseif VCBsettings["Arena"]["TotalTimeText"]["Position"] == G.OPTIONS_P_TOP then
		function totalPostion(self, i)
			VDW.VCB["ArenaTextTotal"..i]:ClearAllPoints()
			VDW.VCB["ArenaTextTotal"..i]:SetPoint("BOTTOM", self, "TOP", 0, 1)
			if not VDW.VCB["ArenaTextTotal"..i]:IsShown() then VDW.VCB["ArenaTextTotal"..i]:Show() end
		end
	elseif VCBsettings["Arena"]["TotalTimeText"]["Position"] == G.OPTIONS_P_CENTER then
		function totalPostion(self, i)
			VDW.VCB["ArenaTextTotal"..i]:ClearAllPoints()
			VDW.VCB["ArenaTextTotal"..i]:SetPoint("CENTER", self, "CENTER", 0, 0)
			if not VDW.VCB["ArenaTextTotal"..i]:IsShown() then VDW.VCB["ArenaTextTotal"..i]:Show() end
		end
	elseif VCBsettings["Arena"]["TotalTimeText"]["Position"] == G.OPTIONS_P_BOTTOM then
		function totalPostion(self, i)
			VDW.VCB["ArenaTextTotal"..i]:ClearAllPoints()
			VDW.VCB["ArenaTextTotal"..i]:SetPoint("TOP", self, "BOTTOM", 0, -1)
			if not VDW.VCB["ArenaTextTotal"..i]:IsShown() then VDW.VCB["ArenaTextTotal"..i]:Show() end
		end
	elseif VCBsettings["Arena"]["TotalTimeText"]["Position"] == G.OPTIONS_P_TOPRIGHT then
		function totalPostion(self, i)
			VDW.VCB["ArenaTextTotal"..i]:ClearAllPoints()
			VDW.VCB["ArenaTextTotal"..i]:SetPoint("BOTTOMRIGHT", self, "TOPRIGHT", -4, 1)
			if not VDW.VCB["ArenaTextTotal"..i]:IsShown() then VDW.VCB["ArenaTextTotal"..i]:Show() end
		end
	elseif VCBsettings["Arena"]["TotalTimeText"]["Position"] == G.OPTIONS_P_RIGHT then
		function totalPostion(self, i)
			VDW.VCB["ArenaTextTotal"..i]:ClearAllPoints()
			VDW.VCB["ArenaTextTotal"..i]:SetPoint("RIGHT", self, "RIGHT", -4, 0)
			if not VDW.VCB["ArenaTextTotal"..i]:IsShown() then VDW.VCB["ArenaTextTotal"..i]:Show() end
		end
	elseif VCBsettings["Arena"]["TotalTimeText"]["Position"] == G.OPTIONS_P_BOTTOMRIGHT then
		function totalPostion(self, i)
			VDW.VCB["ArenaTextTotal"..i]:ClearAllPoints()
			VDW.VCB["ArenaTextTotal"..i]:SetPoint("TOPRIGHT", self, "BOTTOMRIGHT", -4, -1)
			if not VDW.VCB["ArenaTextTotal"..i]:IsShown() then VDW.VCB["ArenaTextTotal"..i]:Show() end
		end
	end
end
-- =========================
-- checking update functions
-- =========================
-- check current casting time update
function VDW.VCB.chkCurrentUpdArena()
	if VCBsettings.Arena.CurrentTimeText.Position ~= G.OPTIONS_V_HIDE then
		if VCBsettings.Arena.CurrentTimeText.Sec == G.OPTIONS_V_HIDE then
			if VCBsettings.Arena.CurrentTimeText.Decimals == "0" then
				if VCBsettings.Arena.CurrentTimeText.Direction == G.OPTIONS_D_ASCENDING then
					function currentUpdate(i)
						VDW.VCB["ArenaTextCurrent"..i]:SetText(string.format("%.0f", VDW.VCB["ArenaDuration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Arena.CurrentTimeText.Direction == G.OPTIONS_D_DESCENDING then
					function currentUpdate(i)
						VDW.VCB["ArenaTextCurrent"..i]:SetText(string.format("%.0f", VDW.VCB["ArenaDuration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Arena.CurrentTimeText.Direction == G.OPTIONS_P_BOTH then
					function currentUpdate(i)
						if VDW.VCB["ArenaCastbar"..i] == "Cast" or VDW.VCB["ArenaCastbar"..i] == "Empower" then
							VDW.VCB["ArenaTextCurrent"..i]:SetText(string.format("%.0f", VDW.VCB["ArenaDuration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
						elseif VDW.VCB["ArenaCastbar"..i] == "Channel" then
							VDW.VCB["ArenaTextCurrent"..i]:SetText(string.format("%.0f", VDW.VCB["ArenaDuration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			elseif VCBsettings.Arena.CurrentTimeText.Decimals == "1" then
				if VCBsettings.Arena.CurrentTimeText.Direction == G.OPTIONS_D_ASCENDING then
					function currentUpdate(i)
						VDW.VCB["ArenaTextCurrent"..i]:SetText(string.format("%.1f", VDW.VCB["ArenaDuration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Arena.CurrentTimeText.Direction == G.OPTIONS_D_DESCENDING then
					function currentUpdate(i)
						VDW.VCB["ArenaTextCurrent"..i]:SetText(string.format("%.1f", VDW.VCB["ArenaDuration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Arena.CurrentTimeText.Direction == G.OPTIONS_P_BOTH then
					function currentUpdate(i)
						if VDW.VCB["ArenaCastbar"..i] == "Cast" or VDW.VCB["ArenaCastbar"..i] == "Empower" then
							VDW.VCB["ArenaTextCurrent"..i]:SetText(string.format("%.1f", VDW.VCB["ArenaDuration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
						elseif VDW.VCB["ArenaCastbar"..i] == "Channel" then
							VDW.VCB["ArenaTextCurrent"..i]:SetText(string.format("%.1f", VDW.VCB["ArenaDuration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			elseif VCBsettings.Arena.CurrentTimeText.Decimals == "2" then
				if VCBsettings.Arena.CurrentTimeText.Direction == G.OPTIONS_D_ASCENDING then
					function currentUpdate(i)
						VDW.VCB["ArenaTextCurrent"..i]:SetText(string.format("%.2f", VDW.VCB["ArenaDuration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Arena.CurrentTimeText.Direction == G.OPTIONS_D_DESCENDING then
					function currentUpdate(i)
						VDW.VCB["ArenaTextCurrent"..i]:SetText(string.format("%.2f", VDW.VCB["ArenaDuration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Arena.CurrentTimeText.Direction == G.OPTIONS_P_BOTH then
					function currentUpdate(i)
						if VDW.VCB["ArenaCastbar"..i] == "Cast" or VDW.VCB["ArenaCastbar"..i] == "Empower" then
							VDW.VCB["ArenaTextCurrent"..i]:SetText(string.format("%.2f", VDW.VCB["ArenaDuration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
						elseif VDW.VCB["ArenaCastbar"..i] == "Channel" then
							VDW.VCB["ArenaTextCurrent"..i]:SetText(string.format("%.2f", VDW.VCB["ArenaDuration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			elseif VCBsettings.Arena.CurrentTimeText.Decimals == "3" then
				if VCBsettings.Arena.CurrentTimeText.Direction == G.OPTIONS_D_ASCENDING then
					function currentUpdate(i)
						VDW.VCB["ArenaTextCurrent"..i]:SetText(string.format("%.3f", VDW.VCB["ArenaDuration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Arena.CurrentTimeText.Direction == G.OPTIONS_D_DESCENDING then
					function currentUpdate(i)
						VDW.VCB["ArenaTextCurrent"..i]:SetText(string.format("%.3f", VDW.VCB["ArenaDuration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Arena.CurrentTimeText.Direction == G.OPTIONS_P_BOTH then
					function currentUpdate(i)
						if VDW.VCB["ArenaCastbar"..i] == "Cast" or VDW.VCB["ArenaCastbar"..i] == "Empower" then
							VDW.VCB["ArenaTextCurrent"..i]:SetText(string.format("%.3f", VDW.VCB["ArenaDuration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
						elseif VDW.VCB["ArenaCastbar"..i] == "Channel" then
							VDW.VCB["ArenaTextCurrent"..i]:SetText(string.format("%.3f", VDW.VCB["ArenaDuration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			end
		elseif VCBsettings.Arena.CurrentTimeText.Sec == G.OPTIONS_V_SHOW then
			if VCBsettings.Arena.CurrentTimeText.Decimals == "0" then
				if VCBsettings.Arena.CurrentTimeText.Direction == G.OPTIONS_D_ASCENDING then
					function currentUpdate(i)
						VDW.VCB["ArenaTextCurrent"..i]:SetText(string.format("%.0f Sec", VDW.VCB["ArenaDuration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Arena.CurrentTimeText.Direction == G.OPTIONS_D_DESCENDING then
					function currentUpdate(i)
						VDW.VCB["ArenaTextCurrent"..i]:SetText(string.format("%.0f Sec", VDW.VCB["ArenaDuration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Arena.CurrentTimeText.Direction == G.OPTIONS_P_BOTH then
					function currentUpdate(i)
						if VDW.VCB["ArenaCastbar"..i] == "Cast" or VDW.VCB["ArenaCastbar"..i] == "Empower" then
							VDW.VCB["ArenaTextCurrent"..i]:SetText(string.format("%.0f Sec", VDW.VCB["ArenaDuration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
						elseif VDW.VCB["ArenaCastbar"..i] == "Channel" then
							VDW.VCB["ArenaTextCurrent"..i]:SetText(string.format("%.0f Sec", VDW.VCB["ArenaDuration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			elseif VCBsettings.Arena.CurrentTimeText.Decimals == "1" then
				if VCBsettings.Arena.CurrentTimeText.Direction == G.OPTIONS_D_ASCENDING then
					function currentUpdate(i)
						VDW.VCB["ArenaTextCurrent"..i]:SetText(string.format("%.1f Sec", VDW.VCB["ArenaDuration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Arena.CurrentTimeText.Direction == G.OPTIONS_D_DESCENDING then
					function currentUpdate(i)
						VDW.VCB["ArenaTextCurrent"..i]:SetText(string.format("%.1f Sec", VDW.VCB["ArenaDuration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Arena.CurrentTimeText.Direction == G.OPTIONS_P_BOTH then
					function currentUpdate(i)
						if VDW.VCB["ArenaCastbar"..i] == "Cast" or VDW.VCB["ArenaCastbar"..i] == "Empower" then
							VDW.VCB["ArenaTextCurrent"..i]:SetText(string.format("%.1f Sec", VDW.VCB["ArenaDuration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
						elseif VDW.VCB["ArenaCastbar"..i] == "Channel" then
							VDW.VCB["ArenaTextCurrent"..i]:SetText(string.format("%.1f Sec", VDW.VCB["ArenaDuration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			elseif VCBsettings.Arena.CurrentTimeText.Decimals == "2" then
				if VCBsettings.Arena.CurrentTimeText.Direction == G.OPTIONS_D_ASCENDING then
					function currentUpdate(i)
						VDW.VCB["ArenaTextCurrent"..i]:SetText(string.format("%.2f Sec", VDW.VCB["ArenaDuration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Arena.CurrentTimeText.Direction == G.OPTIONS_D_DESCENDING then
					function currentUpdate(i)
						VDW.VCB["ArenaTextCurrent"..i]:SetText(string.format("%.2f Sec", VDW.VCB["ArenaDuration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Arena.CurrentTimeText.Direction == G.OPTIONS_P_BOTH then
					function currentUpdate(i)
						if VDW.VCB["ArenaCastbar"..i] == "Cast" or VDW.VCB["ArenaCastbar"..i] == "Empower" then
							VDW.VCB["ArenaTextCurrent"..i]:SetText(string.format("%.2f Sec", VDW.VCB["ArenaDuration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
						elseif VDW.VCB["ArenaCastbar"..i] == "Channel" then
							VDW.VCB["ArenaTextCurrent"..i]:SetText(string.format("%.2f Sec", VDW.VCB["ArenaDuration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			elseif VCBsettings.Arena.CurrentTimeText.Decimals == "3" then
				if VCBsettings.Arena.CurrentTimeText.Direction == G.OPTIONS_D_ASCENDING then
					function currentUpdate(i)
						VDW.VCB["ArenaTextCurrent"..i]:SetText(string.format("%.3f Sec", VDW.VCB["ArenaDuration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Arena.CurrentTimeText.Direction == G.OPTIONS_D_DESCENDING then
					function currentUpdate(i)
						VDW.VCB["ArenaTextCurrent"..i]:SetText(string.format("%.3f Sec", VDW.VCB["ArenaDuration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Arena.CurrentTimeText.Direction == G.OPTIONS_P_BOTH then
					function currentUpdate(i)
						if VDW.VCB["ArenaCastbar"..i] == "Cast" or VDW.VCB["ArenaCastbar"..i] == "Empower" then
							VDW.VCB["ArenaTextCurrent"..i]:SetText(string.format("%.3f Sec", VDW.VCB["ArenaDuration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
						elseif VDW.VCB["ArenaCastbar"..i] == "Channel" then
							VDW.VCB["ArenaTextCurrent"..i]:SetText(string.format("%.3f Sec", VDW.VCB["ArenaDuration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			end
		end
	elseif VCBsettings.Arena.CurrentTimeText.Position == G.OPTIONS_V_HIDE then
		function currentUpdate(i)
			return
		end
	end
end
-- check both casting time update
function VDW.VCB.chkBothUpdArena()
	if VCBsettings.Arena.BothTimeText.Position ~= G.OPTIONS_V_HIDE then
		if VCBsettings.Arena.BothTimeText.Sec == G.OPTIONS_V_HIDE then
			if VCBsettings.Arena.BothTimeText.Decimals == "0" then
				if VCBsettings.Arena.BothTimeText.Direction == G.OPTIONS_D_ASCENDING then
					function bothUpdate(i)
						VDW.VCB["ArenaTextBoth"..i]:SetText(string.format("%.0f / %.0f", VDW.VCB["ArenaDuration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), VDW.VCB["ArenaDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Arena.BothTimeText.Direction == G.OPTIONS_D_DESCENDING then
					function bothUpdate(i)
						VDW.VCB["ArenaTextBoth"..i]:SetText(string.format("%.0f / %.0f", VDW.VCB["ArenaDuration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), VDW.VCB["ArenaDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Arena.BothTimeText.Direction == G.OPTIONS_P_BOTH then
					function bothUpdate(i)
						if VDW.VCB["ArenaCastbar"..i] == "Cast" or VDW.VCB["ArenaCastbar"..i] == "Empower" then
							VDW.VCB["ArenaTextBoth"..i]:SetText(string.format("%.0f / %.0f", VDW.VCB["ArenaDuration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), VDW.VCB["ArenaDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						elseif VDW.VCB["ArenaCastbar"..i] == "Channel" then
							VDW.VCB["ArenaTextBoth"..i]:SetText(string.format("%.0f / %.0f", VDW.VCB["ArenaDuration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), VDW.VCB["ArenaDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			elseif VCBsettings.Arena.BothTimeText.Decimals == "1" then
				if VCBsettings.Arena.BothTimeText.Direction == G.OPTIONS_D_ASCENDING then
					function bothUpdate(i)
						VDW.VCB["ArenaTextBoth"..i]:SetText(string.format("%.1f / %.1f", VDW.VCB["ArenaDuration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), VDW.VCB["ArenaDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Arena.BothTimeText.Direction == G.OPTIONS_D_DESCENDING then
					function bothUpdate(i)
						VDW.VCB["ArenaTextBoth"..i]:SetText(string.format("%.1f / %.1f", VDW.VCB["ArenaDuration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), VDW.VCB["ArenaDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Arena.BothTimeText.Direction == G.OPTIONS_P_BOTH then
					function bothUpdate(i)
						if VDW.VCB["ArenaCastbar"..i] == "Cast" or VDW.VCB["ArenaCastbar"..i] == "Empower" then
							VDW.VCB["ArenaTextBoth"..i]:SetText(string.format("%.1f / %.1f", VDW.VCB["ArenaDuration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), VDW.VCB["ArenaDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						elseif VDW.VCB["ArenaCastbar"..i] == "Channel" then
							VDW.VCB["ArenaTextBoth"..i]:SetText(string.format("%.1f / %.1f", VDW.VCB["ArenaDuration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), VDW.VCB["ArenaDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			elseif VCBsettings.Arena.BothTimeText.Decimals == "2" then
				if VCBsettings.Arena.BothTimeText.Direction == G.OPTIONS_D_ASCENDING then
					function bothUpdate(i)
						VDW.VCB["ArenaTextBoth"..i]:SetText(string.format("%.2f / %.2f", VDW.VCB["ArenaDuration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), VDW.VCB["ArenaDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Arena.BothTimeText.Direction == G.OPTIONS_D_DESCENDING then
					function bothUpdate(i)
						VDW.VCB["ArenaTextBoth"..i]:SetText(string.format("%.2f / %.2f", VDW.VCB["ArenaDuration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), VDW.VCB["ArenaDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Arena.BothTimeText.Direction == G.OPTIONS_P_BOTH then
					function bothUpdate(i)
						if VDW.VCB["ArenaCastbar"..i] == "Cast" or VDW.VCB["ArenaCastbar"..i] == "Empower" then
							VDW.VCB["ArenaTextBoth"..i]:SetText(string.format("%.2f / %.2f", VDW.VCB["ArenaDuration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), VDW.VCB["ArenaDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						elseif VDW.VCB["ArenaCastbar"..i] == "Channel" then
							VDW.VCB["ArenaTextBoth"..i]:SetText(string.format("%.2f / %.2f", VDW.VCB["ArenaDuration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), VDW.VCB["ArenaDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			elseif VCBsettings.Arena.BothTimeText.Decimals == "3" then
				if VCBsettings.Arena.BothTimeText.Direction == G.OPTIONS_D_ASCENDING then
					function bothUpdate(i)
						VDW.VCB["ArenaTextBoth"..i]:SetText(string.format("%.3f / %.3f", VDW.VCB["ArenaDuration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), VDW.VCB["ArenaDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Arena.BothTimeText.Direction == G.OPTIONS_D_DESCENDING then
					function bothUpdate(i)
						VDW.VCB["ArenaTextBoth"..i]:SetText(string.format("%.3f / %.3f", VDW.VCB["ArenaDuration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), VDW.VCB["ArenaDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Arena.BothTimeText.Direction == G.OPTIONS_P_BOTH then
					function bothUpdate(i)
						if VDW.VCB["ArenaCastbar"..i] == "Cast" or VDW.VCB["ArenaCastbar"..i] == "Empower" then
							VDW.VCB["ArenaTextBoth"..i]:SetText(string.format("%.3f", VDW.VCB["ArenaDuration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), VDW.VCB["ArenaDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						elseif VDW.VCB["ArenaCastbar"..i] == "Channel" then
							VDW.VCB["ArenaTextBoth"..i]:SetText(string.format("%.3f / %.3f", VDW.VCB["ArenaDuration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), VDW.VCB["ArenaDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			end
		elseif VCBsettings.Arena.BothTimeText.Sec == G.OPTIONS_V_SHOW then
			if VCBsettings.Arena.BothTimeText.Decimals == "0" then
				if VCBsettings.Arena.BothTimeText.Direction == G.OPTIONS_D_ASCENDING then
					function bothUpdate(i)
						VDW.VCB["ArenaTextBoth"..i]:SetText(string.format("%.0f / %.0f Sec", VDW.VCB["ArenaDuration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), VDW.VCB["ArenaDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Arena.BothTimeText.Direction == G.OPTIONS_D_DESCENDING then
					function bothUpdate(i)
						VDW.VCB["ArenaTextBoth"..i]:SetText(string.format("%.0f / %.0f Sec", VDW.VCB["ArenaDuration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), VDW.VCB["ArenaDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Arena.BothTimeText.Direction == G.OPTIONS_P_BOTH then
					function bothUpdate(i)
						if VDW.VCB["ArenaCastbar"..i] == "Cast" or VDW.VCB["ArenaCastbar"..i] == "Empower" then
							VDW.VCB["ArenaTextBoth"..i]:SetText(string.format("%.0f / %.0f Sec", VDW.VCB["ArenaDuration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), VDW.VCB["ArenaDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						elseif VDW.VCB["ArenaCastbar"..i] == "Channel" then
							VDW.VCB["ArenaTextBoth"..i]:SetText(string.format("%.0f / %.0f Sec", VDW.VCB["ArenaDuration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), VDW.VCB["ArenaDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			elseif VCBsettings.Arena.BothTimeText.Decimals == "1" then
				if VCBsettings.Arena.BothTimeText.Direction == G.OPTIONS_D_ASCENDING then
					function bothUpdate(i)
						VDW.VCB["ArenaTextBoth"..i]:SetText(string.format("%.1f / %.1f Sec", VDW.VCB["ArenaDuration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), VDW.VCB["ArenaDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Arena.BothTimeText.Direction == G.OPTIONS_D_DESCENDING then
					function bothUpdate(i)
						VDW.VCB["ArenaTextBoth"..i]:SetText(string.format("%.1f / %.1f Sec", VDW.VCB["ArenaDuration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), VDW.VCB["ArenaDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Arena.BothTimeText.Direction == G.OPTIONS_P_BOTH then
					function bothUpdate(i)
						if VDW.VCB["ArenaCastbar"..i] == "Cast" or VDW.VCB["ArenaCastbar"..i] == "Empower" then
							VDW.VCB["ArenaTextBoth"..i]:SetText(string.format("%.1f / %.1f Sec", VDW.VCB["ArenaDuration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), VDW.VCB["ArenaDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						elseif VDW.VCB["ArenaCastbar"..i] == "Channel" then
							VDW.VCB["ArenaTextBoth"..i]:SetText(string.format("%.1f / %.1f Sec", VDW.VCB["ArenaDuration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), VDW.VCB["ArenaDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			elseif VCBsettings.Arena.BothTimeText.Decimals == "2" then
				if VCBsettings.Arena.BothTimeText.Direction == G.OPTIONS_D_ASCENDING then
					function bothUpdate(i)
						VDW.VCB["ArenaTextBoth"..i]:SetText(string.format("%.2f / %.2f Sec", VDW.VCB["ArenaDuration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), VDW.VCB["ArenaDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Arena.BothTimeText.Direction == G.OPTIONS_D_DESCENDING then
					function bothUpdate(i)
						VDW.VCB["ArenaTextBoth"..i]:SetText(string.format("%.2f / %.2f Sec", VDW.VCB["ArenaDuration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), VDW.VCB["ArenaDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Arena.BothTimeText.Direction == G.OPTIONS_P_BOTH then
					function bothUpdate(i)
						if VDW.VCB["ArenaCastbar"..i] == "Cast" or VDW.VCB["ArenaCastbar"..i] == "Empower" then
							VDW.VCB["ArenaTextBoth"..i]:SetText(string.format("%.2f / %.2f Sec", VDW.VCB["ArenaDuration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), VDW.VCB["ArenaDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						elseif VDW.VCB["ArenaCastbar"..i] == "Channel" then
							VDW.VCB["ArenaTextBoth"..i]:SetText(string.format("%.2f / %.2f Sec", VDW.VCB["ArenaDuration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), VDW.VCB["ArenaDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			elseif VCBsettings.Arena.BothTimeText.Decimals == "3" then
				if VCBsettings.Arena.BothTimeText.Direction == G.OPTIONS_D_ASCENDING then
					function bothUpdate(i)
						VDW.VCB["ArenaTextBoth"..i]:SetText(string.format("%.3f / %.3f Sec", VDW.VCB["ArenaDuration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), VDW.VCB["ArenaDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Arena.BothTimeText.Direction == G.OPTIONS_D_DESCENDING then
					function bothUpdate(i)
						VDW.VCB["ArenaTextBoth"..i]:SetText(string.format("%.3f / %.3f Sec", VDW.VCB["ArenaDuration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), VDW.VCB["ArenaDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Arena.BothTimeText.Direction == G.OPTIONS_P_BOTH then
					function bothUpdate(i)
						if VDW.VCB["ArenaCastbar"..i] == "Cast" or VDW.VCB["ArenaCastbar"..i] == "Empower" then
							VDW.VCB["ArenaTextBoth"..i]:SetText(string.format("%.3f / %.3f Sec", VDW.VCB["ArenaDuration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), VDW.VCB["ArenaDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						elseif VDW.VCB["ArenaCastbar"..i] == "Channel" then
							VDW.VCB["ArenaTextBoth"..i]:SetText(string.format("%.3f / %.3f Sec", VDW.VCB["ArenaDuration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), VDW.VCB["ArenaDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			end
		end
	elseif VCBsettings.Arena.BothTimeText.Position == G.OPTIONS_V_HIDE then
		function bothUpdate(i)
			return
		end
	end
end
-- check total casting time update
function VDW.VCB.chkTotalUpdArena()
	if VCBsettings.Arena.TotalTimeText.Position ~= G.OPTIONS_V_HIDE then
		if VCBsettings.Arena.TotalTimeText.Sec == G.OPTIONS_V_HIDE then
			if VCBsettings.Arena.TotalTimeText.Decimals == "0" then
				function totalUpdate(i)
					VDW.VCB["ArenaTextTotal"..i]:SetFormattedText("%.0f", VDW.VCB["ArenaDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime))
				end
			elseif VCBsettings.Arena.TotalTimeText.Decimals == "1" then
				function totalUpdate(i)
					VDW.VCB["ArenaTextTotal"..i]:SetFormattedText("%.1f", VDW.VCB["ArenaDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime))
				end
			elseif VCBsettings.Arena.TotalTimeText.Decimals == "2" then
				function totalUpdate(i)
					VDW.VCB["ArenaTextTotal"..i]:SetFormattedText("%.2f", VDW.VCB["ArenaDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime))
				end
			elseif VCBsettings.Arena.TotalTimeText.Decimals == "3" then
				function totalUpdate(i)
					VDW.VCB["ArenaTextTotal"..i]:SetFormattedText("%.3f", VDW.VCB["ArenaDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime))
				end
			end
		elseif VCBsettings.Arena.TotalTimeText.Sec == G.OPTIONS_V_SHOW then
			if VCBsettings.Arena.TotalTimeText.Decimals == "0" then
				function totalUpdate(i)
					VDW.VCB["ArenaTextTotal"..i]:SetFormattedText("%.0f sec", VDW.VCB["ArenaDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime))
				end
			elseif VCBsettings.Arena.TotalTimeText.Decimals == "1" then
				function totalUpdate(i)
					VDW.VCB["ArenaTextTotal"..i]:SetFormattedText("%.1f sec", VDW.VCB["ArenaDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime))
				end
			elseif VCBsettings.Arena.TotalTimeText.Decimals == "2" then
				function totalUpdate(i)
					VDW.VCB["ArenaTextTotal"..i]:SetFormattedText("%.2f sec", VDW.VCB["ArenaDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime))
				end
			elseif VCBsettings.Arena.TotalTimeText.Decimals == "3" then
				function totalUpdate(i)
					VDW.VCB["ArenaTextTotal"..i]:SetFormattedText("%.3f sec", VDW.VCB["ArenaDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime))
				end
			end
		end
	elseif VCBsettings.Arena.TotalTimeText.Position == G.OPTIONS_V_HIDE then
		function totalUpdate(i)
			return
		end
	end
end
-- =========================
-- checking color & style functions
-- =========================
-- check status bar color
function VDW.VCB.chkStatusColorArena()
	if VCBsettings["Arena"]["StatusBar"]["Color"] == G.OPTIONS_C_DEFAULT then
		function statusbarColor(self, i)
			self:SetStatusBarDesaturated(false)
			self:SetStatusBarColor(1, 1, 1)
			if VCBsettings.Arena.StatusBar.Style == "Jailer" then
				self.Spark:SetDesaturated(true)
				self.Spark:SetVertexColor(jailerColor:GetRGB())
				self.Flash:SetDesaturated(true)
				self.Flash:SetVertexColor(jailerColor:GetRGB())
			else
				self.Spark:SetDesaturated(false)
				self.Spark:SetVertexColor(1, 1, 1)
				self.Flash:SetDesaturated(false)
				self.Flash:SetVertexColor(1, 1, 1)
			end
		end
	elseif VCBsettings["Arena"]["StatusBar"]["Color"] == G.OPTIONS_C_CLASS then
		function statusbarColor(self, i)
			if VDW.VCB["ClassColorArena"..i] ~= nil then
				self:SetStatusBarDesaturated(true)
				self:SetStatusBarColor(VDW.VCB["ClassColorArena"..i]:GetRGB())
				self.Spark:SetDesaturated(true)
				self.Spark:SetVertexColor(VDW.VCB["ClassColorArena"..i]:GetRGB())
				self.Flash:SetDesaturated(true)
				self.Flash:SetVertexColor(VDW.VCB["ClassColorArena"..i]:GetRGB())
			end
		end
	end
end
-- check border bar color
function VDW.VCB.chkBorderColorArena()
	if VCBsettings.Arena.Border.Color == G.OPTIONS_C_DEFAULT then
		function borderColor(self, i)
			self.Background:SetDesaturated(false)
			self.Border:SetDesaturated(false)
			VDW.VCB["ArenaTextBorderTop"..i]:SetDesaturated(false)
			VDW.VCB["ArenaTextBorderBottom"..i]:SetDesaturated(false)
			self.Background:SetVertexColor(1, 1, 1)
			self.Border:SetVertexColor(1, 1, 1)
			VDW.VCB["ArenaTextBorderTop"..i]:SetVertexColor(1, 1, 1)
			VDW.VCB["ArenaTextBorderBottom"..i]:SetVertexColor(1, 1, 1)
		end
	elseif VCBsettings.Arena.Border.Color == G.OPTIONS_C_CLASS then
		function borderColor(self, i)
			if VDW.VCB["ClassColorArena"..i] ~= nil then
				self.Background:SetDesaturated(true)
				self.Border:SetDesaturated(true)
				VDW.VCB["ArenaTextBorderTop"..i]:SetDesaturated(true)
				VDW.VCB["ArenaTextBorderBottom"..i]:SetDesaturated(true)
				self.Background:SetVertexColor(VDW.VCB["ClassColorArena"..i]:GetRGB())
				self.Border:SetVertexColor(VDW.VCB["ClassColorArena"..i]:GetRGB())
				VDW.VCB["ArenaTextBorderTop"..i]:SetVertexColor(VDW.VCB["ClassColorArena"..i]:GetRGB())
				VDW.VCB["ArenaTextBorderBottom"..i]:SetVertexColor(VDW.VCB["ClassColorArena"..i]:GetRGB())
			end
		end
	end
end
-- call back the defaul color of status bar
local function defaultColor(self)
	self:SetStatusBarDesaturated(false)
	self:SetStatusBarColor(1, 1, 1)
	if VCBsettings.Arena.StatusBar.Style == "Jailer" then
		self.Spark:SetDesaturated(true)
		self.Spark:SetVertexColor(jailerColor:GetRGB())
		self.Flash:SetDesaturated(true)
		self.Flash:SetVertexColor(jailerColor:GetRGB())
	else
		self.Spark:SetDesaturated(false)
		self.Spark:SetVertexColor(1, 1, 1)
		self.Flash:SetDesaturated(false)
		self.Flash:SetVertexColor(1, 1, 1)
	end
end
-- bar status style
function VDW.VCB.chkStatusStyleArena()
	if VCBsettings.Arena.StatusBar.Style == G.OPTIONS_C_DEFAULT then
		function statusbarStyle(self)
			return
		end
	elseif VCBsettings.Arena.StatusBar.Style == "Jailer" then
		function statusbarStyle(self)
			self:SetStatusBarTexture("jailerstower-scorebar-fill-onfire")
		end
	end
end
-- check border bar style
function VDW.VCB.chkBorderStyleArena()
	if VCBsettings.Arena.Border.Style == G.OPTIONS_C_DEFAULT then
		function borderStyle(self)
			return
		end
	elseif VCBsettings.Arena.Border.Style == "Jailer" then
		function borderStyle(self)
			self.Border:SetAtlas("jailerstower-scenario-TitleBG")
			self.Border:ClearAllPoints()
			self.Border:SetPoint("TOPLEFT", self, "TOPLEFT", 0, 9)
			self.Border:SetPoint("BOTTOMRIGHT", self, "BOTTOMRIGHT", 0, -7)
			self.Background:SetAtlas("jailerstower-scorebar-bgright-onfire")
			self.Background:SetDesaturated(true)
		end
	end
end
-- =========================
-- position & scale bar
-- =========================
-- position bar
local function positionBar(self)
	self:ClearAllPoints()
	self:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", VCBsettings["Arena"]["Position"]["X"], VCBsettings["Arena"]["Position"]["Y"])
end
-- scale bar
local function scaleBar(self)
	self:SetScale(VCBsettings["Arena"]["Scale"]/100)
end
-- =========================
-- class color
-- =========================
local function barIsLocked()
	for i = 1, 3, 1 do
		_G["CompactArenaFrameMember"..i]:HookScript("OnUpdate", function(self)
			local classFilename = UnitClassBase("arena"..i)
			if classFilename ~= nil then VDW.VCB["ClassColorArena"..i] = C_ClassColor.GetClassColor(classFilename) end
		end)
-- hook part 1
		_G["CompactArenaFrameMember"..i].CastingBarFrame:HookScript("OnShow", function(self)
			VDW.VCB["ArenaTextName"..i]:SetWidth(self:GetWidth() - 8)
			iconPosition(i)
			namePosition(self, i)
			currentPostion(self, i)
			bothPostion(self, i)
			totalPostion(self, i)
			borderStyle(self)
		end)
-- hook part 2
		_G["CompactArenaFrameMember"..i].CastingBarFrame:HookScript("OnUpdate", function(self)
			self.TextBorder:SetAlpha(0)
			self.Text:SetAlpha(0)
			self.BorderShield:SetAlpha(0)
			self.Icon:SetAlpha(0)
			if VDW.VCB["ArenaDuration"..i] then
				VDW.VCB["ArenaTextName"..i]:SetText(self.Text:GetText())
				VDW.VCB["ArenaIconSpellLeft"..i]:SetTexture(self.Icon:GetTextureFileID())
				VDW.VCB["ArenaIconSpellRight"..i]:SetTexture(self.Icon:GetTextureFileID())
				shieldPosition(VDW.VCB["ArenaUninterruptible"..i], i)
				bordertextPosition(i)
				if VDW.VCB["ArenaInterrupted"..i] then
					VDW.VCB["ArenaTextCurrent"..i]:SetText("-")
					VDW.VCB["ArenaTextBoth"..i]:SetText("- / -")
					VDW.VCB["ArenaTextTotal"..i]:SetText("-")
				else
					currentUpdate(i)
					bothUpdate(i)
					totalUpdate(i)
				end
				statusbarColor(self, i)
				borderColor(self, i)
				statusbarStyle(self)
			end
		end)
	end
end
-- =========================
-- Events Time
-- =========================
local function EventsTime(self, event, arg1, arg2, arg3, arg4)
	if event == "PLAYER_LOGIN" then
		ProtectOptions()
		createTextures()
		createTexts()
		VDW.VCB.chkArenaIconPosition()
		VDW.VCB.chkArenaShieldPosition()
		VDW.VCB.chkArenaBorderTextPosition()
		VDW.VCB.chkNameTxtArena()
		VDW.VCB.chkCurrentTxtArena()
		VDW.VCB.chkBothTxtArena()
		VDW.VCB.chkTotalTxtArena()
		VDW.VCB.chkCurrentUpdArena()
		VDW.VCB.chkBothUpdArena()
		VDW.VCB.chkTotalUpdArena()
		VDW.VCB.chkStatusColorArena()
		VDW.VCB.chkBorderColorArena()
		VDW.VCB.chkStatusStyleArena()
		VDW.VCB.chkBorderStyleArena()
		barIsLocked()
	elseif event == "UNIT_SPELLCAST_START" then
		for i = 1, 3, 1 do
			if arg1 == "arena"..i then
				local castName, castText, castTex, _, _, isTradeSkill, _, castNotInterruptible = UnitCastingInfo(arg1)
				if castName then
					VDW.VCB["ArenaDuration"..i] = UnitCastingDuration(arg1)
					VDW.VCB["ArenaUninterruptible"..i] = castNotInterruptible
					VDW.VCB["ArenaCastbar"..i] = "Cast"
					VDW.VCB["ArenaInterrupted"..i] = false
				end
			end
		end
	elseif event == "UNIT_SPELLCAST_CHANNEL_START" then
		for i = 1, 3, 1 do
			if arg1 == "arena"..i then
				local chanName, chanText, chanTex, _, _, isTradeSkill, chanNotInterruptible, _, isEmpowered, numStages = UnitChannelInfo(arg1)
				if chanName then
					VDW.VCB["ArenaDuration"..i] = UnitCastingDuration(arg1)
					VDW.VCB["ArenaUninterruptible"..i] = castNotInterruptible
					VDW.VCB["ArenaCastbar"..i] = "Channel"
					VDW.VCB["ArenaInterrupted"..i] = false
				end
			end
		end
	elseif event == "UNIT_SPELLCAST_EMPOWER_START" then
		for i = 1, 3, 1 do
			if arg1 == "arena"..i then
				local chanName, chanText, chanTex, _, _, isTradeSkill, chanNotInterruptible, _, isEmpowered, numStages = UnitChannelInfo(arg1)
				if chanName then
					VDW.VCB["ArenaDuration"..i] = UnitCastingDuration(arg1)
					VDW.VCB["ArenaUninterruptible"..i] = castNotInterruptible
					VDW.VCB["ArenaCastbar"..i] = "Empower"
					VDW.VCB["ArenaInterrupted"..i] = false
				end
			end
		end
	elseif event == "UNIT_SPELLCAST_INTERRUPTED" then
		for i = 1, 3, 1 do
			if arg1 == "arena"..i then
				VDW.VCB["ArenaInterrupted"..i] = true
			end
		end
	end
end
vcbZlave:HookScript("OnEvent", EventsTime)
