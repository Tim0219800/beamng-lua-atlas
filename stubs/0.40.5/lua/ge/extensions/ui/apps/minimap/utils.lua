---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/apps/minimap/utils.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Utilitaires partagés de la mini-carte : conversion coordonnées monde / carte (transformation affine recalculée à chaque setMinimapState), recadrage dans les limites de la carte (cercle ou carré), dessin de formes simples (cercle, ligne, pointeur de bord, grille de 50 m) et palettes de couleurs (Default, Monochrome, Green, Blue, Orange, Grayscale). Le module minimap appelle setMinimapState à chaque frame ; les autres modules (roads, route, vehicles) s'en servent pour dessiner. Un moddeur qui ajoute un marqueur sur la minimap utilise surtout simpleCircleWithEdgePointer et worldToMapXY.
--- Accès : extension `ui_apps_minimap_utils` : `extensions.load("ui_apps_minimap_utils")`, puis la globale `ui_apps_minimap_utils`
---@class ui_apps_minimap_utils
---@field centerPointer nil Exporté à partir d'une variable locale qui n'existe pas : vaut toujours nil.
---@field colors table<string, color> Couleurs exposées : orange, orangeMuted, grayMuted, roadBgTransparentBlack, navBgBlack, gridWhite, navBgWhite, navFgBlue.
---@field dpi number Facteur d'échelle d'écran de la minimap, mis à jour par setMinimapState (1 au départ).
ui_apps_minimap_utils = {}

--- Recadre pos (modifié sur place) dans le rectangle de la carte élargi de buffer.
---Source : lua/ge/extensions/ui/apps/minimap/utils.lua:152
---@param pos vec3 Point carte, modifié.
---@param buffer number|nil Marge en pixels (0 par défaut).
function ui_apps_minimap_utils.clampToMinimapBounds(pos, buffer) end

--- Dessine un pointeur sur le bord de la carte pour une position monde hors de la carte (couche ROUTE_POINTER). Ne dessine rien et renvoie false si la position est à l'intérieur.
---Source : lua/ge/extensions/ui/apps/minimap/utils.lua:213
---@param pos vec3 Position monde visée.
---@param fill color|nil Couleur de remplissage.
---@param strikeClr color|nil Ignoré (contour toujours blanc).
---@param radius number|nil Rayon en pixels (6 par défaut).
---@param maxDistance number|nil Distance max pour afficher le pointeur (illimitée par défaut).
---@return boolean  true si un pointeur a été dessiné.
function ui_apps_minimap_utils.drawEdgePointer(pos, fill, strikeClr, radius, maxDistance) end

--- Dessine une grille de fond avec un trait tous les 50 m monde, sur la couche BG_GRID, autour de la caméra.
---Source : lua/ge/extensions/ui/apps/minimap/utils.lua:251
function ui_apps_minimap_utils.drawGrid() end

--- Renvoie le jeu de couleurs actif (l'indice par défaut).
---Source : lua/ge/extensions/ui/apps/minimap/utils.lua:385
---@return table  Jeu de couleurs courant.
function ui_apps_minimap_utils.getCurrentStyleColors() end

--- Renvoie l'indice du jeu de couleurs par défaut (toujours 1).
---Source : lua/ge/extensions/ui/apps/minimap/utils.lua:380
---@return integer  Indice.
function ui_apps_minimap_utils.getDefaultStyleColorSet() end

--- Renvoie la liste des jeux de couleurs (Default, Monochrome, Green, Blue, Orange, Grayscale) avec color, colorLow, colorLowest, clrFocus, clrFocusMuted, gridWhite, navFg, navBg, grayMuted.
---Source : lua/ge/extensions/ui/apps/minimap/utils.lua:375
---@return table<integer, table>  Tableau de jeux de couleurs.
function ui_apps_minimap_utils.getStyleColorSet() end

--- Renvoie les six coefficients de la transformation affine monde vers carte, à passer aux fonctions de dessin transformé du td.
---Source : lua/ge/extensions/ui/apps/minimap/utils.lua:108
---@return number  XX.
---@return number  XYCoef.
---@return number  YX.
---@return number  YY.
---@return number  XOffset.
---@return number  YOffset.
function ui_apps_minimap_utils.getWorldToMapTransform() end

--- Teste si un point carte est dans le rectangle de la carte, éventuellement réduit d'une marge.
---Source : lua/ge/extensions/ui/apps/minimap/utils.lua:144
---@param pos vec3 Point carte.
---@param buffer number|nil Marge intérieure en pixels (0 par défaut).
---@return boolean  true si strictement à l'intérieur.
function ui_apps_minimap_utils.isInsideMinimapBounds(pos, buffer) end

--- Convertit un point de la carte (pixels) en point monde (z = 0 avant ajout de la position caméra).
---Source : lua/ge/extensions/ui/apps/minimap/utils.lua:135
---@param p vec3 Point carte.
---@return vec3  Point monde.
function ui_apps_minimap_utils.mapToWorld(p) end

--- Ramène pos (modifié sur place) sur le bord de la carte (cercle de rayon width/2 - inset en mode circle, rectangle sinon) en conservant la direction depuis le centre.
---Source : lua/ge/extensions/ui/apps/minimap/utils.lua:159
---@param pos vec3 Point carte, modifié.
---@param inset number|nil Retrait depuis le bord en pixels (0 par défaut).
---@param maxDistance number|nil Non utilisé.
---@return vec3  pos.
---@return boolean  true si le point a été ramené sur le bord.
function ui_apps_minimap_utils.setClampToBounds(pos, inset, maxDistance) end

--- Reçoit de la minimap principale la taille, le centre, la caméra, l'échelle, l'objet de dessin, le décalage, le mode (circle par défaut ou carré) et le dpi, puis recalcule les coefficients de transformation monde vers carte.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/apps/minimap/utils.lua:37
---@param w number Largeur de la carte en pixels.
---@param h number Hauteur de la carte en pixels.
---@param cx number Centre X de la carte.
---@param cy number Centre Y de la carte.
---@param cp vec3 Position de la caméra (monde).
---@param cr quat Rotation de la caméra.
---@param cri quat Rotation inverse de la caméra.
---@param s number Échelle : mètres par pixel.
---@param si number Inverse de l'échelle.
---@param textureDraw table Objet de dessin (circleMarker, edgePointer, line, lineRoundEndTransformed…).
---@param ox number|nil Décalage horizontal de la carte (0 par défaut).
---@param oy number|nil Décalage vertical de la carte (0 par défaut).
---@param minimapMode string|nil 'circle' (défaut) ou autre pour une carte carrée/rectangulaire.
---@param dpi number|nil Facteur dpi (1 par défaut).
function ui_apps_minimap_utils.setMinimapState(w, h, cx, cy, cp, cr, cri, s, si, textureDraw, ox, oy, minimapMode, dpi) end

--- Dessine un marqueur circulaire à une position monde, sur la couche GAMEPLAY_MARKERS (orange et contour blanc par défaut).
---Source : lua/ge/extensions/ui/apps/minimap/utils.lua:203
---@param pos vec3 Position monde.
---@param fill color|nil Couleur de remplissage.
---@param strikeClr color|nil Couleur du contour.
---@param radius number|nil Rayon en pixels (6 par défaut).
function ui_apps_minimap_utils.simpleCircle(pos, fill, strikeClr, radius) end

--- Dessine un pointeur de bord si la position est hors carte, sinon un cercle simple à cette position.
---Source : lua/ge/extensions/ui/apps/minimap/utils.lua:217
---@param pos vec3 Position monde.
---@param fill color|nil Remplissage.
---@param strikeClr color|nil Contour.
---@param radius number|nil Rayon (6 par défaut).
function ui_apps_minimap_utils.simpleCircleWithEdgePointer(pos, fill, strikeClr, radius) end

--- Dessine un segment à extrémités rondes entre deux positions monde, sur la couche GAMEPLAY_MARKERS.
---Source : lua/ge/extensions/ui/apps/minimap/utils.lua:207
---@param pos1 vec3 Départ monde.
---@param pos2 vec3 Arrivée monde.
---@param fill color|nil Couleur de remplissage.
---@param strikeClr color|nil Couleur du contour.
function ui_apps_minimap_utils.simpleLine(pos1, pos2, fill, strikeClr) end

--- Utilise le milieu du segment : pointeur de bord s'il est hors carte, sinon ligne simple.
---Source : lua/ge/extensions/ui/apps/minimap/utils.lua:224
---@param pos1 vec3 Départ monde.
---@param pos2 vec3 Arrivée monde.
---@param fill color|nil Remplissage.
---@param strikeClr color|nil Contour.
function ui_apps_minimap_utils.simpleLineWithEdgePointer(pos1, pos2, fill, strikeClr) end

--- Convertit les deux extrémités d'un segment monde en coordonnées carte.
---Source : lua/ge/extensions/ui/apps/minimap/utils.lua:101
---@param x1 number X monde de A.
---@param y1 number Y monde de A.
---@param x2 number X monde de B.
---@param y2 number Y monde de B.
---@return number  X carte de A.
---@return number  Y carte de A.
---@return number  X carte de B.
---@return number  Y carte de B.
function ui_apps_minimap_utils.worldLineToMapXY(x1, y1, x2, y2) end

--- Convertit un point monde en point carte (version allouante, recalculée avec soustraction, division par l'échelle et rotation). Préférer worldToMapXY pour les boucles.
---Source : lua/ge/extensions/ui/apps/minimap/utils.lua:73
---@param p vec3 Point monde.
---@return vec3  Point carte (z = 0).
function ui_apps_minimap_utils.worldToMap(p) end

--- Convertit des coordonnées monde (x, y) en coordonnées carte.
---Source : lua/ge/extensions/ui/apps/minimap/utils.lua:96
---@param x number X monde.
---@param y number Y monde.
---@return number  X carte.
---@return number  Y carte.
function ui_apps_minimap_utils.worldToMapXY(x, y) end

--- Convertit source (x, y monde) en coordonnées carte et les écrit dans target (z = 0), sans allocation.
---Source : lua/ge/extensions/ui/apps/minimap/utils.lua:87
---@param target vec3 Vecteur de sortie (peut être le même que source).
---@param source vec3 Point monde.
function ui_apps_minimap_utils.worldToMapXYZ(target, source) end

