# `flowgraph_nodes_gameplay_decalPath`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/decalPath.lua` · VM : Game Engine (GE) · 103 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/decalPath")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Decal Path » (catégorie repeat_instant, util/draw/route). Dessine des décalques animés (flèches de groundmarker) le long d'un itinéraire de posA à posB. Pins d'entrée : posA, posB, speed (10), spacing (15), decalColor (caché). L'itinéraire est calculé par gameplay/route/route.

## Remarques

- L'animation dépend de os.clock() * speed % spacing.
- Le premier et le dernier marqueur ont un alpha dégradé pour les fondus.

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` | Réinitialise le pool de décalques. | 44 |
| `C:getNewDecal()` | Crée un décalque (texture arrow_groundmarkers_1, échelle 8x12x4, fade 400 à 500). | 30 |
| `C:increaseDecalPool(max)` | Agrandit le pool de décalques jusqu'à max. | 49 |
| `C:init()` | Vide. | 27 |
| `C:work()` | Calcule la route, positionne les marqueurs espacés le long du chemin et les soumet à Engine.Render.DynamicDecalMgr.addDecals. | 58 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/decalPath.lua`.*
