---@meta
-- tim19Atlas stub generated from lua/ge/extensions/freeroam/crashCamModeLoader.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Small loader that loads or unloads the freeroam_crashCamMode extension (slow-motion camera after a crash) according to the enableCrashCam setting. It avoids leaving the crash camera active when the player disables it in the options.
--- Access: extension `freeroam_crashCamModeLoader`: `extensions.load("freeroam_crashCamModeLoader")`, then the global `freeroam_crashCamModeLoader`
---@class freeroam_crashCamModeLoader
freeroam_crashCamModeLoader = {}

--- Hook called when the extension loads: loads freeroam_crashCamMode if the enableCrashCam setting is true.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/freeroam/crashCamModeLoader.lua:15
function freeroam_crashCamModeLoader.onExtensionLoaded() end

--- Hook called when the settings change: loads freeroam_crashCamMode if enableCrashCam is true, otherwise unloads it if it is loaded.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/freeroam/crashCamModeLoader.lua:7
function freeroam_crashCamModeLoader.onSettingsChanged() end

