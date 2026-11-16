# `flowgraph_nodes_states_transition`

*Fichier : `lua/ge/extensions/flowgraph/nodes/states/transition.lua` · VM : Game Engine (GE) · 162 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/states/transition")` (fichier sous extensions/ mais pas une extension classique)

Noeud « Transition » du stategraph. Termine l'état courant et passe à un nouvel état : au flow, collecte la valeur de tous ses pins d'entrée personnalisés (hors 'flow') et appelle self.mgr.states:transition(stateId, transitionName, data, self). transitionName vaut 'success' par défaut et se choisit parmi les transitions du noeud état. Les données sont lisibles dans l'état suivant avec le noeud « Get Transition Variables ».

## Classe `C`

Classe du noeud flowgraph (retournee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_onDeserialized(data)` | Restaure transitionName ('success' par défaut). | 122 |
| `C:_onSerialize(res)` | Sauvegarde transitionName. | 118 |
| `C:customContextMenu()` | Ajoute au menu contextuel « Go to target... » listant les graphes cibles de cette transition. | 126 |
| `C:drawCustomProperties()` | Liste déroulante « Transition Name » basée sur le noeud état parent. | 72 |
| `C:drawMiddle(builder, style)` | Dessine le contenu central du noeud dans l'éditeur. | 112 |
| `C:hideProperties()` | Libère le cache de modèles de pins. | 91 |
| `C:init()` | savePins = true, allowCustomInPins = true, transitionName = 'success'. | 36 |
| `C:makePinTemplates()` | Construit les modèles de pins (nom/type) à partir des autres noeuds transition et transitionStack du projet. | 42 |
| `C:work()` | Si flow, déclenche la transition avec les données des pins (nil s'il n'y en a pas). | 97 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/states/transition.lua`.*
