# `flowgraph_nodes_gameplay_delivery_abandonDelivery`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/delivery/abandonDelivery.lua` · VM : Game Engine (GE) · 67 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/delivery/abandonDelivery")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Abandon Delivery » (catégorie once_instant, tags delivery/mission). Abandonne la livraison en cours et démonte le système (véhicules, éléments d'interface, état) via gameplay_freeformDelivery_freeformDelivery.teardown. Pins d'entrée : flow, reset (caché), keepVehicles (bool : garde les véhicules en les sortant des prefabs). Sorties : flow, success.

**Dépendances (chargées avant) :** `gameplay_freeformDelivery_freeformDelivery`

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStopped()` | Appelle reset. | 31 |
| `C:init()` | Met flow et success à faux. | 26 |
| `C:onNodeReset()` | Appelle reset. | 35 |
| `C:reset()` | Remet flow et success à faux. | 39 |
| `C:work()` | Si flow est actif : appelle teardown(keepVehicles) et signale le succès ; journalise une erreur si le système de livraison est absent. | 46 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/delivery/abandonDelivery.lua`.*
