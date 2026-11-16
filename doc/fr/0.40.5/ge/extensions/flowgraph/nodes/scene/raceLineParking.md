# `flowgraph_nodes_scene_raceLineParking`

*Fichier : `lua/ge/extensions/flowgraph/nodes/scene/raceLineParking.lua` · VM : Game Engine (GE) · 337 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/scene/raceLineParking")` (fichier sous extensions/ mais pas une extension classique)

Noeud flowgraph « Raceline Parking » (repeat_instant, auteur BeamNG). Vérifie qu'un véhicule est garé dans une place définie par position/rotation/scale (le scale donne demi-largeur x, longueur y et profondeur z). Calcule dotAngle, forward, sideDistance, forwardDistance (basés sur le centre des deux roues avant) et détecte l'arrêt (vitesse <= 0.05 m/s pendant stop_timer secondes). Dessine un volume de debug coloré dans le monde et, si le pin imgui est vrai, un aperçu 2D imgui.

## Remarques

- Bug : checkParking lit self.pinIn.vehicleID alors que le pin s'appelle vehId : ce pin est ignoré et c'est toujours le véhicule du joueur (getPlayerVehicle(0)) qui est suivi. drawImgui utilise aussi toujours le véhicule du joueur.
- getTwoSmallestValues renvoie deux fois la même roue si le nombre de roues est impair.
- drawDebug référence la variable globale drawMode, probablement nil (alpha 0.25).
- Valeurs de rotation par défaut quat(0,0,0,0) (non valide) si le pin n'est pas branché.

## Classe `C`

Classe du noeud flowgraph (retournee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` | Remet stopTimer à nil au démarrage du graphe. | 44 |
| `C:_executionStopped()` | Remet stopTimer à nil à l'arrêt du graphe. | 48 |
| `C:_onDeserialized(res)` | Ne restaure rien. | 268 |
| `C:_onSerialize(res)` | Ne sauvegarde rien. | 264 |
| `C:checkParking()` | Calcule les sorties (dotAngle, forward, sideDistance, forwardDistance, inside, stopping, stoppedPercent, stopped) pour le véhicule suivi. | 151 |
| `C:drawDebug()` | Dessine avec debugDrawer des triangles semi-transparents (boîte de la place, côtés gauche/droit) colorés selon l'état. | 272 |
| `C:drawImgui()` | Dessine l'aperçu imgui 280x300 : bords de la place (vert/jaune/rouge), contour du véhicule, essieu avant et cercle de progression de l'arrêt. | 110 |
| `C:drawLine(line, color, thickness)` | Dessine une polyligne 2D dans la ImDrawList courante. | 90 |
| `C:drawMiddle(builder, style)` | Dessine le contenu central du noeud dans l'éditeur. | 260 |
| `C:getVehicleFrontwheelsCenterPosition(vehicle, pos)` | Renvoie le centre des deux roues les plus à l'avant, puis les positions de chaque roue (vec3), ou rien si vehicle/pos est nil. | 236 |
| `C:init(mgr, ...)` | Rien à initialiser. | 40 |
| `C:onClientEndMission()` | Hook de fin de mission : appelle _executionStopped. | 52 |
| `C:toInternal2d(pos)` | Convertit une position monde en coordonnées 2D de l'aperçu imgui, relatives à la place. | 77 |
| `C:work(args)` | Sur clear, remet les sorties à nil ; sur flow, appelle checkParking, drawDebug et éventuellement drawImgui. | 58 |
| `C:worldLineToMapLine(line)` | Convertit une liste de points monde en points 2D de l'aperçu (table réutilisée entre appels). | 101 |

## Appels vers le moteur (C++)

- `debugDrawer:` `drawTriSolid`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/scene/raceLineParking.lua`.*
