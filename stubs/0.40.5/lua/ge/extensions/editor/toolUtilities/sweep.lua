---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/sweep.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Géométrie par balayage (loft) pour les outils de bâtiment de l'éditeur : une pièce est une section (polygone 2D en coordonnées (s, t)) et un chemin de repères (frames). Sert à tailler gouttières, tuyaux, coudes, conduits, colonnes montantes. Écrit des faces dans un accumulateur `p` via meshPart.face4 et meshPart.face3. Un repère est une origine et deux axes : le point (s, t) de la section tombe en o + a*s + b*t, donc la même section balayée le long de +X, de +Z ou d'un virage ressort bien orientée sans être réécrite.
--- Accès : extension `editor_toolUtilities_sweep` : `extensions.load("editor_toolUtilities_sweep")`, puis la globale `editor_toolUtilities_sweep`
---@class editor_toolUtilities_sweep
editor_toolUtilities_sweep = {}

--- Crée un point { x, y, z }.
---Source : lua/ge/extensions/editor/toolUtilities/sweep.lua:23
---@param x number X.
---@param y number Y.
---@param z number Z.
---@return table  Point { x, y, z }.
function editor_toolUtilities_sweep.P(x, y, z) end

--- Course le long de +X portant une section posée en (y, z).
---Source : lua/ge/extensions/editor/toolUtilities/sweep.lua:121
---@param x0 number X de départ.
---@param x1 number X d'arrivée.
---@return table  Deux repères.
function editor_toolUtilities_sweep.alongX(x0, x1) end

--- Course le long de +Y portant une section posée en (x, z).
---Source : lua/ge/extensions/editor/toolUtilities/sweep.lua:126
---@param y0 number Y de départ.
---@param y1 number Y d'arrivée.
---@return table  Deux repères.
function editor_toolUtilities_sweep.alongY(y0, y1) end

--- Course montante le long de +Z portant une section posée en (x, y), éventuellement décalée de l'axe.
---Source : lua/ge/extensions/editor/toolUtilities/sweep.lua:131
---@param z0 number Z de départ.
---@param z1 number Z d'arrivée.
---@param cx number|nil Décalage X (0 par défaut).
---@param cy number|nil Décalage Y (0 par défaut).
---@return table  Deux repères.
function editor_toolUtilities_sweep.alongZ(z0, z1, cx, cy) end

--- Point monde correspondant au point (s, t) de la section dans le repère f.
---Source : lua/ge/extensions/editor/toolUtilities/sweep.lua:30
---@param f table Repère.
---@param s number Coordonnée s.
---@param t number Coordonnée t.
---@return table  Point { x, y, z }.
function editor_toolUtilities_sweep.at(f, s, t) end

--- Section carrée autour de l'origine, ou rectangulaire si on donne une seconde demi-taille.
---Source : lua/ge/extensions/editor/toolUtilities/sweep.lua:165
---@param hx number Demi-taille en s.
---@param hy number|nil Demi-taille en t (= hx par défaut).
---@return table  4 points.
function editor_toolUtilities_sweep.boxSection(hx, hy) end

--- Boîte fermée (loft plus deux capuchons) étendue le long de X, section en (y, z).
---Source : lua/ge/extensions/editor/toolUtilities/sweep.lua:136
---@param p table Accumulateur de faces.
---@param x0 number X min.
---@param x1 number X max.
---@param y0 number Y min.
---@param y1 number Y max.
---@param z0 number Z min.
---@param z1 number Z max.
---@param uv number Échelle UV.
function editor_toolUtilities_sweep.boxX(p, x0, x1, y0, y1, z0, z1, uv) end

--- La même boîte, dressée et balayée sur Z. Un loft pose U autour de la section et V le long du chemin : les deux posent la texture d'une face à angle droit l'une de l'autre. À utiliser pour un matériau qui a un SENS (comme la brique, dont les assises ressortent debout avec boxX).
---Source : lua/ge/extensions/editor/toolUtilities/sweep.lua:147
---@param p table Accumulateur de faces.
---@param x0 number X min.
---@param x1 number X max.
---@param y0 number Y min.
---@param y1 number Y max.
---@param z0 number Z min.
---@param z1 number Z max.
---@param uv number Échelle UV.
function editor_toolUtilities_sweep.boxZ(p, x0, x1, y0, y1, z0, z1, uv) end

--- Ferme une extrémité d'un loft, orientée dans le sens du chemin (sgn 1) ou en sens inverse. Triangulation en éventail, donc section convexe uniquement.
---Source : lua/ge/extensions/editor/toolUtilities/sweep.lua:73
---@param p table Accumulateur de faces.
---@param sect table Section convexe.
---@param f table Repère de l'extrémité.
---@param sgn integer 1 ou -1 : sens de la normale.
---@param uv number Échelle UV.
function editor_toolUtilities_sweep.cap(p, sect, f, sgn, uv) end

--- Section circulaire de rayon r à n points, autour de l'origine.
---Source : lua/ge/extensions/editor/toolUtilities/sweep.lua:155
---@param r number Rayon.
---@param n integer Nombre de points.
---@return table  Liste de { s, t }.
function editor_toolUtilities_sweep.circleSection(r, n) end

--- Un repère d'un chemin balayé : le (s, t) de la section tombe en o + a*s + b*t.
---Source : lua/ge/extensions/editor/toolUtilities/sweep.lua:26
---@param ox number Origine X.
---@param oy number Origine Y.
---@param oz number Origine Z.
---@param ax number Axe a, X.
---@param ay number Axe a, Y.
---@param az number Axe a, Z.
---@param bx number Axe b, X.
---@param by number Axe b, Y.
---@param bz number Axe b, Z.
---@return table  Repère.
function editor_toolUtilities_sweep.fr(ox, oy, oz, ax, ay, az, bx, by, bz) end

--- Un coude dans le plan vertical : entre le long de +Z à l'origine, ressort en penchant vers -Y (vers l'extérieur du mur).
---Source : lua/ge/extensions/editor/toolUtilities/sweep.lua:213
---@param R number Rayon du coude.
---@param ang number Angle total en radians.
---@param segs integer Nombre de segments.
---@return table  segs + 1 repères.
function editor_toolUtilities_sweep.kinkPath(R, ang, segs) end

--- Balaye une section fermée le long d'un chemin de repères : un quad par arête de section et par pas. Les UV suivent la longueur d'arc de la section en travers et la distance parcourue en long, donc une pièce étirée par le placeur reste texturée en carrelage.
---Source : lua/ge/extensions/editor/toolUtilities/sweep.lua:47
---@param p table Accumulateur de faces (meshPart).
---@param sect table Section fermée, liste de { s, t }.
---@param path table Liste de repères.
---@param uv number Échelle UV.
function editor_toolUtilities_sweep.loft(p, sect, path, uv) end

--- Poteau octogonal dressé sur +Z entre deux hauteurs, fermé aux deux bouts (loft plus deux capuchons).
---Source : lua/ge/extensions/editor/toolUtilities/sweep.lua:178
---@param p table Accumulateur de faces.
---@param m number Distance du centre à un plat.
---@param z0 number Hauteur de départ.
---@param z1 number Hauteur d'arrivée.
---@param uv number Échelle UV.
function editor_toolUtilities_sweep.octPost(p, m, z0, z1, uv) end

--- OCTOGONE régulier autour de l'origine ; `m` va du centre à chacun des huit plats.
---Source : lua/ge/extensions/editor/toolUtilities/sweep.lua:171
---@param m number Distance du centre à un plat.
---@return table  8 points.
function editor_toolUtilities_sweep.octSection(m) end

--- Rectangle écrit en HUIT points (et non quatre), pris aux mêmes angles qu'un cercle de même nombre, pour fermer une plaque plate d'une section sur l'autre. Centré en (0, cy).
---Source : lua/ge/extensions/editor/toolUtilities/sweep.lua:194
---@param hx number Demi-largeur.
---@param hy number Demi-hauteur.
---@param cy number|nil Décalage du centre en t (0 par défaut).
---@return table  8 points.
function editor_toolUtilities_sweep.rect8(hx, hy, cy) end

--- Renvoie la section parcourue en sens inverse (les faces regarderont à l'intérieur).
---Source : lua/ge/extensions/editor/toolUtilities/sweep.lua:186
---@param sect table Section.
---@return table  Nouvelle section inversée.
function editor_toolUtilities_sweep.reversed(sect) end

--- La bande plate entre deux sections de même nombre de points, à un repère : l'embouchure d'un tuyau ouvert.
---Source : lua/ge/extensions/editor/toolUtilities/sweep.lua:86
---@param p table Accumulateur de faces.
---@param inner table Section intérieure.
---@param outer table Section extérieure.
---@param f table Repère.
---@param sgn integer Sens de la normale (1 ou -1).
---@param uv number Échelle UV.
function editor_toolUtilities_sweep.ring(p, inner, outer, f, sgn, uv) end

--- Balaye ENTRE deux sections de même nombre de points, un repère chacune : un rétrécissement de l'embouchure vers le col. Même quad par arête que le loft droit, mais chaque bout a sa forme.
---Source : lua/ge/extensions/editor/toolUtilities/sweep.lua:102
---@param p table Accumulateur de faces.
---@param s0 table Section de départ.
---@param s1 table Section d'arrivée (même nombre de points).
---@param f0 table Repère de départ.
---@param f1 table Repère d'arrivée.
---@param uv number Échelle UV.
function editor_toolUtilities_sweep.taper(p, s0, s1, f0, f1, uv) end

--- Quart de tour en plan : entre le long de +X à l'origine, sort vers `sy` sur Y. La section est portée sans se dérouler, donc une gouttière reste droite dans le virage.
---Source : lua/ge/extensions/editor/toolUtilities/sweep.lua:202
---@param R number Rayon du virage.
---@param sy number Côté du virage sur Y (signe).
---@param ang number Angle total en radians.
---@param segs integer Nombre de segments.
---@return table  segs + 1 repères.
function editor_toolUtilities_sweep.turnPath(R, sy, ang, segs) end

