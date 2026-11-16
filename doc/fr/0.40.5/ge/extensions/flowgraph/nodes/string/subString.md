# `flowgraph_nodes_string_subString`

*Fichier : `lua/ge/extensions/flowgraph/nodes/string/subString.lua` · VM : Game Engine (GE) · 38 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/string/subString")` (fichier sous extensions/ mais pas une extension classique)

Noeud « SubString » (simple). Extrait une sous-chaîne avec string.sub(value, data.from, data.to). Valeurs par défaut from = 0 et to = -1. Pins : value (in), value (out).

## Remarques

- Les indices Lua commencent à 1 ; from = 0 est traité comme 1 par string.sub.

## Classe `C`

Classe du noeud flowgraph (retournee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.

| Méthode | Description | Ligne |
|---|---|---|
| `C:drawMiddle(builder, style)` | Dessine le contenu central du noeud dans l'éditeur. | 27 |
| `C:init()` | data.from = 0, data.to = -1. | 22 |
| `C:work()` | Écrit string.sub(value, from, to). | 32 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/string/subString.lua`.*
