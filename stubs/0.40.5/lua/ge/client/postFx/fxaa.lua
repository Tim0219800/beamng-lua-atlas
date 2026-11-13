---@meta
-- tim19Atlas stub generated from lua/ge/client/postFx/fxaa.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Callbacks de FXAA_PostEffect (globale FXAA_PostEffectCallbacks).
---@class client_postFx_fxaa_fxaa_PostEffectCallbacks
local client_postFx_fxaa_fxaa_PostEffectCallbacks = {}

--- Désactive SMAA_PostEffect s'il existe, appelle disableSmaaT2x() si cette globale existe, puis retourne true.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/client/postFx/fxaa.lua:13
---@return boolean  toujours true
function client_postFx_fxaa_fxaa_PostEffectCallbacks.onEnabled() end

