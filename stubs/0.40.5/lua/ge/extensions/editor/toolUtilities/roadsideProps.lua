---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/roadsideProps.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Placeur partagé de lignes d'objets en bord de route (glissières, barrières, clôtures, lampadaires, bornes, poubelles, abri-bus…). Une table de préréglages (presets) décrit chaque pièce (forme .dae, rotation, écart entre pièces, mode de normale, pièces alternées, embouts) ; runLine pose une ligne de pièces le long d'un rail, placePoints une pièce à chaque point donné, placeScatter des éléments épars aléatoires. Les pièces vont dans des « pools » identifiés par poolId (scène via kitPlacer), que l'outil peut supprimer, compter ou graver (commitPool) en objets persistants. Les lampadaires créent aussi leur lumière (siteLights).
--- Accès : extension `editor_toolUtilities_roadsideProps` : `extensions.load("editor_toolUtilities_roadsideProps")`, puis la globale `editor_toolUtilities_roadsideProps`
---@class editor_toolUtilities_roadsideProps
---@field presets table<string, table> Table des préréglages de pièces, par clé. Champs usuels : name, shapePath, preRot (0 à 3, quarts de tour autour de Z), gapM (écart entre pièces, négatif = recouvrement), nativeLenM, normalMode ('surface' ou 'global'), altPaths (formes alternées), capMode/capPath/capPreRot (embouts), reach/bright (lampadaires).
editor_toolUtilities_roadsideProps = {}

--- Fusionne des préréglages supplémentaires dans la table presets (par clé). Utilisé par le kit de props, hors version livrée, pour enregistrer le mobilier et les pièces civiques.
---Source : lua/ge/extensions/editor/toolUtilities/roadsideProps.lua:517
---@param t table<string, table> Préréglages à ajouter ou remplacer.
function editor_toolUtilities_roadsideProps.addPresets(t) end

--- Démarre un lot de props ponctuels avec dédoublonnage spatial : tout point à moins de minGap d'un point déjà posé dans ce lot est refusé (désagrège les endroits où des lignes se rejoignent). Sans minGap positif, désactive le dédoublonnage.
---Source : lua/ge/extensions/editor/toolUtilities/roadsideProps.lua:244
---@param minGap number|nil Distance minimale entre points, en mètres.
function editor_toolUtilities_roadsideProps.beginPointBatch(minGap) end

--- Grave un pool : rend persistantes (canSave=true) les pièces transitoires et les lumières de ses lampadaires, puis les détache du pool sans les supprimer.
---Source : lua/ge/extensions/editor/toolUtilities/roadsideProps.lua:301
---@param poolId string Identifiant du pool.
---@return table  Liste des identifiants/noms des objets rendus persistants.
function editor_toolUtilities_roadsideProps.commitPool(poolId) end

--- Termine le lot de props ponctuels.
---Source : lua/ge/extensions/editor/toolUtilities/roadsideProps.lua:248
function editor_toolUtilities_roadsideProps.endPointBatch() end

--- Fabrique l'enregistrement de lumière (voir siteLights) d'un lampadaire posé en (px, py, pz) et tourné de q ; la tête est placée sous le haut de la boîte du maillage, au bout du bras s'il y en a un. Renvoie nil si le préréglage n'est pas un lampadaire.
---Source : lua/ge/extensions/editor/toolUtilities/roadsideProps.lua:210
---@param presetKey string Clé du préréglage.
---@param px number x du pied.
---@param py number y du pied.
---@param pz number z du pied.
---@param q quat Rotation de la pièce.
---@param scale number|nil Échelle (défaut 1).
---@param col any|nil Couleur de lueur (défaut siteLights.TONES.warm).
---@param bright number|nil Luminosité (défaut celle du préréglage).
---@param reach number|nil Rayon de la lumière (défaut celui du préréglage).
---@return table|nil  { px, py, pz, glow, radius, brightness }.
function editor_toolUtilities_roadsideProps.lampLight(presetKey, px, py, pz, q, scale, col, bright, reach) end

--- Rotation donnée à une pièce posée (voir orient) pour un outil qui dresse ses propres pièces. Quaternion partagé : l'utiliser ou le copier avant l'appel suivant.
---Source : lua/ge/extensions/editor/toolUtilities/roadsideProps.lua:179
---@param along vec3 Direction le long du rail.
---@param up vec3 Direction vers le haut.
---@param preIdx integer Pré-rotation de la pièce, 0 à 3 (0, 90, 180, 270 degrés autour de Z).
---@param sideSign number|nil Côté : valeur négative retourne la pièce de 180 degrés (défaut 1).
---@return quat  Rotation (instance partagée du module).
function editor_toolUtilities_roadsideProps.orientation(along, up, preIdx, sideSign) end

--- Pose un préréglage à chaque point monde fourni. Remplace le pool sauf si keepPool. Chaque point peut porter ax, ay (direction le long, horizontale) et scl (nombre, ou {x,y,z} dans le repère de la pièce) pour ajuster cette instance. Pour un lampadaire, crée aussi la lumière.
---Source : lua/ge/extensions/editor/toolUtilities/roadsideProps.lua:314
---@param opts table poolId, presetKey, folder (groupe de scène parent), points ({x,y,z,ax,ay,scl}), sideSign (défaut 1), keepPool, ownerTag, outPositions (reçoit les positions posées), outLights (reçoit les lumières).
---@return integer  Nombre de pièces posées (0 si préréglage ou points manquants).
function editor_toolUtilities_roadsideProps.placePoints(opts) end

--- Disperse des maillages libres aux points donnés (forme, lacet, inclinaison, taille et enfouissement aléatoires) dans un pool. Déterministe pour opts.seed. Remplace toujours le pool.
---Source : lua/ge/extensions/editor/toolUtilities/roadsideProps.lua:340
---@param opts table poolId, folder, shapePaths (formes au choix), points ({x,y,z}), seed, base (échelle de base, défaut 1), var (variation relative, défaut 0), tiltMax (inclinaison max en radians, défaut 0.2), buryBase (défaut 0.03 m), buryVar (défaut 0.12), collidable (booléen), outPositions.
---@return integer  Nombre de pièces posées.
function editor_toolUtilities_roadsideProps.placeScatter(opts) end

--- Nombre de pièces actuellement dans un pool (0 si vide, non construit ou gravé). Lecture en O(1), utilisable à chaque frame.
---Source : lua/ge/extensions/editor/toolUtilities/roadsideProps.lua:289
---@param poolId string Identifiant du pool.
---@return integer  Nombre de pièces.
function editor_toolUtilities_roadsideProps.poolCount(poolId) end

--- Renvoie les pièces posées d'un pool, pour une cuisson qui les relit dans la scène. Lecture seule.
---Source : lua/ge/extensions/editor/toolUtilities/roadsideProps.lua:295
---@param poolId string Identifiant du pool.
---@return table|nil  Liste d'objets de scène, ou nil.
function editor_toolUtilities_roadsideProps.poolList(poolId) end

--- Supprime le pool de pièces posées par l'appelant (pièces et lumières).
---Source : lua/ge/extensions/editor/toolUtilities/roadsideProps.lua:278
---@param poolId string Identifiant du pool.
function editor_toolUtilities_roadsideProps.removePool(poolId) end

--- Construit (ou reconstruit) une ligne de props le long d'un rail. keepPool ajoute au pool au lieu de le remplacer, ce qui permet de bâtir une ligne faite de plusieurs rails (un parapet interrompu par des volées arrive en quelques tronçons ouverts). Les props ponctuels (mode global) sont posés à intervalles réguliers, avec lockEnds pour verrouiller les deux extrémités et répartir l'intérieur.
---Source : lua/ge/extensions/editor/toolUtilities/roadsideProps.lua:372
---@param opts table poolId, presetKey ('none' = rien), folder, railPts (au moins 2 points), railUps (normales), sideSign, stepM, extraGapM, lockEnds, isLoop, keepPool, ownerTag, outPositions, outLights, rejectFn (renvoie true pour refuser un échantillon).
---@return integer  Nombre de pièces posées.
function editor_toolUtilities_roadsideProps.runLine(opts) end

