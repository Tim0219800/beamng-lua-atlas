---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/milestones/generalMilestones/branches.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Jalons de niveaux de branches et de compétences de la carrière. Pour chaque branche non « isInDevelopment » de career_branches.getSortedBranches(), crée un jalon branch_<id> dont les paliers sont les niveaux (requiredValue). Les branches donnent une récompense majorLinear et apparaissent aussi dans le filtre general ; les compétences (isSkill) une récompense minorLinear. Notifie le joueur quand le seuil du niveau suivant est atteint.
--- Accès : extension `career_modules_milestones_generalMilestones_branches` : `extensions.load("career_modules_milestones_generalMilestones_branches")`, puis la globale `career_modules_milestones_generalMilestones_branches`
---@class career_modules_milestones_generalMilestones_branches
---@field dependencies table<integer, string> Extensions chargées avant : career_branches.
career_modules_milestones_generalMilestones_branches = {}

--- Hook : ajoute à milestonesList un jalon par branche/compétence et crée sa sauvegarde si absente.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/milestones/generalMilestones/branches.lua:16
---@param milestonesList table[] Liste à compléter.
function career_modules_milestones_generalMilestones_branches.onGeneralMilestonesCollect(milestonesList) end

--- Hook : fixe la prochaine cible de notification de chaque jalon de branche.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/milestones/generalMilestones/branches.lua:57
function career_modules_milestones_generalMilestones_branches.onGeneralMilestonesSetupCallbacks() end

--- Hook : quand un attribut de branche augmente et dépasse la cible, déclenche onBranchTierReached, affiche le toast de jalon, avance notificationStep et recalcule la cible.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/milestones/generalMilestones/branches.lua:76
---@param change table<string, number> Variation par attribut.
function career_modules_milestones_generalMilestones_branches.onPlayerAttributesChanged(change) end

--- Calcule la cible du palier suivant à notifier (notificationStep + 1) et la stocke dans milestoneConfig._target ; ne fait rien si tous les paliers sont notifiés.
---Source : lua/ge/extensions/career/modules/milestones/generalMilestones/branches.lua:65
---@param attKey string Clé d'attribut de la branche.
function career_modules_milestones_generalMilestones_branches.setNotificationTarget(attKey) end

