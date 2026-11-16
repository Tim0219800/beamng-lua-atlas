# `flowgraph_nodes_gameplay_traffic_pursuitParams`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/traffic/pursuitParams.lua` · VM : Game Engine (GE) · 61 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/traffic/pursuitParams")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Pursuit Parameters » (once_instant). Règle les paramètres de la police (gameplay_police.setPursuitVars) : policeStrictness (strictness), arrestLimit (arrestTime), arrestRadius, evadeLimit (evadeTime), evadeRadius, suspectFrequency, roadblockFrequency. Seuls les pins non nil sont appliqués.

## Classe `C`

Classe du nœud flowgraph (créée via `_flowgraph_createNode(C)`).

| Méthode | Description | Ligne |
|---|---|---|
| `C:init()` | Initialise l'état interne du nœud à sa création (appelé par le moteur flowgraph). | 27 |
| `C:workOnce()` | Construit la table de variables à partir des pins non nil et appelle gameplay_police.setPursuitVars. | 31 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/traffic/pursuitParams.lua`.*
