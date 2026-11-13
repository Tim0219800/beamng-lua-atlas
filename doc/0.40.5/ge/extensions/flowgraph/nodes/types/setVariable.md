# `flowgraph_nodes_types_setVariable`

*Fichier : `lua/ge/extensions/flowgraph/nodes/types/setVariable.lua` · VM : Game Engine (GE) · 151 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/types/setVariable")` (fichier sous extensions/ mais pas une extension classique)

Noeud « Set Variable » (repeat_instant, caché des menus). Écrit une variable du graphe ou du projet à partir d'un pin d'entrée portant son nom et son type. Gère renommage et changement de type en conservant les liens compatibles ; recopie flow en sortie.

## Remarques

- globalColor = im.ImVec4(1,0.6,0,8,0.75) : 5 arguments (« 0,8 » au lieu de « 0.8 »).
- Le champ global est nil tant que setGlobal n'est pas appelé.

## Classe `C`

Classe du noeud flowgraph (retournee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_onDeserialized(nodeData)` | Restaure portée et variable. | 145 |
| `C:_onSerialize(res)` | Sauvegarde l'état du noeud dans la table donnée. | 140 |
| `C:drawCustomProperties()` | Case de portée, liste des variables et éditeur de variable. | 43 |
| `C:drawMiddle(builder, style)` | Dessine le contenu central du noeud dans l'éditeur. | 127 |
| `C:init()` | varName = nil, target = variables du graphe, useSuffix = false. | 22 |
| `C:renameVariable(source, name, newName)` | Hook : met à jour noeud et pin si la variable est renommée. | 88 |
| `C:setGlobal(global)` | Change la portée (projet/graphe), la couleur et retire le pin courant. | 28 |
| `C:setVar(name)` | Choisit la variable : recrée le pin d'entrée et refait les liens. | 62 |
| `C:typeUpdated(source, name, newType)` | Hook : recrée le pin quand le type de la variable change. | 109 |
| `C:work()` | Appelle target:change(varName, valeur du pin) et recopie flow. | 104 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/types/setVariable.lua`.*
