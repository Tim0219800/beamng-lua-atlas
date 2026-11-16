# `freeroam_crashCamModeLoader`

*File: `lua/ge/extensions/freeroam/crashCamModeLoader.lua` · VM: Game Engine (GE) · 25 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `freeroam_crashCamModeLoader`: `extensions.load("freeroam_crashCamModeLoader")`, then the global `freeroam_crashCamModeLoader`

Small loader that loads or unloads the freeroam_crashCamMode extension (slow-motion camera after a crash) according to the enableCrashCam setting. It avoids leaving the crash camera active when the player disables it in the options.

## Notes

- On unload, the `elseif freeroam_crashCamMode` test relies on the extension's global: it is only unloaded if it is already loaded.

## Functions

| Function | Description | Line |
|---|---|---|
| `freeroam_crashCamModeLoader.onExtensionLoaded()` | Hook called when the extension loads: loads freeroam_crashCamMode if the enableCrashCam setting is true. *(internal)* *(hook)* | 15 |
| `freeroam_crashCamModeLoader.onSettingsChanged()` | Hook called when the settings change: loads freeroam_crashCamMode if enableCrashCam is true, otherwise unloads it if it is loaded. *(internal)* *(hook)* | 7 |

**Loads extensions:** `freeroam_crashCamMode`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/freeroam/crashCamModeLoader.lua`.*
