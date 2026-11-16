# `client_postFx_fxaa`

*File: `lua/ge/client/postFx/fxaa.lua` · VM: Game Engine (GE) · 51 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("client/postFx/fxaa")`

FXAA anti-aliasing. Creates the state block FXAA_StateBlock, the shader FXAA_ShaderData (fxaa.cs.hlsl) and the PostEffect "FXAA_PostEffect" (disabled at the start, PFXAfterDiffuse, reads and writes $backBuffer). Enabling FXAA disables SMAA and SMAA T2x.

## Notes

- If FXAA_PostEffect already exists, nothing is recreated; the creation of the three objects is grouped in the same if block.

## Class `fxaa_PostEffectCallbacks`

Callbacks of FXAA_PostEffect (global FXAA_PostEffectCallbacks).

| Method | Description | Line |
|---|---|---|
| `fxaa_PostEffectCallbacks.onEnabled()` | Disables SMAA_PostEffect if it exists, calls disableSmaaT2x() if this global exists, then returns true. | 13 |

## Calls into the engine (C++)

- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/client/postFx/fxaa.lua`.*
