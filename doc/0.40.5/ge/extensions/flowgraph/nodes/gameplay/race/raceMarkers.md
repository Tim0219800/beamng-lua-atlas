# `flowgraph_nodes_gameplay_race_raceMarkers`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/race/raceMarkers.lua` · VM : Game Engine (GE) · 175 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/race/raceMarkers")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Race Markers » (catégorie repeat_instant, tag scenario). Affiche en 3D (module scenario/race_marker) les marqueurs de course d'un véhicule et dessine les mêmes points sur la minimap. Au premier flux avec raceData, crée un marqueur par pathnode (position, rayon, normale, position du suivant) ; à chaque évènement rollingStarted/pathnodeReached/raceStarted du véhicule, recalcule les modes (default, next, start, lap, recovery, final, branch, hidden) à partir de state.nextPathnodes et overNextPathnodes. Entrées : clear (impulsion qui supprime les marqueurs), raceData, vehId, ignoreRecovery, minAlpha (0,15), maxAlpha (1), minDistance (5), maxDistance (50), alwaysShowFinal.

## Remarques

- Les pins minAlpha, maxAlpha, minDistance, maxDistance sont déclarées mais jamais lues dans ce fichier.
- L'ancienne pin 'reset' est redirigée vers 'clear'.
- Il reste un « ]] » isolé dans le code (reste d'un bloc commenté).

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStopped()` | Détruit les marqueurs (markers.onClientEndMission) et vide la route. | 156 |
| `C:destroy()` | Destruction du nœud : appelle _executionStopped. | 169 |
| `C:init()` | Initialise markers, minimapMarkers et route. | 45 |
| `C:onClientEndMission()` | Hook de fin de mission : appelle _executionStopped. | 164 |
| `C:onDrawOnMinimap(td)` | Hook minimap : dessine ligne (pathnode avec normale) ou cercle de chaque marqueur non caché, avec pointeur de bord. | 135 |
| `C:onMinimapRouteOverride(routeOverrides)` | Hook minimap : ajoute à routeOverrides une copie du chemin détaillé aiDetailedPath de la course (refermé s'il est fermé). | dyn |
| `C:onPreRender(dt, dtSim)` | Hook de rendu : appelle markers.render(dt, dtSim). | 149 |
| `C:work()` | Gère clear ; crée les marqueurs au besoin et met à jour leurs modes sur évènement de course. | 50 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/race/raceMarkers.lua`.*
