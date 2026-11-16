# `ui_router_routes_quickraceWizard`

*Fichier : `lua/ge/extensions/ui/router/routes/quickraceWizard.lua` · VM : Game Engine (GE) · 74 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_router_routes_quickraceWizard` : `extensions.load("ui_router_routes_quickraceWizard")`, puis la globale `ui_router_routes_quickraceWizard`

Assistant Vue de la course rapide (portage de l'ancien module Angular quickrace, séparé de « menu.quickrace » pour coexister derrière un drapeau). La racine est l'écran d'aperçu/options ; level (> middle = choix du tracé) et vehicle sont des étapes qui reviennent à la racine. Configurateur : quickrace_quickraceConfigurator ; backend commun oneshotRaceCore.lua.

## Remarques

- Module de configuration de routes : il n'exporte aucune fonction. routeManager le lit (via l'extension ui_router_routes_<nom>) quand routes.lua l'inclut par `{ include = "<nom>" }`.
- Les clés de `Children` forment les segments du nom pointé : « <module>.<enfant> ». `children` (minuscule) dans un nœud désigne ses sous-routes ; `include` y monte un autre module.
- `ui` est hérité par les routes enfants (uiTypes, uiTypesFilter, infoBar, topBar, uiApps, uiNav, triggerPause) : un enfant ne le redéfinit que pour ce qui change.

## Champs

| Champ | Type | Description |
|---|---|---|
| `Children` | table<string, table> | level (onWizardLevelRouteEnter, titre ui.quickrace.quickraceLevels ; sous-route mineure middle -> onWizardMiddleRouteEnter, titre ui.quickrace.quickraceTracks), vehicle (onWizardVehicleRouteEnter) ; scopeTree de sélecteur en grille. |
| `ModuleName` | string | Nom du module de routes (premier segment du nom pointé). |
| `Root` | table | {screenId = "quickraceWizard", title = "ui.playmodes.quickrace", onEnter = "quickrace_quickraceConfigurator.onWizardRouteEnter", Vue uniquement, barres masquées} |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/router/routes/quickraceWizard.lua`.*
