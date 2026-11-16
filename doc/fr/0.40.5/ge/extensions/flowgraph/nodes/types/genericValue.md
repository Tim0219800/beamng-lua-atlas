# `flowgraph_nodes_types_genericValue`

*Fichier : `lua/ge/extensions/flowgraph/nodes/types/genericValue.lua` · VM : Game Engine (GE) · 101 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/types/genericValue")` (fichier sous extensions/ mais pas une extension classique)

Noeud « Generic Set/Get Variable » (repeat_instant). Lit ou écrit une variable du flowgraph par nom (varName, + suffix numérique optionnel concaténé). Source : variables du projet (mgr.variables) ou du graphe courant. En mode getter : pin de sortie val (any) ; en mode setter : pin d'entrée val. Le flow est recopié en sortie.

## Remarques

- En mode getter, la sortie n'est écrite que si la valeur lue est « vraie » : une variable valant false ou nil ne met pas à jour la sortie.
- Le champ C.value = nil n'est pas utilisé.

## Classe `C`

Classe du noeud flowgraph (retournee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_onDeserialized(nodeData)` | Restaure getter/global et recrée les pins. | 57 |
| `C:_onSerialize(res)` | Sauvegarde l'état du noeud dans la table donnée. | 52 |
| `C:drawCustomProperties()` | Cases « Use Project as Source » et « Is Getter ». | 82 |
| `C:init()` | getter = true, global = true et pins getter. | 24 |
| `C:setupGetPins()` | Passe en mode « Generic Getter » : pin de sortie val. | 67 |
| `C:setupSetPins()` | Passe en mode « Generic Setter » : pin d'entrée val. | 74 |
| `C:work()` | Choisit la table de variables, construit le nom, puis lit (target:get) ou écrit (target:change) la variable. | 30 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/types/genericValue.lua`.*
