# `editor_toolUtilities_render_spline`

*Fichier : `lua/ge/extensions/editor/toolUtilities/render/spline.lua` · VM : Game Engine (GE) · 682 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_toolUtilities_render_spline` : `extensions.load("editor_toolUtilities_render_spline")`, puis la globale `editor_toolUtilities_render_spline`

Rendu fil de fer et surfaces des splines et couches pour les outils d'édition de splines (l'essentiel de l'ancien render.lua). Module composite : dessine via render/spheres, lines, tris et markup, avec sa propre réserve de vec3 temporaires. handleSplineRendering dessine nœuds, noms, nervures, barres et élévations ; les autres fonctions dessinent coques, rubans, surfaces homologuées ou projetées sur le sol et aperçus. À appeler chaque frame depuis un outil d'éditeur.

## Remarques

- Une spline attendue est une table avec nodes, divPoints (points subdivisés), divWidths, binormals, isEnabled, isLink, isLoop, isPolyline, etc. ; les champs exacts viennent de l'outil appelant.
- Les surfaces projetées (renderDrivePathSurface) lancent un raycast vertical depuis 3 m au-dessus (zRayLift) et ajoutent 0.05 m (zRayOffset) ; elles sont ignorées pour les splines isLink.
- Un arc de torsion est dessiné en 16 segments, à 0.97 * 5 m du centre.
- Une demi-spline (champ tileSet ou spacing présent) ne dessine que les nervures droites (indices pairs).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_toolUtilities_render_spline.drawArc(center, isSelectedNode, a, b, axis, twistAngle)` | Dessine un arc de cercle (16 segments) du point a au point b autour de center, avec l'étiquette d'angle de torsion au milieu pour le nœud sélectionné. | 58 |
| `editor_toolUtilities_render_spline.drawBarPoints(bars, elevScale)` | Dessine les poignées de barre et leur ligne de chute vers le sol (raycast vertical), colorée selon l'élévation. Sans effet s'il y a moins de 2 barres. | 104 |
| `editor_toolUtilities_render_spline.drawRibPoints(ribs, spline)` | Dessine les points de nervure (sphères) et les lignes de nervure : pour une spline complète, gauche et droite reliées ; pour une demi-spline, seulement le bord droit relié au nœud central. | 81 |
| `editor_toolUtilities_render_spline.handleSplineRendering(splines, splineIdx, nodeIdx, isGizmoActive, isUseRot, isShapeLocked, isShowElevation, isShowRibs, elevScale, hiddenNodeSet, noNames)` | Dessine toutes les splines : la sélectionnée avec ses nœuds, surbrillance, gizmo/rotation, nervures, barres, élévation et nom/longueur ; les autres en version atténuée avec leur nom. | 124 |
| `editor_toolUtilities_render_spline.renderDrivePathSurface(spline)` | Dessine une surface quadrilatérale fil de fer dont les z sont obtenus par raycast sur le sol, le long de divPoints (une ligne sur deux). | 555 |
| `editor_toolUtilities_render_spline.renderHalfSplineWireFrame(splines, selSplineIdx, binormalSpacing)` | Dessine le fil de fer des demi-splines (par ex. trottoirs). | 403 |
| `editor_toolUtilities_render_spline.renderHomologatedSurface(splines, selSplineIdx)` | Dessine le fil de fer des splines maîtres, avec une surface en carte de chaleur pour la spline sélectionnée. | 481 |
| `editor_toolUtilities_render_spline.renderLayer(layer, spline, isRaycast, binormalSpacing)` | Dessine le fil de fer d'une couche d'une spline (avec décalage binormal), éventuellement projeté au sol par raycast. | 245 |
| `editor_toolUtilities_render_spline.renderMasterLayer(layer, spline, isRaycast, binormalSpacing)` | Comme renderLayer pour une couche de spline maître, sans appliquer le décalage binormal. | 313 |
| `editor_toolUtilities_render_spline.renderPreviewRibbon(nodes, widths)` | Dessine un ruban d'aperçu : sphères de nœuds, lignes de largeur et d'arêtes et surface de prévisualisation. Les binormales sont calculées en 2D (horizontales). | 600 |
| `editor_toolUtilities_render_spline.renderShells(splines)` | Dessine les coques des splines (fil de fer simple avec étiquettes) quand l'outil est inactif. | 377 |
| `editor_toolUtilities_render_spline.renderSplinePolylines(splines, selectedSplineIdx)` | Dessine les polylignes des outils de spline de maillage, d'assemblage, de rail et de décalque : trait épais pour la spline sélectionnée, atténué pour les autres. Une spline isPolyline est tracée par ses nœuds (fermée si isLoop), sinon par divPoints ; les splines désactivées ou isLink sont ignorées. | 641 |
| `editor_toolUtilities_render_spline.renderWireframeRibbons(splines)` | Dessine un contour fil de fer des splines données. | 432 |

### Détail des paramètres

#### `editor_toolUtilities_render_spline.drawArc(center, isSelectedNode, a, b, axis, twistAngle)`

Dessine un arc de cercle (16 segments) du point a au point b autour de center, avec l'étiquette d'angle de torsion au milieu pour le nœud sélectionné.

- `center` (*vec3*) : Centre de l'arc.
- `isSelectedNode` (*boolean*) : true pour afficher l'angle de torsion.
- `a` (*vec3*) : Point de départ.
- `b` (*vec3*) : Point d'arrivée.
- `axis` (*vec3*) : Axe de rotation.
- `twistAngle` (*number*) : Angle de torsion ; son signe donne le sens de l'arc.

#### `editor_toolUtilities_render_spline.drawBarPoints(bars, elevScale)`

Dessine les poignées de barre et leur ligne de chute vers le sol (raycast vertical), colorée selon l'élévation. Sans effet s'il y a moins de 2 barres.

- `bars` (*vec3[]*) : Points de barre.
- `elevScale` (*number*) : Hauteur correspondant au rouge de la rampe.

#### `editor_toolUtilities_render_spline.drawRibPoints(ribs, spline)`

Dessine les points de nervure (sphères) et les lignes de nervure : pour une spline complète, gauche et droite reliées ; pour une demi-spline, seulement le bord droit relié au nœud central.

- `ribs` (*vec3[]*) : Points de nervure, par paires gauche/droite.
- `spline` (*table*) : Spline (tileSet ou spacing signale une demi-spline ; nodes).

#### `editor_toolUtilities_render_spline.handleSplineRendering(splines, splineIdx, nodeIdx, isGizmoActive, isUseRot, isShapeLocked, isShowElevation, isShowRibs, elevScale, hiddenNodeSet, noNames)`

Dessine toutes les splines : la sélectionnée avec ses nœuds, surbrillance, gizmo/rotation, nervures, barres, élévation et nom/longueur ; les autres en version atténuée avec leur nom.

- `splines` (*table*) : Liste de splines.
- `splineIdx` (*integer*) : Indice de la spline sélectionnée.
- `nodeIdx` (*integer*) : Indice du nœud sélectionné.
- `isGizmoActive` (*boolean*) : Le gizmo de translation est actif.
- `isUseRot` (*boolean*) : Mode rotation (affichage de torsion).
- `isShapeLocked` (*boolean*) : Forme verrouillée.
- `isShowElevation` (*boolean*) : Afficher élévations et lignes de chute.
- `isShowRibs` (*boolean*) : Afficher les nervures.
- `elevScale` (*number*) : Échelle de couleur d'élévation.
- `hiddenNodeSet` (*table<integer, boolean>|nil*) : Ensemble de nœuds de la spline sélectionnée dont la grosse sphère, la surbrillance et la ligne d'élévation sont supprimées (coins ingénierés de heroRoad où le nœud PI est loin de la route).
- `noNames` (*boolean|nil*) : Supprime le nom des splines non sélectionnées (réseaux de centaines de liens).

#### `editor_toolUtilities_render_spline.renderDrivePathSurface(spline)`

Dessine une surface quadrilatérale fil de fer dont les z sont obtenus par raycast sur le sol, le long de divPoints (une ligne sur deux).

- `spline` (*table|nil*) : Spline avec divPoints, divWidths, binormals.

#### `editor_toolUtilities_render_spline.renderHalfSplineWireFrame(splines, selSplineIdx, binormalSpacing)`

Dessine le fil de fer des demi-splines (par ex. trottoirs).

- `splines` (*table*) : Liste de splines.
- `selSplineIdx` (*integer*) : Indice de la spline sélectionnée.
- `binormalSpacing` (*integer*) : Espacement des lignes binormales.

#### `editor_toolUtilities_render_spline.renderHomologatedSurface(splines, selSplineIdx)`

Dessine le fil de fer des splines maîtres, avec une surface en carte de chaleur pour la spline sélectionnée.

- `splines` (*table*) : Liste de splines.
- `selSplineIdx` (*integer*) : Indice de la spline sélectionnée.

#### `editor_toolUtilities_render_spline.renderLayer(layer, spline, isRaycast, binormalSpacing)`

Dessine le fil de fer d'une couche d'une spline (avec décalage binormal), éventuellement projeté au sol par raycast.

- `layer` (*table*) : Couche à dessiner.
- `spline` (*table*) : Spline contenant la couche.
- `isRaycast` (*boolean*) : Projeter les points sur le sol.
- `binormalSpacing` (*integer*) : Espacement des lignes binormales, en points de division.

#### `editor_toolUtilities_render_spline.renderMasterLayer(layer, spline, isRaycast, binormalSpacing)`

Comme renderLayer pour une couche de spline maître, sans appliquer le décalage binormal.

- `layer` (*table*) : Couche à dessiner.
- `spline` (*table*) : Spline contenant la couche.
- `isRaycast` (*boolean*) : Projeter sur le sol.
- `binormalSpacing` (*integer*) : Espacement des lignes binormales.

#### `editor_toolUtilities_render_spline.renderPreviewRibbon(nodes, widths)`

Dessine un ruban d'aperçu : sphères de nœuds, lignes de largeur et d'arêtes et surface de prévisualisation. Les binormales sont calculées en 2D (horizontales).

- `nodes` (*vec3[]*) : Nœuds du ruban.
- `widths` (*number[]*) : Largeur du ruban à chaque nœud, en mètres.

#### `editor_toolUtilities_render_spline.renderShells(splines)`

Dessine les coques des splines (fil de fer simple avec étiquettes) quand l'outil est inactif.

- `splines` (*table*) : Liste de splines.

#### `editor_toolUtilities_render_spline.renderSplinePolylines(splines, selectedSplineIdx)`

Dessine les polylignes des outils de spline de maillage, d'assemblage, de rail et de décalque : trait épais pour la spline sélectionnée, atténué pour les autres. Une spline isPolyline est tracée par ses nœuds (fermée si isLoop), sinon par divPoints ; les splines désactivées ou isLink sont ignorées.

- `splines` (*table|nil*) : Liste de splines.
- `selectedSplineIdx` (*integer*) : Indice de la spline sélectionnée.

#### `editor_toolUtilities_render_spline.renderWireframeRibbons(splines)`

Dessine un contour fil de fer des splines données.

- `splines` (*table*) : Liste de splines.

**Globales affectées :** `i`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/toolUtilities/render/spline.lua`.*
