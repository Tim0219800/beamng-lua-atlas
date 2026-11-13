---@meta
-- tim19Atlas stub generated from lua/ge/client/postFx.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Gestionnaire des post-effets (PostFX) du jeu. À l'import il crée les objets communs : state blocks PFX_DefaultStateBlock et PFX_DefaultBlitStateBlock, shaders PFX_PassthruShader et PFX_PassthruComputeShader, et les PostEffect AL_FormatBlit et AL_UpscaleBilinear (désactivés au départ). Il charge les effets de client/postFx/* (caustics, dof, edgeAA, fog, fxaa, glow, maskedScreenBlur, smaa, ssao, screenSpaceShadows) et sait ré-appliquer les valeurs par défaut de SSAO et du DOF.
--- Accès : `require("client/postFx")`
---@class client_postFx
local client_postFx = {}

--- Réapplique les valeurs par défaut de ssao et dof (applyDefaults de chaque module), active ou désactive l'objet SSAOPostFx selon $SSAOPostFx::Enable, puis appelle dof.updateDOFSettings().
---Source : lua/ge/client/postFx.lua:133
function client_postFx.applyDefaults() end

--- Charge tous les modules de post-effets et conserve les références vers dof et ssao.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/client/postFx.lua:84
function client_postFx.initPostEffects() end

--- Identique à initPostEffects (appelée par reloadClient).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/client/postFx.lua:103
function client_postFx.reloadPostEffects() end

--- Table de callbacks globale (_G.postEffectCallbacks) utilisée par le moteur pour les PostEffect.
---@class client_postFx_postEffectCallbacks
local client_postFx_postEffectCallbacks = {}

--- Appelée quand un PostEffect est activé ; retourne true (autorise l'activation).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/client/postFx.lua:125
---@return boolean  toujours true
function client_postFx_postEffectCallbacks.onEnabled() end

return client_postFx
