# `ui_router_routes_global`

*Fichier : `lua/ge/extensions/ui/router/routes/global.lua` · VM : Game Engine (GE) · 65 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_router_routes_global` : `extensions.load("ui_router_routes_global")`, puis la globale `ui_router_routes_global`

Routes globales à un seul segment (hors module) : onboarding, buttonLayout, play, /mainmenu. Pour un nom à un segment, routeManager cherche d'abord ici (module global désigné par routes.lua : Global.include). « play » et « /mainmenu » ont `back = {mode = "rootExit"}`.

## Remarques

- Module de configuration de routes : il n'exporte aucune fonction. routeManager le lit (via l'extension ui_router_routes_<nom>) quand routes.lua l'inclut par `{ include = "<nom>" }`.
- Les clés de `Children` forment les segments du nom pointé : « <module>.<enfant> ». `children` (minuscule) dans un nœud désigne ses sous-routes ; `include` y monte un autre module.
- `ui` est hérité par les routes enfants (uiTypes, uiTypesFilter, infoBar, topBar, uiApps, uiNav, triggerPause) : un enfant ne le redéfinit que pour ce qui change.
- Pas de M.Root dans ce fichier ; routeManager utilise donc `mod.Root or {}`.

## Champs

| Champ | Type | Description |
|---|---|---|
| `Children` | table<string, table> | onboarding (backTarget menu), buttonLayout (infoBar par défaut), play (screenId play, Vue, uiNav = false, uiApps visibles), /mainmenu (screenId menu, uiApps masquées). |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/router/routes/global.lua`.*
