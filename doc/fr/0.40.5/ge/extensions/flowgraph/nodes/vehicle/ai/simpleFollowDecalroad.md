# `flowgraph_nodes_vehicle_ai_simpleFollowDecalroad`

*Fichier : `lua/ge/extensions/flowgraph/nodes/vehicle/ai/simpleFollowDecalroad.lua` · VM : Game Engine (GE) · 161 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/vehicle/ai/simpleFollowDecalroad")` (fichier sous extensions/ mais pas une extension classique)

Nœud « Follow Decalroad » (couleur ai, comportement duration). Fait suivre simplement une DecalRoad à un véhicule : construit un chemin à partir des nœuds de la route (temps = distance / data.speed) et lance ai.startFollowing. Entrées : flow, start, stop, roadName, vehId, loopCount (caché). Sorties : flow, active, finished, progress (0 à 1). Données : renderDebug, speed (5 m/s), loopMode (« startReset »).

## Remarques

- Bug : dans onVehicleSubmitInfo, self.pinOut.active et self.pinOut.finished sont remplacés par des booléens (au lieu de .value), ce qui écrase les objets pin.
- Bug : quand info == nil, la fonction continue et lit info.scriptTime (erreur), il manque un return.
- Le dernier nœud de la route n'est pas ajouté au chemin (la boucle va de 0 à getNodeCount()-2), et la fin n'est jamais détectée par flow.

## Classe `C`

Classe du nœud flowgraph ; chaque instance représente un nœud dans un graphe.

| Méthode | Description | Ligne |
|---|---|---|
| `C:drawMiddle(builder, style)` | Affiche bouton Load, état, nombre de nœuds, distance et tracé de debug si renderDebug. | 129 |
| `C:getVeh()` | Renvoie le véhicule dont l'id est donné en entrée, ou le véhicule du joueur (getPlayerVehicle(0)) sans entrée. | 61 |
| `C:init()` | Initialise les données (speed=5, loopMode=startReset, renderDebug=false) et demande à tous les véhicules d'émettre le hook onVehicleSubmitInfo avec leur ai.scriptState(). | 33 |
| `C:loadRecording()` | Construit self.path depuis la DecalRoad (scenetree.findObject(roadName)) : un point par nœud avec le temps cumulé et la direction/haut du premier point. | 98 |
| `C:onVehicleSubmitInfo(id, info)` | Hook appelé avec l'état du script IA d'un véhicule ; met à jour progress = scriptTime / endScriptTime et receivedInfo si l'id correspond à vehId. | 47 |
| `C:play()` | Charge la route, envoie ai.startFollowing(path, nil, loopCount ou -1, loopMode) et initialise les pins finished, active et progress. | 71 |
| `C:stop()` | Envoie ai.stopFollowing() et met finished/active à false. | 87 |
| `C:work()` | Appelle play sur start, ou stop sur stop. | 121 |

## Appels vers le moteur (C++)

- `be:` `queueAllObjectLua`
- `debugDrawer:` `drawSphere`, `drawSquarePrism`
- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/vehicle/ai/simpleFollowDecalroad.lua`.*
