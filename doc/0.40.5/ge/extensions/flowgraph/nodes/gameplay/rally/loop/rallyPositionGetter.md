# `flowgraph_nodes_gameplay_rally_loop_rallyPositionGetter`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/rally/loop/rallyPositionGetter.lua` · VM : Game Engine (GE) · 40 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/rally/loop/rallyPositionGetter")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Rally Position Getter » (catégorie repeat_instant, tag rally). Cherche dans un pathData la position de départ portant le nom donné (pathData:findStartPositionByName) et renvoie sa position (pos) et sa rotation (rot). La sortie flow vaut true quand la position est trouvée.

## Remarques

- Malgré la description (« from the current rally loop manager »), le nœud n'utilise pas le gestionnaire de boucle : seul pathData compte.
- pos et rot sont renvoyés tels quels (vec3 et quat du chemin, pas des tables).

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` | Met la sortie flow à false au démarrage. | 23 |
| `C:work()` | Cherche la position nommée et renseigne pos, rot et flow. | 27 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/rally/loop/rallyPositionGetter.lua`.*
