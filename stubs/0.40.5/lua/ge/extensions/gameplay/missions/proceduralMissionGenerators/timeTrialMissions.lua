---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/missions/proceduralMissionGenerators/timeTrialMissions.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Générateur procédural de missions « generatedTimeTrial » à partir des courses rapides (quickraces) de chaque niveau. Il charge scenario_quickRaceLoader, parcourt les pistes, convertit celles qui n'ont pas de fichier .race.json (via gameplay/race/path:fromTrack) en fichier de cache dans gameplay/temp/timeTrials/, puis crée une mission avec le fichier de course, les préfabs (normaux, aller, retour), l'aperçu et le déclencheur placé sur la position de départ par défaut.
--- Accès : extension `gameplay_missions_proceduralMissionGenerators_timeTrialMissions` : `extensions.load("gameplay_missions_proceduralMissionGenerators_timeTrialMissions")`, puis la globale `gameplay_missions_proceduralMissionGenerators_timeTrialMissions`
---@class gameplay_missions_proceduralMissionGenerators_timeTrialMissions
gameplay_missions_proceduralMissionGenerators_timeTrialMissions = {}

--- Génère les missions « generatedTimeTrial » pour un ou plusieurs niveaux (tous si nil) à partir de scenario_quickRaceLoader.getQuickraceList. Écrit des fichiers de cache pour les pistes à convertir et journalise le nombre de missions masquées.
---Source : lua/ge/extensions/gameplay/missions/proceduralMissionGenerators/timeTrialMissions.lua:74
---@param levelIdentifier string|table|nil Nom de niveau ou liste de noms ; nil = tous les niveaux.
---@return table  Liste de définitions de missions.
function gameplay_missions_proceduralMissionGenerators_timeTrialMissions.generate(levelIdentifier) end

