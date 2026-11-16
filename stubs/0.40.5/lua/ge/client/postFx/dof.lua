---@meta
-- tim19Atlas stub generated from lua/ge/client/postFx/dof.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Depth of field (DOF) as post-processing. Creates the PostEffect "DOFPostEffect" (disabled at the start, PFXAfterBin / UpscaleDispatch) with its sub-effects (DOFBlurY, DOFBlurX, DOFCalcCoC, DOFSmallBlur, DOFFinalPFX) and their shaders. Handles manual or automatic focus (ray cast at the screen center, distance to the player's vehicle if visible, smoothed by a temporal smoother) and sends the shader constants each frame. User settings are read from the $DOFPostFx::* variables (Enable, EnableDebugMode, EnableAutoFocus, BlurMin, BlurMax, FocusRangeMin, FocusRangeMax, BlurCurveNear, BlurCurveFar).
--- Access: global `dofModule`
---@class dofModule
dofModule = {}

--- Writes the default values of the $DOFPostFx::* variables to the VariableRegistry. Does not enable anything: see updateDOFSettings.
---Source: lua/ge/client/postFx/dof.lua:570
function dofModule.applyDefaults() end

--- Rereads the $DOFPostFx::* variables, applies the focus parameters, the auto-focus mode and the debug mode to DOFPostEffect, resets the focal distance to 0 then enables or disables the effect according to $DOFPostFx::Enable. No effect if DOFPostEffect does not exist.
---Source: lua/ge/client/postFx/dof.lua:655
function dofModule.updateDOFSettings() end

--- Callbacks of DOFPostEffect, published on the global DOFPostEffectCallbacks.
---@class dofModule_dOFPostEffectCallbacks
local dofModule_dOFPostEffectCallbacks = {}

--- Called when the effect is added: initializes lerpScale/lerpBias (0.2; 0.3; 0.5), auto-focus disabled, max blurs 0.5, ranges 50 to 500, slopes -5 and 5.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/client/postFx/dof.lua:423
function dofModule_dOFPostEffectCallbacks.onAdd() end

--- Called before the effect is rendered: switches between full mode and "small only" mode and adjusts the sub-effects.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/client/postFx/dof.lua:467
function dofModule_dOFPostEffectCallbacks.preProcess() end

--- Called before execution: updates the automatic focus if it is active, computes the near/far blur equations and sends $dofEqWorld, $dofEqFar, $maxWorldCoC, $maxFarCoC, $dofLerpScale, $dofLerpBias and $isDebugMode to DOFFinalPFX.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/client/postFx/dof.lua:486
function dofModule_dOFPostEffectCallbacks.setShaderConsts() end

--- Callbacks of DOFFinalPFX (global DOFFinalPFXCallbacks, reused if it already exists).
---@class dofModule_dofFinalCallbacks
local dofModule_dofFinalCallbacks = {}

--- In "small only" mode, calls dOFPostEffectCallbacks.setShaderConsts again to update the final shader's constants.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/client/postFx/dof.lua:552
function dofModule_dofFinalCallbacks.setShaderConsts() end

