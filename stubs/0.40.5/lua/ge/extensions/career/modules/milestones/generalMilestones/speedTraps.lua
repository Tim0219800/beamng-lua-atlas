---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/milestones/generalMilestones/speedTraps.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Jalons liés aux radars (gameplay_speedTraps) en carrière : record de vitesse atteinte devant un radar (velocitySpeedTrapMilestone, paliers 70, 90, 120, 150, 180 et 220 km/h stockés en m/s) et nombre total de déclenchements de radar par le joueur (speedTrapTriggerCounterMilestone, 10 paliers de 15 déclenchements). Les jalons par radar individuel et « tous les radars » sont désactivés (code commenté).
--- Accès : extension `career_modules_milestones_generalMilestones_speedTraps` : `extensions.load("career_modules_milestones_generalMilestones_speedTraps")`, puis la globale `career_modules_milestones_generalMilestones_speedTraps`
---@class career_modules_milestones_generalMilestones_speedTraps
---@field onGeneralMilestoneClaimed any
career_modules_milestones_generalMilestones_speedTraps = {}

--- Hook : crée les deux jalons actifs (record de vitesse et compteur) avec leur sauvegarde (maxVelocityReachedByPlayer, triggerCount) et les ajoute à milestonesList.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/milestones/generalMilestones/speedTraps.lua:10
---@param milestonesList table[] Liste à compléter.
function career_modules_milestones_generalMilestones_speedTraps.onGeneralMilestonesCollect(milestonesList) end

--- Hook appelé quand un radar se déclenche : met à jour le record de vitesse du joueur, notifie tous les paliers de vitesse franchis, et incrémente le compteur de déclenchements.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/milestones/generalMilestones/speedTraps.lua:123
---@param speedTrapData table Données du radar (speedLimit, subjectID...).
---@param playerSpeed number Vitesse mesurée en m/s.
---@param overSpeed number Excès de vitesse (non utilisé ici).
function career_modules_milestones_generalMilestones_speedTraps.onSpeedTrapTriggered(speedTrapData, playerSpeed, overSpeed) end

