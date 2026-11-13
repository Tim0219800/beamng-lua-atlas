# `ui_router_config`

*Fichier : `lua/ge/extensions/ui/router/config.lua` · VM : Game Engine (GE) · 46 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_router_config` : `extensions.load("ui_router_config")`, puis la globale `ui_router_config`

## Champs

| Champ | Type | Description |
|---|---|---|
| `ContextDecoratorDefaultSource` | string |  |
| `MainRoute` | string | Default route when no route is specified |
| `PhaseTimeouts` | table | Phased transition timeouts (in seconds) for the Vue acknowledgement flow.<br> Each phase waits for a specific progress ack before advancing:<br>   startup     -> waiting for Vue Router to enter its pipeline (routeNavigationStarted)<br>   routeCommit -> Vue Router started, waiting for routeChangeComplete<br>   mountReady  -> route committed, waiting for routeMounted (when a mount ack is required)<br> The startup phase resends the pending route-change event on a fixed interval and never<br> times out on its own: runtime/mod Vue routes may register late, so the request stays<br> retryable until the UI reports the navigation started. routeChangeReceived is kept as<br> telemetry only and does not stop the resends. Once the start milestone is observed the<br> completion timers reset so the startup wait is excluded from the post-start budgets. |
| `RouteUiDefaults` | table | Router-owned UI defaults merged into the base route config during resolution.<br> Values here are supplied only when a route (or its parents) does not set them,<br> so explicit route-level overrides always win. |
| `ShowContextDecoratorInBreadcrumbs` | boolean |  |
| `Timeout` | number | Timeout settings (in seconds) |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/router/config.lua`.*
