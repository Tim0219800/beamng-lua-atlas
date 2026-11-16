# `flowgraph_nodes_macro_integrated`

*Fichier : `lua/ge/extensions/flowgraph/nodes/macro/integrated.lua` · VM : Game Engine (GE) · 222 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/macro/integrated")` (fichier sous extensions/ mais pas une extension classique)

Noeud macro 'Integrated' (cache, canHaveGraph) : represente un sous-graphe (graphe cible / macro) dans le graphe parent. Ses pins sont recopies depuis les noeuds I/O du sous-graphe : les entrees sont ecrites dans le noeud I/O 'in', les sorties lues depuis le noeud I/O 'out'. Double-clic dans l'editeur pour ouvrir le sous-graphe.

## Remarques

- Dans _onDeserialized (cas non instance), l'offset getGraphNodeOffset est ajoute a targetID puis encore une fois dans l'index de mgr.graphs ; _postDeserialize l'ajoute de nouveau : incoherence possible.
- _onSerialize utilise le meme code dans les deux branches du if (instance ou non).

## Classe `C`

Classe du noeud flowgraph (creee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_afterTrigger()` | Appelle updatePins apres chaque execution. | 190 |
| `C:_executionStarted()` | Pousse les valeurs des pins d'entree codes en dur vers le noeud I/O 'in'. | 195 |
| `C:_executionStopped()` | Remet a nil ces valeurs dans le noeud I/O 'in'. | 207 |
| `C:_onDeserialized(nodeData)` | Relit nom, couleur, type de graphe et cible (instance de macro creee depuis macroPath si besoin). | 110 |
| `C:_onSerialize(res)` | Sauvegarde name, graphType, targetID et couleur. | 82 |
| `C:_postDeserialize()` | Relie le graphe cible via mgr.graphs[targetID + offset]. | 57 |
| `C:doubleClicked()` | Selectionne le graphe cible dans l'editeur (sauf depuis un graphe macro). | 160 |
| `C:drawCustomProperties()` | Bouton de debogage 'Manually Refresh Pins'. | 23 |
| `C:drawMiddle(builder, style)` | Icone de recherche avec apercu au survol et variables surveillees. | 130 |
| `C:gatherPins()` | Recree les pins d'entree/sortie depuis les pin lists des noeuds I/O. | 61 |
| `C:init()` | savePins=true et couleur grise. | 19 |
| `C:representsGraph()` | Renvoie le graphe represente. | 13 |
| `C:setTargetGraph(graph)` | Lie le noeud a un graphe : retrouve ses noeuds macro/io 'in' et 'out', memorise targetGraph/targetID et fixe le nom. | 36 |
| `C:updatePins()` | Copie les valeurs des pins d'entree vers le noeud I/O 'in' et celles du noeud I/O 'out' vers les pins de sortie. | 171 |
| `C:work()` | Vide. | 218 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/macro/integrated.lua`.*
