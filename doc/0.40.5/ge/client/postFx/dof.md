# `dofModule`

*Fichier : `lua/ge/client/postFx/dof.lua` · VM : Game Engine (GE) · 697 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** globale `dofModule`

Profondeur de champ (DOF) en post-traitement. Crée le PostEffect « DOFPostEffect » (désactivé au départ, PFXAfterBin / UpscaleDispatch) avec ses sous-effets (DOFBlurY, DOFBlurX, DOFCalcCoC, DOFSmallBlur, DOFFinalPFX) et leurs shaders. Gère la mise au point manuelle ou automatique (lancer de rayon au centre de l'écran, distance au véhicule du joueur s'il est visible, lissée par un lisseur temporel) et envoie les constantes de shader à chaque image. Les réglages utilisateur sont lus dans les variables $DOFPostFx::* (Enable, EnableDebugMode, EnableAutoFocus, BlurMin, BlurMax, FocusRangeMin, FocusRangeMax, BlurCurveNear, BlurCurveFar).

## Exemple

```lua
local dof = require('client/postFx/dof')
VariableRegistry.set('$DOFPostFx::BlurMax', 0.4)
dof.updateDOFSettings()
```

## Remarques

- Valeurs par défaut (applyDefaults) : Enable true, EnableDebugMode false, EnableAutoFocus false, BlurMin 0.0, BlurMax 0.25, FocusRangeMin 100, FocusRangeMax 250, BlurCurveNear 20, BlurCurveFar 10.
- updateDOFSettings passe -BlurCurveNear comme pente proche (négative) et BlurCurveFar comme pente lointaine ; les flous max sont bornés entre 0 et 1.
- Mode « small only » : si le flou maximal reste faible (canUseSmallOnly), preProcess désactive les passes de grand flou (skipDraw / skip) et met la macro BNG_DOF_SMALL_ONLY=1 sur DOFFinalPFX, pour économiser du GPU.
- La distance de mise au point automatique utilise containerRayCast avec les masques Static, Terrain, Vehicle et DynamicShape et retombe sur $Param::FarDist en l'absence d'impact.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `dofModule.applyDefaults()` | Écrit dans le VariableRegistry les valeurs par défaut des variables $DOFPostFx::*. N'active rien : voir updateDOFSettings. | 570 |
| `dofModule.updateDOFSettings()` | Relit les variables $DOFPostFx::*, applique les paramètres de mise au point, le mode auto-focus et le mode debug à DOFPostEffect, remet la distance focale à 0 puis active ou désactive l'effet selon $DOFPostFx::Enable. Sans effet si DOFPostEffect n'existe pas. | 655 |

## Classe `dOFPostEffectCallbacks`

Callbacks de DOFPostEffect, publiés sur la globale DOFPostEffectCallbacks.

| Méthode | Description | Ligne |
|---|---|---|
| `dOFPostEffectCallbacks.onAdd()` | Appelée à l'ajout de l'effet : initialise lerpScale/lerpBias (0,2 ; 0,3 ; 0,5), auto-focus désactivé, flous max 0,5, plages 50 à 500, pentes -5 et 5. | 423 |
| `dOFPostEffectCallbacks.preProcess()` | Appelée avant le rendu de l'effet : bascule entre mode complet et mode « small only » et ajuste les sous-effets. | 467 |
| `dOFPostEffectCallbacks.setShaderConsts()` | Appelée avant l'exécution : met à jour la mise au point automatique si elle est active, calcule les équations de flou proche/lointain et envoie $dofEqWorld, $dofEqFar, $maxWorldCoC, $maxFarCoC, $dofLerpScale, $dofLerpBias et $isDebugMode à DOFFinalPFX. | 486 |

## Classe `dofFinalCallbacks`

Callbacks de DOFFinalPFX (globale DOFFinalPFXCallbacks, réutilisée si elle existe déjà).

| Méthode | Description | Ligne |
|---|---|---|
| `dofFinalCallbacks.setShaderConsts()` | En mode « small only », rappelle dOFPostEffectCallbacks.setShaderConsts pour mettre à jour les constantes du shader final. | 552 |

## Appels vers le moteur (C++)

- `Engine.` `sceneGetCameraFrustum`
- `be:` `getPlayerVehicle`, `getPlayerVehicleID`
- `scenetree.` `findObject`, `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/client/postFx/dof.lua`.*
