# `flowgraph_nodes_environment_setFogDensity`

*Fichier : `lua/ge/extensions/flowgraph/nodes/environment/setFogDensity.lua` · VM : Game Engine (GE) · 70 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/environment/setFogDensity")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Set Fog » (catégorie dynamic_instant). Règle la densité du brouillard (density, 0 à 1) et la hauteur atmosphérique du brouillard (atmosphereHeight) via core_environment. Au démarrage du graphe il mémorise les valeurs actuelles et les restaure à l'arrêt (data.restoreTod).

## Remarques

- Ancien pin « fog » renommé en « density » (legacyPins).
- La clé de restauration s'appelle restoreTod (copiée du nœud Time of Day).

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` | Mémorise la densité et la hauteur de brouillard actuelles. | 40 |
| `C:_executionStopped()` | Restaure les valeurs mémorisées si data.restoreTod est vrai. | 46 |
| `C:init(mgr)` | Définit data.restoreTod = true. | 27 |
| `C:postInit()` | Configure le pin density comme curseur 0 à 1. | 31 |
| `C:setFogParameters()` | Appelle core_environment.setFogDensity et setFogAtmosphereHeight avec les valeurs des pins. | 64 |
| `C:work()` | En mode repeat, applique les paramètres à chaque frame. | 58 |
| `C:workOnce()` | Applique les paramètres une fois. | 54 |

## Appels vers le moteur (C++)

- `core_environment.` `getFogAtmosphereHeight`, `getFogDensity`, `setFogAtmosphereHeight`, `setFogDensity`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/environment/setFogDensity.lua`.*
