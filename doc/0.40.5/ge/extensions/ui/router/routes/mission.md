# `ui_router_routes_mission`

*Fichier : `lua/ge/extensions/ui/router/routes/mission.lua` · VM : Game Engine (GE) · 87 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_router_routes_mission` : `extensions.load("ui_router_routes_mission")`, puis la globale `ui_router_routes_mission`

Routes des missions (Vue, abstrait) : détails (retour par missionDetailsExitHandler), contrôle de mission (retour pause ; sélecteur de véhicule en grille avec gridSelector backendName vehicleSelector), grille, historique et règles de drag, classement des concurrents IA.

## Remarques

- Module de configuration de routes : il n'exporte aucune fonction. routeManager le lit (via l'extension ui_router_routes_<nom>) quand routes.lua l'inclut par `{ include = "<nom>" }`.
- Les clés de `Children` forment les segments du nom pointé : « <module>.<enfant> ». `children` (minuscule) dans un nœud désigne ses sous-routes ; `include` y monte un autre module.
- `ui` est hérité par les routes enfants (uiTypes, uiTypesFilter, infoBar, topBar, uiApps, uiNav, triggerPause) : un enfant ne le redéfinit que pour ce qui change.

## Champs

| Champ | Type | Description |
|---|---|---|
| `Children` | table<string, table> | details, control (> vehicleSelector avec hooks ui_gridSelectorRouteLifecycleCallbacks.onRouteEnter/Mount/Leave et meta.gridSelector {backendName, routePath = "/mission-vehicle-selector", defaultPath}), grid, dragHistory, dragRules, aiCompetitorsLeaderboardTable. |
| `ModuleName` | string | Nom du module de routes (premier segment du nom pointé). |
| `Root` | table | {screenId = "mission", abstract = true, ui = Vue uniquement, infoBar par défaut, topBar masquée, uiApps par défaut} |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/router/routes/mission.lua`.*
