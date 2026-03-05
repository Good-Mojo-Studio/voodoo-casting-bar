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
	VDW.VCB.BossIconSpellLeft1 = Boss1TargetFrameSpellBar:CreateTexture(nil, "ARTWORK", nil, 0)
	VDW.VCB.BossIconSpellLeft1:SetPoint("RIGHT", Boss1TargetFrameSpellBar, "LEFT", -2, -5)
	VDW.VCB.BossIconSpellLeft1:SetSize(20, 20)
	VDW.VCB.BossIconSpellLeft2 = Boss2TargetFrameSpellBar:CreateTexture(nil, "ARTWORK", nil, 0)
	VDW.VCB.BossIconSpellLeft2:SetPoint("RIGHT", Boss2TargetFrameSpellBar, "LEFT", -2, -5)
	VDW.VCB.BossIconSpellLeft2:SetSize(20, 20)
	VDW.VCB.BossIconSpellLeft3  = Boss3TargetFrameSpellBar:CreateTexture(nil, "ARTWORK", nil, 0)
	VDW.VCB.BossIconSpellLeft3:SetPoint("RIGHT", Boss3TargetFrameSpellBar, "LEFT", -2, -5)
	VDW.VCB.BossIconSpellLeft3:SetSize(20, 20)
	VDW.VCB.BossIconSpellLeft4  = Boss4TargetFrameSpellBar:CreateTexture(nil, "ARTWORK", nil, 0)
	VDW.VCB.BossIconSpellLeft4:SetPoint("RIGHT", Boss4TargetFrameSpellBar, "LEFT", -2, -5)
	VDW.VCB.BossIconSpellLeft4:SetSize(20, 20)
	VDW.VCB.BossIconSpellLeft5  = Boss5TargetFrameSpellBar:CreateTexture(nil, "ARTWORK", nil, 0)
	VDW.VCB.BossIconSpellLeft5:SetPoint("RIGHT", Boss5TargetFrameSpellBar, "LEFT", -2, -5)
	VDW.VCB.BossIconSpellLeft5:SetSize(20, 20)
-- icon spell right
	VDW.VCB.BossIconSpellRight1 = Boss1TargetFrameSpellBar:CreateTexture(nil, "ARTWORK", nil, 0)
	VDW.VCB.BossIconSpellRight1:SetPoint("LEFT", TargetFrameSpellBar, "RIGHT", 4, -5)
	VDW.VCB.BossIconSpellRight1:SetSize(20, 20)
	VDW.VCB.BossIconSpellRight2 = Boss2TargetFrameSpellBar:CreateTexture(nil, "ARTWORK", nil, 0)
	VDW.VCB.BossIconSpellRight2:SetPoint("LEFT", TargetFrameSpellBar, "RIGHT", 4, -5)
	VDW.VCB.BossIconSpellRight2:SetSize(20, 20)
	VDW.VCB.BossIconSpellRight3  = Boss3TargetFrameSpellBar:CreateTexture(nil, "ARTWORK", nil, 0)
	VDW.VCB.BossIconSpellRight3:SetPoint("LEFT", TargetFrameSpellBar, "RIGHT", 4, -5)
	VDW.VCB.BossIconSpellRight3:SetSize(20, 20)
	VDW.VCB.BossIconSpellRight4  = Boss4TargetFrameSpellBar:CreateTexture(nil, "ARTWORK", nil, 0)
	VDW.VCB.BossIconSpellRight4:SetPoint("LEFT", TargetFrameSpellBar, "RIGHT", 4, -5)
	VDW.VCB.BossIconSpellRight4:SetSize(20, 20)
	VDW.VCB.BossIconSpellRight5  = Boss5TargetFrameSpellBar:CreateTexture(nil, "ARTWORK", nil, 0)
	VDW.VCB.BossIconSpellRight5:SetPoint("LEFT", TargetFrameSpellBar, "RIGHT", 4, -5)
	VDW.VCB.BossIconSpellRight5:SetSize(20, 20)
-- shield icon left
	VDW.VCB.BossIconShieldLeft1 = Boss1TargetFrameSpellBar:CreateTexture(nil, "BACKGROUND", nil, 0)
	VDW.VCB.BossIconShieldLeft1:SetPoint("TOPLEFT", -27, 4)
	VDW.VCB.BossIconShieldLeft1:SetSize(29, 33)
	VDW.VCB.BossIconShieldLeft1:SetAtlas("ui-castingbar-shield")
	VDW.VCB.BossIconShieldLeft1:SetAlpha(0)
	VDW.VCB.BossIconShieldLeft2 = Boss2TargetFrameSpellBar:CreateTexture(nil, "BACKGROUND", nil, 0)
	VDW.VCB.BossIconShieldLeft2:SetPoint("TOPLEFT", -27, 4)
	VDW.VCB.BossIconShieldLeft2:SetSize(29, 33)
	VDW.VCB.BossIconShieldLeft2:SetAtlas("ui-castingbar-shield")
	VDW.VCB.BossIconShieldLeft2:SetAlpha(0)
	VDW.VCB.BossIconShieldLeft3  = Boss3TargetFrameSpellBar:CreateTexture(nil, "BACKGROUND", nil, 0)
	VDW.VCB.BossIconShieldLeft3:SetPoint("TOPLEFT", -27, 4)
	VDW.VCB.BossIconShieldLeft3:SetSize(29, 33)
	VDW.VCB.BossIconShieldLeft3:SetAtlas("ui-castingbar-shield")
	VDW.VCB.BossIconShieldLeft3:SetAlpha(0)
	VDW.VCB.BossIconShieldLeft4  = Boss4TargetFrameSpellBar:CreateTexture(nil, "BACKGROUND", nil, 0)
	VDW.VCB.BossIconShieldLeft4:SetPoint("TOPLEFT", -27, 4)
	VDW.VCB.BossIconShieldLeft4:SetSize(29, 33)
	VDW.VCB.BossIconShieldLeft4:SetAtlas("ui-castingbar-shield")
	VDW.VCB.BossIconShieldLeft4:SetAlpha(0)
	VDW.VCB.BossIconShieldLeft5  = Boss5TargetFrameSpellBar:CreateTexture(nil, "BACKGROUND", nil, 0)
	VDW.VCB.BossIconShieldLeft5:SetPoint("TOPLEFT", -27, 4)
	VDW.VCB.BossIconShieldLeft5:SetSize(29, 33)
	VDW.VCB.BossIconShieldLeft5:SetAtlas("ui-castingbar-shield")
	VDW.VCB.BossIconShieldLeft5:SetAlpha(0)
-- shield icon right
	VDW.VCB.BossIconShieldRight1 = Boss1TargetFrameSpellBar:CreateTexture(nil, "BACKGROUND", nil, 0)
	VDW.VCB.BossIconShieldRight1:SetPoint("TOPRIGHT", 27, 4)
	VDW.VCB.BossIconShieldRight1:SetSize(29, 33)
	VDW.VCB.BossIconShieldRight1:SetAtlas("ui-castingbar-shield")
	VDW.VCB.BossIconShieldRight2 = Boss2TargetFrameSpellBar:CreateTexture(nil, "BACKGROUND", nil, 0)
	VDW.VCB.BossIconShieldRight2:SetPoint("TOPRIGHT", 27, 4)
	VDW.VCB.BossIconShieldRight2:SetSize(29, 33)
	VDW.VCB.BossIconShieldRight2:SetAtlas("ui-castingbar-shield")
	VDW.VCB.BossIconShieldRight3 = Boss3TargetFrameSpellBar:CreateTexture(nil, "BACKGROUND", nil, 0)
	VDW.VCB.BossIconShieldRight3:SetPoint("TOPRIGHT", 27, 4)
	VDW.VCB.BossIconShieldRight3:SetSize(29, 33)
	VDW.VCB.BossIconShieldRight3:SetAtlas("ui-castingbar-shield")
	VDW.VCB.BossIconShieldRight4 = Boss4TargetFrameSpellBar:CreateTexture(nil, "BACKGROUND", nil, 0)
	VDW.VCB.BossIconShieldRight4:SetPoint("TOPRIGHT", 27, 4)
	VDW.VCB.BossIconShieldRight4:SetSize(29, 33)
	VDW.VCB.BossIconShieldRight4:SetAtlas("ui-castingbar-shield")
	VDW.VCB.BossIconShieldRight5 = Boss5TargetFrameSpellBar:CreateTexture(nil, "BACKGROUND", nil, 0)
	VDW.VCB.BossIconShieldRight5:SetPoint("TOPRIGHT", 27, 4)
	VDW.VCB.BossIconShieldRight5:SetSize(29, 33)
	VDW.VCB.BossIconShieldRight5:SetAtlas("ui-castingbar-shield")
-- Text Border Top
	VDW.VCB.BossTextBorderTop1 = Boss1TargetFrameSpellBar:CreateTexture(nil, "BACKGROUND", nil, -7)
	VDW.VCB.BossTextBorderTop1:SetPoint("TOPLEFT", 0, 12)
	VDW.VCB.BossTextBorderTop1:SetPoint("BOTTOMRIGHT", 0, 0)
	VDW.VCB.BossTextBorderTop1:SetAtlas("ui-castingbar-textbox")
	VDW.VCB.BossTextBorderTop2 = Boss2TargetFrameSpellBar:CreateTexture(nil, "BACKGROUND", nil, -7)
	VDW.VCB.BossTextBorderTop2:SetPoint("TOPLEFT", 0, 12)
	VDW.VCB.BossTextBorderTop2:SetPoint("BOTTOMRIGHT", 0, 0)
	VDW.VCB.BossTextBorderTop2:SetAtlas("ui-castingbar-textbox")
	VDW.VCB.BossTextBorderTop3 = Boss3TargetFrameSpellBar:CreateTexture(nil, "BACKGROUND", nil, -7)
	VDW.VCB.BossTextBorderTop3:SetPoint("TOPLEFT", 0, 12)
	VDW.VCB.BossTextBorderTop3:SetPoint("BOTTOMRIGHT", 0, 0)
	VDW.VCB.BossTextBorderTop3:SetAtlas("ui-castingbar-textbox")
	VDW.VCB.BossTextBorderTop4 = Boss4TargetFrameSpellBar:CreateTexture(nil, "BACKGROUND", nil, -7)
	VDW.VCB.BossTextBorderTop4:SetPoint("TOPLEFT", 0, 12)
	VDW.VCB.BossTextBorderTop4:SetPoint("BOTTOMRIGHT", 0, 0)
	VDW.VCB.BossTextBorderTop4:SetAtlas("ui-castingbar-textbox")
	VDW.VCB.BossTextBorderTop5 = Boss5TargetFrameSpellBar:CreateTexture(nil, "BACKGROUND", nil, -7)
	VDW.VCB.BossTextBorderTop5:SetPoint("TOPLEFT", 0, 12)
	VDW.VCB.BossTextBorderTop5:SetPoint("BOTTOMRIGHT", 0, 0)
	VDW.VCB.BossTextBorderTop5:SetAtlas("ui-castingbar-textbox")
-- Text Border Bottom
	VDW.VCB.BossTextBorderBottom1 = Boss1TargetFrameSpellBar:CreateTexture(nil, "BACKGROUND", nil, -7)
	VDW.VCB.BossTextBorderBottom1:SetPoint("TOPLEFT", 0, 0)
	VDW.VCB.BossTextBorderBottom1:SetPoint("BOTTOMRIGHT", 0, -12)
	VDW.VCB.BossTextBorderBottom1:SetAtlas("ui-castingbar-textbox")
	VDW.VCB.BossTextBorderBottom2 = Boss2TargetFrameSpellBar:CreateTexture(nil, "BACKGROUND", nil, -7)
	VDW.VCB.BossTextBorderBottom2:SetPoint("TOPLEFT", 0, 0)
	VDW.VCB.BossTextBorderBottom2:SetPoint("BOTTOMRIGHT", 0, -12)
	VDW.VCB.BossTextBorderBottom2:SetAtlas("ui-castingbar-textbox")
	VDW.VCB.BossTextBorderBottom3 = Boss3TargetFrameSpellBar:CreateTexture(nil, "BACKGROUND", nil, -7)
	VDW.VCB.BossTextBorderBottom3:SetPoint("TOPLEFT", 0, 0)
	VDW.VCB.BossTextBorderBottom3:SetPoint("BOTTOMRIGHT", 0, -12)
	VDW.VCB.BossTextBorderBottom3:SetAtlas("ui-castingbar-textbox")
	VDW.VCB.BossTextBorderBottom4 = Boss4TargetFrameSpellBar:CreateTexture(nil, "BACKGROUND", nil, -7)
	VDW.VCB.BossTextBorderBottom4:SetPoint("TOPLEFT", 0, 0)
	VDW.VCB.BossTextBorderBottom4:SetPoint("BOTTOMRIGHT", 0, -12)
	VDW.VCB.BossTextBorderBottom4:SetAtlas("ui-castingbar-textbox")
	VDW.VCB.BossTextBorderBottom5 = Boss5TargetFrameSpellBar:CreateTexture(nil, "BACKGROUND", nil, -7)
	VDW.VCB.BossTextBorderBottom5:SetPoint("TOPLEFT", 0, 0)
	VDW.VCB.BossTextBorderBottom5:SetPoint("BOTTOMRIGHT", 0, -12)
	VDW.VCB.BossTextBorderBottom5:SetAtlas("ui-castingbar-textbox")
end
-- =========================
-- extra texts
-- =========================
-- function for the texts
local function createTexts()
	VDW.VCB.BossTextName1 = Boss1TargetFrameSpellBar:CreateFontString(nil, "OVERLAY", nil)
	VDW.VCB.BossTextName1:SetFontObject("GameFontHighlightSmall")
	VDW.VCB.BossTextName2 = Boss2TargetFrameSpellBar:CreateFontString(nil, "OVERLAY", nil)
	VDW.VCB.BossTextName2:SetFontObject("GameFontHighlightSmall")
	VDW.VCB.BossTextName3 = Boss3TargetFrameSpellBar:CreateFontString(nil, "OVERLAY", nil)
	VDW.VCB.BossTextName3:SetFontObject("GameFontHighlightSmall")
	VDW.VCB.BossTextName4 = Boss4TargetFrameSpellBar:CreateFontString(nil, "OVERLAY", nil)
	VDW.VCB.BossTextName4:SetFontObject("GameFontHighlightSmall")
	VDW.VCB.BossTextName5 = Boss5TargetFrameSpellBar:CreateFontString(nil, "OVERLAY", nil)
	VDW.VCB.BossTextName5:SetFontObject("GameFontHighlightSmall")
	
	VDW.VCB.BossTextCurrent1 = Boss1TargetFrameSpellBar:CreateFontString(nil, "OVERLAY", nil)
	VDW.VCB.BossTextCurrent1:SetFontObject("GameFontHighlightSmall")
	VDW.VCB.BossTextCurrent2 = Boss2TargetFrameSpellBar:CreateFontString(nil, "OVERLAY", nil)
	VDW.VCB.BossTextCurrent2:SetFontObject("GameFontHighlightSmall")
	VDW.VCB.BossTextCurrent3 = Boss3TargetFrameSpellBar:CreateFontString(nil, "OVERLAY", nil)
	VDW.VCB.BossTextCurrent3:SetFontObject("GameFontHighlightSmall")
	VDW.VCB.BossTextCurrent4 = Boss4TargetFrameSpellBar:CreateFontString(nil, "OVERLAY", nil)
	VDW.VCB.BossTextCurrent4:SetFontObject("GameFontHighlightSmall")
	VDW.VCB.BossTextCurrent5 = Boss5TargetFrameSpellBar:CreateFontString(nil, "OVERLAY", nil)
	VDW.VCB.BossTextCurrent5:SetFontObject("GameFontHighlightSmall")
	
	VDW.VCB.BossTextBoth1 = Boss1TargetFrameSpellBar:CreateFontString(nil, "OVERLAY", nil)
	VDW.VCB.BossTextBoth1:SetFontObject("GameFontHighlightSmall")
	VDW.VCB.BossTextBoth2 = Boss2TargetFrameSpellBar:CreateFontString(nil, "OVERLAY", nil)
	VDW.VCB.BossTextBoth2:SetFontObject("GameFontHighlightSmall")
	VDW.VCB.BossTextBoth3 = Boss3TargetFrameSpellBar:CreateFontString(nil, "OVERLAY", nil)
	VDW.VCB.BossTextBoth3:SetFontObject("GameFontHighlightSmall")
	VDW.VCB.BossTextBoth4 = Boss4TargetFrameSpellBar:CreateFontString(nil, "OVERLAY", nil)
	VDW.VCB.BossTextBoth4:SetFontObject("GameFontHighlightSmall")
	VDW.VCB.BossTextBoth5 = Boss5TargetFrameSpellBar:CreateFontString(nil, "OVERLAY", nil)
	VDW.VCB.BossTextBoth5:SetFontObject("GameFontHighlightSmall")
	
	VDW.VCB.BossTextTotal1 = Boss1TargetFrameSpellBar:CreateFontString(nil, "OVERLAY", nil)
	VDW.VCB.BossTextTotal1:SetFontObject("GameFontHighlightSmall")
	VDW.VCB.BossTextTotal2 = Boss2TargetFrameSpellBar:CreateFontString(nil, "OVERLAY", nil)
	VDW.VCB.BossTextTotal2:SetFontObject("GameFontHighlightSmall")
	VDW.VCB.BossTextTotal3 = Boss3TargetFrameSpellBar:CreateFontString(nil, "OVERLAY", nil)
	VDW.VCB.BossTextTotal3:SetFontObject("GameFontHighlightSmall")
	VDW.VCB.BossTextTotal4 = Boss4TargetFrameSpellBar:CreateFontString(nil, "OVERLAY", nil)
	VDW.VCB.BossTextTotal4:SetFontObject("GameFontHighlightSmall")
	VDW.VCB.BossTextTotal5 = Boss5TargetFrameSpellBar:CreateFontString(nil, "OVERLAY", nil)
	VDW.VCB.BossTextTotal5:SetFontObject("GameFontHighlightSmall")
end
-- =========================
-- functions protect the options
-- =========================
local function ProtectOptions()
	local loc = GetLocale()
	if loc ~= VCBspecialSettings["LastLocation"] then
		for k, v in pairs(VDW.Local.Translate) do
			for i, s in pairs (v) do
				if VCBsettings.Boss.Icon.Position == s then
					VCBsettings.Boss.Icon.Position = VDW.Local.Translate[loc][i]
				end
				if VCBsettings.Boss.Shield.Position == s then
					VCBsettings.Boss.Shield.Position = VDW.Local.Translate[loc][i]
				end
				if VCBsettings.Boss.TextBorder.Position == s then
					VCBsettings.Boss.TextBorder.Position = VDW.Local.Translate[loc][i]
				end
				if VCBsettings.Boss.NameText.Position == s then
					VCBsettings.Boss.NameText.Position = VDW.Local.Translate[loc][i]
				end
				if VCBsettings.Boss.CurrentTimeText.Position == s then
					VCBsettings.Boss.CurrentTimeText.Position = VDW.Local.Translate[loc][i]
				end
				if VCBsettings.Boss.BothTimeText.Position == s then
					VCBsettings.Boss.BothTimeText.Position = VDW.Local.Translate[loc][i]
				end
				if VCBsettings.Boss.TotalTimeText.Position == s then
					VCBsettings.Boss.TotalTimeText.Position = VDW.Local.Translate[loc][i]
				end
				if VCBsettings.Boss.CurrentTimeText.Direction == s then
					VCBsettings.Boss.CurrentTimeText.Direction = VDW.Local.Translate[loc][i]
				end
				if VCBsettings.Boss.BothTimeText.Direction == s then
					VCBsettings.Boss.BothTimeText.Direction = VDW.Local.Translate[loc][i]
				end
				if VCBsettings.Boss.CurrentTimeText.Sec == s then
					VCBsettings.Boss.CurrentTimeText.Sec = VDW.Local.Translate[loc][i]
				end
				if VCBsettings.Boss.BothTimeText.Sec == s then
					VCBsettings.Boss.BothTimeText.Sec = VDW.Local.Translate[loc][i]
				end
				if VCBsettings.Boss.TotalTimeText.Sec == s then
					VCBsettings.Boss.TotalTimeText.Sec = VDW.Local.Translate[loc][i]
				end
				if VCBsettings.Boss.StatusBar.Color == s then
					VCBsettings.Boss.StatusBar.Color = VDW.Local.Translate[loc][i]
				end
				if VCBsettings.Boss.StatusBar.Style == s then
					VCBsettings.Boss.StatusBar.Style = VDW.Local.Translate[loc][i]
				end
				if VCBsettings.Boss.Border.Color == s then
					VCBsettings.Boss.Border.Color = VDW.Local.Translate[loc][i]
				end
				if VCBsettings.Boss.Border.Style == s then
					VCBsettings.Boss.Border.Style = VDW.Local.Translate[loc][i]
				end
			end
		end
	end
end
-- =========================
-- functions OnUpdate and OnShow
-- =========================
-- icon position
local function iconPosition(self, i)
	print("iconPosition is not Working!")
end
-- shield icon position
local function shieldPosition(uninterruptible, i)
	print("shieldPosition is not Working!")
end
-- border text position
local function bordertextPosition (borderText1, borderText2)
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
local function currentUpdate(self, i)
	print("currentUpdate is not Working!")
end
-- both time update
local function bothUpdate(self, i)
	print("bothUpdate is not Working!")
end
-- total time update
local function totalUpdate(self, i)
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
local function statusbarStyle(self, i)
	print("statusbarStyle is not Working!")
end
-- border bar style
local function borderStyle(self, i)
	print("borderStyle is not Working!")
end
-- =========================
-- checking position functions
-- =========================
-- check icon
function VDW.VCB.chkBossIconPosition()
	if VCBsettings["Boss"]["Icon"]["Position"] == G.OPTIONS_V_HIDE then
		function iconPosition(self,i)
			if VDW.VCB["BossIconSpellLeft"..i]:IsShown() then VDW.VCB["BossIconSpellLeft"..i]:Hide() end
			if VDW.VCB["BossIconSpellRight"..i]:IsShown() then VDW.VCB["BossIconSpellRight"..i]:Hide() end
		end
	elseif VCBsettings["Boss"]["Icon"]["Position"] == G.OPTIONS_P_LEFT then
		function iconPosition(self,i)
			if not VDW.VCB["BossIconSpellLeft"..i]:IsShown() then VDW.VCB["BossIconSpellLeft"..i]:Show() end
			if VDW.VCB["BossIconSpellRight"..i]:IsShown() then VDW.VCB["BossIconSpellRight"..i]:Hide() end
		end
	elseif VCBsettings["Boss"]["Icon"]["Position"] == G.OPTIONS_P_RIGHT then
		function iconPosition(self,i)
			if VDW.VCB["BossIconSpellLeft"..i]:IsShown() then VDW.VCB["BossIconSpellLeft"..i]:Hide() end
			if not VDW.VCB["BossIconSpellRight"..i]:IsShown() then VDW.VCB["BossIconSpellRight"..i]:Show() end
		end
	elseif VCBsettings["Boss"]["Icon"]["Position"] == G.OPTIONS_P_BOTH then	
		function iconPosition(self,i)
			if not VDW.VCB["BossIconSpellLeft"..i]:IsShown() then VDW.VCB["BossIconSpellLeft"..i]:Show() end
			if not VDW.VCB["BossIconSpellRight"..i]:IsShown() then VDW.VCB["BossIconSpellRight"..i]:Show() end
		end
	end
end
-- check shield
function VDW.VCB.chkBossShieldPosition()
	if VCBsettings.Boss.Shield.Position == G.OPTIONS_V_HIDE then
		function shieldPosition(uninterruptible,i)
			VDW.VCB["BossIconShieldLeft"..i]:SetAlpha(0)
			VDW.VCB["BossIconShieldRight"..i]:SetAlpha(0)
		end
	elseif VCBsettings.Boss.Shield.Position == G.OPTIONS_P_LEFT then
		function shieldPosition(uninterruptible,i)
			VDW.VCB["BossIconShieldLeft"..i]:SetAlphaFromBoolean(uninterruptible, 255, 0)
			VDW.VCB["BossIconShieldRight"..i]:SetAlpha(0)
		end
	elseif VCBsettings.Boss.Shield.Position == G.OPTIONS_P_RIGHT then
		function shieldPosition(uninterruptible,i)
			VDW.VCB["BossIconShieldLeft"..i]:SetAlpha(0)
			VDW.VCB["BossIconShieldRight"..i]:SetAlphaFromBoolean(uninterruptible, 255, 0)
		end
	elseif VCBsettings.Boss.Shield.Position == G.OPTIONS_P_BOTH then
		function shieldPosition(uninterruptible,i)
			VDW.VCB["BossIconShieldLeft"..i]:SetAlphaFromBoolean(uninterruptible, 255, 0)
			VDW.VCB["BossIconShieldRight"..i]:SetAlphaFromBoolean(uninterruptible, 255, 0)
		end
	end
end
-- check text border
function VDW.VCB.chkBossBorderTextPosition()
	if VCBsettings.Boss.BorderText.Position == G.OPTIONS_V_HIDE then
		function bordertextPosition (borderText1, borderText2)
			borderText1:Hide()
			borderText2:Hide()
		end
	elseif VCBsettings.Boss.BorderText.Position == G.OPTIONS_P_TOP then
		function bordertextPosition (borderText1, borderText2)
			borderText1:Show()
			borderText2:Hide()
		end
	elseif VCBsettings.Boss.BorderText.Position == G.OPTIONS_P_BOTTOM then
		function bordertextPosition (borderText1, borderText2)
			borderText1:Hide()
			borderText2:Show()
		end
	elseif VCBsettings.Boss.BorderText.Position == G.OPTIONS_P_BOTH then
		function bordertextPosition (borderText1, borderText2)
			borderText1:Show()
			borderText2:Show()
		end
	end
end
-- check name text position
function VDW.VCB.chkNameTxtBoss()
	if VCBsettings["Boss"]["NameText"]["Position"] == G.OPTIONS_V_HIDE then
		function namePosition(self,i)
			if VDW.VCB["BossTextName"..i]:IsShown() then VDW.VCB["BossTextName"..i]:Hide() end
		end
	elseif VCBsettings["Boss"]["NameText"]["Position"] == G.OPTIONS_P_TOPLEFT then
		function namePosition(self,i)
			VDW.VCB["BossTextName"..i]:ClearAllPoints()
			VDW.VCB["BossTextName"..i]:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 4, 1)
			VDW.VCB["BossTextName"..i]:SetJustifyH("LEFT")
			if not VDW.VCB["BossTextName"..i]:IsShown() then VDW.VCB["BossTextName"..i]:Show() end
		end
	elseif VCBsettings["Boss"]["NameText"]["Position"] == G.OPTIONS_P_LEFT then
		function namePosition(self,i)
			VDW.VCB["BossTextName"..i]:ClearAllPoints()
			VDW.VCB["BossTextName"..i]:SetPoint("LEFT", self, "LEFT", 4, 0)
			VDW.VCB["BossTextName"..i]:SetJustifyH("LEFT")
			if not VDW.VCB["BossTextName"..i]:IsShown() then VDW.VCB["BossTextName"..i]:Show() end
		end
	elseif VCBsettings["Boss"]["NameText"]["Position"] == G.OPTIONS_P_BOTTOMLEFT then
		function namePosition(self,i)
			VDW.VCB["BossTextName"..i]:ClearAllPoints()
			VDW.VCB["BossTextName"..i]:SetPoint("TOPLEFT", self, "BOTTOMLEFT", 4, -1)
			VDW.VCB["BossTextName"..i]:SetJustifyH("LEFT")
			if not VDW.VCB["BossTextName"..i]:IsShown() then VDW.VCB["BossTextName"..i]:Show() end
		end
	elseif VCBsettings["Boss"]["NameText"]["Position"] == G.OPTIONS_P_TOP then
		function namePosition(self,i)
			VDW.VCB["BossTextName"..i]:ClearAllPoints()
			VDW.VCB["BossTextName"..i]:SetPoint("BOTTOM", self, "TOP", 0, 1)
			VDW.VCB["BossTextName"..i]:SetJustifyH("CENTER")
			if not VDW.VCB["BossTextName"..i]:IsShown() then VDW.VCB["BossTextName"..i]:Show() end
			end
	elseif VCBsettings["Boss"]["NameText"]["Position"] == G.OPTIONS_P_CENTER then
		function namePosition(self,i)
			VDW.VCB["BossTextName"..i]:ClearAllPoints()
			VDW.VCB["BossTextName"..i]:SetPoint("CENTER", self, "CENTER", 0, 0)
			VDW.VCB["BossTextName"..i]:SetJustifyH("CENTER")
			if not VDW.VCB["BossTextName"..i]:IsShown() then VDW.VCB["BossTextName"..i]:Show() end
			end
	elseif VCBsettings["Boss"]["NameText"]["Position"] == G.OPTIONS_P_BOTTOM then
		function namePosition(self,i)
			VDW.VCB["BossTextName"..i]:ClearAllPoints()
			VDW.VCB["BossTextName"..i]:SetPoint("TOP", self, "BOTTOM", 0, -1)
			VDW.VCB["BossTextName"..i]:SetJustifyH("CENTER")
			if not VDW.VCB["BossTextName"..i]:IsShown() then VDW.VCB["BossTextName"..i]:Show() end
		end
	elseif VCBsettings["Boss"]["NameText"]["Position"] == G.OPTIONS_P_TOPRIGHT then
		function namePosition(self,i)
			VDW.VCB["BossTextName"..i]:ClearAllPoints()
			VDW.VCB["BossTextName"..i]:SetPoint("BOTTOMRIGHT", self, "TOPRIGHT", -4, 1)
			VDW.VCB["BossTextName"..i]:SetJustifyH("RIGHT")
			if not VDW.VCB["BossTextName"..i]:IsShown() then VDW.VCB["BossTextName"..i]:Show() end
		end
	elseif VCBsettings["Boss"]["NameText"]["Position"] == G.OPTIONS_P_RIGHT then
		function namePosition(self,i)
			VDW.VCB["BossTextName"..i]:ClearAllPoints()
			VDW.VCB["BossTextName"..i]:SetPoint("RIGHT", self, "RIGHT", -4, 0)
			VDW.VCB["BossTextName"..i]:SetJustifyH("RIGHT")
			if not VDW.VCB["BossTextName"..i]:IsShown() then VDW.VCB["BossTextName"..i]:Show() end
		end
	elseif VCBsettings["Boss"]["NameText"]["Position"] == G.OPTIONS_P_BOTTOMRIGHT then
		function namePosition(self,i)
			VDW.VCB["BossTextName"..i]:ClearAllPoints()
			VDW.VCB["BossTextName"..i]:SetPoint("TOPRIGHT", self, "BOTTOMRIGHT", -4, -1)
			VDW.VCB["BossTextName"..i]:SetJustifyH("RIGHT")
			if not VDW.VCB["BossTextName"..i]:IsShown() then VDW.VCB["BossTextName"..i]:Show() end
		end
	end
end
-- check current casting time text position
function VDW.VCB.chkCurrentTxtBoss()
	if VCBsettings["Boss"]["CurrentTimeText"]["Position"] == G.OPTIONS_V_HIDE then
		function currentPostion(self,i)
			if VDW.VCB["BossTextCurrent"..i]:IsShown() then VDW.VCB["BossTextCurrent"..i]:Hide() end
		end
	elseif VCBsettings["Boss"]["CurrentTimeText"]["Position"] == G.OPTIONS_P_TOPLEFT then
		function currentPostion(self,i)
			VDW.VCB["BossTextCurrent"..i]:ClearAllPoints()
			VDW.VCB["BossTextCurrent"..i]:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 4, 1)
			if not VDW.VCB["BossTextCurrent"..i]:IsShown() then VDW.VCB["BossTextCurrent"..i]:Show() end
		end
	elseif VCBsettings["Boss"]["CurrentTimeText"]["Position"] == G.OPTIONS_P_LEFT then
		function currentPostion(self,i)
			VDW.VCB["BossTextCurrent"..i]:ClearAllPoints()
			VDW.VCB["BossTextCurrent"..i]:SetPoint("LEFT", self, "LEFT", 4, 0)
			if not VDW.VCB["BossTextCurrent"..i]:IsShown() then VDW.VCB["BossTextCurrent"..i]:Show() end
		end
	elseif VCBsettings["Boss"]["CurrentTimeText"]["Position"] == G.OPTIONS_P_BOTTOMLEFT then
		function currentPostion(self,i)
			VDW.VCB["BossTextCurrent"..i]:ClearAllPoints()
			VDW.VCB["BossTextCurrent"..i]:SetPoint("TOPLEFT", self, "BOTTOMLEFT", 4, -1)
			if not VDW.VCB["BossTextCurrent"..i]:IsShown() then VDW.VCB["BossTextCurrent"..i]:Show() end
		end
	elseif VCBsettings["Boss"]["CurrentTimeText"]["Position"] == G.OPTIONS_P_TOP then
		function currentPostion(self,i)
			VDW.VCB["BossTextCurrent"..i]:ClearAllPoints()
			VDW.VCB["BossTextCurrent"..i]:SetPoint("BOTTOM", self, "TOP", 0, 1)
			if not VDW.VCB["BossTextCurrent"..i]:IsShown() then VDW.VCB["BossTextCurrent"..i]:Show() end
		end
	elseif VCBsettings["Boss"]["CurrentTimeText"]["Position"] == G.OPTIONS_P_CENTER then
		function currentPostion(self,i)
			VDW.VCB["BossTextCurrent"..i]:ClearAllPoints()
			VDW.VCB["BossTextCurrent"..i]:SetPoint("CENTER", self, "CENTER", 0, 0)
			if not VDW.VCB["BossTextCurrent"..i]:IsShown() then VDW.VCB["BossTextCurrent"..i]:Show() end
		end
	elseif VCBsettings["Boss"]["CurrentTimeText"]["Position"] == G.OPTIONS_P_BOTTOM then
		function currentPostion(self,i)
			VDW.VCB["BossTextCurrent"..i]:ClearAllPoints()
			VDW.VCB["BossTextCurrent"..i]:SetPoint("TOP", self, "BOTTOM", 0, -1)
			if not VDW.VCB["BossTextCurrent"..i]:IsShown() then VDW.VCB["BossTextCurrent"..i]:Show() end
		end
	elseif VCBsettings["Boss"]["CurrentTimeText"]["Position"] == G.OPTIONS_P_TOPRIGHT then
		function currentPostion(self,i)
			VDW.VCB["BossTextCurrent"..i]:ClearAllPoints()
			VDW.VCB["BossTextCurrent"..i]:SetPoint("BOTTOMRIGHT", self, "TOPRIGHT", -4, 1)
			if not VDW.VCB["BossTextCurrent"..i]:IsShown() then VDW.VCB["BossTextCurrent"..i]:Show() end
		end
	elseif VCBsettings["Boss"]["CurrentTimeText"]["Position"] == G.OPTIONS_P_RIGHT then
		function currentPostion(self,i)
			VDW.VCB["BossTextCurrent"..i]:ClearAllPoints()
			VDW.VCB["BossTextCurrent"..i]:SetPoint("RIGHT", self, "RIGHT", -4, 0)
			if not VDW.VCB["BossTextCurrent"..i]:IsShown() then VDW.VCB["BossTextCurrent"..i]:Show() end
		end
	elseif VCBsettings["Boss"]["CurrentTimeText"]["Position"] == G.OPTIONS_P_BOTTOMRIGHT then
		function currentPostion(self,i)
			VDW.VCB["BossTextCurrent"..i]:ClearAllPoints()
			VDW.VCB["BossTextCurrent"..i]:SetPoint("TOPRIGHT", self, "BOTTOMRIGHT", -4, -1)
			if not VDW.VCB["BossTextCurrent"..i]:IsShown() then VDW.VCB["BossTextCurrent"..i]:Show() end
		end
	end
end
-- check both casting time text position
function VDW.VCB.chkBothTxtBoss()
	if VCBsettings["Boss"]["BothTimeText"]["Position"] == G.OPTIONS_V_HIDE then
		function bothPostion(self,i)
			if VDW.VCB["BossTextBoth"..i]:IsShown() then VDW.VCB["BossTextBoth"..i]:Hide() end
		end
	elseif VCBsettings["Boss"]["BothTimeText"]["Position"] == G.OPTIONS_P_TOPLEFT then
		function bothPostion(self,i)
			VDW.VCB["BossTextBoth"..i]:ClearAllPoints()
			VDW.VCB["BossTextBoth"..i]:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 4, 1)
			if not VDW.VCB["BossTextBoth"..i]:IsShown() then VDW.VCB["BossTextBoth"..i]:Show() end
		end
	elseif VCBsettings["Boss"]["BothTimeText"]["Position"] == G.OPTIONS_P_LEFT then
		function bothPostion(self,i)
			VDW.VCB["BossTextBoth"..i]:ClearAllPoints()
			VDW.VCB["BossTextBoth"..i]:SetPoint("LEFT", self, "LEFT", 4, 0)
			if not VDW.VCB["BossTextBoth"..i]:IsShown() then VDW.VCB["BossTextBoth"..i]:Show() end
		end
	elseif VCBsettings["Boss"]["BothTimeText"]["Position"] == G.OPTIONS_P_BOTTOMLEFT then
		function bothPostion(self,i)
			VDW.VCB["BossTextBoth"..i]:ClearAllPoints()
			VDW.VCB["BossTextBoth"..i]:SetPoint("TOPLEFT", self, "BOTTOMLEFT", 4, -1)
			if not VDW.VCB["BossTextBoth"..i]:IsShown() then VDW.VCB["BossTextBoth"..i]:Show() end
		end
	elseif VCBsettings["Boss"]["BothTimeText"]["Position"] == G.OPTIONS_P_TOP then
		function bothPostion(self,i)
			VDW.VCB["BossTextBoth"..i]:ClearAllPoints()
			VDW.VCB["BossTextBoth"..i]:SetPoint("BOTTOM", self, "TOP", 0, 1)
			if not VDW.VCB["BossTextBoth"..i]:IsShown() then VDW.VCB["BossTextBoth"..i]:Show() end
		end
	elseif VCBsettings["Boss"]["BothTimeText"]["Position"] == G.OPTIONS_P_CENTER then
		function bothPostion(self,i)
			VDW.VCB["BossTextBoth"..i]:ClearAllPoints()
			VDW.VCB["BossTextBoth"..i]:SetPoint("CENTER", self, "CENTER", 0, 0)
			if not VDW.VCB["BossTextBoth"..i]:IsShown() then VDW.VCB["BossTextBoth"..i]:Show() end
		end
	elseif VCBsettings["Boss"]["BothTimeText"]["Position"] == G.OPTIONS_P_BOTTOM then
		function bothPostion(self,i)
			VDW.VCB["BossTextBoth"..i]:ClearAllPoints()
			VDW.VCB["BossTextBoth"..i]:SetPoint("TOP", self, "BOTTOM", 0, -1)
			if not VDW.VCB["BossTextBoth"..i]:IsShown() then VDW.VCB["BossTextBoth"..i]:Show() end
		end
	elseif VCBsettings["Boss"]["BothTimeText"]["Position"] == G.OPTIONS_P_TOPRIGHT then
		function bothPostion(self,i)
			VDW.VCB["BossTextBoth"..i]:ClearAllPoints()
			VDW.VCB["BossTextBoth"..i]:SetPoint("BOTTOMRIGHT", self, "TOPRIGHT", -4, 1)
			if not VDW.VCB["BossTextBoth"..i]:IsShown() then VDW.VCB["BossTextBoth"..i]:Show() end
		end
	elseif VCBsettings["Boss"]["BothTimeText"]["Position"] == G.OPTIONS_P_RIGHT then
		function bothPostion(self,i)
			VDW.VCB["BossTextBoth"..i]:ClearAllPoints()
			VDW.VCB["BossTextBoth"..i]:SetPoint("RIGHT", self, "RIGHT", -4, 0)
			if not VDW.VCB["BossTextBoth"..i]:IsShown() then VDW.VCB["BossTextBoth"..i]:Show() end
		end
	elseif VCBsettings["Boss"]["BothTimeText"]["Position"] == G.OPTIONS_P_BOTTOMRIGHT then
		function bothPostion(self,i)
			VDW.VCB["BossTextBoth"..i]:ClearAllPoints()
			VDW.VCB["BossTextBoth"..i]:SetPoint("TOPRIGHT", self, "BOTTOMRIGHT", -4, -1)
			if not VDW.VCB["BossTextBoth"..i]:IsShown() then VDW.VCB["BossTextBoth"..i]:Show() end
		end
	end
end
-- check total casting time text position
function VDW.VCB.chkTotalTxtBoss()
	if VCBsettings["Boss"]["TotalTimeText"]["Position"] == G.OPTIONS_V_HIDE then
		function totalPostion(self,i)
			if VDW.VCB["BossTextTotal"..i]:IsShown() then VDW.VCB["BossTextTotal"..i]:Hide() end
		end
	elseif VCBsettings["Boss"]["TotalTimeText"]["Position"] == G.OPTIONS_P_TOPLEFT then
		function totalPostion(self,i)
			VDW.VCB["BossTextTotal"..i]:ClearAllPoints()
			VDW.VCB["BossTextTotal"..i]:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 4, 1)
			if not VDW.VCB["BossTextTotal"..i]:IsShown() then VDW.VCB["BossTextTotal"..i]:Show() end
		end
	elseif VCBsettings["Boss"]["TotalTimeText"]["Position"] == G.OPTIONS_P_LEFT then
		function totalPostion(self,i)
			VDW.VCB["BossTextTotal"..i]:ClearAllPoints()
			VDW.VCB["BossTextTotal"..i]:SetPoint("LEFT", self, "LEFT", 4, 0)
			if not VDW.VCB["BossTextTotal"..i]:IsShown() then VDW.VCB["BossTextTotal"..i]:Show() end
		end
	elseif VCBsettings["Boss"]["TotalTimeText"]["Position"] == G.OPTIONS_P_BOTTOMLEFT then
		function totalPostion(self,i)
			VDW.VCB["BossTextTotal"..i]:ClearAllPoints()
			VDW.VCB["BossTextTotal"..i]:SetPoint("TOPLEFT", self, "BOTTOMLEFT", 4, -1)
			if not VDW.VCB["BossTextTotal"..i]:IsShown() then VDW.VCB["BossTextTotal"..i]:Show() end
		end
	elseif VCBsettings["Boss"]["TotalTimeText"]["Position"] == G.OPTIONS_P_TOP then
		function totalPostion(self,i)
			VDW.VCB["BossTextTotal"..i]:ClearAllPoints()
			VDW.VCB["BossTextTotal"..i]:SetPoint("BOTTOM", self, "TOP", 0, 1)
			if not VDW.VCB["BossTextTotal"..i]:IsShown() then VDW.VCB["BossTextTotal"..i]:Show() end
		end
	elseif VCBsettings["Boss"]["TotalTimeText"]["Position"] == G.OPTIONS_P_CENTER then
		function totalPostion(self,i)
			VDW.VCB["BossTextTotal"..i]:ClearAllPoints()
			VDW.VCB["BossTextTotal"..i]:SetPoint("CENTER", self, "CENTER", 0, 0)
			if not VDW.VCB["BossTextTotal"..i]:IsShown() then VDW.VCB["BossTextTotal"..i]:Show() end
		end
	elseif VCBsettings["Boss"]["TotalTimeText"]["Position"] == G.OPTIONS_P_BOTTOM then
		function totalPostion(self,i)
			VDW.VCB["BossTextTotal"..i]:ClearAllPoints()
			VDW.VCB["BossTextTotal"..i]:SetPoint("TOP", self, "BOTTOM", 0, -1)
			if not VDW.VCB["BossTextTotal"..i]:IsShown() then VDW.VCB["BossTextTotal"..i]:Show() end
		end
	elseif VCBsettings["Boss"]["TotalTimeText"]["Position"] == G.OPTIONS_P_TOPRIGHT then
		function totalPostion(self,i)
			VDW.VCB["BossTextTotal"..i]:ClearAllPoints()
			VDW.VCB["BossTextTotal"..i]:SetPoint("BOTTOMRIGHT", self, "TOPRIGHT", -4, 1)
			if not VDW.VCB["BossTextTotal"..i]:IsShown() then VDW.VCB["BossTextTotal"..i]:Show() end
		end
	elseif VCBsettings["Boss"]["TotalTimeText"]["Position"] == G.OPTIONS_P_RIGHT then
		function totalPostion(self,i)
			VDW.VCB["BossTextTotal"..i]:ClearAllPoints()
			VDW.VCB["BossTextTotal"..i]:SetPoint("RIGHT", self, "RIGHT", -4, 0)
			if not VDW.VCB["BossTextTotal"..i]:IsShown() then VDW.VCB["BossTextTotal"..i]:Show() end
		end
	elseif VCBsettings["Boss"]["TotalTimeText"]["Position"] == G.OPTIONS_P_BOTTOMRIGHT then
		function totalPostion(self,i)
			VDW.VCB["BossTextTotal"..i]:ClearAllPoints()
			VDW.VCB["BossTextTotal"..i]:SetPoint("TOPRIGHT", self, "BOTTOMRIGHT", -4, -1)
			if not VDW.VCB["BossTextTotal"..i]:IsShown() then VDW.VCB["BossTextTotal"..i]:Show() end
		end
	end
end
-- =========================
-- checking update functions
-- =========================
-- check current casting time update
function VDW.VCB.chkCurrentUpdBoss()
	if VCBsettings.Boss.CurrentTimeText.Position ~= G.OPTIONS_V_HIDE then
		if VCBsettings.Boss.CurrentTimeText.Sec == G.OPTIONS_V_HIDE then
			if VCBsettings.Boss.CurrentTimeText.Decimals == "0" then
				if VCBsettings.Boss.CurrentTimeText.Direction == G.OPTIONS_D_ASCENDING then
					function currentUpdate(self,i)
						VDW.VCB["BossTextCurrent"..i]:SetText(string.format("%.0f", VDW.VCB["BossDuration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Boss.CurrentTimeText.Direction == G.OPTIONS_D_DESCENDING then
					function currentUpdate(self,i)
						VDW.VCB["BossTextCurrent"..i]:SetText(string.format("%.0f", VDW.VCB["BossDuration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Boss.CurrentTimeText.Direction == G.OPTIONS_P_BOTH then
					function currentUpdate(self,i)
						if VDW.VCB["BossCastbar"..i] == "Cast" or VDW.VCB["BossCastbar"..i] == "Empower" then
							VDW.VCB["BossTextCurrent"..i]:SetText(string.format("%.0f", VDW.VCB["BossDuration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
						elseif VDW.VCB["BossCastbar"..i] == "Channel" then
							VDW.VCB["BossTextCurrent"..i]:SetText(string.format("%.0f", VDW.VCB["BossDuration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			elseif VCBsettings.Boss.CurrentTimeText.Decimals == "1" then
				if VCBsettings.Boss.CurrentTimeText.Direction == G.OPTIONS_D_ASCENDING then
					function currentUpdate(self,i)
						VDW.VCB["BossTextCurrent"..i]:SetText(string.format("%.1f", VDW.VCB["BossDuration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Boss.CurrentTimeText.Direction == G.OPTIONS_D_DESCENDING then
					function currentUpdate(self,i)
						VDW.VCB["BossTextCurrent"..i]:SetText(string.format("%.1f", VDW.VCB["BossDuration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Boss.CurrentTimeText.Direction == G.OPTIONS_P_BOTH then
					function currentUpdate(self,i)
						if VDW.VCB["BossCastbar"..i] == "Cast" or VDW.VCB["BossCastbar"..i] == "Empower" then
							VDW.VCB["BossTextCurrent"..i]:SetText(string.format("%.1f", VDW.VCB["BossDuration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
						elseif VDW.VCB["BossCastbar"..i] == "Channel" then
							VDW.VCB["BossTextCurrent"..i]:SetText(string.format("%.1f", VDW.VCB["BossDuration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			elseif VCBsettings.Boss.CurrentTimeText.Decimals == "2" then
				if VCBsettings.Boss.CurrentTimeText.Direction == G.OPTIONS_D_ASCENDING then
					function currentUpdate(self,i)
						VDW.VCB["BossTextCurrent"..i]:SetText(string.format("%.2f", VDW.VCB["BossDuration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Boss.CurrentTimeText.Direction == G.OPTIONS_D_DESCENDING then
					function currentUpdate(self,i)
						VDW.VCB["BossTextCurrent"..i]:SetText(string.format("%.2f", VDW.VCB["BossDuration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Boss.CurrentTimeText.Direction == G.OPTIONS_P_BOTH then
					function currentUpdate(self,i)
						if VDW.VCB["BossCastbar"..i] == "Cast" or VDW.VCB["BossCastbar"..i] == "Empower" then
							VDW.VCB["BossTextCurrent"..i]:SetText(string.format("%.2f", VDW.VCB["BossDuration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
						elseif VDW.VCB["BossCastbar"..i] == "Channel" then
							VDW.VCB["BossTextCurrent"..i]:SetText(string.format("%.2f", VDW.VCB["BossDuration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			elseif VCBsettings.Boss.CurrentTimeText.Decimals == "3" then
				if VCBsettings.Boss.CurrentTimeText.Direction == G.OPTIONS_D_ASCENDING then
					function currentUpdate(self,i)
						VDW.VCB["BossTextCurrent"..i]:SetText(string.format("%.3f", VDW.VCB["BossDuration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Boss.CurrentTimeText.Direction == G.OPTIONS_D_DESCENDING then
					function currentUpdate(self,i)
						VDW.VCB["BossTextCurrent"..i]:SetText(string.format("%.3f", VDW.VCB["BossDuration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Boss.CurrentTimeText.Direction == G.OPTIONS_P_BOTH then
					function currentUpdate(self,i)
						if VDW.VCB["BossCastbar"..i] == "Cast" or VDW.VCB["BossCastbar"..i] == "Empower" then
							VDW.VCB["BossTextCurrent"..i]:SetText(string.format("%.3f", VDW.VCB["BossDuration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
						elseif VDW.VCB["BossCastbar"..i] == "Channel" then
							VDW.VCB["BossTextCurrent"..i]:SetText(string.format("%.3f", VDW.VCB["BossDuration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			end
		elseif VCBsettings.Boss.CurrentTimeText.Sec == G.OPTIONS_V_SHOW then
			if VCBsettings.Boss.CurrentTimeText.Decimals == "0" then
				if VCBsettings.Boss.CurrentTimeText.Direction == G.OPTIONS_D_ASCENDING then
					function currentUpdate(self,i)
						VDW.VCB["BossTextCurrent"..i]:SetText(string.format("%.0f Sec", VDW.VCB["BossDuration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Boss.CurrentTimeText.Direction == G.OPTIONS_D_DESCENDING then
					function currentUpdate(self,i)
						VDW.VCB["BossTextCurrent"..i]:SetText(string.format("%.0f Sec", VDW.VCB["BossDuration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Boss.CurrentTimeText.Direction == G.OPTIONS_P_BOTH then
					function currentUpdate(self,i)
						if VDW.VCB["BossCastbar"..i] == "Cast" or VDW.VCB["BossCastbar"..i] == "Empower" then
							VDW.VCB["BossTextCurrent"..i]:SetText(string.format("%.0f Sec", VDW.VCB["BossDuration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
						elseif VDW.VCB["BossCastbar"..i] == "Channel" then
							VDW.VCB["BossTextCurrent"..i]:SetText(string.format("%.0f Sec", VDW.VCB["BossDuration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			elseif VCBsettings.Boss.CurrentTimeText.Decimals == "1" then
				if VCBsettings.Boss.CurrentTimeText.Direction == G.OPTIONS_D_ASCENDING then
					function currentUpdate(self,i)
						VDW.VCB["BossTextCurrent"..i]:SetText(string.format("%.1f Sec", VDW.VCB["BossDuration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Boss.CurrentTimeText.Direction == G.OPTIONS_D_DESCENDING then
					function currentUpdate(self,i)
						VDW.VCB["BossTextCurrent"..i]:SetText(string.format("%.1f Sec", VDW.VCB["BossDuration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Boss.CurrentTimeText.Direction == G.OPTIONS_P_BOTH then
					function currentUpdate(self,i)
						if VDW.VCB["BossCastbar"..i] == "Cast" or VDW.VCB["BossCastbar"..i] == "Empower" then
							VDW.VCB["BossTextCurrent"..i]:SetText(string.format("%.1f Sec", VDW.VCB["BossDuration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
						elseif VDW.VCB["BossCastbar"..i] == "Channel" then
							VDW.VCB["BossTextCurrent"..i]:SetText(string.format("%.1f Sec", VDW.VCB["BossDuration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			elseif VCBsettings.Boss.CurrentTimeText.Decimals == "2" then
				if VCBsettings.Boss.CurrentTimeText.Direction == G.OPTIONS_D_ASCENDING then
					function currentUpdate(self,i)
						VDW.VCB["BossTextCurrent"..i]:SetText(string.format("%.2f Sec", VDW.VCB["BossDuration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Boss.CurrentTimeText.Direction == G.OPTIONS_D_DESCENDING then
					function currentUpdate(self,i)
						VDW.VCB["BossTextCurrent"..i]:SetText(string.format("%.2f Sec", VDW.VCB["BossDuration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Boss.CurrentTimeText.Direction == G.OPTIONS_P_BOTH then
					function currentUpdate(self,i)
						if VDW.VCB["BossCastbar"..i] == "Cast" or VDW.VCB["BossCastbar"..i] == "Empower" then
							VDW.VCB["BossTextCurrent"..i]:SetText(string.format("%.2f Sec", VDW.VCB["BossDuration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
						elseif VDW.VCB["BossCastbar"..i] == "Channel" then
							VDW.VCB["BossTextCurrent"..i]:SetText(string.format("%.2f Sec", VDW.VCB["BossDuration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			elseif VCBsettings.Boss.CurrentTimeText.Decimals == "3" then
				if VCBsettings.Boss.CurrentTimeText.Direction == G.OPTIONS_D_ASCENDING then
					function currentUpdate(self,i)
						VDW.VCB["BossTextCurrent"..i]:SetText(string.format("%.3f Sec", VDW.VCB["BossDuration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Boss.CurrentTimeText.Direction == G.OPTIONS_D_DESCENDING then
					function currentUpdate(self,i)
						VDW.VCB["BossTextCurrent"..i]:SetText(string.format("%.3f Sec", VDW.VCB["BossDuration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Boss.CurrentTimeText.Direction == G.OPTIONS_P_BOTH then
					function currentUpdate(self,i)
						if VDW.VCB["BossCastbar"..i] == "Cast" or VDW.VCB["BossCastbar"..i] == "Empower" then
							VDW.VCB["BossTextCurrent"..i]:SetText(string.format("%.3f Sec", VDW.VCB["BossDuration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime)))
						elseif VDW.VCB["BossCastbar"..i] == "Channel" then
							VDW.VCB["BossTextCurrent"..i]:SetText(string.format("%.3f Sec", VDW.VCB["BossDuration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			end
		end
	elseif VCBsettings.Boss.CurrentTimeText.Position == G.OPTIONS_V_HIDE then
		function currentUpdate(self,i)
			return
		end
	end
end
-- check both casting time update
function VDW.VCB.chkBothUpdBoss()
	if VCBsettings.Boss.BothTimeText.Position ~= G.OPTIONS_V_HIDE then
		if VCBsettings.Boss.BothTimeText.Sec == G.OPTIONS_V_HIDE then
			if VCBsettings.Boss.BothTimeText.Decimals == "0" then
				if VCBsettings.Boss.BothTimeText.Direction == G.OPTIONS_D_ASCENDING then
					function bothUpdate(self,i)
						VDW.VCB["BossTextBoth"..i]:SetText(string.format("%.0f / %.0f", VDW.VCB["BossDuration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), VDW.VCB["BossDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Boss.BothTimeText.Direction == G.OPTIONS_D_DESCENDING then
					function bothUpdate(self,i)
						VDW.VCB["BossTextBoth"..i]:SetText(string.format("%.0f / %.0f", VDW.VCB["BossDuration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), VDW.VCB["BossDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Boss.BothTimeText.Direction == G.OPTIONS_P_BOTH then
					function bothUpdate(self,i)
						if VDW.VCB["BossCastbar"..i] == "Cast" or VDW.VCB["BossCastbar"..i] == "Empower" then
							VDW.VCB["BossTextBoth"..i]:SetText(string.format("%.0f / %.0f", VDW.VCB["BossDuration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), VDW.VCB["BossDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						elseif VDW.VCB["BossCastbar"..i] == "Channel" then
							VDW.VCB["BossTextBoth"..i]:SetText(string.format("%.0f / %.0f", VDW.VCB["BossDuration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), VDW.VCB["BossDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			elseif VCBsettings.Boss.BothTimeText.Decimals == "1" then
				if VCBsettings.Boss.BothTimeText.Direction == G.OPTIONS_D_ASCENDING then
					function bothUpdate(self,i)
						VDW.VCB["BossTextBoth"..i]:SetText(string.format("%.1f / %.1f", VDW.VCB["BossDuration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), VDW.VCB["BossDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Boss.BothTimeText.Direction == G.OPTIONS_D_DESCENDING then
					function bothUpdate(self,i)
						VDW.VCB["BossTextBoth"..i]:SetText(string.format("%.1f / %.1f", VDW.VCB["BossDuration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), VDW.VCB["BossDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Boss.BothTimeText.Direction == G.OPTIONS_P_BOTH then
					function bothUpdate(self,i)
						if VDW.VCB["BossCastbar"..i] == "Cast" or VDW.VCB["BossCastbar"..i] == "Empower" then
							VDW.VCB["BossTextBoth"..i]:SetText(string.format("%.1f / %.1f", VDW.VCB["BossDuration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), VDW.VCB["BossDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						elseif VDW.VCB["BossCastbar"..i] == "Channel" then
							VDW.VCB["BossTextBoth"..i]:SetText(string.format("%.1f / %.1f", VDW.VCB["BossDuration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), VDW.VCB["BossDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			elseif VCBsettings.Boss.BothTimeText.Decimals == "2" then
				if VCBsettings.Boss.BothTimeText.Direction == G.OPTIONS_D_ASCENDING then
					function bothUpdate(self,i)
						VDW.VCB["BossTextBoth"..i]:SetText(string.format("%.2f / %.2f", VDW.VCB["BossDuration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), VDW.VCB["BossDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Boss.BothTimeText.Direction == G.OPTIONS_D_DESCENDING then
					function bothUpdate(self,i)
						VDW.VCB["BossTextBoth"..i]:SetText(string.format("%.2f / %.2f", VDW.VCB["BossDuration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), VDW.VCB["BossDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Boss.BothTimeText.Direction == G.OPTIONS_P_BOTH then
					function bothUpdate(self,i)
						if VDW.VCB["BossCastbar"..i] == "Cast" or VDW.VCB["BossCastbar"..i] == "Empower" then
							VDW.VCB["BossTextBoth"..i]:SetText(string.format("%.2f / %.2f", VDW.VCB["BossDuration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), VDW.VCB["BossDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						elseif VDW.VCB["BossCastbar"..i] == "Channel" then
							VDW.VCB["BossTextBoth"..i]:SetText(string.format("%.2f / %.2f", VDW.VCB["BossDuration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), VDW.VCB["BossDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			elseif VCBsettings.Boss.BothTimeText.Decimals == "3" then
				if VCBsettings.Boss.BothTimeText.Direction == G.OPTIONS_D_ASCENDING then
					function bothUpdate(self,i)
						VDW.VCB["BossTextBoth"..i]:SetText(string.format("%.3f / %.3f", VDW.VCB["BossDuration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), VDW.VCB["BossDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Boss.BothTimeText.Direction == G.OPTIONS_D_DESCENDING then
					function bothUpdate(self,i)
						VDW.VCB["BossTextBoth"..i]:SetText(string.format("%.3f / %.3f", VDW.VCB["BossDuration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), VDW.VCB["BossDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Boss.BothTimeText.Direction == G.OPTIONS_P_BOTH then
					function bothUpdate(self,i)
						if VDW.VCB["BossCastbar"..i] == "Cast" or VDW.VCB["BossCastbar"..i] == "Empower" then
							VDW.VCB["BossTextBoth"..i]:SetText(string.format("%.3f", VDW.VCB["BossDuration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), VDW.VCB["BossDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						elseif VDW.VCB["BossCastbar"..i] == "Channel" then
							VDW.VCB["BossTextBoth"..i]:SetText(string.format("%.3f / %.3f", VDW.VCB["BossDuration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), VDW.VCB["BossDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			end
		elseif VCBsettings.Boss.BothTimeText.Sec == G.OPTIONS_V_SHOW then
			if VCBsettings.Boss.BothTimeText.Decimals == "0" then
				if VCBsettings.Boss.BothTimeText.Direction == G.OPTIONS_D_ASCENDING then
					function bothUpdate(self,i)
						VDW.VCB["BossTextBoth"..i]:SetText(string.format("%.0f / %.0f Sec", VDW.VCB["BossDuration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), VDW.VCB["BossDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Boss.BothTimeText.Direction == G.OPTIONS_D_DESCENDING then
					function bothUpdate(self,i)
						VDW.VCB["BossTextBoth"..i]:SetText(string.format("%.0f / %.0f Sec", VDW.VCB["BossDuration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), VDW.VCB["BossDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Boss.BothTimeText.Direction == G.OPTIONS_P_BOTH then
					function bothUpdate(self,i)
						if VDW.VCB["BossCastbar"..i] == "Cast" or VDW.VCB["BossCastbar"..i] == "Empower" then
							VDW.VCB["BossTextBoth"..i]:SetText(string.format("%.0f / %.0f Sec", VDW.VCB["BossDuration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), VDW.VCB["BossDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						elseif VDW.VCB["BossCastbar"..i] == "Channel" then
							VDW.VCB["BossTextBoth"..i]:SetText(string.format("%.0f / %.0f Sec", VDW.VCB["BossDuration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), VDW.VCB["BossDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			elseif VCBsettings.Boss.BothTimeText.Decimals == "1" then
				if VCBsettings.Boss.BothTimeText.Direction == G.OPTIONS_D_ASCENDING then
					function bothUpdate(self,i)
						VDW.VCB["BossTextBoth"..i]:SetText(string.format("%.1f / %.1f Sec", VDW.VCB["BossDuration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), VDW.VCB["BossDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Boss.BothTimeText.Direction == G.OPTIONS_D_DESCENDING then
					function bothUpdate(self,i)
						VDW.VCB["BossTextBoth"..i]:SetText(string.format("%.1f / %.1f Sec", VDW.VCB["BossDuration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), VDW.VCB["BossDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Boss.BothTimeText.Direction == G.OPTIONS_P_BOTH then
					function bothUpdate(self,i)
						if VDW.VCB["BossCastbar"..i] == "Cast" or VDW.VCB["BossCastbar"..i] == "Empower" then
							VDW.VCB["BossTextBoth"..i]:SetText(string.format("%.1f / %.1f Sec", VDW.VCB["BossDuration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), VDW.VCB["BossDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						elseif VDW.VCB["BossCastbar"..i] == "Channel" then
							VDW.VCB["BossTextBoth"..i]:SetText(string.format("%.1f / %.1f Sec", VDW.VCB["BossDuration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), VDW.VCB["BossDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			elseif VCBsettings.Boss.BothTimeText.Decimals == "2" then
				if VCBsettings.Boss.BothTimeText.Direction == G.OPTIONS_D_ASCENDING then
					function bothUpdate(self,i)
						VDW.VCB["BossTextBoth"..i]:SetText(string.format("%.2f / %.2f Sec", VDW.VCB["BossDuration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), VDW.VCB["BossDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Boss.BothTimeText.Direction == G.OPTIONS_D_DESCENDING then
					function bothUpdate(self,i)
						VDW.VCB["BossTextBoth"..i]:SetText(string.format("%.2f / %.2f Sec", VDW.VCB["BossDuration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), VDW.VCB["BossDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Boss.BothTimeText.Direction == G.OPTIONS_P_BOTH then
					function bothUpdate(self,i)
						if VDW.VCB["BossCastbar"..i] == "Cast" or VDW.VCB["BossCastbar"..i] == "Empower" then
							VDW.VCB["BossTextBoth"..i]:SetText(string.format("%.2f / %.2f Sec", VDW.VCB["BossDuration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), VDW.VCB["BossDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						elseif VDW.VCB["BossCastbar"..i] == "Channel" then
							VDW.VCB["BossTextBoth"..i]:SetText(string.format("%.2f / %.2f Sec", VDW.VCB["BossDuration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), VDW.VCB["BossDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			elseif VCBsettings.Boss.BothTimeText.Decimals == "3" then
				if VCBsettings.Boss.BothTimeText.Direction == G.OPTIONS_D_ASCENDING then
					function bothUpdate(self,i)
						VDW.VCB["BossTextBoth"..i]:SetText(string.format("%.3f / %.3f Sec", VDW.VCB["BossDuration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), VDW.VCB["BossDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Boss.BothTimeText.Direction == G.OPTIONS_D_DESCENDING then
					function bothUpdate(self,i)
						VDW.VCB["BossTextBoth"..i]:SetText(string.format("%.3f / %.3f Sec", VDW.VCB["BossDuration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), VDW.VCB["BossDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
					end
				elseif VCBsettings.Boss.BothTimeText.Direction == G.OPTIONS_P_BOTH then
					function bothUpdate(self,i)
						if VDW.VCB["BossCastbar"..i] == "Cast" or VDW.VCB["BossCastbar"..i] == "Empower" then
							VDW.VCB["BossTextBoth"..i]:SetText(string.format("%.3f / %.3f Sec", VDW.VCB["BossDuration"..i]:GetElapsedDuration(Enum.DurationTimeModifier.RealTime), VDW.VCB["BossDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						elseif VDW.VCB["BossCastbar"..i] == "Channel" then
							VDW.VCB["BossTextBoth"..i]:SetText(string.format("%.3f / %.3f Sec", VDW.VCB["BossDuration"..i]:GetRemainingDuration(Enum.DurationTimeModifier.RealTime), VDW.VCB["BossDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime)))
						end
					end
				end
			end
		end
	elseif VCBsettings.Boss.BothTimeText.Position == G.OPTIONS_V_HIDE then
		function bothUpdate(self,i)
			return
		end
	end
end
-- check total casting time update
function VDW.VCB.chkTotalUpdBoss()
	if VCBsettings.Boss.TotalTimeText.Position ~= G.OPTIONS_V_HIDE then
		if VCBsettings.Boss.TotalTimeText.Sec == G.OPTIONS_V_HIDE then
			if VCBsettings.Boss.TotalTimeText.Decimals == "0" then
				function totalUpdate(self,i)
					VDW.VCB["BossTextTotal"..i]:SetFormattedText("%.0f", VDW.VCB["BossDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime))
				end
			elseif VCBsettings.Boss.TotalTimeText.Decimals == "1" then
				function totalUpdate(self,i)
					VDW.VCB["BossTextTotal"..i]:SetFormattedText("%.1f", VDW.VCB["BossDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime))
				end
			elseif VCBsettings.Boss.TotalTimeText.Decimals == "2" then
				function totalUpdate(self,i)
					VDW.VCB["BossTextTotal"..i]:SetFormattedText("%.2f", VDW.VCB["BossDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime))
				end
			elseif VCBsettings.Boss.TotalTimeText.Decimals == "3" then
				function totalUpdate(self,i)
					VDW.VCB["BossTextTotal"..i]:SetFormattedText("%.3f", VDW.VCB["BossDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime))
				end
			end
		elseif VCBsettings.Boss.TotalTimeText.Sec == G.OPTIONS_V_SHOW then
			if VCBsettings.Boss.TotalTimeText.Decimals == "0" then
				function totalUpdate(self,i)
					VDW.VCB["BossTextTotal"..i]:SetFormattedText("%.0f sec", VDW.VCB["BossDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime))
				end
			elseif VCBsettings.Boss.TotalTimeText.Decimals == "1" then
				function totalUpdate(self,i)
					VDW.VCB["BossTextTotal"..i]:SetFormattedText("%.1f sec", VDW.VCB["BossDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime))
				end
			elseif VCBsettings.Boss.TotalTimeText.Decimals == "2" then
				function totalUpdate(self,i)
					VDW.VCB["BossTextTotal"..i]:SetFormattedText("%.2f sec", VDW.VCB["BossDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime))
				end
			elseif VCBsettings.Boss.TotalTimeText.Decimals == "3" then
				function totalUpdate(self,i)
					VDW.VCB["BossTextTotal"..i]:SetFormattedText("%.3f sec", VDW.VCB["BossDuration"..i]:GetTotalDuration(Enum.DurationTimeModifier.RealTime))
				end
			end
		end
	elseif VCBsettings.Boss.TotalTimeText.Position == G.OPTIONS_V_HIDE then
		function totalUpdate(self,i)
			return
		end
	end
end
-- =========================
-- checking color & style functions
-- =========================
-- check status bar color
function VDW.VCB.chkStatusColorBoss()
	if VCBsettings["Boss"]["StatusBar"]["Color"] == G.OPTIONS_C_DEFAULT then
		function statusbarColor(self, i)
			self:SetStatusBarDesaturated(false)
			self:SetStatusBarColor(1, 1, 1)
			if VCBsettings.Boss.StatusBar.Style == "Jailer" then
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
	elseif VCBsettings["Boss"]["StatusBar"]["Color"] == G.OPTIONS_C_CLASS then
		function statusbarColor(self, i)
			self:SetStatusBarDesaturated(true)
			self:SetStatusBarColor(VDW.VCB["ClassColorBoss"..i]:GetRGB())
			self.Spark:SetDesaturated(true)
			self.Spark:SetVertexColor(VDW.VCB["ClassColorBoss"..i]:GetRGB())
			self.Flash:SetDesaturated(true)
			self.Flash:SetVertexColor(VDW.VCB["ClassColorBoss"..i]:GetRGB())
		end
	end
end
-- check border bar color
function VDW.VCB.chkBorderColorBoss()
	if VCBsettings.Boss.Border.Color == G.OPTIONS_C_DEFAULT then
		function borderColor(self, i)
			self.Background:SetDesaturated(false)
			self.Border:SetDesaturated(false)
			VDW.VCB["BossTextBorderTop"..i]:SetDesaturated(false)
			VDW.VCB["BossTextBorderBottom"..i]:SetDesaturated(false)
			self.Background:SetVertexColor(1, 1, 1)
			self.Border:SetVertexColor(1, 1, 1)
			VDW.VCB["BossTextBorderTop"..i]:SetVertexColor(1, 1, 1)
			VDW.VCB["BossTextBorderBottom"..i]:SetVertexColor(1, 1, 1)
		end
	elseif VCBsettings.Boss.Border.Color == G.OPTIONS_C_CLASS then
		function borderColor(self, i)
			self.Background:SetDesaturated(true)
			self.Border:SetDesaturated(true)
			VDW.VCB["BossTextBorderTop"..i]:SetDesaturated(true)
			VDW.VCB["BossTextBorderBottom"..i]:SetDesaturated(true)
			self.Background:SetVertexColor(VDW.VCB["ClassColorBoss"..i]:GetRGB())
			self.Border:SetVertexColor(VDW.VCB["ClassColorBoss"..i]:GetRGB())
			VDW.VCB["BossTextBorderTop"..i]:SetVertexColor(VDW.VCB["ClassColorBoss"..i]:GetRGB())
			VDW.VCB["BossTextBorderBottom"..i]:SetVertexColor(VDW.VCB["ClassColorBoss"..i]:GetRGB())
		end
	end
end
-- call back the defaul color of status bar
local function defaultColor(self)
	self:SetStatusBarDesaturated(false)
	self:SetStatusBarColor(1, 1, 1)
	if VCBsettings.Boss.StatusBar.Style == "Jailer" then
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
function VDW.VCB.chkStatusStyleBoss()
	if VCBsettings.Boss.StatusBar.Style == G.OPTIONS_C_DEFAULT then
		function statusbarStyle(self)
			return
		end
	elseif VCBsettings.Boss.StatusBar.Style == "Jailer" then
		function statusbarStyle(self)
			self:SetStatusBarTexture("jailerstower-scorebar-fill-onfire")
		end
	end
end
-- check border bar style
function VDW.VCB.chkBorderStyleBoss()
	if VCBsettings.Boss.Border.Style == G.OPTIONS_C_DEFAULT then
		function borderStyle(self)
			return
		end
	elseif VCBsettings.Boss.Border.Style == "Jailer" then
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
	self:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", VCBsettings["Boss"]["Position"]["X"], VCBsettings["Boss"]["Position"]["Y"])
end
-- scale bar
local function scaleBar(self)
	self:SetScale(VCBsettings["Boss"]["Scale"]/100)
end
local function barIsLocked()
	for i = 1, 5, 1 do
-- hook part 1
		_G["Boss"..i.."TargetFrameSpellBar"]:HookScript("OnShow", function(self)
			iconPosition(self, i)
			VDW.VCB["BossTextName"..i]:SetWidth(self:GetWidth() - 8)
			namePosition(self, i)
			currentPostion(self, i)
			bothPostion(self, i)
			totalPostion(self, i)
			borderStyle(self, i)
		end)
-- hook part 2
		_G["Boss"..i.."TargetFrameSpellBar"]:HookScript("OnUpdate", function(self)
			self.TextBorder:SetAlpha(0)
			self.Text:SetAlpha(0)
			self.BorderShield:SetAlpha(0)
			self.Icon:SetAlpha(0)
			if VDW.VCB["BossDuration"..i] then
				VDW.VCB["BossTextName"..i]:SetText(self.Text:GetText())
				VDW.VCB["BossIconSpellLeft"..i]:SetTexture(self.Icon:GetTextureFileID())
				VDW.VCB["BossIconSpellRight"..i]:SetTexture(self.Icon:GetTextureFileID())
				shieldPosition(VDW.VCB["BossUninterruptible"..i], i)
				bordertextPosition (VDW.VCB["BossTextBorderTop"..i], VDW.VCB["BossTextBorderBottom"..i])
				if VDW.VCB["BossInterrupted"..i] then
					VDW.VCB["BossTextCurrent"..i]:SetText("-")
					VDW.VCB["BossTextBoth"..i]:SetText("- / -")
					VDW.VCB["BossTextTotal"..i]:SetText("-")
				else
					currentUpdate(self, i)
					bothUpdate(self, i)
					totalUpdate(self, i)
				end
				statusbarColor(self, i)
				borderColor(self, i)
				statusbarStyle(self)
			end
		end)
	end
end
-- =========================
-- class color
-- =========================
for i = 1, 5, 1 do
	_G["Boss"..i.."TargetFrame"]:HookScript("OnUpdate", function(self)
		local classFilename = UnitClassBase("boss"..i)
		if classFilename ~= nil then VDW.VCB["ClassColorBoss"..i] = C_ClassColor.GetClassColor(classFilename) end
	end)
end
-- =========================
-- Events Time
-- =========================
local function EventsTime(self, event, arg1, arg2, arg3, arg4)
	if event == "PLAYER_LOGIN" then
		ProtectOptions()
		createTextures()
		createTexts()
		VDW.VCB.chkBossIconPosition()
		VDW.VCB.chkBossShieldPosition()
		VDW.VCB.chkBossBorderTextPosition()
		VDW.VCB.chkNameTxtBoss()
		VDW.VCB.chkCurrentTxtBoss()
		VDW.VCB.chkBothTxtBoss()
		VDW.VCB.chkTotalTxtBoss()
		VDW.VCB.chkCurrentUpdBoss()
		VDW.VCB.chkBothUpdBoss()
		VDW.VCB.chkTotalUpdBoss()
		VDW.VCB.chkStatusColorBoss()
		VDW.VCB.chkBorderColorBoss()
		VDW.VCB.chkStatusStyleBoss()
		VDW.VCB.chkBorderStyleBoss()
		barIsLocked()
	elseif event == "UNIT_SPELLCAST_START" then
		for i = 1, 5, 1 do
			if arg1 == "boss"..i then
				local castName, castText, castTex, _, _, isTradeSkill, _, castNotInterruptible = UnitCastingInfo(arg1)
				if castName then
					VDW.VCB["BossDuration"..i] = UnitCastingDuration(arg1)
					VDW.VCB["BossUninterruptible"..i] = castNotInterruptible
					VDW.VCB["BossCastbar"..i] = "Cast"
					VDW.VCB["BossInterrupted"..i] = false
				end
			end
		end
	elseif event == "UNIT_SPELLCAST_CHANNEL_START" then
		for i = 1, 5, 1 do
			if arg1 == "boss"..i then
				local chanName, chanText, chanTex, _, _, isTradeSkill, chanNotInterruptible, _, isEmpowered, numStages = UnitChannelInfo(arg1)
				if chanName then
					VDW.VCB["BossDuration"..i] = UnitCastingDuration(arg1)
					VDW.VCB["BossUninterruptible"..i] = castNotInterruptible
					VDW.VCB["BossCastbar"..i] = "Channel"
					VDW.VCB["BossInterrupted"..i] = false
				end
			end
		end
	elseif event == "UNIT_SPELLCAST_EMPOWER_START" then
		for i = 1, 5, 1 do
			if arg1 == "boss"..i then
				local chanName, chanText, chanTex, _, _, isTradeSkill, chanNotInterruptible, _, isEmpowered, numStages = UnitChannelInfo(arg1)
				if chanName then
					VDW.VCB["BossDuration"..i] = UnitCastingDuration(arg1)
					VDW.VCB["BossUninterruptible"..i] = castNotInterruptible
					VDW.VCB["BossCastbar"..i] = "Empower"
					VDW.VCB["BossInterrupted"..i] = false
				end
			end
		end
	elseif event == "UNIT_SPELLCAST_INTERRUPTED" then
		for i = 1, 5, 1 do
			if arg1 == "boss"..i then
				VDW.VCB["BossInterrupted"..i] = true
			end
		end
	end
end
vcbZlave:HookScript("OnEvent", EventsTime)
