# `flowgraph_nodes_vehicle_onVehicleSpawned`

*Fichier : `lua/ge/extensions/flowgraph/nodes/vehicle/onVehicleSpawned.lua` · VM : Game Engine (GE) · 57 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/vehicle/onVehicleSpawned")` (fichier sous extensions/ mais pas une extension classique)

Nœud événement « On Vehicle Spawned » (catégorie `logic`). Émet une impulsion sur `flow` et l'id `vehId` quand un véhicule est créé (hook `onVehicleSpawned`).

## Classe `C`

Classe du nœud flowgraph (renvoyée par `_flowgraph_createNode(C)`). Champs de définition : name, description, category, pinSchema, tags.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_afterTrigger()` | Appelé par le gestionnaire après le déclenchement du nœud ; remet le drapeau d'événement à false. | 52 |
| `C:_executionStarted()` | Appelé par le gestionnaire quand l'exécution du projet flowgraph démarre ; remet l'état interne à zéro. | 32 |
| `C:init(mgr, ...)` | Constructeur vide. | 28 |
| `C:onVehicleSpawned(id)` | Hook appelé à la création d'un véhicule ; mémorise `id` et lève le drapeau. | 37 |
| `C:work(args)` | Si le drapeau est levé, remplit `vehId` et met `flow` à true une frame, sinon false. | 42 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/vehicle/onVehicleSpawned.lua`.*
