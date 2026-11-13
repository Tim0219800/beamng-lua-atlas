# `flowgraph_nodes_util_distanceBetween`

*Fichier : `lua/ge/extensions/flowgraph/nodes/util/distanceBetween.lua` · VM : Game Engine (GE) · 53 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/util/distanceBetween")` (fichier sous extensions/ mais pas une extension classique)

Nœud « Distance Between » (repeat_instant). Calcule la distance entre deux positions, chacune pouvant être un id de véhicule (number) ou un vec3. Entrées : posA, posB. Sortie : distance (number).

## Remarques

- Le résultat de getPosition(nil) est passé à posA:set : une entrée non connectée peut provoquer une erreur.
- Le test « if posA and posB » est toujours vrai (ce sont des vec3 locaux).

## Classe `C`

Classe du nœud flowgraph ; chaque instance représente un nœud dans un graphe.

| Méthode | Description | Ligne |
|---|---|---|
| `C:getPosition(pinInput)` | Renvoie une position : pour un number, la position du véhicule (getObjectByID) ou vec3 nul si introuvable ; pour une table, un vec3 converti ; nil si l'entrée est vide. | 36 |
| `C:work()` | Résout les deux positions via getPosition et écrit la distance dans le pin distance. | 24 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/util/distanceBetween.lua`.*
