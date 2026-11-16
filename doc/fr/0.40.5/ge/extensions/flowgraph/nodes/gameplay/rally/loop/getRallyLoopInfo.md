# `flowgraph_nodes_gameplay_rally_loop_getRallyLoopInfo`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/rally/loop/getRallyLoopInfo.lua` · VM : Game Engine (GE) · 43 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/rally/loop/getRallyLoopInfo")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Rally Loop Get Info » (catégorie once_instant, tag rally). Lit dans le gestionnaire de la boucle rally le nom du rally (rm:getRallyLoopName()) et les textes d'écran de départ et de fin de la mission (missionTypeData.startScreenText / endScreenText, « » par défaut). Sorties : name, startScreenText, endScreenText (string ou table translationObject).

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:workOnce()` | Écrit name, startScreenText et endScreenText ; log d'erreur si aucun gestionnaire. | 30 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/rally/loop/getRallyLoopInfo.lua`.*
