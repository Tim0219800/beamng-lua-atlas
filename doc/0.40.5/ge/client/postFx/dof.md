# `dofModule`

*File: `lua/ge/client/postFx/dof.lua` · VM: Game Engine (GE) · 697 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** global `dofModule`

Depth of field (DOF) as post-processing. Creates the PostEffect "DOFPostEffect" (disabled at the start, PFXAfterBin / UpscaleDispatch) with its sub-effects (DOFBlurY, DOFBlurX, DOFCalcCoC, DOFSmallBlur, DOFFinalPFX) and their shaders. Handles manual or automatic focus (ray cast at the screen center, distance to the player's vehicle if visible, smoothed by a temporal smoother) and sends the shader constants each frame. User settings are read from the $DOFPostFx::* variables (Enable, EnableDebugMode, EnableAutoFocus, BlurMin, BlurMax, FocusRangeMin, FocusRangeMax, BlurCurveNear, BlurCurveFar).

## Example

```lua
local dof = require('client/postFx/dof')
VariableRegistry.set('$DOFPostFx::BlurMax', 0.4)
dof.updateDOFSettings()
```

## Notes

- Default values (applyDefaults): Enable true, EnableDebugMode false, EnableAutoFocus false, BlurMin 0.0, BlurMax 0.25, FocusRangeMin 100, FocusRangeMax 250, BlurCurveNear 20, BlurCurveFar 10.
- updateDOFSettings passes -BlurCurveNear as the near slope (negative) and BlurCurveFar as the far slope; the max blurs are clamped between 0 and 1.
- "Small only" mode: if the maximum blur stays low (canUseSmallOnly), preProcess disables the large blur passes (skipDraw / skip) and sets the macro BNG_DOF_SMALL_ONLY=1 on DOFFinalPFX, to save GPU.
- The automatic focus distance uses containerRayCast with the masks Static, Terrain, Vehicle and DynamicShape and falls back to $Param::FarDist when there is no hit.

## Functions

| Function | Description | Line |
|---|---|---|
| `dofModule.applyDefaults()` | Writes the default values of the $DOFPostFx::* variables to the VariableRegistry. Does not enable anything: see updateDOFSettings. | 570 |
| `dofModule.updateDOFSettings()` | Rereads the $DOFPostFx::* variables, applies the focus parameters, the auto-focus mode and the debug mode to DOFPostEffect, resets the focal distance to 0 then enables or disables the effect according to $DOFPostFx::Enable. No effect if DOFPostEffect does not exist. | 655 |

## Class `dOFPostEffectCallbacks`

Callbacks of DOFPostEffect, published on the global DOFPostEffectCallbacks.

| Method | Description | Line |
|---|---|---|
| `dOFPostEffectCallbacks.onAdd()` | Called when the effect is added: initializes lerpScale/lerpBias (0.2; 0.3; 0.5), auto-focus disabled, max blurs 0.5, ranges 50 to 500, slopes -5 and 5. | 423 |
| `dOFPostEffectCallbacks.preProcess()` | Called before the effect is rendered: switches between full mode and "small only" mode and adjusts the sub-effects. | 467 |
| `dOFPostEffectCallbacks.setShaderConsts()` | Called before execution: updates the automatic focus if it is active, computes the near/far blur equations and sends $dofEqWorld, $dofEqFar, $maxWorldCoC, $maxFarCoC, $dofLerpScale, $dofLerpBias and $isDebugMode to DOFFinalPFX. | 486 |

## Class `dofFinalCallbacks`

Callbacks of DOFFinalPFX (global DOFFinalPFXCallbacks, reused if it already exists).

| Method | Description | Line |
|---|---|---|
| `dofFinalCallbacks.setShaderConsts()` | In "small only" mode, calls dOFPostEffectCallbacks.setShaderConsts again to update the final shader's constants. | 552 |

## Calls into the engine (C++)

- `Engine.` `sceneGetCameraFrustum`
- `be:` `getPlayerVehicle`, `getPlayerVehicleID`
- `scenetree.` `findObject`, `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/client/postFx/dof.lua`.*
