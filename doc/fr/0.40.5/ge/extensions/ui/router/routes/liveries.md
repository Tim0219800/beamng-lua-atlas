# `ui_router_routes_liveries`

*Fichier : `lua/ge/extensions/ui/router/routes/liveries.lua` · VM : Game Engine (GE) · 53 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_router_routes_liveries` : `extensions.load("ui_router_routes_liveries")`, puis la globale `ui_router_routes_liveries`

Routes de l'éditeur de livrées (Vue) : liste (liveries), édition (liveries.edit), peinture (liveries.edit.paint) et décalcomanies (inclut le module decals). Hooks : ui_liveries_routeLifecycleCallbacks.onLiveriesEnter / onLiveriesEditEnter / onLiveriesPaintEnter / onLiveriesLeave / onLiveriesRootLeave.

## Remarques

- Module de configuration de routes : il n'exporte aucune fonction. routeManager le lit (via l'extension ui_router_routes_<nom>) quand routes.lua l'inclut par `{ include = "<nom>" }`.
- Les clés de `Children` forment les segments du nom pointé : « <module>.<enfant> ». `children` (minuscule) dans un nœud désigne ses sous-routes ; `include` y monte un autre module.
- `ui` est hérité par les routes enfants (uiTypes, uiTypesFilter, infoBar, topBar, uiApps, uiNav, triggerPause) : un enfant ne le redéfinit que pour ce qui change.

## Champs

| Champ | Type | Description |
|---|---|---|
| `Children` | table<string, table> | edit (backTarget liveries ; enfants paint et decals = include du module decals). |
| `ModuleName` | string | Nom du module de routes (premier segment du nom pointé). |
| `Root` | table | {screenId = "liveries", title = "ui.liveries.title", Vue uniquement, infoBar par défaut, topBar masquée, onEnter onLiveriesEnter, onLeave onLiveriesRootLeave} |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/router/routes/liveries.lua`.*
