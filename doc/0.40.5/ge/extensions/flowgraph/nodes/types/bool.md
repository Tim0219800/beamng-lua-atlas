# `flowgraph_nodes_types_bool`

*Fichier : `lua/ge/extensions/flowgraph/nodes/types/bool.lua` · VM : Game Engine (GE) · 33 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/types/bool")` (fichier sous extensions/ mais pas une extension classique)

Noeud « Bool » (provider). Fournit une valeur booléenne (data.value, true par défaut) sur le pin value.

## Classe `C`

Classe du noeud flowgraph (retournee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.

| Méthode | Description | Ligne |
|---|---|---|
| `C:drawMiddle(builder, style)` | Dessine le contenu central du noeud dans l'éditeur. | 27 |
| `C:init()` | data.value = true. | 19 |
| `C:work()` | Écrit data.value sur la sortie. | 23 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/types/bool.lua`.*
