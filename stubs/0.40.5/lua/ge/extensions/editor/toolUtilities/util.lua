---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/util.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Boîte à outils commune aux outils de splines et de « sites » de l'éditeur : souris et raycasts (position sur la carte, sur le terrain, sur un plan), conversions et couleurs, nettoyage de niveau, noms uniques, annulation (commitStep), noms de matériaux de terrain, calculs sur polylignes et splines (longueur, largeur, espacement, inversion, cadrage caméra), construction de rubans (mesh, GLTF), sources de splines pour le terraformage, bitmaps (retournement, export PNG de debug) et sous-onglets ImGui. Constantes par défaut : largeur min et max 10 m, tolérance de largeur fixe 0.01, distance max du rayon caméra 5000 m.
--- Accès : extension `editor_toolUtilities_util` : `extensions.load("editor_toolUtilities_util")`, puis la globale `editor_toolUtilities_util`
---@class editor_toolUtilities_util
editor_toolUtilities_util = {}

--- Ouvre un sous-onglet ImGui (BeginTabItem) dont le corps est un enfant, pour que la rangée d'onglets reste en place. Renvoie false si l'onglet n'est pas ouvert.
---Source : lua/ge/extensions/editor/toolUtilities/util.lua:768
---@param label string Titre.
---@param flags integer|nil Drapeaux TabItemFlags.
---@return boolean  Onglet ouvert.
function editor_toolUtilities_util.beginSubTab(label, flags) end

--- Convertit une polyligne de ruban en JSON GLTF avec tampon binaire intégré (positions float, indices uint16), coordonnées converties (x, z, -y).
---Source : lua/ge/extensions/editor/toolUtilities/util.lua:493
---@param points vec3[] Points.
---@param widths number[] Largeurs.
---@param binormals vec3[] Binormaux.
---@return table  Table GLTF.
function editor_toolUtilities_util.buildRibbonGLTF(points, widths, binormals) end

--- Convertit une polyligne de ruban en maillage de triangles : deux sommets par point (gauche et droite, à demi-largeur le long du binormal), deux triangles par segment.
---Source : lua/ge/extensions/editor/toolUtilities/util.lua:451
---@param points vec3[] Points de la ligne centrale.
---@param widths number[] Largeur totale à chaque point.
---@param binormals vec3[] Binormal à chaque point.
---@return table  { vertices = vec3[], indices = integer[] } (indices à partir de 1).
function editor_toolUtilities_util.buildRibbonMeshFromPolyline(points, widths, binormals) end

--- Estime l'espacement moyen en XY entre nœuds en simulant une interpolation Catmull-Rom centripète (10 échantillons par segment), sans compter l'emprise des meshes.
---Source : lua/ge/extensions/editor/toolUtilities/util.lua:326
---@param positions vec3[] Positions des nœuds.
---@param minSpacing number|nil Plancher de l'espacement ; sert aussi de valeur de repli (1.0 par défaut) s'il y a moins de 2 nœuds.
---@return number  Espacement moyen (m).
function editor_toolUtilities_util.calculateAverageSpacingXY(positions, minSpacing) end

--- Ramène un niveau au terrain nu pour construire une scène de zéro. Supprime tous les objets des classes DecalRoad, TSStatic, MeshRoad, ProceduralMesh, PointLight et SpotLight, ainsi que toutes les INSTANCES de forêt ; les datablocks ForestItemData restent (la plantation retrouve ses espèces par nom). Marque editor.forestDirty.
---Source : lua/ge/extensions/editor/toolUtilities/util.lua:119
---@return integer  Nombre d'objets de scène supprimés (hors éléments de forêt).
function editor_toolUtilities_util.clearLevelContent() end

--- Enregistre un pas d'annulation comme transaction à part entière. Un commitAction seul copie en profondeur le pas du dessus de la pile et le nouveau pour chercher un doublon, ce qui est prohibitif pour un pas de terraformage de millions de hauteurs ; une transaction est enregistrée sans cette vérification.
---Source : lua/ge/extensions/editor/toolUtilities/util.lua:235
---@param label string Libellé.
---@param data any Données du pas.
---@param undoFn function Callback d'annulation.
---@param redoFn function Callback de rétablissement.
function editor_toolUtilities_util.commitStep(label, data, undoFn, redoFn) end

--- Remplit `map` (vidée d'abord) avec spline.id -> indice dans la liste.
---Source : lua/ge/extensions/editor/toolUtilities/util.lua:205
---@param splines table Liste de splines.
---@param map table Table de sortie.
function editor_toolUtilities_util.computeIdToIdxMap(splines, map) end

--- Égalité profonde de deux valeurs. Teste le type avant == car comparer un vec3 à autre chose lève une erreur.
---Source : lua/ge/extensions/editor/toolUtilities/util.lua:212
---@param a any Valeur.
---@param b any Valeur.
---@return boolean  Égales.
function editor_toolUtilities_util.deepEqual(a, b) end

--- Cherche une clé de nœud dans un chemin.
---Source : lua/ge/extensions/editor/toolUtilities/util.lua:358
---@param path table Liste de clés.
---@param nodeKey any Clé cherchée.
---@return boolean  Trouvée.
---@return integer|nil  Indice ou nil.
function editor_toolUtilities_util.doesPathContainNode(path, nodeKey) end

--- Ferme le sous-onglet (EndChild puis EndTabItem). Pas de garde : EndChild doit être appelé même si l'enfant est rogné.
---Source : lua/ge/extensions/editor/toolUtilities/util.lua:775
function editor_toolUtilities_util.endSubTab() end

--- Copie rapide d'un tableau simple (copie superficielle).
---Source : lua/ge/extensions/editor/toolUtilities/util.lua:94
---@param arr table Tableau source.
---@return table  Nouvelle copie.
function editor_toolUtilities_util.fastArrayCopy(arr) end

--- Retire les points consécutifs plus proches que minDist dans le plan XY (garde le premier).
---Source : lua/ge/extensions/editor/toolUtilities/util.lua:301
---@param points vec3[] Points.
---@param minDist number Distance minimale (m).
---@return table  Nouvelle liste (la même table si moins de 2 points).
function editor_toolUtilities_util.filterClosePointsXY(points, minDist) end

--- Indice de la première couche de terrain qui porte l'un des noms candidats, sans tenir compte de la casse.
---Source : lua/ge/extensions/editor/toolUtilities/util.lua:253
---@param candidates string[] Noms candidats, par ordre de priorité.
---@return integer|nil  Indice (à partir de 0) ou nil.
function editor_toolUtilities_util.findMaterialIdx(candidates) end

--- Retourne verticalement un bitmap : crée un nouveau GBitmap GFXFormatR16 dont chaque texel copie la valeur de la ligne symétrique.
---Source : lua/ge/extensions/editor/toolUtilities/util.lua:650
---@param bmpIn GBitmap Bitmap source (non modifié).
---@return GBitmap  Nouveau bitmap retourné.
function editor_toolUtilities_util.flipBitmapY(bmpIn) end

--- Inverse le sens d'une spline (nodes, widths, nmls) et la marque isDirty.
---Source : lua/ge/extensions/editor/toolUtilities/util.lua:368
---@param spline table Spline modifiée en place.
function editor_toolUtilities_util.flipSplineDirection(spline) end

--- Spécification de la grille de calage des empreintes de sites : { ox = 0, oy = 0, step = 1 }, alignée sur le monde et partagée par les trois outils de site.
---Source : lua/ge/extensions/editor/toolUtilities/util.lua:431
---@return table  { ox, oy, step }.
function editor_toolUtilities_util.footSnap() end

--- Ramène un x, y monde à cette grille (pas de 1 m). Pour les points qu'un outil pose lui-même : une forme de départ hors grille devient de travers dès qu'un coin est glissé dessus.
---Source : lua/ge/extensions/editor/toolUtilities/util.lua:435
---@param x number X monde.
---@param y number Y monde.
---@return number  X calé.
---@return number  Y calé.
function editor_toolUtilities_util.footSnapped(x, y) end

--- Génère un nom qui n'entre pas en conflit avec l'arbre de scène : teste « prefix - nom », puis « prefix - nom - 1 », « - 2 », etc. Renvoie la partie nom sans préfixe.
---Source : lua/ge/extensions/editor/toolUtilities/util.lua:191
---@param baseName string Nom de base.
---@param prefixIn string Préfixe (obligatoire).
---@return string  Nom unique, sans le préfixe.
function editor_toolUtilities_util.generateUniqueName(baseName, prefixIn) end

--- Sources de toutes les splines activées (isEnabled), une liste par spline.
---Source : lua/ge/extensions/editor/toolUtilities/util.lua:610
---@param splines table Liste de splines.
---@return table  Liste de listes de { pos, width, binormal }.
function editor_toolUtilities_util.getAllSources(splines) end

--- Couleur interpolée du bleu (minValue) au rouge (maxValue), valeur bornée.
---Source : lua/ge/extensions/editor/toolUtilities/util.lua:164
---@param value number Valeur.
---@param minValue number Valeur pour le bleu.
---@param maxValue number Valeur pour le rouge.
---@return ColorI  color(r, 0, b, 255).
function editor_toolUtilities_util.getBlueToRedColour(value, minValue, maxValue) end

--- Couleur de teinte pour t borné entre 0 et 1 : de 240 degrés (bleu) à 0 (rouge), saturation et valeur à 1.
---Source : lua/ge/extensions/editor/toolUtilities/util.lua:188
---@param t number Valeur 0..1.
---@return integer  R (0-255).
---@return integer  G (0-255).
---@return integer  B (0-255).
function editor_toolUtilities_util.getHueBasedColour255(t) end

--- Noms des couches de matériau du terrain (indice à partir de 0 -> nom), même source que roadNetwork. 'Material i' si un nom manque.
---Source : lua/ge/extensions/editor/toolUtilities/util.lua:243
---@return table<integer, string>  Table vide si pas de terrain.
function editor_toolUtilities_util.getMaterialNames() end

--- Boîte englobante d'une forme TSStatic : crée un TSStatic temporaire ('temp_getMeshBox'), lit sa boîte d'objet, le supprime.
---Source : lua/ge/extensions/editor/toolUtilities/util.lua:145
---@param meshPath string Chemin de la forme (shapeName).
---@return table  { minExtents, maxExtents, center, extents } (vec3).
function editor_toolUtilities_util.getMeshBox(meshPath) end

--- Largeurs minimale et maximale d'une spline (spline.widths) ; 10 et 10 s'il n'y en a pas.
---Source : lua/ge/extensions/editor/toolUtilities/util.lua:277
---@param spline table Spline avec widths.
---@return number  Minimum.
---@return number  Maximum.
function editor_toolUtilities_util.getMinMaxWidth(spline) end

--- Longueur d'une polyligne (somme des distances 3D).
---Source : lua/ge/extensions/editor/toolUtilities/util.lua:268
---@param pts vec3[] Points.
---@return number  Longueur en mètres.
function editor_toolUtilities_util.getPolyLength(pts) end

--- Sources d'une spline pour le terraformage : une seule liste de { pos, width, binormal } sur divPoints, avec spline.terraWidth si défini à la place de divWidths.
---Source : lua/ge/extensions/editor/toolUtilities/util.lua:596
---@param spline table Spline (divPoints, divWidths, binormals, terraWidth).
---@return table  { sData }.
function editor_toolUtilities_util.getSourcesSingle(spline) end

--- Passe en caméra libre et place la caméra au-dessus de la spline, regard vers le bas, d'après splineFocus.
---Source : lua/ge/extensions/editor/toolUtilities/util.lua:408
---@param points vec3[] Points de la spline.
function editor_toolUtilities_util.goToSpline(points) end

--- Convertit HSV en RGB, tout dans [0,1] (h est un tour entier = 1).
---Source : lua/ge/extensions/editor/toolUtilities/util.lua:630
---@param h number Teinte 0-1.
---@param s number Saturation 0-1.
---@param v number Valeur 0-1.
---@return number  R.
---@return number  G.
---@return number  B.
function editor_toolUtilities_util.hsvToRgb(h, s, v) end

--- Convertit HSV en RGB sur 0-255 (h en degrés 0-360, s et v en 0-1).
---Source : lua/ge/extensions/editor/toolUtilities/util.lua:170
---@param h number Teinte en degrés.
---@param s number Saturation 0-1.
---@param v number Valeur 0-1.
---@return integer  R.
---@return integer  G.
---@return integer  B.
function editor_toolUtilities_util.hsvToRgb255(h, s, v) end

--- Vrai si la souris est sur le viewport (ni sur un élément ou une fenêtre ImGui, ni sur le gizmo d'axes).
---Source : lua/ge/extensions/editor/toolUtilities/util.lua:41
---@return boolean  La souris pointe le monde.
function editor_toolUtilities_util.isMouseHoveringOverTerrain() end

--- Vrai si la largeur des nœuds est fixe (écart inférieur à 0.01).
---Source : lua/ge/extensions/editor/toolUtilities/util.lua:291
---@param nodes table Nœuds avec .width.
---@return boolean  Largeur fixe.
---@return number  Largeur minimale.
function editor_toolUtilities_util.isWidthFixed(nodes) end

--- Le sol sous le milieu de l'écran, en x, y (raycast depuis la caméra). Sert à poser un nouvel objet devant l'utilisateur. Renvoie 0, 0 si le regard est dans le ciel ou hors de la carte.
---Source : lua/ge/extensions/editor/toolUtilities/util.lua:418
---@return number  X.
---@return number  Y.
function editor_toolUtilities_util.lookAtGround() end

--- Position carte sur laquelle pointe la souris (castRayStatic, portée 5000 m). Sans impact, renvoie la dernière position valide, ou à défaut le point du rayon à la portée maximale.
---Source : lua/ge/extensions/editor/toolUtilities/util.lua:46
---@return vec3  Position monde.
function editor_toolUtilities_util.mouseOnMapPos() end

--- Point où le rayon de la souris coupe le plan horizontal z = planeZ.
---Source : lua/ge/extensions/editor/toolUtilities/util.lua:61
---@param planeZ number Altitude du plan.
---@return vec3|nil  Point d'intersection ; nil si le rayon est presque horizontal ou si le plan est derrière la caméra.
function editor_toolUtilities_util.mouseOnPlaneZ(planeZ) end

--- Le SOL sous la souris, posé sur la grille de hauteur du terrain plutôt que sur une géométrie statique qui se trouverait sur le rayon. Itère 4 fois en recoupant avec la hauteur du terrain.
---Source : lua/ge/extensions/editor/toolUtilities/util.lua:71
---@param seedZ number|nil Altitude de départ du plan (0 par défaut).
---@return vec3|nil  Point sur le terrain.
function editor_toolUtilities_util.mouseOnTerrainPos(seedZ) end

--- Convertit des m/s en km/h (x 3.6).
---Source : lua/ge/extensions/editor/toolUtilities/util.lua:105
---@param ms number Vitesse en m/s.
---@return number  Vitesse en km/h.
function editor_toolUtilities_util.msToKph(ms) end

--- Convertit des m/s en mph (x 2.236936).
---Source : lua/ge/extensions/editor/toolUtilities/util.lua:103
---@param ms number Vitesse en m/s.
---@return number  Vitesse en mph.
function editor_toolUtilities_util.msToMph(ms) end

--- Calcule un cadrage vu de dessus pour une spline : milieu de la boîte 2D et altitude telle que tout tient dans le champ (distance / tan(fov/2) + zMax + 5).
---Source : lua/ge/extensions/editor/toolUtilities/util.lua:381
---@param points vec3[] Points de la spline.
---@return number|nil  X du milieu, nil si la spline est trop petite (moins de 0.1 m).
---@return number  Y du milieu.
---@return number  Altitude de la caméra.
function editor_toolUtilities_util.splineFocus(points) end

--- Un rectangle posé sur le sol sous le milieu de l'écran, orienté anti-horaire, coins sur la grille d'empreinte.
---Source : lua/ge/extensions/editor/toolUtilities/util.lua:440
---@param w number Largeur (m).
---@param d number Profondeur (m).
---@param zAt function|nil zAt(x, y) donne l'altitude de chaque coin (0 par défaut).
---@return vec3[]  4 coins.
function editor_toolUtilities_util.starterRing(w, d, zAt) end

--- Somme de toutes les valeurs d'une table non tableau.
---Source : lua/ge/extensions/editor/toolUtilities/util.lua:108
---@param t table<any, number> Table clé -> nombre.
---@return number  Somme.
function editor_toolUtilities_util.sumOverNonArrayTable(t) end

--- Ids dont les copies dans deux instantanés des mêmes éléments sont identiques : ce qu'un pas d'annulation intermédiaire n'a pas touché.
---Source : lua/ge/extensions/editor/toolUtilities/util.lua:222
---@param a table Instantané A (éléments avec .id).
---@param b table Instantané B.
---@return table<any, boolean>  Ensemble id -> true.
function editor_toolUtilities_util.unchangedIds(a, b) end

--- Raycast vertical vers le bas qui modifie le Z du point sur place : monte de rayRaise, tire vers le bas, puis redescend sur la surface + postFloat pour ne pas s'enfoncer.
---Source : lua/ge/extensions/editor/toolUtilities/util.lua:85
---@param pos vec3 Point modifié en place.
---@param rayRaise number|nil Montée avant le tir (10 par défaut).
---@param postFloat number|nil Petite hauteur ajoutée après (0.05 par défaut).
function editor_toolUtilities_util.vertRaycast(pos, rayRaise, postFloat) end

--- Utilitaire de debug : écrit un masque binaire (lignes de 0 ou 1) en PNG 16 bits (blanc si 1).
---Source : lua/ge/extensions/editor/toolUtilities/util.lua:665
---@param mask table Masque 2D.
---@param path string Fichier de sortie.
function editor_toolUtilities_util.writeMaskToPng(mask, path) end

--- Écrit des chemins vectorisés en PNG 16 bits à niveaux de gris, avec une intensité distincte par chemin.
---Source : lua/ge/extensions/editor/toolUtilities/util.lua:689
---@param paths table Chemins.
---@param width integer Largeur de l'image.
---@param height integer Hauteur de l'image.
---@param path string Fichier de sortie.
function editor_toolUtilities_util.writePathsToPng(paths, width, height, path) end

--- Écrit les chemins en traits épais continus : un disque plein à chaque point, de rayon max(1, floor(largeur/2)), en blanc sur fond noir.
---Source : lua/ge/extensions/editor/toolUtilities/util.lua:724
---@param paths table Chemins.
---@param widths table Largeurs par chemin.
---@param width integer Largeur de l'image.
---@param height integer Hauteur de l'image.
---@param outPath string Fichier de sortie.
function editor_toolUtilities_util.writeWidthsToPng(paths, widths, width, height, outPath) end

