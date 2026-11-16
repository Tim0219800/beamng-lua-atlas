---@meta
-- tim19Atlas stub generated from lua/ge/client/postFx/fxaa.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Callbacks of FXAA_PostEffect (global FXAA_PostEffectCallbacks).
---@class client_postFx_fxaa_fxaa_PostEffectCallbacks
local client_postFx_fxaa_fxaa_PostEffectCallbacks = {}

--- Disables SMAA_PostEffect if it exists, calls disableSmaaT2x() if this global exists, then returns true.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/client/postFx/fxaa.lua:13
---@return boolean  always true
function client_postFx_fxaa_fxaa_PostEffectCallbacks.onEnabled() end

