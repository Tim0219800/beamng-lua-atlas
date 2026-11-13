---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/router/routes/campaign.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Module de routes « campaign » abstrait (Vue, barres masquées). Ses enfants (components, ui-apps-test, comic) ont en réalité les screenId « debug.components », « debug.ui-apps-test » et « comic » (écran Angular) : on dirait un copier-coller du module debug.
--- Accès : extension `ui_router_routes_campaign` : `extensions.load("ui_router_routes_campaign")`, puis la globale `ui_router_routes_campaign`
---@class ui_router_routes_campaign
---@field Children table<string, table> components -> screenId debug.components ; ui-apps-test -> debug.ui-apps-test ; comic -> screenId comic, interface Angular uniquement.
---@field Root table {abstract = true, ui = Vue, infoBar et topBar masquées, uiApps par défaut}
ui_router_routes_campaign = {}

