---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/router/guards/legal.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Garde d'entrée « onlineConsentSet » : n'autorise la navigation vers une route que si le consentement en ligne a été donné, c'est-à-dire si les réglages onlineFeatures et telemetry ne valent plus "ask". Les routes du module « legal » (premier segment du nom de route) sont toujours autorisées pour que l'assistant de consentement puisse se terminer. Les gardes sont enregistrées par GuardManager à partir de M.guards.
--- Accès : extension `ui_router_guards_legal` : `extensions.load("ui_router_guards_legal")`, puis la globale `ui_router_guards_legal`
---@class ui_router_guards_legal
---@field guards table<string, function> Table des gardes exposées : {onlineConsentSet = function(route) -> boolean}.
ui_router_guards_legal = {}

