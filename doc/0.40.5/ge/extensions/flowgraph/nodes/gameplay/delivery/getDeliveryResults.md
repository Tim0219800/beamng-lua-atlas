# `flowgraph_nodes_gameplay_delivery_getDeliveryResults`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/delivery/getDeliveryResults.lua` · VM : Game Engine (GE) · 59 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/delivery/getDeliveryResults")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Get Delivery Results » (catégorie provider, livraison). Fournit les résultats courants de la livraison sous forme de table (time, timeStr, goalsTotal, goalsCompleted, goalsRequired, goalsRequiredCompleted, allRequiredComplete, vehicleDamages). Sorties : results (nil si aucune livraison active) et isActive.

**Dépendances (chargées avant) :** `gameplay_freeformDelivery_freeformDelivery`

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` | Remet results et isActive à nil/faux. | 34 |
| `C:_executionStopped()` | Remet results et isActive à nil/faux. | 29 |
| `C:init()` | Remet results et isActive à nil/faux. | 24 |
| `C:work()` | Appelle isActive() puis getResults() du module freeformDelivery si la livraison est active. | 39 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/delivery/getDeliveryResults.lua`.*
