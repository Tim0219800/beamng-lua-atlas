---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/drivePathEditor/playback.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Lecture des chemins (splines) du Drive Path Editor : associe chaque véhicule à sa spline liée, le replace au départ, puis, une fois le délai de la spline écoulé, envoie au véhicule une commande vLua ai.driveUsingPath générée depuis la spline. Deux modes : libre (script de nœuds x,y,z,r[,v|vl] après lissage Catmull-Rom et simplification RDP, tolérance 1.0) ou graphe de navigation (wpTargetList et wpSpeeds).
--- Accès : extension `editor_drivePathEditor_playback` : `extensions.load("editor_drivePathEditor_playback")`, puis la globale `editor_drivePathEditor_playback`
---@class editor_drivePathEditor_playback
editor_drivePathEditor_playback = {}

--- Temps écoulé depuis le début de la lecture.
---Source : lua/ge/extensions/editor/drivePathEditor/playback.lua:25
---@return number  secondes
function editor_drivePathEditor_playback.getPlaybackTime() end

--- À appeler chaque frame : démarre l'IA des véhicules dont le delayTime est atteint (une seule fois par véhicule) puis fait avancer le temps de lecture.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/drivePathEditor/playback.lua:77
function editor_drivePathEditor_playback.handlePlayback() end

--- Prépare la lecture : vide la table des lectures en cours, y met chaque véhicule ayant une spline liée et activée, replace ces véhicules à leur pose de départ (splineMgr.resetVehiclePose), puis remet les compteurs de temps à zéro.
---Source : lua/ge/extensions/editor/drivePathEditor/playback.lua:30
---@param splines table splines de chemin (champs id, isVehicleLink, linkVehId, isEnabled, delayTime…)
---@param vehicles table véhicules de la scène (champs vid, veh, linkSplineId)
function editor_drivePathEditor_playback.startPlayback(splines, vehicles) end

--- Envoie ai.setState({mode = "stop"}) à chaque véhicule en cours de lecture, les replace à leur pose de départ, puis vide la table et remet les compteurs à zéro.
---Source : lua/ge/extensions/editor/drivePathEditor/playback.lua:58
function editor_drivePathEditor_playback.stopPlayback() end

