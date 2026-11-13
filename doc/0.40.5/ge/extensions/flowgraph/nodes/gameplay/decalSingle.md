# `flowgraph_nodes_gameplay_decalSingle`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/decalSingle.lua` · VM : Game Engine (GE) · 62 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/decalSingle")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Decal Single » (catégorie repeat_instant, util/draw). Dessine un décalque unique dans le monde. Pins d'entrée : pos, rot (quat), scl, decalPath (parkDecalStripes.png par défaut), clrA, clrB (couleurs, alternance en ping-pong) et clrFrequency (2).

## Remarques

- La couleur oscille entre clrA et clrB selon os.clockhp() * clrFrequency.
- work lit pinIn.clrA.value[i] sans test : plante si les couleurs sont nil (elles ont une valeur par défaut hardcoded).

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:init()` | Vide. | 32 |
| `C:work()` | Calcule la couleur, construit le décalque et l'envoie à Engine.Render.DynamicDecalMgr.addDecals. | 44 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/decalSingle.lua`.*
