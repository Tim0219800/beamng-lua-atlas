# `flowgraph_groupHelper`

*Fichier : `lua/ge/extensions/flowgraph/groupHelper.lua` · VM : Game Engine (GE) · 500 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/groupHelper")` (fichier sous extensions/ mais pas une extension classique)

Aide de l'éditeur flowgraph pour grouper et dégrouper des nœuds sélectionnés. Pour un graphe de flux, le groupe devient un sous-graphe (ou sous-macro) représenté par un nœud macro/integrated ; pour un graphe d'états, il devient un état de groupe. Le fichier contient aussi des fonctions de centrage des nœuds à partir de leur position dans l'éditeur. Le module renvoie un constructeur : require('/lua/ge/extensions/flowgraph/groupHelper')(mgr).

## Remarques

- Usage éditeur uniquement : s'appuie sur mgr.selectedNodes et ui_flowgraph_editor (GetNodeSize, GetNodePosition).
- Un nœud de taille 0x0 est traité comme 200 x 100.
- Bug : ungroupSelection appelle self:ungroupFlowNode(), qui n'est définie nulle part dans le fichier ; dégrouper un nœud de flux provoque donc une erreur Lua.
- groupFlowNodes renvoie le nœud integrated créé.

## Classe `C`

Objet renvoyé par le constructeur ; garde le manager dans self.mgr.

Le module renvoie un constructeur : `local obj = require("flowgraph_groupHelper")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:centerMultiNodes(fixNodes, moveNodes)` | Centre moveNodes sur le centre du rectangle englobant fixNodes. | 59 |
| `C:centerNodes(nodes, pos)` | Replace un ensemble de nœuds autour d'une position en conservant leurs positions relatives (alignement sur la grille). | 39 |
| `C:createGroupingFromSelection()` | Groupe la sélection : groupStateNodes dans un graphe d'états, sinon groupFlowNodes. | 93 |
| `C:getRectCenter(nodes)` | Calcule le rectangle englobant des nœuds et son centre. | 13 |
| `C:groupFlowNodes()` | Clone la sélection dans un nouveau sous-graphe ou sous-macro, copie les variables du graphe, recrée les liens internes et remplace la sélection par un nœud macro/integrated relié aux liens entrants et sortants. | 172 |
| `C:groupStateNodes()` | Déplace les nœuds d'état sélectionnés (sauf entrée et sortie) dans un nouveau graphe d'état 'new group' et reconnecte les liens entrants et sortants via le nœud de groupe. | 101 |
| `C:init(mgr)` | Mémorise le manager. | 9 |
| `C:ungroupSelection()` | Dégroupe la sélection : ungroupStateNode dans un graphe d'états, sinon ungroupFlowNode (inexistante, voir notes). | 415 |
| `C:ungroupStateNode()` | Remonte les nœuds internes (hors entrée/sortie) d'un état de groupe sélectionné dans le graphe courant et rétablit les liens. | 423 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/groupHelper.lua`.*
