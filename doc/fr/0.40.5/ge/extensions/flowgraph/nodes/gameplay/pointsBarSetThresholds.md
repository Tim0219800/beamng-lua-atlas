# `flowgraph_nodes_gameplay_pointsBarSetThresholds`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/pointsBarSetThresholds.lua` · VM : Game Engine (GE) · 28 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/pointsBarSetThresholds")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « PointsBar Thresholds » (catégorie repeat_instant, couleur/icône ui). Définit les seuils bronze, silver et gold (entrées number) de la barre de points via ui_apps_pointsBar.setThresholds({bronze, silver, gold}), puis met self.mgr.modules.ui.pointsBarChanged à true.

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:work()` | Appelle ui_apps_pointsBar.setThresholds avec les trois seuils et signale le changement au module ui du flowgraph. | 22 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/pointsBarSetThresholds.lua`.*
