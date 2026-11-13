---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/milestones/generalMilestones/statistic.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Jalons basés sur les statistiques de gameplay (gameplay_statistic) : distance parcourue (vehicle/total_odometer.length, en m, 8 paliers de 10 à 300 km), temps de jeu en carrière (general/mode/career.time, en s, paliers de 5 h), tonneaux (vehicle/rollover) et temps en l'air (vehicle/airtime.time, en s). Récompense majorLinear. La notification repose sur des callbacks de statistique enregistrés pour le prochain palier.
--- Accès : extension `career_modules_milestones_generalMilestones_statistic` : `extensions.load("career_modules_milestones_generalMilestones_statistic")`, puis la globale `career_modules_milestones_generalMilestones_statistic`
---@class career_modules_milestones_generalMilestones_statistic
career_modules_milestones_generalMilestones_statistic = {}

--- Retire le callback de statistique du jalon s'il existe.
---Source : lua/ge/extensions/career/modules/milestones/generalMilestones/statistic.lua:88
---@param milestone table Configuration du jalon.
function career_modules_milestones_generalMilestones_statistic.clearStatisticCallback(milestone) end

--- Hook appelé après la réclamation d'un jalon : alias de registerStastisticCallback pour ré-enregistrer la surveillance.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/milestones/generalMilestones/statistic.lua:95
---@param milestone table Configuration du jalon réclamé.
function career_modules_milestones_generalMilestones_statistic.onGeneralMilestoneClaimed(milestone) end

--- Hook : construit les quatre jalons statistiques (stat_distance, stat_playtime, stat_rollover, jump) et les ajoute à milestonesList.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/milestones/generalMilestones/statistic.lua:8
---@param milestonesList table[] Liste à compléter.
function career_modules_milestones_generalMilestones_statistic.onGeneralMilestonesCollect(milestonesList) end

--- Hook : enregistre le callback de statistique de chaque jalon.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/milestones/generalMilestones/statistic.lua:81
---@param milestone any Non utilisé.
function career_modules_milestones_generalMilestones_statistic.onGeneralMilestonesSetupCallbacks(milestone) end

--- Enregistre un callback déclenché quand la statistique surveillée atteint la cible du prochain palier ; le callback notifie le jalon et mémorise notificationStep.
---Source : lua/ge/extensions/career/modules/milestones/generalMilestones/statistic.lua:95
---@param milestone table Configuration du jalon (watchStatisticKey, getTarget...).
function career_modules_milestones_generalMilestones_statistic.registerStastisticCallback(milestone) end

