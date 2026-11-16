# `flowgraph_nodes_environment_setCloud`

*Fichier : `lua/ge/extensions/flowgraph/nodes/environment/setCloud.lua` · VM : Game Engine (GE) · 79 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/environment/setCloud")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Set Clouds » (catégorie dynamic_instant). Règle les paramètres des nuages. Pins d'entrée : objectId (id optionnel d'un objet nuage), coverage (0 à 1), exposure, windSpeed, height. Exécuté une fois (workOnce) ou à chaque frame en mode repeat.

## Remarques

- Sans objectId, seuls coverage (setCloudCover) et windSpeed (setWindSpeed) sont appliqués aux nuages par défaut ; exposure et height sont ignorés.
- data.restoreCloud = true est défini mais _executionStarted/_executionStopped sont vides : rien n'est restauré (valeur inutilisée).

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` | Vide. | 37 |
| `C:_executionStopped()` | Vide. | 45 |
| `C:init(mgr)` | Définit data.restoreCloud = true. | 24 |
| `C:postInit()` | Configure le pin coverage comme curseur 0 à 1. | 28 |
| `C:setCloudParameters()` | Appelle core_environment.setCloudCoverByID/ExposureByID/WindByID/HeightByID si objectId est fourni, sinon setCloudCover et setWindSpeed. | 64 |
| `C:work()` | En mode repeat, applique les paramètres à chaque frame. | 58 |
| `C:workOnce()` | Applique les paramètres une seule fois. | 54 |

## Appels vers le moteur (C++)

- `core_environment.` `setCloudCover`, `setCloudCoverByID`, `setCloudExposureByID`, `setCloudHeightByID`, `setCloudWindByID`, `setWindSpeed`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/environment/setCloud.lua`.*
