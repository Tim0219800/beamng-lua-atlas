# `flowgraph_nodes_types_string`

*Fichier : `lua/ge/extensions/flowgraph/nodes/types/string.lua` · VM : Game Engine (GE) · 87 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/types/string")` (fichier sous extensions/ mais pas une extension classique)

Noeud « String » (provider). Fournit une chaîne (« Hello World » par défaut) sur le pin value. Édition simple ou multi-lignes dans l'éditeur ; les retours à la ligne sont échappés (\n) à la sauvegarde.

## Remarques

- Le tampon imgui est limité à 2048 caractères.

## Classe `C`

Classe du noeud flowgraph (retournee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_onDeserialized(nodeData)` | Restaure la chaîne (supporte l'ancien format data.value) et multiLine. | 80 |
| `C:_onSerialize(res)` | Sauvegarde l'état du noeud dans la table donnée. | 75 |
| `C:drawCustomProperties()` | Case « Multi Line » et champ de saisie (tampon de 2048 caractères). | 29 |
| `C:drawMiddle(builder, style)` | Dessine le contenu central du noeud dans l'éditeur. | 58 |
| `C:drawProperties()` | Vide. | 72 |
| `C:init()` | string = 'Hello World', multiLine = false. | 20 |
| `C:work()` | Écrit la chaîne sur la sortie. | 25 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/types/string.lua`.*
