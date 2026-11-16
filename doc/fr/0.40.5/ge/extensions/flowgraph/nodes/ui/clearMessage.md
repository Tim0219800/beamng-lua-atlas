# `flowgraph_nodes_ui_clearMessage`

*Fichier : `lua/ge/extensions/flowgraph/nodes/ui/clearMessage.lua` · VM : Game Engine (GE) · 24 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/ui/clearMessage")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Clear Messages » (catégorie once_instant, auteur BeamNG) : efface tous les messages affichés dans l'UI. Aucun pin. Déclenche le hook UI 'ClearAllMessages' (guihooks.trigger).

## Classe `C`

Classe du nœud flowgraph (retournée par _flowgraph_createNode(C)).

| Méthode | Description | Ligne |
|---|---|---|
| `C:workOnce()` | Appelle guihooks.trigger('ClearAllMessages'). | 19 |

**Évènements UI (guihooks.trigger) :** `ClearAllMessages`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/ui/clearMessage.lua`.*
