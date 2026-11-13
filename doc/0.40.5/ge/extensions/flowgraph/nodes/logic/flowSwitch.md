# `flowgraph_nodes_logic_flowSwitch`

*Fichier : `lua/ge/extensions/flowgraph/nodes/logic/flowSwitch.lua` · VM : Game Engine (GE) · 69 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/logic/flowSwitch")` (fichier sous extensions/ mais pas une extension classique)

Noeud flowgraph 'Flow Switch' (categorie logic). Interrupteur avec les entrees flow 'on' et 'off' ; l'etat peut aussi etre bascule en cliquant la case sur le noeud dans l'editeur. La sortie flow vaut le flux d'entree si l'interrupteur est sur ON. L'etat initial est sauvegarde dans le projet (storedOn).

## Remarques

- Si storedOn n'a jamais ete defini (nil), _executionStarted met self.on a nil, ce qui equivaut a OFF.

## Classe `C`

Classe du noeud flowgraph (creee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` | Restaure l'etat sauvegarde (storedOn). | 46 |
| `C:_executionStopped()` | Restaure l'etat sauvegarde (storedOn). | 42 |
| `C:_onDeserialized(nodeData)` | Relit storedOn depuis le champ 'on'. | 54 |
| `C:_onSerialize(res)` | Sauvegarde storedOn dans le champ 'on'. | 50 |
| `C:drawMiddle(builder, style)` | Dessine une case a cocher cliquable ; un clic bascule l'etat et, si l'edition est autorisee, memorise storedOn. | 30 |
| `C:init(mgr, ...)` | Etat initial : off. | 26 |
| `C:work(args)` | Si 'on' a du flux, passe a ON ; si 'off' a du flux, passe a OFF (off l'emporte si les deux). Sortie flow = etat ET flux d'entree. | 58 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/logic/flowSwitch.lua`.*
