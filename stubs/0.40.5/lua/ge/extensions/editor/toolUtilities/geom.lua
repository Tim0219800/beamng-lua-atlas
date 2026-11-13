---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/geom.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Bibliothèque géométrique des outils d'édition de splines de l'éditeur (routes, rails, clôtures, bâtiments) : interpolation de splines Catmull-Rom (libre, par lancer de rayon, conforme au terrain, avec dévers), repère de Frenet, échantillonnage à longueur d'arc, géométrie 2D de polygones (point dans anneau, découpe à une boîte, décalage/retrait biseauté, triangulation par ear clipping avec trous), intersections, distances, survol à la souris, découpe/jonction de splines et utilitaires de terrain. Une « spline » est une table avec nodes, widths, nmls (entrée) et divPoints, divWidths, normals, tangents, binormals, discMap (sorties calculées).
--- Accès : extension `editor_toolUtilities_geom` : `extensions.load("editor_toolUtilities_geom")`, puis la globale `editor_toolUtilities_geom`
---@class editor_toolUtilities_geom
editor_toolUtilities_geom = {}

--- Petit angle entre deux vecteurs de longueur quelconque (rad).
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:1600
---@param a vec3 Vecteur.
---@param b vec3 Vecteur.
---@return number  Angle (rad).
function editor_toolUtilities_geom.angleBetweenVecs(a, b) end

--- Petit angle entre deux vecteurs unitaires (rad).
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:1597
---@param a vec3 Vecteur unitaire.
---@param b vec3 Vecteur unitaire.
---@return number  Angle (rad).
function editor_toolUtilities_geom.angleBetweenVecsNorm(a, b) end

--- Fait rouler le repère par station d'une spline selon une fraction de dévers TOUTE FAITE (bankT[i] dans [-1, 1], + = courbe à gauche), peakRad étant l'angle atteint par une station de pleine amplitude. L'appelant gère la correspondance courbure -> fraction et le raccord en longueur d'arc (sinon le dévers devient un créneau).
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:2204
---@param spline table Spline (nodes, widths, nmls, divPoints, divWidths, normals, tangents, binormals, discMap, isLoop...).
---@param bankT number[] Fraction de dévers par station.
---@param peakRad number Angle de pleine amplitude (rad).
function editor_toolUtilities_geom.applyBankFraction(spline, bankT, peakRad) end

--- Fusionne des anneaux de trous dans l'anneau extérieur par des arêtes de pont. count plafonne le nombre de trous pris.
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:1281
---@param outer table[] Anneau extérieur (remis anti-horaire).
---@param holes table[][] Trous (remis horaires, ponts par min-x croissant).
---@param count integer|nil Nombre maximal de trous pris.
---@return table[]  Anneau fusionné.
function editor_toolUtilities_geom.bridgeHoles2D(outer, holes, count) end

--- Version rapide et sans allocation de catmullRomCentripetal. Si outVec est fourni, l'écrit et le renvoie ; sinon crée un vec3.
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:2471
---@param p0 vec3 Point de contrôle.
---@param p1 vec3 Point de contrôle.
---@param p2 vec3 Point de contrôle.
---@param p3 vec3 Point de contrôle.
---@param t number Paramètre.
---@param s number Paramètre de tension/knots (déduit du code).
---@param outVec vec3|nil Sortie facultative.
---@return vec3  Point interpolé.
function editor_toolUtilities_geom.catmullRomCentripetalFast(p0, p1, p2, p3, t, s, outVec) end

--- Comme catmullRomRaycast mais les points sont conformés au terrain. Retombe sur catmullRomRaycast s'il n'y a pas de bloc de terrain.
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:2804
---@param spline table Spline (nodes, widths, nmls, divPoints, divWidths, normals, tangents, binormals, discMap, isLoop...).
---@param minNumDivIn integer|nil Divisions minimales par segment.
---@param minSpacing number|nil Espacement minimal (m).
---@param rayRaise number|nil Élévation de départ du rayon (m).
function editor_toolUtilities_geom.catmullRomConformToTerrain(spline, minNumDivIn, minSpacing, rayRaise) end

--- Interpole noeuds et largeurs avec des Catmull-Rom standard (XY centripète ; Z par Steffen pour une route au sol, Catmull-Rom lisse pour un tablier surélevé si deckZ). Les données sont stockées dans la spline.
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:2860
---@param spline table Spline (nodes, widths, nmls, divPoints, divWidths, normals, tangents, binormals, discMap, isLoop...).
---@param minNumDivIn integer|nil Divisions minimales par segment (défaut 10).
---@param deckZ boolean|nil Tablier surélevé : Z lissé par Catmull-Rom.
---@param maxSpacingIn number|nil Espacement maximal entre divisions (défaut 20 m).
function editor_toolUtilities_geom.catmullRomFree(spline, minNumDivIn, deckZ, maxSpacingIn) end

--- Comme catmullRomFree avec dévers automatique et raccord.
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:2918
---@param spline table Spline (nodes, widths, nmls, divPoints, divWidths, normals, tangents, binormals, discMap, isLoop...).
---@param minNumDivIn integer|nil Divisions minimales.
---@param bankStrength number Intensité du dévers.
---@param maxDegIn number|nil Dévers maximal (degrés, défaut 15).
---@param tuningIn number|nil Réglage de saturation (défaut 500).
---@param deckZ boolean|nil Tablier surélevé.
---@param maxSpacingIn number|nil Espacement maximal.
function editor_toolUtilities_geom.catmullRomFreeWithBanking(spline, minNumDivIn, bankStrength, maxDegIn, tuningIn, deckZ, maxSpacingIn) end

--- Interpole les points donnés par des Catmull-Rom.
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:2590
---@param nodes vec3[] Points.
---@param gran integer Granularité (subdivisions par segment).
---@return vec3[]  Points interpolés.
function editor_toolUtilities_geom.catmullRomNodesOnly(nodes, gran) end

--- Interpole points et largeurs par Catmull-Rom (un seul tableau de noeuds).
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:2613
---@param nodes vec3[] Points.
---@param widths number[] Largeurs.
---@param gran integer Granularité.
---@param isLoop boolean|nil Boucle.
---@return vec3[]  Points.
---@return number[]  Largeurs.
function editor_toolUtilities_geom.catmullRomNodesWidthsOnly(nodes, widths, gran, isLoop) end

--- Interpole points, largeurs, vitesses et limites de vitesse d'une spline par Catmull-Rom (un seul tableau de noeuds).
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:2645
---@param spline table Spline avec nodes, widths, vels, velLimits.
---@param gran integer Granularité.
---@return vec3[]  Points.
---@return number[]  Largeurs.
---@return number[]  Vitesses.
---@return number[]  Limites de vitesse.
function editor_toolUtilities_geom.catmullRomNodesWidthsVelVelLimits(spline, gran) end

--- Interpole noeuds et largeurs d'une spline par Catmull-Rom standard pour produire sa géométrie secondaire ; les points sont posés par lancer de rayon sur la surface en dessous. Les données sont stockées dans la spline (divPoints, divWidths, normals, discMap).
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:2753
---@param spline table Spline (nodes, widths, nmls, divPoints, divWidths, normals, tangents, binormals, discMap, isLoop...).
---@param minNumDivIn integer|nil Nombre minimal de divisions par segment (défaut 10).
---@param minSpacing number|nil Espacement minimal entre points (m).
---@param rayRaise number|nil Élévation de départ du rayon (m) ; défaut spline.rayRaise.
function editor_toolUtilities_geom.catmullRomRaycast(spline, minNumDivIn, minSpacing, rayRaise) end

--- Réduit une courbe tessellée à des cordes d'environ chord mètres ; les points drapeautés (flags) sont toujours gardés, ainsi que les extrémités.
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:945
---@param pts table[] Points.
---@param n integer Nombre de points.
---@param chord number Longueur de corde (m).
---@param flags table|nil Drapeaux par point.
---@return table[]  Points gardés.
---@return table|nil  Drapeaux correspondants.
function editor_toolUtilities_geom.chordify(pts, n, chord, flags) end

--- Découpe un anneau à la boîte x0..x1, y0..y1. Un anneau concave revient en un seul anneau qui longe le bord de la boîte entre ses morceaux, ce qui couvre la même surface dans la boîte.
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:1123
---@param pts table[] Anneau.
---@param x0 number X min.
---@param x1 number X max.
---@param y0 number Y min.
---@param y1 number Y max.
---@return table[]  Anneau découpé (peut avoir moins de 3 points).
function editor_toolUtilities_geom.clipRingRect2D(pts, x0, x1, y0, y1) end

--- Point le plus proche de p sur une polyligne 3D. Écrit le résultat dans outPos et renvoie la distance au carré.
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:77
---@param pts vec3[] Polyligne.
---@param p vec3 Point.
---@param outPos vec3 Reçoit le point le plus proche.
---@return number  Distance au carré (m^2).
function editor_toolUtilities_geom.closestPointOnPolyline(pts, p, outPos) end

--- Point le plus proche de p sur une polyligne, mesuré en XY (Z interpolé). Écrit dans outPos et renvoie la distance au carré.
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:123
---@param pts vec3[] Polyligne.
---@param p vec3 Point.
---@param outPos vec3 Reçoit le point.
---@param tMin number|nil Borne basse de recherche (déduit du code).
---@param tMax number|nil Borne haute de recherche (déduit du code).
---@param closed boolean|nil Polyligne fermée.
---@return number  Distance au carré.
function editor_toolUtilities_geom.closestPointOnPolyline2D(pts, p, outPos, tMin, tMax, closed) end

--- Point le plus proche, sur un segment de ruban donné, d'un point donné.
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:1897
---@param segIdx integer Indice du segment.
---@param ribbon table Ruban.
---@param p vec3 Point.
---@return any|nil  Point le plus proche (nil, nil si indisponible).
---@return number|nil  Distance au carré.
function editor_toolUtilities_geom.closestRibbonSegPointToPoint(segIdx, ribbon, p) end

--- Calcule le repère de Frenet local à chaque point de division (tangents, binormals, normals). Les segments de longueur nulle ne doivent pas être normalisés (sinon binormales NaN et noeuds DecalRoad infinis).
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:2689
---@param spline table Spline (nodes, widths, nmls, divPoints, divWidths, normals, tangents, binormals, discMap, isLoop...).
function editor_toolUtilities_geom.computeFrenetFrame(spline) end

--- Calcule le chemin de graphe à partir des noeuds et remplit la géométrie de la spline (divPoints, divWidths, normals). Sans effet s'il n'y a pas assez de noeuds.
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:2990
---@param spline table Spline (nodes, widths, nmls, divPoints, divWidths, normals, tangents, binormals, discMap, isLoop...).
function editor_toolUtilities_geom.computeGraphPathFromNodes(spline) end

--- Quaternion de variation aléatoire, par composante.
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:2226
---@param spline table Spline (nodes, widths, nmls, divPoints, divWidths, normals, tangents, binormals, discMap, isLoop...).
---@param tgt vec3 Tangente.
---@param rightVec vec3 Vecteur droit.
---@param nmlVec vec3 Normale.
---@param outQuat quat Reçoit le résultat.
---@return quat  outQuat.
function editor_toolUtilities_geom.computeRandomJitterQuat(spline, tgt, rightVec, nmlVec, outQuat) end

--- Quaternion de variation aléatoire d'après les axes de liberté de jointure.
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:2249
---@param spline table Spline (nodes, widths, nmls, divPoints, divWidths, normals, tangents, binormals, discMap, isLoop...).
---@param freedomAxes table Axes de liberté.
---@param outQuat quat Reçoit le résultat.
---@return quat  outQuat.
function editor_toolUtilities_geom.computeRandomJitterQuatFromFreedomAxes(spline, freedomAxes, outQuat) end

--- Quaternion de variation aléatoire autour de Z seulement.
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:2219
---@param jitter number Amplitude.
---@param nmlVec vec3 Normale.
---@param outQuat quat Reçoit le résultat.
---@return quat  outQuat.
function editor_toolUtilities_geom.computeRandomJitterQuat_ZOnly(jitter, nmlVec, outQuat) end

--- Calcule le champ de distance signé (SDF) d'un masque (tableau 2D, 0 = dedans).
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:2431
---@param mask number[][] Masque mask[y][x].
---@return number[][]  Champ de distance.
function editor_toolUtilities_geom.computeSDF(mask) end

--- Boîte englobante (XY) des sources données.
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:1686
---@param sources table[] Sources (points ou splines, déduit du code).
---@return table  { xMin, xMax, yMin, yMax }.
function editor_toolUtilities_geom.computeSourcesAABB(sources) end

--- Calcule un contour polygonal autour d'une spline (bords gauche et droit à la demi-largeur + marge, prolongés de 10 m aux deux bouts). Rapide à traiter par spans de scanline. Remplit le tableau polygon.
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:372
---@param spline table Spline avec divPoints, tangents, binormals, divWidths.
---@param margin number Marge latérale (m).
---@param polygon table Tableau de sortie, vidé puis rempli de vec3.
function editor_toolUtilities_geom.computeSplinePolygon(spline, margin, polygon) end

--- Rayon de courbure approché par 3 points consécutifs (moyenne des longueurs des deux côtés divisée par tan(angle/2)).
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:481
---@param p1 vec3 Point.
---@param p2 vec3 Point central.
---@param p3 vec3 Point.
---@return number  Rayon (m).
function editor_toolUtilities_geom.computeTurningRadius(p1, p2, p3) end

--- Direction que prend un poteau, un pilier ou un potelet PLACÉ SUR UN COIN, d'après la direction d'entrée et de sortie : l'axe est tourné de la moitié du virage réduit modulo period (défaut pi/2). Les égalités vont au plus petit virage pour que des coins à gauche et à droite se miroitent.
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:3070
---@param ix number Direction d'entrée x.
---@param iy number Direction d'entrée y.
---@param ox number Direction de sortie x.
---@param oy number Direction de sortie y.
---@param period number|nil Période de symétrie du poteau (rad, défaut pi/2).
---@return number  cos de l'axe.
---@return number  sin de l'axe.
function editor_toolUtilities_geom.cornerAxis(ix, iy, ox, oy, period) end

--- Produit vectoriel scalaire 2D de (ax, ay) et (bx, by), sur composantes simples (sans allocation de vec3 ou de table).
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:3059
---@param ax number A x.
---@param ay number A y.
---@param bx number B x.
---@param by number B y.
---@return number  ax*by - ay*bx.
function editor_toolUtilities_geom.cross2(ax, ay, bx, by) end

--- Convertit une courbure en angle de dévers (rad). maxDeg (plafond sur les virages les plus serrés, défaut 15) et tuning (courbure à laquelle le plafond est atteint, défaut 500) sont des surcharges facultatives.
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:2194
---@param curv number Courbure.
---@param bankStrength number Intensité du dévers.
---@param maxDeg number|nil Plafond (degrés).
---@param tuning number|nil Réglage de saturation.
---@return number  Angle de dévers (rad).
function editor_toolUtilities_geom.curvatureToBankAngle(curv, bankStrength, maxDeg, tuning) end

--- Densifie une polyligne pour qu'aucun segment ne dépasse maxSpacing.
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:989
---@param points table[] Polyligne.
---@param maxSpacing number Espacement maximal (m).
---@return table[]  Polyligne densifiée.
function editor_toolUtilities_geom.densifyByMaxSpacing(points, maxSpacing) end

--- Distance au carré du point (px, py) au segment FINI AB (t borné au segment). Pour les tests de proximité fréquents.
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:1063
---@param px number Point x.
---@param py number Point y.
---@param ax number A x.
---@param ay number A y.
---@param bx number B x.
---@param by number B y.
---@return number  Distance au carré.
function editor_toolUtilities_geom.distSqPointSeg2D(px, py, ax, ay, bx, by) end

--- Produit scalaire 2D sur composantes simples.
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:3061
---@param ax number A x.
---@param ay number A y.
---@param bx number B x.
---@param by number B y.
---@return number  ax*bx + ay*by.
function editor_toolUtilities_geom.dot2(ax, ay, bx, by) end

--- Inverse le sens d'une spline sur place (noeuds, normales, corners) et marque spline.isDirty.
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:1878
---@param spline table Spline (nodes, widths, nmls, divPoints, divWidths, normals, tangents, binormals, discMap, isLoop...).
function editor_toolUtilities_geom.flipSplineDirection(spline) end

--- Boîte englobante alignée aux axes (XY) d'un tableau de points.
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:335
---@param points vec3[] Points.
---@return table  { xMin, xMax, yMin, yMax }.
function editor_toolUtilities_geom.getAABB(points) end

--- Construit les quadrilatères des sources, avec gonflement latéral (sans étirement longitudinal).
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:1700
---@param sources table[] Sources de type spline.
---@param margin number Marge latérale (m).
---@return table[]  Quads.
function editor_toolUtilities_geom.getAllQuadrilaterals(sources, margin) end

--- Renvoie le facteur d'échelle des barres de vitesse (hauteur = barScale * vitesse, 0.5).
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:68
---@return number  Facteur.
function editor_toolUtilities_geom.getBarScale() end

--- Étant donné une polyligne et un polygone, renvoie les suites d'indices consécutifs qui sont dans le polygone.
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:1915
---@param nodes vec3[] Polyligne.
---@param polygon table[] Polygone.
---@return table[]  Suites d'indices.
function editor_toolUtilities_geom.getNodeSpansInsidePolygon(nodes, polygon) end

--- Renvoie la table des quaternions de pré-rotation indexée de 0 à 3 (0, 90, 180, 270 degrés autour de Z).
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:65
---@return table<integer, quat>  Quaternions de pré-rotation.
function editor_toolUtilities_geom.getPreRotQuats() end

--- Calcule les spans de scanline d'un polygone sur l'axe Y, en espace de grille de terrain. Stocke les résultats dans spansXMin, spansXMax et spansY.
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:2397
---@param gMinY integer Rangée de grille minimale.
---@param gMaxY integer Rangée de grille maximale.
---@param te userdata Éditeur de terrain (gridToWorldByPoint2I).
---@param tb userdata Bloc de terrain.
---@param polygon table[] Polygone en monde.
---@param spansXMin table Sortie, vidée.
---@param spansXMax table Sortie.
---@param spansY table Sortie.
function editor_toolUtilities_geom.getScanlineSpans(gMinY, gMaxY, te, tb, polygon, spansXMin, spansXMax, spansY) end

--- Normale du terrain au point monde donné.
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:420
---@param p vec3 Point monde.
---@return vec3  Normale.
function editor_toolUtilities_geom.getTerrainNormal(p) end

--- Normale du terrain au point monde donné, écrite dans out.
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:433
---@param p vec3 Point monde.
---@param out vec3 Reçoit la normale.
function editor_toolUtilities_geom.getTerrainNormalInPlace(p, out) end

--- Rétrécit un polygone fermé de {x, y} vers l'intérieur d'au plus dist, le long de la normale moyenne des arêtes de chaque sommet (vraie direction intérieure locale, correcte pour les anneaux concaves).
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:1465
---@param ring table[] Anneau.
---@param dist number Distance (m).
---@return table[]  Anneau rétréci.
function editor_toolUtilities_geom.insetClosedRing2D(ring, dist) end

--- Décale un chemin 2D vers le centre (cx, cy) de insetM le long de la normale locale (déduit du code).
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:705
---@param path table[] Chemin.
---@param cx number Centre x.
---@param cy number Centre y.
---@param insetM number Retrait (m).
---@return table[]  Nouveau chemin.
function editor_toolUtilities_geom.insetPathAlongNormal2D(path, cx, cy, insetM) end

--- Point d'intersection de deux segments (en ligne). Renvoie nil sans intersection.
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:502
---@param p1 vec3 Début du segment 1.
---@param p2 vec3 Fin du segment 1.
---@param q1 vec3 Début du segment 2.
---@param q2 vec3 Fin du segment 2.
---@param out vec3 Reçoit le point.
---@return vec3|nil  out ou nil.
function editor_toolUtilities_geom.intersection2LineSegs(p1, p2, q1, q2, out) end

--- Intersecte un point (x, y) avec un quad et renvoie la hauteur interpolée à cet endroit, ou false si hors du quad.
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:1672
---@param p vec3 Point.
---@param q table Quad : 4 sommets vec3.
---@return number|boolean  Hauteur ou false.
function editor_toolUtilities_geom.intersectsUpQuadBarycentric(p, q) end

--- Teste si le segment (a, b) coupe le segment (c, d).
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:496
---@param a vec3 Début de ab.
---@param b vec3 Fin de ab.
---@param c vec3 Début de cd.
---@param d vec3 Fin de cd.
---@return boolean  Intersection.
function editor_toolUtilities_geom.isLineSegIntersect(a, b, c, d) end

--- Teste si la souris survole une barre (splines avec un tableau barPoints ordonné).
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:301
---@param splines table[] Splines à tester.
---@return boolean  Survol.
---@return integer|nil  Indice de spline.
---@return integer|nil  Indice de barre.
function editor_toolUtilities_geom.isMouseOverBar(splines) end

--- Teste si la souris survole un noeud du graphe de navigation.
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:322
---@param nodes table Noeuds du graphe (indexés par clé).
---@return boolean  Survol.
---@return any|nil  Clé du noeud.
function editor_toolUtilities_geom.isMouseOverGraphNode(nodes) end

--- Teste si la souris survole un noeud d'une des splines (tolérance 2 m). Chaque spline doit avoir un tableau nodes.
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:258
---@param splines table[] Splines à tester.
---@return boolean  Survol.
---@return integer|nil  Indice de spline.
---@return integer|nil  Indice de noeud.
function editor_toolUtilities_geom.isMouseOverNode(splines) end

--- Teste si la souris survole une polyligne ; closed teste aussi l'arête du dernier noeud au premier.
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:280
---@param points vec3[] Polyligne.
---@param mousePos vec3 Position de la souris.
---@param closed boolean|nil Polygone fermé.
---@return boolean  Survol.
---@return integer|nil  Indice du segment.
function editor_toolUtilities_geom.isMouseOverPolyline(points, mousePos, closed) end

--- Teste si la souris survole la spline (pour insérer un noeud ou survol). Utilise l'approche la plus proche rayon-caméra / axe, donc les routes surélevées marchent. maxDistSq : tolérance au carré (math.huge pour obtenir le point le plus proche sans condition).
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:2516
---@param spline table Spline (nodes, widths, nmls, divPoints, divWidths, normals, tangents, binormals, discMap, isLoop...).
---@param maxDistSq number|nil Tolérance rayon-axe au carré (défaut 1).
---@return boolean  Survol.
---@return integer|nil  Indice de segment.
---@return vec3|nil  Point sur la spline.
function editor_toolUtilities_geom.isMouseOverSpline(spline, maxDistSq) end

--- Teste si p est dans le triangle (a, b, c) (coordonnées barycentriques).
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:406
---@param p vec3 Point.
---@param a vec3 Sommet.
---@param b vec3 Sommet.
---@param c vec3 Sommet.
---@return boolean  Dedans.
function editor_toolUtilities_geom.isPointInTriangle(p, a, b, c) end

--- Joint deux géométries de spline aux indices de noeud donnés. Renvoie nil si les indices sont invalides.
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:1822
---@param n1 vec3[] Noeuds 1.
---@param w1 number[] Largeurs 1.
---@param nm1 vec3[] Normales 1.
---@param nodeIdx1 integer Indice de jonction 1.
---@param n2 vec3[] Noeuds 2.
---@param w2 number[] Largeurs 2.
---@param nm2 vec3[] Normales 2.
---@param nodeIdx2 integer Indice de jonction 2.
---@param c1 table|nil Surcharges de virages 1.
---@param c2 table|nil Surcharges 2.
---@return table|nil  nodesNew.
---@return table|nil  widthsNew.
---@return table|nil  nmlsNew.
---@return table|nil  cornersNew.
function editor_toolUtilities_geom.joinSplineGeometry(n1, w1, nm1, nodeIdx1, n2, w2, nm2, nodeIdx2, c1, c2) end

--- Paramètre t le long de p0 + t*d0 au point d'intersection avec p1 + u*d1 ; nil si parallèles. Avec d0 unitaire, t est en mètres.
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:580
---@param p0x number Point 0 x.
---@param p0y number Point 0 y.
---@param d0x number Direction 0 x.
---@param d0y number Direction 0 y.
---@param p1x number Point 1 x.
---@param p1y number Point 1 y.
---@param d1x number Direction 1 x.
---@param d1y number Direction 1 y.
---@param eps number Tolérance de parallélisme.
---@return number|nil  t, ou nil.
function editor_toolUtilities_geom.lineDirsHitT2D(p0x, p0y, d0x, d0y, p1x, p1y, d1x, d1y, eps) end

--- Intersection de deux droites INFINIES P+s*D et Q+s*E ; renvoie ix, iy ou nil si parallèles.
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:3086
---@param px number P x.
---@param py number P y.
---@param dx number D x.
---@param dy number D y.
---@param qx number Q x.
---@param qy number Q y.
---@param ex number E x.
---@param ey number E y.
---@param eps number|nil Tolérance de parallélisme.
---@return number|nil  ix.
---@return number|nil  iy.
function editor_toolUtilities_geom.lineIntersect2D(px, py, dx, dy, qx, qy, ex, ey, eps) end

--- Intersection de deux droites a0-a1 et b0-b1. Renvoie nil si parallèles.
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:559
---@param a0 table Point.
---@param a1 table Point.
---@param b0 table Point.
---@param b1 table Point.
---@param eps number Tolérance.
---@return table|nil  { pt = {x, y}, alongA, alongB } (codes along de Martinez).
function editor_toolUtilities_geom.linesIntersect2D(a0, a1, b0, b1, eps) end

--- Centroïde pondéré par l'aire d'un ou plusieurs anneaux fermés 2D ({x, y}). Renvoie cx, cy ou nil.
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:835
---@param regions table[] Anneaux.
---@return number|nil  cx.
---@return number|nil  cy.
function editor_toolUtilities_geom.multiPolygonCentroidXY(regions) end

--- Normalise un vecteur 2D (x, y).
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:3063
---@param x number x.
---@param y number y.
---@return number  x normalisé.
---@return number  y normalisé.
function editor_toolUtilities_geom.normalize2(x, y) end

--- Décale une polyligne 2D à l'opposé de (cx, cy) le long de sa normale locale par sommet.
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:816
---@param path table[] Polyligne.
---@param cx number Centre x.
---@param cy number Centre y.
---@param distM number Distance (m).
---@param distArr number[]|nil Distances par sommet (déduit du code).
---@return table[]  Points décalés.
function editor_toolUtilities_geom.offsetPathFromCenter2D(path, cx, cy, distM, distArr) end

--- Décalage parallèle à angles biseautés (miter) d'une polyligne 2D OUVERTE : un point de sortie par sommet (les rails appairés restent alignés), z conservé. Les coins gardent la vraie largeur perpendiculaire. Le côté est choisi UNE fois pour tout le chemin : à l'opposé de (cx, cy), ou vers lui si inward.
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:728
---@param pts table[] Polyligne ouverte.
---@param dist number Distance de décalage (m).
---@param cx number Centre x.
---@param cy number Centre y.
---@param z number|nil Z imposé (déduit du code).
---@param inward boolean|nil Décaler vers le centre.
---@return table[]  Points décalés.
function editor_toolUtilities_geom.offsetPathMiter2D(pts, dist, cx, cy, z, inward) end

--- Pousse un anneau fermé VERS L'EXTÉRIEUR d'une petite distance, coins biseautés (mitrés).
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:1400
---@param ring table[] Anneau.
---@param dist number Distance (m).
---@return table[]|nil  Anneau agrandi.
function editor_toolUtilities_geom.outsetClosedRing2D(ring, dist) end

--- Comme outsetClosedRing2D mais seulement pour les côtés désignés par move[i] ; les autres restent exactement sur leur droite. Un sommet entre un côté mobile et un côté fixe glisse le long du côté fixe : pas d'encoche, nombre de sommets inchangé.
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:1432
---@param ring table[] Anneau.
---@param dist number Distance (m).
---@param move table<integer, boolean> Côtés à déplacer.
---@return table[]  Anneau.
function editor_toolUtilities_geom.outsetRingSides2D(ring, dist, move) end

--- Distance perpendiculaire du point (px, py) au segment (ax, ay)->(bx, by) en XY. Segment dégénéré : distance à A. Attention à l'ordre des arguments : les points du segment d'abord.
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:3046
---@param ax number A x.
---@param ay number A y.
---@param bx number B x.
---@param by number B y.
---@param px number Point x.
---@param py number Point y.
---@return number  Distance (m).
function editor_toolUtilities_geom.perpDistPointSeg2D(ax, ay, bx, by, px, py) end

--- Le point est-il au-dessus ou sur la droite left->right (produit vectoriel >= -eps).
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:532
---@param pt table Point.
---@param left table Début.
---@param right table Fin.
---@param eps number Tolérance.
---@return boolean  Résultat.
function editor_toolUtilities_geom.pointAboveOrOnLine2D(pt, left, right, eps) end

--- Pour un p supposé aligné avec left->right : faux s'il est une extrémité ou en dehors. Testé sur le produit scalaire (unité m^2) et non sur la position normalisée, pour ne pas fendre un segment à sa propre extrémité (ce qui donnerait une pièce de longueur nulle).
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:547
---@param p table Point.
---@param left table Début.
---@param right table Fin.
---@param eps number Tolérance.
---@return boolean  Strictement entre.
function editor_toolUtilities_geom.pointBetween2D(p, left, right, eps) end

--- Détermine si un point est dans un quad (en XY).
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:1681
---@param p vec3 Point.
---@param q table Quad : 4 sommets.
---@return boolean  Dedans.
function editor_toolUtilities_geom.pointInQuadBarycentric(p, q) end

--- Point dans un polygone 2D (tir de rayon, pair-impair), indifférent au sens de l'anneau. Les sommets sont des {x, y}.
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:1087
---@param px number Point x.
---@param py number Point y.
---@param ring table[] Anneau.
---@return boolean  Dedans.
function editor_toolUtilities_geom.pointInRing2D(px, py, ring) end

--- Point dans un triangle 2D (barycentrique), en scalaires pour les boucles serrées comme l'ear clipping.
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:1131
---@param px number Point x.
---@param py number Point y.
---@param ax number A x.
---@param ay number A y.
---@param bx number B x.
---@param by number B y.
---@param cx number C x.
---@param cy number C y.
---@return boolean  Dedans.
function editor_toolUtilities_geom.pointInTri2D(px, py, ax, ay, bx, by, cx, cy) end

--- Trois points sont-ils alignés en XY (|produit vectoriel| < eps).
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:537
---@param a table Point.
---@param b table Point.
---@param c table Point.
---@param eps number Tolérance.
---@return boolean  Alignés.
function editor_toolUtilities_geom.pointsCollinear2D(a, b, c, eps) end

--- Comparaison de deux points en XY, pour un tri (-1 ou 1, d'abord par x puis par y).
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:525
---@param a table Point.
---@param b table Point.
---@param eps number Tolérance sur x.
---@return integer  -1 si a avant b, sinon 1.
function editor_toolUtilities_geom.pointsCompare2D(a, b, eps) end

--- Deux points sont-ils confondus en XY à eps près (par composante).
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:520
---@param a table Point {x, y}.
---@param b table Point.
---@param eps number Tolérance.
---@return boolean  Identiques.
function editor_toolUtilities_geom.pointsSame2D(a, b, eps) end

--- Boîte englobante orientée d'un polygone 2D par ACP. Les points sont des paires [1]=x, [2]=y.
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:346
---@param poly number[][] Polygone.
---@return number  Centre x.
---@return number  Centre y.
---@return number  Demi-largeur le long de l'axe principal.
---@return number  Demi-largeur transversale.
---@return number  Angle theta de l'axe principal (rad).
function editor_toolUtilities_geom.polygonOBB(poly) end

--- Cousine 2D (XY seul) de polylineCumLength3D pour des points {x, y} simples : out[i] = distance de pts[1] à pts[i]. Un tableau out réutilisable évite les allocations.
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:875
---@param pts table[] Polyligne.
---@param out number[]|nil Tableau réutilisé (vidé puis rempli).
---@return number[]  out.
---@return number  Longueur totale.
function editor_toolUtilities_geom.polylineCumLength2D(pts, out) end

--- Longueurs cumulées 3D le long d'une polyligne.
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:864
---@param pts vec3[] Polyligne.
---@return number[]  cum[1..n].
---@return number  Longueur totale.
function editor_toolUtilities_geom.polylineCumLength3D(pts) end

--- Z du premier échantillon à la distance d'arc dist depuis le bout début ou fin.
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:1559
---@param pts vec3[] Polyligne.
---@param cum number[] Longueurs cumulées.
---@param total number Longueur totale.
---@param fromStart boolean Mesurer depuis le début.
---@param dist number Distance (m).
---@return number  Z.
function editor_toolUtilities_geom.polylineZAtArcFromTip(pts, cum, total, fromStart, dist) end

--- Crée et remplit un kd-tree contenant les quads donnés.
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:1723
---@param quads table[] Quads.
---@return table  Arbre kdtreebox2d.
function editor_toolUtilities_geom.populateTreeQuads(quads) end

--- Projette un point sur une spline. Renvoie nil si hors des bornes des segments.
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:1942
---@param pos vec3 Point.
---@param spline table Spline.
---@return vec3|nil  Point projeté le plus proche.
---@return number|nil  s dans [0,1].
---@return number|nil  t latéral dans [-inf, inf].
function editor_toolUtilities_geom.projectPointToSpline(pos, spline) end

--- Bilinéaire inverse dans le plan XY : le (u, v) tel que p = lerp(lerp(q1, q2, u), lerp(q3, q4, u), v), ou nil si p est hors du quad. u court de q1 vers q2, v de q1 vers q3.
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:1631
---@param px number Point x.
---@param py number Point y.
---@param q1 table Coin 1.
---@param q2 table Coin 2.
---@param q3 table Coin 3.
---@param q4 table Coin 4.
---@return number|nil  u.
---@return number|nil  v.
function editor_toolUtilities_geom.quadUV(px, py, q1, q2, q3, q4) end

--- Intersection de deux RAYONS (vers l'avant seulement) P+s*D et Q+u*E ; renvoie ix, iy ou nil (parallèles ou point derrière l'un des rayons).
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:3093
---@param px number P x.
---@param py number P y.
---@param dx number D x.
---@param dy number D y.
---@param qx number Q x.
---@param qy number Q y.
---@param ex number E x.
---@param ey number E y.
---@param eps number|nil Tolérance.
---@return number|nil  ix.
---@return number|nil  iy.
function editor_toolUtilities_geom.rayIntersect2D(px, py, dx, dy, qx, qy, ex, ey, eps) end

--- Rééchantillonne une polyligne (noeuds et largeurs) à pas régulier.
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:1008
---@param nodes vec3[] Noeuds.
---@param widths number[] Largeurs.
---@param spacing number Pas (m).
---@return vec3[]  Nouveaux noeuds (les largeurs correspondantes sont aussi produites, déduit du code).
function editor_toolUtilities_geom.resampleUniformNodesWidths(nodes, widths, spacing) end

--- Remodèle sur place UNE extrémité d'une polyligne de noeuds (x/y, z inchangé) selon une Bézier d'amorce vers un point but, sur une longueur L.
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:633
---@param nodes vec3[] Noeuds modifiés.
---@param fromStart boolean true : le début est l'extrémité mobile.
---@param p0x number Pointe x (déduit du code).
---@param p0y number Pointe y.
---@param gx number But x (déduit du code).
---@param gy number But y.
---@param L number Longueur remodelée (m).
function editor_toolUtilities_geom.reshapeLeadInBezier2D(nodes, fromStart, p0x, p0y, gx, gy, L) end

--- Repère à mi-intervalle pour des panneaux rigides de kit sur un bord incliné ou en dévers (clôtures, glissières).
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:2103
---@param p1 vec3 Début.
---@param p2 vec3 Fin.
---@param t1 vec3 Tangente début.
---@param t2 vec3 Tangente fin.
---@param n1 vec3 Normale début.
---@param n2 vec3 Normale fin.
---@param outPos vec3 Reçoit la position.
---@param outTan vec3 Reçoit la tangente.
---@param outUp vec3 Reçoit le haut.
---@param prevAcross vec3|nil Latéral précédent.
function editor_toolUtilities_geom.ribbonIntervalFrame(p1, p2, t1, t2, n1, n2, outPos, outTan, outUp, prevAcross) end

--- Où deux rubans (routes) partant d'une même jonction cessent de se chevaucher, en longueur d'arc le long de A depuis le centre (hx, hy). Renvoie maxM si aucun ruban utilisable.
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:153
---@param hx number X du centre de jonction.
---@param hy number Y du centre.
---@param a table Points du ruban A.
---@param aFromStart boolean A part de son premier point.
---@param b table Points du ruban B.
---@param bFromStart boolean B part de son premier point.
---@param clearM number Distance de dégagement (m).
---@param stepM number Pas de recherche (m, doit être > 0).
---@param maxM number Longueur maximale (m).
---@return number  Longueur d'arc (m).
function editor_toolUtilities_geom.ribbonOverlapEnd2D(hx, hy, a, aFromStart, b, bFromStart, clearM, stepM, maxM) end

--- Vecteur haut du ruban de route pour une direction along unitaire : up perpendiculaire à along, roulis pris sur upRef. prevAcross garde le signe latéral continu le long d'une série de placements.
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:2076
---@param along vec3 Direction unitaire.
---@param upRef vec3 Haut de référence.
---@param outUp vec3 Reçoit le haut.
---@param prevAcross vec3|nil Vecteur latéral précédent.
function editor_toolUtilities_geom.ribbonUpFromAlong(along, upRef, outUp, prevAcross) end

--- Deux fois l'aire signée d'un anneau 2D de {x, y} ; positif = anti-horaire (x à droite, y en haut).
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:1223
---@param ring table[] Anneau.
---@return number  2 x aire signée.
function editor_toolUtilities_geom.ringSignedArea2(ring) end

--- Tourne le vecteur v autour de l'axe unitaire k de l'angle theta (formule de Rodrigues).
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:453
---@param v vec3 Vecteur.
---@param k vec3 Axe unitaire.
---@param theta number Angle (rad).
---@return vec3  Copie du résultat.
function editor_toolUtilities_geom.rotateVecAroundAxis(v, k, theta) end

--- Comme rotateVecAroundAxis sans allocation : out = v*cos + (k x v)*sin + k*(k.v)*(1-cos).
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:467
---@param v vec3 Vecteur.
---@param k vec3 Axe unitaire.
---@param theta number Angle (rad).
---@param out vec3 Reçoit le résultat.
---@return vec3  out.
function editor_toolUtilities_geom.rotateVecAroundAxisInlined(v, k, theta, out) end

--- Tourne le vecteur v autour de l'axe Z de l'angle donné, sur place (la fonction reçoit vec comme destination).
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:445
---@param vec vec3 Vecteur modifié.
---@param v vec3 Vecteur source (déduit du code).
---@param angle number Angle (rad).
function editor_toolUtilities_geom.rotateVecAroundZ(vec, v, angle) end

--- Échantillonne une Bézier cubique en XY (extrémités incluses).
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:589
---@param p0 table Point de contrôle.
---@param p1 table Point de contrôle.
---@param p2 table Point de contrôle.
---@param p3 table Point de contrôle.
---@param segs integer|nil Nombre de segments (défaut 14).
---@return table[]  Points.
function editor_toolUtilities_geom.sampleCubicBezier2D(p0, p1, p2, p3, segs) end

--- Échantillonne à longueur d'arc réelle une polyligne pour calculer positions et repère de Frenet à intervalles réguliers. Sans effet si spacing n'est pas > 0.
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:1996
---@param divPoints vec3[] Points de division.
---@param tangents vec3[] Tangentes.
---@param normals vec3[] Normales.
---@param spacing number Pas (m).
---@param outPosns vec3[] Sortie positions (vidée).
---@param outTans vec3[] Sortie tangentes.
---@param outNormals vec3[] Sortie normales.
---@return vec3[]  outPosns.
---@return vec3[]  outTans.
---@return vec3[]  outNormals.
function editor_toolUtilities_geom.sampleSpline(divPoints, tangents, normals, spacing, outPosns, outTans, outNormals) end

--- Échantillonnage adaptatif le long d'une spline : calcule positions, repère de Frenet et échelles par pas de meshLength ; l'échelle (minimum 0.01) dépend de la courbure (sensibilité kappaSensitivity = 150). Sans effet si meshLength n'est pas > 0.
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:2152
---@param divPoints vec3[] Points de division.
---@param tangents vec3[] Tangentes.
---@param normals vec3[] Normales.
---@param meshLength number Longueur de maille nominale (m).
---@param outPosns vec3[] Sortie positions.
---@param outTans vec3[] Sortie tangentes.
---@param outNormals vec3[] Sortie normales.
---@param outScales number[] Sortie échelles (minimum 0.01).
---@return vec3[]  outPosns.
---@return vec3[]  outTans.
---@return vec3[]  outNormals.
---@return number[]  outScales.
function editor_toolUtilities_geom.sampleSplineAdaptive(divPoints, tangents, normals, meshLength, outPosns, outTans, outNormals, outScales) end

--- Échantillonneur à répartition ajustée pour des objets discrets (lampadaires, bornes) : le pas est ajusté pour que la longueur totale soit un nombre entier d'intervalles.
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:2024
---@param divPoints vec3[] Points de division.
---@param tangents vec3[] Tangentes.
---@param normals vec3[] Normales.
---@param targetSpacing number Pas visé (m, > 0).
---@param isLoop boolean Spline en boucle.
---@param outPosns vec3[] Sortie positions.
---@param outTans vec3[] Sortie tangentes.
---@param outNormals vec3[] Sortie normales.
function editor_toolUtilities_geom.sampleSplineEvenFit(divPoints, tangents, normals, targetSpacing, isLoop, outPosns, outTans, outNormals) end

--- Croisement strict de deux segments ouverts AB et CD : renvoie le paramètre t sur AB dans (0,1), sinon nil (parallèles ou croisement sur une extrémité). Les extrémités sont exclues pour que deux bandes qui se touchent ne soient pas lues comme un pli.
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:1074
---@param ax number A x.
---@param ay number A y.
---@param bx number B x.
---@param by number B y.
---@param cx number C x.
---@param cy number C y.
---@param dx number D x.
---@param dy number D y.
---@return number|nil  t sur AB, ou nil.
function editor_toolUtilities_geom.segCrossParam2D(ax, ay, bx, by, cx, cy, dx, dy) end

--- Une signature de forme (liste plate de nombres et de chaînes) a-t-elle bougé depuis old : nombres de plus de tolM, chaînes dès qu'elles diffèrent.
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:889
---@param old table|nil Ancienne signature.
---@param new table Nouvelle signature.
---@param tolM number Tolérance numérique.
---@return boolean  true si elle a bougé.
function editor_toolUtilities_geom.sigMoved(old, new, tolM) end

--- Angle signé entre deux vecteurs autour d'un axe, après projection sur le plan de rotation. Renvoyé en DEGRÉS (contrairement à signedAngleBetweenVecs).
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:1620
---@param fromVec vec3 Vecteur de départ.
---@param toVec vec3 Vecteur d'arrivée.
---@param axis vec3 Axe.
---@return number  Angle signé (degrés).
function editor_toolUtilities_geom.signedAngleAroundAxis(fromVec, toVec, axis) end

--- Angle signé entre deux vecteurs autour d'un axe, en supposant les vecteurs dans le plan de rotation.
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:1610
---@param a vec3 Vecteur.
---@param b vec3 Vecteur.
---@param axis vec3 Axe.
---@return number  Angle signé (rad).
function editor_toolUtilities_geom.signedAngleBetweenVecs(a, b, axis) end

--- Simplification de Ramer-Douglas-Peucker d'une polyligne (distance perpendiculaire mesurée en 3D).
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:903
---@param points vec3[] Polyligne.
---@param tolM number Tolérance (m).
---@return vec3[]  Polyligne simplifiée.
function editor_toolUtilities_geom.simplifyRDP(points, tolM) end

--- Coupe de coins de Chaikin d'un polygone fermé de points {x, y}.
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:1046
---@param poly table[] Polygone.
---@param iterations integer Nombre d'itérations.
---@return table[]  Polygone lissé.
function editor_toolUtilities_geom.smoothClosedPolygonChaikin(poly, iterations) end

--- Lissage de hauteur d'un bout à l'autre : fixe z[1] et z[n] et réécrit les Z intérieurs par interpolation de Steffen selon la longueur XY. Sans effet (renvoie false) sous 3 noeuds.
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:101
---@param nodes vec3[] Noeuds modifiés sur place.
---@return boolean  true si le lissage a été fait.
function editor_toolUtilities_geom.smoothNodesHeightSteffen(nodes) end

--- Coupe une spline en boucle à l'indice donné et renvoie la géométrie réordonnée. corners est renvoyé en 4e valeur.
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:1791
---@param nodes vec3[] Noeuds.
---@param widths number[] Largeurs.
---@param nmls vec3[] Normales.
---@param splitNodeIdx integer Indice de coupe.
---@param corners table|nil Surcharges de virages.
---@return table|nil  nodesNew.
---@return table|nil  widthsNew.
---@return table|nil  nmlsNew.
---@return table|nil  cornersNew.
function editor_toolUtilities_geom.splitLoopSplineGeometry(nodes, widths, nmls, splitNodeIdx, corners) end

--- Coupe une polyligne 2D en tronçons qui restent hors d'une région bloquée.
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:1508
---@param pts table[] Polyligne {x, y}.
---@param isBlocked function isBlocked(x, y) -> boolean.
---@param stepM number|nil Pas de test (m, défaut 1.0 si <= 0.05).
---@param minKeepM number|nil Longueur minimale d'un tronçon gardé (déduit du code).
---@return table[][]  Tronçons.
function editor_toolUtilities_geom.splitPolylineByBlocked(pts, isBlocked, stepM, minKeepM) end

--- Coupe une géométrie de spline à l'indice de noeud donné (les deux moitiés sont écartées de 2 m au point de coupe). corners (facultatif) est un tableau de surcharges par noeud, conservé pour que les outils d'ingénierie gardent leurs rayons par virage.
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:1752
---@param nodes vec3[] Noeuds.
---@param widths number[] Largeurs.
---@param nmls vec3[] Normales.
---@param splitNodeIdx integer Indice de coupe.
---@param corners table|nil Surcharges de virages alignées sur les noeuds.
---@return table|nil  nodes1 (nil si indice invalide).
---@return table|nil  widths1.
---@return table|nil  nmls1.
---@return table|nil  nodes2.
---@return table|nil  widths2.
---@return table|nil  nmls2.
---@return table|nil  corners1.
---@return table|nil  corners2.
function editor_toolUtilities_geom.splitSplineGeometry(nodes, widths, nmls, splitNodeIdx, corners) end

--- Distance au carré en XY entre deux points (Z ignoré).
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:71
---@param a vec3 Point.
---@param b vec3 Point.
---@return number  Distance au carré (m^2).
function editor_toolUtilities_geom.squaredDistance2D(a, b) end

--- Distance au carré entre deux segments 3D ; écrit les points les plus proches dans outP1 et outP2.
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:219
---@param a0 vec3 Début du segment A.
---@param a1 vec3 Fin du segment A.
---@param b0 vec3 Début de B.
---@param b1 vec3 Fin de B.
---@param outP1 vec3 Point le plus proche sur A.
---@param outP2 vec3 Point le plus proche sur B.
---@return number  Distance au carré.
function editor_toolUtilities_geom.squaredSegSegDist(a0, a1, b0, b1, outP1, outP2) end

--- Direction XY unitaire vers l'extérieur au-delà d'un bout (à l'opposé de la polyligne). Parcourt minWalkM le long de la chaîne pour qu'un premier segment court replié n'inverse pas la visée.
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:1576
---@param pts table[] Polyligne.
---@param fromStart boolean Bout début ou fin.
---@param minWalkM number Distance minimale parcourue (m).
---@return number  Direction x.
---@return number  Direction y.
function editor_toolUtilities_geom.tipOutwardXY(pts, fromStart, minWalkM) end

--- Translate une polyligne de t mètres le long de la binormale (direction latérale).
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:2183
---@param pts vec3[] Points.
---@param binormals vec3[] Binormales.
---@param t number Décalage (m).
---@param out table Sortie (vidée) de vec3.
function editor_toolUtilities_geom.translateSpline(pts, binormals, t, out) end

--- Triangulation par ear clipping d'un polygone 2D simple (anneau de {x, y}, l'un ou l'autre sens). La répétition de fermeture est retirée avant : arête de longueur nulle, elle bloquerait la découpe et ferait jeter le capot entier.
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:1162
---@param poly table[] Anneau.
---@return integer[][]  Triplets d'indices dans l'anneau ouvert (liste vide si échec).
function editor_toolUtilities_geom.triangulatePolygon2D(poly) end

--- Triangule un polygone 2D éventuellement troué. Si l'ear clipping échoue avec un anneau pontant, abandonne les trous un par un plutôt que de perdre tout le capot.
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:1374
---@param outer table[] Anneau extérieur.
---@param holes table[][]|nil Trous.
---@return table[]  Anneau auquel les triangles se réfèrent.
---@return integer[][]  Triplets d'indices.
function editor_toolUtilities_geom.triangulateWithHoles2D(outer, holes) end

--- Met à jour les points de barres de vitesse d'une spline ; remplit spline.vels et spline.velLimits.
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:2318
---@param spline table Spline (nodes, widths, nmls, divPoints, divWidths, normals, tangents, binormals, discMap, isLoop...).
---@param isBarsLimits boolean Barres pour les limites de vitesse (true) ou les vitesses (false).
function editor_toolUtilities_geom.updateBarPoints(spline, isBarsLimits) end

--- Met à jour les points de barres pour un chemin de graphe de navigation ; remplit spline.vels et spline.velLimits.
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:2357
---@param spline table Spline (nodes, widths, nmls, divPoints, divWidths, normals, tangents, binormals, discMap, isLoop...).
---@param graphData table Données du graphe de navigation.
---@param isBarsLimit boolean Utiliser velLimits (true) ou vels (false) pour la hauteur des barres.
function editor_toolUtilities_geom.updateBarPointsGraph(spline, graphData, isBarsLimit) end

--- Recalcule les points de côtes (ribs) d'une spline en 3D libre. Sans effet sous 2 noeuds.
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:2263
---@param spline table Spline (nodes, widths, nmls, divPoints, divWidths, normals, tangents, binormals, discMap, isLoop...).
function editor_toolUtilities_geom.updateRibPointsFree(spline) end

--- Recalcule les points de côtes d'une spline par lancer de rayon vertical vers la surface la plus proche en dessous. Sans effet sous 2 noeuds.
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:2290
---@param spline table Spline (nodes, widths, nmls, divPoints, divWidths, normals, tangents, binormals, discMap, isLoop...).
function editor_toolUtilities_geom.updateRibPointsRaycast(spline) end

--- Soude sur place les noeuds consécutifs presque confondus (segments plus courts que minLen).
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:964
---@param nodes vec3[] Noeuds modifiés.
---@param widths number[] Largeurs, mises à jour en parallèle.
---@param minLen number Longueur minimale (m).
---@return integer  Nombre de noeuds conservés (déduit du code).
function editor_toolUtilities_geom.weldShortSegments(nodes, widths, minLen) end

