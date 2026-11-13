---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/paths.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Extension GE `core_paths` : gestion des chemins de caméra (fichiers *.camPath.json) utilisés par la caméra 'path' et par l'éditeur de trajectoires. Elle charge, crée, sauvegarde et supprime des chemins, les joue via core_camera, et fournit l'évaluation des pistes de transformation (position, orientation, FOV) avec courbes de Bézier temporelles. Au démarrage d'un niveau, elle charge tous les camPaths du dossier `camPaths` à côté du fichier de niveau.
--- Accès : extension `core_paths` : `extensions.load("core_paths")`, puis la globale `core_paths`
---@class core_paths
---@field motionPrefixes string[] Familles de Bézier temporelles : 'motion' (position), 'rotMotion' (orientation entière), puis 'yawMotion', 'pitchMotion', 'rollMotion' (un axe d'Euler chacun).
---@field transformChannels string[] Canaux des pistes de transformation : posX, posY, posZ, yaw, pitch, roll, fov.
core_paths = {}

--- Ajoute un chemin à la liste et lui attribue le plus petit id libre (champ path.id modifié).
---Source : lua/ge/extensions/core/paths.lua:241
---@param path table Chemin à ajouter.
function core_paths.addPath(path) end

--- Copie propre des pistes de transformation, en ne gardant que les canaux de transformChannels et les champs t, v, slopeIn, slopeOut, timeIn, timeOut.
---Source : lua/ge/extensions/core/paths.lua:132
---@param tracks table|nil Table canal -> liste de clés.
---@return table|nil  Copie, ou nil si tracks n'est pas une table.
function core_paths.cloneTransformTracks(tracks) end

--- Crée un chemin vide { name, markers = {}, manualFov = true, dirty = true } et l'ajoute.
---Source : lua/ge/extensions/core/paths.lua:246
---@param name string Nom du chemin (non rendu unique automatiquement).
---@return table  Le chemin créé.
function core_paths.createPath(name) end

--- Retire de la liste le premier chemin portant le même name que celui donné. Ne supprime aucun fichier.
---Source : lua/ge/extensions/core/paths.lua:251
---@param path table Chemin (comparé par name).
function core_paths.deletePath(path) end

--- Évalue tous les canaux (pos, yaw/pitch/roll, fov) du chemin au temps t.
---Source : lua/ge/extensions/core/paths.lua:166
---@param path table|nil Chemin avec transformTracks.
---@param t number Temps en secondes.
---@return table|nil  Table canal -> valeur ; nil si le chemin n'a pas de pistes ou si aucun canal ne donne de valeur.
function core_paths.evalTransform(path, t) end

--- Évalue une piste de clés { t, v, ... } au temps t par interpolation Bézier entre clés, avec gestion des coupures (cuts) et du bouclage (wrap).
---Source : lua/ge/extensions/core/paths.lua:98
---@param keys table[] Clés triées par t.
---@param t number Temps en secondes.
---@param wrap table|nil { duration, fromT, unwrapDeg } pour la transition de fin vers la première clé.
---@param cuts number[]|nil Temps des coupures nettes.
---@return number|nil  Valeur, ou nil si la piste est vide ou t est nil.
function core_paths.evalTransformTrack(keys, t, wrap, cuts) end

--- Indice du dernier segment jouable : nombre de marqueurs si le chemin boucle, sinon nombre moins 1.
---Source : lua/ge/extensions/core/paths.lua:269
---@param path table Chemin de caméra.
---@return integer  Dernier indice de segment.
function core_paths.getEndIdx(path) end

--- Renvoie les 4 indices de marqueurs (précédent, courant, suivant, suivant+1) utilisés pour interpoler le segment idx. Gère le bouclage (modulo) et les coupures (`cut`), qui dupliquent l'indice voisin.
---Source : lua/ge/extensions/core/paths.lua:223
---@param path table Chemin de caméra.
---@param idx integer Indice (base 1) du marqueur de début de segment.
---@return integer  index1, index2, index3, index4 (quatre valeurs).
function core_paths.getMarkerIds(path, idx) end

--- Ancienne fonction (getPath_Deprecated) : lit un SimPath de la scène et renvoie ses marqueurs. Sans argument, prend le premier SimPath du niveau.
---Source : lua/ge/extensions/core/paths.lua:439
---@param pathName string|nil Nom de l'objet SimPath.
---@return table|nil  { markers, looped, nodeCount }, ou nil si introuvable.
function core_paths.getPath(pathName) end

--- Renvoie la table interne des chemins chargés (pas une copie).
---Source : lua/ge/extensions/core/paths.lua:265
---@return table[]  Liste des chemins.
function core_paths.getPaths() end

--- Renvoie un nom non utilisé par les chemins chargés : le nom tel quel, sinon avec suffixe numérique (name1, name2...).
---Source : lua/ge/extensions/core/paths.lua:208
---@param name string Nom souhaité.
---@return string  Nom unique.
function core_paths.getUniquePathName(name) end

--- Inverse d'une Bézier cubique monotone x(t) = cubicBezier(a, b, t) sur [0, 1], par Newton (8 itérations). Exacte aux bornes : u<=0 donne 0, u>=1 donne 1.
---Source : lua/ge/extensions/core/paths.lua:31
---@param a number Premier point de contrôle (abscisse).
---@param b number Second point de contrôle (abscisse).
---@param u number Valeur cible, bornée à [0, 1].
---@return number  Paramètre t dans [0, 1].
function core_paths.invertCubicBezier(a, b, u) end

--- Charge un chemin depuis un fichier camPath.json et l'ajoute à la liste ; renvoie le chemin existant si ce fichier est déjà chargé.
---Source : lua/ge/extensions/core/paths.lua:329
---@param pathFileName string|nil Fichier à lire ; nil renvoie nil.
---@return table|nil  Le chemin, ou nil si le fichier est introuvable (erreur dans le log).
function core_paths.loadPath(pathFileName) end

--- Durée de la transition de bouclage d'un chemin : 0 si le chemin n'est pas `looped`, sinon loopTime (min 0), ou 2 s si loopTime est absent.
---Source : lua/ge/extensions/core/paths.lua:65
---@param path table|nil Chemin de caméra.
---@return number  Durée en secondes.
function core_paths.loopDuration(path) end

--- Hook appelé au démarrage d'un niveau : vide la liste et charge tous les fichiers *.camPath.json du dossier 'camPaths' voisin du fichier de niveau.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/paths.lua:415
function core_paths.onClientStartMission() end

--- Hook de restauration après rechargement Lua : remet les chemins sauvegardés.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/paths.lua:411
---@param data table Table renvoyée par onSerialize.
function core_paths.onDeserialized(data) end

--- Hook appelé au chargement de l'extension ; ne fait rien.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/paths.lua:402
function core_paths.onExtensionLoaded() end

--- Hook de sauvegarde avant rechargement Lua : renvoie une copie profonde des chemins.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/paths.lua:405
---@return table  { paths = ... }
function core_paths.onSerialize() end

--- Joue un chemin avec la caméra 'path' (core_camera.setByName(0, 'path', ...)). initData reçoit useJsonVersion, hasIntro, path, offset, et des reset/getNextPath par défaut.
---Source : lua/ge/extensions/core/paths.lua:491
---@param path table Chemin à jouer.
---@param offset number|nil Décalage de départ (0 par défaut ; unité déduite : secondes).
---@param initData table|nil Options supplémentaires pour la caméra ; modifié en place.
function core_paths.playPath(path, offset, initData) end

--- Écrit le chemin dans un fichier JSON (version 6) et met à jour cameraPath.filename et dirty = false.
---Source : lua/ge/extensions/core/paths.lua:277
---@param cameraPath table Chemin à sauvegarder.
---@param filename string Fichier de destination (ex. .camPath.json).
function core_paths.savePath(cameraPath, filename) end

--- Si la caméra active est 'path', passe en caméra libre (commands.setFreeCamera).
---Source : lua/ge/extensions/core/paths.lua:503
function core_paths.stopCurrentPath() end

