local E, L, V, P, G = unpack(ElvUI)
local S = E:GetModule("Skins")

function S.LoadTimeManagerSkin()
	if(E.private.skins.blizzard.enable ~= true or E.private.skins.blizzard.timemanager ~= true) then return end

	TimeManagerFrame:Size(190, 240)
	TimeManagerFrame:StripTextures()
	TimeManagerFrame:SetTemplate("Transparent")

	E:CreateMover(TimeManagerFrame, "TimeManagerFrameMover", L["Time Manager Frame"])
	TimeManagerFrame.mover:SetFrameLevel(TimeManagerFrame:GetFrameLevel() + 4)

	select(7, TimeManagerFrame:GetRegions()):Point("TOP", 0, -5)

	TimeManagerCloseButton:Point("TOPRIGHT", 4, 5)
	S:HandleCloseButton(TimeManagerCloseButton)

	TimeManagerStopwatchFrame:Point("TOPRIGHT", 10, -12)

	TimeManagerStopwatchFrameBackground:SetTexture(nil)

	TimeManagerStopwatchCheck:SetTemplate("Default")
	TimeManagerStopwatchCheck:StyleButton(nil, true)

	TimeManagerStopwatchCheck:GetNormalTexture():SetInside()
	TimeManagerStopwatchCheck:GetNormalTexture():SetTexCoord(unpack(E.TexCoords))

	TimeManagerAlarmTimeFrame:Point("TOPLEFT", 12, -65)

	S:HandleDropDownBox(TimeManagerAlarmHourDropDown, 80)
	S:HandleDropDownBox(TimeManagerAlarmMinuteDropDown, 80)
	S:HandleDropDownBox(TimeManagerAlarmAMPMDropDown, 80)

	S:HandleEditBox(TimeManagerAlarmMessageEditBox)

	TimeManagerAlarmEnabledButton:Point("LEFT", 16, -45)
	TimeManagerAlarmEnabledButton:SetNormalTexture(nil)
	TimeManagerAlarmEnabledButton.SetNormalTexture = E.noop
	TimeManagerAlarmEnabledButton:SetPushedTexture(nil)
	TimeManagerAlarmEnabledButton.SetPushedTexture = E.noop
	S:HandleButton(TimeManagerAlarmEnabledButton)

	TimeManagerMilitaryTimeCheck:Point("TOPLEFT", 155, -190)
	S:HandleCheckBox(TimeManagerMilitaryTimeCheck)
	S:HandleCheckBox(TimeManagerLocalTimeCheck)

	StopwatchFrame:CreateBackdrop("Transparent")
	StopwatchFrame.backdrop:Point("TOPLEFT", 6, -10)
	StopwatchFrame.backdrop:Point("BOTTOMRIGHT", 0, 14)

	StopwatchFrame:StripTextures()

	StopwatchTabFrame:StripTextures()

	S:HandleCloseButton(StopwatchCloseButton)

	StopwatchPlayPauseButton:CreateBackdrop("Default", true)
	StopwatchPlayPauseButton:Size(12, 12)
	StopwatchPlayPauseButton:SetNormalTexture("Interface\\AddOns\\ElvUI\\media\\textures\\play")
	StopwatchPlayPauseButton:SetHighlightTexture("")
	StopwatchPlayPauseButton.backdrop:SetOutside(StopwatchPlayPauseButton, 2, 2)
	StopwatchPlayPauseButton:HookScript("OnEnter", S.SetModifiedBackdrop)
	StopwatchPlayPauseButton:HookScript("OnLeave", S.SetOriginalBackdrop)
	StopwatchPlayPauseButton:Point("RIGHT", StopwatchResetButton, "LEFT", -4, 0)
	S:HandleButton(StopwatchResetButton)
	StopwatchResetButton:Size(16,16)
	StopwatchResetButton:SetNormalTexture("Interface\\AddOns\\ElvUI\\media\\textures\\reset")
	StopwatchResetButton:Point("RIGHT", StopwatchFrame, "RIGHT", -4, 2)

	local function SetPlayTexture()
		StopwatchPlayPauseButton:SetNormalTexture("Interface\\AddOns\\ElvUI\\media\\textures\\play")
	end
	local function SetPauseTexture()
		StopwatchPlayPauseButton:SetNormalTexture("Interface\\AddOns\\ElvUI\\media\\textures\\pause")
	end
	hooksecurefunc("Stopwatch_Play", SetPauseTexture)
	hooksecurefunc("Stopwatch_Pause", SetPlayTexture)
	hooksecurefunc("Stopwatch_Clear", SetPlayTexture)
end

S:AddCallbackForAddon("Blizzard_TimeManager", "TimeManager", S.LoadTimeManagerSkin)