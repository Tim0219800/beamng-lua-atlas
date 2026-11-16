# `flowgraph_nodes_gameplay_delivery_deliveryFinished`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/delivery/deliveryFinished.lua` · VM : Game Engine (GE) · 88 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/delivery/deliveryFinished")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Delivery Finished » (catégorie repeat_instant, livraison). Détecte la fin de la livraison (tous les objectifs atteints ou fin manuelle via le menu rapide). Pins d'entrée : flow. Sorties : finished (impulsion unique), isActive, failed, failReason (chaîne vide si réussite). Utilise isActive, isFinished, isFailed et getFailReason du module freeformDelivery.

**Dépendances (chargées avant) :** `gameplay_freeformDelivery_freeformDelivery`

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` | Réinitialise les états et sorties. | 44 |
| `C:_executionStopped()` | Réinitialise les états et sorties. | 35 |
| `C:init()` | Initialise les états et sorties. | 26 |
| `C:work()` | Si flow est actif, compare l'état fini à l'état précédent pour émettre finished une seule fois et renseigne failed/failReason. | 53 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/delivery/deliveryFinished.lua`.*
