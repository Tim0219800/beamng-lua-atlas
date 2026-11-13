# `flowgraph_nodes_gameplay_isWalkingEnabled`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/isWalkingEnabled.lua` · VM : Game Engine (GE) · 29 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/isWalkingEnabled")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Is Walking Enabled » (catégorie repeat_instant). Indique si le joueur a le droit d'entrer dans un véhicule ou d'en sortir lui-même, d'après gameplay_walk.isTogglingEnabled(). Sorties : allowed (flow si autorisé), denied (flow sinon) et value (bool, caché). S'exécute à chaque frame.

**Dépendances (chargées avant) :** `gameplay_walk`

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:work(args)` | Chaque frame : lit gameplay_walk.isTogglingEnabled() et met à jour value, allowed et denied. | 22 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/isWalkingEnabled.lua`.*
