# `ui_router_routes_scenario`

*Fichier : `lua/ge/extensions/ui/router/routes/scenario.lua` · VM : Game Engine (GE) · 111 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_router_routes_scenario` : `extensions.load("ui_router_routes_scenario")`, puis la globale `ui_router_routes_scenario`

Routes de fin et de début de scénario (Vue, module abstrait) : start, end, quickrace.end et chapter.end. Chaque écran a un scopeTree d'actions avec backTarget vers la racine ; les blocs conditionnels (réglages, progression, véhicule, récompenses, stats, mission) sont `optional = true` pour le validateur de portées. Retour par défaut vers pause.

## Remarques

- Module de configuration de routes : il n'exporte aucune fonction. routeManager le lit (via l'extension ui_router_routes_<nom>) quand routes.lua l'inclut par `{ include = "<nom>" }`.
- Les clés de `Children` forment les segments du nom pointé : « <module>.<enfant> ». `children` (minuscule) dans un nœud désigne ses sous-routes ; `include` y monte un autre module.
- `ui` est hérité par les routes enfants (uiTypes, uiTypesFilter, infoBar, topBar, uiApps, uiNav, triggerPause) : un enfant ne le redéfinit que pour ce qui change.

## Champs

| Champ | Type | Description |
|---|---|---|
| `Children` | table<string, table> | start, end, quickrace (abstrait > end), chapter (abstrait > end) ; screenId scenario.start / scenario.end / scenario.quickrace.end / scenario.chapter.end, tous en Vue avec backTarget = "pause". |
| `ModuleName` | string | Nom du module de routes (premier segment du nom pointé). |
| `Root` | table | {abstract = true, ui = filtre only, infoBar et topBar masquées, uiApps visibles} |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/router/routes/scenario.lua`.*
