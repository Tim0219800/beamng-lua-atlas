---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/router/guards/multiseat.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Garde de sortie « confirmMultiseatSettingsExit » : lorsqu'on quitte l'écran des réglages multi-sièges, délègue la confirmation à ui_multiseat_multiseatSettings.confirmExit(route, params, context). Les déplacements entre pause.multiseatSettings et pause.multiseatSettings.vehicleSelector restent dans le flux et sont autorisés ; si ui_multiseat_multiseatSettings n'est pas chargé, la sortie est autorisée.
--- Accès : extension `ui_router_guards_multiseat` : `extensions.load("ui_router_guards_multiseat")`, puis la globale `ui_router_guards_multiseat`
---@class ui_router_guards_multiseat
---@field guards table<string, function> Table des gardes exposées : {confirmMultiseatSettingsExit = function(route, params, context)}.
ui_router_guards_multiseat = {}

