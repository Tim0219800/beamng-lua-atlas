---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/router/routes/career.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Routes du mode carrière (Vue) : ordinateur de carrière (career.computer et ses écrans : inventaire des véhicules, achat de pièces, réparation, réglage, peinture, inventaire de pièces, assurances, performance, marché de véhicules avec achat et négociation), ravitaillement, dépôt et aperçu de cargaison, mes cargaisons, progression et branches, organisations, profils de sauvegarde (nouveau, sauvegardes, enregistrer sous). Définit surtout des scopeTree de navigation manette et des gestionnaires de retour (`back.handler`) et des hooks onEnter/onMount/onLeave vers career_modules_*.
--- Accès : extension `ui_router_routes_career` : `extensions.load("ui_router_routes_career")`, puis la globale `ui_router_routes_career`
---@class ui_router_routes_career
---@field Children table<string, table> pauseBigMiddlePanel, logbook, refueling (retour vers play), computer (retour rootExit ; enfants vehicleInventory, partShopping > category > slot, repair, tuning, painting, partInventory, insurances > chooseInsurance, playerAbstract, vehiclePerformance > certificationTest, vehicleShopping > vehicles > vehiclePurchase > (negotiation, chooseInsurance), negotiation), cargoDropOff, cargoOverview (> organizations), myCargo, progressLanding, domainSelection, organizations, branchPage, profiles (> new, saves, saveAs).
---@field ModuleName string Nom du module de routes (premier segment du nom pointé).
---@field Root table {abstract = true, title = "ui.playmodes.career", ui = Vue uniquement, infoBar par défaut, topBar masquée, uiApps par défaut}
ui_router_routes_career = {}

