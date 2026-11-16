# `flowgraph_nodes_gameplay_delivery_resetDelivery`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/delivery/resetDelivery.lua` · VM : Game Engine (GE) · 97 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/delivery/resetDelivery")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Reset Delivery » (catégorie once_f_duration, livraison). Réinitialise la livraison active ou terminée : véhicules remis à leur position de départ et objectifs réinitialisés (freeformDelivery.reset). Attend la fin de l'installation (gameplay_freeformDelivery_setup.isSetupComplete) avant de donner le flux. Sorties : flow, success.

**Dépendances (chargées avant) :** `gameplay_freeformDelivery_freeformDelivery`, `gameplay_freeformDelivery_setup`

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStopped()` | Appelle reset. | 31 |
| `C:init()` | Initialise les sorties et l'état de durée à 'inactive'. | 25 |
| `C:onNodeReset()` | Appelle reset. | 35 |
| `C:reset()` | Remet les sorties à faux et l'état à 'inactive'. | 39 |
| `C:work()` | En état 'started', attend la fin du setup puis active success et flow. | 71 |
| `C:workOnce()` | Vérifie qu'une livraison existe, appelle freeformDelivery.reset() et passe en 'started' ; journalise un avertissement ou une erreur sinon. | 45 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/delivery/resetDelivery.lua`.*
