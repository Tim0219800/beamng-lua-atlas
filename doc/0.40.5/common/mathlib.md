# `mathlib`

*Fichier : `lua/common/mathlib.lua` · VM : Commun (GE + véhicule) · 1573 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("mathlib")`

Bibliothèque mathématique chargée dans les deux VM (GE et véhicule). Elle définit les types vec3 (x, y, z, doubles) et quat (x, y, z, w), leurs métaméthodes (+, -, *, /, ==, tostring), et un grand nombre de fonctions globales (clamp, lerp, smoothstep, splines, intersections rayon/OBB/sphère/capsule/triangle, bruit bleu…). Tout est défini en variables globales à l'exécution de `require('mathlib')`, il n'y a pas de table de module à utiliser. Quand FFI est disponible, vec3 et quat sont des structs C (struct __luaVec3_t / __luaQuat_t) ; sinon ce sont des tables avec metatable.

## Exemple

```lua
local a = vec3(1, 2, 3)
local b = vec3({1, 2, 3})
local c = vec3({x = 1, y = 2, z = 3})
print(a == b, (a - b) == vec3(0, 0, 0))
print(vec3(10, 0, 0):dot(vec3(10, 0, 0)))
local q = quatFromDir(vec3(0, 1, 0), vec3(0, 0, 1))
local v = q * vec3(1, 0, 0) -- rotation d'un vecteur par un quat
local t = clamp(lerp(0, 10, 0.3), 0, 5)
```

## Remarques

- Convention quaternion : les quats de BeamNG (et de Torque3D) utilisent -w ; setRotationFromTo et getRotationTo stockent donc w = -(1 + dot). quatFromEuler, quatFromAxisAngle et quatFromDir donnent des quats directement utilisables avec l'opérateur * sur un vec3.
- Les OBB (boîtes orientées) des fonctions overlaps/contains/intersects sont décrites par un centre c1 et trois vecteurs x1, y1, z1 qui sont les DEMI-axes (longueur = demi-étendue ; le code compare à squaredLength(), donc les axes ne sont pas normalisés).
- Les fonctions géométriques OBB et plusieurs méthodes de LuaVec3 utilisent trois vec3 temporaires partagés au niveau du module (tmpv1..3) : elles ne sont pas réentrantes entre coroutines mais OK en usage normal.
- push3 / StackVec3 : pile de 100 vec3 préalloués pour écrire des expressions vectorielles sans allocation, par ex. (push3(a) - push3(b)):length(). Chaque opération consomme les valeurs empilées ; il faut que chaque push3 soit consommé par exactement une méthode terminale (xyz, copy, dot, length, squaredLength, distance, squaredDistance). Un push3 non consommé fait dériver l'indice de pile. Ne pas utiliser entre deux appels qui empilent sans dépiler.
- getTmpVec3/resetTmpVec3 : pool de vec3 temporaires stocké dans une table fournie par l'appelant (doit contenir t[0] = 0). resetTmpVec3(t) à placer au début d'updateGFX ; ne pas utiliser dans une boucle.
- Epsilon de garde : normalize, resize, cosAngle, etc. ajoutent 1e-30 au dénominateur, donc un vecteur nul reste nul au lieu de donner NaN.
- BUG probable : quat() sans argument renvoie (x=1, y=0, z=0, w=0), qui n'est PAS l'identité (l'identité est (0,0,0,1), comme le font quatFromDir/quatFromEuler). Utiliser quat(0,0,0,1) pour l'identité.
- Faute de frappe dans le nom de la fonction exportée : constainsCylinder_Point (au lieu de containsCylinder_Point).
- smoothmax(a, b, k) n'a pas de valeur par défaut pour k (contrairement à smoothmin qui prend 0.1) : k = nil provoque une erreur.
- LuaQuat.__tostring et StackVec3.__tostring passent le résultat de numSer (une chaîne) à un format '%.10g' : cela marche par conversion automatique chaîne -> nombre mais '9e999' (infini) est traité comme inf.
- Variables globales aussi créées : fsign (= sign), vec3toString (= LuaVec3.__tostring, compat). (La globale `i` signalée par l'extraction automatique est un faux positif : c'est la variable d'une boucle for locale.)

## Classe `LuaQuat`

Quaternion (x, y, z, w) en double, convention -w de T3d. Créé par quat(...), quatFromDir, quatFromAxisAngle, quatFromEuler. Opérateurs : + - (unaire et binaire), * (quat*quat = composition ; quat*vec3 = rotation du vecteur ; quat*nombre), / (quat/nombre ou quat * inverse(quat)), tostring.

| Méthode | Description | Ligne |
|---|---|---|
| `LuaQuat.__add(a, b)` | Somme composante par composante. | 1002 |
| `LuaQuat.__div(a, b)` | quat / nombre : division des composantes ; quat / quat : a * b^-1. | 992 |
| `LuaQuat.__mul(a, b)` | quat*nombre ou nombre*quat : mise à l'échelle ; quat*vec3 : vecteur tourné ; quat*quat : produit de Hamilton. | 971 |
| `LuaQuat.__sub(a, b)` | Différence composante par composante. | 988 |
| `LuaQuat:__tostring()` | Texte 'quat(x,y,z,w)'. | 915 |
| `LuaQuat.__unm(a)` | Opposé de toutes les composantes (représente la même rotation). | 967 |
| `LuaQuat:conjugated()` | Conjugué (-x, -y, -z, w) : rotation inverse pour un quat unitaire. | 1028 |
| `LuaQuat:copy()` | Copie du quat. | 927 |
| `LuaQuat:distance(a)` | 0.5 * \|self - a\|² (mesure d'écart, pas un angle). | 1010 |
| `LuaQuat:dot(a)` | Produit scalaire à 4 composantes. | 1006 |
| `LuaQuat:inverse()` | Inverse sur place (-1/\|q\|² appliqué à x, y, z et w avec convention du code). | 957 |
| `LuaQuat:inversed()` | Copie inverse. | 962 |
| `LuaQuat:nlerp(a, t)` | Interpolation linéaire normalisée vers a (prend le chemin le plus court). | 1014 |
| `LuaQuat:norm()` | Norme du quat. | 939 |
| `LuaQuat:normalize()` | Normalise sur place. | 947 |
| `LuaQuat:normalized()` | Copie normalisée. | 952 |
| `LuaQuat:scale(a)` | Multiplie toutes les composantes par a, sur place, et renvoie self. | 1032 |
| `LuaQuat:set(x, y, z, w)` | Affecte x, y, z, w ou copie un autre quat : set(q) ou set(x,y,z,w). | 931 |
| `LuaQuat:setFromAxisAngle(axle, angleRad)` | self = rotation d'angle angleRad autour de l'axe unitaire axle. | 1037 |
| `LuaQuat:setFromDir(dir, up)` | self orienté avec l'axe Y local vers dir et le haut vers up (défaut Z) ; voir quatFromDir. | 1065 |
| `LuaQuat:setFromEuler(x, y, z)` | self depuis des angles d'Euler en radians. | 1056 |
| `LuaQuat:setInvMul2(a, b)` | self = a^-1 * b. | 1128 |
| `LuaQuat:setMul2(a, b)` | self = a * b (sans allocation). Un des deux peut être un nombre (mise à l'échelle). | 1117 |
| `LuaQuat:setMulInv2(a, b)` | self = a * b^-1. | 1134 |
| `LuaQuat:setMulXYZW(ax, ay, az, aw, bx, by, bz, bw)` | self = produit de Hamilton (a)*(b) donné par les composantes brutes. | 1110 |
| `LuaQuat:setRotationFromTo(fromV, toV)` | self = rotation (convention -w) amenant fromV sur toV (vecteurs normalisés). | 1043 |
| `LuaQuat:slerp(a, t)` | Interpolation sphérique vers a ; retombe sur nlerp si les quats sont quasi identiques (dot > 0.9995). | 1020 |
| `LuaQuat:squaredNorm()` | Norme au carré. | 943 |
| `LuaQuat:toDict()` | Table {x=, y=, z=, w=}. | 923 |
| `LuaQuat:toDirUp()` | Renvoie les vecteurs 'avant' (self * (0,1,0)) et 'haut' (self * (0,0,1)). | 1155 |
| `LuaQuat:toEulerYXZ()` | Angles d'Euler (ordre YXZ, radians) sous forme de vec3, via setEulerYXZ. | 1139 |
| `LuaQuat:toTable()` | Table indexée {x, y, z, w}. | 919 |
| `LuaQuat:toTorqueQuat()` | Convertit en format Torque {x,y,z,w} où (x,y,z) est l'axe unitaire et w l'angle en degrés (acos(w)*360/pi). | 1145 |
| `LuaQuat:xyz()` | Renvoie x, y, z. | 907 |
| `LuaQuat:xyzw()` | Renvoie x, y, z, w. | 911 |

## Classe `LuaVec3`

Vecteur 3D en double précision (champs x, y, z). Créé par vec3(...). Opérateurs : +, -, - unaire, * (par un nombre), / (par un nombre), ==, tostring. Alias : toPoint3F et toFloat3 (renvoient self), len = length, lenSquared = squaredLength, normalizeSafe = normalize. Les méthodes `setXxx` modifient self sur place ; les autres renvoient un nouveau vecteur ou une valeur. normalize/resize/set* ne renvoient rien (sauf mention).

| Méthode | Description | Ligne |
|---|---|---|
| `LuaVec3.__add(a, b)` | a + b composante par composante (nouveau vec3). | 128 |
| `LuaVec3.__div(a, b)` | Division par un scalaire (multiplie par 1/b). | 148 |
| `LuaVec3.__eq(a, b)` | Égalité exacte des trois composantes ; faux si b est nil. | 153 |
| `LuaVec3.__mul(a, b)` | Produit par un scalaire (vec3 * nombre ou nombre * vec3). Pas de produit vec3*vec3 : utiliser componentMul, dot ou cross. | 140 |
| `LuaVec3.__sub(a, b)` | a - b (nouveau vec3). | 132 |
| `LuaVec3:__tostring()` | Texte 'vec3(x,y,z)' (format %.10g, infinis écrits 9e999). | 95 |
| `LuaVec3.__unm(a)` | Opposé -a. | 136 |
| `LuaVec3:basisCoordinates(c1, c2, c3)` | Coordonnées de self dans la base (c1, c2, c3) quelconque (non orthogonale). | 409 |
| `LuaVec3:componentMul(b)` | Produit composante par composante (nouveau vec3). | 430 |
| `LuaVec3:copy()` | Copie du vecteur. | 81 |
| `LuaVec3:cosAngle(a)` | Cosinus de l'angle entre self et a (borné à [-1,1], sûr contre vecteur nul). | 190 |
| `LuaVec3:cross(a)` | Produit vectoriel self x a (nouveau vec3). | 161 |
| `LuaVec3:distance(a)` | Distance entre deux points. | 222 |
| `LuaVec3:distanceToLine(a, b)` | Distance de self à la droite (a, b). | 247 |
| `LuaVec3:distanceToLineSegment(a, b)` | Distance de self au segment [a, b]. | 257 |
| `LuaVec3:dot(a)` | Produit scalaire. | 157 |
| `LuaVec3:fromString(s)` | Lit trois nombres dans une chaîne (séparés par virgule ou espace) et les affecte à self ; 0 si illisible. | 85 |
| `LuaVec3:getAxis(i)` | Compat : renvoie la composante i (1=x, 2=y, 3=z). | 652 |
| `LuaVec3:getBlueNoise2d()` | Avance l'état bruit bleu 2D stocké dans (x, y) de self (valeurs dans [0,1)) et renvoie self. | 569 |
| `LuaVec3:getBlueNoise3d()` | Avance l'état bruit bleu 3D stocké dans (x, y, z) et renvoie self. | 575 |
| `LuaVec3:getBluePointInCircle(radius)` | Idem en 2D (disque XY, z = 0). | 636 |
| `LuaVec3:getBluePointInSphere(radius)` | Tire un point dans la boule par bruit bleu : self sert d'état (avancé), renvoie un NOUVEAU vec3 (point centré, mis à l'échelle de radius) ou (0,0,0) si échec. | 621 |
| `LuaVec3:getRandomPointInCircle(radius)` | Place self en un point aléatoire du disque XY de rayon radius (z = 0) et renvoie self. | 601 |
| `LuaVec3:getRandomPointInSphere(radius)` | Place self en un point aléatoire de la boule de rayon radius (défaut 1) autour de l'origine (math.random) et renvoie self. | 580 |
| `LuaVec3:getRotationTo(toV)` | Quat (convention -w) faisant tourner self vers toV. Les deux vecteurs doivent être normalisés. | 541 |
| `LuaVec3:inPolygon(...)` | Test point-dans-polygone en 2D (x, y de self) : accepte une table de points ayant .x/.y, ou plusieurs points en arguments. Source love2d, licence Zlib/BSD-2. | 366 |
| `LuaVec3:invBilinear2D(a1, a2, b1, b2)` | Inverse de l'interpolation bilinéaire 2D (x, y de self) du quadrilatère a1,a2,b1,b2 : renvoie u, v tels que p = lerp(lerp(a1,a2,u), lerp(b1,b2,u), v). | 302 |
| `LuaVec3:length()` | Norme euclidienne. | 113 |
| `LuaVec3:lengthGuarded()` | Norme + 1e-30 (jamais nulle). | 118 |
| `LuaVec3:normalize()` | Normalise self sur place (vecteur nul reste nul). | 194 |
| `LuaVec3:normalized()` | Copie normalisée. | 212 |
| `LuaVec3:perpendicular()` | Un vecteur perpendiculaire (même longueur), choisi par setPerpendicular. | 169 |
| `LuaVec3:perpendicularN()` | Perpendiculaire normalisée. | 175 |
| `LuaVec3:projectToOriginPlane(pnorm)` | Projette self sur le plan passant par l'origine de normale pnorm (unitaire). | 384 |
| `LuaVec3:resize(a)` | Donne à self la longueur a (sur place). | 199 |
| `LuaVec3:resized(m)` | Copie de longueur m. | 217 |
| `LuaVec3:ropeRock(cutOff)` | Limite la longueur de self à cutOff sur place et renvoie la longueur d'origine. Usage cité dans le code : p = p + vel*dt; if p:ropeRock(x) < x then stationnaire end. | 205 |
| `LuaVec3:rotated(q)` | Copie de self tournée par le quat q (convention -w). | 548 |
| `LuaVec3:set(x, y, z)` | Affecte les composantes : set(x, y, z) ou set(autreVec3). | 65 |
| `LuaVec3:setAdd(a)` | self += a. | 450 |
| `LuaVec3:setAdd2(a, b)` | self = a + b. | 455 |
| `LuaVec3:setAddScaled(a, b, c)` | self = a + b * c. | 461 |
| `LuaVec3:setAddXYZ(x, y, z)` | self += (x, y, z). | 446 |
| `LuaVec3:setAxis(i, v)` | Compat : affecte la composante i (1=x, 2=y, 3=z). | 656 |
| `LuaVec3:setComponentMul(a)` | self = self * a composante par composante. | 491 |
| `LuaVec3:setCross(a, b)` | self = a x b. | 503 |
| `LuaVec3:setEulerYXZ(q)` | Affecte à self les angles d'Euler (ordre YXZ) en radians extraits du quat q (x = premier angle, etc., voir code ; formule de bediyap.com). | 516 |
| `LuaVec3:setFromTable(t)` | Affecte depuis une table indexée {x, y, z}. | 105 |
| `LuaVec3:setLerp(from, to, t)` | self = interpolation de from vers to (fraction t, non bornée). | 496 |
| `LuaVec3:setLinePointFromXnorm(p0, p1, xnorm)` | self = p0 + (p1 - p0) * xnorm. | 536 |
| `LuaVec3:setMax(a)` | self = maximum composante par composante de self et a. | 441 |
| `LuaVec3:setMin(a)` | self = minimum composante par composante de self et a. | 436 |
| `LuaVec3:setNeg()` | self = -self. | 478 |
| `LuaVec3:setPerpendicular(a)` | self = un vecteur perpendiculaire à a (ou à self). | 529 |
| `LuaVec3:setProjectToOriginPlane(pnorm, a)` | self = projection de a (ou de self) sur le plan d'origine de normale pnorm. | 522 |
| `LuaVec3:setRotate(q, a)` | Fait pivoter par le quat q : self = q * a (ou q * self si a est omis). | 509 |
| `LuaVec3:setScaled(b)` | self *= b. | 482 |
| `LuaVec3:setScaled2(a, b)` | self = a * b. | 486 |
| `LuaVec3:setSub(a)` | self -= a. | 467 |
| `LuaVec3:setSub2(a, b)` | self = a - b. | 472 |
| `LuaVec3:setToBase(nx, ny, nz)` | Transforme self (coordonnées locales) en x*nx + y*ny + z*nz, sur place. | 415 |
| `LuaVec3:setTrianglePointFromUV(a, b, c, u, v)` | Place self au point u*a + v*b + (1-u-v)*c. | 295 |
| `LuaVec3:slerp(b, t)` | Interpolation sphérique entre deux vecteurs normalisés. La sortie n'est pas normalisée. | 183 |
| `LuaVec3:squaredDistance(a)` | Distance au carré. | 231 |
| `LuaVec3:squaredDistanceToLine(a, b)` | Distance² de self (point) à la droite passant par a et b. | 241 |
| `LuaVec3:squaredDistanceToLineSegment(a, b)` | Distance² de self au segment [a, b]. | 251 |
| `LuaVec3:squaredLength()` | Norme au carré. | 123 |
| `LuaVec3:toBase(nx, ny, nz)` | Version non destructive de setToBase. | 424 |
| `LuaVec3:toDict()` | Table {x=, y=, z=} (pratique pour JSON). | 109 |
| `LuaVec3:toFloat3()` | Compat : renvoie self (alias toPoint3F). | 660 |
| `LuaVec3:toTable()` | Table {x, y, z} indexée de 1 à 3. | 101 |
| `LuaVec3:triangleBarycentricNorm(a, b, c)` | Coordonnées barycentriques de self par rapport au triangle (a,b,c) : u*a + v*b + (1-u-v)*c. Renvoie aussi la normale unitaire du triangle. | 287 |
| `LuaVec3:triangleClosestPoint(a, b, c)` | Point du triangle le plus proche de self, puis u, v. | 357 |
| `LuaVec3:triangleClosestPointUV(a, b, c)` | Coordonnées (u, v) du point du triangle le plus proche de self : u*a + v*b + (1-u-v)*c. | 318 |
| `LuaVec3:xnormDistanceToLineSegment(a, b)` | Comme la précédente mais avec la distance (racine). | 268 |
| `LuaVec3:xnormOnLine(a, b)` | Abscisse normalisée de la projection de self sur la droite (a, b) (0 en a, 1 en b). | 279 |
| `LuaVec3:xnormOnLinePointVec(p, v)` | Abscisse normalisée de la projection de self sur la droite {p, direction v} (point = p + v*xnorm). | 273 |
| `LuaVec3:xnormPlaneWithLine(pnorm, a, b)` | self est un point du plan, pnorm sa normale : abscisse normalisée où la droite (a, b) traverse le plan (bornée à ±1e300 si parallèle). | 390 |
| `LuaVec3:xnormSquaredDistanceToLineSegment(a, b)` | Renvoie l'abscisse normalisée (non bornée) de la projection sur la droite (a,b) puis la distance² au segment. | 261 |
| `LuaVec3:xnormsSphereWithLine(radius, a, b)` | self est le centre de la sphère : abscisses normalisées (basse, haute) de l'intersection avec la droite (a,b). Renvoie 1, 0 si pas d'intersection. | 396 |
| `LuaVec3:xy()` | Renvoie x et y. | 77 |
| `LuaVec3:xyz()` | Renvoie les trois composantes. | 73 |
| `LuaVec3:z0()` | Copie avec z = 0 (projection sur le plan XY). | 165 |

## Classe `StackVec3`

Objet unique (renvoyé par push3) qui opère sur la pile statique de vec3. Les opérateurs modifient le sommet de pile et renvoient le même objet ; les méthodes terminales (xyz, copy, dot, length, squaredLength, distance, squaredDistance, __tostring) dépilent et renvoient un résultat. Voir notes du module.

| Méthode | Description | Ligne |
|---|---|---|
| `StackVec3.__add(a, b)` | Dépile b (lu via :xyz()) et l'ajoute au sommet. | 778 |
| `StackVec3.__div(a, b)` | Divise le sommet par un nombre. | 805 |
| `StackVec3.__mul(a, b)` | Multiplie le sommet par un nombre (à gauche ou à droite). | 798 |
| `StackVec3.__sub(a, b)` | Soustrait b au sommet. | 785 |
| `StackVec3:__tostring()` | Dépile et renvoie 'push3(...)'. | 772 |
| `StackVec3.__unm(a)` | Opposé du sommet. | 792 |
| `StackVec3:copy()` | Dépile et renvoie un vec3 normal. | 766 |
| `StackVec3:cross(b)` | Produit vectoriel sommet x b ; le résultat reste sur la pile. | 819 |
| `StackVec3:distance(a)` | Distance entre le sommet (dépilé) et a. | 862 |
| `StackVec3:dot(a)` | Produit scalaire sommet · a (dépile). | 812 |
| `StackVec3:length()` | Norme du sommet (dépile). | 832 |
| `StackVec3:normalized()` | Normalise le sommet (reste sur la pile). | 846 |
| `StackVec3:resized(m)` | Donne la longueur m au sommet (reste sur la pile). | 854 |
| `StackVec3:squaredDistance(a)` | Distance² entre le sommet (dépilé) et a. | 870 |
| `StackVec3:squaredLength()` | Norme² du sommet (dépile). | 839 |
| `StackVec3:xyz()` | Dépile et renvoie x, y, z. | 760 |
| `StackVec3:z0()` | Met z du sommet à 0. | 827 |

## Fonctions globales définies ici

| Fonction | Description | Ligne |
|---|---|---|
| `OBBsquaredDistance(c1, x1, y1, z1, p)` | Distance au carré entre un point et une boîte orientée (0 si le point est dedans). | 1426 |
| `altitudeOBB_Plane(c1, x1, y1, z1, plpos, pln)` | Altitude signée du point le plus haut de la boîte orientée par rapport au plan : dot(c1 - plpos, pln) + somme des \|dot(axe, pln)\|. | 1476 |
| `biQuadratic(p0, p1, p2, p3, t)` | Spline quadratique par morceaux qui NE passe PAS par les points : lisse le signal. t dans [0,1] entre p1 et p2. | 1388 |
| `biasFun(x, k)` | Fonction de biais (x + xk)/(1 + xk) : déforme x dans [0,1] ; k > 0 relève la courbe. | 1277 |
| `biasGainFun(x, t, s)` | Fonction biais/gain à deux paramètres (arXiv 2010.09714) : passe par (t, t) ; s règle la pente au point de pivot. Courbe visible sur desmos (lien dans le code). | 1285 |
| `bumpFun(x, peakLeftX, peakRightX, leftSlope, rightSlope, leftY, peakY, rightY, roundness)` | Fonction 'bosse' lisse : monte de leftY à peakY autour de peakLeftX puis redescend vers rightY autour de peakRightX (deux sigmoïdes sigmoid1). | 1300 |
| `bumpPFun(x, peakX, leftWidth, rightWidth, leftC, rightC, baseY, peakY)` | Bosse polynomiale à support borné centrée sur peakX, avec largeurs et facteurs de courbure distincts à gauche et à droite. Vaut baseY hors de [peakX-leftWidth, peakX+rightWidth]. | 1306 |
| `cardinalSpline(p0, p1, p2, p3, t, s, d1, d2, d3)` | Spline cardinale entre p1 et p2 (p0 et p3 sont les voisins). Fonctionne avec des nombres ou des vec3. d1, d2, d3 sont les longueurs de paramétrisation des trois intervalles (1 par défaut = uniforme). | 1337 |
| `catmullRom(p0, p1, p2, p3, t, s)` | Catmull-Rom uniforme (cardinalSpline avec d1=d2=d3=1). Chaque composante est indépendante, pas de distance nécessaire. | 1349 |
| `catmullRomCentripetal(p0, p1, p2, p3, t, s)` | Catmull-Rom centripète (distances en racine carrée) : le plus stable, sans boucles ni auto-intersections. Exige des vec3. | 1358 |
| `catmullRomChordal(p0, p1, p2, p3, t, s)` | Catmull-Rom chordal : paramétrisation par les distances entre points (exige des vec3 : appelle :distance). | 1353 |
| `clamp(x, minValue, maxValue)` | Borne x dans [minValue, maxValue] : min(max(x, minValue), maxValue). Renvoie minValue si x est NaN. | 1202 |
| `closestLinePoints(l1p1, l1p2, l2p1, l2p2)` | Comme closestLinePointsPointVec mais les droites sont données par deux points chacune. | 699 |
| `closestLinePointsPointVec(l1p, l1Vec, l2p, l2Vec)` | Points les plus proches de deux droites infinies définies par point + vecteur directeur. Renvoie les abscisses normalisées (xnorm) sur chaque droite ; gère les cas parallèles et dégénérés. | 680 |
| `closestLineSegmentPoints(l1p1, l1p2, l2p1, l2p2)` | Abscisses normalisées (bornées à [0,1]) des points les plus proches entre deux segments. | 706 |
| `conicBezier(p1, p2, p3, t, w)` | Bézier conique rationnelle (poids w sur le point de contrôle) : peut représenter hyperboles, paraboles, ellipses, cercles. | 1379 |
| `constainsCylinder_Point(cposa, cposb, cR, p)` | Vrai si p est dans le cylindre (sans bouts arrondis) d'axe cposa-cposb et de rayon cR. Le nom contient une faute de frappe dans le code du jeu. | 1471 |
| `containsEllipsoid_Point(c1, x1, y1, z1, p)` | Vrai si le point p est dans l'ellipsoïde de centre c1 et de demi-axes x1, y1, z1. | 1462 |
| `containsOBB_OBB(c1, x1, y1, z1, c2, x2, y2, z2)` | Vrai si la boîte 2 est entièrement contenue dans la boîte 1. | 1419 |
| `containsOBB_Sphere(c1, x1, y1, z1, c2, r2)` | Vrai si la sphère est entièrement dans la boîte orientée. | 1444 |
| `containsOBB_point(c1, x1, y1, z1, p)` | Vrai si le point p est dans la boîte orientée. | 1457 |
| `containsSphere_OBB(c1, r1, c2, x2, y2, z2)` | Vrai si la boîte orientée (c2, x2, y2, z2) est entièrement dans la sphère (c1, r1) : teste ses 8 coins. | 1450 |
| `getBlueNoise1d(x)` | Valeur suivante de la suite de bruit bleu 1D : fractPart(x + 0.618...). | 564 |
| `getTmpVec3(t)` | Renvoie le prochain vec3 temporaire du pool `t` (le crée si besoin) et incrémente t[0]. `t` doit être initialisé avec t[0] = 0 au niveau module. | 728 |
| `guardZero(x)` | Évite le zéro exact (calcul sans branchement) : renvoie 1/clamp(1/x, -1e300, 1e300), soit x sauf pour 0 qui devient ~1e-300 de même signe. | 1197 |
| `indexedBlueNoise(i)` | Bruit bleu déterministe : fractPart(i * 0.618...) (suite de la section dorée), bien répartie sur [0,1). | 559 |
| `intersectsRay_Capsule(rpos, rdir, cposa, cposb, cR)` | Intersection rayon / capsule (d'après iquilezles.org/articles/intersectors). Renvoie le premier hit (négatif si derrière l'origine), math.huge sinon. | 1539 |
| `intersectsRay_Cylinder(rpos, rdir, cposa, cposb, cR)` | Intersection rayon / cylindre fini d'axe cposa-cposb, rayon cR. Renvoie (minhit, maxhit), minhit = math.huge sans hit. | 1524 |
| `intersectsRay_Ellipsoid(rpos, rdir, c1, x1, y1, z1)` | Intersection rayon / ellipsoïde (centre c1, demi-axes x1, y1, z1). Renvoie (plus petite, plus grande) racine, ou (math.huge, math.huge) sans hit. | 1510 |
| `intersectsRay_OBB(rpos, rdir, c1, x1, y1, z1)` | Intersection rayon / boîte orientée. Renvoie (minhit, maxhit) ; minhit = math.huge s'il n'y a pas de hit. Hit si minhit < maxhit et maxhit > 0 ; rayon à l'intérieur si minhit < 0 et maxhit > 0. | 1488 |
| `intersectsRay_Plane(rpos, rdir, plpos, pln)` | Distance signée (en multiples de rdir) du point d'intersection du rayon avec le plan. Négative si le plan est derrière l'origine ; math.huge si le rayon est parallèle. | 1482 |
| `intersectsRay_Sphere(rpos, rdir, cpos, cr)` | Intersection rayon / sphère. Renvoie (entrée, sortie) en distance le long de rdir (supposé normalisé), ou (math.huge, math.huge) sans hit. | 1501 |
| `intersectsRay_Triangle(rpos, rdir, a, b, c)` | Intersection rayon / triangle. Renvoie la distance de hit et deux coordonnées barycentriques ; sans hit renvoie math.huge, -1, -1. Note : seuls les hits dont le paramètre calculé est <= 0 sont acceptés, la distance renvoyée est son opposé. | 1557 |
| `inverseLerp(from, to, value)` | Fraction t telle que lerp(from, to, t) = value ; renvoie 0 si from et to sont (quasi) égaux. | 1248 |
| `isinf(a)` | Vrai si abs(a) == math.huge. | 1223 |
| `isnan(a)` | Vrai si a est NaN (a ~= a). | 1219 |
| `isnaninf(a)` | Vrai si a est NaN ou infini (a*0 ~= 0). | 1227 |
| `lerp(from, to, t)` | Interpolation linéaire from + (to - from) * t. Fonctionne aussi avec des vec3/quat (via les opérateurs) grâce à la formule monotone. | 1244 |
| `lineBB2d(x1, y1, x2, y2, radius)` | Boîte englobante 2D d'un segment, élargie de radius (0 par défaut). | 1330 |
| `linePointFromXnorm(p0, p1, xnorm)` | Point p0 + (p1 - p0) * xnorm (interpolation linéaire entre deux vec3, sans bornage). | 721 |
| `linearScale(v, minValue, maxValue, minOutput, maxOutput)` | Remappe v de [minValue, maxValue] vers [minOutput, maxOutput] en BORNANT la fraction à [0,1] (la sortie reste dans l'intervalle de sortie). | 1236 |
| `median3(a, b, c)` | Médiane de trois nombres. | 1314 |
| `median4(a, b, c, d)` | Moyenne des deux valeurs centrales de quatre nombres. | 1318 |
| `median5(a, b, c, d, e)` | Médiane de cinq nombres. | 1322 |
| `monotonicSteffen(y0, y1, y2, y3, x0, x1, x2, x3, x)` | Interpolation 2D monotone de Steffen entre (x1,y1) et (x2,y2) en utilisant les voisins (x0,y0) et (x3,y3) pour les pentes. | 1363 |
| `nanError(x)` | Renvoie x s'il n'est pas NaN, sinon lève error('NaN found'). Utile pour tracer l'origine d'un NaN. | 1231 |
| `overlapsOBB_OBB(c1, x1, y1, z1, c2, x2, y2, z2)` | Test de recouvrement entre deux boîtes orientées (SAT sur 15 axes). Chaque boîte = centre + trois demi-axes. | 1405 |
| `overlapsOBB_Plane(c1, x1, y1, z1, plpos, pln)` | Vrai si une boîte orientée coupe un plan (point + normale). | 1439 |
| `overlapsOBB_Sphere(c1, x1, y1, z1, c2, r2)` | Vrai si une boîte orientée et une sphère se recouvrent. | 1435 |
| `pointBB2d(x, y, radius)` | Boîte englobante 2D d'un point élargi de radius. | 1326 |
| `push3(x, y, z)` | Empile un vec3 (ou x, y, z) sur la pile statique de 100 vec3 et renvoie l'objet StackVec3 (toujours le même). Sert à chaîner des opérations sans allocation. Voir notes du module. | 749 |
| `quadraticBezier(p1, p2, p3, t)` | Courbe de Bézier quadratique (p1, p2 point de contrôle, p3). Marche avec nombres ou vec3. | 1373 |
| `quat(x, y, z, w)` | Constructeur de quat (x, y, z, w). Accepte quatre nombres, une table {x,y,z,w} ou {1,2,3,4}, ou un quat à copier. Sans argument voir notes (valeur (1,0,0,0)). Les quats de T3d utilisent -w. | 893 |
| `quatFromAxisAngle(axle, angleRad)` | Quaternion de rotation d'angle angleRad autour de l'axe (l'axe doit être normalisé). | 1165 |
| `quatFromDir(dir, up)` | Construit un quat orientant l'axe +Y local vers `dir`, avec `up` comme direction haute (Z monde par défaut). Si dir et up sont quasi colinéaires, dir est légèrement perturbé. | 1159 |
| `quatFromEuler(x, y, z)` | Quaternion à partir d'angles d'Euler en radians (formule du code : combinaison sin/cos des demi-angles x, y, z). | 1171 |
| `randomGauss3()` | Somme de trois math.random() : pseudo-gaussienne grossière (le commentaire du code dit [0..3]). | 670 |
| `randomState(v)` | Générateur pseudo-aléatoire déterministe : transforme v en un nombre dans (0,1] (modulo 4294967291). Appeler en rebouclant la valeur de sortie. | 675 |
| `rescale(v, minValue, maxValue, minOutput, maxOutput)` | Comme linearScale mais SANS bornage (extrapole hors de l'intervalle). | 1240 |
| `resetTmpVec3(t)` | Remet le compteur du pool à 0 (à appeler au début d'updateGFX ou équivalent). Renvoie l'ancienne valeur du compteur. | 736 |
| `round(a)` | Arrondi à l'entier le plus proche : floor(a + 0.5) (les .5 vont vers le haut, y compris pour les négatifs). | 1210 |
| `roundNear(x, m)` | Arrondit x au multiple de m le plus proche. Pour arrondir à la N-ième décimale : roundNear(x, 1e-N). | 1215 |
| `sigmoid1(x, a)` | Sigmoïde rationnelle x / (a + \|x\|), symétrique autour de 0, tendant vers ±1. | 1296 |
| `sign(x)` | Signe : -1, 0 ou 1. Aussi exposé sous le nom global fsign. | 1185 |
| `sign2(x)` | Signe sans zéro : -1 ou 1 (0 donne 1 ; NaN non géré explicitement). | 1180 |
| `signApply(s, v)` | Renvoie sign(s) * abs(v). | 1192 |
| `smootherstep(x)` | Courbe de Perlin 6x⁵-15x⁴+10x³, résultat borné à [0,1]. | 1258 |
| `smootheststep(x)` | Polynôme de degré 7 (35x⁴-84x⁵+70x⁶-20x⁷) avec x borné à [0,1]. | 1262 |
| `smoothmax(a, b, k)` | Maximum lissé = smoothmin(a, b, -k). k n'a pas de défaut ici. | 1273 |
| `smoothmin(a, b, k)` | Minimum lissé de a et b sur une largeur k (défaut 0.1). | 1267 |
| `smoothstep(x)` | Courbe 3x²-2x³ avec x borné à [0,1]. | 1253 |
| `square(a)` | a * a. | 1206 |
| `vec3(x, y, z)` | Constructeur de vec3. Sans argument : (0,0,0). Avec une table : accepte {x=,y=,z=} ou {1,2,3}, ou un autre vec3 (copie). Avec x et y : z vaut 0 par défaut. | 49 |

**Globales affectées :** `fsign`, `i`, `vec3toString`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/mathlib.lua`.*
