# `client_postFx_fog`

*File: `lua/ge/client/postFx/fog.lua` · VM: Game Engine (GE) · 114 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("client/postFx/fog")`

Post-processing fog. Creates the PostEffect "FogPostFx" (shader fog.cs.hlsl, priority 5, enabled, excluded from reflection passes) and the PostEffect "UnderwaterFogPostFx" (underwaterFog.cs.hlsl, priority 4, oneFrameOnly) with their shaders and state blocks. The underwater effect's callbacks enable/disable the caustics PostEffect.

## Notes

- The callbacks are published on the global UnderwaterFogPostFxCallbacks (via rawset).

## Class `underwaterFogPostFxCallbacks`

Callbacks called by the engine for UnderwaterFogPostFx.

| Method | Description | Line |
|---|---|---|
| `underwaterFogPostFxCallbacks.onDisabled()` | Disables CausticsPFX if it exists. | 67 |
| `underwaterFogPostFxCallbacks.onEnabled()` | Enables CausticsPFX if it exists and returns true. | 59 |

## Calls into the engine (C++)

- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/client/postFx/fog.lua`.*
