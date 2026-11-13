# `ui_router_services_routeResolver`

*Fichier : `lua/ge/extensions/ui/router/services/routeResolver.lua` · VM : Game Engine (GE) · 70 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_router_services_routeResolver` : `extensions.load("ui_router_services_routeResolver")`, puis la globale `ui_router_services_routeResolver`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_router_services_routeResolver.isEqualRoutes(routeA, routeB)` | Check if two routes are the same (by name and params).<br><br>  @param routeA - First route<br>  @param routeB - Second route<br>  @return boolean | 42 |
| `ui_router_services_routeResolver.resolve(routeName, params, currentRoute)` | Resolve a route name to a resolved route table.<br> @deprecated Use ResolvedRoute.createEntry() for full NavigationEntries. | 15 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/router/services/routeResolver.lua`.*
