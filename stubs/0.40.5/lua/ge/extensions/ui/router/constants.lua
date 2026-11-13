---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/router/constants.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Tables de constantes partagées du routeur d'interface : états de transition, types d'action de navigation, résultats de garde, actions de framework, filtre de types d'UI, valeurs par défaut de la barre d'infos / barre du haut / apps UI, configuration de route par défaut, et noms des hooks émis (évènements GUI « ui_router_<nom> » et hooks d'extension « on<Evenement> »). Module de données pur.
--- Accès : extension `ui_router_constants` : `extensions.load("ui_router_constants")`, puis la globale `ui_router_constants`
---@class ui_router_constants
---@field FrameworkAction table<string, string> Ce qu'un framework doit faire pour une route : RENDER, BLANK, HIDE, PASSTHROUGH.
---@field GuardResult table<string, string> Types de résultat de garde : ALLOW="allow", REJECT="reject", REDIRECT="redirect".
---@field InfoBarDefaults table Barre d'infos visible : {visible=true, showSysInfo=true}.
---@field InfoBarDefaultsHidden table Barre d'infos masquée : {visible=false, showSysInfo=false}.
---@field NavigationAction table<string, string> Types d'action de navigation : PUSH, REPLACE, BACK, FORWARD.
---@field RouteConfigDefaults table Configuration de route par défaut : {ui = {uiTypes, uiTypesFilter, infoBar, uiApps, topBar}}.
---@field RouterExtensionHooks table<string, string> Hooks d'extension Lua : AFTER_ROUTE_CHANGE="onAfterRouteChange", ROUTE_TIMING="onRouteTiming".
---@field RouterHooks table<string, string> Noms de hooks : beforeRouteChange, routeChange, routeChangeSuccess, afterRouteChange, routeChangeError, routeChangeCancelled, transitionTimeout, navigationStateResponse.
---@field TopBarDefaults table Barre du haut visible : {visible=true}.
---@field TopBarDefaultsHidden table Barre du haut masquée : {visible=false}.
---@field TransitionStatus table<string, string> États de la machine à états du routeur : IDLE="idle", TRANSITIONING="transitioning", CANCELLED="cancelled".
---@field UiAppsDefaults table Apps UI masquées par défaut : {shown=false}.
---@field UiTypesFilter table<string, string> Filtre des frameworks devant terminer : only, except, all, any.
ui_router_constants = {}

