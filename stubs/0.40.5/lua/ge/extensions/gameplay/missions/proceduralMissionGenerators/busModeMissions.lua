---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/missions/proceduralMissionGenerators/busModeMissions.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Générateur procédural de missions « busMode » (conduite de bus en freeroam). Pour chaque niveau possédant des fichiers /levels/<niveau>/buslines/*.buslines.json, il crée une mission par scénario « bus » de scenario_scenariosLoader, avec les données de route (liste de tâches, aides de navigation, couleur, véhicule, route inverse) et un déclencheur placé sur le point d'apparition du bus. Appelé par gameplay_missions_missions pour ajouter ces missions à la liste.
--- Accès : extension `gameplay_missions_proceduralMissionGenerators_busModeMissions` : `extensions.load("gameplay_missions_proceduralMissionGenerators_busModeMissions")`, puis la globale `gameplay_missions_proceduralMissionGenerators_busModeMissions`
---@class gameplay_missions_proceduralMissionGenerators_busModeMissions
gameplay_missions_proceduralMissionGenerators_busModeMissions = {}

--- Génère la liste des missions busMode pour un ou plusieurs niveaux (tous si nil). Ne garde que les niveaux ayant au moins une route de bus. Place le déclencheur (startTrigger) sur missionStartTriggerPos s'il existe, sinon sur le point d'apparition du bus, et remplit missionTypeData.spawnPos / spawnRot.
---Source : lua/ge/extensions/gameplay/missions/proceduralMissionGenerators/busModeMissions.lua:32
---@param levelIdentifier string|table|nil Nom de niveau ou liste de noms ; nil = tous les niveaux.
---@return table  Liste de définitions de missions (tables non enregistrées sur disque).
function gameplay_missions_proceduralMissionGenerators_busModeMissions.generate(levelIdentifier) end

