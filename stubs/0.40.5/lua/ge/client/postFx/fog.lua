---@meta
-- tim19Atlas stub generated from lua/ge/client/postFx/fog.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Callbacks called by the engine for UnderwaterFogPostFx.
---@class client_postFx_fog_underwaterFogPostFxCallbacks
local client_postFx_fog_underwaterFogPostFxCallbacks = {}

--- Disables CausticsPFX if it exists.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/client/postFx/fog.lua:67
function client_postFx_fog_underwaterFogPostFxCallbacks.onDisabled() end

--- Enables CausticsPFX if it exists and returns true.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/client/postFx/fog.lua:59
---@return boolean  always true
function client_postFx_fog_underwaterFogPostFxCallbacks.onEnabled() end

