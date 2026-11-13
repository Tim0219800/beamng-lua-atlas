# `ui_router_routes_debug`

*Fichier : `lua/ge/extensions/ui/router/routes/debug.lua` · VM : Game Engine (GE) · 35 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_router_routes_debug` : `extensions.load("ui_router_routes_debug")`, puis la globale `ui_router_routes_debug`

Routes de débogage de l'UI (Vue, barres masquées, module abstrait) : composants de démonstration, test des apps UI, chargeur asynchrone en masse, surbrillance de tutoriel (voir ui_tutorialHighlight).

## Remarques

- Module de configuration de routes : il n'exporte aucune fonction. routeManager le lit (via l'extension ui_router_routes_<nom>) quand routes.lua l'inclut par `{ include = "<nom>" }`.
- Les clés de `Children` forment les segments du nom pointé : « <module>.<enfant> ». `children` (minuscule) dans un nœud désigne ses sous-routes ; `include` y monte un autre module.
- `ui` est hérité par les routes enfants (uiTypes, uiTypesFilter, infoBar, topBar, uiApps, uiNav, triggerPause) : un enfant ne le redéfinit que pour ce qui change.

## Champs

| Champ | Type | Description |
|---|---|---|
| `Children` | table<string, table> | components (scopeTree root > demo), ui-apps-test, asyncBulkLoader, tutorialHighlight. |
| `Root` | table | {abstract = true, ui = Vue, infoBar et topBar masquées, uiApps par défaut} |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/router/routes/debug.lua`.*
