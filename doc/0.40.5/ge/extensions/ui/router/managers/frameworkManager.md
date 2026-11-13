# `ui_router_managers_frameworkManager`

*Fichier : `lua/ge/extensions/ui/router/managers/frameworkManager.lua` · VM : Game Engine (GE) · 73 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_router_managers_frameworkManager` : `extensions.load("ui_router_managers_frameworkManager")`, puis la globale `ui_router_managers_frameworkManager`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_router_managers_frameworkManager.sendRouteChange(data, transitionId)` | Emit a route-change event to the UI frameworks.<br><br>  @param data - Route-change payload (a NavigationEntry). Treated as immutable.<br>  @param transitionId - Optional active transition id to attach to the payload.<br><br>  When a transition id is supplied, a shallow copy of the payload is emitted with<br>  transitionId added, so the immutable NavigationEntry table is never mutated.<br>  Existing top-level fields (request, resolved, origin, toRoute, fromRoute, routeNode)<br>  are preserved so current UI handlers keep reading data.resolved / data.request. | 31 |
| `ui_router_managers_frameworkManager.sendRouteChangeCancelled(data, extras)` | Emit a route-change-cancelled event to the UI frameworks.<br><br>  @param data - The cancelled route (toRoute), treated as immutable.<br>  @param extras - Optional identity payload, e.g. { transitionId = <cancelledId>, reason = <reason> }.<br><br>  When identity extras are supplied a shallow copy of the route is emitted with the<br>  cancelled transition id (and reason) attached, so the UI can clear only the handoff<br>  that matches the cancelled transition instead of blindly dropping the active one. | 57 |
| `ui_router_managers_frameworkManager.sendRouteChangeComplete(data)` |  | 43 |

**Évènements UI (guihooks.trigger) :** `ui_router_`, `ui_router_routeChange`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/router/managers/frameworkManager.lua`.*
