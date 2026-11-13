# `ui_router_routeReference`

*Fichier : `lua/ge/extensions/ui/router/routeReference.lua` · VM : Game Engine (GE) · 140 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_router_routeReference` : `extensions.load("ui_router_routeReference")`, puis la globale `ui_router_routeReference`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_router_routeReference.mergeParams(inlineParams, explicitParams)` | Overlay explicit params on top of inline params. Explicit params win on<br> collision and log a warning. Inline values are copied as-is (strings). | 118 |
| `ui_router_routeReference.parse(reference)` | Split "route[?query][:scope]" into its parts.<br> Returns { route = string, scope = string\|nil, params = table }.<br> Non-string references pass through untouched with empty params. | 70 |
| `ui_router_routeReference.parseQuery(query)` | Parse the "a=1&b=2" segment into a params table. Values remain strings.<br> Repeated keys keep the last value and emit a warning. Bare keys ("flag")<br> resolve to an empty string value. | 38 |
| `ui_router_routeReference.urlDecode(value)` | Percent-decode a query component and turn '+' into a space, matching the<br> application/x-www-form-urlencoded convention used when the reference is built. | 24 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/router/routeReference.lua`.*
