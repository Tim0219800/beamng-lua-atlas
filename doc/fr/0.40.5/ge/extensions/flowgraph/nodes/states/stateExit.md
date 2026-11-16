# `flowgraph_nodes_states_stateExit`

*Fichier : `lua/ge/extensions/flowgraph/nodes/states/stateExit.lua` · VM : Game Engine (GE) · 76 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/states/stateExit")` (fichier sous extensions/ mais pas une extension classique)

Noeud d'état « State Exit » (créé par _flowgraph_createStateNode). Point de sortie du graphe d'états : un pin d'entrée 'flow' de type state (pins manuels de type state autorisés), caché dans les menus. Le champ transitionName désigne la transition (pin de sortie du noeud état parent) à emprunter ; choisie dans l'éditeur parmi celles du noeud cible.

## Remarques

- Le choix « (None) » met transitionName à nil alors que la valeur initiale est '' ; drawMiddle affiche « No Transition! » pour nil.

## Classe `C`

Classe du noeud flowgraph (retournee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_onDeserialized(data)` | Restaure transitionName ('' par défaut). | 69 |
| `C:_onSerialize(res)` | Sauvegarde transitionName. | 65 |
| `C:drawCustomProperties()` | Liste déroulante « Transition Name » construite à partir des noms de transition du noeud état parent qui cible ce graphe. | 30 |
| `C:drawMiddle(builder, style)` | Dessine le contenu central du noeud dans l'éditeur. | 59 |
| `C:init(mgr)` | autoStart = false, savePins = true, transitionName = ''. | 24 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/states/stateExit.lua`.*
