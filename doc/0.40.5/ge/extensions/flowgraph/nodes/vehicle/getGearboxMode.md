# `flowgraph_nodes_vehicle_getGearboxMode`

*Fichier : `lua/ge/extensions/flowgraph/nodes/vehicle/getGearboxMode.lua` · VM : Game Engine (GE) · 61 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/vehicle/getGearboxMode")` (fichier sous extensions/ mais pas une extension classique)

Nœud « Get Gearboxmode » (catégorie `once_f_duration`). Demande au contrôleur `mainController` du véhicule son `gearboxMode` (par `core_vehicleBridge.requestValue`) et le renvoie sur la sortie `value` (any). Pin d'entrée : `vehId` (défaut : joueur). État de durée : inactive/started/finished.

## Classe `C`

Classe du nœud flowgraph (renvoyée par `_flowgraph_createNode(C)`). Champs de définition : name, description, category, pinSchema, tags.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` | Appelé par le gestionnaire quand l'exécution du projet flowgraph démarre ; remet l'état interne à zéro. | 27 |
| `C:init()` | Constructeur du nœud, appelé à sa création par l'éditeur/gestionnaire de flowgraph ; initialise l'état interne. | 24 |
| `C:onNodeReset()` | Efface la réponse reçue et passe en durée `inactive`. | 31 |
| `C:work()` | Quand la réponse est arrivée, la copie sur `value` et passe en `finished`. | 49 |
| `C:workOnce()` | Envoie la requête `mainController/gearboxMode` au véhicule et passe en `started`. | 36 |

## Appels vers le moteur (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/vehicle/getGearboxMode.lua`.*
