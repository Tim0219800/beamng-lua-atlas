# `editor_flowgraph_stateView`

*Fichier : `lua/ge/extensions/editor/flowgraph/stateView.lua` · VM : Game Engine (GE) · 80 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/editor/flowgraph/stateView")` (fichier sous extensions/ mais pas une extension classique)

Fenêtre « State View » (fg_stateView) de l'éditeur Flowgraph. Elle liste, graphe par graphe (récursivement à partir de mgr.stateGraph), les états (nœuds 'states/stateNode' dont le graphe cible n'est pas un stategraph) avec une icône lecture/pause selon qu'ils tournent. Pur affichage : rien n'est modifié dans le projet. Créée via _flowgraph_createMgrWindow, donc instanciée par flowgraphEditor pour chaque manager.

## Remarques

- Un état est affiché comme « en cours » seulement si mgr.runningState == 'running' et mgr.states:isRunning(state.id) renvoie vrai.
- Le tri des états et des graphes enfants se fait par id croissant.

## Classe `C`

Classe de la fenêtre (windowName 'fg_stateView', windowDescription 'State View'). Les méthodes sont celles appelées par flowgraphEditor via basewindow.

| Méthode | Description | Ligne |
|---|---|---|
| `C:attach(mgr)` | Mémorise le manager flowgraph courant dans self.mgr. Appelé à chaque changement de manager. | 18 |
| `C:draw()` | Dessine la fenêtre « States View » si elle est visible, à partir de self.mgr.stateGraph. Appelée à chaque frame par drawEditor. | 63 |
| `C:drawStategraphRecursive(graph, depth)` | Dessine sur deux colonnes le nom du graphe (entre crochets, précédé de ' - ' par niveau de profondeur) puis ses états avec l'icône play_circle_filled (en cours) ou pause_circle_outline (à l'arrêt), puis descend dans les graphes enfants. | 22 |
| `C:init()` | Crée le filtre texte ImGui et enregistre la fenêtre dans l'éditeur (taille 150x300, masquée par défaut). | 13 |
| `C:selectNode(node, append)` | Sélectionne un nœud dans l'éditeur de graphes (fge.SelectNode). | 75 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/flowgraph/stateView.lua`.*
