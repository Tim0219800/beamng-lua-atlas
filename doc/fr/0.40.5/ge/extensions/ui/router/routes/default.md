# `ui_router_routes_default`

*Fichier : `lua/ge/extensions/ui/router/routes/default.lua` · VM : Game Engine (GE) · 57 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_router_routes_default` : `extensions.load("ui_router_routes_default")`, puis la globale `ui_router_routes_default`

Module de routes par défaut, abstrait, qui définit la configuration `ui` d'écrans de base : mapview (Angular), options (Vue, infoBar par défaut), play (Angular, uiApps visibles) et radial (Vue).

## Remarques

- Module de configuration de routes : il n'exporte aucune fonction. routeManager le lit (via l'extension ui_router_routes_<nom>) quand routes.lua l'inclut par `{ include = "<nom>" }`.
- Les clés de `Children` forment les segments du nom pointé : « <module>.<enfant> ». `children` (minuscule) dans un nœud désigne ses sous-routes ; `include` y monte un autre module.
- `ui` est hérité par les routes enfants (uiTypes, uiTypesFilter, infoBar, topBar, uiApps, uiNav, triggerPause) : un enfant ne le redéfinit que pour ce qui change.

## Champs

| Champ | Type | Description |
|---|---|---|
| `Children` | table<string, table> | mapview, options, play, radial : chacun ne définit que son bloc `ui` (uiTypes, uiTypesFilter = only, infoBar, topBar, uiApps). |
| `ModuleName` | string | Nom du module de routes (premier segment du nom pointé). |
| `Root` | table | {abstract = true} |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/router/routes/default.lua`.*
