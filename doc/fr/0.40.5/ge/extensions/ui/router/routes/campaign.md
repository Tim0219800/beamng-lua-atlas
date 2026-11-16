# `ui_router_routes_campaign`

*Fichier : `lua/ge/extensions/ui/router/routes/campaign.lua` · VM : Game Engine (GE) · 41 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_router_routes_campaign` : `extensions.load("ui_router_routes_campaign")`, puis la globale `ui_router_routes_campaign`

Module de routes « campaign » abstrait (Vue, barres masquées). Ses enfants (components, ui-apps-test, comic) ont en réalité les screenId « debug.components », « debug.ui-apps-test » et « comic » (écran Angular) : on dirait un copier-coller du module debug.

## Remarques

- Module de configuration de routes : il n'exporte aucune fonction. routeManager le lit (via l'extension ui_router_routes_<nom>) quand routes.lua l'inclut par `{ include = "<nom>" }`.
- Les clés de `Children` forment les segments du nom pointé : « <module>.<enfant> ». `children` (minuscule) dans un nœud désigne ses sous-routes ; `include` y monte un autre module.
- `ui` est hérité par les routes enfants (uiTypes, uiTypesFilter, infoBar, topBar, uiApps, uiNav, triggerPause) : un enfant ne le redéfinit que pour ce qui change.
- Possible incohérence : le module « campaign » ne contient pas de routes de campagne mais des routes de débogage (screenId en « debug.* ») ; les campagnes passent par « menu.campaigns ».

## Champs

| Champ | Type | Description |
|---|---|---|
| `Children` | table<string, table> | components -> screenId debug.components ; ui-apps-test -> debug.ui-apps-test ; comic -> screenId comic, interface Angular uniquement. |
| `Root` | table | {abstract = true, ui = Vue, infoBar et topBar masquées, uiApps par défaut} |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/router/routes/campaign.lua`.*
