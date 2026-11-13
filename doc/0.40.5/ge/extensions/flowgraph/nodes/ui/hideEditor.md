# `flowgraph_nodes_ui_hideEditor`

*Fichier : `lua/ge/extensions/flowgraph/nodes/ui/hideEditor.lua` · VM : Game Engine (GE) · 38 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/ui/hideEditor")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Show Editor » (catégorie once_instant, auteur BeamNG) : affiche ou masque le World Editor. Entrée « value » (bool, vrai = visible). L'action est appliquée après le déclenchement (_afterTrigger) via editor.setEditorActive si l'état change.

## Remarques

- Le nom du fichier (hideEditor) diffère du nom du nœud (Show Editor).

## Classe `C`

Classe du nœud flowgraph (retournée par _flowgraph_createNode(C)).

| Méthode | Description | Ligne |
|---|---|---|
| `C:_afterTrigger()` | Applique editor.setEditorActive si différent de editor.active. | 27 |
| `C:workOnce()` | Mémorise la valeur demandée. | 23 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/ui/hideEditor.lua`.*
