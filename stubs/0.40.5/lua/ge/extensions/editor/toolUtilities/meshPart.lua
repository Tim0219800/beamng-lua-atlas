---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/meshPart.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Assemblage générique de « parts » de maillage pour les pièces de kit cuites (bridgeKit, islandKit, etc.). Une part est { verts, normals, uvs, faces } où chaque entrée de faces est { v, n, u } avec des indices en base 0, le format consommé à la fois par ProceduralMesh et par l'export DAE. Toutes les géométries de kit passent par ici pour partager une seule convention de bobinage. Fournit aussi la triangulation par ear clipping, des poteaux chanfreinés et emitObject, qui crée le ProceduralMesh dans la scène.
--- Accès : extension `editor_toolUtilities_meshPart` : `extensions.load("editor_toolUtilities_meshPart")`, puis la globale `editor_toolUtilities_meshPart`
---@class editor_toolUtilities_meshPart
editor_toolUtilities_meshPart = {}

--- Renvoie l'anneau fermé de paires {x, y} bobiné dans le sens anti-horaire (la normale sortante d'une arête a->b est (dy, -dx)). Si l'anneau est déjà anti-horaire, il est renvoyé tel quel ; sinon une copie inversée.
---Source : lua/ge/extensions/editor/toolUtilities/meshPart.lua:236
---@param poly number[][] Anneau de points {x, y} (indexés [1] et [2]).
---@return number[][]  Anneau anti-horaire.
function editor_toolUtilities_meshPart.ccwRing(poly) end

--- Construit un ProceduralMesh nommé name à partir de parts, dans folder, en remplaçant tout objet de même nom (qui survit à un rechargement Lua seul). Un nom nil laisse le mesh sans nom. Au-delà de 60000 coins, renvoie à la place un SimGroup de plusieurs meshes sous ce nom. Par défaut sans collision.
---Source : lua/ge/extensions/editor/toolUtilities/meshPart.lua:484
---@param folder userdata SimGroup parent ; nil = renvoie nil.
---@param name string|nil Nom d'objet de scène.
---@param parts table[] Liste de parts ; vide = nil.
---@param collide boolean|nil Cuire une collision (là où le mesh est la seule surface, par exemple une bordure que la voiture doit sentir).
---@param decalSurface boolean|nil Marque le mesh comme surface sur laquelle des décalques s'appliquent.
---@return userdata|nil  ProceduralMesh ou SimGroup créé.
function editor_toolUtilities_meshPart.emitObject(folder, name, parts, collide, decalSurface) end

--- Émet un triangle p1 -> p2 -> p3 avec le même contrat de bobinage que face4. Pour des capuchons plats (toits, terrasses) où un quad ne convient pas.
---Source : lua/ge/extensions/editor/toolUtilities/meshPart.lua:173
---@param part table Part cible.
---@param p1 table Point.
---@param p2 table Point.
---@param p3 table Point.
---@param rx number Côté visible x.
---@param ry number Côté visible y.
---@param rz number Côté visible z.
---@param u1 number[] UV coin 1.
---@param u2 number[] UV coin 2.
---@param u3 number[] UV coin 3.
function editor_toolUtilities_meshPart.face3(part, p1, p2, p3, rx, ry, rz, u1, u2, u3) end

--- Émet un quad p1 -> p2 -> p3 -> p4 dans la part, avec la face avant visible du côté du vecteur (rx, ry, rz). La normale d'ombrage est celle de la face (vers le côté visible), sauf si snx/sny/snz est fourni (le bobinage suit toujours la géométrie).
---Source : lua/ge/extensions/editor/toolUtilities/meshPart.lua:122
---@param part table Part cible.
---@param p1 table Point {x, y, z}.
---@param p2 table Point {x, y, z}.
---@param p3 table Point {x, y, z}.
---@param p4 table Point {x, y, z}.
---@param rx number Côté visible, composante x.
---@param ry number Côté visible, composante y.
---@param rz number Côté visible, composante z.
---@param u1 number[] UV {u, v} du coin 1.
---@param u2 number[] UV du coin 2.
---@param u3 number[] UV du coin 3.
---@param u4 number[] UV du coin 4.
---@param snx number|nil Normale d'ombrage imposée, x.
---@param sny number|nil Normale d'ombrage imposée, y.
---@param snz number|nil Normale d'ombrage imposée, z.
function editor_toolUtilities_meshPart.face4(part, p1, p2, p3, p4, rx, ry, rz, u1, u2, u3, u4, snx, sny, snz) end

--- Comme face4 mais avec une normale d'ombrage par coin (n1..n4 = {x, y, z}), pour ombrer en douceur une surface bosselée à partir de normales de sommets précalculées au lieu d'une seule normale de facette.
---Source : lua/ge/extensions/editor/toolUtilities/meshPart.lua:148
---@param part table Part cible.
---@param p1 table Point.
---@param p2 table Point.
---@param p3 table Point.
---@param p4 table Point.
---@param rx number Côté visible x.
---@param ry number Côté visible y.
---@param rz number Côté visible z.
---@param u1 number[] UV coin 1.
---@param u2 number[] UV coin 2.
---@param u3 number[] UV coin 3.
---@param u4 number[] UV coin 4.
---@param n1 table Normale coin 1 {x, y, z}, vers le côté visible.
---@param n2 table Normale coin 2.
---@param n3 table Normale coin 3.
---@param n4 table Normale coin 4.
function editor_toolUtilities_meshPart.face4n(part, p1, p2, p3, p4, rx, ry, rz, u1, u2, u3, u4, n1, n2, n3, n4) end

--- Émet des triangles sur des coins partagés, tous à ombrage plat : coin i en (x[i], y[i], z[i]) avec uv (u[i], v[i]), nv coins et nt triangles dont les coins sont tri[3t-2..3t] (indices 1-based). Chaque triangle est bobiné comme face3, mais un coin n'est stocké qu'une fois.
---Source : lua/ge/extensions/editor/toolUtilities/meshPart.lua:195
---@param part table Part cible.
---@param x number[] X des coins.
---@param y number[] Y des coins.
---@param z number[] Z des coins.
---@param u number[] U des coins.
---@param v number[] V des coins.
---@param nv integer Nombre de coins.
---@param tri integer[] Indices des triangles, 3 par triangle, base 1.
---@param nt integer Nombre de triangles.
---@param rx number Côté visible x.
---@param ry number Côté visible y.
---@param rz number Côté visible z.
function editor_toolUtilities_meshPart.faces3(part, x, y, z, u, v, nv, tri, nt, rx, ry, rz) end

--- Indique si un objet est marqué comme surface de décalques.
---Source : lua/ge/extensions/editor/toolUtilities/meshPart.lua:459
---@param o userdata Objet de scène.
---@return boolean  true si decalSurface vaut '1'.
function editor_toolUtilities_meshPart.isDecalSurface(o) end

--- Marque un objet comme surface drapée de décalques (tablier, dalle, sol de tunnel, place pavée) en posant decalSurface = '1' (sauvegardé avec l'objet). Les décalques se plaquent sur les formes statiques mais pas sur les items Forest : ces objets restent donc des TSStatic.
---Source : lua/ge/extensions/editor/toolUtilities/meshPart.lua:455
---@param o userdata Objet de scène.
function editor_toolUtilities_meshPart.markDecalSurface(o) end

--- Renvoie une part vide { verts, normals, uvs, faces }. Avec un pool, réutilise la part suivante du pool en vidant ses tables (les entrées internes sont gardées pour éviter des allocations).
---Source : lua/ge/extensions/editor/toolUtilities/meshPart.lua:34
---@param pool table|nil Pool optionnel.
---@return table  Part.
function editor_toolUtilities_meshPart.newPart(pool) end

--- Crée un pool de parts réutilisables, pour des parts émises puis jetées encore et encore. Le moteur copie les données du mesh à la création : une part passée par emitObject n'a plus besoin d'être conservée.
---Source : lua/ge/extensions/editor/toolUtilities/meshPart.lua:26
---@return table  Pool { n = 0 }.
function editor_toolUtilities_meshPart.newPool() end

--- Centre de l'étendue d'une liste de parts. Une forme est écrite autour de ce point et son objet statique y est posé : écrite autour de l'origine du monde, elle perdrait en précision loin sur la carte. Renvoie 0, 0, 0 si la liste est vide.
---Source : lua/ge/extensions/editor/toolUtilities/meshPart.lua:356
---@param parts table[]|nil Liste de parts.
---@return number  x du centre.
---@return number  y du centre.
---@return number  z du centre.
function editor_toolUtilities_meshPart.partsCentre(parts) end

--- Renvoie les parts à partir desquelles un mesh vivant a été construit (par id), pour pouvoir l'exporter ensuite comme forme. Nil pour un mesh issu de parts d'un pool. La table est purgée des meshes disparus tous les 2000 enregistrements.
---Source : lua/ge/extensions/editor/toolUtilities/meshPart.lua:449
---@param id integer Id de l'objet mesh.
---@return table[]|nil  Liste de parts.
function editor_toolUtilities_meshPart.partsOf(id) end

--- Nombre de triangles d'une liste de parts (entrées de faces divisées par 3), pour rapporter ce qu'une cuisson a réellement écrit.
---Source : lua/ge/extensions/editor/toolUtilities/meshPart.lua:348
---@param parts table[]|nil Liste de parts.
---@return integer  Nombre de triangles.
function editor_toolUtilities_meshPart.partsTris(parts) end

--- Remet à zéro le compteur du pool : les parts redonnées par newPart(pool) seront de nouveau remplies.
---Source : lua/ge/extensions/editor/toolUtilities/meshPart.lua:30
---@param pool table Pool de newPool.
function editor_toolUtilities_meshPart.poolReset(pool) end

--- Plan d'un poteau carré de demi-largeur d centré en (cx, cy), arêtes verticales abattues de cham (anti-horaire). Sous 0.1 mm de chanfrein, c'est le carré simple (4 points) ; sinon un octogone (8 points).
---Source : lua/ge/extensions/editor/toolUtilities/meshPart.lua:290
---@param d number Demi-largeur (m).
---@param cx number Centre x.
---@param cy number Centre y.
---@param cham number Chanfrein (m).
---@return number[][]  Anneau de points {x, y}.
function editor_toolUtilities_meshPart.postPlan(d, cx, cy, cham) end

--- Un étage de poteau habillé (dé de pilier, chapeau de poteau) : le plan de postPlan extrudé de z0 à z1, toutes les faces vers l'extérieur et les deux bouts fermés. UV en mètres multipliés par uv (U autour du plan, V en hauteur).
---Source : lua/ge/extensions/editor/toolUtilities/meshPart.lua:302
---@param part table Part cible.
---@param d number Demi-largeur (m).
---@param cx number Centre x.
---@param cy number Centre y.
---@param z0 number Cote basse.
---@param z1 number Cote haute.
---@param cham number|nil Chanfrein (défaut 0).
---@param uv number|nil Facteur d'échelle UV (défaut 1).
function editor_toolUtilities_meshPart.postStage(part, d, cx, cy, z0, z1, cham, uv) end

--- Émet un quad qui peut en réalité être un TRIANGLE (un coin confondu avec son voisin à 1e-6 près) : dans ce cas appelle face3 au lieu de gaspiller un triangle d'aire nulle ; sinon appelle face4.
---Source : lua/ge/extensions/editor/toolUtilities/meshPart.lua:223
---@param part table Part cible.
---@param p1 table Point.
---@param p2 table Point.
---@param p3 table Point.
---@param p4 table Point.
---@param rx number Côté visible x.
---@param ry number Côté visible y.
---@param rz number Côté visible z.
---@param u1 number[] UV coin 1.
---@param u2 number[] UV coin 2.
---@param u3 number[] UV coin 3.
---@param u4 number[] UV coin 4.
function editor_toolUtilities_meshPart.quad(part, p1, p2, p3, p4, rx, ry, rz, u1, u2, u3, u4) end

--- Met à l'échelle sur place les UV d'une liste de parts : permet à un kit de poser ses UV en mètres puis de convertir au tiling du kit au moment de la cuisson.
---Source : lua/ge/extensions/editor/toolUtilities/meshPart.lua:329
---@param parts table[] Liste de parts.
---@param s number Facteur.
---@return table[]  La même liste parts.
function editor_toolUtilities_meshPart.scaleUVs(parts, s) end

--- Applique une teinte à chaque part de la liste dont le champ material vaut m. Sans tint, ne fait rien.
---Source : lua/ge/extensions/editor/toolUtilities/meshPart.lua:338
---@param parts table[] Liste de parts.
---@param m string Nom du matériau.
---@param tint any|nil Teinte à affecter à part.tint.
---@return table[]  La liste parts.
function editor_toolUtilities_meshPart.tintParts(parts, m, tint) end

--- Triangulation par ear clipping d'un anneau anti-horaire. S'arrête sans finir si aucune oreille n'est trouvée (anneau dégénéré ou auto-intersecté).
---Source : lua/ge/extensions/editor/toolUtilities/meshPart.lua:253
---@param poly number[][] Anneau anti-horaire de points {x, y}.
---@return integer[][]  Triplets d'indices {i0, i1, i2} dans poly.
function editor_toolUtilities_meshPart.triangulate(poly) end

