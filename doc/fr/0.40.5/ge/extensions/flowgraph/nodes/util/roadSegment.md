# `flowgraph_nodes_util_roadSegment`

*Fichier : `lua/ge/extensions/flowgraph/nodes/util/roadSegment.lua` · VM : Game Engine (GE) · 76 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/util/roadSegment")` (fichier sous extensions/ mais pas une extension classique)

Nœud « Road Properties » (repeat_instant). Donne les propriétés d'un segment de route du navgraph défini par deux nœuds. Entrées : n1, n2 (noms de nœuds), xnorm (caché, 0,5 par défaut). Sorties : roadDir (direction normalisée, tient compte du sens unique), length, width, drivability (0 à 1), speedLimit (m/s), lanesIncoming, lanesOutgoing, lanesTotal, isOneWay, isPrivate.

## Remarques

- Bug : si aucun lien n'existe entre n1 et n2 (link == nil), le code lit quand même link.inNode et lève une erreur.
- Le nombre de voies est compté sur la chaîne link.lanes (caractères « - » entrants, « + » sortants).

## Classe `C`

Classe du nœud flowgraph ; chaque instance représente un nœud dans un graphe.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` | Réinitialise le cache des deux noms. | 38 |
| `C:init()` | Réinitialise le cache des deux noms. | 34 |
| `C:work()` | Si les deux nœuds existent dans map.getMap().nodes, recalcule (quand la paire change) longueur, drivabilité, limite de vitesse, sens unique, route privée, nombre de voies (comptage des « - » et « + » de link.lanes, « -+ » par défaut) et direction ; recalcule toujours la largeur (2 × rayon interpolé selon xnorm). | 42 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/util/roadSegment.lua`.*
