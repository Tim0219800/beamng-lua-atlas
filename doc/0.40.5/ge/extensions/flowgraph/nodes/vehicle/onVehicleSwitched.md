# `flowgraph_nodes_vehicle_onVehicleSwitched`

*Fichier : `lua/ge/extensions/flowgraph/nodes/vehicle/onVehicleSwitched.lua` · VM : Game Engine (GE) · 64 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/vehicle/onVehicleSwitched")` (fichier sous extensions/ mais pas une extension classique)

Nœud événement « On Vehicle Switched » (catégorie `logic`, tag event). Émet une impulsion sur `flow` quand le joueur change de véhicule (hook `onVehicleSwitched`). Sorties : `oldID`, `newID` (number) et `player` (caché).

## Classe `C`

Classe du nœud flowgraph (renvoyée par `_flowgraph_createNode(C)`). Champs de définition : name, description, category, pinSchema, tags.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_afterTrigger()` | Appelé par le gestionnaire après le déclenchement du nœud ; remet le drapeau d'événement à false. | 49 |
| `C:_executionStarted()` | Appelé par le gestionnaire quand l'exécution du projet flowgraph démarre ; remet l'état interne à zéro. | 31 |
| `C:init(mgr, ...)` | Constructeur vide. | 27 |
| `C:onVehicleSwitched(oid, nid, player)` | Hook appelé quand le joueur change de véhicule ; `oid` ancien id, `nid` nouvel id, `player` id du joueur. | 53 |
| `C:work(args)` | Si un changement a été signalé, remplit `oldID`, `newID`, `player` et met `flow` à true une frame. | 37 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/vehicle/onVehicleSwitched.lua`.*
