-- =========================
-- some variables
-- =========================
VDW.VCB = VDW.VCB or {}
VDWtranslate.VCB = VDWtranslate.VCB or {}
VDWvariables.VBC = VDWvariables.VBC or {}
local G = VDW.Local.Override
local C = VDW.GetAddonColors("VCB")
local prefixTip = VDW.Prefix("VCB")
local prefixChat = VDW.PrefixChat("VCB")
-- =========================
-- basic functions
-- =========================
local function CreateGlobalVariables()
-- function for opening the options
	local function ShowMenu()
		if not InCombatLockdown() then
			local _, loaded = C_AddOns.IsAddOnLoaded("VCB_Options")
			local loadable, reason = C_AddOns.IsAddOnLoadable("VCB_Options" , nil , true)
			if reason == "MISSING" then
				C_Sound.PlayVocalErrorSound(48)
				DEFAULT_CHAT_FRAME:AddMessage(C.Main:WrapTextInColorCode(prefixChat.." "..string.format(G.WRN_ADDON_IS_STATE, C.High:WrapTextInColorCode("Voodoo Casting Bar Options"), reason)))
				UIErrorsFrame:AddExternalWarningMessage(string.format(G.WRN_ADDON_IS_STATE, C.High:WrapTextInColorCode("Voodoo Casting Bar Options"), reason))
			elseif loadable and not loaded then
				C_AddOns.LoadAddOn("VCB_Options")
				if not vcbOptions0:IsShown() then
					vcbOptions0:Show()
				else
					vcbOptions0:Hide()
				end
			elseif loadable and loaded then
				if not vcbOptions0:IsShown() then
					vcbOptions0:Show()
				else
					vcbOptions0:Hide()
				end
			else
				C_Sound.PlayVocalErrorSound(48)
				DEFAULT_CHAT_FRAME:AddMessage(C.Main:WrapTextInColorCode(prefixChat.." "..string.format(G.WRN_ADDON_IS_STATE, C_AddOns.GetAddOnMetadata("VCB_Options", "Title"), reason)))
				UIErrorsFrame:AddExternalWarningMessage(string.format(G.WRN_ADDON_IS_STATE, C_AddOns.GetAddOnMetadata("VCB_Options", "Title"), reason))
			end
		else
			C_Sound.PlayVocalErrorSound(48)
			DEFAULT_CHAT_FRAME:AddMessage(C.Main:WrapTextInColorCode(prefixChat.." "..G.WRN_COMBAT_LOCKDOWN))
			UIErrorsFrame:AddExternalWarningMessage(G.WRN_COMBAT_LOCKDOWN)
		end
	end
-- slash command
	RegisterNewSlashCommand(ShowMenu, "vcb", "voodoocastingbar")
-- mini map button functions
	AddonCompartmentFrame:RegisterAddon({
		text = C.Main:WrapTextInColorCode(C_AddOns.GetAddOnMetadata("VCB", "Title")),
		icon = C_AddOns.GetAddOnMetadata("VCB", "IconAtlas"),
		notCheckable = true,
		func = function(button, menuInputData, menu)
			local buttonName = menuInputData.buttonName
			if buttonName == "LeftButton" then
				ShowMenu()
			end
		end,
		funcOnEnter = function(button)
			VDW.Tooltip_Show(button, prefixTip, G.BUTTON_L_CLICK..": "..G.TIP_OPEN_SETTINGS_MAIN, C.Main)
		end,
		funcOnLeave = function(button)
			VDW.Tooltip_Hide()
		end,
	})
end
-- =========================
-- loading first time the variables
-- =========================
local function FirstTimeSavedVariables()
	if VCBprofiles == nil then VCBprofiles = {} end
	if VCBsettings == nil then VCBsettings = {} end
-- player settings
	if VCBsettings.Player == nil then
		VCBsettings.Player = {
			Icon = {Position = "Left",},
			Shield = {Position = "Left",},
			BorderText = {Position = "Both",},
			NameText = {Position = "Top",},
			CurrentTimeText = {Position = "BottomLeft", Direction = "Both", Sec = true, Decimals = "2",},
			BothTimeText = {Position = "Hide", Direction = "Both", Sec = false, Decimals = "0",},
			TotalTimeText = {Position = "BottomRight", Sec = true, Decimals = "3",},
			StatusBar = {Color = "Class", Style = "Default"},
			Border = {Color = "Default", Style = "Default"},
			LagBar = {Visibility = true,},
			QueueBar = {Visibility = true,},
		}
	end
-- target settings
	if VCBsettings.Target == nil then
		VCBsettings.Target = {
			Lock = true,
			Position = {X = 860, Y = 540},
			Scale = 100,
			NameText = {Position = "Top",},
			CurrentTimeText = {Position = "BottomLeft", Direction = "Both", Sec = true, Decimals = "2",},
			TotalTimeText = {Position = "BottomRight", Sec = true, Decimals = "3",},
			BothTimeText = {Position = "Hide", Direction = "Both", Sec = false, Decimals = "0",},
			Icon = {Position = "Left"},
			StatusBar = {Color = "Class", Style = "Default"},
			Border = {Color = "Default", Style = "Default"},
		}
	end
-- focus settings
	if VCBsettings.Focus == nil then
		VCBsettings.Focus = {
			Lock = true,
			Position = {X = 860, Y = 540},
			Scale = 100,
			NameText = {Position = "Top",},
			CurrentTimeText = {Position = "BottomLeft", Direction = "Both", Sec = true, Decimals = "2",},
			TotalTimeText = {Position = "BottomRight", Sec = true, Decimals = "3",},
			BothTimeText = {Position = "Hide", Direction = "Both", Sec = false, Decimals = "0",},
			Icon = {Position = "Left",},
			StatusBar = {Color = "Class", Style = "Default"},
			Border = {Color = "Default", Style = "Default"},
		}
	end
-- boss settings
	if VCBsettings.Boss == nil then
		VCBsettings.Boss = {
			Lock = true,
			Position = {X = 860, Y = 540},
			Scale = 100,
			NameText = {Position = "Top",},
			CurrentTimeText = {Position = "BottomLeft", Direction = "Both", Sec = true, Decimals = "2",},
			TotalTimeText = {Position = "BottomRight", Sec = true, Decimals = "3",},
			BothTimeText = {Position = "Hide", Direction = "Both", Sec = false, Decimals = "0",},
			Icon = {Position = "Left",},
			StatusBar = {Color = "Class", Style = "Default"},
			Border = {Color = "Default", Style = "Default"},
		}
	end
-- arena settings
	if VCBsettings.Arena == nil then
		VCBsettings.Arena = {
			Lock = true,
			Position = {X = 860, Y = 540},
			Scale = 100,
			NameText = {Position = "Top",},
			CurrentTimeText = {Position = "BottomLeft", Direction = "Both", Sec = true, Decimals = "2",},
			TotalTimeText = {Position = "BottomRight", Sec = true, Decimals = "3",},
			BothTimeText = {Position = "Hide", Direction = "Both", Sec = false, Decimals = "0",},
			Icon = {Position = "Left",},
			StatusBar = {Color = "Class", Style = "Default"},
			Border = {Color = "Default", Style = "Default"},
		}
	end
-- special settings
	if VCBspecialSettings == nil then VCBspecialSettings = {} end
	if VCBspecialSettings.Player == nil then
		VCBspecialSettings.Player = {
			Ticks = {Style = false,},
		}
	end
-- extra settings
	if VCBsettings.Player.Size == nil then VCBsettings.Player.Size = {Width = 208, Height = 11} end
	if VCBsettings.Player.Shield == nil then VCBsettings.Player.Shield = {Position = "Left",} end
	if VCBsettings.Player.BorderText == nil then VCBsettings.Player.BorderText = {Position = "Both",} end
	if VCBsettings.Target.Size == nil then VCBsettings.Target.Size = {Width = 150, Height = 10} end
	if VCBsettings.Target.Shield == nil then VCBsettings.Target.Shield = {Position = "Left",} end
	if VCBsettings.Target.BorderText == nil then VCBsettings.Target.BorderText = {Position = "Both",} end
	if VCBsettings.Focus.Size == nil then VCBsettings.Focus.Size = {Width = 150, Height = 10} end
	if VCBsettings.Focus.Shield == nil then VCBsettings.Focus.Shield = {Position = "Left",} end
	if VCBsettings.Focus.BorderText == nil then VCBsettings.Focus.BorderText = {Position = "Both",} end
	if VCBsettings.Boss.Size == nil then VCBsettings.Boss.Size = {Width = 150, Height = 10} end
	if VCBsettings.Boss.Shield == nil then VCBsettings.Boss.Shield = {Position = "Left",} end
	if VCBsettings.Boss.BorderText == nil then VCBsettings.Boss.BorderText = {Position = "Both",} end
	if VCBsettings.Arena.Size == nil then VCBsettings.Arena.Size = {Width = 150, Height = 10} end
	if VCBsettings.Arena.Shield == nil then VCBsettings.Arena.Shield = {Position = "Left",} end
	if VCBsettings.Arena.BorderText == nil then VCBsettings.Arena.BorderText = {Position = "Both",} end
	if VCBsettings.Player.Fonts == nil then VCBsettings.Player.Fonts ={Color = "Default", Style = "Normal 10",}  end
	if VCBsettings.Target.Fonts == nil then VCBsettings.Target.Fonts ={Color = "Default", Style = "Normal 10",}  end
	if VCBsettings.Focus.Fonts == nil then VCBsettings.Focus.Fonts ={Color = "Default", Style = "Normal 10",}  end
	if VCBsettings.Boss.Fonts == nil then VCBsettings.Boss.Fonts ={Color = "Default", Style = "Normal 10",}  end
	if VCBsettings.Arena.Fonts == nil then VCBsettings.Arena.Fonts ={Color = "Default", Style = "Normal 10",}  end
	if VCBsettings.Target.StatusBar.Interrupt == nil then VCBsettings.Target.StatusBar.Interrupt = {Show = true, Color = "Default"} end
	if VCBsettings.Focus.StatusBar.Interrupt == nil then VCBsettings.Focus.StatusBar.Interrupt = {Show = true, Color = "Default"} end
	if VCBsettings.Boss.StatusBar.Interrupt == nil then VCBsettings.Boss.StatusBar.Interrupt = {Show = true, Color = "Default"} end
	if VCBsettings.Arena.StatusBar.Interrupt == nil then VCBsettings.Arena.StatusBar.Interrupt = {Show = true, Color = "Default"} end
	if VCBsettings.Player.GlobalCooldown == nil then
		VCBsettings.Player.GlobalCooldown = {
			Enable = true,
			Position = "Top",
			Style = "Icon",
			Icon = {Style = "ClassSquare",},
			Bar = {
				Style = "Default",
				Color = "Default",
				BorderStyle = "Default",
				BorderColor = "Default",
				Fill = "Standard",
			},
			Instant = {
				Style = "Default",
				StastusStyle = "Default",
				StatusColor = "Default",
				BorderStyle = "Default",
				BorderColor = "Default",
				TextBorder = {Position = "Both",},
				Icon = {Position = "Left",},
				Name = {Position = "Top",},
				RemainingTime = {Position = "Bottom",},
			},
		}
	end
-- remove settings
	if VCBsettings.LastLocation ~= nil then VCBsettings.LastLocation = nil end
	if VCBsettings.Target.Icon.Shield ~= nil then VCBsettings.Target.Icon.Shield = nil end
	if VCBsettings.Focus.Icon.Shield ~= nil then VCBsettings.Focus.Icon.Shield = nil end
	if VCBsettings.Boss.Icon.Shield ~= nil then VCBsettings.Boss.Icon.Shield = nil end
	if VCBsettings.Arena.Icon.Shield ~= nil then VCBsettings.Arena.Icon.Shield = nil end
end
-- =========================
-- Events Time
-- =========================
local function EventsTime(self, event, arg1, arg2, arg3, arg4)
	if event == "PLAYER_LOGIN" then
		CreateGlobalVariables()
		FirstTimeSavedVariables()
	end
end
vcbZlave:SetScript("OnEvent", EventsTime)
