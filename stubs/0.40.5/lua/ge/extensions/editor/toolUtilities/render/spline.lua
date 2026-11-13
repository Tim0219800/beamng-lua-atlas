---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/render/spline.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Rendu fil de fer et surfaces des splines et couches pour les outils d'édition de splines (l'essentiel de l'ancien render.lua). Module composite : dessine via render/spheres, lines, tris et markup, avec sa propre réserve de vec3 temporaires. handleSplineRendering dessine nœuds, noms, nervures, barres et élévations ; les autres fonctions dessinent coques, rubans, surfaces homologuées ou projetées sur le sol et aperçus. À appeler chaque frame depuis un outil d'éditeur.
--- Accès : extension `editor_toolUtilities_render_spline` : `extensions.load("editor_toolUtilities_render_spline")`, puis la globale `editor_toolUtilities_render_spline`
---@class editor_toolUtilities_render_spline
editor_toolUtilities_render_spline = {}

--- Dessine un arc de cercle (16 segments) du point a au point b autour de center, avec l'étiquette d'angle de torsion au milieu pour le nœud sélectionné.
---Source : lua/ge/extensions/editor/toolUtilities/render/spline.lua:58
---@param center vec3 Centre de l'arc.
---@param isSelectedNode boolean true pour afficher l'angle de torsion.
---@param a vec3 Point de départ.
---@param b vec3 Point d'arrivée.
---@param axis vec3 Axe de rotation.
---@param twistAngle number Angle de torsion ; son signe donne le sens de l'arc.
function editor_toolUtilities_render_spline.drawArc(center, isSelectedNode, a, b, axis, twistAngle) end

--- Dessine les poignées de barre et leur ligne de chute vers le sol (raycast vertical), colorée selon l'élévation. Sans effet s'il y a moins de 2 barres.
---Source : lua/ge/extensions/editor/toolUtilities/render/spline.lua:104
---@param bars vec3[] Points de barre.
---@param elevScale number Hauteur correspondant au rouge de la rampe.
function editor_toolUtilities_render_spline.drawBarPoints(bars, elevScale) end

--- Dessine les points de nervure (sphères) et les lignes de nervure : pour une spline complète, gauche et droite reliées ; pour une demi-spline, seulement le bord droit relié au nœud central.
---Source : lua/ge/extensions/editor/toolUtilities/render/spline.lua:81
---@param ribs vec3[] Points de nervure, par paires gauche/droite.
---@param spline table Spline (tileSet ou spacing signale une demi-spline ; nodes).
function editor_toolUtilities_render_spline.drawRibPoints(ribs, spline) end

--- Dessine toutes les splines : la sélectionnée avec ses nœuds, surbrillance, gizmo/rotation, nervures, barres, élévation et nom/longueur ; les autres en version atténuée avec leur nom.
---Source : lua/ge/extensions/editor/toolUtilities/render/spline.lua:124
---@param splines table Liste de splines.
---@param splineIdx integer Indice de la spline sélectionnée.
---@param nodeIdx integer Indice du nœud sélectionné.
---@param isGizmoActive boolean Le gizmo de translation est actif.
---@param isUseRot boolean Mode rotation (affichage de torsion).
---@param isShapeLocked boolean Forme verrouillée.
---@param isShowElevation boolean Afficher élévations et lignes de chute.
---@param isShowRibs boolean Afficher les nervures.
---@param elevScale number Échelle de couleur d'élévation.
---@param hiddenNodeSet table<integer, boolean>|nil Ensemble de nœuds de la spline sélectionnée dont la grosse sphère, la surbrillance et la ligne d'élévation sont supprimées (coins ingénierés de heroRoad où le nœud PI est loin de la route).
---@param noNames boolean|nil Supprime le nom des splines non sélectionnées (réseaux de centaines de liens).
function editor_toolUtilities_render_spline.handleSplineRendering(splines, splineIdx, nodeIdx, isGizmoActive, isUseRot, isShapeLocked, isShowElevation, isShowRibs, elevScale, hiddenNodeSet, noNames) end

--- Dessine une surface quadrilatérale fil de fer dont les z sont obtenus par raycast sur le sol, le long de divPoints (une ligne sur deux).
---Source : lua/ge/extensions/editor/toolUtilities/render/spline.lua:555
---@param spline table|nil Spline avec divPoints, divWidths, binormals.
function editor_toolUtilities_render_spline.renderDrivePathSurface(spline) end

--- Dessine le fil de fer des demi-splines (par ex. trottoirs).
---Source : lua/ge/extensions/editor/toolUtilities/render/spline.lua:403
---@param splines table Liste de splines.
---@param selSplineIdx integer Indice de la spline sélectionnée.
---@param binormalSpacing integer Espacement des lignes binormales.
function editor_toolUtilities_render_spline.renderHalfSplineWireFrame(splines, selSplineIdx, binormalSpacing) end

--- Dessine le fil de fer des splines maîtres, avec une surface en carte de chaleur pour la spline sélectionnée.
---Source : lua/ge/extensions/editor/toolUtilities/render/spline.lua:481
---@param splines table Liste de splines.
---@param selSplineIdx integer Indice de la spline sélectionnée.
function editor_toolUtilities_render_spline.renderHomologatedSurface(splines, selSplineIdx) end

--- Dessine le fil de fer d'une couche d'une spline (avec décalage binormal), éventuellement projeté au sol par raycast.
---Source : lua/ge/extensions/editor/toolUtilities/render/spline.lua:245
---@param layer table Couche à dessiner.
---@param spline table Spline contenant la couche.
---@param isRaycast boolean Projeter les points sur le sol.
---@param binormalSpacing integer Espacement des lignes binormales, en points de division.
function editor_toolUtilities_render_spline.renderLayer(layer, spline, isRaycast, binormalSpacing) end

--- Comme renderLayer pour une couche de spline maître, sans appliquer le décalage binormal.
---Source : lua/ge/extensions/editor/toolUtilities/render/spline.lua:313
---@param layer table Couche à dessiner.
---@param spline table Spline contenant la couche.
---@param isRaycast boolean Projeter sur le sol.
---@param binormalSpacing integer Espacement des lignes binormales.
function editor_toolUtilities_render_spline.renderMasterLayer(layer, spline, isRaycast, binormalSpacing) end

--- Dessine un ruban d'aperçu : sphères de nœuds, lignes de largeur et d'arêtes et surface de prévisualisation. Les binormales sont calculées en 2D (horizontales).
---Source : lua/ge/extensions/editor/toolUtilities/render/spline.lua:600
---@param nodes vec3[] Nœuds du ruban.
---@param widths number[] Largeur du ruban à chaque nœud, en mètres.
function editor_toolUtilities_render_spline.renderPreviewRibbon(nodes, widths) end

--- Dessine les coques des splines (fil de fer simple avec étiquettes) quand l'outil est inactif.
---Source : lua/ge/extensions/editor/toolUtilities/render/spline.lua:377
---@param splines table Liste de splines.
function editor_toolUtilities_render_spline.renderShells(splines) end

--- Dessine les polylignes des outils de spline de maillage, d'assemblage, de rail et de décalque : trait épais pour la spline sélectionnée, atténué pour les autres. Une spline isPolyline est tracée par ses nœuds (fermée si isLoop), sinon par divPoints ; les splines désactivées ou isLink sont ignorées.
---Source : lua/ge/extensions/editor/toolUtilities/render/spline.lua:641
---@param splines table|nil Liste de splines.
---@param selectedSplineIdx integer Indice de la spline sélectionnée.
function editor_toolUtilities_render_spline.renderSplinePolylines(splines, selectedSplineIdx) end

--- Dessine un contour fil de fer des splines données.
---Source : lua/ge/extensions/editor/toolUtilities/render/spline.lua:432
---@param splines table Liste de splines.
function editor_toolUtilities_render_spline.renderWireframeRibbons(splines) end

---@type number
i = nil
