---@meta
-- tim19Atlas stub generated from lua/ge/client/postFx.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Manager of the game's post-effects (PostFX). On import it creates the common objects: state blocks PFX_DefaultStateBlock and PFX_DefaultBlitStateBlock, shaders PFX_PassthruShader and PFX_PassthruComputeShader, and the PostEffects AL_FormatBlit and AL_UpscaleBilinear (disabled at the start). It loads the effects from client/postFx/* (caustics, dof, edgeAA, fog, fxaa, glow, maskedScreenBlur, smaa, ssao, screenSpaceShadows) and can reapply the SSAO and DOF default values.
--- Access: `require("client/postFx")`
---@class client_postFx
local client_postFx = {}

--- Reapplies the default values of ssao and dof (applyDefaults of each module), enables or disables the SSAOPostFx object according to $SSAOPostFx::Enable, then calls dof.updateDOFSettings().
---Source: lua/ge/client/postFx.lua:133
function client_postFx.applyDefaults() end

--- Loads all post-effect modules and keeps references to dof and ssao.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/client/postFx.lua:84
function client_postFx.initPostEffects() end

--- Identical to initPostEffects (called by reloadClient).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/client/postFx.lua:103
function client_postFx.reloadPostEffects() end

--- Global callback table (_G.postEffectCallbacks) used by the engine for PostEffects.
---@class client_postFx_postEffectCallbacks
local client_postFx_postEffectCallbacks = {}

--- Called when a PostEffect is enabled; returns true (allows the activation).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/client/postFx.lua:125
---@return boolean  always true
function client_postFx_postEffectCallbacks.onEnabled() end

return client_postFx
