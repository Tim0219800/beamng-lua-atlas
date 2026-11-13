# `flowgraph_nodes_vehicle_ai_aiParams`

*Fichier : `lua/ge/extensions/flowgraph/nodes/vehicle/ai/aiParams.lua` · VM : Game Engine (GE) · 103 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/vehicle/ai/aiParams")` (fichier sous extensions/ mais pas une extension classique)

Nœud « AI Parameters » (couleur ai, repeat_p_duration). Règle divers paramètres de l'IA d'un véhicule en envoyant des commandes ai.* via queueLuaCommand. Entrées : vehId (sans valeur = véhicule du joueur), risk (0,3 ; borné à 0,1-2,0 : ai.setAggression), routeSpeed (m/s : ai.setSpeed), routeMode (off, set, limit : ai.setSpeedMode), drivabilityCO (caché : ai.setCutOffDrivability), inLane (ai.driveInLane), avoidCars (ai.setAvoidCars), forceRisk (ai.setAggressionMode off/rubberBand), activateNitrous (jatoInput et contrôleur nitrousOxideInjection). Pin hérité : vehID devenu vehId.

## Remarques

- Les commandes sont renvoyées à chaque frame tant que le nœud reçoit du flow.
- forceRisk=true envoie ai.setAggressionMode('off'), sinon 'rubberBand'.

## Classe `C`

Classe du nœud flowgraph ; chaque instance représente un nœud dans un graphe.

| Méthode | Description | Ligne |
|---|---|---|
| `C:postInit()` | Configure le curseur de risk (0,1 à 2,0) et les modèles du pin routeMode (off, set, limit). | 33 |
| `C:work()` | Retrouve le véhicule (getObjectByID ou getPlayerVehicle(0)) et envoie à chaque frame les commandes ai.* correspondant aux pins renseignés ; gère l'activation/désactivation du nitro (bascule du contrôleur nitrousOxideInjection seulement si son état armé diffère). | 48 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/vehicle/ai/aiParams.lua`.*
