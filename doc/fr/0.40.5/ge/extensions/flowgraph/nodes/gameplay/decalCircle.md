# `flowgraph_nodes_gameplay_decalCircle`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/decalCircle.lua` · VM : Game Engine (GE) · 132 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/decalCircle")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Decal Circle » (catégorie repeat_instant, util/draw). Dessine un cercle de décalques au sol, comme une barre de chargement radiale. Pins d'entrée : pos (centre), radius, decalScale ({1,1,3}), amount (32 décalques), inverted, decalPath, filling1 (0 à 100, progression), filling2 (0 à 100, recharge), couleurs filledColor, fillingColor1, fillingColor2, backgroundColor. Envoie les décalques à Engine.Render.DynamicDecalMgr.addDecals chaque frame.

## Remarques

- data.snapToTerrain = true est défini mais non utilisé dans ce fichier.
- Les décalques ont fadeStart 200 et fadeEnd 250.

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` | Réinitialise le pool de décalques et les caches de couleurs. | 59 |
| `C:init()` | Définit data.snapToTerrain = true. | 41 |
| `C:work()` | Met à jour les caches de couleurs, calcule position, direction, couleur et échelle de chaque décalque sur le cercle et les soumet au renderer. | 74 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/decalCircle.lua`.*
