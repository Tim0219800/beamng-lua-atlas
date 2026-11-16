# `flowgraph_nodes_util_randomNumber`

*Fichier : `lua/ge/extensions/flowgraph/nodes/util/randomNumber.lua` · VM : Game Engine (GE) · 39 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/util/randomNumber")` (fichier sous extensions/ mais pas une extension classique)

Nœud « Random Number » (repeat_instant, icône casino). Génère un nombre aléatoire dans [rangeStart, rangeEnd] à chaque frame. Entrées : rangeStart (0), rangeEnd (10), float (caché, false : entier). Sortie : random.

## Remarques

- En mode entier, math.random exige des entiers et rangeStart <= rangeEnd.

## Classe `C`

Classe du nœud flowgraph ; chaque instance représente un nœud dans un graphe.

| Méthode | Description | Ligne |
|---|---|---|
| `C:work()` | Si les bornes sont définies, renvoie un entier (math.random(a, b)) ou un flottant (a + random × (b-a)) selon float ; sans bornes, renvoie math.random(). | 23 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/util/randomNumber.lua`.*
