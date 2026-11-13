---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/recce/drivelineRecording.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Chargeur du fichier de « driveline » enregistré pendant une reconnaissance (recce) de rallye. Une driveline est une suite de points horodatés (position, orientation) du parcours roulé. Le module lit le fichier JSONL de la mission et construit une PointList avec relations entre points et normales. Extension gameplay_rally_recce_drivelineRecording, utilisée par la classe recce.
--- Accès : extension `gameplay_rally_recce_drivelineRecording` : `extensions.load("gameplay_rally_recce_drivelineRecording")`, puis la globale `gameplay_rally_recce_drivelineRecording`
---@class gameplay_rally_recce_drivelineRecording
gameplay_rally_recce_drivelineRecording = {}

--- Charge le fichier de driveline de la mission et renvoie une PointList prête à l'emploi (setupPointRelationships et setupPointNormals déjà appelés).
---Source : lua/ge/extensions/gameplay/rally/recce/drivelineRecording.lua:17
---@param missionDir string Dossier de la mission contenant le fichier de driveline (rallyUtil.drivelineFile)
---@return table|nil  PointList, ou nil si le fichier est absent, illisible ou a moins de 3 points
function gameplay_rally_recce_drivelineRecording.load(missionDir) end

