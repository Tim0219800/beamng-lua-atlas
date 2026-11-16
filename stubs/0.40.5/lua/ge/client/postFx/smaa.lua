---@meta
-- tim19Atlas stub generated from lua/ge/client/postFx/smaa.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Callbacks of SMAA_PostEffect (SMAA 1x).
---@class client_postFx_smaa_smaaPostEffectCallbacks
local client_postFx_smaa_smaaPostEffectCallbacks = {}

--- Disables FXAA_PostEffect and SMAA T2x, returns true.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/client/postFx/smaa.lua:76
---@return boolean  always true
function client_postFx_smaa_smaaPostEffectCallbacks.onEnabled() end

--- Updates the render target resolution (rtResolution) and $smaaRtMetrics on the three effects if it has changed.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/client/postFx/smaa.lua:86
function client_postFx_smaa_smaaPostEffectCallbacks.preProcess() end

--- Callbacks of SMAA_T2X_PostEffect (temporal SMAA 2x).
---@class client_postFx_smaa_smaaT2xPostEffectCallbacks
local client_postFx_smaa_smaaT2xPostEffectCallbacks = {}

--- Disables FXAA_PostEffect and SMAA_PostEffect, returns true.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/client/postFx/smaa.lua:188
---@return boolean  always true
function client_postFx_smaa_smaaT2xPostEffectCallbacks.onEnabled() end

--- Updates $smaaRtMetrics and the subsample indices ($smaaSubsampleIndices) every frame.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/client/postFx/smaa.lua:200
function client_postFx_smaa_smaaT2xPostEffectCallbacks.preProcess() end

