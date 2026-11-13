---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/router/routes/legal.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Routes juridiques (Vue, abstrait) : assistant de consentement en ligne en trois étapes onlineFeatures -> telemetry -> confirmation, chaque étape ayant le garde de sortie `onlineConsentSet` et conservant la barre d'aide manette.
--- Accès : extension `ui_router_routes_legal` : `extensions.load("ui_router_routes_legal")`, puis la globale `ui_router_routes_legal`
---@class ui_router_routes_legal
---@field Children table<string, table> onlineFeatures (sans backTarget), telemetry (retour onlineFeatures), confirmation (retour telemetry) ; infoBar par défaut restaurée pour la manette.
---@field ModuleName string Nom du module de routes (premier segment du nom pointé).
---@field Root table {abstract = true, ui = Vue uniquement, infoBar et topBar masquées, uiApps par défaut}
ui_router_routes_legal = {}

