# `editor_flowgraph_nodePreview`

*Fichier : `lua/ge/extensions/editor/flowgraph/nodePreview.lua` · VM : Game Engine (GE) · 147 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/editor/flowgraph/nodePreview")` (fichier sous extensions/ mais pas une extension classique)

Aperçu en infobulle de l'éditeur Flowgraph : affiche, dans un petit éditeur de nœuds dédié (200x200), un nœud de la bibliothèque, une macro ou un graphe survolé. Il crée son propre contexte d'éditeur, instancie le nœud dans un graphe factice (« nodePreview ») ou redessine les nœuds et liens du graphe, cadre le contenu, puis affiche le nom (et le chemin) sous l'aperçu.

## Remarques

- Le mode (node, macro, graph) est choisi par setNode / setMacro / setGraph ; draw ne dessine que pour les modes node et graph (le mode macro n'est pas dessiné).
- En mode graph, la position de chaque nœud est lue dans l'éditeur principal (self.fgEditor.ectx) puis recopiée dans l'aperçu.
- Une erreur dans le dessin d'un nœud est interceptée (xpcall) et marquée comme erreur du nœud.

## Classe `C`

Classe de l'aperçu (windowKind = 'nodePreview').

| Méthode | Description | Ligne |
|---|---|---|
| `C:attach(mgr)` | Associe le manager et crée le graphe factice 'nodePreview'. | 13 |
| `C:draw()` | Dessine l'infobulle d'aperçu si un élément est survolé, en sauvegardant/restaurant l'éditeur courant. | 47 |
| `C:init()` | Initialise l'état (survol, mode « node », taille d'aperçu 200x200). | 20 |
| `C:setGraph(graph)` | Définit l'élément survolé comme graphe (mode graph). | 41 |
| `C:setMacro(macro)` | Définit l'élément survolé comme macro (mode macro). | 36 |
| `C:setNode(node)` | Définit l'élément survolé comme nœud de bibliothèque (mode node). | 30 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/flowgraph/nodePreview.lua`.*
