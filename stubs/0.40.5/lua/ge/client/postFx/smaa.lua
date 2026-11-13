---@meta
-- tim19Atlas stub generated from lua/ge/client/postFx/smaa.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Callbacks de SMAA_PostEffect (SMAA 1x).
---@class client_postFx_smaa_smaaPostEffectCallbacks
local client_postFx_smaa_smaaPostEffectCallbacks = {}

--- Désactive FXAA_PostEffect et SMAA T2x, retourne true.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/client/postFx/smaa.lua:76
---@return boolean  toujours true
function client_postFx_smaa_smaaPostEffectCallbacks.onEnabled() end

--- Met à jour la résolution de la cible de rendu (rtResolution) et $smaaRtMetrics sur les trois effets si elle a changé.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/client/postFx/smaa.lua:86
function client_postFx_smaa_smaaPostEffectCallbacks.preProcess() end

--- Callbacks de SMAA_T2X_PostEffect (SMAA temporel 2x).
---@class client_postFx_smaa_smaaT2xPostEffectCallbacks
local client_postFx_smaa_smaaT2xPostEffectCallbacks = {}

--- Désactive FXAA_PostEffect et SMAA_PostEffect, retourne true.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/client/postFx/smaa.lua:188
---@return boolean  toujours true
function client_postFx_smaa_smaaT2xPostEffectCallbacks.onEnabled() end

--- Met à jour $smaaRtMetrics et les indices de sous-échantillon ($smaaSubsampleIndices) à chaque image.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/client/postFx/smaa.lua:200
function client_postFx_smaa_smaaT2xPostEffectCallbacks.preProcess() end

