# `flowgraph_nodes_vehicle_getElectricsValue`

*Fichier : `lua/ge/extensions/flowgraph/nodes/vehicle/getElectricsValue.lua` · VM : Game Engine (GE) · 92 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/vehicle/getElectricsValue")` (fichier sous extensions/ mais pas une extension classique)

Nœud « Get Electrics Value » (catégorie `once_f_duration`). Lit une valeur d'`electrics` du véhicule : s'abonne avec `core_vehicleBridge.registerValueChangeNotification(veh, key)` puis lit le cache `getCachedVehicleData`. Pins : entrées `vehId`, `key` (string, avec modèles prédéfinis : throttle, throttle_input, rpm, brake, brake_input, parkingbrake, parkingbrake_input, gear, clutch…) ; sortie `value` (any). Utilise l'état de durée (inactive, started, finished).

## Remarques

- La liste de modèles de `key` est dans `postInit` (extrait ici, plus longue dans le code).
- Le nœud passe à `finished` dès qu'une valeur non nil est reçue ; la notification est retirée au reset/arrêt.

## Classe `C`

Classe du nœud flowgraph (renvoyée par `_flowgraph_createNode(C)`). Champs de définition : name, description, category, pinSchema, tags.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` | Appelé par le gestionnaire quand l'exécution du projet flowgraph démarre ; remet l'état interne à zéro. | 41 |
| `C:_executionStopped()` | Appelé par le gestionnaire quand l'exécution du projet s'arrête ; nettoie l'état interne. | 44 |
| `C:clearNotification()` | Se désabonne de la notification de changement de valeur (`unregisterValueChangeNotification`) et vide `_setupData`. | 48 |
| `C:init()` | Constructeur du nœud, appelé à sa création par l'éditeur/gestionnaire de flowgraph ; initialise l'état interne. | 25 |
| `C:onNodeReset()` | Passe en durée `inactive` et supprime la notification. | 59 |
| `C:postInit()` | Définit `hardTemplates` du pin `key` : liste de clés electrics courantes proposées dans l'éditeur. | 28 |
| `C:work()` | Lit la valeur en cache ; si elle existe, l'écrit dans `value` et passe en `finished`. | 78 |
| `C:workOnce()` | S'abonne à la valeur `key` du véhicule et passe en durée `started`. | 64 |

## Appels vers le moteur (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/vehicle/getElectricsValue.lua`.*
