# `flowgraph_nodes_gameplay_rally_rallyDebugNode`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyDebugNode.lua` · VM : Game Engine (GE) · 40 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/rally/rallyDebugNode")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Rally Debug Draw » (catégorie repeat_instant, tag rally). Dessine à chaque frame des infos de debug pour un véhicule : sa boîte englobante (RallyUtil.drawVehBB), une sphère de 0,1 m magenta à l'avant-bas, une jaune à la position du véhicule et une verte à la position pos reçue. Entrées : vehId, pos (vec3), rot (quat, non utilisée).

## Remarques

- La pin pos doit être renseignée quand vehId l'est, sinon vec3(nil) peut échouer.

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:work(args)` | Dessine via debugDrawer les repères du véhicule et de la position cible. | 22 |

## Appels vers le moteur (C++)

- `debugDrawer:` `drawSphere`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyDebugNode.lua`.*
