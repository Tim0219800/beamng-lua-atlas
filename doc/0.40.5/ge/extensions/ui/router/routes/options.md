# `ui_router_routes_options`

*Fichier : `lua/ge/extensions/ui/router/routes/options.lua` · VM : Game Engine (GE) · 39 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_router_routes_options` : `extensions.load("ui_router_routes_options")`, puis la globale `ui_router_routes_options`

Routes des options (Vue) : racine « options » (repli vers menu via fallbackTarget) avec infoBar sans info système, et enfant category (screenId pause.options.category, topBar masquée). Les écrans d'options détaillés se trouvent dans menu.options.* et pause.options.

## Remarques

- Module de configuration de routes : il n'exporte aucune fonction. routeManager le lit (via l'extension ui_router_routes_<nom>) quand routes.lua l'inclut par `{ include = "<nom>" }`.
- Les clés de `Children` forment les segments du nom pointé : « <module>.<enfant> ». `children` (minuscule) dans un nœud désigne ses sous-routes ; `include` y monte un autre module.
- `ui` est hérité par les routes enfants (uiTypes, uiTypesFilter, infoBar, topBar, uiApps, uiNav, triggerPause) : un enfant ne le redéfinit que pour ce qui change.

## Champs

| Champ | Type | Description |
|---|---|---|
| `Children` | table<string, table> | category. |
| `ModuleName` | string | Nom du module de routes (premier segment du nom pointé). |
| `Root` | table | {screenId = "options", title = "Options", fallbackTarget = "menu", ui = Vue uniquement, infoBar visible sans info système, topBar masquée, uiApps masquées} |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/router/routes/options.lua`.*
