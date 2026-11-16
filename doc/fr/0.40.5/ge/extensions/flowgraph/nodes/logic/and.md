# `flowgraph_nodes_logic_and`

*Fichier : `lua/ge/extensions/flowgraph/nodes/logic/and.lua` · VM : Game Engine (GE) · 90 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/logic/and")` (fichier sous extensions/ mais pas une extension classique)

Noeud flowgraph 'And' (categorie logic). Ne laisse passer le flux que si toutes les entrees flow_1..flow_N ont du flux. Par defaut 2 entrees, le nombre est reglable dans les proprietes du noeud (pins flow_i crees/supprimes dynamiquement). Sortie : pin flow. S'execute a chaque frame ou le graphe est actif.

## Remarques

- legacyPins : anciennes entrees a et b renommees flow_1 et flow_2.
- Le champ C.todo du code prevoit un nombre d'entrees arbitraire, deja fait via la propriete Count.

## Classe `C`

Classe du noeud flowgraph (creee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_onDeserialized(res)` | Relit count (2 par defaut) et recree les pins correspondants. | 84 |
| `C:_onSerialize(res)` | Sauvegarde count dans les donnees serialisees. | 80 |
| `C:drawCustomProperties()` | Panneau de proprietes de l'editeur : champ entier 'Count' qui change le nombre de pins d'entree (minimum 1). Renvoie la raison du changement. | 33 |
| `C:init()` | Initialise le compteur d'entrees a 2. | 30 |
| `C:updatePins(old, new)` | Ajoute ou supprime les pins d'entree flow_i pour passer de old a new ; supprime aussi les liens qui pointaient vers les pins retirees. | 50 |
| `C:work()` | Met la sortie flow a true seulement si toutes les entrees flow_1..flow_count sont vraies, sinon false. | 71 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/logic/and.lua`.*
