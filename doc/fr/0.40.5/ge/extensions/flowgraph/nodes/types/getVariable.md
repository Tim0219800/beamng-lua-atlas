# `flowgraph_nodes_types_getVariable`

*Fichier : `lua/ge/extensions/flowgraph/nodes/types/getVariable.lua` · VM : Game Engine (GE) · 142 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/types/getVariable")` (fichier sous extensions/ mais pas une extension classique)

Noeud « Get Variable » (provider, caché des menus : créé depuis l'éditeur de variables). Expose une variable du graphe ou du projet (case « Use Project as Source ») sur un pin de sortie portant son nom et son type. Gère le renommage et le changement de type en conservant les liens compatibles.

## Remarques

- Bug : globalColor = im.ImVec4(1,0.6,0,8,0.75) a 5 arguments (« 0,8 » au lieu de « 0.8 ») : le dernier est ignoré, alpha = 8.
- work échoue si varName est nil (aucune variable choisie).

## Classe `C`

Classe du noeud flowgraph (retournee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_onDeserialized(nodeData)` | Restaure portée et variable. | 136 |
| `C:_onSerialize(res)` | Sauvegarde l'état du noeud dans la table donnée. | 131 |
| `C:drawCustomProperties()` | Case de portée, liste des variables et éditeur de variable. | 25 |
| `C:drawMiddle(builder, style)` | Dessine le contenu central du noeud dans l'éditeur. | 118 |
| `C:init()` | varName = nil, global = false, target = variables du graphe. | 19 |
| `C:renameVariable(source, name, newName)` | Hook : met à jour nom du noeud et du pin si la variable suivie est renommée. | 85 |
| `C:setGlobal(global)` | Change la portée (projet/graphe), la couleur du noeud et retire le pin courant. | 44 |
| `C:setVar(name)` | Choisit la variable : recrée le pin de sortie avec le bon type et refait les liens compatibles. | 59 |
| `C:typeUpdated(source, name, newType)` | Hook : recrée le pin quand le type de la variable change. | 101 |
| `C:work()` | Écrit target:get(varName) sur le pin. | 97 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/types/getVariable.lua`.*
