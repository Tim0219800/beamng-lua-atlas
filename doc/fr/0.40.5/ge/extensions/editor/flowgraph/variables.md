# `editor_flowgraph_variables`

*Fichier : `lua/ge/extensions/editor/flowgraph/variables.lua` · VM : Game Engine (GE) · 368 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/editor/flowgraph/variables")` (fichier sous extensions/ mais pas une extension classique)

Fenêtre « Variables » (fg_variables) de l'éditeur Flowgraph. Elle montre les variables du graphe courant (mgr.graph.variables) et celles du projet (mgr.variables) sous forme de cartes dépliables, avec la valeur courte, un éditeur de variable, la création d'un nœud getter (types/getVariable) ou setter (types/setVariable) par clic ou glisser-déposer, et le réordonnancement par glisser.

## Remarques

- Les boutons de création de nœuds ne sont actifs que si mgr.allowEditing est vrai.
- Le nouvel ordre des variables est appliqué avec changeCustomVariableOrder puis une entrée d'historique « Changed Variable Order ».
- drawGraph, drawRecursive et drawSortedGraphs ne sont pas appelées depuis draw() dans ce fichier (code disponible pour afficher les variables de tous les graphes).

## Classe `C`

Classe de la fenêtre (windowName 'fg_variables', windowDescription 'Variables').

| Méthode | Description | Ligne |
|---|---|---|
| `C:_onDeserialized(data)` | Hook de désérialisation : vide. | 363 |
| `C:_onSerialize(data)` | Hook de sérialisation : vide. | 359 |
| `C:draw()` | Dessine l'en-tête « Current Graph Variables », le bouton d'ajout (popup addVariablePopup), les variables du graphe puis celles du projet. | 30 |
| `C:drawGraph(graph)` | Dessine les variables d'un graphe, avec « (current) » si c'est le graphe courant. | 326 |
| `C:drawRecursive(graph)` | Dessine un graphe dans un TreeNode puis ses enfants triés par id. | 330 |
| `C:drawSortedGraphs(source)` | Dessine récursivement les graphes racines (sans parentId) d'une table, triés par id. | 346 |
| `C:drawTarget(target, name, id, global)` | Dessine toutes les variables d'un conteneur dans l'ordre customVariableOrder et gère le dépôt pour changer l'ordre. | 288 |
| `C:drawVariableCard(target, varName, global)` | Dessine la carte d'une variable : icône de type, nom, valeur, boutons getter/setter, poignée de glisser et éditeur déplié. | 200 |
| `C:getAutoTypeFromName(name)` | Déduit un type de variable à partir d'un nom via ui_flowgraph_editor.getAutoTypeFromName. | 195 |
| `C:init()` | Initialise les champs de saisie, le payload de glisser-déposer et enregistre la fenêtre. | 21 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/flowgraph/variables.lua`.*
