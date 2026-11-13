---@meta
-- tim19Atlas stub generated from lua/ge/extensions/scenario/raceMarkers/dragStagePlane.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Plan de staging dessiné en debug.
---@class scenario_raceMarkers_dragStagePlane
local scenario_raceMarkers_dragStagePlane = {}

--- Efface la table d'identifiants.
---Source : lua/ge/extensions/scenario/raceMarkers/dragStagePlane.lua:30
function scenario_raceMarkers_dragStagePlane:clearMarkers() end

--- Prépare une table d'identifiants vide (aucun objet créé).
---Source : lua/ge/extensions/scenario/raceMarkers/dragStagePlane.lua:26
function scenario_raceMarkers_dragStagePlane:createMarkers() end

--- Distance à partir de laquelle le plan doit être affiché (25 m).
---Source : lua/ge/extensions/scenario/raceMarkers/dragStagePlane.lua:59
---@return number  Distance en mètres.
function scenario_raceMarkers_dragStagePlane:getShowDistance() end

--- Appelle setVisibility(false).
---Source : lua/ge/extensions/scenario/raceMarkers/dragStagePlane.lua:87
function scenario_raceMarkers_dragStagePlane:hide() end

--- Constructeur : initialise centre, axes, demi-largeur 2 m, hauteur 0.5 m, distance d'affichage 25 m.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/scenario/raceMarkers/dragStagePlane.lua:10
---@param id integer Identifiant unique.
function scenario_raceMarkers_dragStagePlane:init(id) end

--- 'hidden' (défaut) masque, tout autre mode affiche.
---Source : lua/ge/extensions/scenario/raceMarkers/dragStagePlane.lua:74
---@param mode string|nil Nom du mode.
function scenario_raceMarkers_dragStagePlane:setMode(mode) end

--- Règle la géométrie du plan ; chaque argument nil garde la valeur actuelle. across et up sont normalisés (ignorés s'ils sont quasi nuls), halfWidth et height sont bornés à 0.05 minimum.
---Source : lua/ge/extensions/scenario/raceMarkers/dragStagePlane.lua:41
---@param center vec3|nil Centre de la ligne de départ.
---@param across vec3|nil Direction transversale (gauche vers droite).
---@param up vec3|nil Direction vers le haut.
---@param halfWidth number|nil Demi-largeur en mètres.
---@param height number|nil Hauteur des parois en mètres.
function scenario_raceMarkers_dragStagePlane:setPlane(center, across, up, halfWidth, height) end

--- Place le centre du plan sur wp.pos.
---Source : lua/ge/extensions/scenario/raceMarkers/dragStagePlane.lua:34
---@param wp table {pos}.
function scenario_raceMarkers_dragStagePlane:setToCheckpoint(wp) end

--- Active ou désactive le dessin.
---Source : lua/ge/extensions/scenario/raceMarkers/dragStagePlane.lua:83
---@param v boolean Visibilité.
function scenario_raceMarkers_dragStagePlane:setVisibility(v) end

--- Appelle setVisibility(true).
---Source : lua/ge/extensions/scenario/raceMarkers/dragStagePlane.lua:91
function scenario_raceMarkers_dragStagePlane:show() end

--- Appel par image : dessine les faces translucides avec debugDrawer:drawTriSolid.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/scenario/raceMarkers/dragStagePlane.lua:126
---@param dt number Durée réelle (s), non utilisée.
---@param dtSim number Durée simulée (s), non utilisée.
function scenario_raceMarkers_dragStagePlane:update(dt, dtSim) end

--- Met à jour le plan d'après la transformation de staging et la distance du véhicule à la ligne.
---Source : lua/ge/extensions/scenario/raceMarkers/dragStagePlane.lua:63
---@param stageTransform table|nil {position, x, y, scale?}.
---@param distanceToStage number|nil Distance du véhicule à la ligne (m, défaut 0).
---@param isValidStage boolean|nil Placement valide ou non.
function scenario_raceMarkers_dragStagePlane:updateFromStaging(stageTransform, distanceToStage, isValidStage) end

