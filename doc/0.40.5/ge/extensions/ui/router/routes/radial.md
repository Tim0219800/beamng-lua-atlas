# `ui_router_routes_radial`

*Fichier : `lua/ge/extensions/ui/router/routes/radial.lua` · VM : Game Engine (GE) · 31 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_router_routes_radial` : `extensions.load("ui_router_routes_radial")`, puis la globale `ui_router_routes_radial`

Routes du menu radial (Vue). La racine « radial » appelle core_quickAccess.endRouteHandoff à l'entrée (fin du transfert de route en cours, réaffiche le menu) et a un retour géré par `radialBackHandler`. Enfant : mirrors (réglage des rétroviseurs, retour vers radial).

## Remarques

- Module de configuration de routes : il n'exporte aucune fonction. routeManager le lit (via l'extension ui_router_routes_<nom>) quand routes.lua l'inclut par `{ include = "<nom>" }`.
- Les clés de `Children` forment les segments du nom pointé : « <module>.<enfant> ». `children` (minuscule) dans un nœud désigne ses sous-routes ; `include` y monte un autre module.
- `ui` est hérité par les routes enfants (uiTypes, uiTypesFilter, infoBar, topBar, uiApps, uiNav, triggerPause) : un enfant ne le redéfinit que pour ce qui change.

## Champs

| Champ | Type | Description |
|---|---|---|
| `Children` | table<string, table> | mirrors (screenId radial.mirrors, titre ui.mirrors.name, backTarget radial). |
| `Root` | table | {screenId = "radial", onEnter = "core_quickAccess.endRouteHandoff", back = handler radialBackHandler, ui = Vue, infoBar par défaut, topBar masquée} |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/router/routes/radial.lua`.*
