# `flowgraph_nodes_scene_rectMarker`

*Fichier : `lua/ge/extensions/flowgraph/nodes/scene/rectMarker.lua` · VM : Game Engine (GE) · 409 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/scene/rectMarker")` (fichier sous extensions/ mais pas une extension classique)

Noeud flowgraph « Parking Markers » (repeat_instant, auteur BeamNG). Crée une place de parking rectangulaire : un BeamNGTrigger de type Box et 4 marqueurs de coin (TSStatic art/shapes/interface/position_marker.dae) posés sur le sol, colorés selon que le véhicule est dedans. Sorties : inside, outside, partlyInside, stopped, stopping, stoppedPercent, dotAngle, forward, sideDistance, forwardDistance (et versions relatives, cachées). Détecte l'arrêt (vitesse <= 0.15 m/s pendant stop_timer s).

## Remarques

- Bug : dans checkParking, sc est rempli depuis self.pinIn.position (au lieu de scale) : sideDistanceRelative et forwardDistanceRelative sont divisés par la position, pas par la taille.
- updateMarkerPositions écrase la couleur de chaque marqueur par « 1 0 0 1 » à chaque changement ; checkParking la recolorie ensuite.
- Pin ancien nom reset -> clear (legacyPins).

## Classe `C`

Classe du noeud flowgraph (retournee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` | Remet stopTimer à 1 et marque l'état comme changé. | 91 |
| `C:_executionStopped()` | Appelle clear à l'arrêt du graphe. | 96 |
| `C:_onDeserialized(res)` | Ne restaure rien. | 404 |
| `C:_onSerialize(res)` | Ne sauvegarde rien. | 400 |
| `C:checkParking()` | Teste si les 8 coins de la boîte englobante du véhicule sont dans le trigger, colore les marqueurs et calcule les sorties (inside, partlyInside, distances, arrêt). | 132 |
| `C:clear()` | Supprime le trigger et les marqueurs créés et remet l'état à zéro. | 66 |
| `C:createCornerMarker(markerName)` | Crée un TSStatic marqueur de coin enregistré sous le nom donné et l'ajoute au MissionGroup. | 240 |
| `C:createMarkers()` | Crée les 4 marqueurs de coin. | 266 |
| `C:drawCustomProperties()` | Panneau de propriétés de l'éditeur (vide). | 227 |
| `C:drawMiddle(builder, style)` | Dessine le contenu central du noeud dans l'éditeur. | 232 |
| `C:init(mgr, ...)` | Initialise trigger, marqueurs, debug=false et stopTimer=1. | 56 |
| `C:manageTrigger()` | Crée le BeamNGTrigger (position, scale, rotation) au premier appel, puis le met à jour si les pins changent. | 331 |
| `C:onClientEndMission()` | Hook de fin de mission : appelle clear. | 100 |
| `C:updateMarkerPositions()` | Si la place a changé, replace chaque marqueur sur le sol (raycast) en alignant sa normale, ou à plat si staticMarkers. | 273 |
| `C:work(args)` | Sur clear, supprime tout et vide les sorties ; sur flow, gère le trigger, replace les marqueurs et vérifie le stationnement. | 105 |

## Appels vers le moteur (C++)

- `Engine.` `castRay`
- `Sim.` `upcast`
- `debugDrawer:` `drawTriSolid`
- `obj:` `delete`, `getId`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/scene/rectMarker.lua`.*
