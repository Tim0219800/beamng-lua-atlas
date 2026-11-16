# `flowgraph_nodes_gameplay_pointsBarSetPoints`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/pointsBarSetPoints.lua` · VM : Game Engine (GE) · 27 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/pointsBarSetPoints")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « PointsBar Points » (catégorie repeat_instant, couleur/icône ui). Fixe les points et le libellé de l'app UI pointsBar via ui_apps_pointsBar.setPoints(points, pointsLabel), puis marque self.mgr.modules.ui.pointsBarChanged = true. Entrées : points (number, longueur de remplissage de la barre) et pointsLabel (string, texte affiché). S'exécute à chaque frame où il reçoit du flux.

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:work()` | Appelle ui_apps_pointsBar.setPoints avec les pins points et pointsLabel et signale le changement au module ui du flowgraph. | 21 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/pointsBarSetPoints.lua`.*
