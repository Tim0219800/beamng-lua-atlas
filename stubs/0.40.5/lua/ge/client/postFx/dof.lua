---@meta
-- tim19Atlas stub generated from lua/ge/client/postFx/dof.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Profondeur de champ (DOF) en post-traitement. Crée le PostEffect « DOFPostEffect » (désactivé au départ, PFXAfterBin / UpscaleDispatch) avec ses sous-effets (DOFBlurY, DOFBlurX, DOFCalcCoC, DOFSmallBlur, DOFFinalPFX) et leurs shaders. Gère la mise au point manuelle ou automatique (lancer de rayon au centre de l'écran, distance au véhicule du joueur s'il est visible, lissée par un lisseur temporel) et envoie les constantes de shader à chaque image. Les réglages utilisateur sont lus dans les variables $DOFPostFx::* (Enable, EnableDebugMode, EnableAutoFocus, BlurMin, BlurMax, FocusRangeMin, FocusRangeMax, BlurCurveNear, BlurCurveFar).
--- Accès : globale `dofModule`
---@class dofModule
dofModule = {}

--- Écrit dans le VariableRegistry les valeurs par défaut des variables $DOFPostFx::*. N'active rien : voir updateDOFSettings.
---Source : lua/ge/client/postFx/dof.lua:570
function dofModule.applyDefaults() end

--- Relit les variables $DOFPostFx::*, applique les paramètres de mise au point, le mode auto-focus et le mode debug à DOFPostEffect, remet la distance focale à 0 puis active ou désactive l'effet selon $DOFPostFx::Enable. Sans effet si DOFPostEffect n'existe pas.
---Source : lua/ge/client/postFx/dof.lua:655
function dofModule.updateDOFSettings() end

--- Callbacks de DOFPostEffect, publiés sur la globale DOFPostEffectCallbacks.
---@class dofModule_dOFPostEffectCallbacks
local dofModule_dOFPostEffectCallbacks = {}

--- Appelée à l'ajout de l'effet : initialise lerpScale/lerpBias (0,2 ; 0,3 ; 0,5), auto-focus désactivé, flous max 0,5, plages 50 à 500, pentes -5 et 5.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/client/postFx/dof.lua:423
function dofModule_dOFPostEffectCallbacks.onAdd() end

--- Appelée avant le rendu de l'effet : bascule entre mode complet et mode « small only » et ajuste les sous-effets.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/client/postFx/dof.lua:467
function dofModule_dOFPostEffectCallbacks.preProcess() end

--- Appelée avant l'exécution : met à jour la mise au point automatique si elle est active, calcule les équations de flou proche/lointain et envoie $dofEqWorld, $dofEqFar, $maxWorldCoC, $maxFarCoC, $dofLerpScale, $dofLerpBias et $isDebugMode à DOFFinalPFX.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/client/postFx/dof.lua:486
function dofModule_dOFPostEffectCallbacks.setShaderConsts() end

--- Callbacks de DOFFinalPFX (globale DOFFinalPFXCallbacks, réutilisée si elle existe déjà).
---@class dofModule_dofFinalCallbacks
local dofModule_dofFinalCallbacks = {}

--- En mode « small only », rappelle dOFPostEffectCallbacks.setShaderConsts pour mettre à jour les constantes du shader final.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/client/postFx/dof.lua:552
function dofModule_dofFinalCallbacks.setShaderConsts() end

