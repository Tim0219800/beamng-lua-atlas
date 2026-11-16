# `flowgraph_nodes_ui_message`

*Fichier : `lua/ge/extensions/flowgraph/nodes/ui/message.lua` · VM : Game Engine (GE) · 72 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/ui/message")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Message » (catégorie once_instant par défaut, durée) : affiche un message dans la petite app de messages via le hook 'Message'. Entrées : flow, « message » (any ; nil efface), « duration » (5 s), « category » (flowgraph ; un seul message par catégorie), « icon » (info, caché). Sortie : flow.

## Remarques

- Le message est renvoyé toutes les 0.05 s tant que le flux est actif, pour rester affiché.
- Sans catégorie, l'identifiant '__<id du nœud>' est utilisé.

## Classe `C`

Classe du nœud flowgraph (retournée par _flowgraph_createNode(C)).

| Méthode | Description | Ligne |
|---|---|---|
| `C:_afterTrigger()` | Remet le minuteur à 0 si le flux d'entrée est coupé. | 41 |
| `C:_executionStarted()` | Remet le minuteur à 0 et prépare la catégorie par défaut. | 28 |
| `C:_executionStopped()` | Efface le message affiché. | 33 |
| `C:drawCustomProperties()` | Bouton « Open Icons overview ». | 47 |
| `C:work()` | Renvoie périodiquement le message à l'UI et propage le flux. | 55 |

**Évènements UI (guihooks.trigger) :** `Message`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/ui/message.lua`.*
