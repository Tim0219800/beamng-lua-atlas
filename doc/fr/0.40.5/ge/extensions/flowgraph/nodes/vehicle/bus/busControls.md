# `flowgraph_nodes_vehicle_bus_busControls`

*Fichier : `lua/ge/extensions/flowgraph/nodes/vehicle/bus/busControls.lua` · VM : Game Engine (GE) · 38 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/vehicle/bus/busControls")` (fichier sous extensions/ mais pas une extension classique)

Nœud « Bus Controls Detection » (catégorie `repeat_instant`, icône bus). Lit l'état d'un bus : sorties `isKneeling` (bool, bus agenouillé) et `doorsOpen` (bool, portes ouvertes), avec un flux de sortie `flow`. Pins d'entrée : `flow`, `vehId` (défaut 0). À utiliser avec le nœud « Register Bus Data » appelé après le spawn du bus. Lit `mgr.modules.vehicle:isBusKneel/isBusDoorOpen`.

## Remarques

- Sans appel préalable de Register Bus Data, les valeurs restent à false.
- Le repli « véhicule joueur » annoncé dans la description du pin dépend du module vehicle (`isBusKneel(nil)`), non vérifié ici.

## Classe `C`

Classe du nœud flowgraph (renvoyée par `_flowgraph_createNode(C)`). Champs de définition : name, description, category, pinSchema, tags.

| Méthode | Description | Ligne |
|---|---|---|
| `C:executionStarted()` | Remet les deux sorties à false au démarrage (note : nom sans underscore, donc jamais appelé par le gestionnaire qui appelle `_executionStarted`). | 32 |
| `C:init()` | Constructeur ; met `isKneeling` et `doorsOpen` à false. | 21 |
| `C:work()` | Met à jour `isKneeling`, `doorsOpen` depuis le module `vehicle` du manager et active le flux de sortie. | 26 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/vehicle/bus/busControls.lua`.*
