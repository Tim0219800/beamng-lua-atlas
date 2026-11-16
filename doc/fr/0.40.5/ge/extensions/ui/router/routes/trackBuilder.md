# `ui_router_routes_trackBuilder`

*Fichier : `lua/ge/extensions/ui/router/routes/trackBuilder.lua` · VM : Game Engine (GE) · 32 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_router_routes_trackBuilder` : `extensions.load("ui_router_routes_trackBuilder")`, puis la globale `ui_router_routes_trackBuilder`

Route de l'éditeur de circuit (Vue) : écran « trackBuilder » (titre ui.playmodes.trackBuilder), sortie par rootExit, navigation UI désactivée, hooks trackbuilder_trackBuilder.onRouteEnter et onRouteLeave. Aucun enfant.

## Remarques

- Module de configuration de routes : il n'exporte aucune fonction. routeManager le lit (via l'extension ui_router_routes_<nom>) quand routes.lua l'inclut par `{ include = "<nom>" }`.
- Les clés de `Children` forment les segments du nom pointé : « <module>.<enfant> ». `children` (minuscule) dans un nœud désigne ses sous-routes ; `include` y monte un autre module.
- `ui` est hérité par les routes enfants (uiTypes, uiTypesFilter, infoBar, topBar, uiApps, uiNav, triggerPause) : un enfant ne le redéfinit que pour ce qui change.

## Champs

| Champ | Type | Description |
|---|---|---|
| `Children` | table<string, table> | Table vide. |
| `ModuleName` | string | Nom du module de routes (premier segment du nom pointé). |
| `Root` | table | {screenId = "trackBuilder", back = rootExit, scopeTree track-builder-root, onEnter/onLeave trackbuilder_trackBuilder, ui = {uiNav = false, Vue uniquement, barres masquées, uiApps masquées}} |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/router/routes/trackBuilder.lua`.*
