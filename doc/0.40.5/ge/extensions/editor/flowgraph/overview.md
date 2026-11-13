# `editor_flowgraph_overview`

*Fichier : `lua/ge/extensions/editor/flowgraph/overview.lua` · VM : Game Engine (GE) · 304 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/editor/flowgraph/overview")` (fichier sous extensions/ mais pas une extension classique)

Fenêtre « Overview » (fg_treeview) de l'éditeur Flowgraph : arborescence des graphes du projet (et des macros) avec un filtre texte. Le filtre porte sur le nom des graphes, et sur celui des nœuds si la préférence flowgraph.debug.displayNodesInOverview est active. Un menu contextuel sur un nœud permet Focus et Delete.

## Remarques

- Seuls les graphes dont le nom (ou un parent) passe le filtre sont dessinés ; sinon seul le graphe courant (mgr.graph) reste affiché (skipDrawing).
- En mode debug (flowgraph.debug.editorDebug), un bouton « Print Graphs » imprime la structure de tous les graphes et macros dans la console.
- Le dessin des macros racine est commenté dans le code : seuls mgr.graphs sont affichés dans l'arbre.

## Classe `C`

Classe de la fenêtre (windowName 'fg_treeview', windowDescription 'Overview').

| Méthode | Description | Ligne |
|---|---|---|
| `C:TreeView()` | Dessine le contenu de la fenêtre : filtre, bouton debug, liste triée des graphes racines. | 210 |
| `C:attach(mgr)` | Mémorise le manager courant. | 21 |
| `C:draw()` | Dessine la fenêtre si elle est visible (appelle TreeView). | 289 |
| `C:drawGraph(graph)` | Dessine un graphe de l'arbre (et récursivement ses enfants). | 79 |
| `C:drawPopups()` | Dessine le popup « nodeOverviewPopup » : Focus (sélectionne le nœud et navigue vers lui) et Delete (graph:deleteNode). | 25 |
| `C:fillPassedGraphsArray()` | Remplit self.passedGraphIds avec les ids des graphes et macros dont le nom (ou un nœud, selon la préférence) passe le filtre. | 175 |
| `C:init()` | Crée le filtre texte et enregistre la fenêtre (150x300, masquée par défaut). | 15 |
| `C:selectNode(node, append)` | Sélectionne un nœud dans l'éditeur (fge.SelectNode). | 299 |
| `C:skipDrawing(graph)` | Indique si un graphe doit être masqué : faux s'il (ou un de ses parents) passe le filtre, sinon vrai sauf pour le graphe courant. | 47 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/flowgraph/overview.lua`.*
