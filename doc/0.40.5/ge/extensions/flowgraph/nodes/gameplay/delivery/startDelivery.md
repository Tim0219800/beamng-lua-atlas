# `flowgraph_nodes_gameplay_delivery_startDelivery`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/delivery/startDelivery.lua` · VM : Game Engine (GE) · 82 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/delivery/startDelivery")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Start Delivery » (catégorie once_instant, livraison). Démarre la livraison : objectifs, indices, marqueurs et liste de tâches deviennent visibles et le chrono démarre. Nécessite une livraison chargée (Load Delivery) et non déjà active. Pins : flow, reset (caché) en entrée ; flow, success en sortie.

**Dépendances (chargées avant) :** `gameplay_freeformDelivery_freeformDelivery`

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` | Remet flow et success à faux. | 35 |
| `C:_executionStopped()` | Remet flow et success à faux. | 30 |
| `C:init()` | Remet flow et success à faux. | 25 |
| `C:work()` | Si flow est actif : vérifie isLoaded() et not isActive(), appelle freeformDelivery.start() et renseigne success/flow ; journalise les erreurs. | 40 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/delivery/startDelivery.lua`.*
