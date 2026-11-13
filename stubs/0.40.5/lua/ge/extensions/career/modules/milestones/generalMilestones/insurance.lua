---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/milestones/generalMilestones/insurance.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Jalon sur le nombre de réclamations d'assurance pour réparation (id insurance_repair_claims). Paliers : 1, 5, 10, 20, 50 réclamations (career_modules_insurance_history.getInsuranceClaimsCount), récompense minorLinear.
--- Accès : extension `career_modules_milestones_generalMilestones_insurance` : `extensions.load("career_modules_milestones_generalMilestones_insurance")`, puis la globale `career_modules_milestones_generalMilestones_insurance`
---@class career_modules_milestones_generalMilestones_insurance
career_modules_milestones_generalMilestones_insurance = {}

--- Hook : crée la configuration du jalon, la sauvegarde si absente et l'ajoute à milestonesList.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/milestones/generalMilestones/insurance.lua:10
---@param milestonesList table[] Liste à compléter.
function career_modules_milestones_generalMilestones_insurance.onGeneralMilestonesCollect(milestonesList) end

--- Hook appelé à chaque réclamation d'assurance pour réparation : si le compteur atteint la cible du palier suivant, notifie le jalon et avance notificationStep.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/milestones/generalMilestones/insurance.lua:32
function career_modules_milestones_generalMilestones_insurance.onInsuranceRepairClaim() end

