# `flowgraph_nodes_ui_showApps`

*Fichier : `lua/ge/extensions/flowgraph/nodes/ui/showApps.lua` · VM : Game Engine (GE) · 40 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/ui/showApps")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Show Apps » (catégorie once_instant, auteur BeamNG) : affiche ou masque les apps de l'UI (hook 'ShowApps'). Entrée « value » (bool).

## Classe `C`

Classe du nœud flowgraph (retournée par _flowgraph_createNode(C)).

| Méthode | Description | Ligne |
|---|---|---|
| `C:_afterTrigger()` | Envoie 'ShowApps' avec la valeur mémorisée. | 31 |
| `C:_executionStarted()` | Efface la demande en attente. | 23 |
| `C:workOnce()` | Mémorise la valeur. | 27 |

**Évènements UI (guihooks.trigger) :** `ShowApps`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/ui/showApps.lua`.*
