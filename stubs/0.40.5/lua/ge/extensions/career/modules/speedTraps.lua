---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/speedTraps.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Réaction de la carrière aux radars (gameplay_speedTraps) : amendes pour excès de vitesse et feu rouge, messages UI, son du flash, et enregistrement dans les classements de radars (gameplay_speedTrapLeaderboards) sauvegardés dans <save>/career/speedTrapLeaderboards/. Seul le véhicule du joueur (index 0) est concerné.
--- Accès : extension `career_modules_speedTraps` : `extensions.load("career_modules_speedTraps")`, puis la globale `career_modules_speedTraps`
---@class career_modules_speedTraps
---@field dependencies table<integer, string> Extensions chargées avant : career_career, gameplay_speedTraps.
career_modules_speedTraps = {}

--- Hook : charge les classements de radars du profil si la carrière est active (renvoie false sinon).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/speedTraps.lua:122
function career_modules_speedTraps.onExtensionLoaded() end

--- Hook appelé quand une caméra de feu rouge se déclenche : amende de 500 avec message et son si le véhicule du joueur est identifiable par une plaque.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/speedTraps.lua:97
---@param speedTrapData table Données de la caméra (subjectID).
---@param playerSpeed number Vitesse enregistrée (non utilisée ici).
function career_modules_speedTraps.onRedLightCamTriggered(speedTrapData, playerSpeed) end

--- Hook de sauvegarde : écrit les classements de radars dans career/speedTrapLeaderboards/.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/speedTraps.lua:129
---@param currentSavePath string Dossier de sauvegarde.
function career_modules_speedTraps.onSaveCurrentProfile(currentSavePath) end

--- Hook appelé quand un radar de vitesse se déclenche : applique l'amende ou la pénalité selon la plaque et le type de véhicule, puis met à jour le classement du radar.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/speedTraps.lua:35
---@param speedTrapData table Données du radar (speedLimit, subjectID...).
---@param playerSpeed number Vitesse enregistrée en m/s.
---@param overSpeed number Dépassement de la limite en m/s.
function career_modules_speedTraps.onSpeedTrapTriggered(speedTrapData, playerSpeed, overSpeed) end

