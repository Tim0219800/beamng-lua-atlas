# `ui_router_constants`

*Fichier : `lua/ge/extensions/ui/router/constants.lua` · VM : Game Engine (GE) · 107 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_router_constants` : `extensions.load("ui_router_constants")`, puis la globale `ui_router_constants`

Tables de constantes partagées du routeur d'interface : états de transition, types d'action de navigation, résultats de garde, actions de framework, filtre de types d'UI, valeurs par défaut de la barre d'infos / barre du haut / apps UI, configuration de route par défaut, et noms des hooks émis (évènements GUI « ui_router_<nom> » et hooks d'extension « on<Evenement> »). Module de données pur.

## Remarques

- RouterHooks donne les suffixes des évènements GUI (ui_router_routeChange, ui_router_afterRouteChange, ui_router_routeChangeCancelled…). RouterExtensionHooks donne les noms des hooks Lua appelés par extensions.hook : onAfterRouteChange et onRouteTiming (durée d'une navigation, voir router.lua).
- UiTypesFilter décrit quels frameworks doivent terminer pour qu'un changement de route réussisse : only (uniquement les types listés), except (tous sauf ceux listés), all (tous les types enregistrés), any (au moins un des types listés). Le routeur considère une route « à handoff » si le filtre est only et que uiTypes contient "vue".
- RouteConfigDefaults.ui = {uiTypes = {"angular", "vue"}, uiTypesFilter = any, infoBar, uiApps, topBar}.
- Plusieurs valeurs (par exemple GuardResult, FrameworkAction, NavigationAction, ou les hooks ROUTE_CHANGE_SUCCESS et TRANSITION_TIMEOUT) ne sont pas utilisées dans router.lua ; elles servent de vocabulaire partagé avec les autres modules.

## Champs

| Champ | Type | Description |
|---|---|---|
| `FrameworkAction` | table<string, string> | Ce qu'un framework doit faire pour une route : RENDER, BLANK, HIDE, PASSTHROUGH. |
| `GuardResult` | table<string, string> | Types de résultat de garde : ALLOW="allow", REJECT="reject", REDIRECT="redirect". |
| `InfoBarDefaults` | table | Barre d'infos visible : {visible=true, showSysInfo=true}. |
| `InfoBarDefaultsHidden` | table | Barre d'infos masquée : {visible=false, showSysInfo=false}. |
| `NavigationAction` | table<string, string> | Types d'action de navigation : PUSH, REPLACE, BACK, FORWARD. |
| `RouteConfigDefaults` | table | Configuration de route par défaut : {ui = {uiTypes, uiTypesFilter, infoBar, uiApps, topBar}}. |
| `RouterExtensionHooks` | table<string, string> | Hooks d'extension Lua : AFTER_ROUTE_CHANGE="onAfterRouteChange", ROUTE_TIMING="onRouteTiming". |
| `RouterHooks` | table<string, string> | Noms de hooks : beforeRouteChange, routeChange, routeChangeSuccess, afterRouteChange, routeChangeError, routeChangeCancelled, transitionTimeout, navigationStateResponse. |
| `TopBarDefaults` | table | Barre du haut visible : {visible=true}. |
| `TopBarDefaultsHidden` | table | Barre du haut masquée : {visible=false}. |
| `TransitionStatus` | table<string, string> | États de la machine à états du routeur : IDLE="idle", TRANSITIONING="transitioning", CANCELLED="cancelled". |
| `UiAppsDefaults` | table | Apps UI masquées par défaut : {shown=false}. |
| `UiTypesFilter` | table<string, string> | Filtre des frameworks devant terminer : only, except, all, any. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/router/constants.lua`.*
