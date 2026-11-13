# `flowgraph_nodes_gameplay_dragRace_generateDragOpponents`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/dragRace/generateDragOpponents.lua` · VM : Game Engine (GE) · 226 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/dragRace/generateDragOpponents")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Generate Drag Race Opponents » (catégorie once_instant, dépend de gameplay_drag_dragBridge). Génère une liste de configurations de véhicules adverses (model, config, paint, dial) adaptée au véhicule du joueur. Pins d'entrée : vehId, numberOfOpponents (1), playerDial (-1 = automatique). Sortie : vehicleGroup (table). En bracketRace, adversaires aléatoires avec dial réduit de 0.5 ; sinon adversaires de temps 1/4 mile proche du dial du joueur ([dial-0.1 ; dial+0.4[).

## Remarques

- Seuls les modèles de type Car ou Truck non auxiliaires et hors configs simple_traffic sont candidats.
- Si rien ne convient, le véhicule du joueur est dupliqué (getPlayerVehicleAsFallback).
- Le dial par défaut vaut 12 si aucune donnée de performance n'existe.
- Le pin vehId est déclaré mais jamais lu : le véhicule courant est pris via core_vehicles.getCurrentVehicleDetails().

**Dépendances (chargées avant) :** `gameplay_drag_dragBridge`

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` | Vide la sélection et met playerId à 0. | 214 |
| `C:createVehicleEntry(config)` | Construit {model, config, paint aléatoire, dial} à partir d'une config (dial = time_1_4 des données de performance, sinon 12). | 69 |
| `C:drawCustomProperties()` | Éditeur : aucune propriété. | 31 |
| `C:drawMiddle(builder, style)` | Dessin du nœud dans l'éditeur. | 36 |
| `C:filterValidVehicleConfigs()` | Liste les configurations de core_vehicles.getConfigList valides comme adversaires. | 50 |
| `C:generateBracketRaceOpponents(vehConfigs, count)` | Choisit des configs aléatoires avec dial - 0.5. | 138 |
| `C:generateSimilarOpponents(vehConfigs, dial, count, currentVeh)` | Choisit des configs dont le temps 1/4 est proche du dial donné. | 157 |
| `C:getPlayerDial(currentVeh)` | Détermine le dial du joueur : pin playerDial si >= 0, sinon dial enregistré (dragBridge.getDialTimes), sinon données de performance, sinon 12. | 113 |
| `C:getPlayerVehicleAsFallback(count)` | Renvoie count copies du véhicule du joueur comme adversaires de secours. | 85 |
| `C:init()` | Initialise selectedOpponents et playerId. | 26 |
| `C:selectVehicle()` | Choisit la stratégie (bracketRace ou similaire) et renvoie la liste d'adversaires. | 189 |
| `C:workOnce()` | Initialise le hasard et écrit vehicleGroup. | 219 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/dragRace/generateDragOpponents.lua`.*
