---@meta
-- tim19Atlas stub generated from lua/ge/extensions/scenario/raceMarkers/parkingraceSpotMarker.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Marqueur de place de parking avec contours et décalque.
---@class scenario_raceMarkers_parkingraceSpotMarker
local scenario_raceMarkers_parkingraceSpotMarker = {}

--- Supprime les contours (après vérification qu'ils existent encore) et les données de décalque.
---Source : lua/ge/extensions/scenario/raceMarkers/parkingraceSpotMarker.lua:70
function scenario_raceMarkers_parkingraceSpotMarker:clearMarkers() end

--- Supprime les anciens objets puis crée trois contours TSStatic (collision et décalque désactivés) et prépare les données du décalque au sol.
---Source : lua/ge/extensions/scenario/raceMarkers/parkingraceSpotMarker.lua:39
function scenario_raceMarkers_parkingraceSpotMarker:createMarkers() end

--- Appelle setVisibility(false).
---Source : lua/ge/extensions/scenario/raceMarkers/parkingraceSpotMarker.lua:131
function scenario_raceMarkers_parkingraceSpotMarker:hide() end

--- Constructeur : initialise position, rotation, taille (2.5 x 5 x 0.5), couleurs et lisseurs.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/scenario/raceMarkers/parkingraceSpotMarker.lua:18
---@param id string|integer|nil Identifiant, converti en chaîne (défaut 'parkingraceSpotMarker'), utilisé dans le nom des objets.
function scenario_raceMarkers_parkingraceSpotMarker:init(id) end

--- Fixe la couleur cible (lissée ensuite).
---Source : lua/ge/extensions/scenario/raceMarkers/parkingraceSpotMarker.lua:114
---@param color table {r, g, b, a} indexé de 1 à 4 ou avec champs r/g/b/a.
function scenario_raceMarkers_parkingraceSpotMarker:setColor(color) end

--- Configure la place : position, rotation et taille, appliquées aux contours et au décalque.
---Source : lua/ge/extensions/scenario/raceMarkers/parkingraceSpotMarker.lua:86
---@param pos vec3|nil Centre de la place.
---@param rot quat|nil Orientation.
---@param scl vec3|nil Taille complète de la place (m).
function scenario_raceMarkers_parkingraceSpotMarker:setSpot(pos, rot, scl) end

--- Affiche ou cache les contours.
---Source : lua/ge/extensions/scenario/raceMarkers/parkingraceSpotMarker.lua:122
---@param v boolean Visibilité.
function scenario_raceMarkers_parkingraceSpotMarker:setVisibility(v) end

--- Appelle setVisibility(true).
---Source : lua/ge/extensions/scenario/raceMarkers/parkingraceSpotMarker.lua:130
function scenario_raceMarkers_parkingraceSpotMarker:show() end

--- Appel par image quand visible : avance les lisseurs de couleur, colore les contours et renvoie le décalque au gestionnaire de décalques dynamiques.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/scenario/raceMarkers/parkingraceSpotMarker.lua:133
---@param dt number Durée de l'image (s).
function scenario_raceMarkers_parkingraceSpotMarker:update(dt) end

