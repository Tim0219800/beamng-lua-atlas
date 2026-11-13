---@meta
-- tim19Atlas stub generated from lua/ge/extensions/scenario/raceMarkers/attention.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Marqueur flèche d'attention.
---@class scenario_raceMarkers_attention
local scenario_raceMarkers_attention = {}

--- Supprime les objets créés par ce marqueur.
---Source : lua/ge/extensions/scenario/raceMarkers/attention.lua:177
function scenario_raceMarkers_attention:clearMarkers() end

--- Supprime les anciens objets puis crée la flèche.
---Source : lua/ge/extensions/scenario/raceMarkers/attention.lua:166
function scenario_raceMarkers_attention:createMarkers() end

--- Crée un objet TSStatic caché (shapeName, couleur d'instance, non sauvegardable) enregistré sous objectName et ajouté à ScenarioObjectsGroup s'il existe.
---Source : lua/ge/extensions/scenario/raceMarkers/attention.lua:144
---@param shapeName string Chemin du modèle .dae.
---@param objectName string Nom d'enregistrement.
---@return table  L'objet TSStatic.
function scenario_raceMarkers_attention:createObject(shapeName, objectName) end

--- Appelle setVisibility(false).
---Source : lua/ge/extensions/scenario/raceMarkers/attention.lua:140
function scenario_raceMarkers_attention:hide() end

--- Constructeur : initialise l'état (invisible, mode 'hidden', lisseur de hauteur).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/scenario/raceMarkers/attention.lua:29
---@param id integer Identifiant unique du marqueur.
function scenario_raceMarkers_attention:init(id) end

--- Change le mode : 'hidden' masque, tout autre mode affiche. Remet le minuteur de couleur à zéro.
---Source : lua/ge/extensions/scenario/raceMarkers/attention.lua:116
---@param mode string Nom du mode.
function scenario_raceMarkers_attention:setMode(mode) end

--- Place le marqueur sur un checkpoint.
---Source : lua/ge/extensions/scenario/raceMarkers/attention.lua:106
---@param wp table {pos = vec3|table, radius = number|nil}.
function scenario_raceMarkers_attention:setToCheckpoint(wp) end

--- Affiche ou cache la flèche.
---Source : lua/ge/extensions/scenario/raceMarkers/attention.lua:131
---@param v boolean Visibilité.
function scenario_raceMarkers_attention:setVisibility(v) end

--- Appelle setVisibility(true).
---Source : lua/ge/extensions/scenario/raceMarkers/attention.lua:141
function scenario_raceMarkers_attention:show() end

--- Appel par image. Masque le marqueur une fois le fondu terminé en mode 'hidden', oriente la flèche vers la caméra (core_camera.getPosition), la fait osciller et applique la couleur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/scenario/raceMarkers/attention.lua:53
---@param dt number Durée réelle de l'image (s).
---@param dtSim number Durée simulée (s).
function scenario_raceMarkers_attention:update(dt, dtSim) end

