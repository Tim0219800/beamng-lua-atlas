# `ui_router_routes_busRouteWizard`

*Fichier : `lua/ge/extensions/ui/router/routes/busRouteWizard.lua` · VM : Game Engine (GE) · 72 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_router_routes_busRouteWizard` : `extensions.load("ui_router_routes_busRouteWizard")`, puis la globale `ui_router_routes_busRouteWizard`

Assistant Vue de configuration d'une ligne de bus (portage de l'ancien module Angular busRoute, gardé à côté de « menu.busRoutes » derrière un drapeau de fonctionnalité). Même structure que quickraceWizard ; partage le backend oneshotRaceCore.lua et ne diffère que par le configurateur Lua (busroute_busrouteConfigurator). Racine = écran d'accueil, enfants = choix du niveau (avec sous-étape « middle » = choix de la ligne) et du véhicule.

## Remarques

- Module de configuration de routes : il n'exporte aucune fonction. routeManager le lit (via l'extension ui_router_routes_<nom>) quand routes.lua l'inclut par `{ include = "<nom>" }`.
- Les clés de `Children` forment les segments du nom pointé : « <module>.<enfant> ». `children` (minuscule) dans un nœud désigne ses sous-routes ; `include` y monte un autre module.
- `ui` est hérité par les routes enfants (uiTypes, uiTypesFilter, infoBar, topBar, uiApps, uiNav, triggerPause) : un enfant ne le redéfinit que pour ce qui change.
- Les hooks onEnter sont des chaînes « extension.fonction » appelées par le routeur à l'entrée de la route.

## Champs

| Champ | Type | Description |
|---|---|---|
| `Children` | table<string, table> | Enfants : level (onEnter onWizardLevelRouteEnter, sous-route mineure level.middle -> onWizardMiddleRouteEnter) et vehicle (onWizardVehicleRouteEnter). Ils utilisent un scopeTree de sélecteur en grille (grid-selector-grid / grid-selector-details avec retour vers la grille). |
| `ModuleName` | string | Nom du module de routes (premier segment du nom pointé). |
| `Root` | table | {screenId = "busRouteWizard", title = "ui.playmodes.bus", onEnter = "busroute_busrouteConfigurator.onWizardRouteEnter", scopeTree racine, Vue uniquement, infoBar et topBar masquées} |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/router/routes/busRouteWizard.lua`.*
