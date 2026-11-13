---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/drivePathEditor/record.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Enregistrement d'un trajet pour le Drive Path Editor : pendant que le joueur conduit un véhicule, le module échantillonne sa position et sa vitesse chaque seconde, puis à l'arrêt crée une nouvelle spline « Recorded_<nom> » liée à ce véhicule, simplifiée par l'algorithme RDP.
--- Accès : extension `editor_drivePathEditor_record` : `extensions.load("editor_drivePathEditor_record")`, puis la globale `editor_drivePathEditor_record`
---@class editor_drivePathEditor_record
editor_drivePathEditor_record = {}

--- Temps écoulé depuis le début de l'enregistrement.
---Source : lua/ge/extensions/editor/drivePathEditor/record.lua:36
---@return number  secondes
function editor_drivePathEditor_record.getRecordingTime() end

--- À appeler chaque frame : fait avancer le chrono et ajoute un point (position, vitesse >= 3 m/s) toutes les secondes. Sans effet si aucun véhicule n'est enregistré.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/drivePathEditor/record.lua:39
function editor_drivePathEditor_record.handleRecord() end

--- Démarre l'enregistrement : mémorise le véhicule, y fait entrer le joueur (be:enterVehicle(0, …)), vide les données et enregistre le premier point.
---Source : lua/ge/extensions/editor/drivePathEditor/record.lua:64
---@param vehicle table|nil entrée de véhicule de l'éditeur avec .veh (objet véhicule) et .name
function editor_drivePathEditor_record.startRecord(vehicle) end

--- Termine l'enregistrement : ajoute une spline de chemin liée au véhicule, copie positions et vitesses, retire les doublons proches, simplifie via rdp.simplifyNodesVels et remet l'état à zéro.
---Source : lua/ge/extensions/editor/drivePathEditor/record.lua:86
---@param sceneVehicles table véhicules de la scène ; l'entrée correspondante reçoit isLink = true et linkSplineId
function editor_drivePathEditor_record.stopRecord(sceneVehicles) end

