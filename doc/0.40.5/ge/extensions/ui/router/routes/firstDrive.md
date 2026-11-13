# `ui_router_routes_firstDrive`

*Fichier : `lua/ge/extensions/ui/router/routes/firstDrive.lua` · VM : Game Engine (GE) · 98 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_router_routes_firstDrive` : `extensions.load("ui_router_routes_firstDrive")`, puis la globale `ui_router_routes_firstDrive`

Routes de la première conduite guidée (Vue) : introduction, onboarding, arrivée, fin, récupération, zones d'apprentissage. Les retours sont verrouillés (`firstDriveLockedHandler`) sauf onboarding (previousRouteBackHandler). Les hooks onMount/onEnter/onLeave appellent gameplay_discover_firstDrive_experience.

## Remarques

- Module de configuration de routes : il n'exporte aucune fonction. routeManager le lit (via l'extension ui_router_routes_<nom>) quand routes.lua l'inclut par `{ include = "<nom>" }`.
- Les clés de `Children` forment les segments du nom pointé : « <module>.<enfant> ». `children` (minuscule) dans un nœud désigne ses sous-routes ; `include` y monte un autre module.
- `ui` est hérité par les routes enfants (uiTypes, uiTypesFilter, infoBar, topBar, uiApps, uiNav, triggerPause) : un enfant ne le redéfinit que pour ce qui change.

## Champs

| Champ | Type | Description |
|---|---|---|
| `Children` | table<string, table> | onboarding (infoBar visible), arrival, completion (onMount dédiés, retour verrouillé), recovery (backTarget play, onLeave onFirstDriveRecoveryRouteLeave), learning (backTarget pause, onEnter/onLeave dédiés, triggerPause = true, scope first-drive-learning-areas). |
| `ModuleName` | string | Nom du module de routes (premier segment du nom pointé). |
| `Root` | table | {screenId = "firstDrive", onMount = "gameplay_discover_firstDrive_experience.onFirstDriveRouteMount", back = handler firstDriveLockedHandler, scopeTree first-drive-intro, ui = Vue, barres masquées, uiApps masquées, triggerPause = false} |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/router/routes/firstDrive.lua`.*
