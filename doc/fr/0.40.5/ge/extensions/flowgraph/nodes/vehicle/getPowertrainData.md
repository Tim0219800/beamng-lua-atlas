# `flowgraph_nodes_vehicle_getPowertrainData`

*Fichier : `lua/ge/extensions/flowgraph/nodes/vehicle/getPowertrainData.lua` · VM : Game Engine (GE) · 64 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/vehicle/getPowertrainData")` (fichier sous extensions/ mais pas une extension classique)

Nœud « Get Powertrain Data » (catégorie `once_f_duration`). Demande une propriété d'un périphérique du powertrain (`core_vehicleBridge.requestValue(veh, cb, 'powertrainDevice', device, property)`). Pins d'entrée : `vehId`, `device` (nom du device), `property` ; sortie `value` (any). État de durée : inactive/started/finished.

## Remarques

- Le callback de requête contient `dump(val) dumpz(self, 1)` : des traces de debug sont écrites dans le log à chaque réponse.

## Classe `C`

Classe du nœud flowgraph (renvoyée par `_flowgraph_createNode(C)`). Champs de définition : name, description, category, pinSchema, tags.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` | Appelé par le gestionnaire quand l'exécution du projet flowgraph démarre ; remet l'état interne à zéro. | 29 |
| `C:init()` | Constructeur du nœud, appelé à sa création par l'éditeur/gestionnaire de flowgraph ; initialise l'état interne. | 26 |
| `C:onNodeReset()` | Efface la réponse reçue et passe en durée `inactive`. | 33 |
| `C:work()` | Quand la réponse est arrivée, la copie sur `value` et passe en `finished`. | 51 |
| `C:workOnce()` | Envoie la requête powertrain au véhicule et passe en `started`. | 38 |

## Appels vers le moteur (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/vehicle/getPowertrainData.lua`.*
