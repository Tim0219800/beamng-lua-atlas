# `ui_router_constants`

*File: `lua/ge/extensions/ui/router/constants.lua` · VM: Game Engine (GE) · 107 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_router_constants`: `extensions.load("ui_router_constants")`, then the global `ui_router_constants`

Shared constant tables of the UI router: transition states, navigation action types, guard results, framework actions, UI types filter, default values of the info bar / top bar / UI apps, default route configuration, and names of the emitted hooks (GUI events "ui_router_<name>" and extension hooks "on<Event>"). Pure data module.

## Notes

- RouterHooks gives the suffixes of the GUI events (ui_router_routeChange, ui_router_afterRouteChange, ui_router_routeChangeCancelled...). RouterExtensionHooks gives the names of the Lua hooks called by extensions.hook: onAfterRouteChange and onRouteTiming (duration of a navigation, see router.lua).
- UiTypesFilter describes which frameworks must finish for a route change to succeed: only (only the listed types), except (all except those listed), all (all registered types), any (at least one of the listed types). The router considers a route "handoff" if the filter is only and uiTypes contains "vue".
- RouteConfigDefaults.ui = {uiTypes = {"angular", "vue"}, uiTypesFilter = any, infoBar, uiApps, topBar}.
- Several values (for example GuardResult, FrameworkAction, NavigationAction, or the hooks ROUTE_CHANGE_SUCCESS and TRANSITION_TIMEOUT) are not used in router.lua; they serve as a shared vocabulary with the other modules.

## Fields

| Field | Type | Description |
|---|---|---|
| `FrameworkAction` | table<string, string> | What a framework must do for a route: RENDER, BLANK, HIDE, PASSTHROUGH. |
| `GuardResult` | table<string, string> | Guard result types: ALLOW="allow", REJECT="reject", REDIRECT="redirect". |
| `InfoBarDefaults` | table | Visible info bar: {visible=true, showSysInfo=true}. |
| `InfoBarDefaultsHidden` | table | Hidden info bar: {visible=false, showSysInfo=false}. |
| `NavigationAction` | table<string, string> | Navigation action types: PUSH, REPLACE, BACK, FORWARD. |
| `RouteConfigDefaults` | table | Default route configuration: {ui = {uiTypes, uiTypesFilter, infoBar, uiApps, topBar}}. |
| `RouterExtensionHooks` | table<string, string> | Lua extension hooks: AFTER_ROUTE_CHANGE="onAfterRouteChange", ROUTE_TIMING="onRouteTiming". |
| `RouterHooks` | table<string, string> | Hook names: beforeRouteChange, routeChange, routeChangeSuccess, afterRouteChange, routeChangeError, routeChangeCancelled, transitionTimeout, navigationStateResponse. |
| `TopBarDefaults` | table | Visible top bar: {visible=true}. |
| `TopBarDefaultsHidden` | table | Hidden top bar: {visible=false}. |
| `TransitionStatus` | table<string, string> | States of the router's state machine: IDLE="idle", TRANSITIONING="transitioning", CANCELLED="cancelled". |
| `UiAppsDefaults` | table | UI apps hidden by default: {shown=false}. |
| `UiTypesFilter` | table<string, string> | Filter of the frameworks that must finish: only, except, all, any. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/router/constants.lua`.*
