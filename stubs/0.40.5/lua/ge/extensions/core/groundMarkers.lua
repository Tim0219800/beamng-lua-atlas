---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/groundMarkers.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Extension GE `core_groundMarkers` : navigation au sol. Calcule un itinéraire (route planner) du véhicule joueur vers un ou plusieurs points, dessine des décalques de flèches bleues sur la route devant le véhicule (rendu par DynamicDecalMgr), met à jour les flèches flottantes aux intersections (core_groundMarkerArrows) et envoie le tracé à l'UI (appli de navigation). Un moddeur l'utilise pour guider le joueur vers une destination : setPath(points).
--- Accès : extension `core_groundMarkers` : `extensions.load("core_groundMarkers")`, puis la globale `core_groundMarkers`
---@class core_groundMarkers
---@field colorSet string Jeu de couleurs actif : 'blue' (défaut) ou 'green' (clés de colorSets).
---@field colorSets table<string, {decals: number[], arrows: number[]}> Couleurs RGB 0..1 des décalques et des flèches : blue {0,0.4,1}/{0,0.48,0.77}, green {0,1,0}/{0,1,0}.
---@field debugPath boolean true = dessine les points du chemin (sphères, prismes, numéros) à chaque rendu. Faux par défaut.
---@field decalBlendEnd number 100 m : distance à partir de laquelle l'opacité décroît vers 0 à decalDrawingDistance.
---@field decalBlendOffset number 1 m : distance sous laquelle les décalques sont invisibles.
---@field decalBlendStart number 10 m : distance à partir de laquelle l'opacité est complète.
---@field decalDrawingDistance number 120 : distance maximale des décalques devant le véhicule, en mètres.
---@field decalPool table[] Pool de données de décalques réutilisées à chaque image (champs texture, position, forwardVec, color, scale, fadeStart, fadeEnd).
---@field decalPoolCount integer Nombre d'entrées dans decalPool.
---@field dependencies string[] {'core_groundMarkerArrows'}.
---@field routePlanner table Instance de gameplay/route/route (calcul du chemin, trackVehicle, path[] avec pos, distToTarget, wp, linkCount).
core_groundMarkers = {}

--- Indique si un tracé est actif.
---Source : lua/ge/extensions/core/groundMarkers.lua:396
---@return boolean  true si une destination est définie.
function core_groundMarkers.currentlyHasTarget() end

--- Remplit le pool de décalques le long du chemin à partir de la position donnée (jusqu'à decalDrawingDistance) avec l'opacité calculée, puis met à jour les flèches flottantes si le réglage est actif. Appelée à chaque rendu par onPreRender.
---Source : lua/ge/extensions/core/groundMarkers.lua:142
---@param startPos vec3 Position de départ (véhicule joueur ou caméra).
function core_groundMarkers.generateRouteDecals(startPos) end

--- Longueur restante du chemin jusqu'à la destination, d'après distToTarget du premier point.
---Source : lua/ge/extensions/core/groundMarkers.lua:45
---@return number  Mètres ; math.huge si un calcul asynchrone est en cours ; 0 s'il n'y a pas de chemin.
function core_groundMarkers.getPathLength() end

--- Première destination restante telle que fournie à setPath.
---Source : lua/ge/extensions/core/groundMarkers.lua:399
---@return vec3|string|table|nil  Destination (peut être un nom de nœud) ou nil.
function core_groundMarkers.getTargetPos() end

--- Hook de changement d'état d'une mission : efface le tracé quand l'état est 'started' ou 'stopped'.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/groundMarkers.lua:426
---@param state string État de la mission.
function core_groundMarkers.onAnyMissionChanged(state) end

--- Hook de fin de niveau : appelle resetAll.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/groundMarkers.lua:384
function core_groundMarkers.onClientEndMission() end

--- Hook de déchargement de l'extension : appelle resetAll.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/groundMarkers.lua:388
function core_groundMarkers.onExtensionUnloaded() end

--- Hook de rendu : suit le véhicule sur le chemin, régénère les décalques si besoin, dessine le debug, ajoute les décalques à Engine.Render.DynamicDecalMgr et envoie le tracé à l'UI toutes les 0,25 s. Ne fait rien sans destination ou en mode photo.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/groundMarkers.lua:185
---@param dt number Delta temps du rendu en secondes.
function core_groundMarkers.onPreRender(dt) end

--- Hook avant rechargement des extensions : supprime les flèches ; ne renvoie rien.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/groundMarkers.lua:392
function core_groundMarkers.onSerialize() end

--- Hook de changement de réglages : crée ou supprime les flèches flottantes selon showNavigationArrows et force la régénération des décalques selon showNavigationGroundmarkers.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/groundMarkers.lua:405
function core_groundMarkers.onSettingsChanged() end

--- Efface le tracé (setPath(nil)), réinitialise les paramètres du routeur et supprime les flèches.
---Source : lua/ge/extensions/core/groundMarkers.lua:367
function core_groundMarkers.resetAll() end

--- Envoie à l'UI le tracé courant : guihooks 'NavigationGroundMarkersUpdate' {markers = x,y à plat, color = '#RRGGBBFF'}.
---Source : lua/ge/extensions/core/groundMarkers.lua:234
function core_groundMarkers.sendToApp() end

--- Déprécié : ancienne API convertie en options pour setPath (warning loggué une fois). Les paramètres _fadeStart, _fadeEnd, _endPos, _disableVeh sont ignorés.
---Source : lua/ge/extensions/core/groundMarkers.lua:354
---@param wp any Destination(s), comme setPath.
---@param step number|nil Espacement des décalques.
---@param _fadeStart any Ignoré.
---@param _fadeEnd any Ignoré.
---@param _endPos any Ignoré.
---@param _disableVeh any Ignoré.
---@param _color number[]|nil Couleur RGB.
---@param _cutOffDrivability number|nil Voir setPath.
---@param _penaltyAboveCutoff number|nil Voir setPath.
---@param _penaltyBelowCutoff number|nil Voir setPath.
---@param _renderDecals boolean|nil Voir setPath.
function core_groundMarkers.setFocus(wp, step, _fadeStart, _fadeEnd, _endPos, _disableVeh, _color, _cutOffDrivability, _penaltyAboveCutoff, _penaltyBelowCutoff, _renderDecals) end

--- Définit (ou efface) l'itinéraire de navigation vers un ou plusieurs points. Réinitialise le pool de décalques, calcule le chemin depuis la position du véhicule joueur (ou de la caméra), crée les flèches et prévient l'UI.
---Source : lua/ge/extensions/core/groundMarkers.lua:249
---@param wp vec3|string|table|table[]|nil Destination(s) : vec3, nom de nœud de la carte, {x,y,z}, ou liste de ceux-ci. nil efface.
---@param options table|nil Voir notes : step, color, cutOffDrivability, penaltyAboveCutoff, penaltyBelowCutoff, dirMult, wD, wZ, renderDecals, lockFixedNodes, clearPathOnReachingTarget, async, onComplete.
function core_groundMarkers.setPath(wp, options) end

--- Retire la première destination de la liste (étape atteinte) et le marquage de nœud fixe correspondant dans le routeur ; s'il n'y en a plus, efface tout.
---Source : lua/ge/extensions/core/groundMarkers.lua:333
---@return boolean  false s'il n'y avait aucun tracé actif, sinon true.
function core_groundMarkers.unflagFirstFixedNode() end

