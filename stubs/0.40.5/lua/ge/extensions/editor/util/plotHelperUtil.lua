---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/util/plotHelperUtil.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Instance de graphique.
---@class editor_util_plotHelperUtil
local editor_util_plotHelperUtil = {}

--- Méthode principale à appeler à chaque mise à jour graphique, dans une fenêtre imgui : gère la souris, crée un child imgui et dessine grille, données, courbe Catmull-Rom, réticule et annotations.
---Source : lua/ge/extensions/editor/util/plotHelperUtil.lua:230
---@param width number Largeur en pixels.
---@param height number Hauteur en pixels.
---@param dt number Delta de temps.
function editor_util_plotHelperUtil:draw(width, height, dt) end

--- Dessine la courbe Catmull-Rom calculée.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/util/plotHelperUtil.lua:368
function editor_util_plotHelperUtil:drawCatmullSpline() end

--- Dessine les points de chaque série (couleur de série ou rainbowColor).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/util/plotHelperUtil.lua:500
function editor_util_plotHelperUtil:drawData() end

--- Dessine la grille et les étiquettes des axes.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/util/plotHelperUtil.lua:402
function editor_util_plotHelperUtil:drawGridAndAxesLabels() end

--- Génère les points de la courbe Catmull-Rom pour chaque série (adapté de lua/vehicle/ve_utils.lua, modifié pour plusieurs y) ; séries de moins de 2 points ignorées, séries de 2 points copiées telles quelles.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/util/plotHelperUtil.lua:324
function editor_util_plotHelperUtil:generateCatmullSplinePoints() end

--- Calcule l'incrément de graduation (1, 2 ou 5 selon l'ordre de grandeur) le plus proche du nombre de graduations voulu.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/util/plotHelperUtil.lua:485
---@param ticks integer Nombre de graduations visé.
---@param range number Étendue de l'axe.
---@return number  Incrément.
function editor_util_plotHelperUtil:getOptimalTickIncrement(ticks, range) end

--- Renvoie l'exposant x de num écrit a * 10^x.
---Source : lua/ge/extensions/editor/util/plotHelperUtil.lua:599
---@param num number Nombre non nul.
---@return integer  floor(log10(abs(num))).
function editor_util_plotHelperUtil:getOrderOfMagnitude(num) end

--- Coordonnées imgui (espace écran) d'un point du graphe ; nil si le point est hors bornes, sauf avec clampVal (valeurs bornées à 0..1).
---Source : lua/ge/extensions/editor/util/plotHelperUtil.lua:555
---@param x number Valeur x du graphe.
---@param y number Valeur y du graphe.
---@param clampVal boolean|nil Borner dans le graphe.
---@return ImVec2|nil  Position écran.
function editor_util_plotHelperUtil:graphPtToImSS(x, y, clampVal) end

--- Coordonnées imgui (espace fenêtre) d'un point du graphe ; nil si hors bornes.
---Source : lua/ge/extensions/editor/util/plotHelperUtil.lua:580
---@param x number Valeur x du graphe.
---@param y number Valeur y du graphe.
---@return ImVec2|nil  Position fenêtre.
function editor_util_plotHelperUtil:graphPtToImWS(x, y) end

--- Initialise le graphique. params.scale = {xMin, xMax, yMin, yMax}, params.initData, params.autoScale, params.showCatmullRomCurve, params.catmullromCurveLines (> 200 conseillé), params.allowZoom, pointSize, pointThickness, formatX, formatY.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/util/plotHelperUtil.lua:34
---@param params table|nil Options (voir description).
function editor_util_plotHelperUtil:init(params) end

--- Déplace le graphe quand on glisse avec le bouton gauche (le clic initial doit être dans le graphe).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/util/plotHelperUtil.lua:181
---@param dt number Delta de temps (inutilisé).
function editor_util_plotHelperUtil:moveGraph(dt) end

--- Coordonnées imgui (espace écran) depuis des coordonnées normalisées : (0,0) bas gauche, (1,1) haut droite.
---Source : lua/ge/extensions/editor/util/plotHelperUtil.lua:550
---@param x number 0 à 1.
---@param y number 0 à 1.
---@return ImVec2  Position écran.
function editor_util_plotHelperUtil:normToImSS(x, y) end

--- Comme normToImSS mais en espace fenêtre.
---Source : lua/ge/extensions/editor/util/plotHelperUtil.lua:575
---@param x number 0 à 1.
---@param y number 0 à 1.
---@return ImVec2  Position fenêtre.
function editor_util_plotHelperUtil:normToImWS(x, y) end

--- Affiche des lignes de texte en surimpression en haut à gauche du graphe.
---Source : lua/ge/extensions/editor/util/plotHelperUtil.lua:311
---@param lines string[]|nil Lignes de texte.
function editor_util_plotHelperUtil:overlayTextLines(lines) end

--- Arrondit num à dec décimales.
---Source : lua/ge/extensions/editor/util/plotHelperUtil.lua:592
---@param num number Valeur.
---@param dec integer Nombre de décimales.
---@return number  Valeur arrondie.
function editor_util_plotHelperUtil:roundToDigits(num, dec) end

--- Ajuste le domaine et la plage pour contenir tous les points, avec 10 % de marge de chaque côté. Sans effet sans données.
---Source : lua/ge/extensions/editor/util/plotHelperUtil.lua:136
function editor_util_plotHelperUtil:scaleToFitData() end

--- Convertit une fraction normalisée x (0..1) en valeur x du graphe selon l'échelle courante.
---Source : lua/ge/extensions/editor/util/plotHelperUtil.lua:603
---@param x number 0 à 1.
---@return number  Valeur x.
function editor_util_plotHelperUtil:scaleX(x) end

--- Convertit une fraction normalisée y (0..1) en valeur y du graphe selon l'échelle courante.
---Source : lua/ge/extensions/editor/util/plotHelperUtil.lua:604
---@param y number 0 à 1.
---@return number  Valeur y.
function editor_util_plotHelperUtil:scaleY(y) end

--- Définit les annotations verticales : liste de paires {x, libellé}, tracées comme ligne et texte dans le graphe.
---Source : lua/ge/extensions/editor/util/plotHelperUtil.lua:131
---@param annotation table[]|nil Paires {x, label}.
function editor_util_plotHelperUtil:setAnnotationX(annotation) end

--- Définit les données au format {{x0, y0, y1, ...}, ...} (plusieurs valeurs y par x), converti en séries puis passé à setDataMulti.
---Source : lua/ge/extensions/editor/util/plotHelperUtil.lua:80
---@param data number[][] Lignes {x, y1, y2...}.
function editor_util_plotHelperUtil:setData(data) end

--- Définit les données par série : data[serie] = liste de {x, y}. Recalcule l'échelle si autoScale, et les points Catmull-Rom si showCatmullRomCurve.
---Source : lua/ge/extensions/editor/util/plotHelperUtil.lua:94
---@param data table Séries de points {x, y}.
function editor_util_plotHelperUtil:setDataMulti(data) end

--- Définit les bornes du graphique ; chaque paramètre est facultatif (nil = inchangé).
---Source : lua/ge/extensions/editor/util/plotHelperUtil.lua:164
---@param xMin number|nil Borne gauche.
---@param xMax number|nil Borne droite.
---@param yMin number|nil Borne basse.
---@param yMax number|nil Borne haute.
function editor_util_plotHelperUtil:setScale(xMin, xMax, yMin, yMax) end

--- Définit les couleurs des séries au format {r, g, b, a} avec des valeurs de 0 à 1 (convertit en U32). Sans couleur, la série utilise rainbowColor.
---Source : lua/ge/extensions/editor/util/plotHelperUtil.lua:116
---@param colors number[][] Couleurs {r,g,b,a}.
function editor_util_plotHelperUtil:setSeriesColors(colors) end

--- Remplace directement la table de format des séries (name, color, uColor par série).
---Source : lua/ge/extensions/editor/util/plotHelperUtil.lua:127
---@param format table Formats par série.
function editor_util_plotHelperUtil:setSeriesFormat(format) end

--- Définit les noms des séries (liste) ; nom par défaut tostring(i).
---Source : lua/ge/extensions/editor/util/plotHelperUtil.lua:106
---@param names string[] Noms.
function editor_util_plotHelperUtil:setSeriesNames(names) end

--- Zoom à la molette selon la position de la souris ; sans effet si allowZoom est faux ou si la souris est hors du graphe.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/util/plotHelperUtil.lua:212
---@param dt number Delta de temps (le zoom en dépend).
function editor_util_plotHelperUtil:zoomGraph(dt) end

