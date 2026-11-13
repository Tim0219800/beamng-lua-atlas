---@meta
-- tim19Atlas stub generated from lua/ge/extensions/scenario/race_marker.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Gestionnaire des marqueurs 3D de checkpoints d'une course de scénario. Il crée un marqueur par waypoint avec le type choisi (module scenario/raceMarkers/<type>, par défaut sideColumnMarker), les masque ou affiche, règle leur mode (courant, suivant, caché...) et les met à jour à chaque image. Les marqueurs sont masqués en mode photo.
--- Accès : extension `scenario_race_marker` : `extensions.load("scenario_race_marker")`, puis la globale `scenario_race_marker`
---@class scenario_race_marker
---@field idToMarker table Table id -> marqueur, copie initiale de la table interne (voir notes).
scenario_race_marker = {}

--- Crée un marqueur du type donné (ou du type courant par défaut), appelle createMarkers() et, sauf si detached, l'enregistre pour les mises à jour et le masquage.
---Source : lua/ge/extensions/scenario/race_marker.lua:29
---@param detached boolean|nil Si true, le marqueur n'est pas géré par ce module (pas de mise à jour automatique).
---@param type string|nil Nom du module dans scenario/raceMarkers/, par exemple 'ringMarker'.
---@return table  Le marqueur créé.
function scenario_race_marker.createRaceMarker(detached, type) end

--- Demande à chaque marqueur qui en est capable (drawOnMinimap) de se dessiner sur la minicarte.
---Source : lua/ge/extensions/scenario/race_marker.lua:106
---@param td any Contexte de dessin transmis tel quel aux marqueurs (déduit du code).
function scenario_race_marker.drawOnMinimap(td) end

--- Masque tous les marqueurs gérés.
---Source : lua/ge/extensions/scenario/race_marker.lua:17
function scenario_race_marker.hide() end

--- Efface les marqueurs précédents et masque ceux qui restent.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/scenario/race_marker.lua:50
function scenario_race_marker.init() end

--- Hook de fin de mission : supprime les marqueurs et remet le type de marqueur par défaut.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/scenario/race_marker.lua:115
function scenario_race_marker.onClientEndMission() end

--- À appeler chaque image : masque les marqueurs en mode photo (et les restaure à la sortie), sinon appelle marker:update(dt, dtSim) sur chacun.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/scenario/race_marker.lua:76
---@param dt number Durée de l'image réelle (s).
---@param dtSim number Durée de simulation (s).
function scenario_race_marker.render(dt, dtSim) end

--- Règle le mode de chaque marqueur d'après une table nom de waypoint -> mode ; les noms absents passent en 'hidden'.
---Source : lua/ge/extensions/scenario/race_marker.lua:93
---@param wpModes table<string, string> Mode par nom de waypoint.
function scenario_race_marker.setModes(wpModes) end

--- Replace chaque marqueur sur les données de checkpoint correspondant à son nom.
---Source : lua/ge/extensions/scenario/race_marker.lua:98
---@param data table<string, table> Données de checkpoint par nom de waypoint.
function scenario_race_marker.setToCheckpoints(data) end

--- Choisit le type de marqueur puis crée un marqueur par waypoint et le place sur son checkpoint (setToCheckpoint). Les anciens marqueurs sont d'abord supprimés. Les marqueurs sont indexés par wp.name.
---Source : lua/ge/extensions/scenario/race_marker.lua:57
---@param wps table[] Liste de waypoints, chacun avec un champ name.
---@param marker string|nil Nom du module dans scenario/raceMarkers/ ; nil pour le type par défaut sideColumnMarker.
function scenario_race_marker.setupMarkers(wps, marker) end

--- Affiche tous les marqueurs gérés.
---Source : lua/ge/extensions/scenario/race_marker.lua:23
function scenario_race_marker.show() end

