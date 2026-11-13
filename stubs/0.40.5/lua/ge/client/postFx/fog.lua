---@meta
-- tim19Atlas stub generated from lua/ge/client/postFx/fog.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Callbacks appelés par le moteur pour UnderwaterFogPostFx.
---@class client_postFx_fog_underwaterFogPostFxCallbacks
local client_postFx_fog_underwaterFogPostFxCallbacks = {}

--- Désactive CausticsPFX s'il existe.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/client/postFx/fog.lua:67
function client_postFx_fog_underwaterFogPostFxCallbacks.onDisabled() end

--- Active CausticsPFX s'il existe et retourne true.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/client/postFx/fog.lua:59
---@return boolean  toujours true
function client_postFx_fog_underwaterFogPostFxCallbacks.onEnabled() end

