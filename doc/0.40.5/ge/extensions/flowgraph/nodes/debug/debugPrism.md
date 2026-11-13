# `flowgraph_nodes_debug_debugPrism`

*Fichier : `lua/ge/extensions/flowgraph/nodes/debug/debugPrism.lua` · VM : Game Engine (GE) · 49 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/debug/debugPrism")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Debug Prism » (catégorie repeat_instant, tags util/draw). Dessine chaque frame un prisme à base carrée/rectangulaire (debugDrawer:drawSquarePrism) entre posA et posB, avec une largeur et une hauteur à chaque extrémité. Entrées : posA, posB (vec3 requis), widthA, heightA, widthB, heightB (number, 1 par défaut), color (caché, rose par défaut).

## Remarques

- Le code construit Point2F(hauteur, largeur) : l'ordre passé au moteur est (height, width).

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:init()` | Vide. | 27 |
| `C:work()` | Si posA et posB sont définis, dessine le prisme. | 30 |

## Appels vers le moteur (C++)

- `debugDrawer:` `drawSquarePrism`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/debug/debugPrism.lua`.*
