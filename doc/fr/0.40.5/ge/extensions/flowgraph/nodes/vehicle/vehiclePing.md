# `flowgraph_nodes_vehicle_vehiclePing`

*Fichier : `lua/ge/extensions/flowgraph/nodes/vehicle/vehiclePing.lua` · VM : Game Engine (GE) · 59 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/vehicle/vehiclePing")` (fichier sous extensions/ mais pas une extension classique)

Nœud « Vehicle Ping » (catégorie `once_f_duration`). Envoie un `ping` au véhicule (`core_vehicleBridge.requestValue(veh, cb, 'ping')`) pour s'assurer que les commandes précédentes sont arrivées avant de continuer. Pin d'entrée : `vehId` (défaut : joueur). Durée : inactive/started/finished.

## Classe `C`

Classe du nœud flowgraph (renvoyée par `_flowgraph_createNode(C)`). Champs de définition : name, description, category, pinSchema, tags.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` | Appelé par le gestionnaire quand l'exécution du projet flowgraph démarre ; remet l'état interne à zéro. | 26 |
| `C:init()` | Constructeur du nœud, appelé à sa création par l'éditeur/gestionnaire de flowgraph ; initialise l'état interne. | 23 |
| `C:onNodeReset()` | Efface la réponse et passe en durée `inactive`. | 30 |
| `C:work()` | Quand le ping revient, passe en `finished`. | 48 |
| `C:workOnce()` | Envoie le ping et passe en `started`. | 35 |

## Appels vers le moteur (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/vehicle/vehiclePing.lua`.*
