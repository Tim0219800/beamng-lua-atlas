---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/render/lines.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Dessin de lignes de debug pour les outils d'édition de splines de l'éditeur (issu de l'ancien render.lua monolithique). Chaque fonction trace un segment p0-p1 avec le style (couleur, épaisseur) correspondant à un usage : spline, fil de fer, ligne de chute d'élévation, normale, navigation, etc. Module feuille : dépend de utils/debugDraw, du style partagé et de util (rampe de couleur bleu vers rouge).
--- Accès : extension `editor_toolUtilities_render_lines` : `extensions.load("editor_toolUtilities_render_lines")`, puis la globale `editor_toolUtilities_render_lines`
---@class editor_toolUtilities_render_lines
editor_toolUtilities_render_lines = {}

--- Segment actif (colourLayerWire, épaisseur 2).
---Source : lua/ge/extensions/editor/toolUtilities/render/lines.lua:62
---@param p0 vec3 Début.
---@param p1 vec3 Fin.
function editor_toolUtilities_render_lines.drawActiveSegLine(p0, p1) end

--- Segment d'arc (colourArcSeg, épaisseur arcSegThickness). Non filtré par distance.
---Source : lua/ge/extensions/editor/toolUtilities/render/lines.lua:98
---@param p0 vec3 Début.
---@param p1 vec3 Fin.
function editor_toolUtilities_render_lines.drawArcSegment(p0, p1) end

--- Ligne de plafond de barre, colorée selon v sur la rampe bleu vers rouge.
---Source : lua/ge/extensions/editor/toolUtilities/render/lines.lua:86
---@param p0 vec3 Début.
---@param p1 vec3 Fin.
---@param v number Valeur.
---@param lim number Maximum de la rampe.
function editor_toolUtilities_render_lines.drawBarCeilingLine(p0, p1, v, lim) end

--- Ligne de chute d'élévation colorée selon la valeur v sur la rampe bleu vers rouge entre 0 et lim.
---Source : lua/ge/extensions/editor/toolUtilities/render/lines.lua:71
---@param p0 vec3 Début.
---@param p1 vec3 Fin.
---@param v number Valeur à représenter.
---@param lim number Valeur maximale de la rampe.
function editor_toolUtilities_render_lines.drawDropLine(p0, p1, v, lim) end

--- Ligne de chute atténuée (colourDropDull).
---Source : lua/ge/extensions/editor/toolUtilities/render/lines.lua:73
---@param p0 vec3 Début.
---@param p1 vec3 Fin.
function editor_toolUtilities_render_lines.drawDropLineDull(p0, p1) end

--- Comme drawDropLine avec l'épaisseur dropThicknessThicker.
---Source : lua/ge/extensions/editor/toolUtilities/render/lines.lua:72
---@param p0 vec3 Début.
---@param p1 vec3 Fin.
---@param v number Valeur.
---@param lim number Maximum de la rampe.
function editor_toolUtilities_render_lines.drawDropLineThick(p0, p1, v, lim) end

--- Ligne de chute douce, fine et translucide (alpha 110), pour nœuds sélectionnés ou centres de jonction. Teinte selon |v| / lim (lim vaut 100 par défaut).
---Source : lua/ge/extensions/editor/toolUtilities/render/lines.lua:75
---@param p0 vec3 Début.
---@param p1 vec3 Fin.
---@param v number Valeur (valeur absolue utilisée).
---@param lim number|nil Maximum de la rampe, défaut 100.
function editor_toolUtilities_render_lines.drawElevDropLine(p0, p1, v, lim) end

--- Trace une ligne par-dessus la géométrie (sans test de profondeur) via debugDrawer:drawLine.
---Source : lua/ge/extensions/editor/toolUtilities/render/lines.lua:34
---@param p0 vec3 Début.
---@param p1 vec3 Fin.
---@param col integer Couleur packée.
function editor_toolUtilities_render_lines.drawForegroundLine(p0, p1, col) end

--- Ligne au sol (colourGround).
---Source : lua/ge/extensions/editor/toolUtilities/render/lines.lua:65
---@param p0 vec3 Début.
---@param p1 vec3 Fin.
function editor_toolUtilities_render_lines.drawGroundLine(p0, p1) end

--- Ligne au sol atténuée (colourGroundDull).
---Source : lua/ge/extensions/editor/toolUtilities/render/lines.lua:68
---@param p0 vec3 Début.
---@param p1 vec3 Fin.
function editor_toolUtilities_render_lines.drawGroundLineDull(p0, p1) end

--- Ligne de jonction/boucle à épaisseur pulsée dans le temps (os.clock, loopPulseHz). Non filtrée par distance.
---Source : lua/ge/extensions/editor/toolUtilities/render/lines.lua:99
---@param p0 vec3 Début.
---@param p1 vec3 Fin.
function editor_toolUtilities_render_lines.drawJoinLine(p0, p1) end

--- Trace une ligne seulement si les deux extrémités sont à moins de 600 m de la caméra.
---Source : lua/ge/extensions/editor/toolUtilities/render/lines.lua:27
---@param p0 vec3 Début.
---@param p1 vec3 Fin.
---@param thickness number Épaisseur.
---@param col integer Couleur packée.
function editor_toolUtilities_render_lines.drawLineCulled(p0, p1, thickness, col) end

--- Trace une ligne sans filtrage par distance (debugDraw.drawLineInstance_MinArg).
---Source : lua/ge/extensions/editor/toolUtilities/render/lines.lua:25
---@param p0 vec3 Début.
---@param p1 vec3 Fin.
---@param thickness number Épaisseur.
---@param col integer Couleur packée.
function editor_toolUtilities_render_lines.drawLineImmediate(p0, p1, thickness, col) end

--- Ligne de graphe de navigation (colourNav).
---Source : lua/ge/extensions/editor/toolUtilities/render/lines.lua:84
---@param p0 vec3 Début.
---@param p1 vec3 Fin.
function editor_toolUtilities_render_lines.drawNavLine(p0, p1) end

--- Ligne de normale (colourNormal).
---Source : lua/ge/extensions/editor/toolUtilities/render/lines.lua:82
---@param p0 vec3 Début.
---@param p1 vec3 Fin.
function editor_toolUtilities_render_lines.drawNormalLine(p0, p1) end

--- Ligne de chemin (colourPath).
---Source : lua/ge/extensions/editor/toolUtilities/render/lines.lua:85
---@param p0 vec3 Début.
---@param p1 vec3 Fin.
function editor_toolUtilities_render_lines.drawPathLine(p0, p1) end

--- Fil de fer d'aperçu (colourPreviewWire).
---Source : lua/ge/extensions/editor/toolUtilities/render/lines.lua:55
---@param p0 vec3 Début.
---@param p1 vec3 Fin.
function editor_toolUtilities_render_lines.drawPreviewWireLine(p0, p1) end

--- Ligne de normale de référence (colourRefNormal).
---Source : lua/ge/extensions/editor/toolUtilities/render/lines.lua:83
---@param p0 vec3 Début.
---@param p1 vec3 Fin.
function editor_toolUtilities_render_lines.drawRefNormalLine(p0, p1) end

--- Ligne de nervure : passe de halo (colourRibGlow) puis passe de cœur (colourRibLine).
---Source : lua/ge/extensions/editor/toolUtilities/render/lines.lua:58
---@param p0 vec3 Début.
---@param p1 vec3 Fin.
function editor_toolUtilities_render_lines.drawRibLine(p0, p1) end

--- Ligne de spline sélectionnée : halo (épaisseur 4) puis cœur (épaisseur 2). Non filtrée par distance.
---Source : lua/ge/extensions/editor/toolUtilities/render/lines.lua:94
---@param p0 vec3 Début.
---@param p1 vec3 Fin.
function editor_toolUtilities_render_lines.drawSplineLine(p0, p1) end

--- Ligne de spline atténuée (colourSplineDull).
---Source : lua/ge/extensions/editor/toolUtilities/render/lines.lua:88
---@param p0 vec3 Début.
---@param p1 vec3 Fin.
function editor_toolUtilities_render_lines.drawSplineLineDull(p0, p1) end

--- Ligne de spline au premier plan (couleur colourSplineForegroundF).
---Source : lua/ge/extensions/editor/toolUtilities/render/lines.lua:38
---@param p0 vec3 Début.
---@param p1 vec3 Fin.
function editor_toolUtilities_render_lines.drawSplineLineForeground(p0, p1) end

--- Ligne de spline liée à une autre (colourSplineLinked).
---Source : lua/ge/extensions/editor/toolUtilities/render/lines.lua:87
---@param p0 vec3 Début.
---@param p1 vec3 Fin.
function editor_toolUtilities_render_lines.drawSplineLineLinked(p0, p1) end

--- Ligne de spline non sélectionnée (colourSplineDull, épaisseur 2).
---Source : lua/ge/extensions/editor/toolUtilities/render/lines.lua:91
---@param p0 vec3 Début.
---@param p1 vec3 Fin.
function editor_toolUtilities_render_lines.drawSplineLineUnselected(p0, p1) end

--- Ligne de marque d'angle droit (colourSquareCorner).
---Source : lua/ge/extensions/editor/toolUtilities/render/lines.lua:80
---@param p0 vec3 Début.
---@param p1 vec3 Fin.
function editor_toolUtilities_render_lines.drawSquareCornerLine(p0, p1) end

--- Marque d'angle droit au premier plan (colourSquareCornerF).
---Source : lua/ge/extensions/editor/toolUtilities/render/lines.lua:81
---@param p0 vec3 Début.
---@param p1 vec3 Fin.
function editor_toolUtilities_render_lines.drawSquareCornerLineForeground(p0, p1) end

--- Fil de fer de couche (colourLayerWire, épaisseur 2).
---Source : lua/ge/extensions/editor/toolUtilities/render/lines.lua:42
---@param p0 vec3 Début.
---@param p1 vec3 Fin.
function editor_toolUtilities_render_lines.drawWireFrameLine(p0, p1) end

--- Fil de fer de deuxième couche (colourLayerWire2).
---Source : lua/ge/extensions/editor/toolUtilities/render/lines.lua:49
---@param p0 vec3 Début.
---@param p1 vec3 Fin.
function editor_toolUtilities_render_lines.drawWireFrameLine2(p0, p1) end

--- Fil de fer de troisième couche (colourLayerWire3).
---Source : lua/ge/extensions/editor/toolUtilities/render/lines.lua:52
---@param p0 vec3 Début.
---@param p1 vec3 Fin.
function editor_toolUtilities_render_lines.drawWireFrameLine3(p0, p1) end

