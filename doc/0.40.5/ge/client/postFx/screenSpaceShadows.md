# `client_postFx_screenSpaceShadows`

*File: `lua/ge/client/postFx/screenSpaceShadows.lua` · VM: Game Engine (GE) · 8 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("client/postFx/screenSpaceShadows")`

Creates, if it does not exist, the native object "ScreenSpaceShadowsPostFx" (type PostFxScreenSpaceShadows) for screen-space shadows. No exported function; all the logic is on the C++ side.

## Calls into the engine (C++)

- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/client/postFx/screenSpaceShadows.lua`.*
