# `flowgraph_nodes_vehicle_ai_stop`

*Fichier : `lua/ge/extensions/flowgraph/nodes/vehicle/ai/stop.lua` · VM : Game Engine (GE) · 65 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/vehicle/ai/stop")` (fichier sous extensions/ mais pas une extension classique)

Nœud « AI Stop » (couleur ai, once_p_duration). Demande à l'IA d'arrêter le véhicule (ai.setState mode « stop ») et active la sortie stopped quand sa vitesse passe sous checkVelocity (0,01 m/s). Entrées : aiVehId (sans valeur = joueur), checkVelocity (caché). Sortie : stopped (flow).

## Classe `C`

Classe du nœud flowgraph ; chaque instance représente un nœud dans un graphe.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` | Appelle onNodeReset. | 30 |
| `C:getVeh()` | Renvoie le véhicule dont l'id est donné en entrée, ou le véhicule du joueur (getPlayerVehicle(0)) sans entrée. | 34 |
| `C:init()` | Initialise complete=false. | 22 |
| `C:onNodeReset()` | Remet complete à false. | 26 |
| `C:work()` | Si l'arrêt est constaté, active stopped ; sinon compare la vitesse (map.objects[vehId].vel) au seuil et mémorise complete. | 51 |
| `C:workOnce()` | Envoie au véhicule ai.setState({mode = "stop"}). | 44 |

## Appels vers le moteur (C++)

- `be:` `getPlayerVehicleID`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/vehicle/ai/stop.lua`.*
