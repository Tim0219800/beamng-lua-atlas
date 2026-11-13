# `flowgraph_nodes_string_match`

*Fichier : `lua/ge/extensions/flowgraph/nodes/string/match.lua` · VM : Game Engine (GE) · 37 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/string/match")` (fichier sous extensions/ mais pas une extension classique)

Noeud « Match String » (simple). Doit renvoyer la première capture d'un pattern Lua appliqué à la chaîne d'entrée ; pins : value (in, string), value (out, string). Pattern dans data.pattern (« %d » par défaut).

## Remarques

- Bug : work utilise self.data.pattern.value alors que data.pattern est une chaîne : l'indexation d'une chaîne par 'value' donne nil, string.match reçoit un pattern nil et lève une erreur.
- Le fichier note en todo que les patterns utilisables restent à documenter.

## Classe `C`

Classe du noeud flowgraph (retournee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.

| Méthode | Description | Ligne |
|---|---|---|
| `C:drawMiddle(builder, style)` | Dessine le contenu central du noeud dans l'éditeur. | 31 |
| `C:init()` | data.pattern = '%d'. | 23 |
| `C:work()` | Appelle string.match(value, data.pattern.value) et écrit le résultat. | 27 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/string/match.lua`.*
