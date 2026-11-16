---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/router/routes/career.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Career mode routes (Vue): career computer (career.computer and its screens: vehicle inventory, part shopping, repair, tuning, painting, part inventory, insurance, performance, vehicle marketplace with purchase and negotiation), refueling, cargo depot and overview, my cargo, progression and branches, organizations, save profiles (new, saves, save as). Mostly defines gamepad navigation scopeTrees and back handlers (`back.handler`) and onEnter/onMount/onLeave hooks to career_modules_*.
--- Access: extension `ui_router_routes_career`: `extensions.load("ui_router_routes_career")`, then the global `ui_router_routes_career`
---@class ui_router_routes_career
---@field Children table<string, table> pauseBigMiddlePanel, logbook, refueling (back to play), computer (rootExit back; children vehicleInventory, partShopping > category > slot, repair, tuning, painting, partInventory, insurances > chooseInsurance, playerAbstract, vehiclePerformance > certificationTest, vehicleShopping > vehicles > vehiclePurchase > (negotiation, chooseInsurance), negotiation), cargoDropOff, cargoOverview (> organizations), myCargo, progressLanding, domainSelection, organizations, branchPage, profiles (> new, saves, saveAs).
---@field ModuleName string Name of the routes module (first segment of the dotted name).
---@field Root table {abstract = true, title = "ui.playmodes.career", ui = Vue only, default infoBar, hidden topBar, default uiApps}
ui_router_routes_career = {}

