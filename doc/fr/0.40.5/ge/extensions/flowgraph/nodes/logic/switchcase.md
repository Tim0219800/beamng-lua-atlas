# `flowgraph_nodes_logic_switchcase`

*Fichier : `lua/ge/extensions/flowgraph/nodes/logic/switchcase.lua` · VM : Game Engine (GE) · 106 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/logic/switchcase")` (fichier sous extensions/ mais pas une extension classique)

Noeud flowgraph 'Switch Case' (categorie logic). Compare la valeur d'entree 'value' avec N valeurs value_i (egalite stricte) et met a true la sortie match_i correspondante ; 'none' vaut true si aucune ne correspond. Le flux de sortie est toujours true.

## Remarques

- La sortie flow est toujours true, meme si le flux d'entree est inactif : le pin d'entree 'flow' n'est pas lu.

## Classe `C`

Classe du noeud flowgraph (creee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` | Vide. | 36 |
| `C:_onDeserialized(res)` | Relit count (1 par defaut) et recree les pins. | 100 |
| `C:_onSerialize(res)` | Sauvegarde count. | 96 |
| `C:drawCustomProperties()` | Panneau : nombre de cas (Count). | 40 |
| `C:drawMiddle(builder, style)` | Dessine le milieu du noeud (vide). | 31 |
| `C:init()` | count=1. | 26 |
| `C:updatePins(old, new)` | Cree ou supprime les pins value_i et match_i et les liens associes. | 57 |
| `C:work()` | flow=true ; pour chaque i, match_i = (value_i == value) ; none = aucun correspondant. | 82 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/logic/switchcase.lua`.*
