---@meta
-- tim19Atlas stub generated from lua/ge/extensions/scenario/raceMarkers/sideColumnMarker.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Marqueur à deux colonnes latérales.
---@class scenario_raceMarkers_sideColumnMarker
local scenario_raceMarkers_sideColumnMarker = {}

--- Efface les masques de rendu des objets puis les cache dans les vues d'écran partagé des autres joueurs que renderViewPlayer (render_splitScreen.getPlayers).
---Source : lua/ge/extensions/scenario/raceMarkers/sideColumnMarker.lua:233
function scenario_raceMarkers_sideColumnMarker:applyRenderViewMask() end

--- Supprime un objet à partir de son identifiant (masque de rendu effacé avant la suppression).
---Source : lua/ge/extensions/scenario/raceMarkers/sideColumnMarker.lua:288
---@param id integer|nil Identifiant d'objet.
function scenario_raceMarkers_sideColumnMarker:clearMarker(id) end

--- Supprime base et colonnes.
---Source : lua/ge/extensions/scenario/raceMarkers/sideColumnMarker.lua:299
function scenario_raceMarkers_sideColumnMarker:clearMarkers() end

--- Supprime les anciens objets puis crée la base et les deux colonnes, et applique le masque de vues.
---Source : lua/ge/extensions/scenario/raceMarkers/sideColumnMarker.lua:280
function scenario_raceMarkers_sideColumnMarker:createMarkers() end

--- Crée un TSStatic caché enregistré sous objectName et ajouté à ScenarioObjectsGroup.
---Source : lua/ge/extensions/scenario/raceMarkers/sideColumnMarker.lua:257
---@param shapeName string Chemin du modèle.
---@param objectName string Nom d'enregistrement.
---@return table  L'objet créé.
function scenario_raceMarkers_sideColumnMarker:createObject(shapeName, objectName) end

--- Appelle setVisibility(false).
---Source : lua/ge/extensions/scenario/raceMarkers/sideColumnMarker.lua:229
function scenario_raceMarkers_sideColumnMarker:hide() end

--- Constructeur : initialise l'état et appelle clearMarkers.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/scenario/raceMarkers/sideColumnMarker.lua:67
---@param id integer Identifiant unique.
function scenario_raceMarkers_sideColumnMarker:init(id) end

--- Change de mode : affiche (sauf 'hidden') et lance le fondu de couleur.
---Source : lua/ge/extensions/scenario/raceMarkers/sideColumnMarker.lua:201
---@param mode string default, next, start, lap, recovery, final, branch ou hidden.
function scenario_raceMarkers_sideColumnMarker:setMode(mode) end

--- Réserve ce marqueur à la vue d'un joueur (nil pour tous) et applique le masque.
---Source : lua/ge/extensions/scenario/raceMarkers/sideColumnMarker.lua:252
---@param player integer|nil Indice du joueur.
function scenario_raceMarkers_sideColumnMarker:setRenderViewPlayer(player) end

--- Place base et colonnes sur un checkpoint.
---Source : lua/ge/extensions/scenario/raceMarkers/sideColumnMarker.lua:175
---@param wp table {pos, radius, normal?, fadeNear?, fadeFar?, minAlpha?}.
function scenario_raceMarkers_sideColumnMarker:setToCheckpoint(wp) end

--- Affiche ou cache base et colonnes.
---Source : lua/ge/extensions/scenario/raceMarkers/sideColumnMarker.lua:213
---@param v boolean Visibilité.
function scenario_raceMarkers_sideColumnMarker:setVisibility(v) end

--- Appelle setVisibility(true).
---Source : lua/ge/extensions/scenario/raceMarkers/sideColumnMarker.lua:230
function scenario_raceMarkers_sideColumnMarker:show() end

--- Appel par image : calcule couleur, alpha, taille de la base et des colonnes d'après la distance à la caméra.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/scenario/raceMarkers/sideColumnMarker.lua:99
---@param dt number Durée réelle (s).
---@param dtSim number Durée simulée (s).
function scenario_raceMarkers_sideColumnMarker:update(dt, dtSim) end

