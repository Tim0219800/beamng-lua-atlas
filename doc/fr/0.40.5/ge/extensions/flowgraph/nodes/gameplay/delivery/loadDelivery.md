# `flowgraph_nodes_gameplay_delivery_loadDelivery`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/delivery/loadDelivery.lua` · VM : Game Engine (GE) · 108 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/delivery/loadDelivery")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Load Delivery » (catégorie once_f_duration, livraison). Charge un fichier de livraison, prépare véhicules et routes et met le joueur dans le bon véhicule ; l'installation prend quelques frames. Utiliser ensuite Start Delivery. Pins d'entrée : flow, reset (caché), deliveryPath (défaut 'delivery.delivery.json'). Sorties : flow, success, isLoaded.

## Remarques

- Si missionTypeData.deliveryPath existe dans l'activité, il remplace deliveryPath quand celui-ci est vide ou égal à la valeur par défaut.
- Le chemin est résolu avec mgr:getRelativeAbsolutePath.

**Dépendances (chargées avant) :** `gameplay_freeformDelivery_freeformDelivery`

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStopped()` | Appelle reset. | 34 |
| `C:init()` | Initialise les sorties et l'état de durée à 'inactive'. | 27 |
| `C:onNodeReset()` | Appelle reset. | 38 |
| `C:reset()` | Remet les sorties à faux et l'état à 'inactive'. | 42 |
| `C:work()` | En état 'started', attend isLoaded() puis active success, isLoaded et flow ('finished') ; ensuite maintient flow. | 87 |
| `C:workOnce()` | Résout le chemin, appelle freeformDelivery.load et passe en état 'started' ; journalise les erreurs. | 49 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/delivery/loadDelivery.lua`.*
