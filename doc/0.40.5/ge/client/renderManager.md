# `client_renderManager`

*File: `lua/ge/client/renderManager.lua` · VM: Game Engine (GE) · 56 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("client/renderManager")`

Prepares the off-screen render format: creates the RenderFormatToken "AL_FormatToken" (color R8G8B8A8, depth $GFXFormatDefaultDepth or D24S8, aaLevel 0, disabled at the start), the state block "AL_FormatTokenState" (inherits from PFX_DefaultStateBlock, sampler SamplerClampPoint) and the PostEffect "AL_FormatCopy" (passthrough to $backbuffer). This token is enabled/disabled by the light managers.

## Notes

- The objects AL_FormatTokenState and AL_FormatCopy are created on module import, outside initRenderManager; AL_FormatToken is created on each call of initRenderManager (no existence test).

## Functions

| Function | Description | Line |
|---|---|---|
| `client_renderManager.initRenderManager()` | Creates and registers the RenderFormatToken object "AL_FormatToken" (disabled) with AL_FormatCopy as the copy and resolve effect. *(internal)* | 7 |

## Calls into the engine (C++)

- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/client/renderManager.lua`.*
