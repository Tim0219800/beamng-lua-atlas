---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/milestones/generalMilestones/delivery.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Jalons liés aux livraisons de la carrière : colis (parcel), véhicules, remorques, fluides et vrac sec livrés ; livraisons à l'heure, retardées ou en retard (parcelMods « timed ») ; nombre d'installations desservies (deliverToMilestone) ou ayant reçu des livraisons (deliverFromMilestone). Les valeurs viennent de career_modules_delivery_progress et career_modules_delivery_parcelMods.
--- Accès : extension `career_modules_milestones_generalMilestones_delivery` : `extensions.load("career_modules_milestones_generalMilestones_delivery")`, puis la globale `career_modules_milestones_generalMilestones_delivery`
---@class career_modules_milestones_generalMilestones_delivery
career_modules_milestones_generalMilestones_delivery = {}

--- Hook appelé quand les statistiques de progression des installations de livraison changent : vérifie chaque jalon, notifie les paliers atteints et avance notificationStep.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/milestones/generalMilestones/delivery.lua:165
function career_modules_milestones_generalMilestones_delivery.onDeliveryFacilityProgressStatsChanged() end

--- Hook : construit les configurations de jalons de livraison et les ajoute à milestonesList.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/milestones/generalMilestones/delivery.lua:71
---@param milestonesList table[] Liste à compléter.
function career_modules_milestones_generalMilestones_delivery.onGeneralMilestonesCollect(milestonesList) end

--- Hook : fixe la cible de notification de chaque jalon de livraison.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/milestones/generalMilestones/delivery.lua:148
function career_modules_milestones_generalMilestones_delivery.onGeneralMilestonesSetupCallbacks() end

--- Stocke dans milestoneConfig._target la cible du prochain palier à notifier, sauf si tous sont notifiés.
---Source : lua/ge/extensions/career/modules/milestones/generalMilestones/delivery.lua:154
---@param milestoneConfig table Configuration du jalon.
function career_modules_milestones_generalMilestones_delivery.setNotificationTarget(milestoneConfig) end

