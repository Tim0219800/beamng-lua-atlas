# `client_lighting_advanced_init`

*File: `lua/ge/client/lighting/advanced/init.lua` · VM: Game Engine (GE) · 63 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("client/lighting/advanced/init")`

"Advanced Lighting" light manager. Loads the submodules shaders, lightViz and shadowViz, then, if the manager exists (LightManager.findByName), publishes the global table ADVLMCallbacks with onActivate/onDeactivate. On activation, it enables the AL_FormatToken object (off-screen target needed for MSAA and HDR); on deactivation, it disables it.

## Notes

- On macOS (variable $platform == "macos"), onActivate does nothing.
- The $pref::LightManager::* preferences block at the start is entirely commented out.

## Calls into the engine (C++)

- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/client/lighting/advanced/init.lua`.*
