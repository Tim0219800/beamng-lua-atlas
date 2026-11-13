# `flowgraph_nodes_gameplay_decalLine`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/decalLine.lua` · VM : Game Engine (GE) · 127 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/decalLine")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Decal Line » (catégorie repeat_instant, util/draw). Dessine une ligne de décalques du point posA au point posB, comme une barre de chargement. Pins d'entrée : posA, posB, decalScale, amount (32), inverted, decalPath, filling1, filling2 (0 à 100), et quatre couleurs (filledColor, fillingColor1, fillingColor2, backgroundColor). Soumet les décalques à Engine.Render.DynamicDecalMgr.addDecals.

## Remarques

- data.snapToTerrain = false est défini mais non utilisé dans ce fichier.

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` | Réinitialise le pool de décalques et les caches de couleurs. | 59 |
| `C:init()` | Définit data.snapToTerrain = false. | 41 |
| `C:work()` | Place les décalques par interpolation entre posA et posB, choisit leur couleur selon filling1/filling2 et les soumet au renderer. | 75 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/decalLine.lua`.*
