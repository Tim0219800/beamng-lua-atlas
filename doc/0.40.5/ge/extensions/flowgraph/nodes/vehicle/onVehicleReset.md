# `flowgraph_nodes_vehicle_onVehicleReset`

*Fichier : `lua/ge/extensions/flowgraph/nodes/vehicle/onVehicleReset.lua` · VM : Game Engine (GE) · 69 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/vehicle/onVehicleReset")` (fichier sous extensions/ mais pas une extension classique)

Nœud événement « On Vehicle Reset » (catégorie `logic`). Émet une impulsion sur `flow` quand un véhicule est remis à zéro (hook `onVehicleResetted`). Si le pin d'entrée `vehId` est fourni, ne réagit que pour ce véhicule. Sortie `vehId` (caché) : le véhicule reseté.

## Remarques

- Le nom du hook est `onVehicleResetted` (avec « ted »).

## Classe `C`

Classe du nœud flowgraph (renvoyée par `_flowgraph_createNode(C)`). Champs de définition : name, description, category, pinSchema, tags.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_afterTrigger()` | Appelé par le gestionnaire après le déclenchement du nœud ; remet le drapeau d'événement à false. | 64 |
| `C:_executionStarted()` | Appelé par le gestionnaire quand l'exécution du projet flowgraph démarre ; remet l'état interne à zéro. | 36 |
| `C:init(mgr, ...)` | Constructeur vide. | 32 |
| `C:onVehicleResetted(id)` | Hook appelé quand un véhicule est reset ; filtre éventuellement par `vehId` puis lève le drapeau. | 41 |
| `C:work(args)` | Si le drapeau est levé, remplit `vehId` et met `flow` à true une frame, sinon false. | 53 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/vehicle/onVehicleReset.lua`.*
