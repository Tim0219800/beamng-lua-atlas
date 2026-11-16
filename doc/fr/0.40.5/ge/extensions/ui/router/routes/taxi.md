# `ui_router_routes_taxi`

*Fichier : `lua/ge/extensions/ui/router/routes/taxi.lua` · VM : Game Engine (GE) · 24 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_router_routes_taxi` : `extensions.load("ui_router_routes_taxi")`, puis la globale `ui_router_routes_taxi`

Route du mode taxi (Vue) : écran « taxi », hook onEnter gameplay_taxi.onTaxiViewEnter, barres et uiApps masquées. Aucun enfant.

## Remarques

- Module de configuration de routes : il n'exporte aucune fonction. routeManager le lit (via l'extension ui_router_routes_<nom>) quand routes.lua l'inclut par `{ include = "<nom>" }`.
- Les clés de `Children` forment les segments du nom pointé : « <module>.<enfant> ». `children` (minuscule) dans un nœud désigne ses sous-routes ; `include` y monte un autre module.
- `ui` est hérité par les routes enfants (uiTypes, uiTypesFilter, infoBar, topBar, uiApps, uiNav, triggerPause) : un enfant ne le redéfinit que pour ce qui change.

## Champs

| Champ | Type | Description |
|---|---|---|
| `Children` | table<string, table> | Table vide. |
| `ModuleName` | string | Nom du module de routes (premier segment du nom pointé). |
| `Root` | table | {screenId = "taxi", onEnter = "gameplay_taxi.onTaxiViewEnter", Vue uniquement, infoBar/topBar/uiApps masquées} |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/router/routes/taxi.lua`.*
