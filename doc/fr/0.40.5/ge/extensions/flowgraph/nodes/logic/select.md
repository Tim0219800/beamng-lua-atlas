# `flowgraph_nodes_logic_select`

*Fichier : `lua/ge/extensions/flowgraph/nodes/logic/select.lua` · VM : Game Engine (GE) · 135 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/logic/select")` (fichier sous extensions/ mais pas une extension classique)

Noeud flowgraph 'Select' (categorie logic). Choisit une valeur parmi N entrees value_i selon les pins flow select_i actifs, et combine les valeurs selectionnees avec une fonction de fusion (fg_utils.mergeFuns.any : mode 'first' par defaut). Si le pin flow d'entree n'est pas connecte, la valeur n'est pas conservee. Le nombre de choix se regle dans les proprietes.

## Remarques

- updatePins teste lnk.sourcePin alors que select_i/value_i sont des pins d'entree (targetPin) : les liens vers les pins retires ne sont donc pas supprimes.

## Classe `C`

Classe du noeud flowgraph (creee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` | Vide. | 38 |
| `C:_onDeserialized(res)` | Relit mode ('first' par defaut) et count, recree les pins. | 128 |
| `C:_onSerialize(res)` | Sauvegarde mode et count. | 123 |
| `C:drawCustomProperties()` | Panneau : nombre de choix (Count) et liste deroulante des fonctions de fusion (hors 'readOnly') avec infobulle. | 42 |
| `C:drawMiddle(builder, style)` | Affiche le mode de fusion. | 32 |
| `C:init()` | count=1, mode='first'. | 27 |
| `C:updatePins(old, new)` | Cree ou supprime les paires de pins select_i / value_i et les liens associes. | 74 |
| `C:work()` | Initialise la fusion, merge les value_i dont select_i est actif (si flow), finalise. Si au moins un choix : flow=true et value=resultat ; sinon flow suit l'entree et value=nil. | 100 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/logic/select.lua`.*
