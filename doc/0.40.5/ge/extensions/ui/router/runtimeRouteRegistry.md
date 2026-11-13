# `ui_router_runtimeRouteRegistry`

*Fichier : `lua/ge/extensions/ui/router/runtimeRouteRegistry.lua` · VM : Game Engine (GE) · 434 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_router_runtimeRouteRegistry` : `extensions.load("ui_router_runtimeRouteRegistry")`, puis la globale `ui_router_runtimeRouteRegistry`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_router_runtimeRouteRegistry.isValidHookRef(ref)` | Lifecycle hooks must stay declarative "module.func" string references. | 44 |
| `ui_router_runtimeRouteRegistry.new()` | Create an isolated registry instance. The route manager holds one; tests can<br> spin up as many independent instances as they need. | 389 |
| `ui_router_runtimeRouteRegistry.parseRawRoutes(rawRoutes)` | Parse a raw Vue route array into an ordered list of route names and a<br> name -> route-config-overlay map. Recurses into `children` for both named and<br> unnamed nodes. Any error rejects the whole parse (transactional). | 155 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/router/runtimeRouteRegistry.lua`.*
