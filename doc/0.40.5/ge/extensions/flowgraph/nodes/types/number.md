# `flowgraph_nodes_types_number`

*Fichier : `lua/ge/extensions/flowgraph/nodes/types/number.lua` · VM : Game Engine (GE) · 40 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/types/number")` (fichier sous extensions/ mais pas une extension classique)

Noeud « Number » (provider). Fournit un nombre (data.value, 0 par défaut) sur le pin value.

## Classe `C`

Classe du noeud flowgraph (retournee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.

| Méthode | Description | Ligne |
|---|---|---|
| `C:drawMiddle(builder, style)` | Dessine le contenu central du noeud dans l'éditeur. | 28 |
| `C:init()` | data.value = 0 et clearOutPinsOnStart = false. | 19 |
| `C:onDeserialized(nodeData)` | Vide (nom sans underscore, contrairement à _onSerialize utilisé par les autres noeuds). | 36 |
| `C:onSerialize(res)` | Vide (nom sans underscore, contrairement à _onSerialize utilisé par les autres noeuds). | 33 |
| `C:work()` | Écrit data.value sur la sortie. | 24 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/types/number.lua`.*
