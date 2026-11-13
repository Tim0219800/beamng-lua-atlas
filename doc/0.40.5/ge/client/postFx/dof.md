# `dofModule`

*Fichier : `lua/ge/client/postFx/dof.lua` · VM : Game Engine (GE) · 697 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** globale `dofModule`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `dofModule.applyDefaults()` |  | 570 |
| `dofModule.updateDOFSettings()` |  | 655 |

## Classe `dOFPostEffectCallbacks`

| Méthode | Description | Ligne |
|---|---|---|
| `dOFPostEffectCallbacks.onAdd()` |  | 423 |
| `dOFPostEffectCallbacks.preProcess()` |  | 467 |
| `dOFPostEffectCallbacks.setShaderConsts()` |  | 486 |

## Classe `dofFinalCallbacks`

| Méthode | Description | Ligne |
|---|---|---|
| `dofFinalCallbacks.setShaderConsts()` |  | 552 |

## Appels vers le moteur (C++)

- `Engine.` `sceneGetCameraFrustum`
- `be:` `getPlayerVehicle`, `getPlayerVehicleID`
- `scenetree.` `findObject`, `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/client/postFx/dof.lua`.*
