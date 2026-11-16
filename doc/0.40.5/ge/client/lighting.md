# `client_lighting`

*File: `lua/ge/client/lighting.lua` · VM: Game Engine (GE) · 116 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("client/lighting")`

Chooses and activates the game's light manager. It loads all init.lua files from the subfolders of lua/ge/client/lighting/ (advanced, basic, shadowMaps), then first tries $pref::lightManager, otherwise goes through the names of the defaultLightManagerNames setting. If none works, the game exits with "Failed to set a light manager!".

## Notes

- initLightingSystems and reloadLightingSystems have an identical body in the code; the only difference is the name.
- The GFX Null Device test does nothing (comment: we cannot return here or it crashes later).

## Functions

| Function | Description | Line |
|---|---|---|
| `client_lighting.initLightingSystems()` | Loads the lighting modules and activates a light manager via setLightManager; exits the game with an error message if none is usable. *(internal)* | 61 |
| `client_lighting.reloadLightingSystems()` | Same logic as initLightingSystems, called by reloadClient. *(internal)* | 7 |

## Calls into the engine (C++)

- `FS:` `findFiles`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/client/lighting.lua`.*
