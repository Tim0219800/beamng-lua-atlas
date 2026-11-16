# `flowgraph_nodes_gameplay_rally_vehicleStoppedNearPos`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/rally/vehicleStoppedNearPos.lua` · VM : Game Engine (GE) · 200 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/rally/vehicleStoppedNearPos")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Stopped Near Position? » (catégorie repeat, icône timer, comportement once + duration, tag rally). Vérifie qu'un véhicule est à l'arrêt (vitesse < 0,1 m/s) à moins de radius mètres d'une position pendant au moins duration secondes. Entrées : flow, reset (impulsion), vehId, pos (vec3 ou table), duration (0,5 s par défaut), radius (4 m par défaut). Sorties : flow (vrai une fois la durée atteinte), impulse (impulsion à ce moment). Le chrono avance avec dtReal et repart de zéro si le véhicule bouge dans la zone. Diffuse chaque frame l'état de proximité à l'UI via onRallyDataUpdated (activeState vehicleProximity avec isNear, distance, isStopped, timer, duration).

## Remarques

- La distance est mesurée depuis le centre avant du véhicule (RallyUtil.getVehFrontCenter).
- Position cible et rayon sont mis en cache à la première lecture.
- Avec le drapeau de debug 'stopZones' de gameplay_rallyLoop, dessine la zone (sphère) et le point directeur du véhicule.

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` | Remet à zéro chrono, état et cache. | 40 |
| `C:drawDebugStopZone()` | Dessine la sphère de la zone d'arrêt si le drapeau de debug stopZones est actif. | 130 |
| `C:drawDebugVehiclePoint(inside)` | Dessine le point directeur du véhicule (couleur selon dedans/dehors) si stopZones est actif. | 136 |
| `C:drawMiddle(builder, style)` | Affiche une barre de progression du chrono. | 56 |
| `C:init(mgr, ...)` | Initialise chrono, cible et intervalle de hook (0,1 s, non utilisé ensuite). | 31 |
| `C:isNearPosition()` | Teste si le centre avant du véhicule est dans le rayon de la position cible. | 111 |
| `C:isStopped()` | Vrai si la vitesse du véhicule est inférieure à 0,1 m/s. | 103 |
| `C:updateTimer()` | Avance le chrono (dtReal) ; à la durée atteinte, arrête le chrono et émet l'impulsion. | 47 |
| `C:updateVehicleData2()` | Met à jour position avant et vitesse du véhicule suivi depuis map.objects. | 84 |
| `C:work(args)` | Gère reset et chrono, diffuse la proximité à l'UI et met à jour flow/impulse. | 144 |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onRallyDataUpdated` — écouté par 2 module(s)

## Appels vers le moteur (C++)

- `debugDrawer:` `drawSphere`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/rally/vehicleStoppedNearPos.lua`.*
