# `ui_router_constants`

*Fichier : `lua/ge/extensions/ui/router/constants.lua` · VM : Game Engine (GE) · 107 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_router_constants` : `extensions.load("ui_router_constants")`, puis la globale `ui_router_constants`

## Champs

| Champ | Type | Description |
|---|---|---|
| `FrameworkAction` | table | Framework action types (what should a framework do for a route) |
| `GuardResult` | table | Guard result types |
| `InfoBarDefaults` | table | UI element defaults |
| `InfoBarDefaultsHidden` | table |  |
| `NavigationAction` | table | Navigation action types |
| `RouteConfigDefaults` | table | Default route config (must be after the individual defaults above) |
| `RouterExtensionHooks` | table | Lua extension hook names dispatched via extensions.hook(...). These follow<br> the standard "on<Event>" extension-hook naming convention so listeners<br> export them as M.on<Event>. They are intentionally separate from<br> RouterHooks above, which still drive the GUI event names. |
| `RouterHooks` | table | Hook event names emitted by the router.<br> These names are used as the suffix for GUI events ("ui_router_<name>") and,<br> for hooks that share a Lua extension hook name, as the Lua extension hook<br> name dispatched via extensions.hook(...). Hooks whose Lua extension hook<br> name diverges from the GUI event name are listed in RouterExtensionHooks<br> below and should be used for extensions.hook(...) calls. |
| `TopBarDefaults` | table |  |
| `TopBarDefaultsHidden` | table |  |
| `TransitionStatus` | table | Transition states for the router state machine |
| `UiAppsDefaults` | table |  |
| `UiTypesFilter` | table | Filter for which UI frameworks must complete for route change to succeed |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/router/constants.lua`.*
