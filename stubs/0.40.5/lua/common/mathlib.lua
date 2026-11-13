---@meta
-- tim19Atlas stub generated from lua/common/mathlib.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Quaternion (x, y, z, w) en double, convention -w de T3d. Créé par quat(...), quatFromDir, quatFromAxisAngle, quatFromEuler. Opérateurs : + - (unaire et binaire), * (quat*quat = composition ; quat*vec3 = rotation du vecteur ; quat*nombre), / (quat/nombre ou quat * inverse(quat)), tostring.
---@class mathlib_LuaQuat
local mathlib_LuaQuat = {}

--- Somme composante par composante.
---Source : lua/common/mathlib.lua:1002
---@param a quat opérande
---@param b quat opérande
---@return quat  somme
function mathlib_LuaQuat.__add(a, b) end

--- quat / nombre : division des composantes ; quat / quat : a * b^-1.
---Source : lua/common/mathlib.lua:992
---@param a quat numérateur
---@param b quat|number dénominateur
---@return quat  résultat
function mathlib_LuaQuat.__div(a, b) end

--- quat*nombre ou nombre*quat : mise à l'échelle ; quat*vec3 : vecteur tourné ; quat*quat : produit de Hamilton.
---Source : lua/common/mathlib.lua:971
---@param a quat|number opérande
---@param b quat|vec3|number opérande
---@return quat|vec3  résultat
function mathlib_LuaQuat.__mul(a, b) end

--- Différence composante par composante.
---Source : lua/common/mathlib.lua:988
---@param a quat opérande
---@param b quat opérande
---@return quat  différence
function mathlib_LuaQuat.__sub(a, b) end

--- Texte 'quat(x,y,z,w)'.
---Source : lua/common/mathlib.lua:915
---@return string  texte
function mathlib_LuaQuat:__tostring() end

--- Opposé de toutes les composantes (représente la même rotation).
---Source : lua/common/mathlib.lua:967
---@param a quat opérande
---@return quat  opposé
function mathlib_LuaQuat.__unm(a) end

--- Conjugué (-x, -y, -z, w) : rotation inverse pour un quat unitaire.
---Source : lua/common/mathlib.lua:1028
---@return quat  conjugué
function mathlib_LuaQuat:conjugated() end

--- Copie du quat.
---Source : lua/common/mathlib.lua:927
---@return quat  copie
function mathlib_LuaQuat:copy() end

--- 0.5 * |self - a|² (mesure d'écart, pas un angle).
---Source : lua/common/mathlib.lua:1010
---@param a quat autre quat
---@return number  écart
function mathlib_LuaQuat:distance(a) end

--- Produit scalaire à 4 composantes.
---Source : lua/common/mathlib.lua:1006
---@param a quat autre quat
---@return number  self·a
function mathlib_LuaQuat:dot(a) end

--- Inverse sur place (-1/|q|² appliqué à x, y, z et w avec convention du code).
---Source : lua/common/mathlib.lua:957
function mathlib_LuaQuat:inverse() end

--- Copie inverse.
---Source : lua/common/mathlib.lua:962
---@return quat  inverse
function mathlib_LuaQuat:inversed() end

--- Interpolation linéaire normalisée vers a (prend le chemin le plus court).
---Source : lua/common/mathlib.lua:1014
---@param a quat cible
---@param t number fraction [0,1]
---@return quat  quat interpolé
function mathlib_LuaQuat:nlerp(a, t) end

--- Norme du quat.
---Source : lua/common/mathlib.lua:939
---@return number  norme
function mathlib_LuaQuat:norm() end

--- Normalise sur place.
---Source : lua/common/mathlib.lua:947
function mathlib_LuaQuat:normalize() end

--- Copie normalisée.
---Source : lua/common/mathlib.lua:952
---@return quat  quat unitaire
function mathlib_LuaQuat:normalized() end

--- Multiplie toutes les composantes par a, sur place, et renvoie self.
---Source : lua/common/mathlib.lua:1032
---@param a number facteur
---@return quat  self
function mathlib_LuaQuat:scale(a) end

--- Affecte x, y, z, w ou copie un autre quat : set(q) ou set(x,y,z,w).
---Source : lua/common/mathlib.lua:931
---@param x number|quat x ou quat source
---@param y number|nil y
---@param z number|nil z
---@param w number|nil w
function mathlib_LuaQuat:set(x, y, z, w) end

--- self = rotation d'angle angleRad autour de l'axe unitaire axle.
---Source : lua/common/mathlib.lua:1037
---@param axle vec3 axe unitaire
---@param angleRad number angle en radians
function mathlib_LuaQuat:setFromAxisAngle(axle, angleRad) end

--- self orienté avec l'axe Y local vers dir et le haut vers up (défaut Z) ; voir quatFromDir.
---Source : lua/common/mathlib.lua:1065
---@param dir vec3 direction
---@param up vec3|nil haut, défaut (0,0,1)
function mathlib_LuaQuat:setFromDir(dir, up) end

--- self depuis des angles d'Euler en radians.
---Source : lua/common/mathlib.lua:1056
---@param x number angle x (rad)
---@param y number angle y (rad)
---@param z number angle z (rad)
function mathlib_LuaQuat:setFromEuler(x, y, z) end

--- self = a^-1 * b.
---Source : lua/common/mathlib.lua:1128
---@param a quat quat à inverser
---@param b quat quat
function mathlib_LuaQuat:setInvMul2(a, b) end

--- self = a * b (sans allocation). Un des deux peut être un nombre (mise à l'échelle).
---Source : lua/common/mathlib.lua:1117
---@param a quat|number opérande
---@param b quat|number opérande
function mathlib_LuaQuat:setMul2(a, b) end

--- self = a * b^-1.
---Source : lua/common/mathlib.lua:1134
---@param a quat quat
---@param b quat quat à inverser
function mathlib_LuaQuat:setMulInv2(a, b) end

--- self = produit de Hamilton (a)*(b) donné par les composantes brutes.
---Source : lua/common/mathlib.lua:1110
---@param ax number a.x
---@param ay number a.y
---@param az number a.z
---@param aw number a.w
---@param bx number b.x
---@param by number b.y
---@param bz number b.z
---@param bw number b.w
function mathlib_LuaQuat:setMulXYZW(ax, ay, az, aw, bx, by, bz, bw) end

--- self = rotation (convention -w) amenant fromV sur toV (vecteurs normalisés).
---Source : lua/common/mathlib.lua:1043
---@param fromV vec3 direction de départ
---@param toV vec3 direction d'arrivée
function mathlib_LuaQuat:setRotationFromTo(fromV, toV) end

--- Interpolation sphérique vers a ; retombe sur nlerp si les quats sont quasi identiques (dot > 0.9995).
---Source : lua/common/mathlib.lua:1020
---@param a quat cible
---@param t number fraction [0,1]
---@return quat  quat interpolé
function mathlib_LuaQuat:slerp(a, t) end

--- Norme au carré.
---Source : lua/common/mathlib.lua:943
---@return number  norme²
function mathlib_LuaQuat:squaredNorm() end

--- Table {x=, y=, z=, w=}.
---Source : lua/common/mathlib.lua:923
---@return table<string, number>  dictionnaire
function mathlib_LuaQuat:toDict() end

--- Renvoie les vecteurs 'avant' (self * (0,1,0)) et 'haut' (self * (0,0,1)).
---Source : lua/common/mathlib.lua:1155
---@return vec3  direction avant
---@return vec3  direction haut
function mathlib_LuaQuat:toDirUp() end

--- Angles d'Euler (ordre YXZ, radians) sous forme de vec3, via setEulerYXZ.
---Source : lua/common/mathlib.lua:1139
---@return vec3  angles
function mathlib_LuaQuat:toEulerYXZ() end

--- Table indexée {x, y, z, w}.
---Source : lua/common/mathlib.lua:919
---@return table  tableau de 4 nombres
function mathlib_LuaQuat:toTable() end

--- Convertit en format Torque {x,y,z,w} où (x,y,z) est l'axe unitaire et w l'angle en degrés (acos(w)*360/pi).
---Source : lua/common/mathlib.lua:1145
---@return table<string, number>  {x,y,z,w=angle en degrés}
function mathlib_LuaQuat:toTorqueQuat() end

--- Renvoie x, y, z.
---Source : lua/common/mathlib.lua:907
---@return number  x
---@return number  y
---@return number  z
function mathlib_LuaQuat:xyz() end

--- Renvoie x, y, z, w.
---Source : lua/common/mathlib.lua:911
---@return number  x
---@return number  y
---@return number  z
---@return number  w
function mathlib_LuaQuat:xyzw() end

--- Vecteur 3D en double précision (champs x, y, z). Créé par vec3(...). Opérateurs : +, -, - unaire, * (par un nombre), / (par un nombre), ==, tostring. Alias : toPoint3F et toFloat3 (renvoient self), len = length, lenSquared = squaredLength, normalizeSafe = normalize. Les méthodes `setXxx` modifient self sur place ; les autres renvoient un nouveau vecteur ou une valeur. normalize/resize/set* ne renvoient rien (sauf mention).
---@class mathlib_LuaVec3
local mathlib_LuaVec3 = {}

--- a + b composante par composante (nouveau vec3).
---Source : lua/common/mathlib.lua:128
---@param a vec3 opérande
---@param b vec3 opérande
---@return vec3  somme
function mathlib_LuaVec3.__add(a, b) end

--- Division par un scalaire (multiplie par 1/b).
---Source : lua/common/mathlib.lua:148
---@param a vec3 vecteur
---@param b number diviseur
---@return vec3  résultat
function mathlib_LuaVec3.__div(a, b) end

--- Égalité exacte des trois composantes ; faux si b est nil.
---Source : lua/common/mathlib.lua:153
---@param a vec3 opérande
---@param b vec3|nil opérande
---@return boolean  égaux
function mathlib_LuaVec3.__eq(a, b) end

--- Produit par un scalaire (vec3 * nombre ou nombre * vec3). Pas de produit vec3*vec3 : utiliser componentMul, dot ou cross.
---Source : lua/common/mathlib.lua:140
---@param a vec3|number opérande
---@param b vec3|number opérande
---@return vec3  résultat
function mathlib_LuaVec3.__mul(a, b) end

--- a - b (nouveau vec3).
---Source : lua/common/mathlib.lua:132
---@param a vec3 opérande
---@param b vec3 opérande
---@return vec3  différence
function mathlib_LuaVec3.__sub(a, b) end

--- Texte 'vec3(x,y,z)' (format %.10g, infinis écrits 9e999).
---Source : lua/common/mathlib.lua:95
---@return string  texte
function mathlib_LuaVec3:__tostring() end

--- Opposé -a.
---Source : lua/common/mathlib.lua:136
---@param a vec3 opérande
---@return vec3  opposé
function mathlib_LuaVec3.__unm(a) end

--- Coordonnées de self dans la base (c1, c2, c3) quelconque (non orthogonale).
---Source : lua/common/mathlib.lua:409
---@param c1 vec3 vecteur de base 1
---@param c2 vec3 vecteur de base 2
---@param c3 vec3 vecteur de base 3
---@return vec3  coordonnées
function mathlib_LuaVec3:basisCoordinates(c1, c2, c3) end

--- Produit composante par composante (nouveau vec3).
---Source : lua/common/mathlib.lua:430
---@param b vec3 autre vecteur
---@return vec3  résultat
function mathlib_LuaVec3:componentMul(b) end

--- Copie du vecteur.
---Source : lua/common/mathlib.lua:81
---@return vec3  copie
function mathlib_LuaVec3:copy() end

--- Cosinus de l'angle entre self et a (borné à [-1,1], sûr contre vecteur nul).
---Source : lua/common/mathlib.lua:190
---@param a vec3 autre vecteur
---@return number  cosinus
function mathlib_LuaVec3:cosAngle(a) end

--- Produit vectoriel self x a (nouveau vec3).
---Source : lua/common/mathlib.lua:161
---@param a vec3 autre vecteur
---@return vec3  self x a
function mathlib_LuaVec3:cross(a) end

--- Distance entre deux points.
---Source : lua/common/mathlib.lua:222
---@param a vec3 autre point
---@return number  distance
function mathlib_LuaVec3:distance(a) end

--- Distance de self à la droite (a, b).
---Source : lua/common/mathlib.lua:247
---@param a vec3 point de la droite
---@param b vec3 point de la droite
---@return number  distance
function mathlib_LuaVec3:distanceToLine(a, b) end

--- Distance de self au segment [a, b].
---Source : lua/common/mathlib.lua:257
---@param a vec3 début
---@param b vec3 fin
---@return number  distance
function mathlib_LuaVec3:distanceToLineSegment(a, b) end

--- Produit scalaire.
---Source : lua/common/mathlib.lua:157
---@param a vec3 autre vecteur
---@return number  self·a
function mathlib_LuaVec3:dot(a) end

--- Lit trois nombres dans une chaîne (séparés par virgule ou espace) et les affecte à self ; 0 si illisible.
---Source : lua/common/mathlib.lua:85
---@param s string texte 'x, y, z'
---@return vec3  self
function mathlib_LuaVec3:fromString(s) end

--- Compat : renvoie la composante i (1=x, 2=y, 3=z).
---Source : lua/common/mathlib.lua:652
---@param i integer indice 1..3
---@return number  composante
function mathlib_LuaVec3:getAxis(i) end

--- Avance l'état bruit bleu 2D stocké dans (x, y) de self (valeurs dans [0,1)) et renvoie self.
---Source : lua/common/mathlib.lua:569
---@return vec3  self
function mathlib_LuaVec3:getBlueNoise2d() end

--- Avance l'état bruit bleu 3D stocké dans (x, y, z) et renvoie self.
---Source : lua/common/mathlib.lua:575
---@return vec3  self
function mathlib_LuaVec3:getBlueNoise3d() end

--- Idem en 2D (disque XY, z = 0).
---Source : lua/common/mathlib.lua:636
---@param radius number|nil rayon, défaut 1
---@return vec3  point
function mathlib_LuaVec3:getBluePointInCircle(radius) end

--- Tire un point dans la boule par bruit bleu : self sert d'état (avancé), renvoie un NOUVEAU vec3 (point centré, mis à l'échelle de radius) ou (0,0,0) si échec.
---Source : lua/common/mathlib.lua:621
---@param radius number|nil rayon, défaut 1
---@return vec3  point
function mathlib_LuaVec3:getBluePointInSphere(radius) end

--- Place self en un point aléatoire du disque XY de rayon radius (z = 0) et renvoie self.
---Source : lua/common/mathlib.lua:601
---@param radius number|nil rayon, défaut 1
---@return vec3  self
function mathlib_LuaVec3:getRandomPointInCircle(radius) end

--- Place self en un point aléatoire de la boule de rayon radius (défaut 1) autour de l'origine (math.random) et renvoie self.
---Source : lua/common/mathlib.lua:580
---@param radius number|nil rayon, défaut 1
---@return vec3  self
function mathlib_LuaVec3:getRandomPointInSphere(radius) end

--- Quat (convention -w) faisant tourner self vers toV. Les deux vecteurs doivent être normalisés.
---Source : lua/common/mathlib.lua:541
---@param toV vec3 direction cible
---@return quat  rotation
function mathlib_LuaVec3:getRotationTo(toV) end

--- Test point-dans-polygone en 2D (x, y de self) : accepte une table de points ayant .x/.y, ou plusieurs points en arguments. Source love2d, licence Zlib/BSD-2.
---Source : lua/common/mathlib.lua:366
---@param ... table|vec3 une table de points ou une liste de points
---@return boolean  à l'intérieur
function mathlib_LuaVec3:inPolygon(...) end

--- Inverse de l'interpolation bilinéaire 2D (x, y de self) du quadrilatère a1,a2,b1,b2 : renvoie u, v tels que p = lerp(lerp(a1,a2,u), lerp(b1,b2,u), v).
---Source : lua/common/mathlib.lua:302
---@param a1 vec3 coin a1
---@param a2 vec3 coin a2
---@param b1 vec3 coin b1
---@param b2 vec3 coin b2
---@return number  u
---@return number  v
function mathlib_LuaVec3:invBilinear2D(a1, a2, b1, b2) end

--- Norme euclidienne.
---Source : lua/common/mathlib.lua:113
---@return number  longueur
function mathlib_LuaVec3:length() end

--- Norme + 1e-30 (jamais nulle).
---Source : lua/common/mathlib.lua:118
---@return number  longueur garantie > 0
function mathlib_LuaVec3:lengthGuarded() end

--- Normalise self sur place (vecteur nul reste nul).
---Source : lua/common/mathlib.lua:194
function mathlib_LuaVec3:normalize() end

--- Copie normalisée.
---Source : lua/common/mathlib.lua:212
---@return vec3  vecteur unitaire
function mathlib_LuaVec3:normalized() end

--- Un vecteur perpendiculaire (même longueur), choisi par setPerpendicular.
---Source : lua/common/mathlib.lua:169
---@return vec3  perpendiculaire
function mathlib_LuaVec3:perpendicular() end

--- Perpendiculaire normalisée.
---Source : lua/common/mathlib.lua:175
---@return vec3  perpendiculaire unitaire
function mathlib_LuaVec3:perpendicularN() end

--- Projette self sur le plan passant par l'origine de normale pnorm (unitaire).
---Source : lua/common/mathlib.lua:384
---@param pnorm vec3 normale du plan
---@return vec3  projection
function mathlib_LuaVec3:projectToOriginPlane(pnorm) end

--- Donne à self la longueur a (sur place).
---Source : lua/common/mathlib.lua:199
---@param a number nouvelle longueur
function mathlib_LuaVec3:resize(a) end

--- Copie de longueur m.
---Source : lua/common/mathlib.lua:217
---@param m number longueur
---@return vec3  vecteur redimensionné
function mathlib_LuaVec3:resized(m) end

--- Limite la longueur de self à cutOff sur place et renvoie la longueur d'origine. Usage cité dans le code : p = p + vel*dt; if p:ropeRock(x) < x then stationnaire end.
---Source : lua/common/mathlib.lua:205
---@param cutOff number longueur max
---@return number  longueur avant limitation
function mathlib_LuaVec3:ropeRock(cutOff) end

--- Copie de self tournée par le quat q (convention -w).
---Source : lua/common/mathlib.lua:548
---@param q quat rotation
---@return vec3  vecteur tourné
function mathlib_LuaVec3:rotated(q) end

--- Affecte les composantes : set(x, y, z) ou set(autreVec3).
---Source : lua/common/mathlib.lua:65
---@param x number|vec3 x ou vec3 source
---@param y number|nil y
---@param z number|nil z
function mathlib_LuaVec3:set(x, y, z) end

--- self += a.
---Source : lua/common/mathlib.lua:450
---@param a vec3 vecteur à ajouter
function mathlib_LuaVec3:setAdd(a) end

--- self = a + b.
---Source : lua/common/mathlib.lua:455
---@param a vec3 opérande
---@param b vec3 opérande
function mathlib_LuaVec3:setAdd2(a, b) end

--- self = a + b * c.
---Source : lua/common/mathlib.lua:461
---@param a vec3 base
---@param b vec3 vecteur
---@param c number facteur
function mathlib_LuaVec3:setAddScaled(a, b, c) end

--- self += (x, y, z).
---Source : lua/common/mathlib.lua:446
---@param x number dx
---@param y number dy
---@param z number dz
function mathlib_LuaVec3:setAddXYZ(x, y, z) end

--- Compat : affecte la composante i (1=x, 2=y, 3=z).
---Source : lua/common/mathlib.lua:656
---@param i integer indice 1..3
---@param v number valeur
function mathlib_LuaVec3:setAxis(i, v) end

--- self = self * a composante par composante.
---Source : lua/common/mathlib.lua:491
---@param a vec3 autre vecteur
function mathlib_LuaVec3:setComponentMul(a) end

--- self = a x b.
---Source : lua/common/mathlib.lua:503
---@param a vec3 opérande
---@param b vec3 opérande
function mathlib_LuaVec3:setCross(a, b) end

--- Affecte à self les angles d'Euler (ordre YXZ) en radians extraits du quat q (x = premier angle, etc., voir code ; formule de bediyap.com).
---Source : lua/common/mathlib.lua:516
---@param q quat orientation
function mathlib_LuaVec3:setEulerYXZ(q) end

--- Affecte depuis une table indexée {x, y, z}.
---Source : lua/common/mathlib.lua:105
---@param t table tableau à 3 nombres
function mathlib_LuaVec3:setFromTable(t) end

--- self = interpolation de from vers to (fraction t, non bornée).
---Source : lua/common/mathlib.lua:496
---@param from vec3 début
---@param to vec3 fin
---@param t number fraction
function mathlib_LuaVec3:setLerp(from, to, t) end

--- self = p0 + (p1 - p0) * xnorm.
---Source : lua/common/mathlib.lua:536
---@param p0 vec3 début
---@param p1 vec3 fin
---@param xnorm number abscisse
function mathlib_LuaVec3:setLinePointFromXnorm(p0, p1, xnorm) end

--- self = maximum composante par composante de self et a.
---Source : lua/common/mathlib.lua:441
---@param a vec3 autre vecteur
function mathlib_LuaVec3:setMax(a) end

--- self = minimum composante par composante de self et a.
---Source : lua/common/mathlib.lua:436
---@param a vec3 autre vecteur
function mathlib_LuaVec3:setMin(a) end

--- self = -self.
---Source : lua/common/mathlib.lua:478
function mathlib_LuaVec3:setNeg() end

--- self = un vecteur perpendiculaire à a (ou à self).
---Source : lua/common/mathlib.lua:529
---@param a vec3|nil source, défaut self
function mathlib_LuaVec3:setPerpendicular(a) end

--- self = projection de a (ou de self) sur le plan d'origine de normale pnorm.
---Source : lua/common/mathlib.lua:522
---@param pnorm vec3 normale
---@param a vec3|nil source, défaut self
function mathlib_LuaVec3:setProjectToOriginPlane(pnorm, a) end

--- Fait pivoter par le quat q : self = q * a (ou q * self si a est omis).
---Source : lua/common/mathlib.lua:509
---@param q quat rotation
---@param a vec3|nil vecteur source, défaut self
function mathlib_LuaVec3:setRotate(q, a) end

--- self *= b.
---Source : lua/common/mathlib.lua:482
---@param b number facteur
function mathlib_LuaVec3:setScaled(b) end

--- self = a * b.
---Source : lua/common/mathlib.lua:486
---@param a vec3 vecteur
---@param b number facteur
function mathlib_LuaVec3:setScaled2(a, b) end

--- self -= a.
---Source : lua/common/mathlib.lua:467
---@param a vec3 vecteur à retrancher
function mathlib_LuaVec3:setSub(a) end

--- self = a - b.
---Source : lua/common/mathlib.lua:472
---@param a vec3 opérande
---@param b vec3 opérande
function mathlib_LuaVec3:setSub2(a, b) end

--- Transforme self (coordonnées locales) en x*nx + y*ny + z*nz, sur place.
---Source : lua/common/mathlib.lua:415
---@param nx vec3 axe x de la base
---@param ny vec3 axe y
---@param nz vec3 axe z
function mathlib_LuaVec3:setToBase(nx, ny, nz) end

--- Place self au point u*a + v*b + (1-u-v)*c.
---Source : lua/common/mathlib.lua:295
---@param a vec3 sommet a
---@param b vec3 sommet b
---@param c vec3 sommet c
---@param u number poids de a
---@param v number poids de b
function mathlib_LuaVec3:setTrianglePointFromUV(a, b, c, u, v) end

--- Interpolation sphérique entre deux vecteurs normalisés. La sortie n'est pas normalisée.
---Source : lua/common/mathlib.lua:183
---@param b vec3 cible normalisée
---@param t number fraction [0,1]
---@return vec3  vecteur interpolé
function mathlib_LuaVec3:slerp(b, t) end

--- Distance au carré.
---Source : lua/common/mathlib.lua:231
---@param a vec3 autre point
---@return number  distance²
function mathlib_LuaVec3:squaredDistance(a) end

--- Distance² de self (point) à la droite passant par a et b.
---Source : lua/common/mathlib.lua:241
---@param a vec3 point de la droite
---@param b vec3 autre point de la droite
---@return number  distance²
function mathlib_LuaVec3:squaredDistanceToLine(a, b) end

--- Distance² de self au segment [a, b].
---Source : lua/common/mathlib.lua:251
---@param a vec3 début
---@param b vec3 fin
---@return number  distance²
function mathlib_LuaVec3:squaredDistanceToLineSegment(a, b) end

--- Norme au carré.
---Source : lua/common/mathlib.lua:123
---@return number  longueur²
function mathlib_LuaVec3:squaredLength() end

--- Version non destructive de setToBase.
---Source : lua/common/mathlib.lua:424
---@param nx vec3 axe x
---@param ny vec3 axe y
---@param nz vec3 axe z
---@return vec3  résultat
function mathlib_LuaVec3:toBase(nx, ny, nz) end

--- Table {x=, y=, z=} (pratique pour JSON).
---Source : lua/common/mathlib.lua:109
---@return table<string, number>  dictionnaire
function mathlib_LuaVec3:toDict() end

--- Compat : renvoie self (alias toPoint3F).
---Source : lua/common/mathlib.lua:660
---@return vec3  self
function mathlib_LuaVec3:toFloat3() end

--- Table {x, y, z} indexée de 1 à 3.
---Source : lua/common/mathlib.lua:101
---@return table  {x,y,z} en tableau
function mathlib_LuaVec3:toTable() end

--- Coordonnées barycentriques de self par rapport au triangle (a,b,c) : u*a + v*b + (1-u-v)*c. Renvoie aussi la normale unitaire du triangle.
---Source : lua/common/mathlib.lua:287
---@param a vec3 sommet a
---@param b vec3 sommet b
---@param c vec3 sommet c
---@return number  u
---@return number  v
---@return vec3  normale unitaire
function mathlib_LuaVec3:triangleBarycentricNorm(a, b, c) end

--- Point du triangle le plus proche de self, puis u, v.
---Source : lua/common/mathlib.lua:357
---@param a vec3 sommet a
---@param b vec3 sommet b
---@param c vec3 sommet c
---@return vec3  point le plus proche
---@return number  u
---@return number  v
function mathlib_LuaVec3:triangleClosestPoint(a, b, c) end

--- Coordonnées (u, v) du point du triangle le plus proche de self : u*a + v*b + (1-u-v)*c.
---Source : lua/common/mathlib.lua:318
---@param a vec3 sommet a
---@param b vec3 sommet b
---@param c vec3 sommet c
---@return number  u
---@return number  v
function mathlib_LuaVec3:triangleClosestPointUV(a, b, c) end

--- Comme la précédente mais avec la distance (racine).
---Source : lua/common/mathlib.lua:268
---@param a vec3 début
---@param b vec3 fin
---@return number  xnorm
---@return number  distance
function mathlib_LuaVec3:xnormDistanceToLineSegment(a, b) end

--- Abscisse normalisée de la projection de self sur la droite (a, b) (0 en a, 1 en b).
---Source : lua/common/mathlib.lua:279
---@param a vec3 début
---@param b vec3 fin
---@return number  xnorm
function mathlib_LuaVec3:xnormOnLine(a, b) end

--- Abscisse normalisée de la projection de self sur la droite {p, direction v} (point = p + v*xnorm).
---Source : lua/common/mathlib.lua:273
---@param p vec3 point de la droite
---@param v vec3 vecteur directeur
---@return number  xnorm
function mathlib_LuaVec3:xnormOnLinePointVec(p, v) end

--- self est un point du plan, pnorm sa normale : abscisse normalisée où la droite (a, b) traverse le plan (bornée à ±1e300 si parallèle).
---Source : lua/common/mathlib.lua:390
---@param pnorm vec3 normale du plan
---@param a vec3 début
---@param b vec3 fin
---@return number  xnorm
function mathlib_LuaVec3:xnormPlaneWithLine(pnorm, a, b) end

--- Renvoie l'abscisse normalisée (non bornée) de la projection sur la droite (a,b) puis la distance² au segment.
---Source : lua/common/mathlib.lua:261
---@param a vec3 début
---@param b vec3 fin
---@return number  xnorm non borné
---@return number  distance² au segment
function mathlib_LuaVec3:xnormSquaredDistanceToLineSegment(a, b) end

--- self est le centre de la sphère : abscisses normalisées (basse, haute) de l'intersection avec la droite (a,b). Renvoie 1, 0 si pas d'intersection.
---Source : lua/common/mathlib.lua:396
---@param radius number rayon
---@param a vec3 début
---@param b vec3 fin
---@return number  xnorm bas
---@return number  xnorm haut
function mathlib_LuaVec3:xnormsSphereWithLine(radius, a, b) end

--- Renvoie x et y.
---Source : lua/common/mathlib.lua:77
---@return number  x
---@return number  y
function mathlib_LuaVec3:xy() end

--- Renvoie les trois composantes.
---Source : lua/common/mathlib.lua:73
---@return number  x
---@return number  y
---@return number  z
function mathlib_LuaVec3:xyz() end

--- Copie avec z = 0 (projection sur le plan XY).
---Source : lua/common/mathlib.lua:165
---@return vec3  vecteur (x, y, 0)
function mathlib_LuaVec3:z0() end

--- Objet unique (renvoyé par push3) qui opère sur la pile statique de vec3. Les opérateurs modifient le sommet de pile et renvoient le même objet ; les méthodes terminales (xyz, copy, dot, length, squaredLength, distance, squaredDistance, __tostring) dépilent et renvoient un résultat. Voir notes du module.
---@class mathlib_StackVec3
local mathlib_StackVec3 = {}

--- Dépile b (lu via :xyz()) et l'ajoute au sommet.
---Source : lua/common/mathlib.lua:778
---@param a StackVec3 pile
---@param b vec3|StackVec3 opérande
---@return StackVec3  pile
function mathlib_StackVec3.__add(a, b) end

--- Divise le sommet par un nombre.
---Source : lua/common/mathlib.lua:805
---@param a StackVec3 pile
---@param b number diviseur
---@return StackVec3  pile
function mathlib_StackVec3.__div(a, b) end

--- Multiplie le sommet par un nombre (à gauche ou à droite).
---Source : lua/common/mathlib.lua:798
---@param a StackVec3|number opérande
---@param b StackVec3|number opérande
---@return StackVec3  pile
function mathlib_StackVec3.__mul(a, b) end

--- Soustrait b au sommet.
---Source : lua/common/mathlib.lua:785
---@param a StackVec3 pile
---@param b vec3|StackVec3 opérande
---@return StackVec3  pile
function mathlib_StackVec3.__sub(a, b) end

--- Dépile et renvoie 'push3(...)'.
---Source : lua/common/mathlib.lua:772
---@return string  texte
function mathlib_StackVec3:__tostring() end

--- Opposé du sommet.
---Source : lua/common/mathlib.lua:792
---@param a StackVec3 pile
---@return StackVec3  pile
function mathlib_StackVec3.__unm(a) end

--- Dépile et renvoie un vec3 normal.
---Source : lua/common/mathlib.lua:766
---@return vec3  copie
function mathlib_StackVec3:copy() end

--- Produit vectoriel sommet x b ; le résultat reste sur la pile.
---Source : lua/common/mathlib.lua:819
---@param b vec3|StackVec3 autre vecteur
---@return StackVec3  pile
function mathlib_StackVec3:cross(b) end

--- Distance entre le sommet (dépilé) et a.
---Source : lua/common/mathlib.lua:862
---@param a vec3|StackVec3 autre point
---@return number  distance
function mathlib_StackVec3:distance(a) end

--- Produit scalaire sommet · a (dépile).
---Source : lua/common/mathlib.lua:812
---@param a vec3|StackVec3 autre vecteur
---@return number  résultat
function mathlib_StackVec3:dot(a) end

--- Norme du sommet (dépile).
---Source : lua/common/mathlib.lua:832
---@return number  longueur
function mathlib_StackVec3:length() end

--- Normalise le sommet (reste sur la pile).
---Source : lua/common/mathlib.lua:846
---@return StackVec3  pile
function mathlib_StackVec3:normalized() end

--- Donne la longueur m au sommet (reste sur la pile).
---Source : lua/common/mathlib.lua:854
---@param m number longueur
---@return StackVec3  pile
function mathlib_StackVec3:resized(m) end

--- Distance² entre le sommet (dépilé) et a.
---Source : lua/common/mathlib.lua:870
---@param a vec3|StackVec3 autre point
---@return number  distance²
function mathlib_StackVec3:squaredDistance(a) end

--- Norme² du sommet (dépile).
---Source : lua/common/mathlib.lua:839
---@return number  longueur²
function mathlib_StackVec3:squaredLength() end

--- Dépile et renvoie x, y, z.
---Source : lua/common/mathlib.lua:760
---@return number  x
---@return number  y
---@return number  z
function mathlib_StackVec3:xyz() end

--- Met z du sommet à 0.
---Source : lua/common/mathlib.lua:827
---@return StackVec3  pile
function mathlib_StackVec3:z0() end

--- Distance au carré entre un point et une boîte orientée (0 si le point est dedans).
---Source : lua/common/mathlib.lua:1426
---@param c1 vec3 centre
---@param x1 vec3 demi-axe x
---@param y1 vec3 demi-axe y
---@param z1 vec3 demi-axe z
---@param p vec3 point
---@return number  distance au carré
function OBBsquaredDistance(c1, x1, y1, z1, p) end

--- Altitude signée du point le plus haut de la boîte orientée par rapport au plan : dot(c1 - plpos, pln) + somme des |dot(axe, pln)|.
---Source : lua/common/mathlib.lua:1476
---@param c1 vec3 centre
---@param x1 vec3 demi-axe x
---@param y1 vec3 demi-axe y
---@param z1 vec3 demi-axe z
---@param plpos vec3 point du plan
---@param pln vec3 normale du plan
---@return number  altitude max de la boîte au-dessus du plan
function altitudeOBB_Plane(c1, x1, y1, z1, plpos, pln) end

--- Spline quadratique par morceaux qui NE passe PAS par les points : lisse le signal. t dans [0,1] entre p1 et p2.
---Source : lua/common/mathlib.lua:1388
---@param p0 number|vec3 précédent
---@param p1 number|vec3 début
---@param p2 number|vec3 fin
---@param p3 number|vec3 suivant
---@param t number paramètre [0,1]
---@return number|vec3  point lissé
function biQuadratic(p0, p1, p2, p3, t) end

--- Fonction de biais (x + xk)/(1 + xk) : déforme x dans [0,1] ; k > 0 relève la courbe.
---Source : lua/common/mathlib.lua:1277
---@param x number entrée dans [0,1]
---@param k number intensité
---@return number  valeur déformée
function biasFun(x, k) end

--- Fonction biais/gain à deux paramètres (arXiv 2010.09714) : passe par (t, t) ; s règle la pente au point de pivot. Courbe visible sur desmos (lien dans le code).
---Source : lua/common/mathlib.lua:1285
---@param x number entrée dans [0,1]
---@param t number|nil pivot, défaut 0.5
---@param s number|nil pente, défaut 0.25
---@return number  valeur dans [0,1]
function biasGainFun(x, t, s) end

--- Fonction 'bosse' lisse : monte de leftY à peakY autour de peakLeftX puis redescend vers rightY autour de peakRightX (deux sigmoïdes sigmoid1).
---Source : lua/common/mathlib.lua:1300
---@param x number entrée
---@param peakLeftX number x du front montant
---@param peakRightX number x du front descendant
---@param leftSlope number|nil paramètre a du front gauche, défaut 1
---@param rightSlope number|nil paramètre a du front droit, défaut 1
---@param leftY number|nil valeur à gauche, défaut 0
---@param peakY number|nil valeur au sommet, défaut 1
---@param rightY number|nil valeur à droite, défaut 0
---@param roundness number|nil raideur des fronts, défaut 10
---@return number  valeur
function bumpFun(x, peakLeftX, peakRightX, leftSlope, rightSlope, leftY, peakY, rightY, roundness) end

--- Bosse polynomiale à support borné centrée sur peakX, avec largeurs et facteurs de courbure distincts à gauche et à droite. Vaut baseY hors de [peakX-leftWidth, peakX+rightWidth].
---Source : lua/common/mathlib.lua:1306
---@param x number entrée
---@param peakX number position du sommet
---@param leftWidth number demi-largeur gauche
---@param rightWidth number demi-largeur droite
---@param leftC number facteur de forme côté gauche
---@param rightC number facteur de forme côté droit
---@param baseY number|nil valeur de base, défaut 0
---@param peakY number|nil valeur au sommet, défaut 1
---@return number  valeur
function bumpPFun(x, peakX, leftWidth, rightWidth, leftC, rightC, baseY, peakY) end

--- Spline cardinale entre p1 et p2 (p0 et p3 sont les voisins). Fonctionne avec des nombres ou des vec3. d1, d2, d3 sont les longueurs de paramétrisation des trois intervalles (1 par défaut = uniforme).
---Source : lua/common/mathlib.lua:1337
---@param p0 number|vec3 point précédent
---@param p1 number|vec3 début de l'intervalle
---@param p2 number|vec3 fin de l'intervalle
---@param p3 number|vec3 point suivant
---@param t number paramètre dans [0,1] entre p1 et p2
---@param s number|nil tension, défaut 0.5
---@param d1 number|nil longueur intervalle p0-p1, défaut 1
---@param d2 number|nil longueur p1-p2, défaut 1
---@param d3 number|nil longueur p2-p3, défaut 1
---@return number|vec3  point interpolé
function cardinalSpline(p0, p1, p2, p3, t, s, d1, d2, d3) end

--- Catmull-Rom uniforme (cardinalSpline avec d1=d2=d3=1). Chaque composante est indépendante, pas de distance nécessaire.
---Source : lua/common/mathlib.lua:1349
---@param p0 number|vec3 précédent
---@param p1 number|vec3 début
---@param p2 number|vec3 fin
---@param p3 number|vec3 suivant
---@param t number paramètre [0,1]
---@param s number|nil tension, défaut 0.5
---@return number|vec3  point
function catmullRom(p0, p1, p2, p3, t, s) end

--- Catmull-Rom centripète (distances en racine carrée) : le plus stable, sans boucles ni auto-intersections. Exige des vec3.
---Source : lua/common/mathlib.lua:1358
---@param p0 vec3 précédent
---@param p1 vec3 début
---@param p2 vec3 fin
---@param p3 vec3 suivant
---@param t number paramètre [0,1]
---@param s number|nil tension, défaut 0.5
---@return vec3  point
function catmullRomCentripetal(p0, p1, p2, p3, t, s) end

--- Catmull-Rom chordal : paramétrisation par les distances entre points (exige des vec3 : appelle :distance).
---Source : lua/common/mathlib.lua:1353
---@param p0 vec3 précédent
---@param p1 vec3 début
---@param p2 vec3 fin
---@param p3 vec3 suivant
---@param t number paramètre [0,1]
---@param s number|nil tension, défaut 0.5
---@return vec3  point
function catmullRomChordal(p0, p1, p2, p3, t, s) end

--- Borne x dans [minValue, maxValue] : min(max(x, minValue), maxValue). Renvoie minValue si x est NaN.
---Source : lua/common/mathlib.lua:1202
---@param x number valeur
---@param minValue number borne basse
---@param maxValue number borne haute
---@return number  valeur bornée
function clamp(x, minValue, maxValue) end

--- Comme closestLinePointsPointVec mais les droites sont données par deux points chacune.
---Source : lua/common/mathlib.lua:699
---@param l1p1 vec3 début droite 1
---@param l1p2 vec3 fin droite 1
---@param l2p1 vec3 début droite 2
---@param l2p2 vec3 fin droite 2
---@return number  xnorm sur la droite 1
---@return number  xnorm sur la droite 2
function closestLinePoints(l1p1, l1p2, l2p1, l2p2) end

--- Points les plus proches de deux droites infinies définies par point + vecteur directeur. Renvoie les abscisses normalisées (xnorm) sur chaque droite ; gère les cas parallèles et dégénérés.
---Source : lua/common/mathlib.lua:680
---@param l1p vec3 point de la droite 1
---@param l1Vec vec3 vecteur de la droite 1
---@param l2p vec3 point de la droite 2
---@param l2Vec vec3 vecteur de la droite 2
---@return number  xnorm sur la droite 1 (point = l1p + l1Vec*xnorm)
---@return number  xnorm sur la droite 2
function closestLinePointsPointVec(l1p, l1Vec, l2p, l2Vec) end

--- Abscisses normalisées (bornées à [0,1]) des points les plus proches entre deux segments.
---Source : lua/common/mathlib.lua:706
---@param l1p1 vec3 début segment 1
---@param l1p2 vec3 fin segment 1
---@param l2p1 vec3 début segment 2
---@param l2p2 vec3 fin segment 2
---@return number  xnorm dans [0,1] sur le segment 1
---@return number  xnorm dans [0,1] sur le segment 2
function closestLineSegmentPoints(l1p1, l1p2, l2p1, l2p2) end

--- Bézier conique rationnelle (poids w sur le point de contrôle) : peut représenter hyperboles, paraboles, ellipses, cercles.
---Source : lua/common/mathlib.lua:1379
---@param p1 number|vec3 début
---@param p2 number|vec3 point de contrôle
---@param p3 number|vec3 fin
---@param t number paramètre [0,1]
---@param w number|nil poids, défaut 1 (parabole)
---@return number|vec3  point
function conicBezier(p1, p2, p3, t, w) end

--- Vrai si p est dans le cylindre (sans bouts arrondis) d'axe cposa-cposb et de rayon cR. Le nom contient une faute de frappe dans le code du jeu.
---Source : lua/common/mathlib.lua:1471
---@param cposa vec3 centre de la base A
---@param cposb vec3 centre de la base B
---@param cR number rayon
---@param p vec3 point
---@return boolean  contenu
function constainsCylinder_Point(cposa, cposb, cR, p) end

--- Vrai si le point p est dans l'ellipsoïde de centre c1 et de demi-axes x1, y1, z1.
---Source : lua/common/mathlib.lua:1462
---@param c1 vec3 centre
---@param x1 vec3 demi-axe x
---@param y1 vec3 demi-axe y
---@param z1 vec3 demi-axe z
---@param p vec3 point
---@return boolean  contenu
function containsEllipsoid_Point(c1, x1, y1, z1, p) end

--- Vrai si la boîte 2 est entièrement contenue dans la boîte 1.
---Source : lua/common/mathlib.lua:1419
---@param c1 vec3 centre boîte englobante
---@param x1 vec3 demi-axe x
---@param y1 vec3 demi-axe y
---@param z1 vec3 demi-axe z
---@param c2 vec3 centre boîte contenue
---@param x2 vec3 demi-axe x
---@param y2 vec3 demi-axe y
---@param z2 vec3 demi-axe z
---@return boolean  contenue
function containsOBB_OBB(c1, x1, y1, z1, c2, x2, y2, z2) end

--- Vrai si la sphère est entièrement dans la boîte orientée.
---Source : lua/common/mathlib.lua:1444
---@param c1 vec3 centre boîte
---@param x1 vec3 demi-axe x
---@param y1 vec3 demi-axe y
---@param z1 vec3 demi-axe z
---@param c2 vec3 centre sphère
---@param r2 number rayon sphère
---@return boolean  contenue
function containsOBB_Sphere(c1, x1, y1, z1, c2, r2) end

--- Vrai si le point p est dans la boîte orientée.
---Source : lua/common/mathlib.lua:1457
---@param c1 vec3 centre
---@param x1 vec3 demi-axe x
---@param y1 vec3 demi-axe y
---@param z1 vec3 demi-axe z
---@param p vec3 point
---@return boolean  contenu
function containsOBB_point(c1, x1, y1, z1, p) end

--- Vrai si la boîte orientée (c2, x2, y2, z2) est entièrement dans la sphère (c1, r1) : teste ses 8 coins.
---Source : lua/common/mathlib.lua:1450
---@param c1 vec3 centre sphère
---@param r1 number rayon sphère
---@param c2 vec3 centre boîte
---@param x2 vec3 demi-axe x
---@param y2 vec3 demi-axe y
---@param z2 vec3 demi-axe z
---@return boolean  boîte contenue dans la sphère
function containsSphere_OBB(c1, r1, c2, x2, y2, z2) end

--- Valeur suivante de la suite de bruit bleu 1D : fractPart(x + 0.618...).
---Source : lua/common/mathlib.lua:564
---@param x number valeur précédente
---@return number  valeur dans [0,1)
function getBlueNoise1d(x) end

--- Renvoie le prochain vec3 temporaire du pool `t` (le crée si besoin) et incrémente t[0]. `t` doit être initialisé avec t[0] = 0 au niveau module.
---Source : lua/common/mathlib.lua:728
---@param t table pool, avec t[0] = compteur
---@return vec3  vecteur temporaire réutilisable
function getTmpVec3(t) end

--- Évite le zéro exact (calcul sans branchement) : renvoie 1/clamp(1/x, -1e300, 1e300), soit x sauf pour 0 qui devient ~1e-300 de même signe.
---Source : lua/common/mathlib.lua:1197
---@param x number valeur
---@return number  valeur jamais nulle
function guardZero(x) end

--- Bruit bleu déterministe : fractPart(i * 0.618...) (suite de la section dorée), bien répartie sur [0,1).
---Source : lua/common/mathlib.lua:559
---@param i number indice
---@return number  valeur dans [0,1)
function indexedBlueNoise(i) end

--- Intersection rayon / capsule (d'après iquilezles.org/articles/intersectors). Renvoie le premier hit (négatif si derrière l'origine), math.huge sinon.
---Source : lua/common/mathlib.lua:1539
---@param rpos vec3 origine
---@param rdir vec3 direction normalisée
---@param cposa vec3 extrémité A
---@param cposb vec3 extrémité B
---@param cR number rayon
---@return number  distance du premier hit ou math.huge
function intersectsRay_Capsule(rpos, rdir, cposa, cposb, cR) end

--- Intersection rayon / cylindre fini d'axe cposa-cposb, rayon cR. Renvoie (minhit, maxhit), minhit = math.huge sans hit.
---Source : lua/common/mathlib.lua:1524
---@param rpos vec3 origine
---@param rdir vec3 direction
---@param cposa vec3 base A
---@param cposb vec3 base B
---@param cR number rayon
---@return number  minhit
---@return number  maxhit
function intersectsRay_Cylinder(rpos, rdir, cposa, cposb, cR) end

--- Intersection rayon / ellipsoïde (centre c1, demi-axes x1, y1, z1). Renvoie (plus petite, plus grande) racine, ou (math.huge, math.huge) sans hit.
---Source : lua/common/mathlib.lua:1510
---@param rpos vec3 origine
---@param rdir vec3 direction
---@param c1 vec3 centre
---@param x1 vec3 demi-axe x
---@param y1 vec3 demi-axe y
---@param z1 vec3 demi-axe z
---@return number  t d'entrée
---@return number  t de sortie
function intersectsRay_Ellipsoid(rpos, rdir, c1, x1, y1, z1) end

--- Intersection rayon / boîte orientée. Renvoie (minhit, maxhit) ; minhit = math.huge s'il n'y a pas de hit. Hit si minhit < maxhit et maxhit > 0 ; rayon à l'intérieur si minhit < 0 et maxhit > 0.
---Source : lua/common/mathlib.lua:1488
---@param rpos vec3 origine
---@param rdir vec3 direction
---@param c1 vec3 centre
---@param x1 vec3 demi-axe x
---@param y1 vec3 demi-axe y
---@param z1 vec3 demi-axe z
---@return number  minhit (entrée) ou math.huge
---@return number  maxhit (sortie)
function intersectsRay_OBB(rpos, rdir, c1, x1, y1, z1) end

--- Distance signée (en multiples de rdir) du point d'intersection du rayon avec le plan. Négative si le plan est derrière l'origine ; math.huge si le rayon est parallèle.
---Source : lua/common/mathlib.lua:1482
---@param rpos vec3 origine du rayon
---@param rdir vec3 direction du rayon
---@param plpos vec3 point du plan
---@param pln vec3 normale du plan
---@return number  paramètre t, point = rpos + rdir*t
function intersectsRay_Plane(rpos, rdir, plpos, pln) end

--- Intersection rayon / sphère. Renvoie (entrée, sortie) en distance le long de rdir (supposé normalisé), ou (math.huge, math.huge) sans hit.
---Source : lua/common/mathlib.lua:1501
---@param rpos vec3 origine
---@param rdir vec3 direction normalisée
---@param cpos vec3 centre
---@param cr number rayon
---@return number  distance d'entrée
---@return number  distance de sortie
function intersectsRay_Sphere(rpos, rdir, cpos, cr) end

--- Intersection rayon / triangle. Renvoie la distance de hit et deux coordonnées barycentriques ; sans hit renvoie math.huge, -1, -1. Note : seuls les hits dont le paramètre calculé est <= 0 sont acceptés, la distance renvoyée est son opposé.
---Source : lua/common/mathlib.lua:1557
---@param rpos vec3 origine
---@param rdir vec3 direction
---@param a vec3 sommet a
---@param b vec3 sommet b
---@param c vec3 sommet c
---@return number  distance ou math.huge
---@return number  barycentrique u (poids de a)
---@return number  barycentrique v (poids de b)
function intersectsRay_Triangle(rpos, rdir, a, b, c) end

--- Fraction t telle que lerp(from, to, t) = value ; renvoie 0 si from et to sont (quasi) égaux.
---Source : lua/common/mathlib.lua:1248
---@param from number début
---@param to number fin
---@param value number valeur
---@return number  fraction (non bornée)
function inverseLerp(from, to, value) end

--- Vrai si abs(a) == math.huge.
---Source : lua/common/mathlib.lua:1223
---@param a number valeur
---@return boolean  est infini
function isinf(a) end

--- Vrai si a est NaN (a ~= a).
---Source : lua/common/mathlib.lua:1219
---@param a number valeur
---@return boolean  est NaN
function isnan(a) end

--- Vrai si a est NaN ou infini (a*0 ~= 0).
---Source : lua/common/mathlib.lua:1227
---@param a number valeur
---@return boolean  NaN ou infini
function isnaninf(a) end

--- Interpolation linéaire from + (to - from) * t. Fonctionne aussi avec des vec3/quat (via les opérateurs) grâce à la formule monotone.
---Source : lua/common/mathlib.lua:1244
---@param from number|vec3 valeur à t=0
---@param to number|vec3 valeur à t=1
---@param t number fraction (non bornée)
---@return number|vec3  valeur interpolée
function lerp(from, to, t) end

--- Boîte englobante 2D d'un segment, élargie de radius (0 par défaut).
---Source : lua/common/mathlib.lua:1330
---@param x1 number x début
---@param y1 number y début
---@param x2 number x fin
---@param y2 number y fin
---@param radius number|nil élargissement
---@return number  xmin
---@return number  ymin
---@return number  xmax
---@return number  ymax
function lineBB2d(x1, y1, x2, y2, radius) end

--- Point p0 + (p1 - p0) * xnorm (interpolation linéaire entre deux vec3, sans bornage).
---Source : lua/common/mathlib.lua:721
---@param p0 vec3 début
---@param p1 vec3 fin
---@param xnorm number abscisse normalisée
---@return vec3  nouveau point
function linePointFromXnorm(p0, p1, xnorm) end

--- Remappe v de [minValue, maxValue] vers [minOutput, maxOutput] en BORNANT la fraction à [0,1] (la sortie reste dans l'intervalle de sortie).
---Source : lua/common/mathlib.lua:1236
---@param v number valeur
---@param minValue number entrée basse
---@param maxValue number entrée haute
---@param minOutput number sortie pour minValue
---@param maxOutput number sortie pour maxValue
---@return number  valeur remappée et bornée
function linearScale(v, minValue, maxValue, minOutput, maxOutput) end

--- Médiane de trois nombres.
---Source : lua/common/mathlib.lua:1314
---@param a number a
---@param b number b
---@param c number c
---@return number  médiane
function median3(a, b, c) end

--- Moyenne des deux valeurs centrales de quatre nombres.
---Source : lua/common/mathlib.lua:1318
---@param a number a
---@param b number b
---@param c number c
---@param d number d
---@return number  médiane
function median4(a, b, c, d) end

--- Médiane de cinq nombres.
---Source : lua/common/mathlib.lua:1322
---@param a number a
---@param b number b
---@param c number c
---@param d number d
---@param e number e
---@return number  médiane
function median5(a, b, c, d, e) end

--- Interpolation 2D monotone de Steffen entre (x1,y1) et (x2,y2) en utilisant les voisins (x0,y0) et (x3,y3) pour les pentes.
---Source : lua/common/mathlib.lua:1363
---@param y0 number y du point 0
---@param y1 number y du point 1
---@param y2 number y du point 2
---@param y3 number y du point 3
---@param x0 number x du point 0
---@param x1 number x du point 1
---@param x2 number x du point 2
---@param x3 number x du point 3
---@param x number abscisse à évaluer (entre x1 et x2)
---@return number  y interpolé
function monotonicSteffen(y0, y1, y2, y3, x0, x1, x2, x3, x) end

--- Renvoie x s'il n'est pas NaN, sinon lève error('NaN found'). Utile pour tracer l'origine d'un NaN.
---Source : lua/common/mathlib.lua:1231
---@param x number valeur
---@return number  x
function nanError(x) end

--- Test de recouvrement entre deux boîtes orientées (SAT sur 15 axes). Chaque boîte = centre + trois demi-axes.
---Source : lua/common/mathlib.lua:1405
---@param c1 vec3 centre boîte 1
---@param x1 vec3 demi-axe x boîte 1
---@param y1 vec3 demi-axe y boîte 1
---@param z1 vec3 demi-axe z boîte 1
---@param c2 vec3 centre boîte 2
---@param x2 vec3 demi-axe x boîte 2
---@param y2 vec3 demi-axe y boîte 2
---@param z2 vec3 demi-axe z boîte 2
---@return boolean  vrai si les boîtes se touchent ou se recouvrent
function overlapsOBB_OBB(c1, x1, y1, z1, c2, x2, y2, z2) end

--- Vrai si une boîte orientée coupe un plan (point + normale).
---Source : lua/common/mathlib.lua:1439
---@param c1 vec3 centre boîte
---@param x1 vec3 demi-axe x
---@param y1 vec3 demi-axe y
---@param z1 vec3 demi-axe z
---@param plpos vec3 point du plan
---@param pln vec3 normale du plan
---@return boolean  intersection
function overlapsOBB_Plane(c1, x1, y1, z1, plpos, pln) end

--- Vrai si une boîte orientée et une sphère se recouvrent.
---Source : lua/common/mathlib.lua:1435
---@param c1 vec3 centre boîte
---@param x1 vec3 demi-axe x
---@param y1 vec3 demi-axe y
---@param z1 vec3 demi-axe z
---@param c2 vec3 centre sphère
---@param r2 number rayon sphère
---@return boolean  recouvrement
function overlapsOBB_Sphere(c1, x1, y1, z1, c2, r2) end

--- Boîte englobante 2D d'un point élargi de radius.
---Source : lua/common/mathlib.lua:1326
---@param x number x
---@param y number y
---@param radius number rayon
---@return number  xmin
---@return number  ymin
---@return number  xmax
---@return number  ymax
function pointBB2d(x, y, radius) end

--- Empile un vec3 (ou x, y, z) sur la pile statique de 100 vec3 et renvoie l'objet StackVec3 (toujours le même). Sert à chaîner des opérations sans allocation. Voir notes du module.
---Source : lua/common/mathlib.lua:749
---@param x number|vec3 composante x ou vec3 / StackVec3 source (lu via :xyz())
---@param y number|nil composante y
---@param z number|nil composante z
---@return StackVec3  objet pile unique
function push3(x, y, z) end

--- Courbe de Bézier quadratique (p1, p2 point de contrôle, p3). Marche avec nombres ou vec3.
---Source : lua/common/mathlib.lua:1373
---@param p1 number|vec3 début
---@param p2 number|vec3 point de contrôle
---@param p3 number|vec3 fin
---@param t number paramètre [0,1]
---@return number|vec3  point
function quadraticBezier(p1, p2, p3, t) end

--- Constructeur de quat (x, y, z, w). Accepte quatre nombres, une table {x,y,z,w} ou {1,2,3,4}, ou un quat à copier. Sans argument voir notes (valeur (1,0,0,0)). Les quats de T3d utilisent -w.
---Source : lua/common/mathlib.lua:893
---@param x number|table|quat|nil composante x ou source
---@param y number|nil composante y
---@param z number|nil composante z
---@param w number|nil composante w
---@return quat  nouveau quaternion
function quat(x, y, z, w) end

--- Quaternion de rotation d'angle angleRad autour de l'axe (l'axe doit être normalisé).
---Source : lua/common/mathlib.lua:1165
---@param axle vec3 axe de rotation normalisé
---@param angleRad number angle en radians
---@return quat  quaternion
function quatFromAxisAngle(axle, angleRad) end

--- Construit un quat orientant l'axe +Y local vers `dir`, avec `up` comme direction haute (Z monde par défaut). Si dir et up sont quasi colinéaires, dir est légèrement perturbé.
---Source : lua/common/mathlib.lua:1159
---@param dir vec3 direction avant (normalisée en interne)
---@param up vec3|nil direction haute, défaut (0,0,1)
---@return quat  orientation normalisée
function quatFromDir(dir, up) end

--- Quaternion à partir d'angles d'Euler en radians (formule du code : combinaison sin/cos des demi-angles x, y, z).
---Source : lua/common/mathlib.lua:1171
---@param x number angle autour de x (rad)
---@param y number angle autour de y (rad)
---@param z number angle autour de z (rad)
---@return quat  quaternion
function quatFromEuler(x, y, z) end

--- Somme de trois math.random() : pseudo-gaussienne grossière (le commentaire du code dit [0..3]).
---Source : lua/common/mathlib.lua:670
---@return number  valeur dans [0,3]
function randomGauss3() end

--- Générateur pseudo-aléatoire déterministe : transforme v en un nombre dans (0,1] (modulo 4294967291). Appeler en rebouclant la valeur de sortie.
---Source : lua/common/mathlib.lua:675
---@param v number état précédent dans [0,1]
---@return number  nouvel état dans (0,1]
function randomState(v) end

--- Comme linearScale mais SANS bornage (extrapole hors de l'intervalle).
---Source : lua/common/mathlib.lua:1240
---@param v number valeur
---@param minValue number entrée basse
---@param maxValue number entrée haute
---@param minOutput number sortie pour minValue
---@param maxOutput number sortie pour maxValue
---@return number  valeur remappée
function rescale(v, minValue, maxValue, minOutput, maxOutput) end

--- Remet le compteur du pool à 0 (à appeler au début d'updateGFX ou équivalent). Renvoie l'ancienne valeur du compteur.
---Source : lua/common/mathlib.lua:736
---@param t table pool de getTmpVec3
---@return integer  nombre de vec3 utilisés avant reset
function resetTmpVec3(t) end

--- Arrondi à l'entier le plus proche : floor(a + 0.5) (les .5 vont vers le haut, y compris pour les négatifs).
---Source : lua/common/mathlib.lua:1210
---@param a number valeur
---@return number  entier (en nombre Lua)
function round(a) end

--- Arrondit x au multiple de m le plus proche. Pour arrondir à la N-ième décimale : roundNear(x, 1e-N).
---Source : lua/common/mathlib.lua:1215
---@param x number valeur
---@param m number pas d'arrondi
---@return number  valeur arrondie
function roundNear(x, m) end

--- Sigmoïde rationnelle x / (a + |x|), symétrique autour de 0, tendant vers ±1.
---Source : lua/common/mathlib.lua:1296
---@param x number entrée
---@param a number|nil raideur inverse, défaut 1
---@return number  valeur dans (-1,1)
function sigmoid1(x, a) end

--- Signe : -1, 0 ou 1. Aussi exposé sous le nom global fsign.
---Source : lua/common/mathlib.lua:1185
---@param x number valeur
---@return number  -1, 0 ou 1
function sign(x) end

--- Signe sans zéro : -1 ou 1 (0 donne 1 ; NaN non géré explicitement).
---Source : lua/common/mathlib.lua:1180
---@param x number valeur
---@return number  -1 ou 1
function sign2(x) end

--- Renvoie sign(s) * abs(v).
---Source : lua/common/mathlib.lua:1192
---@param s number valeur dont on prend le signe
---@param v number valeur dont on prend la valeur absolue
---@return number  sign(s)*abs(v)
function signApply(s, v) end

--- Courbe de Perlin 6x⁵-15x⁴+10x³, résultat borné à [0,1].
---Source : lua/common/mathlib.lua:1258
---@param x number entrée
---@return number  valeur dans [0,1]
function smootherstep(x) end

--- Polynôme de degré 7 (35x⁴-84x⁵+70x⁶-20x⁷) avec x borné à [0,1].
---Source : lua/common/mathlib.lua:1262
---@param x number entrée
---@return number  valeur dans [0,1]
function smootheststep(x) end

--- Maximum lissé = smoothmin(a, b, -k). k n'a pas de défaut ici.
---Source : lua/common/mathlib.lua:1273
---@param a number valeur a
---@param b number valeur b
---@param k number largeur de lissage (obligatoire)
---@return number  maximum lissé
function smoothmax(a, b, k) end

--- Minimum lissé de a et b sur une largeur k (défaut 0.1).
---Source : lua/common/mathlib.lua:1267
---@param a number valeur a
---@param b number valeur b
---@param k number|nil largeur de lissage, défaut 0.1
---@return number  minimum lissé
function smoothmin(a, b, k) end

--- Courbe 3x²-2x³ avec x borné à [0,1].
---Source : lua/common/mathlib.lua:1253
---@param x number entrée
---@return number  valeur dans [0,1]
function smoothstep(x) end

--- a * a.
---Source : lua/common/mathlib.lua:1206
---@param a number valeur
---@return number  carré
function square(a) end

--- Constructeur de vec3. Sans argument : (0,0,0). Avec une table : accepte {x=,y=,z=} ou {1,2,3}, ou un autre vec3 (copie). Avec x et y : z vaut 0 par défaut.
---Source : lua/common/mathlib.lua:49
---@param x number|table|vec3|nil composante x, ou table / vec3 source
---@param y number|nil composante y
---@param z number|nil composante z (0 si omis)
---@return vec3  nouveau vecteur
function vec3(x, y, z) end

---@type any
fsign = nil
---@type number
i = nil
---@type any
vec3toString = nil
