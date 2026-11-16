# `client_postFx_smaa`

*File: `lua/ge/client/postFx/smaa.lua` · VM: Game Engine (GE) · 274 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("client/postFx/smaa")`

SMAA anti-aliasing (Subpixel Morphological Anti-Aliasing). Creates the SMAA_* shaders and state block, the PostEffects SMAA_PostEffect (edge detection), SMAA_PostEffect1 (blend weights) and SMAA_PostEffect2 (neighborhood blending), as well as the temporal variant SMAA_T2X_* with SMAA_T2X_Resolve. SMAA 1x and T2x are mutually exclusive and exclusive with FXAA. Defines the global disableSmaaT2x().

## Notes

- disableSmaaT2x() disables SMAA_T2X_PostEffect and resets upscaleMode to 0 on the views "main", "splitscreen0..7", "multiMonitorLeft" and "multiMonitorRight" that use smaaT2xUpscaleMode (global read in the code, not defined in this file).
- The preProcess functions compute rtResolution = (1/width, 1/height, width, height) and pass it to $smaaRtMetrics. T2x alternates $smaaSubsampleIndices ("1 1 1 0" or "2 2 2 0") according to the parity of Engine.Render.getFrameId().
- Callbacks published on the globals SMAA_PostEffectCallbacks and SMAA_T2X_PostEffectCallbacks.

## Class `smaaPostEffectCallbacks`

Callbacks of SMAA_PostEffect (SMAA 1x).

| Method | Description | Line |
|---|---|---|
| `smaaPostEffectCallbacks.onEnabled()` | Disables FXAA_PostEffect and SMAA T2x, returns true. | 76 |
| `smaaPostEffectCallbacks.preProcess()` | Updates the render target resolution (rtResolution) and $smaaRtMetrics on the three effects if it has changed. | 86 |

## Class `smaaT2xPostEffectCallbacks`

Callbacks of SMAA_T2X_PostEffect (temporal SMAA 2x).

| Method | Description | Line |
|---|---|---|
| `smaaT2xPostEffectCallbacks.onEnabled()` | Disables FXAA_PostEffect and SMAA_PostEffect, returns true. | 188 |
| `smaaT2xPostEffectCallbacks.preProcess()` | Updates $smaaRtMetrics and the subsample indices ($smaaSubsampleIndices) every frame. | 200 |

## Calls into the engine (C++)

- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/client/postFx/smaa.lua`.*
