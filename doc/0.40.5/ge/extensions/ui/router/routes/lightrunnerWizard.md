# `ui_router_routes_lightrunnerWizard`

*Fichier : `lua/ge/extensions/ui/router/routes/lightrunnerWizard.lua` · VM : Game Engine (GE) · 75 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_router_routes_lightrunnerWizard` : `extensions.load("ui_router_routes_lightrunnerWizard")`, puis la globale `ui_router_routes_lightrunnerWizard`

Assistant Vue de configuration du mode LightRunner (portage de l'ancien module Angular lightrunner). Même structure que quickraceWizard, backend oneshotRaceCore.lua, configurateur lightrunner_lightrunnerConfigurator. Enfants : level (> middle, titre « ui.quickrace.quickraceTracks »), vehicle.

## Remarques

- Module de configuration de routes : il n'exporte aucune fonction. routeManager le lit (via l'extension ui_router_routes_<nom>) quand routes.lua l'inclut par `{ include = "<nom>" }`.
- Les clés de `Children` forment les segments du nom pointé : « <module>.<enfant> ». `children` (minuscule) dans un nœud désigne ses sous-routes ; `include` y monte un autre module.
- `ui` est hérité par les routes enfants (uiTypes, uiTypesFilter, infoBar, topBar, uiApps, uiNav, triggerPause) : un enfant ne le redéfinit que pour ce qui change.
- Le titre de level réutilise la clé « ui.busRoute.levelSelect » pour éviter une nouvelle entrée de localisation (commentaire du code).

## Champs

| Champ | Type | Description |
|---|---|---|
| `Children` | table<string, table> | level (onWizardLevelRouteEnter ; sous-route mineure middle -> onWizardMiddleRouteEnter), vehicle (onWizardVehicleRouteEnter) ; scopeTree de sélecteur en grille. |
| `ModuleName` | string | Nom du module de routes (premier segment du nom pointé). |
| `Root` | table | {screenId = "lightrunnerWizard", title = "ui.playmodes.lightRunner", onEnter = "lightrunner_lightrunnerConfigurator.onWizardRouteEnter", Vue uniquement, barres masquées} |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/router/routes/lightrunnerWizard.lua`.*
