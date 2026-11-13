---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/engineeredGeom.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Géométrie de route « d'ingénieur » pour les outils d'édition de splines de l'éditeur : transforme la polyligne des noeuds d'une spline en axe ligne - clothoïde - arc - clothoïde - ligne (virages arrondis à rayon adaptatif, profil vertical lissé, élargissement dans les virages serrés). Les outils l'appellent via sampleInto selon group.geometryMode ('engineered' ou 'spline'). Il remplit divPoints, divWidths, normals, divCurv et discMap de la spline, puis calcule le repère de Frenet via geom.computeFrenetFrame.
--- Accès : extension `editor_toolUtilities_engineeredGeom` : `extensions.load("editor_toolUtilities_engineeredGeom")`, puis la globale `editor_toolUtilities_engineeredGeom`
---@class editor_toolUtilities_engineeredGeom
---@field CONTROLS table Métadonnées pour l'inspecteur, afin que tous les outils affichent les mêmes curseurs : radius, transition, vertical, widthTaper, widenAmount (chacun avec key, default, min, max, fmt, label, tooltip) et les infobulles toggleTooltip, modeEngTip, modeSmoothTip.
---@field DEFAULT_MIN_R number Rayon plancher d'un virage (8.0 m).
editor_toolUtilities_engineeredGeom = {}

--- Complète un groupe avec les champs du mode ingénieur uniquement s'ils sont nil (geometryMode = 'spline', engRadiusM, engTransM, engVertLenM, curveWidenMaxM, curveWidenRunoffM, corners = {}). À appeler à la création d'un groupe et à la désérialisation de sessions anciennes.
---Source : lua/ge/extensions/editor/toolUtilities/engineeredGeom.lua:574
---@param group table Groupe modifié sur place.
function editor_toolUtilities_engineeredGeom.applyDefaults(group) end

--- Construit l'axe en plan de la spline à partir de ses noeuds (virages à clothoïdes), puis le profil vertical selon zMode, et met à jour spline.divPoints, divWidths, normals, divCurv, discMap avant d'appeler geom.computeFrenetFrame. Ne renvoie rien (sauf pour le repli Catmull-Rom).
---Source : lua/ge/extensions/editor/toolUtilities/engineeredGeom.lua:290
---@param spline table Spline avec nodes, widths, nmls, divPoints, divWidths, normals, discMap (et optionnellement isLoop, corners).
---@param p table|nil { R, Ls, minR, minAngleDeg, stepM, lonRes, vertLen, deckZ, maxStep, levelStart, levelFinish, zMode = 'free'|'raycast'|'conform' }.
function editor_toolUtilities_engineeredGeom.buildCenterline(spline, p) end

--- Enveloppe de buildCenterline avec zMode = 'conform' (axe conforme au terrain).
---Source : lua/ge/extensions/editor/toolUtilities/engineeredGeom.lua:556
---@param spline table Spline.
---@param p table|nil Paramètres (voir buildCenterline) ; p.zMode est écrasé.
function editor_toolUtilities_engineeredGeom.buildCenterlineConform(spline, p) end

--- Enveloppe de buildCenterline avec zMode = 'free' (hauteurs des noeuds libres).
---Source : lua/ge/extensions/editor/toolUtilities/engineeredGeom.lua:548
---@param spline table Spline.
---@param p table|nil Paramètres (voir buildCenterline) ; p.zMode est écrasé.
function editor_toolUtilities_engineeredGeom.buildCenterlineFree(spline, p) end

--- Enveloppe de buildCenterline avec zMode = 'raycast' (axe posé sur le terrain par lancer de rayon).
---Source : lua/ge/extensions/editor/toolUtilities/engineeredGeom.lua:552
---@param spline table Spline.
---@param p table|nil Paramètres (voir buildCenterline) ; p.zMode est écrasé.
function editor_toolUtilities_engineeredGeom.buildCenterlineRaycast(spline, p) end

--- Dessine en debugDrawer, pour un groupe en mode ingénieur : le polygone des noeuds (guide fin), une sphère sur chaque noeud intérieur et l'axe résultant coloré par courbure (turquoise en ligne droite, ambre au virage le plus serré). Fondu selon la distance caméra (plein sous 90 m, invisible au-delà de 550 m). Sans effet hors mode 'engineered' ou avec moins de 2 noeuds.
---Source : lua/ge/extensions/editor/toolUtilities/engineeredGeom.lua:603
---@param group table|nil Groupe/spline à dessiner.
function editor_toolUtilities_engineeredGeom.drawControlPolygon(group) end

--- Point d'entrée unique d'échantillonnage selon group.geometryMode. En mode 'engineered', appelle buildCenterline avec les champs eng* du groupe et renvoie true. Sinon, met group.divCurv à nil et renvoie false pour que l'outil lance son propre échantillonneur geom.catmullRom*.
---Source : lua/ge/extensions/editor/toolUtilities/engineeredGeom.lua:591
---@param group table Groupe/spline avec geometryMode, engRadiusM, engTransM, engVertLenM.
---@param opts table|nil { zMode = 'free'|'raycast'|'conform' (défaut 'free'), lonRes, deckZ, maxStep, minR, levelStart, levelFinish }. levelStart/levelFinish : en mode free, cette extrémité rejoint une plateforme plate, le profil arrive à plat.
---@return boolean  true si le mode ingénieur a échantillonné, false si l'appelant doit le faire.
function editor_toolUtilities_engineeredGeom.sampleInto(group, opts) end

--- Auto-test manuel : construit un virage de 90 degrés (R 30, Ls 20) et journalise le nombre de points, l'écart max entre points et le coude max par pas.
---Source : lua/ge/extensions/editor/toolUtilities/engineeredGeom.lua:657
---@return integer  Nombre de points d'axe générés.
function editor_toolUtilities_engineeredGeom.selfTest() end

--- Résout la géométrie d'un virage au noeud pI : déviation signée, rayon, longueur de spirale (réduite à R*|delta| si trop longue), angle de spirale, angle d'arc et distance tangente T absorbée sur chaque ligne droite voisine. Travaille en plan (x, y). Renvoie { through = true, T = 0 } si un segment est quasi nul ou si la déviation est inférieure à minAngle.
---Source : lua/ge/extensions/editor/toolUtilities/engineeredGeom.lua:62
---@param pPrev vec3 Noeud précédent.
---@param pI vec3 Noeud du virage (point d'intersection).
---@param pNext vec3 Noeud suivant.
---@param R number Rayon d'arc voulu (m).
---@param Ls number Longueur de spirale voulue (m).
---@param minAngle number Déviation minimale (rad) sous laquelle aucun arrondi n'est fait.
---@return table  { through, delta, absD, turn (+1 gauche, -1 droite), R, Ls, thetaS, arc, T }.
function editor_toolUtilities_engineeredGeom.solveCorner(pPrev, pI, pNext, R, Ls, minAngle) end

