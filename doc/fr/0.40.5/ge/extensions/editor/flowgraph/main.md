# `editor_flowgraph_main`

*Fichier : `lua/ge/extensions/editor/flowgraph/main.lua` · VM : Game Engine (GE) · 1131 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/editor/flowgraph/main")` (fichier sous extensions/ mais pas une extension classique)

Fenêtre principale (fg_main, « Main view ») de l'éditeur Flowgraph : barre de menus (File : nouveau projet, chargement via editor_fileDialog, fichiers récents, restauration, encodage du presse-papiers…), canevas de nœuds du graphe courant avec modes de dessin (default, simple, heatmap, geometry), bordures colorées selon l'état du projet (running, paused, stopped, macro), menus contextuels (nœuds, pins, liens, création de nœud, Quick Connect) et gestion du glisser-déposer de nœuds, macros et variables. Fichier très volumineux (≈1100 lignes) : seules les fonctions utiles sont détaillées.

## Remarques

- Le glisser-déposer crée des nœuds via mgr.graph:createNode : « types/getVariable » ou « types/setVariable » pour les variables, « macro/integrated » pour les macros ; chaque création ajoute une entrée d'historique (fgEditor.addHistory).
- La création de nœuds/macros n'est possible que si mgr.allowEditing est vrai ; sinon le menu affiche « Disabled. ».

## Classe `C`

Classe de la fenêtre principale Flowgraph (windowName = 'fg_main').

| Méthode | Description | Ligne |
|---|---|---|
| `C:_onDeserialized(data)` | Désérialisation de l'état de la fenêtre. | 1126 |
| `C:_onSerialize(data)` | Sérialisation de l'état de la fenêtre. | 1122 |
| `C:attach(mgr)` | Associe le manager, prépare les couleurs de bordure et définit focusGraph sur le graphe principal. | 26 |
| `C:doContextMenus()` | Gère l'ouverture et le dessin des menus contextuels (nœud, pin, lien, fond) en suspendant l'éditeur de nœuds. | 1047 |
| `C:draw()` | Point d'entrée par frame ; appelle drawSelf. | 810 |
| `C:drawGraph(graph, builder, style)` | Dessine un graphe (nœuds et liens) avec un builder et un style donnés. | 206 |
| `C:drawMenu()` | Dessine la barre de menus de la fenêtre (File, etc.). | 73 |
| `C:drawSelf()` | Corps principal du dessin : fenêtre, canevas, interactions, menus contextuels. | 293 |
| `C:init()` | Initialise les identifiants de contexte (nœud/pin/lien), tailles de colonnes, lissage de FPS, et enregistre la fenêtre 600x600. | 38 |
| `C:isMouseHovering()` | Indique si la souris est dans le rectangle de la fenêtre. | 1037 |
| `C:resolveDragDropPayload()` | Traite un glisser-déposer terminé : crée le nœud, la macro ou le nœud de variable à la position de la souris, aligné sur la grille. | 1003 |
| `C:showNewNodeContextMenu(menuPos)` | Affiche le menu de création de nœud (bibliothèque de nœuds) dans un enfant 300x300 (× échelle UI), ou « Disabled. » si l'édition est interdite. | 988 |
| `C:showQuickAccessSubmenu(menuPos, pin)` | Affiche le sous-menu « Quick Connect » listant les pins compatibles (quickAccess, direction opposée) du graphe. | 817 |

## Appels vers le moteur (C++)

- `FS:` `fileExists`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/flowgraph/main.lua`.*
