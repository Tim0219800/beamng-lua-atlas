# `flowgraph_nodes_vehicle_setGearbox`

*Fichier : `lua/ge/extensions/flowgraph/nodes/vehicle/setGearbox.lua` · VM : Game Engine (GE) · 64 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/vehicle/setGearbox")` (fichier sous extensions/ mais pas une extension classique)

Nœud « Set Gearbox Mode » (catégorie `once_f_duration`). Change le mode de boîte (`arcade` ou `realistic`) via `core_vehicleBridge.executeAction(veh,'setGearboxMode', mode)`, puis envoie un `ping` pour savoir quand c'est reçu. Pins d'entrée : `vehId`, `mode` (string).

## Classe `C`

Classe du nœud flowgraph (renvoyée par `_flowgraph_createNode(C)`). Champs de définition : name, description, category, pinSchema, tags.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` | Appelé par le gestionnaire quand l'exécution du projet flowgraph démarre ; remet l'état interne à zéro. | 31 |
| `C:init()` | Constructeur du nœud, appelé à sa création par l'éditeur/gestionnaire de flowgraph ; initialise l'état interne. | 24 |
| `C:onNodeReset()` | Efface la réponse et passe en durée `inactive`. | 35 |
| `C:postInit()` | Définit les valeurs proposées pour `mode` : arcade, realistic. | 27 |
| `C:work()` | Quand le ping revient, passe en `finished`. | 55 |
| `C:workOnce()` | Envoie l'action et un ping au véhicule, passe en `started`. | 40 |

## Appels vers le moteur (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/vehicle/setGearbox.lua`.*
