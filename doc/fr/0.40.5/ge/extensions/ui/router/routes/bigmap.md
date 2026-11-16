# `ui_router_routes_bigmap`

*Fichier : `lua/ge/extensions/ui/router/routes/bigmap.lua` · VM : Game Engine (GE) · 43 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_router_routes_bigmap` : `extensions.load("ui_router_routes_bigmap")`, puis la globale `ui_router_routes_bigmap`

Routes de la grande carte (Vue) : écran « bigmap » (titre Map) avec une sous-route bigmapMenu. Arbre de portées (scopes) de navigation manette : bigmap-layout contient bigmap-camera et bigmap-main, qui contient bigmap-details. Inclus par d'autres modules (ex. pause.bigmap).

## Remarques

- Module de configuration de routes : il n'exporte aucune fonction. routeManager le lit (via l'extension ui_router_routes_<nom>) quand routes.lua l'inclut par `{ include = "<nom>" }`.
- Les clés de `Children` forment les segments du nom pointé : « <module>.<enfant> ». `children` (minuscule) dans un nœud désigne ses sous-routes ; `include` y monte un autre module.
- `ui` est hérité par les routes enfants (uiTypes, uiTypesFilter, infoBar, topBar, uiApps, uiNav, triggerPause) : un enfant ne le redéfinit que pour ce qui change.

## Champs

| Champ | Type | Description |
|---|---|---|
| `Children` | table<string, table> | Enfant « bigmapMenu » (screenId bigmap.bigmapMenu, Vue). |
| `Root` | table | {screenId = "bigmap", title = "Map", targetScope = "bigmap-main", scopeTree = bigmap-layout > (bigmap-camera, bigmap-main > bigmap-details), ui = Vue uniquement, infoBar par défaut, topBar masquée, uiApps par défaut} |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/router/routes/bigmap.lua`.*
