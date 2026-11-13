# `flowgraph_nodes_gameplay_rally_vehicleStoppedNearPlane`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/rally/vehicleStoppedNearPlane.lua` · VM : Game Engine (GE) · 358 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/rally/vehicleStoppedNearPlane")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Stopped Near Plane? » (catégorie repeat, icône timer, comportement once + duration, tag rally). Vérifie qu'un véhicule est à l'arrêt à moins de distance mètres d'un plan (position pos, rotation rot ; la normale du plan est l'axe Y local) pendant au moins duration secondes. Le véhicule doit être devant le plan (distance signée >= 0) et dans une zone latérale finie de 10 m ; il est à l'arrêt si sa vitesse est inférieure à speedThreshold. Entrées : flow, reset (impulsion), vehId, pos (vec3 ou table), rot (quat ou table), duration (4 s par défaut), distance (1 m), speedThreshold (0,08 m/s). Sorties : flow (vrai une fois la durée atteinte), impulse. Diffuse chaque frame l'état de proximité à l'UI via onRallyDataUpdated (isNear, distance d'affichage, distanceToPlane, isStopped, usingGroundMarkerDistance, timer, duration). Sert pour les contrôles d'arrêt rally (arrivée de spéciale, etc.).

## Remarques

- La mesure part du centre avant du véhicule (RallyUtil.getVehFrontCenter).
- Hors de la zone latérale, la distance affichée vient de core_groundMarkers.getPathLength() si un marqueur au sol est actif.
- Le chrono utilise dtReal. Il repart de zéro si le véhicule n'est plus près du plan ou bouge dans la zone ; reset l'annule aussi.
- Option data.drawDebug (false) ou drapeau 'stopZones' du gestionnaire de boucle : dessine plan, ligne véhicule-plan et point du véhicule.

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` | Remet à zéro chrono, cache et état de proximité. | 59 |
| `C:drawDebugVisualization()` | Dessine le plan et les repères de debug via StagedCountdownUtils. | 262 |
| `C:drawMiddle(builder, style)` | Affiche une barre de progression du chrono. | 87 |
| `C:getRallyLoopManager()` | Renvoie le gestionnaire de boucle rally si gameplay_rallyLoop existe. | 250 |
| `C:init(mgr, ...)` | Initialise le chrono et l'état de proximité mis en cache. | 33 |
| `C:isNearPlane()` | Renvoie l'état de proximité mis en cache. | 258 |
| `C:shouldDrawDebug()` | Vrai si data.drawDebug ou le drapeau stopZones de la boucle rally est actif. | 245 |
| `C:updateProximityState()` | Calcule distance signée au plan, distance latérale, zone finie, arrêt, proximité, distance d'affichage et état « staged ». | 179 |
| `C:updateTimer()` | Avance le chrono ; à la durée atteinte, arrête le chrono et émet l'impulsion. | 78 |
| `C:updateVehicleData()` | Met à jour position avant et vitesse du véhicule suivi à partir de map.objects. | 99 |
| `C:work(args)` | Chaque frame : lit pos/rot, met à jour le véhicule et la proximité, gère chrono et reset, diffuse l'UI, renseigne flow et impulse. | 272 |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onRallyDataUpdated` — écouté par 2 module(s)

## Appels vers le moteur (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/rally/vehicleStoppedNearPlane.lua`.*
