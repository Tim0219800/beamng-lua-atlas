---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/milestones/generalMilestones/money.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Jalons d'argent de la carrière. Chaque jalon cumule, pour un mode (gains ou losses) et des tags, les montants suivis par career_modules_playerAttributes.getAttribute("money")[mode][tag] (valeur absolue). Sept jalons : gains (tag reward), dépenses (buying), pièces achetées (partsBought), véhicules achetés (vehicleBought), ventes (selling), livraisons (delivery), amendes (fine). Deux succès Steam sont liés aux gains : FIRST_PAYCHECK (10 000) et SIX_FIGURES (100 000).
--- Accès : extension `career_modules_milestones_generalMilestones_money` : `extensions.load("career_modules_milestones_generalMilestones_money")`, puis la globale `career_modules_milestones_generalMilestones_money`
---@class career_modules_milestones_generalMilestones_money
career_modules_milestones_generalMilestones_money = {}

--- Hook : crée un jalon par configuration de mode et l'ajoute à milestonesList (sauvegarde créée si absente).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/milestones/generalMilestones/money.lua:75
---@param milestonesList table[] Liste à compléter.
function career_modules_milestones_generalMilestones_money.onGeneralMilestonesCollect(milestonesList) end

--- Hook : fixe la cible de notification de chaque jalon d'argent.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/milestones/generalMilestones/money.lua:111
function career_modules_milestones_generalMilestones_money.onGeneralMilestonesSetupCallbacks() end

--- Hook : si l'attribut money a changé, vérifie chaque jalon, débloque les succès éventuels, notifie le palier atteint et avance notificationStep.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/milestones/generalMilestones/money.lua:129
---@param change table<string, number> Variation par attribut.
function career_modules_milestones_generalMilestones_money.onPlayerAttributesChanged(change) end

--- Stocke dans milestoneConfig._target la cible du prochain palier à notifier (rien si tous notifiés).
---Source : lua/ge/extensions/career/modules/milestones/generalMilestones/money.lua:119
---@param milestoneConfig table Configuration du jalon.
function career_modules_milestones_generalMilestones_money.setNotificationTarget(milestoneConfig) end

