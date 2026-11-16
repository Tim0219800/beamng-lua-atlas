# `client_objectsRequiredForStartup`

*File: `lua/ge/client/objectsRequiredForStartup.lua` · VM: Game Engine (GE) · 528 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("client/objectsRequiredForStartup")`

Creates, on import, the base GUI objects needed at startup: the "DefaultCursor" cursor (GuiCursor, hot spot (4,4) on macOS, (1,1) elsewhere) and the Torque engine's GuiControlProfile objects, for example GuiDefaultProfile, GuiSolidDefaultProfile, GuiTransparentProfile, GuiToolTipProfile, GuiWindowProfile, GuiTextProfile (and the Right, AutoSize, Medium, Big, ML, Array variants), GuiTextEditProfile, GuiButtonProfile, GuiCheckBoxProfile, GuiScrollProfile, GuiSliderProfile, GuiPopUpMenuProfile, GuiTabBookProfile, GuiConsoleProfile, GuiRadioProfile, GuiMonospace and GuiCEFProfile. A profile defines colors, font (Arial 14 by default), bitmap and borders of GUI controls. No exported function.

## Notes

- GuiDefaultProfile is created without an existence test, like DefaultCursor and GuiToolTipProfile, GuiModelessDialogProfile, GuiFrameSetProfile, GuiWindowProfile and most text profiles; only a few profiles (GuiSolidDefaultProfile, GuiTransparentProfile, GuiGroupBorderProfile, GuiTabBorderProfile) are guarded by scenetree.findObject.
- The "Core" category profiles carry category = "Core".
- Probable inconsistency: the last variable in the file, named guiMonospace (red font ColorI(255,0,6), tab and canKeyFocus true), is registered under the name "GuiCEFProfile" in addition to the "GuiMonospace" profile created earlier.

## Calls into the engine (C++)

- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/client/objectsRequiredForStartup.lua`.*
