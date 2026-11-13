---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/render/markup.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Étiquettes de texte en 3D pour les outils d'édition de splines (issu de l'ancien render.lua). Fournit les primitives de texte (filtré ou non par distance, couleurs normales ou inversées, via debugDraw.drawTextAdvanced) et toutes les étiquettes prêtes à l'emploi : invites du curseur (« Click To Add Node »), noms, longueurs, largeurs, élévations, vitesses, distances d'obstacle. Les textes sont en anglais dans le code.
--- Accès : extension `editor_toolUtilities_render_markup` : `extensions.load("editor_toolUtilities_render_markup")`, puis la globale `editor_toolUtilities_render_markup`
---@class editor_toolUtilities_render_markup
editor_toolUtilities_render_markup = {}

--- Texte à pos, affiché seulement à moins de 250 m de la caméra.
---Source : lua/ge/extensions/editor/toolUtilities/render/markup.lua:22
---@param pos vec3 Position.
---@param text string Texte.
function editor_toolUtilities_render_markup.drawMarkupCulled(pos, text) end

--- Même comportement que drawMarkupCulled (filtre 250 m).
---Source : lua/ge/extensions/editor/toolUtilities/render/markup.lua:27
---@param pos vec3 Position.
---@param text string Texte.
function editor_toolUtilities_render_markup.drawMarkupCulledAlwaysShow(pos, text) end

--- Texte filtré à 250 m avec couleurs de texte et de fond inversées.
---Source : lua/ge/extensions/editor/toolUtilities/render/markup.lua:36
---@param pos vec3 Position.
---@param text string Texte.
function editor_toolUtilities_render_markup.drawMarkupCulledInvertedCols(pos, text) end

--- Texte sans filtre de distance, pour les étiquettes à garder lisibles à n'importe quelle distance.
---Source : lua/ge/extensions/editor/toolUtilities/render/markup.lua:33
---@param pos vec3 Position.
---@param text string Texte.
function editor_toolUtilities_render_markup.drawMarkupUnculled(pos, text) end

--- Étiquette « [Active Surface (2D)] ».
---Source : lua/ge/extensions/editor/toolUtilities/render/markup.lua:79
---@param pos vec3 Position.
function editor_toolUtilities_render_markup.markupActiveSurf(pos) end

--- Invite « [Click To Add Node] ».
---Source : lua/ge/extensions/editor/toolUtilities/render/markup.lua:59
---@param pos vec3 Position.
function editor_toolUtilities_render_markup.markupAddNode(pos) end

--- Invite « [Add Pair: Click 1st Node] ».
---Source : lua/ge/extensions/editor/toolUtilities/render/markup.lua:70
---@param pos vec3 Position.
function editor_toolUtilities_render_markup.markupAddPairLeft(pos) end

--- Invite « [Click To Add Node. Double-Click To Finish] ».
---Source : lua/ge/extensions/editor/toolUtilities/render/markup.lua:67
---@param pos vec3 Position.
function editor_toolUtilities_render_markup.markupAddPolygonNode(pos) end

--- Invite de réglage de hauteur (glisser, SHIFT pour la précision).
---Source : lua/ge/extensions/editor/toolUtilities/render/markup.lua:63
---@param pos vec3 Position.
function editor_toolUtilities_render_markup.markupAdjustBar(pos) end

--- Invite de réglage de profondeur (glisser, SHIFT pour la précision).
---Source : lua/ge/extensions/editor/toolUtilities/render/markup.lua:64
---@param pos vec3 Position.
function editor_toolUtilities_render_markup.markupAdjustDepth(pos) end

--- Invite de réglage de largeur (glisser, SHIFT pour la précision).
---Source : lua/ge/extensions/editor/toolUtilities/render/markup.lua:62
---@param pos vec3 Position.
function editor_toolUtilities_render_markup.markupAdjustWidth(pos) end

--- Affiche distance (m) et angle (converti de radians en degrés).
---Source : lua/ge/extensions/editor/toolUtilities/render/markup.lua:96
---@param pos vec3 Position.
---@param dist number Distance en mètres.
---@param angleRad number Angle en radians.
function editor_toolUtilities_render_markup.markupAngleAndDistance(pos, dist, angleRad) end

--- Affiche distance, angle (degrés) et écart d'altitude dZ.
---Source : lua/ge/extensions/editor/toolUtilities/render/markup.lua:97
---@param pos vec3 Position.
---@param dist number Distance en mètres.
---@param angleRad number Angle en radians.
---@param elevDiff number Écart d'altitude en mètres.
function editor_toolUtilities_render_markup.markupAngleDistanceWithElevation(pos, dist, angleRad, elevDiff) end

--- Affiche « [d = x.xx m] ».
---Source : lua/ge/extensions/editor/toolUtilities/render/markup.lua:66
---@param pos vec3 Position.
---@param d number Profondeur en mètres.
function editor_toolUtilities_render_markup.markupDepthDisplay(pos, d) end

--- Invite « [Click To Select, Drag To Move] ».
---Source : lua/ge/extensions/editor/toolUtilities/render/markup.lua:54
---@param pos vec3 Position.
function editor_toolUtilities_render_markup.markupDrag(pos) end

--- Affiche « [Elevation = x.xx m] » sans filtre de distance (une seule, sur le nœud sélectionné).
---Source : lua/ge/extensions/editor/toolUtilities/render/markup.lua:82
---@param pos vec3 Position.
---@param elev number Élévation en mètres.
function editor_toolUtilities_render_markup.markupElevation(pos, elev) end

--- Étiquette « [End] » en couleurs inversées.
---Source : lua/ge/extensions/editor/toolUtilities/render/markup.lua:69
---@param pos vec3 Position.
function editor_toolUtilities_render_markup.markupEnd(pos) end

--- Invite « [Click NavGraph Node To Add To Path] ».
---Source : lua/ge/extensions/editor/toolUtilities/render/markup.lua:86
---@param pos vec3 Position.
function editor_toolUtilities_render_markup.markupGraphFreeSpace(pos) end

--- Invite « [Click To Add/Remove From Path] ».
---Source : lua/ge/extensions/editor/toolUtilities/render/markup.lua:85
---@param pos vec3 Position.
function editor_toolUtilities_render_markup.markupGraphNodeHover(pos) end

--- Invite « [Click To Insert Node] ».
---Source : lua/ge/extensions/editor/toolUtilities/render/markup.lua:60
---@param pos vec3 Position.
function editor_toolUtilities_render_markup.markupInsertNode(pos) end

--- Invite « [Hold CTRL + Drop To Join] ».
---Source : lua/ge/extensions/editor/toolUtilities/render/markup.lua:91
---@param pos vec3 Position.
function editor_toolUtilities_render_markup.markupJoin(pos) end

--- Plusieurs lignes jointes par saut de ligne en une seule étiquette filtrée. Sans effet si la liste est vide.
---Source : lua/ge/extensions/editor/toolUtilities/render/markup.lua:44
---@param pos vec3 Position.
---@param lines string[] Lignes de texte.
function editor_toolUtilities_render_markup.markupLines(pos, lines) end

--- Message « [Linked Spline - Cannot Add Nodes] ».
---Source : lua/ge/extensions/editor/toolUtilities/render/markup.lua:92
---@param pos vec3 Position.
function editor_toolUtilities_render_markup.markupLinkedSplineCannotAdd(pos) end

--- Invite « [Linked — Drag Away Or Use Detach Button] ».
---Source : lua/ge/extensions/editor/toolUtilities/render/markup.lua:55
---@param pos vec3 Position.
function editor_toolUtilities_render_markup.markupLinkedTip(pos) end

--- Invite « [Hold CTRL + Drop To Form Loop] ». La suite masterSpline conditionne jonctions et boucles à CTRL : l'aperçu s'affiche dès qu'un candidat existe, mais le relâchement ne valide que CTRL enfoncé.
---Source : lua/ge/extensions/editor/toolUtilities/render/markup.lua:90
---@param pos vec3 Position.
function editor_toolUtilities_render_markup.markupLoop(pos) end

--- Message « [Looped Spline - Cannot Add Here] ».
---Source : lua/ge/extensions/editor/toolUtilities/render/markup.lua:93
---@param pos vec3 Position.
function editor_toolUtilities_render_markup.markupLoopedSplineCannotAdd(pos) end

--- Étiquette « Node [1] ».
---Source : lua/ge/extensions/editor/toolUtilities/render/markup.lua:73
---@param pos vec3 Position.
function editor_toolUtilities_render_markup.markupNode1(pos) end

--- Étiquette « Node [2] ».
---Source : lua/ge/extensions/editor/toolUtilities/render/markup.lua:74
---@param pos vec3 Position.
function editor_toolUtilities_render_markup.markupNode2(pos) end

--- Étiquette « Node [3] ».
---Source : lua/ge/extensions/editor/toolUtilities/render/markup.lua:75
---@param pos vec3 Position.
function editor_toolUtilities_render_markup.markupNode3(pos) end

--- Affiche « [Obstacle: x.x m] ».
---Source : lua/ge/extensions/editor/toolUtilities/render/markup.lua:94
---@param pos vec3 Position.
---@param dist number Distance en mètres.
function editor_toolUtilities_render_markup.markupObstacleDistance(pos, dist) end

--- Affiche la distance à l'obstacle et l'écart d'altitude dZ.
---Source : lua/ge/extensions/editor/toolUtilities/render/markup.lua:95
---@param pos vec3 Position.
---@param dist number Distance en mètres.
---@param elevDiff number Écart d'altitude en mètres.
function editor_toolUtilities_render_markup.markupObstacleDistanceWithElevation(pos, dist, elevDiff) end

--- Étiquette « [Pair: First Node] ».
---Source : lua/ge/extensions/editor/toolUtilities/render/markup.lua:71
---@param pos vec3 Position.
function editor_toolUtilities_render_markup.markupPairFirstNode(pos) end

--- Invite : clic gauche ajoute le 2e nœud, clic droit annule la paire.
---Source : lua/ge/extensions/editor/toolUtilities/render/markup.lua:72
---@param pos vec3 Position.
function editor_toolUtilities_render_markup.markupPairSecondNode(pos) end

--- Étiquette « Path Node [i] ».
---Source : lua/ge/extensions/editor/toolUtilities/render/markup.lua:87
---@param pos vec3 Position.
---@param i integer Numéro du nœud.
function editor_toolUtilities_render_markup.markupPathNode(pos, i) end

--- Invite du curseur : texte non filtré.
---Source : lua/ge/extensions/editor/toolUtilities/render/markup.lua:43
---@param pos vec3 Position.
---@param text string Texte.
function editor_toolUtilities_render_markup.markupPrompt(pos, text) end

--- Étiquette « [Length = x.xx m] » en couleurs inversées.
---Source : lua/ge/extensions/editor/toolUtilities/render/markup.lua:61
---@param pos vec3 Position.
---@param l number Longueur en mètres.
function editor_toolUtilities_render_markup.markupRoadLength(pos, l) end

--- Invite « [Select A Spline Or Click 'Add'] ».
---Source : lua/ge/extensions/editor/toolUtilities/render/markup.lua:58
---@param pos vec3 Position.
function editor_toolUtilities_render_markup.markupSelectOrAdd(pos) end

--- Invite « [Click To Select Spline] ».
---Source : lua/ge/extensions/editor/toolUtilities/render/markup.lua:56
---@param pos vec3 Position.
function editor_toolUtilities_render_markup.markupSelectSpline(pos) end

--- Même étiquette pour l'élément en cours d'édition, non filtrée.
---Source : lua/ge/extensions/editor/toolUtilities/render/markup.lua:78
---@param pos vec3 Position.
---@param str string Nom.
function editor_toolUtilities_render_markup.markupSelectedName(pos, str) end

--- Invite « [Spline Disabled. Cannot Edit] ».
---Source : lua/ge/extensions/editor/toolUtilities/render/markup.lua:57
---@param pos vec3 Position.
function editor_toolUtilities_render_markup.markupSelectedSplineDisabled(pos) end

--- Nom de spline entre crochets, filtré à 250 m.
---Source : lua/ge/extensions/editor/toolUtilities/render/markup.lua:76
---@param pos vec3 Position.
---@param str string Nom.
function editor_toolUtilities_render_markup.markupSplineName(pos, str) end

--- Dessine chaque ligne comme une étiquette séparée à la même position (elles se superposent).
---Source : lua/ge/extensions/editor/toolUtilities/render/markup.lua:48
---@param pos vec3 Position.
---@param lines string[] Lignes de texte.
function editor_toolUtilities_render_markup.markupStack(pos, lines) end

--- Étiquette « [Start] » en couleurs inversées.
---Source : lua/ge/extensions/editor/toolUtilities/render/markup.lua:68
---@param pos vec3 Position.
function editor_toolUtilities_render_markup.markupStart(pos) end

--- Texte simple filtré.
---Source : lua/ge/extensions/editor/toolUtilities/render/markup.lua:42
---@param pos vec3 Position.
---@param text string Texte.
function editor_toolUtilities_render_markup.markupText(pos, text) end

--- Affiche « [Twist Angle = x.xx deg] ».
---Source : lua/ge/extensions/editor/toolUtilities/render/markup.lua:83
---@param pos vec3 Position.
---@param angleDeg number Angle en degrés.
function editor_toolUtilities_render_markup.markupTwistAngle(pos, angleDeg) end

--- Affiche « [Limit|Velocity = x.xx unité] ».
---Source : lua/ge/extensions/editor/toolUtilities/render/markup.lua:84
---@param pos vec3 Position.
---@param vel number Valeur.
---@param isBarsLimit boolean true : libellé Limit, false : Velocity.
---@param unitsStr string Unité affichée.
function editor_toolUtilities_render_markup.markupVelocity(pos, vel, isBarsLimit, unitsStr) end

--- Étiquette « [Active Volume (3D)] ».
---Source : lua/ge/extensions/editor/toolUtilities/render/markup.lua:80
---@param pos vec3 Position.
function editor_toolUtilities_render_markup.markupVolume(pos) end

--- Affiche « [Width = x.xx m] ».
---Source : lua/ge/extensions/editor/toolUtilities/render/markup.lua:65
---@param pos vec3 Position.
---@param w number Largeur en mètres.
function editor_toolUtilities_render_markup.markupWidthDisplay(pos, w) end

