---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/roadArchitect/utilities.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Boîte à outils du Road Architect : dessin de sphères/lignes de debug, détection de la souris sur le terrain ou sur un nœud, calculs de boîtes englobantes de routes, manipulation de chemins de fichiers, et nombreuses fonctions de géométrie 2D/3D (intersections, projections, cercle par 3 points, angles, rotations, slerp). Un moddeur peut réutiliser les fonctions géométriques pures ; les fonctions de dessin ou de souris supposent l'éditeur actif.
--- Accès : extension `editor_roadArchitect_utilities` : `extensions.load("editor_roadArchitect_utilities")`, puis la globale `editor_roadArchitect_utilities`
---@class editor_roadArchitect_utilities
editor_roadArchitect_utilities = {}

--- Petit angle entre deux vecteurs de longueur quelconque, en radians.
---Source : lua/ge/extensions/editor/roadArchitect/utilities.lua:494
---@param a vec3 Vecteur A.
---@param b vec3 Vecteur B.
---@return number  Angle dans [0, pi].
function editor_roadArchitect_utilities.angleBetweenVecs(a, b) end

--- Comme angleBetweenVecs après projection des vecteurs dans le plan XY.
---Source : lua/ge/extensions/editor/roadArchitect/utilities.lua:497
---@param a vec3 Vecteur A.
---@param b vec3 Vecteur B.
---@return number  Angle en radians.
function editor_roadArchitect_utilities.angleBetweenVecs2D(a, b) end

--- Ajuste un cercle 2D passant par trois points ; renvoie son centre.
---Source : lua/ge/extensions/editor/roadArchitect/utilities.lua:459
---@param p1 vec3 Point 1.
---@param p2 vec3 Point 2.
---@param p3 vec3 Point 3.
---@return vec3|nil  Centre du cercle, ou nil (avec un second nil) si les points sont quasi alignés.
function editor_roadArchitect_utilities.circle2DFrom3Points(p1, p2, p3) end

--- Angle 2D entre deux vecteurs dans le sens indiqué par le signe du produit vectoriel : renvoie l'angle si cross < 0, sinon 2*pi - angle.
---Source : lua/ge/extensions/editor/roadArchitect/utilities.lua:500
---@param v1 vec3 Premier vecteur.
---@param v2 vec3 Second vecteur.
---@return number  Angle dans [0, 2*pi].
function editor_roadArchitect_utilities.clockwiseAngleBetweenVecs2D(v1, v2) end

--- Boîte englobante 2D de tous les nœuds de toutes les routes.
---Source : lua/ge/extensions/editor/roadArchitect/utilities.lua:101
---@param roads table Liste des routes.
---@return table  {xMin, xMax, yMin, yMax}.
function editor_roadArchitect_utilities.computeAABB2DAllRoads(roads) end

--- Boîte englobante 2D des seuls nœuds listés dans le groupe. Si group est nil, utilise tous les nœuds de toutes les routes.
---Source : lua/ge/extensions/editor/roadArchitect/utilities.lua:117
---@param group table|nil Groupe avec list = {{r = nom, n = indice de nœud}}.
---@param roads table Liste des routes.
---@param map table<string, integer> Table nom -> indice de route.
---@return table  {xMin, xMax, yMin, yMax}.
function editor_roadArchitect_utilities.computeAABB2DGroup(group, roads, map) end

--- Trouve l'indice du point de division du renderData qui correspond à un nœud (comparaison 2D avec une tolérance). Renvoie 1 par défaut.
---Source : lua/ge/extensions/editor/roadArchitect/utilities.lua:287
---@param nIdx integer Indice du nœud.
---@param road table Route.
---@return integer  Indice de division.
function editor_roadArchitect_utilities.computeDivIndicesFromNode(nIdx, road) end

--- Calcule la longueur cumulée depuis le début de la route pour chaque point de division du renderData (en suivant la ligne centrale).
---Source : lua/ge/extensions/editor/roadArchitect/utilities.lua:232
---@param rD table renderData de la route.
---@return number[]  Longueurs cumulées en mètres (lengths[1] = 0).
function editor_roadArchitect_utilities.computeRoadLength(rD) end

--- Distance 2D entre deux points donnés par composantes.
---Source : lua/ge/extensions/editor/roadArchitect/utilities.lua:158
---@param x1 number x du point 1.
---@param y1 number y du point 1.
---@param x2 number x du point 2.
---@param y2 number y du point 2.
---@return number  Distance.
function editor_roadArchitect_utilities.distance2D(x1, y1, x2, y2) end

--- Affiche à une position deux textes de debug : le nom de la route et sa position dans la jonction automatique.
---Source : lua/ge/extensions/editor/roadArchitect/utilities.lua:57
---@param pos vec3 Position du texte.
---@param rName string Nom de route.
---@param rLie string Texte de position (lie).
function editor_roadArchitect_utilities.drawAutoJctMarkup(pos, rName, rLie) end

--- Comme drawSphere, avec la couleur des sphères de groupe.
---Source : lua/ge/extensions/editor/roadArchitect/utilities.lua:47
---@param pos vec3 Centre.
function editor_roadArchitect_utilities.drawGroupSphere(pos) end

--- Sphère de surbrillance de rayon donné.
---Source : lua/ge/extensions/editor/roadArchitect/utilities.lua:51
---@param pos vec3 Centre.
---@param rad number Rayon en mètres.
function editor_roadArchitect_utilities.drawHighlightSphereRad(pos, rad) end

--- Trace une ligne violette de debug (épaisseur 5) entre deux points.
---Source : lua/ge/extensions/editor/roadArchitect/utilities.lua:54
---@param p1 vec3 Début.
---@param p2 vec3 Fin.
function editor_roadArchitect_utilities.drawPurpleLine(p1, p2) end

--- Dessine une sphère de debug dont le rayon croît avec sqrt(distance caméra) pour garder une taille apparente à peu près constante.
---Source : lua/ge/extensions/editor/roadArchitect/utilities.lua:46
---@param pos vec3 Centre.
function editor_roadArchitect_utilities.drawSphere(pos) end

--- Sphère de surbrillance (couleur de highlight).
---Source : lua/ge/extensions/editor/roadArchitect/utilities.lua:48
---@param pos vec3 Centre.
function editor_roadArchitect_utilities.drawSphereHighlight(pos) end

--- Sphère de surbrillance violette.
---Source : lua/ge/extensions/editor/roadArchitect/utilities.lua:50
---@param pos vec3 Centre.
function editor_roadArchitect_utilities.drawSphereHighlightPurple(pos) end

--- Sphère de surbrillance rouge.
---Source : lua/ge/extensions/editor/roadArchitect/utilities.lua:49
---@param pos vec3 Centre.
function editor_roadArchitect_utilities.drawSphereHighlightRed(pos) end

--- Trouve les deux indices de points de division qui encadrent une longueur donnée le long de la route. Hors plage, renvoie les deux premiers ou les deux derniers indices.
---Source : lua/ge/extensions/editor/roadArchitect/utilities.lua:271
---@param pEval number Longueur à localiser.
---@param lengths number[] Longueurs cumulées (computeRoadLength).
---@return integer  Indice inférieur.
---@return integer  Indice supérieur.
function editor_roadArchitect_utilities.findBounds(pEval, lengths) end

--- Extrait le nom de fichier (avec extension) après le dernier '/'.
---Source : lua/ge/extensions/editor/roadArchitect/utilities.lua:217
---@param path string Chemin.
---@return string|nil  Nom de fichier.
function editor_roadArchitect_utilities.getFilenameFromPath(path) end

--- Demi-largeur de la route au premier point du renderData (suppose une largeur constante).
---Source : lua/ge/extensions/editor/roadArchitect/utilities.lua:260
---@param r table Route (avec renderData).
---@return number  Demi-largeur en mètres.
function editor_roadArchitect_utilities.getHalfWidthAtNode(r) end

--- Quaternion qui fait tourner v1 vers v2 (v1 et v2 sont normalisés en place). Cas particuliers : vecteurs quasi identiques -> identité ; opposés -> rotation de pi autour d'un axe orthogonal.
---Source : lua/ge/extensions/editor/roadArchitect/utilities.lua:522
---@param v1 vec3 Vecteur de départ (modifié).
---@param v2 vec3 Vecteur d'arrivée (modifié).
---@return quat  Rotation.
function editor_roadArchitect_utilities.getRotationBetweenVecs(v1, v2) end

--- Intersection (2D) de deux segments [p1,p2] et [q1,q2]. Renvoie nil s'ils ne se coupent pas.
---Source : lua/ge/extensions/editor/roadArchitect/utilities.lua:382
---@param p1 vec3 Début segment 1.
---@param p2 vec3 Fin segment 1.
---@param q1 vec3 Début segment 2.
---@param q2 vec3 Fin segment 2.
---@return vec3|nil  Point d'intersection (z = 0). Cas colinéaires : division par zéro possible (déduit du code).
function editor_roadArchitect_utilities.intersection2LineSegs(p1, p2, q1, q2) end

--- Intersection (2D) des droites infinies (p1,p2) et (p3,p4). Renvoie nil si elles sont parallèles.
---Source : lua/ge/extensions/editor/roadArchitect/utilities.lua:343
---@param p1 vec3 Point de la droite 1.
---@param p2 vec3 Second point de la droite 1.
---@param p3 vec3 Point de la droite 2.
---@param p4 vec3 Second point de la droite 2.
---@return vec3|nil  Point d'intersection (z = 0).
function editor_roadArchitect_utilities.intersection2Lines(p1, p2, p3, p4) end

--- Points d'intersection d'un segment 2D avec un cercle.
---Source : lua/ge/extensions/editor/roadArchitect/utilities.lua:394
---@param x1 number x début.
---@param y1 number y début.
---@param x2 number x fin.
---@param y2 number y fin.
---@param cx number x du centre.
---@param cy number y du centre.
---@param r number Rayon.
---@return table<integer, {[1]: number, [2]: number}>|nil  Liste de points {x, y} situés sur le segment, ou nil s'il n'y en a pas.
function editor_roadArchitect_utilities.intersectionLineSegmentCircle(x1, y1, x2, y2, cx, cy, r) end

--- Vrai si le point est dans la boîte 2D {xMin, xMax, yMin, yMax} (bornes incluses).
---Source : lua/ge/extensions/editor/roadArchitect/utilities.lua:553
---@param p vec3 Point.
---@param box table Boîte.
---@return boolean  true si dedans.
function editor_roadArchitect_utilities.isInBox(p, box) end

--- Indique si un indice de point de division est à l'intérieur d'un tunnel (entre t.s + extraS et t.e - extraE - 1).
---Source : lua/ge/extensions/editor/roadArchitect/utilities.lua:309
---@param idx integer Indice de point de division.
---@param tunnels table Liste de tunnels {s, e}.
---@param extraS integer Marge au début.
---@param extraE integer Marge à la fin.
---@return boolean  true si dans un tunnel.
function editor_roadArchitect_utilities.isInTunnel(idx, tunnels, extraS, extraE) end

--- Cherche les nœuds d'autres routes proches (distance 2D) du nœud sélectionné, pour l'accrochage/jonction. Les extrémités (premier/dernier nœud) et les nœuds intermédiaires sont renvoyés dans des listes séparées. Ignore les nœuds verrouillés et les routes non visibles.
---Source : lua/ge/extensions/editor/roadArchitect/utilities.lua:162
---@param roads table Liste des routes.
---@param selectedRoadIdx integer Route à exclure.
---@param selectedNodeIdx integer Nœud de référence.
---@return boolean  true si au moins un nœud proche existe.
---@return integer[]  Indices de route des extrémités proches.
---@return integer[]  Indices de nœud correspondants.
---@return integer[]  Indices de route des nœuds intermédiaires proches.
---@return integer[]  Indices de nœud correspondants.
function editor_roadArchitect_utilities.isMouseCloseToNode(roads, selectedRoadIdx, selectedNodeIdx) end

--- Vrai si la souris n'est sur aucun élément ImGui, aucune fenêtre ni le gizmo d'axes (donc sur la vue 3D).
---Source : lua/ge/extensions/editor/roadArchitect/utilities.lua:63
---@return boolean  true si la souris est sur la scène.
function editor_roadArchitect_utilities.isMouseHoveringOverTerrain() end

--- Cherche si la souris survole un nœud de route (routes dont les sphères de nœuds et la visibilité sont actives, hors nœuds verrouillés). Renvoie nil, nil, nil si la souris n'est pas sur la scène ou sur aucun nœud.
---Source : lua/ge/extensions/editor/roadArchitect/utilities.lua:74
---@param roads table Liste des routes.
---@return boolean|nil  true si un nœud est survolé.
---@return integer|nil  Indice de route.
---@return integer|nil  Indice de nœud.
function editor_roadArchitect_utilities.isMouseOverNode(roads) end

--- Vrai si le point est directement au-dessus du terrain (et non d'un pont) : compare la hauteur du terrain à celle d'un rayon lancé vers le bas depuis 4.5 m au-dessus (tolérance 0.25 m).
---Source : lua/ge/extensions/editor/roadArchitect/utilities.lua:559
---@param p vec3 Point.
---@return boolean  true si sur le terrain.
function editor_roadArchitect_utilities.isOverTerrain(p) end

--- Vrai si le point est à gauche de la droite orientée p1 -> p2 (2D).
---Source : lua/ge/extensions/editor/roadArchitect/utilities.lua:550
---@param p vec3 Point testé.
---@param p1 vec3 Début de la droite.
---@param p2 vec3 Fin de la droite.
---@return boolean  true si à gauche.
function editor_roadArchitect_utilities.isPointOnLeftSideOfLine(p, p1, p2) end

--- Position monde pointée par la souris : lancer de rayon statique depuis la caméra, portée 1000 m.
---Source : lua/ge/extensions/editor/roadArchitect/utilities.lua:66
---@return vec3  Point touché.
function editor_roadArchitect_utilities.mouseOnMapPos() end

--- Interpole linéairement dans une polyligne (positions et normales) à la longueur q. Renvoie nil, nil si q est hors de la plage de longueurs.
---Source : lua/ge/extensions/editor/roadArchitect/utilities.lua:320
---@param pos vec3[] Points de la polyligne.
---@param nml vec3[] Normales aux points.
---@param lens number[] Longueurs cumulées.
---@param q number Longueur d'évaluation.
---@return vec3|nil  Position interpolée.
---@return vec3|nil  Normale interpolée et normalisée.
function editor_roadArchitect_utilities.polyLerp(pos, nml, lens, q) end

--- Projette un point sur la droite (a,b) en 2D ; le z du point est conservé.
---Source : lua/ge/extensions/editor/roadArchitect/utilities.lua:432
---@param p vec3 Point.
---@param a vec3 Point de la droite.
---@param b vec3 Second point de la droite.
---@return vec3  Point projeté.
function editor_roadArchitect_utilities.projectPointToLine(p, a, b) end

--- Entier aléatoire dans [a, b] (bornes incluses ; a et b sont échangés si a > b).
---Source : lua/ge/extensions/editor/roadArchitect/utilities.lua:567
---@param a integer Borne.
---@param b integer Borne.
---@return integer  Tirage.
function editor_roadArchitect_utilities.randomInRange(a, b) end

--- Retire l'extension (point inclus) d'un nom de fichier ; le renvoie tel quel s'il n'en a pas.
---Source : lua/ge/extensions/editor/roadArchitect/utilities.lua:220
---@param filename string Nom de fichier.
---@return string  Nom sans extension.
function editor_roadArchitect_utilities.removeExtension(filename) end

--- Renvoie le dossier d'un chemin (séparateur final inclus), ou '' s'il n'y a pas de séparateur.
---Source : lua/ge/extensions/editor/roadArchitect/utilities.lua:223
---@param path string Chemin.
---@return string  Chemin du dossier.
function editor_roadArchitect_utilities.removeFileNameFromPath(path) end

--- Tourne v autour de l'axe unitaire k d'un angle theta (formule de Rodrigues).
---Source : lua/ge/extensions/editor/roadArchitect/utilities.lua:516
---@param v vec3 Vecteur.
---@param k vec3 Axe unitaire.
---@param theta number Angle en radians.
---@return vec3  Vecteur tourné.
function editor_roadArchitect_utilities.rotateVecAroundAxis(v, k, theta) end

--- Tourne un vecteur par un quaternion (q est normalisé en place).
---Source : lua/ge/extensions/editor/roadArchitect/utilities.lua:544
---@param v vec3 Vecteur.
---@param q quat Quaternion (modifié).
---@return vec3  Vecteur tourné.
function editor_roadArchitect_utilities.rotateVecByQuaternion(v, q) end

--- Arrondit à deux décimales.
---Source : lua/ge/extensions/editor/roadArchitect/utilities.lua:149
---@param num number Valeur.
---@return number  Valeur arrondie.
function editor_roadArchitect_utilities.round2(num) end

--- Interpolation sphérique entre deux vecteurs unitaires (voir notes sur la formule).
---Source : lua/ge/extensions/editor/roadArchitect/utilities.lua:475
---@param v1 vec3 Vecteur de départ (unitaire).
---@param v2 vec3 Vecteur d'arrivée (unitaire).
---@param t number Paramètre dans [0, 1].
---@return vec3  Vecteur interpolé.
function editor_roadArchitect_utilities.slerp(v1, v2, t) end

--- Distance 2D au carré entre deux points (z ignoré).
---Source : lua/ge/extensions/editor/roadArchitect/utilities.lua:152
---@param a vec3 Point A.
---@param b vec3 Point B.
---@return number  Distance au carré.
function editor_roadArchitect_utilities.sqDist2D(a, b) end

--- Ajoute un indice de groupe placé à r.groupIdx s'il n'y est pas déjà.
---Source : lua/ge/extensions/editor/roadArchitect/utilities.lua:134
---@param r table Route.
---@param placedGroupIdx integer Indice de groupe.
function editor_roadArchitect_utilities.tryAddGroupIdxToRoad(r, placedGroupIdx) end

