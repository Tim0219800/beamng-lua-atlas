# `editor_toolUtilities_geom`

*Fichier : `lua/ge/extensions/editor/toolUtilities/geom.lua` · VM : Game Engine (GE) · 3236 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_toolUtilities_geom` : `extensions.load("editor_toolUtilities_geom")`, puis la globale `editor_toolUtilities_geom`

Bibliothèque géométrique des outils d'édition de splines de l'éditeur (routes, rails, clôtures, bâtiments) : interpolation de splines Catmull-Rom (libre, par lancer de rayon, conforme au terrain, avec dévers), repère de Frenet, échantillonnage à longueur d'arc, géométrie 2D de polygones (point dans anneau, découpe à une boîte, décalage/retrait biseauté, triangulation par ear clipping avec trous), intersections, distances, survol à la souris, découpe/jonction de splines et utilitaires de terrain. Une « spline » est une table avec nodes, widths, nmls (entrée) et divPoints, divWidths, normals, tangents, binormals, discMap (sorties calculées).

## Remarques

- Constantes internes : division minimale 10 par segment, espacement maximal 20 m entre points de division (plafond dur 2000), marge de bout de polygone 10 m, tolérance souris-noeud 2 m, dévers maximal 15 degrés, réglage de dévers 500, écartement de découpe 2 m.
- Les fonctions « 2D » prennent des points {x, y} (les tables avec x et y suffisent, pas forcément vec3) ; les fonctions scalaires (cross2, dot2, distSqPointSeg2D...) évitent toute allocation pour les boucles chaudes.
- Unités : mètres, radians sauf signedAngleAroundAxis (degrés).
- Ordre des arguments piégeux : perpDistPointSeg2D prend d'abord le segment (ax, ay, bx, by) puis le point (px, py), l'inverse de distSqPointSeg2D.
- Le module utilise kdtreebox2d et editor/toolUtilities/util ; certaines fonctions appellent des API éditeur (getCameraMouseRay, core_terrain).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_toolUtilities_geom.angleBetweenVecs(a, b)` | Petit angle entre deux vecteurs de longueur quelconque (rad). | 1600 |
| `editor_toolUtilities_geom.angleBetweenVecsNorm(a, b)` | Petit angle entre deux vecteurs unitaires (rad). | 1597 |
| `editor_toolUtilities_geom.applyBankFraction(spline, bankT, peakRad)` | Fait rouler le repère par station d'une spline selon une fraction de dévers TOUTE FAITE (bankT[i] dans [-1, 1], + = courbe à gauche), peakRad étant l'angle atteint par une station de pleine amplitude. L'appelant gère la correspondance courbure -> fraction et le raccord en longueur d'arc (sinon le dévers devient un créneau). | 2204 |
| `editor_toolUtilities_geom.bridgeHoles2D(outer, holes, count)` | Fusionne des anneaux de trous dans l'anneau extérieur par des arêtes de pont. count plafonne le nombre de trous pris. | 1281 |
| `editor_toolUtilities_geom.catmullRomCentripetalFast(p0, p1, p2, p3, t, s, outVec)` | Version rapide et sans allocation de catmullRomCentripetal. Si outVec est fourni, l'écrit et le renvoie ; sinon crée un vec3. | 2471 |
| `editor_toolUtilities_geom.catmullRomConformToTerrain(spline, minNumDivIn, minSpacing, rayRaise)` | Comme catmullRomRaycast mais les points sont conformés au terrain. Retombe sur catmullRomRaycast s'il n'y a pas de bloc de terrain. | 2804 |
| `editor_toolUtilities_geom.catmullRomFree(spline, minNumDivIn, deckZ, maxSpacingIn)` | Interpole noeuds et largeurs avec des Catmull-Rom standard (XY centripète ; Z par Steffen pour une route au sol, Catmull-Rom lisse pour un tablier surélevé si deckZ). Les données sont stockées dans la spline. | 2860 |
| `editor_toolUtilities_geom.catmullRomFreeWithBanking(spline, minNumDivIn, bankStrength, maxDegIn, tuningIn, deckZ, maxSpacingIn)` | Comme catmullRomFree avec dévers automatique et raccord. | 2918 |
| `editor_toolUtilities_geom.catmullRomNodesOnly(nodes, gran)` | Interpole les points donnés par des Catmull-Rom. | 2590 |
| `editor_toolUtilities_geom.catmullRomNodesWidthsOnly(nodes, widths, gran, isLoop)` | Interpole points et largeurs par Catmull-Rom (un seul tableau de noeuds). | 2613 |
| `editor_toolUtilities_geom.catmullRomNodesWidthsVelVelLimits(spline, gran)` | Interpole points, largeurs, vitesses et limites de vitesse d'une spline par Catmull-Rom (un seul tableau de noeuds). | 2645 |
| `editor_toolUtilities_geom.catmullRomRaycast(spline, minNumDivIn, minSpacing, rayRaise)` | Interpole noeuds et largeurs d'une spline par Catmull-Rom standard pour produire sa géométrie secondaire ; les points sont posés par lancer de rayon sur la surface en dessous. Les données sont stockées dans la spline (divPoints, divWidths, normals, discMap). | 2753 |
| `editor_toolUtilities_geom.chordify(pts, n, chord, flags)` | Réduit une courbe tessellée à des cordes d'environ chord mètres ; les points drapeautés (flags) sont toujours gardés, ainsi que les extrémités. | 945 |
| `editor_toolUtilities_geom.clipRingRect2D(pts, x0, x1, y0, y1)` | Découpe un anneau à la boîte x0..x1, y0..y1. Un anneau concave revient en un seul anneau qui longe le bord de la boîte entre ses morceaux, ce qui couvre la même surface dans la boîte. | 1123 |
| `editor_toolUtilities_geom.closestPointOnPolyline(pts, p, outPos)` | Point le plus proche de p sur une polyligne 3D. Écrit le résultat dans outPos et renvoie la distance au carré. | 77 |
| `editor_toolUtilities_geom.closestPointOnPolyline2D(pts, p, outPos, tMin, tMax, closed)` | Point le plus proche de p sur une polyligne, mesuré en XY (Z interpolé). Écrit dans outPos et renvoie la distance au carré. | 123 |
| `editor_toolUtilities_geom.closestRibbonSegPointToPoint(segIdx, ribbon, p)` | Point le plus proche, sur un segment de ruban donné, d'un point donné. | 1897 |
| `editor_toolUtilities_geom.computeFrenetFrame(spline)` | Calcule le repère de Frenet local à chaque point de division (tangents, binormals, normals). Les segments de longueur nulle ne doivent pas être normalisés (sinon binormales NaN et noeuds DecalRoad infinis). | 2689 |
| `editor_toolUtilities_geom.computeGraphPathFromNodes(spline)` | Calcule le chemin de graphe à partir des noeuds et remplit la géométrie de la spline (divPoints, divWidths, normals). Sans effet s'il n'y a pas assez de noeuds. | 2990 |
| `editor_toolUtilities_geom.computeRandomJitterQuat(spline, tgt, rightVec, nmlVec, outQuat)` | Quaternion de variation aléatoire, par composante. | 2226 |
| `editor_toolUtilities_geom.computeRandomJitterQuatFromFreedomAxes(spline, freedomAxes, outQuat)` | Quaternion de variation aléatoire d'après les axes de liberté de jointure. | 2249 |
| `editor_toolUtilities_geom.computeRandomJitterQuat_ZOnly(jitter, nmlVec, outQuat)` | Quaternion de variation aléatoire autour de Z seulement. | 2219 |
| `editor_toolUtilities_geom.computeSDF(mask)` | Calcule le champ de distance signé (SDF) d'un masque (tableau 2D, 0 = dedans). | 2431 |
| `editor_toolUtilities_geom.computeSourcesAABB(sources)` | Boîte englobante (XY) des sources données. | 1686 |
| `editor_toolUtilities_geom.computeSplinePolygon(spline, margin, polygon)` | Calcule un contour polygonal autour d'une spline (bords gauche et droit à la demi-largeur + marge, prolongés de 10 m aux deux bouts). Rapide à traiter par spans de scanline. Remplit le tableau polygon. | 372 |
| `editor_toolUtilities_geom.computeTurningRadius(p1, p2, p3)` | Rayon de courbure approché par 3 points consécutifs (moyenne des longueurs des deux côtés divisée par tan(angle/2)). | 481 |
| `editor_toolUtilities_geom.cornerAxis(ix, iy, ox, oy, period)` | Direction que prend un poteau, un pilier ou un potelet PLACÉ SUR UN COIN, d'après la direction d'entrée et de sortie : l'axe est tourné de la moitié du virage réduit modulo period (défaut pi/2). Les égalités vont au plus petit virage pour que des coins à gauche et à droite se miroitent. | 3070 |
| `editor_toolUtilities_geom.cross2(ax, ay, bx, by)` | Produit vectoriel scalaire 2D de (ax, ay) et (bx, by), sur composantes simples (sans allocation de vec3 ou de table). | 3059 |
| `editor_toolUtilities_geom.curvatureToBankAngle(curv, bankStrength, maxDeg, tuning)` | Convertit une courbure en angle de dévers (rad). maxDeg (plafond sur les virages les plus serrés, défaut 15) et tuning (courbure à laquelle le plafond est atteint, défaut 500) sont des surcharges facultatives. | 2194 |
| `editor_toolUtilities_geom.densifyByMaxSpacing(points, maxSpacing)` | Densifie une polyligne pour qu'aucun segment ne dépasse maxSpacing. | 989 |
| `editor_toolUtilities_geom.distSqPointSeg2D(px, py, ax, ay, bx, by)` | Distance au carré du point (px, py) au segment FINI AB (t borné au segment). Pour les tests de proximité fréquents. | 1063 |
| `editor_toolUtilities_geom.dot2(ax, ay, bx, by)` | Produit scalaire 2D sur composantes simples. | 3061 |
| `editor_toolUtilities_geom.flipSplineDirection(spline)` | Inverse le sens d'une spline sur place (noeuds, normales, corners) et marque spline.isDirty. | 1878 |
| `editor_toolUtilities_geom.getAABB(points)` | Boîte englobante alignée aux axes (XY) d'un tableau de points. | 335 |
| `editor_toolUtilities_geom.getAllQuadrilaterals(sources, margin)` | Construit les quadrilatères des sources, avec gonflement latéral (sans étirement longitudinal). | 1700 |
| `editor_toolUtilities_geom.getBarScale()` | Renvoie le facteur d'échelle des barres de vitesse (hauteur = barScale * vitesse, 0.5). | 68 |
| `editor_toolUtilities_geom.getNodeSpansInsidePolygon(nodes, polygon)` | Étant donné une polyligne et un polygone, renvoie les suites d'indices consécutifs qui sont dans le polygone. | 1915 |
| `editor_toolUtilities_geom.getPreRotQuats()` | Renvoie la table des quaternions de pré-rotation indexée de 0 à 3 (0, 90, 180, 270 degrés autour de Z). | 65 |
| `editor_toolUtilities_geom.getScanlineSpans(gMinY, gMaxY, te, tb, polygon, spansXMin, spansXMax, spansY)` | Calcule les spans de scanline d'un polygone sur l'axe Y, en espace de grille de terrain. Stocke les résultats dans spansXMin, spansXMax et spansY. | 2397 |
| `editor_toolUtilities_geom.getTerrainNormal(p)` | Normale du terrain au point monde donné. | 420 |
| `editor_toolUtilities_geom.getTerrainNormalInPlace(p, out)` | Normale du terrain au point monde donné, écrite dans out. | 433 |
| `editor_toolUtilities_geom.insetClosedRing2D(ring, dist)` | Rétrécit un polygone fermé de {x, y} vers l'intérieur d'au plus dist, le long de la normale moyenne des arêtes de chaque sommet (vraie direction intérieure locale, correcte pour les anneaux concaves). | 1465 |
| `editor_toolUtilities_geom.insetPathAlongNormal2D(path, cx, cy, insetM)` | Décale un chemin 2D vers le centre (cx, cy) de insetM le long de la normale locale (déduit du code). | 705 |
| `editor_toolUtilities_geom.intersection2LineSegs(p1, p2, q1, q2, out)` | Point d'intersection de deux segments (en ligne). Renvoie nil sans intersection. | 502 |
| `editor_toolUtilities_geom.intersectsUpQuadBarycentric(p, q)` | Intersecte un point (x, y) avec un quad et renvoie la hauteur interpolée à cet endroit, ou false si hors du quad. | 1672 |
| `editor_toolUtilities_geom.isLineSegIntersect(a, b, c, d)` | Teste si le segment (a, b) coupe le segment (c, d). | 496 |
| `editor_toolUtilities_geom.isMouseOverBar(splines)` | Teste si la souris survole une barre (splines avec un tableau barPoints ordonné). | 301 |
| `editor_toolUtilities_geom.isMouseOverGraphNode(nodes)` | Teste si la souris survole un noeud du graphe de navigation. | 322 |
| `editor_toolUtilities_geom.isMouseOverNode(splines)` | Teste si la souris survole un noeud d'une des splines (tolérance 2 m). Chaque spline doit avoir un tableau nodes. | 258 |
| `editor_toolUtilities_geom.isMouseOverPolyline(points, mousePos, closed)` | Teste si la souris survole une polyligne ; closed teste aussi l'arête du dernier noeud au premier. | 280 |
| `editor_toolUtilities_geom.isMouseOverSpline(spline, maxDistSq)` | Teste si la souris survole la spline (pour insérer un noeud ou survol). Utilise l'approche la plus proche rayon-caméra / axe, donc les routes surélevées marchent. maxDistSq : tolérance au carré (math.huge pour obtenir le point le plus proche sans condition). | 2516 |
| `editor_toolUtilities_geom.isPointInTriangle(p, a, b, c)` | Teste si p est dans le triangle (a, b, c) (coordonnées barycentriques). | 406 |
| `editor_toolUtilities_geom.joinSplineGeometry(n1, w1, nm1, nodeIdx1, n2, w2, nm2, nodeIdx2, c1, c2)` | Joint deux géométries de spline aux indices de noeud donnés. Renvoie nil si les indices sont invalides. | 1822 |
| `editor_toolUtilities_geom.lineDirsHitT2D(p0x, p0y, d0x, d0y, p1x, p1y, d1x, d1y, eps)` | Paramètre t le long de p0 + t*d0 au point d'intersection avec p1 + u*d1 ; nil si parallèles. Avec d0 unitaire, t est en mètres. | 580 |
| `editor_toolUtilities_geom.lineIntersect2D(px, py, dx, dy, qx, qy, ex, ey, eps)` | Intersection de deux droites INFINIES P+s*D et Q+s*E ; renvoie ix, iy ou nil si parallèles. | 3086 |
| `editor_toolUtilities_geom.linesIntersect2D(a0, a1, b0, b1, eps)` | Intersection de deux droites a0-a1 et b0-b1. Renvoie nil si parallèles. | 559 |
| `editor_toolUtilities_geom.multiPolygonCentroidXY(regions)` | Centroïde pondéré par l'aire d'un ou plusieurs anneaux fermés 2D ({x, y}). Renvoie cx, cy ou nil. | 835 |
| `editor_toolUtilities_geom.normalize2(x, y)` | Normalise un vecteur 2D (x, y). | 3063 |
| `editor_toolUtilities_geom.offsetPathFromCenter2D(path, cx, cy, distM, distArr)` | Décale une polyligne 2D à l'opposé de (cx, cy) le long de sa normale locale par sommet. | 816 |
| `editor_toolUtilities_geom.offsetPathMiter2D(pts, dist, cx, cy, z, inward)` | Décalage parallèle à angles biseautés (miter) d'une polyligne 2D OUVERTE : un point de sortie par sommet (les rails appairés restent alignés), z conservé. Les coins gardent la vraie largeur perpendiculaire. Le côté est choisi UNE fois pour tout le chemin : à l'opposé de (cx, cy), ou vers lui si inward. | 728 |
| `editor_toolUtilities_geom.outsetClosedRing2D(ring, dist)` | Pousse un anneau fermé VERS L'EXTÉRIEUR d'une petite distance, coins biseautés (mitrés). | 1400 |
| `editor_toolUtilities_geom.outsetRingSides2D(ring, dist, move)` | Comme outsetClosedRing2D mais seulement pour les côtés désignés par move[i] ; les autres restent exactement sur leur droite. Un sommet entre un côté mobile et un côté fixe glisse le long du côté fixe : pas d'encoche, nombre de sommets inchangé. | 1432 |
| `editor_toolUtilities_geom.perpDistPointSeg2D(ax, ay, bx, by, px, py)` | Distance perpendiculaire du point (px, py) au segment (ax, ay)->(bx, by) en XY. Segment dégénéré : distance à A. Attention à l'ordre des arguments : les points du segment d'abord. | 3046 |
| `editor_toolUtilities_geom.pointAboveOrOnLine2D(pt, left, right, eps)` | Le point est-il au-dessus ou sur la droite left->right (produit vectoriel >= -eps). | 532 |
| `editor_toolUtilities_geom.pointBetween2D(p, left, right, eps)` | Pour un p supposé aligné avec left->right : faux s'il est une extrémité ou en dehors. Testé sur le produit scalaire (unité m^2) et non sur la position normalisée, pour ne pas fendre un segment à sa propre extrémité (ce qui donnerait une pièce de longueur nulle). | 547 |
| `editor_toolUtilities_geom.pointInQuadBarycentric(p, q)` | Détermine si un point est dans un quad (en XY). | 1681 |
| `editor_toolUtilities_geom.pointInRing2D(px, py, ring)` | Point dans un polygone 2D (tir de rayon, pair-impair), indifférent au sens de l'anneau. Les sommets sont des {x, y}. | 1087 |
| `editor_toolUtilities_geom.pointInTri2D(px, py, ax, ay, bx, by, cx, cy)` | Point dans un triangle 2D (barycentrique), en scalaires pour les boucles serrées comme l'ear clipping. | 1131 |
| `editor_toolUtilities_geom.pointsCollinear2D(a, b, c, eps)` | Trois points sont-ils alignés en XY (\|produit vectoriel\| < eps). | 537 |
| `editor_toolUtilities_geom.pointsCompare2D(a, b, eps)` | Comparaison de deux points en XY, pour un tri (-1 ou 1, d'abord par x puis par y). | 525 |
| `editor_toolUtilities_geom.pointsSame2D(a, b, eps)` | Deux points sont-ils confondus en XY à eps près (par composante). | 520 |
| `editor_toolUtilities_geom.polygonOBB(poly)` | Boîte englobante orientée d'un polygone 2D par ACP. Les points sont des paires [1]=x, [2]=y. | 346 |
| `editor_toolUtilities_geom.polylineCumLength2D(pts, out)` | Cousine 2D (XY seul) de polylineCumLength3D pour des points {x, y} simples : out[i] = distance de pts[1] à pts[i]. Un tableau out réutilisable évite les allocations. | 875 |
| `editor_toolUtilities_geom.polylineCumLength3D(pts)` | Longueurs cumulées 3D le long d'une polyligne. | 864 |
| `editor_toolUtilities_geom.polylineZAtArcFromTip(pts, cum, total, fromStart, dist)` | Z du premier échantillon à la distance d'arc dist depuis le bout début ou fin. | 1559 |
| `editor_toolUtilities_geom.populateTreeQuads(quads)` | Crée et remplit un kd-tree contenant les quads donnés. | 1723 |
| `editor_toolUtilities_geom.projectPointToSpline(pos, spline)` | Projette un point sur une spline. Renvoie nil si hors des bornes des segments. | 1942 |
| `editor_toolUtilities_geom.quadUV(px, py, q1, q2, q3, q4)` | Bilinéaire inverse dans le plan XY : le (u, v) tel que p = lerp(lerp(q1, q2, u), lerp(q3, q4, u), v), ou nil si p est hors du quad. u court de q1 vers q2, v de q1 vers q3. | 1631 |
| `editor_toolUtilities_geom.rayIntersect2D(px, py, dx, dy, qx, qy, ex, ey, eps)` | Intersection de deux RAYONS (vers l'avant seulement) P+s*D et Q+u*E ; renvoie ix, iy ou nil (parallèles ou point derrière l'un des rayons). | 3093 |
| `editor_toolUtilities_geom.resampleUniformNodesWidths(nodes, widths, spacing)` | Rééchantillonne une polyligne (noeuds et largeurs) à pas régulier. | 1008 |
| `editor_toolUtilities_geom.reshapeLeadInBezier2D(nodes, fromStart, p0x, p0y, gx, gy, L)` | Remodèle sur place UNE extrémité d'une polyligne de noeuds (x/y, z inchangé) selon une Bézier d'amorce vers un point but, sur une longueur L. | 633 |
| `editor_toolUtilities_geom.ribbonIntervalFrame(p1, p2, t1, t2, n1, n2, outPos, outTan, outUp, prevAcross)` | Repère à mi-intervalle pour des panneaux rigides de kit sur un bord incliné ou en dévers (clôtures, glissières). | 2103 |
| `editor_toolUtilities_geom.ribbonOverlapEnd2D(hx, hy, a, aFromStart, b, bFromStart, clearM, stepM, maxM)` | Où deux rubans (routes) partant d'une même jonction cessent de se chevaucher, en longueur d'arc le long de A depuis le centre (hx, hy). Renvoie maxM si aucun ruban utilisable. | 153 |
| `editor_toolUtilities_geom.ribbonUpFromAlong(along, upRef, outUp, prevAcross)` | Vecteur haut du ruban de route pour une direction along unitaire : up perpendiculaire à along, roulis pris sur upRef. prevAcross garde le signe latéral continu le long d'une série de placements. | 2076 |
| `editor_toolUtilities_geom.ringSignedArea2(ring)` | Deux fois l'aire signée d'un anneau 2D de {x, y} ; positif = anti-horaire (x à droite, y en haut). | 1223 |
| `editor_toolUtilities_geom.rotateVecAroundAxis(v, k, theta)` | Tourne le vecteur v autour de l'axe unitaire k de l'angle theta (formule de Rodrigues). | 453 |
| `editor_toolUtilities_geom.rotateVecAroundAxisInlined(v, k, theta, out)` | Comme rotateVecAroundAxis sans allocation : out = v*cos + (k x v)*sin + k*(k.v)*(1-cos). | 467 |
| `editor_toolUtilities_geom.rotateVecAroundZ(vec, v, angle)` | Tourne le vecteur v autour de l'axe Z de l'angle donné, sur place (la fonction reçoit vec comme destination). | 445 |
| `editor_toolUtilities_geom.sampleCubicBezier2D(p0, p1, p2, p3, segs)` | Échantillonne une Bézier cubique en XY (extrémités incluses). | 589 |
| `editor_toolUtilities_geom.sampleSpline(divPoints, tangents, normals, spacing, outPosns, outTans, outNormals)` | Échantillonne à longueur d'arc réelle une polyligne pour calculer positions et repère de Frenet à intervalles réguliers. Sans effet si spacing n'est pas > 0. | 1996 |
| `editor_toolUtilities_geom.sampleSplineAdaptive(divPoints, tangents, normals, meshLength, outPosns, outTans, outNormals, outScales)` | Échantillonnage adaptatif le long d'une spline : calcule positions, repère de Frenet et échelles par pas de meshLength ; l'échelle (minimum 0.01) dépend de la courbure (sensibilité kappaSensitivity = 150). Sans effet si meshLength n'est pas > 0. | 2152 |
| `editor_toolUtilities_geom.sampleSplineEvenFit(divPoints, tangents, normals, targetSpacing, isLoop, outPosns, outTans, outNormals)` | Échantillonneur à répartition ajustée pour des objets discrets (lampadaires, bornes) : le pas est ajusté pour que la longueur totale soit un nombre entier d'intervalles. | 2024 |
| `editor_toolUtilities_geom.segCrossParam2D(ax, ay, bx, by, cx, cy, dx, dy)` | Croisement strict de deux segments ouverts AB et CD : renvoie le paramètre t sur AB dans (0,1), sinon nil (parallèles ou croisement sur une extrémité). Les extrémités sont exclues pour que deux bandes qui se touchent ne soient pas lues comme un pli. | 1074 |
| `editor_toolUtilities_geom.sigMoved(old, new, tolM)` | Une signature de forme (liste plate de nombres et de chaînes) a-t-elle bougé depuis old : nombres de plus de tolM, chaînes dès qu'elles diffèrent. | 889 |
| `editor_toolUtilities_geom.signedAngleAroundAxis(fromVec, toVec, axis)` | Angle signé entre deux vecteurs autour d'un axe, après projection sur le plan de rotation. Renvoyé en DEGRÉS (contrairement à signedAngleBetweenVecs). | 1620 |
| `editor_toolUtilities_geom.signedAngleBetweenVecs(a, b, axis)` | Angle signé entre deux vecteurs autour d'un axe, en supposant les vecteurs dans le plan de rotation. | 1610 |
| `editor_toolUtilities_geom.simplifyRDP(points, tolM)` | Simplification de Ramer-Douglas-Peucker d'une polyligne (distance perpendiculaire mesurée en 3D). | 903 |
| `editor_toolUtilities_geom.smoothClosedPolygonChaikin(poly, iterations)` | Coupe de coins de Chaikin d'un polygone fermé de points {x, y}. | 1046 |
| `editor_toolUtilities_geom.smoothNodesHeightSteffen(nodes)` | Lissage de hauteur d'un bout à l'autre : fixe z[1] et z[n] et réécrit les Z intérieurs par interpolation de Steffen selon la longueur XY. Sans effet (renvoie false) sous 3 noeuds. | 101 |
| `editor_toolUtilities_geom.splitLoopSplineGeometry(nodes, widths, nmls, splitNodeIdx, corners)` | Coupe une spline en boucle à l'indice donné et renvoie la géométrie réordonnée. corners est renvoyé en 4e valeur. | 1791 |
| `editor_toolUtilities_geom.splitPolylineByBlocked(pts, isBlocked, stepM, minKeepM)` | Coupe une polyligne 2D en tronçons qui restent hors d'une région bloquée. | 1508 |
| `editor_toolUtilities_geom.splitSplineGeometry(nodes, widths, nmls, splitNodeIdx, corners)` | Coupe une géométrie de spline à l'indice de noeud donné (les deux moitiés sont écartées de 2 m au point de coupe). corners (facultatif) est un tableau de surcharges par noeud, conservé pour que les outils d'ingénierie gardent leurs rayons par virage. | 1752 |
| `editor_toolUtilities_geom.squaredDistance2D(a, b)` | Distance au carré en XY entre deux points (Z ignoré). | 71 |
| `editor_toolUtilities_geom.squaredSegSegDist(a0, a1, b0, b1, outP1, outP2)` | Distance au carré entre deux segments 3D ; écrit les points les plus proches dans outP1 et outP2. | 219 |
| `editor_toolUtilities_geom.tipOutwardXY(pts, fromStart, minWalkM)` | Direction XY unitaire vers l'extérieur au-delà d'un bout (à l'opposé de la polyligne). Parcourt minWalkM le long de la chaîne pour qu'un premier segment court replié n'inverse pas la visée. | 1576 |
| `editor_toolUtilities_geom.translateSpline(pts, binormals, t, out)` | Translate une polyligne de t mètres le long de la binormale (direction latérale). | 2183 |
| `editor_toolUtilities_geom.triangulatePolygon2D(poly)` | Triangulation par ear clipping d'un polygone 2D simple (anneau de {x, y}, l'un ou l'autre sens). La répétition de fermeture est retirée avant : arête de longueur nulle, elle bloquerait la découpe et ferait jeter le capot entier. | 1162 |
| `editor_toolUtilities_geom.triangulateWithHoles2D(outer, holes)` | Triangule un polygone 2D éventuellement troué. Si l'ear clipping échoue avec un anneau pontant, abandonne les trous un par un plutôt que de perdre tout le capot. | 1374 |
| `editor_toolUtilities_geom.updateBarPoints(spline, isBarsLimits)` | Met à jour les points de barres de vitesse d'une spline ; remplit spline.vels et spline.velLimits. | 2318 |
| `editor_toolUtilities_geom.updateBarPointsGraph(spline, graphData, isBarsLimit)` | Met à jour les points de barres pour un chemin de graphe de navigation ; remplit spline.vels et spline.velLimits. | 2357 |
| `editor_toolUtilities_geom.updateRibPointsFree(spline)` | Recalcule les points de côtes (ribs) d'une spline en 3D libre. Sans effet sous 2 noeuds. | 2263 |
| `editor_toolUtilities_geom.updateRibPointsRaycast(spline)` | Recalcule les points de côtes d'une spline par lancer de rayon vertical vers la surface la plus proche en dessous. Sans effet sous 2 noeuds. | 2290 |
| `editor_toolUtilities_geom.weldShortSegments(nodes, widths, minLen)` | Soude sur place les noeuds consécutifs presque confondus (segments plus courts que minLen). | 964 |

### Détail des paramètres

#### `editor_toolUtilities_geom.angleBetweenVecs(a, b)`

Petit angle entre deux vecteurs de longueur quelconque (rad).

- `a` (*vec3*) : Vecteur.
- `b` (*vec3*) : Vecteur.
- **renvoie** : number Angle (rad).

#### `editor_toolUtilities_geom.angleBetweenVecsNorm(a, b)`

Petit angle entre deux vecteurs unitaires (rad).

- `a` (*vec3*) : Vecteur unitaire.
- `b` (*vec3*) : Vecteur unitaire.
- **renvoie** : number Angle (rad).

#### `editor_toolUtilities_geom.applyBankFraction(spline, bankT, peakRad)`

Fait rouler le repère par station d'une spline selon une fraction de dévers TOUTE FAITE (bankT[i] dans [-1, 1], + = courbe à gauche), peakRad étant l'angle atteint par une station de pleine amplitude. L'appelant gère la correspondance courbure -> fraction et le raccord en longueur d'arc (sinon le dévers devient un créneau).

- `spline` (*table*) : Spline (nodes, widths, nmls, divPoints, divWidths, normals, tangents, binormals, discMap, isLoop...).
- `bankT` (*number[]*) : Fraction de dévers par station.
- `peakRad` (*number*) : Angle de pleine amplitude (rad).

#### `editor_toolUtilities_geom.bridgeHoles2D(outer, holes, count)`

Fusionne des anneaux de trous dans l'anneau extérieur par des arêtes de pont. count plafonne le nombre de trous pris.

- `outer` (*table[]*) : Anneau extérieur (remis anti-horaire).
- `holes` (*table[][]*) : Trous (remis horaires, ponts par min-x croissant).
- `count` (*integer|nil*) : Nombre maximal de trous pris.
- **renvoie** : table[] Anneau fusionné.

#### `editor_toolUtilities_geom.catmullRomCentripetalFast(p0, p1, p2, p3, t, s, outVec)`

Version rapide et sans allocation de catmullRomCentripetal. Si outVec est fourni, l'écrit et le renvoie ; sinon crée un vec3.

- `p0` (*vec3*) : Point de contrôle.
- `p1` (*vec3*) : Point de contrôle.
- `p2` (*vec3*) : Point de contrôle.
- `p3` (*vec3*) : Point de contrôle.
- `t` (*number*) : Paramètre.
- `s` (*number*) : Paramètre de tension/knots (déduit du code).
- `outVec` (*vec3|nil*) : Sortie facultative.
- **renvoie** : vec3 Point interpolé.

#### `editor_toolUtilities_geom.catmullRomConformToTerrain(spline, minNumDivIn, minSpacing, rayRaise)`

Comme catmullRomRaycast mais les points sont conformés au terrain. Retombe sur catmullRomRaycast s'il n'y a pas de bloc de terrain.

- `spline` (*table*) : Spline (nodes, widths, nmls, divPoints, divWidths, normals, tangents, binormals, discMap, isLoop...).
- `minNumDivIn` (*integer|nil*) : Divisions minimales par segment.
- `minSpacing` (*number|nil*) : Espacement minimal (m).
- `rayRaise` (*number|nil*) : Élévation de départ du rayon (m).

#### `editor_toolUtilities_geom.catmullRomFree(spline, minNumDivIn, deckZ, maxSpacingIn)`

Interpole noeuds et largeurs avec des Catmull-Rom standard (XY centripète ; Z par Steffen pour une route au sol, Catmull-Rom lisse pour un tablier surélevé si deckZ). Les données sont stockées dans la spline.

- `spline` (*table*) : Spline (nodes, widths, nmls, divPoints, divWidths, normals, tangents, binormals, discMap, isLoop...).
- `minNumDivIn` (*integer|nil*) : Divisions minimales par segment (défaut 10).
- `deckZ` (*boolean|nil*) : Tablier surélevé : Z lissé par Catmull-Rom.
- `maxSpacingIn` (*number|nil*) : Espacement maximal entre divisions (défaut 20 m).

#### `editor_toolUtilities_geom.catmullRomFreeWithBanking(spline, minNumDivIn, bankStrength, maxDegIn, tuningIn, deckZ, maxSpacingIn)`

Comme catmullRomFree avec dévers automatique et raccord.

- `spline` (*table*) : Spline (nodes, widths, nmls, divPoints, divWidths, normals, tangents, binormals, discMap, isLoop...).
- `minNumDivIn` (*integer|nil*) : Divisions minimales.
- `bankStrength` (*number*) : Intensité du dévers.
- `maxDegIn` (*number|nil*) : Dévers maximal (degrés, défaut 15).
- `tuningIn` (*number|nil*) : Réglage de saturation (défaut 500).
- `deckZ` (*boolean|nil*) : Tablier surélevé.
- `maxSpacingIn` (*number|nil*) : Espacement maximal.

#### `editor_toolUtilities_geom.catmullRomNodesOnly(nodes, gran)`

Interpole les points donnés par des Catmull-Rom.

- `nodes` (*vec3[]*) : Points.
- `gran` (*integer*) : Granularité (subdivisions par segment).
- **renvoie** : vec3[] Points interpolés.

#### `editor_toolUtilities_geom.catmullRomNodesWidthsOnly(nodes, widths, gran, isLoop)`

Interpole points et largeurs par Catmull-Rom (un seul tableau de noeuds).

- `nodes` (*vec3[]*) : Points.
- `widths` (*number[]*) : Largeurs.
- `gran` (*integer*) : Granularité.
- `isLoop` (*boolean|nil*) : Boucle.
- **renvoie** : vec3[] Points.
- **renvoie** : number[] Largeurs.

#### `editor_toolUtilities_geom.catmullRomNodesWidthsVelVelLimits(spline, gran)`

Interpole points, largeurs, vitesses et limites de vitesse d'une spline par Catmull-Rom (un seul tableau de noeuds).

- `spline` (*table*) : Spline avec nodes, widths, vels, velLimits.
- `gran` (*integer*) : Granularité.
- **renvoie** : vec3[] Points.
- **renvoie** : number[] Largeurs.
- **renvoie** : number[] Vitesses.
- **renvoie** : number[] Limites de vitesse.

#### `editor_toolUtilities_geom.catmullRomRaycast(spline, minNumDivIn, minSpacing, rayRaise)`

Interpole noeuds et largeurs d'une spline par Catmull-Rom standard pour produire sa géométrie secondaire ; les points sont posés par lancer de rayon sur la surface en dessous. Les données sont stockées dans la spline (divPoints, divWidths, normals, discMap).

- `spline` (*table*) : Spline (nodes, widths, nmls, divPoints, divWidths, normals, tangents, binormals, discMap, isLoop...).
- `minNumDivIn` (*integer|nil*) : Nombre minimal de divisions par segment (défaut 10).
- `minSpacing` (*number|nil*) : Espacement minimal entre points (m).
- `rayRaise` (*number|nil*) : Élévation de départ du rayon (m) ; défaut spline.rayRaise.

#### `editor_toolUtilities_geom.chordify(pts, n, chord, flags)`

Réduit une courbe tessellée à des cordes d'environ chord mètres ; les points drapeautés (flags) sont toujours gardés, ainsi que les extrémités.

- `pts` (*table[]*) : Points.
- `n` (*integer*) : Nombre de points.
- `chord` (*number*) : Longueur de corde (m).
- `flags` (*table|nil*) : Drapeaux par point.
- **renvoie** : table[] Points gardés.
- **renvoie** : table|nil Drapeaux correspondants.

#### `editor_toolUtilities_geom.clipRingRect2D(pts, x0, x1, y0, y1)`

Découpe un anneau à la boîte x0..x1, y0..y1. Un anneau concave revient en un seul anneau qui longe le bord de la boîte entre ses morceaux, ce qui couvre la même surface dans la boîte.

- `pts` (*table[]*) : Anneau.
- `x0` (*number*) : X min.
- `x1` (*number*) : X max.
- `y0` (*number*) : Y min.
- `y1` (*number*) : Y max.
- **renvoie** : table[] Anneau découpé (peut avoir moins de 3 points).

#### `editor_toolUtilities_geom.closestPointOnPolyline(pts, p, outPos)`

Point le plus proche de p sur une polyligne 3D. Écrit le résultat dans outPos et renvoie la distance au carré.

- `pts` (*vec3[]*) : Polyligne.
- `p` (*vec3*) : Point.
- `outPos` (*vec3*) : Reçoit le point le plus proche.
- **renvoie** : number Distance au carré (m^2).

#### `editor_toolUtilities_geom.closestPointOnPolyline2D(pts, p, outPos, tMin, tMax, closed)`

Point le plus proche de p sur une polyligne, mesuré en XY (Z interpolé). Écrit dans outPos et renvoie la distance au carré.

- `pts` (*vec3[]*) : Polyligne.
- `p` (*vec3*) : Point.
- `outPos` (*vec3*) : Reçoit le point.
- `tMin` (*number|nil*) : Borne basse de recherche (déduit du code).
- `tMax` (*number|nil*) : Borne haute de recherche (déduit du code).
- `closed` (*boolean|nil*) : Polyligne fermée.
- **renvoie** : number Distance au carré.

#### `editor_toolUtilities_geom.closestRibbonSegPointToPoint(segIdx, ribbon, p)`

Point le plus proche, sur un segment de ruban donné, d'un point donné.

- `segIdx` (*integer*) : Indice du segment.
- `ribbon` (*table*) : Ruban.
- `p` (*vec3*) : Point.
- **renvoie** : any|nil Point le plus proche (nil, nil si indisponible).
- **renvoie** : number|nil Distance au carré.

#### `editor_toolUtilities_geom.computeFrenetFrame(spline)`

Calcule le repère de Frenet local à chaque point de division (tangents, binormals, normals). Les segments de longueur nulle ne doivent pas être normalisés (sinon binormales NaN et noeuds DecalRoad infinis).

- `spline` (*table*) : Spline (nodes, widths, nmls, divPoints, divWidths, normals, tangents, binormals, discMap, isLoop...).

#### `editor_toolUtilities_geom.computeGraphPathFromNodes(spline)`

Calcule le chemin de graphe à partir des noeuds et remplit la géométrie de la spline (divPoints, divWidths, normals). Sans effet s'il n'y a pas assez de noeuds.

- `spline` (*table*) : Spline (nodes, widths, nmls, divPoints, divWidths, normals, tangents, binormals, discMap, isLoop...).

#### `editor_toolUtilities_geom.computeRandomJitterQuat(spline, tgt, rightVec, nmlVec, outQuat)`

Quaternion de variation aléatoire, par composante.

- `spline` (*table*) : Spline (nodes, widths, nmls, divPoints, divWidths, normals, tangents, binormals, discMap, isLoop...).
- `tgt` (*vec3*) : Tangente.
- `rightVec` (*vec3*) : Vecteur droit.
- `nmlVec` (*vec3*) : Normale.
- `outQuat` (*quat*) : Reçoit le résultat.
- **renvoie** : quat outQuat.

#### `editor_toolUtilities_geom.computeRandomJitterQuatFromFreedomAxes(spline, freedomAxes, outQuat)`

Quaternion de variation aléatoire d'après les axes de liberté de jointure.

- `spline` (*table*) : Spline (nodes, widths, nmls, divPoints, divWidths, normals, tangents, binormals, discMap, isLoop...).
- `freedomAxes` (*table*) : Axes de liberté.
- `outQuat` (*quat*) : Reçoit le résultat.
- **renvoie** : quat outQuat.

#### `editor_toolUtilities_geom.computeRandomJitterQuat_ZOnly(jitter, nmlVec, outQuat)`

Quaternion de variation aléatoire autour de Z seulement.

- `jitter` (*number*) : Amplitude.
- `nmlVec` (*vec3*) : Normale.
- `outQuat` (*quat*) : Reçoit le résultat.
- **renvoie** : quat outQuat.

#### `editor_toolUtilities_geom.computeSDF(mask)`

Calcule le champ de distance signé (SDF) d'un masque (tableau 2D, 0 = dedans).

- `mask` (*number[][]*) : Masque mask[y][x].
- **renvoie** : number[][] Champ de distance.

#### `editor_toolUtilities_geom.computeSourcesAABB(sources)`

Boîte englobante (XY) des sources données.

- `sources` (*table[]*) : Sources (points ou splines, déduit du code).
- **renvoie** : table { xMin, xMax, yMin, yMax }.

#### `editor_toolUtilities_geom.computeSplinePolygon(spline, margin, polygon)`

Calcule un contour polygonal autour d'une spline (bords gauche et droit à la demi-largeur + marge, prolongés de 10 m aux deux bouts). Rapide à traiter par spans de scanline. Remplit le tableau polygon.

- `spline` (*table*) : Spline avec divPoints, tangents, binormals, divWidths.
- `margin` (*number*) : Marge latérale (m).
- `polygon` (*table*) : Tableau de sortie, vidé puis rempli de vec3.

#### `editor_toolUtilities_geom.computeTurningRadius(p1, p2, p3)`

Rayon de courbure approché par 3 points consécutifs (moyenne des longueurs des deux côtés divisée par tan(angle/2)).

- `p1` (*vec3*) : Point.
- `p2` (*vec3*) : Point central.
- `p3` (*vec3*) : Point.
- **renvoie** : number Rayon (m).

#### `editor_toolUtilities_geom.cornerAxis(ix, iy, ox, oy, period)`

Direction que prend un poteau, un pilier ou un potelet PLACÉ SUR UN COIN, d'après la direction d'entrée et de sortie : l'axe est tourné de la moitié du virage réduit modulo period (défaut pi/2). Les égalités vont au plus petit virage pour que des coins à gauche et à droite se miroitent.

- `ix` (*number*) : Direction d'entrée x.
- `iy` (*number*) : Direction d'entrée y.
- `ox` (*number*) : Direction de sortie x.
- `oy` (*number*) : Direction de sortie y.
- `period` (*number|nil*) : Période de symétrie du poteau (rad, défaut pi/2).
- **renvoie** : number cos de l'axe.
- **renvoie** : number sin de l'axe.

#### `editor_toolUtilities_geom.cross2(ax, ay, bx, by)`

Produit vectoriel scalaire 2D de (ax, ay) et (bx, by), sur composantes simples (sans allocation de vec3 ou de table).

- `ax` (*number*) : A x.
- `ay` (*number*) : A y.
- `bx` (*number*) : B x.
- `by` (*number*) : B y.
- **renvoie** : number ax*by - ay*bx.

#### `editor_toolUtilities_geom.curvatureToBankAngle(curv, bankStrength, maxDeg, tuning)`

Convertit une courbure en angle de dévers (rad). maxDeg (plafond sur les virages les plus serrés, défaut 15) et tuning (courbure à laquelle le plafond est atteint, défaut 500) sont des surcharges facultatives.

- `curv` (*number*) : Courbure.
- `bankStrength` (*number*) : Intensité du dévers.
- `maxDeg` (*number|nil*) : Plafond (degrés).
- `tuning` (*number|nil*) : Réglage de saturation.
- **renvoie** : number Angle de dévers (rad).

#### `editor_toolUtilities_geom.densifyByMaxSpacing(points, maxSpacing)`

Densifie une polyligne pour qu'aucun segment ne dépasse maxSpacing.

- `points` (*table[]*) : Polyligne.
- `maxSpacing` (*number*) : Espacement maximal (m).
- **renvoie** : table[] Polyligne densifiée.

#### `editor_toolUtilities_geom.distSqPointSeg2D(px, py, ax, ay, bx, by)`

Distance au carré du point (px, py) au segment FINI AB (t borné au segment). Pour les tests de proximité fréquents.

- `px` (*number*) : Point x.
- `py` (*number*) : Point y.
- `ax` (*number*) : A x.
- `ay` (*number*) : A y.
- `bx` (*number*) : B x.
- `by` (*number*) : B y.
- **renvoie** : number Distance au carré.

#### `editor_toolUtilities_geom.dot2(ax, ay, bx, by)`

Produit scalaire 2D sur composantes simples.

- `ax` (*number*) : A x.
- `ay` (*number*) : A y.
- `bx` (*number*) : B x.
- `by` (*number*) : B y.
- **renvoie** : number ax*bx + ay*by.

#### `editor_toolUtilities_geom.flipSplineDirection(spline)`

Inverse le sens d'une spline sur place (noeuds, normales, corners) et marque spline.isDirty.

- `spline` (*table*) : Spline (nodes, widths, nmls, divPoints, divWidths, normals, tangents, binormals, discMap, isLoop...).

#### `editor_toolUtilities_geom.getAABB(points)`

Boîte englobante alignée aux axes (XY) d'un tableau de points.

- `points` (*vec3[]*) : Points.
- **renvoie** : table { xMin, xMax, yMin, yMax }.

#### `editor_toolUtilities_geom.getAllQuadrilaterals(sources, margin)`

Construit les quadrilatères des sources, avec gonflement latéral (sans étirement longitudinal).

- `sources` (*table[]*) : Sources de type spline.
- `margin` (*number*) : Marge latérale (m).
- **renvoie** : table[] Quads.

#### `editor_toolUtilities_geom.getBarScale()`

Renvoie le facteur d'échelle des barres de vitesse (hauteur = barScale * vitesse, 0.5).

- **renvoie** : number Facteur.

#### `editor_toolUtilities_geom.getNodeSpansInsidePolygon(nodes, polygon)`

Étant donné une polyligne et un polygone, renvoie les suites d'indices consécutifs qui sont dans le polygone.

- `nodes` (*vec3[]*) : Polyligne.
- `polygon` (*table[]*) : Polygone.
- **renvoie** : table[] Suites d'indices.

#### `editor_toolUtilities_geom.getPreRotQuats()`

Renvoie la table des quaternions de pré-rotation indexée de 0 à 3 (0, 90, 180, 270 degrés autour de Z).

- **renvoie** : table<integer, quat> Quaternions de pré-rotation.

#### `editor_toolUtilities_geom.getScanlineSpans(gMinY, gMaxY, te, tb, polygon, spansXMin, spansXMax, spansY)`

Calcule les spans de scanline d'un polygone sur l'axe Y, en espace de grille de terrain. Stocke les résultats dans spansXMin, spansXMax et spansY.

- `gMinY` (*integer*) : Rangée de grille minimale.
- `gMaxY` (*integer*) : Rangée de grille maximale.
- `te` (*userdata*) : Éditeur de terrain (gridToWorldByPoint2I).
- `tb` (*userdata*) : Bloc de terrain.
- `polygon` (*table[]*) : Polygone en monde.
- `spansXMin` (*table*) : Sortie, vidée.
- `spansXMax` (*table*) : Sortie.
- `spansY` (*table*) : Sortie.

#### `editor_toolUtilities_geom.getTerrainNormal(p)`

Normale du terrain au point monde donné.

- `p` (*vec3*) : Point monde.
- **renvoie** : vec3 Normale.

#### `editor_toolUtilities_geom.getTerrainNormalInPlace(p, out)`

Normale du terrain au point monde donné, écrite dans out.

- `p` (*vec3*) : Point monde.
- `out` (*vec3*) : Reçoit la normale.

#### `editor_toolUtilities_geom.insetClosedRing2D(ring, dist)`

Rétrécit un polygone fermé de {x, y} vers l'intérieur d'au plus dist, le long de la normale moyenne des arêtes de chaque sommet (vraie direction intérieure locale, correcte pour les anneaux concaves).

- `ring` (*table[]*) : Anneau.
- `dist` (*number*) : Distance (m).
- **renvoie** : table[] Anneau rétréci.

#### `editor_toolUtilities_geom.insetPathAlongNormal2D(path, cx, cy, insetM)`

Décale un chemin 2D vers le centre (cx, cy) de insetM le long de la normale locale (déduit du code).

- `path` (*table[]*) : Chemin.
- `cx` (*number*) : Centre x.
- `cy` (*number*) : Centre y.
- `insetM` (*number*) : Retrait (m).
- **renvoie** : table[] Nouveau chemin.

#### `editor_toolUtilities_geom.intersection2LineSegs(p1, p2, q1, q2, out)`

Point d'intersection de deux segments (en ligne). Renvoie nil sans intersection.

- `p1` (*vec3*) : Début du segment 1.
- `p2` (*vec3*) : Fin du segment 1.
- `q1` (*vec3*) : Début du segment 2.
- `q2` (*vec3*) : Fin du segment 2.
- `out` (*vec3*) : Reçoit le point.
- **renvoie** : vec3|nil out ou nil.

#### `editor_toolUtilities_geom.intersectsUpQuadBarycentric(p, q)`

Intersecte un point (x, y) avec un quad et renvoie la hauteur interpolée à cet endroit, ou false si hors du quad.

- `p` (*vec3*) : Point.
- `q` (*table*) : Quad : 4 sommets vec3.
- **renvoie** : number|boolean Hauteur ou false.

#### `editor_toolUtilities_geom.isLineSegIntersect(a, b, c, d)`

Teste si le segment (a, b) coupe le segment (c, d).

- `a` (*vec3*) : Début de ab.
- `b` (*vec3*) : Fin de ab.
- `c` (*vec3*) : Début de cd.
- `d` (*vec3*) : Fin de cd.
- **renvoie** : boolean Intersection.

#### `editor_toolUtilities_geom.isMouseOverBar(splines)`

Teste si la souris survole une barre (splines avec un tableau barPoints ordonné).

- `splines` (*table[]*) : Splines à tester.
- **renvoie** : boolean Survol.
- **renvoie** : integer|nil Indice de spline.
- **renvoie** : integer|nil Indice de barre.

#### `editor_toolUtilities_geom.isMouseOverGraphNode(nodes)`

Teste si la souris survole un noeud du graphe de navigation.

- `nodes` (*table*) : Noeuds du graphe (indexés par clé).
- **renvoie** : boolean Survol.
- **renvoie** : any|nil Clé du noeud.

#### `editor_toolUtilities_geom.isMouseOverNode(splines)`

Teste si la souris survole un noeud d'une des splines (tolérance 2 m). Chaque spline doit avoir un tableau nodes.

- `splines` (*table[]*) : Splines à tester.
- **renvoie** : boolean Survol.
- **renvoie** : integer|nil Indice de spline.
- **renvoie** : integer|nil Indice de noeud.

#### `editor_toolUtilities_geom.isMouseOverPolyline(points, mousePos, closed)`

Teste si la souris survole une polyligne ; closed teste aussi l'arête du dernier noeud au premier.

- `points` (*vec3[]*) : Polyligne.
- `mousePos` (*vec3*) : Position de la souris.
- `closed` (*boolean|nil*) : Polygone fermé.
- **renvoie** : boolean Survol.
- **renvoie** : integer|nil Indice du segment.

#### `editor_toolUtilities_geom.isMouseOverSpline(spline, maxDistSq)`

Teste si la souris survole la spline (pour insérer un noeud ou survol). Utilise l'approche la plus proche rayon-caméra / axe, donc les routes surélevées marchent. maxDistSq : tolérance au carré (math.huge pour obtenir le point le plus proche sans condition).

- `spline` (*table*) : Spline (nodes, widths, nmls, divPoints, divWidths, normals, tangents, binormals, discMap, isLoop...).
- `maxDistSq` (*number|nil*) : Tolérance rayon-axe au carré (défaut 1).
- **renvoie** : boolean Survol.
- **renvoie** : integer|nil Indice de segment.
- **renvoie** : vec3|nil Point sur la spline.

#### `editor_toolUtilities_geom.isPointInTriangle(p, a, b, c)`

Teste si p est dans le triangle (a, b, c) (coordonnées barycentriques).

- `p` (*vec3*) : Point.
- `a` (*vec3*) : Sommet.
- `b` (*vec3*) : Sommet.
- `c` (*vec3*) : Sommet.
- **renvoie** : boolean Dedans.

#### `editor_toolUtilities_geom.joinSplineGeometry(n1, w1, nm1, nodeIdx1, n2, w2, nm2, nodeIdx2, c1, c2)`

Joint deux géométries de spline aux indices de noeud donnés. Renvoie nil si les indices sont invalides.

- `n1` (*vec3[]*) : Noeuds 1.
- `w1` (*number[]*) : Largeurs 1.
- `nm1` (*vec3[]*) : Normales 1.
- `nodeIdx1` (*integer*) : Indice de jonction 1.
- `n2` (*vec3[]*) : Noeuds 2.
- `w2` (*number[]*) : Largeurs 2.
- `nm2` (*vec3[]*) : Normales 2.
- `nodeIdx2` (*integer*) : Indice de jonction 2.
- `c1` (*table|nil*) : Surcharges de virages 1.
- `c2` (*table|nil*) : Surcharges 2.
- **renvoie** : table|nil nodesNew.
- **renvoie** : table|nil widthsNew.
- **renvoie** : table|nil nmlsNew.
- **renvoie** : table|nil cornersNew.

#### `editor_toolUtilities_geom.lineDirsHitT2D(p0x, p0y, d0x, d0y, p1x, p1y, d1x, d1y, eps)`

Paramètre t le long de p0 + t*d0 au point d'intersection avec p1 + u*d1 ; nil si parallèles. Avec d0 unitaire, t est en mètres.

- `p0x` (*number*) : Point 0 x.
- `p0y` (*number*) : Point 0 y.
- `d0x` (*number*) : Direction 0 x.
- `d0y` (*number*) : Direction 0 y.
- `p1x` (*number*) : Point 1 x.
- `p1y` (*number*) : Point 1 y.
- `d1x` (*number*) : Direction 1 x.
- `d1y` (*number*) : Direction 1 y.
- `eps` (*number*) : Tolérance de parallélisme.
- **renvoie** : number|nil t, ou nil.

#### `editor_toolUtilities_geom.lineIntersect2D(px, py, dx, dy, qx, qy, ex, ey, eps)`

Intersection de deux droites INFINIES P+s*D et Q+s*E ; renvoie ix, iy ou nil si parallèles.

- `px` (*number*) : P x.
- `py` (*number*) : P y.
- `dx` (*number*) : D x.
- `dy` (*number*) : D y.
- `qx` (*number*) : Q x.
- `qy` (*number*) : Q y.
- `ex` (*number*) : E x.
- `ey` (*number*) : E y.
- `eps` (*number|nil*) : Tolérance de parallélisme.
- **renvoie** : number|nil ix.
- **renvoie** : number|nil iy.

#### `editor_toolUtilities_geom.linesIntersect2D(a0, a1, b0, b1, eps)`

Intersection de deux droites a0-a1 et b0-b1. Renvoie nil si parallèles.

- `a0` (*table*) : Point.
- `a1` (*table*) : Point.
- `b0` (*table*) : Point.
- `b1` (*table*) : Point.
- `eps` (*number*) : Tolérance.
- **renvoie** : table|nil { pt = {x, y}, alongA, alongB } (codes along de Martinez).

#### `editor_toolUtilities_geom.multiPolygonCentroidXY(regions)`

Centroïde pondéré par l'aire d'un ou plusieurs anneaux fermés 2D ({x, y}). Renvoie cx, cy ou nil.

- `regions` (*table[]*) : Anneaux.
- **renvoie** : number|nil cx.
- **renvoie** : number|nil cy.

#### `editor_toolUtilities_geom.normalize2(x, y)`

Normalise un vecteur 2D (x, y).

- `x` (*number*) : x.
- `y` (*number*) : y.
- **renvoie** : number x normalisé.
- **renvoie** : number y normalisé.

#### `editor_toolUtilities_geom.offsetPathFromCenter2D(path, cx, cy, distM, distArr)`

Décale une polyligne 2D à l'opposé de (cx, cy) le long de sa normale locale par sommet.

- `path` (*table[]*) : Polyligne.
- `cx` (*number*) : Centre x.
- `cy` (*number*) : Centre y.
- `distM` (*number*) : Distance (m).
- `distArr` (*number[]|nil*) : Distances par sommet (déduit du code).
- **renvoie** : table[] Points décalés.

#### `editor_toolUtilities_geom.offsetPathMiter2D(pts, dist, cx, cy, z, inward)`

Décalage parallèle à angles biseautés (miter) d'une polyligne 2D OUVERTE : un point de sortie par sommet (les rails appairés restent alignés), z conservé. Les coins gardent la vraie largeur perpendiculaire. Le côté est choisi UNE fois pour tout le chemin : à l'opposé de (cx, cy), ou vers lui si inward.

- `pts` (*table[]*) : Polyligne ouverte.
- `dist` (*number*) : Distance de décalage (m).
- `cx` (*number*) : Centre x.
- `cy` (*number*) : Centre y.
- `z` (*number|nil*) : Z imposé (déduit du code).
- `inward` (*boolean|nil*) : Décaler vers le centre.
- **renvoie** : table[] Points décalés.

#### `editor_toolUtilities_geom.outsetClosedRing2D(ring, dist)`

Pousse un anneau fermé VERS L'EXTÉRIEUR d'une petite distance, coins biseautés (mitrés).

- `ring` (*table[]*) : Anneau.
- `dist` (*number*) : Distance (m).
- **renvoie** : table[]|nil Anneau agrandi.

#### `editor_toolUtilities_geom.outsetRingSides2D(ring, dist, move)`

Comme outsetClosedRing2D mais seulement pour les côtés désignés par move[i] ; les autres restent exactement sur leur droite. Un sommet entre un côté mobile et un côté fixe glisse le long du côté fixe : pas d'encoche, nombre de sommets inchangé.

- `ring` (*table[]*) : Anneau.
- `dist` (*number*) : Distance (m).
- `move` (*table<integer, boolean>*) : Côtés à déplacer.
- **renvoie** : table[] Anneau.

#### `editor_toolUtilities_geom.perpDistPointSeg2D(ax, ay, bx, by, px, py)`

Distance perpendiculaire du point (px, py) au segment (ax, ay)->(bx, by) en XY. Segment dégénéré : distance à A. Attention à l'ordre des arguments : les points du segment d'abord.

- `ax` (*number*) : A x.
- `ay` (*number*) : A y.
- `bx` (*number*) : B x.
- `by` (*number*) : B y.
- `px` (*number*) : Point x.
- `py` (*number*) : Point y.
- **renvoie** : number Distance (m).

#### `editor_toolUtilities_geom.pointAboveOrOnLine2D(pt, left, right, eps)`

Le point est-il au-dessus ou sur la droite left->right (produit vectoriel >= -eps).

- `pt` (*table*) : Point.
- `left` (*table*) : Début.
- `right` (*table*) : Fin.
- `eps` (*number*) : Tolérance.
- **renvoie** : boolean Résultat.

#### `editor_toolUtilities_geom.pointBetween2D(p, left, right, eps)`

Pour un p supposé aligné avec left->right : faux s'il est une extrémité ou en dehors. Testé sur le produit scalaire (unité m^2) et non sur la position normalisée, pour ne pas fendre un segment à sa propre extrémité (ce qui donnerait une pièce de longueur nulle).

- `p` (*table*) : Point.
- `left` (*table*) : Début.
- `right` (*table*) : Fin.
- `eps` (*number*) : Tolérance.
- **renvoie** : boolean Strictement entre.

#### `editor_toolUtilities_geom.pointInQuadBarycentric(p, q)`

Détermine si un point est dans un quad (en XY).

- `p` (*vec3*) : Point.
- `q` (*table*) : Quad : 4 sommets.
- **renvoie** : boolean Dedans.

#### `editor_toolUtilities_geom.pointInRing2D(px, py, ring)`

Point dans un polygone 2D (tir de rayon, pair-impair), indifférent au sens de l'anneau. Les sommets sont des {x, y}.

- `px` (*number*) : Point x.
- `py` (*number*) : Point y.
- `ring` (*table[]*) : Anneau.
- **renvoie** : boolean Dedans.

#### `editor_toolUtilities_geom.pointInTri2D(px, py, ax, ay, bx, by, cx, cy)`

Point dans un triangle 2D (barycentrique), en scalaires pour les boucles serrées comme l'ear clipping.

- `px` (*number*) : Point x.
- `py` (*number*) : Point y.
- `ax` (*number*) : A x.
- `ay` (*number*) : A y.
- `bx` (*number*) : B x.
- `by` (*number*) : B y.
- `cx` (*number*) : C x.
- `cy` (*number*) : C y.
- **renvoie** : boolean Dedans.

#### `editor_toolUtilities_geom.pointsCollinear2D(a, b, c, eps)`

Trois points sont-ils alignés en XY (|produit vectoriel| < eps).

- `a` (*table*) : Point.
- `b` (*table*) : Point.
- `c` (*table*) : Point.
- `eps` (*number*) : Tolérance.
- **renvoie** : boolean Alignés.

#### `editor_toolUtilities_geom.pointsCompare2D(a, b, eps)`

Comparaison de deux points en XY, pour un tri (-1 ou 1, d'abord par x puis par y).

- `a` (*table*) : Point.
- `b` (*table*) : Point.
- `eps` (*number*) : Tolérance sur x.
- **renvoie** : integer -1 si a avant b, sinon 1.

#### `editor_toolUtilities_geom.pointsSame2D(a, b, eps)`

Deux points sont-ils confondus en XY à eps près (par composante).

- `a` (*table*) : Point {x, y}.
- `b` (*table*) : Point.
- `eps` (*number*) : Tolérance.
- **renvoie** : boolean Identiques.

#### `editor_toolUtilities_geom.polygonOBB(poly)`

Boîte englobante orientée d'un polygone 2D par ACP. Les points sont des paires [1]=x, [2]=y.

- `poly` (*number[][]*) : Polygone.
- **renvoie** : number Centre x.
- **renvoie** : number Centre y.
- **renvoie** : number Demi-largeur le long de l'axe principal.
- **renvoie** : number Demi-largeur transversale.
- **renvoie** : number Angle theta de l'axe principal (rad).

#### `editor_toolUtilities_geom.polylineCumLength2D(pts, out)`

Cousine 2D (XY seul) de polylineCumLength3D pour des points {x, y} simples : out[i] = distance de pts[1] à pts[i]. Un tableau out réutilisable évite les allocations.

- `pts` (*table[]*) : Polyligne.
- `out` (*number[]|nil*) : Tableau réutilisé (vidé puis rempli).
- **renvoie** : number[] out.
- **renvoie** : number Longueur totale.

#### `editor_toolUtilities_geom.polylineCumLength3D(pts)`

Longueurs cumulées 3D le long d'une polyligne.

- `pts` (*vec3[]*) : Polyligne.
- **renvoie** : number[] cum[1..n].
- **renvoie** : number Longueur totale.

#### `editor_toolUtilities_geom.polylineZAtArcFromTip(pts, cum, total, fromStart, dist)`

Z du premier échantillon à la distance d'arc dist depuis le bout début ou fin.

- `pts` (*vec3[]*) : Polyligne.
- `cum` (*number[]*) : Longueurs cumulées.
- `total` (*number*) : Longueur totale.
- `fromStart` (*boolean*) : Mesurer depuis le début.
- `dist` (*number*) : Distance (m).
- **renvoie** : number Z.

#### `editor_toolUtilities_geom.populateTreeQuads(quads)`

Crée et remplit un kd-tree contenant les quads donnés.

- `quads` (*table[]*) : Quads.
- **renvoie** : table Arbre kdtreebox2d.

#### `editor_toolUtilities_geom.projectPointToSpline(pos, spline)`

Projette un point sur une spline. Renvoie nil si hors des bornes des segments.

- `pos` (*vec3*) : Point.
- `spline` (*table*) : Spline.
- **renvoie** : vec3|nil Point projeté le plus proche.
- **renvoie** : number|nil s dans [0,1].
- **renvoie** : number|nil t latéral dans [-inf, inf].

#### `editor_toolUtilities_geom.quadUV(px, py, q1, q2, q3, q4)`

Bilinéaire inverse dans le plan XY : le (u, v) tel que p = lerp(lerp(q1, q2, u), lerp(q3, q4, u), v), ou nil si p est hors du quad. u court de q1 vers q2, v de q1 vers q3.

- `px` (*number*) : Point x.
- `py` (*number*) : Point y.
- `q1` (*table*) : Coin 1.
- `q2` (*table*) : Coin 2.
- `q3` (*table*) : Coin 3.
- `q4` (*table*) : Coin 4.
- **renvoie** : number|nil u.
- **renvoie** : number|nil v.

#### `editor_toolUtilities_geom.rayIntersect2D(px, py, dx, dy, qx, qy, ex, ey, eps)`

Intersection de deux RAYONS (vers l'avant seulement) P+s*D et Q+u*E ; renvoie ix, iy ou nil (parallèles ou point derrière l'un des rayons).

- `px` (*number*) : P x.
- `py` (*number*) : P y.
- `dx` (*number*) : D x.
- `dy` (*number*) : D y.
- `qx` (*number*) : Q x.
- `qy` (*number*) : Q y.
- `ex` (*number*) : E x.
- `ey` (*number*) : E y.
- `eps` (*number|nil*) : Tolérance.
- **renvoie** : number|nil ix.
- **renvoie** : number|nil iy.

#### `editor_toolUtilities_geom.resampleUniformNodesWidths(nodes, widths, spacing)`

Rééchantillonne une polyligne (noeuds et largeurs) à pas régulier.

- `nodes` (*vec3[]*) : Noeuds.
- `widths` (*number[]*) : Largeurs.
- `spacing` (*number*) : Pas (m).
- **renvoie** : vec3[] Nouveaux noeuds (les largeurs correspondantes sont aussi produites, déduit du code).

#### `editor_toolUtilities_geom.reshapeLeadInBezier2D(nodes, fromStart, p0x, p0y, gx, gy, L)`

Remodèle sur place UNE extrémité d'une polyligne de noeuds (x/y, z inchangé) selon une Bézier d'amorce vers un point but, sur une longueur L.

- `nodes` (*vec3[]*) : Noeuds modifiés.
- `fromStart` (*boolean*) : true : le début est l'extrémité mobile.
- `p0x` (*number*) : Pointe x (déduit du code).
- `p0y` (*number*) : Pointe y.
- `gx` (*number*) : But x (déduit du code).
- `gy` (*number*) : But y.
- `L` (*number*) : Longueur remodelée (m).

#### `editor_toolUtilities_geom.ribbonIntervalFrame(p1, p2, t1, t2, n1, n2, outPos, outTan, outUp, prevAcross)`

Repère à mi-intervalle pour des panneaux rigides de kit sur un bord incliné ou en dévers (clôtures, glissières).

- `p1` (*vec3*) : Début.
- `p2` (*vec3*) : Fin.
- `t1` (*vec3*) : Tangente début.
- `t2` (*vec3*) : Tangente fin.
- `n1` (*vec3*) : Normale début.
- `n2` (*vec3*) : Normale fin.
- `outPos` (*vec3*) : Reçoit la position.
- `outTan` (*vec3*) : Reçoit la tangente.
- `outUp` (*vec3*) : Reçoit le haut.
- `prevAcross` (*vec3|nil*) : Latéral précédent.

#### `editor_toolUtilities_geom.ribbonOverlapEnd2D(hx, hy, a, aFromStart, b, bFromStart, clearM, stepM, maxM)`

Où deux rubans (routes) partant d'une même jonction cessent de se chevaucher, en longueur d'arc le long de A depuis le centre (hx, hy). Renvoie maxM si aucun ruban utilisable.

- `hx` (*number*) : X du centre de jonction.
- `hy` (*number*) : Y du centre.
- `a` (*table*) : Points du ruban A.
- `aFromStart` (*boolean*) : A part de son premier point.
- `b` (*table*) : Points du ruban B.
- `bFromStart` (*boolean*) : B part de son premier point.
- `clearM` (*number*) : Distance de dégagement (m).
- `stepM` (*number*) : Pas de recherche (m, doit être > 0).
- `maxM` (*number*) : Longueur maximale (m).
- **renvoie** : number Longueur d'arc (m).

#### `editor_toolUtilities_geom.ribbonUpFromAlong(along, upRef, outUp, prevAcross)`

Vecteur haut du ruban de route pour une direction along unitaire : up perpendiculaire à along, roulis pris sur upRef. prevAcross garde le signe latéral continu le long d'une série de placements.

- `along` (*vec3*) : Direction unitaire.
- `upRef` (*vec3*) : Haut de référence.
- `outUp` (*vec3*) : Reçoit le haut.
- `prevAcross` (*vec3|nil*) : Vecteur latéral précédent.

#### `editor_toolUtilities_geom.ringSignedArea2(ring)`

Deux fois l'aire signée d'un anneau 2D de {x, y} ; positif = anti-horaire (x à droite, y en haut).

- `ring` (*table[]*) : Anneau.
- **renvoie** : number 2 x aire signée.

#### `editor_toolUtilities_geom.rotateVecAroundAxis(v, k, theta)`

Tourne le vecteur v autour de l'axe unitaire k de l'angle theta (formule de Rodrigues).

- `v` (*vec3*) : Vecteur.
- `k` (*vec3*) : Axe unitaire.
- `theta` (*number*) : Angle (rad).
- **renvoie** : vec3 Copie du résultat.

#### `editor_toolUtilities_geom.rotateVecAroundAxisInlined(v, k, theta, out)`

Comme rotateVecAroundAxis sans allocation : out = v*cos + (k x v)*sin + k*(k.v)*(1-cos).

- `v` (*vec3*) : Vecteur.
- `k` (*vec3*) : Axe unitaire.
- `theta` (*number*) : Angle (rad).
- `out` (*vec3*) : Reçoit le résultat.
- **renvoie** : vec3 out.

#### `editor_toolUtilities_geom.rotateVecAroundZ(vec, v, angle)`

Tourne le vecteur v autour de l'axe Z de l'angle donné, sur place (la fonction reçoit vec comme destination).

- `vec` (*vec3*) : Vecteur modifié.
- `v` (*vec3*) : Vecteur source (déduit du code).
- `angle` (*number*) : Angle (rad).

#### `editor_toolUtilities_geom.sampleCubicBezier2D(p0, p1, p2, p3, segs)`

Échantillonne une Bézier cubique en XY (extrémités incluses).

- `p0` (*table*) : Point de contrôle.
- `p1` (*table*) : Point de contrôle.
- `p2` (*table*) : Point de contrôle.
- `p3` (*table*) : Point de contrôle.
- `segs` (*integer|nil*) : Nombre de segments (défaut 14).
- **renvoie** : table[] Points.

#### `editor_toolUtilities_geom.sampleSpline(divPoints, tangents, normals, spacing, outPosns, outTans, outNormals)`

Échantillonne à longueur d'arc réelle une polyligne pour calculer positions et repère de Frenet à intervalles réguliers. Sans effet si spacing n'est pas > 0.

- `divPoints` (*vec3[]*) : Points de division.
- `tangents` (*vec3[]*) : Tangentes.
- `normals` (*vec3[]*) : Normales.
- `spacing` (*number*) : Pas (m).
- `outPosns` (*vec3[]*) : Sortie positions (vidée).
- `outTans` (*vec3[]*) : Sortie tangentes.
- `outNormals` (*vec3[]*) : Sortie normales.
- **renvoie** : vec3[] outPosns.
- **renvoie** : vec3[] outTans.
- **renvoie** : vec3[] outNormals.

#### `editor_toolUtilities_geom.sampleSplineAdaptive(divPoints, tangents, normals, meshLength, outPosns, outTans, outNormals, outScales)`

Échantillonnage adaptatif le long d'une spline : calcule positions, repère de Frenet et échelles par pas de meshLength ; l'échelle (minimum 0.01) dépend de la courbure (sensibilité kappaSensitivity = 150). Sans effet si meshLength n'est pas > 0.

- `divPoints` (*vec3[]*) : Points de division.
- `tangents` (*vec3[]*) : Tangentes.
- `normals` (*vec3[]*) : Normales.
- `meshLength` (*number*) : Longueur de maille nominale (m).
- `outPosns` (*vec3[]*) : Sortie positions.
- `outTans` (*vec3[]*) : Sortie tangentes.
- `outNormals` (*vec3[]*) : Sortie normales.
- `outScales` (*number[]*) : Sortie échelles (minimum 0.01).
- **renvoie** : vec3[] outPosns.
- **renvoie** : vec3[] outTans.
- **renvoie** : vec3[] outNormals.
- **renvoie** : number[] outScales.

#### `editor_toolUtilities_geom.sampleSplineEvenFit(divPoints, tangents, normals, targetSpacing, isLoop, outPosns, outTans, outNormals)`

Échantillonneur à répartition ajustée pour des objets discrets (lampadaires, bornes) : le pas est ajusté pour que la longueur totale soit un nombre entier d'intervalles.

- `divPoints` (*vec3[]*) : Points de division.
- `tangents` (*vec3[]*) : Tangentes.
- `normals` (*vec3[]*) : Normales.
- `targetSpacing` (*number*) : Pas visé (m, > 0).
- `isLoop` (*boolean*) : Spline en boucle.
- `outPosns` (*vec3[]*) : Sortie positions.
- `outTans` (*vec3[]*) : Sortie tangentes.
- `outNormals` (*vec3[]*) : Sortie normales.

#### `editor_toolUtilities_geom.segCrossParam2D(ax, ay, bx, by, cx, cy, dx, dy)`

Croisement strict de deux segments ouverts AB et CD : renvoie le paramètre t sur AB dans (0,1), sinon nil (parallèles ou croisement sur une extrémité). Les extrémités sont exclues pour que deux bandes qui se touchent ne soient pas lues comme un pli.

- `ax` (*number*) : A x.
- `ay` (*number*) : A y.
- `bx` (*number*) : B x.
- `by` (*number*) : B y.
- `cx` (*number*) : C x.
- `cy` (*number*) : C y.
- `dx` (*number*) : D x.
- `dy` (*number*) : D y.
- **renvoie** : number|nil t sur AB, ou nil.

#### `editor_toolUtilities_geom.sigMoved(old, new, tolM)`

Une signature de forme (liste plate de nombres et de chaînes) a-t-elle bougé depuis old : nombres de plus de tolM, chaînes dès qu'elles diffèrent.

- `old` (*table|nil*) : Ancienne signature.
- `new` (*table*) : Nouvelle signature.
- `tolM` (*number*) : Tolérance numérique.
- **renvoie** : boolean true si elle a bougé.

#### `editor_toolUtilities_geom.signedAngleAroundAxis(fromVec, toVec, axis)`

Angle signé entre deux vecteurs autour d'un axe, après projection sur le plan de rotation. Renvoyé en DEGRÉS (contrairement à signedAngleBetweenVecs).

- `fromVec` (*vec3*) : Vecteur de départ.
- `toVec` (*vec3*) : Vecteur d'arrivée.
- `axis` (*vec3*) : Axe.
- **renvoie** : number Angle signé (degrés).

#### `editor_toolUtilities_geom.signedAngleBetweenVecs(a, b, axis)`

Angle signé entre deux vecteurs autour d'un axe, en supposant les vecteurs dans le plan de rotation.

- `a` (*vec3*) : Vecteur.
- `b` (*vec3*) : Vecteur.
- `axis` (*vec3*) : Axe.
- **renvoie** : number Angle signé (rad).

#### `editor_toolUtilities_geom.simplifyRDP(points, tolM)`

Simplification de Ramer-Douglas-Peucker d'une polyligne (distance perpendiculaire mesurée en 3D).

- `points` (*vec3[]*) : Polyligne.
- `tolM` (*number*) : Tolérance (m).
- **renvoie** : vec3[] Polyligne simplifiée.

#### `editor_toolUtilities_geom.smoothClosedPolygonChaikin(poly, iterations)`

Coupe de coins de Chaikin d'un polygone fermé de points {x, y}.

- `poly` (*table[]*) : Polygone.
- `iterations` (*integer*) : Nombre d'itérations.
- **renvoie** : table[] Polygone lissé.

#### `editor_toolUtilities_geom.smoothNodesHeightSteffen(nodes)`

Lissage de hauteur d'un bout à l'autre : fixe z[1] et z[n] et réécrit les Z intérieurs par interpolation de Steffen selon la longueur XY. Sans effet (renvoie false) sous 3 noeuds.

- `nodes` (*vec3[]*) : Noeuds modifiés sur place.
- **renvoie** : boolean true si le lissage a été fait.

#### `editor_toolUtilities_geom.splitLoopSplineGeometry(nodes, widths, nmls, splitNodeIdx, corners)`

Coupe une spline en boucle à l'indice donné et renvoie la géométrie réordonnée. corners est renvoyé en 4e valeur.

- `nodes` (*vec3[]*) : Noeuds.
- `widths` (*number[]*) : Largeurs.
- `nmls` (*vec3[]*) : Normales.
- `splitNodeIdx` (*integer*) : Indice de coupe.
- `corners` (*table|nil*) : Surcharges de virages.
- **renvoie** : table|nil nodesNew.
- **renvoie** : table|nil widthsNew.
- **renvoie** : table|nil nmlsNew.
- **renvoie** : table|nil cornersNew.

#### `editor_toolUtilities_geom.splitPolylineByBlocked(pts, isBlocked, stepM, minKeepM)`

Coupe une polyligne 2D en tronçons qui restent hors d'une région bloquée.

- `pts` (*table[]*) : Polyligne {x, y}.
- `isBlocked` (*function*) : isBlocked(x, y) -> boolean.
- `stepM` (*number|nil*) : Pas de test (m, défaut 1.0 si <= 0.05).
- `minKeepM` (*number|nil*) : Longueur minimale d'un tronçon gardé (déduit du code).
- **renvoie** : table[][] Tronçons.

#### `editor_toolUtilities_geom.splitSplineGeometry(nodes, widths, nmls, splitNodeIdx, corners)`

Coupe une géométrie de spline à l'indice de noeud donné (les deux moitiés sont écartées de 2 m au point de coupe). corners (facultatif) est un tableau de surcharges par noeud, conservé pour que les outils d'ingénierie gardent leurs rayons par virage.

- `nodes` (*vec3[]*) : Noeuds.
- `widths` (*number[]*) : Largeurs.
- `nmls` (*vec3[]*) : Normales.
- `splitNodeIdx` (*integer*) : Indice de coupe.
- `corners` (*table|nil*) : Surcharges de virages alignées sur les noeuds.
- **renvoie** : table|nil nodes1 (nil si indice invalide).
- **renvoie** : table|nil widths1.
- **renvoie** : table|nil nmls1.
- **renvoie** : table|nil nodes2.
- **renvoie** : table|nil widths2.
- **renvoie** : table|nil nmls2.
- **renvoie** : table|nil corners1.
- **renvoie** : table|nil corners2.

#### `editor_toolUtilities_geom.squaredDistance2D(a, b)`

Distance au carré en XY entre deux points (Z ignoré).

- `a` (*vec3*) : Point.
- `b` (*vec3*) : Point.
- **renvoie** : number Distance au carré (m^2).

#### `editor_toolUtilities_geom.squaredSegSegDist(a0, a1, b0, b1, outP1, outP2)`

Distance au carré entre deux segments 3D ; écrit les points les plus proches dans outP1 et outP2.

- `a0` (*vec3*) : Début du segment A.
- `a1` (*vec3*) : Fin du segment A.
- `b0` (*vec3*) : Début de B.
- `b1` (*vec3*) : Fin de B.
- `outP1` (*vec3*) : Point le plus proche sur A.
- `outP2` (*vec3*) : Point le plus proche sur B.
- **renvoie** : number Distance au carré.

#### `editor_toolUtilities_geom.tipOutwardXY(pts, fromStart, minWalkM)`

Direction XY unitaire vers l'extérieur au-delà d'un bout (à l'opposé de la polyligne). Parcourt minWalkM le long de la chaîne pour qu'un premier segment court replié n'inverse pas la visée.

- `pts` (*table[]*) : Polyligne.
- `fromStart` (*boolean*) : Bout début ou fin.
- `minWalkM` (*number*) : Distance minimale parcourue (m).
- **renvoie** : number Direction x.
- **renvoie** : number Direction y.

#### `editor_toolUtilities_geom.translateSpline(pts, binormals, t, out)`

Translate une polyligne de t mètres le long de la binormale (direction latérale).

- `pts` (*vec3[]*) : Points.
- `binormals` (*vec3[]*) : Binormales.
- `t` (*number*) : Décalage (m).
- `out` (*table*) : Sortie (vidée) de vec3.

#### `editor_toolUtilities_geom.triangulatePolygon2D(poly)`

Triangulation par ear clipping d'un polygone 2D simple (anneau de {x, y}, l'un ou l'autre sens). La répétition de fermeture est retirée avant : arête de longueur nulle, elle bloquerait la découpe et ferait jeter le capot entier.

- `poly` (*table[]*) : Anneau.
- **renvoie** : integer[][] Triplets d'indices dans l'anneau ouvert (liste vide si échec).

#### `editor_toolUtilities_geom.triangulateWithHoles2D(outer, holes)`

Triangule un polygone 2D éventuellement troué. Si l'ear clipping échoue avec un anneau pontant, abandonne les trous un par un plutôt que de perdre tout le capot.

- `outer` (*table[]*) : Anneau extérieur.
- `holes` (*table[][]|nil*) : Trous.
- **renvoie** : table[] Anneau auquel les triangles se réfèrent.
- **renvoie** : integer[][] Triplets d'indices.

#### `editor_toolUtilities_geom.updateBarPoints(spline, isBarsLimits)`

Met à jour les points de barres de vitesse d'une spline ; remplit spline.vels et spline.velLimits.

- `spline` (*table*) : Spline (nodes, widths, nmls, divPoints, divWidths, normals, tangents, binormals, discMap, isLoop...).
- `isBarsLimits` (*boolean*) : Barres pour les limites de vitesse (true) ou les vitesses (false).

#### `editor_toolUtilities_geom.updateBarPointsGraph(spline, graphData, isBarsLimit)`

Met à jour les points de barres pour un chemin de graphe de navigation ; remplit spline.vels et spline.velLimits.

- `spline` (*table*) : Spline (nodes, widths, nmls, divPoints, divWidths, normals, tangents, binormals, discMap, isLoop...).
- `graphData` (*table*) : Données du graphe de navigation.
- `isBarsLimit` (*boolean*) : Utiliser velLimits (true) ou vels (false) pour la hauteur des barres.

#### `editor_toolUtilities_geom.updateRibPointsFree(spline)`

Recalcule les points de côtes (ribs) d'une spline en 3D libre. Sans effet sous 2 noeuds.

- `spline` (*table*) : Spline (nodes, widths, nmls, divPoints, divWidths, normals, tangents, binormals, discMap, isLoop...).

#### `editor_toolUtilities_geom.updateRibPointsRaycast(spline)`

Recalcule les points de côtes d'une spline par lancer de rayon vertical vers la surface la plus proche en dessous. Sans effet sous 2 noeuds.

- `spline` (*table*) : Spline (nodes, widths, nmls, divPoints, divWidths, normals, tangents, binormals, discMap, isLoop...).

#### `editor_toolUtilities_geom.weldShortSegments(nodes, widths, minLen)`

Soude sur place les noeuds consécutifs presque confondus (segments plus courts que minLen).

- `nodes` (*vec3[]*) : Noeuds modifiés.
- `widths` (*number[]*) : Largeurs, mises à jour en parallèle.
- `minLen` (*number*) : Longueur minimale (m).
- **renvoie** : integer Nombre de noeuds conservés (déduit du code).

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/toolUtilities/geom.lua`.*
