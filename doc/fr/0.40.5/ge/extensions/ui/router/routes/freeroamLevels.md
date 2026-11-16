# `ui_router_routes_freeroamLevels`

*Fichier : `lua/ge/extensions/ui/router/routes/freeroamLevels.lua` · VM : Game Engine (GE) · 119 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_router_routes_freeroamLevels` : `extensions.load("ui_router_routes_freeroamLevels")`, puis la globale `ui_router_routes_freeroamLevels`

Assistant Vue de choix de niveau/véhicule/options pour le mode libre (freeroam), version à racine « grille de niveaux ». Les hooks appellent freeroam_freeroamConfigurator.onWizard*. Enfants : level (détail, sous-route mineure), vehicles (> vehicle, options > multiplayer).

## Remarques

- Module de configuration de routes : il n'exporte aucune fonction. routeManager le lit (via l'extension ui_router_routes_<nom>) quand routes.lua l'inclut par `{ include = "<nom>" }`.
- Les clés de `Children` forment les segments du nom pointé : « <module>.<enfant> ». `children` (minuscule) dans un nœud désigne ses sous-routes ; `include` y monte un autre module.
- `ui` est hérité par les routes enfants (uiTypes, uiTypesFilter, infoBar, topBar, uiApps, uiNav, triggerPause) : un enfant ne le redéfinit que pour ce qui change.
- `isMinorRoute = true` marque les sous-routes de détail (ne comptent pas comme étape principale, déduit du nom).

## Champs

| Champ | Type | Description |
|---|---|---|
| `Children` | table<string, table> | level (titre dynamique via resolveSelectedLevelTitle), vehicles (> vehicle avec titre dynamique resolveSelectedVehicleTitle, > options > multiplayer). |
| `ModuleName` | string | Nom du module de routes (premier segment du nom pointé). |
| `Root` | table | {screenId = "freeroamLevels", title = "ui.menu.freeroamSelector.wizard.location", onEnter onWizardLevelsRouteEnter, onMount onWizardLevelsRouteMount, scopeTree root > (grid, auxillary), targetScope grid, ui Vue, infoBar par défaut, uiApps masquées} |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/router/routes/freeroamLevels.lua`.*
