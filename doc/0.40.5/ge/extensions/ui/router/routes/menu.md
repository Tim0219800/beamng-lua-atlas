# `ui_router_routes_menu`

*Fichier : `lua/ge/extensions/ui/router/routes/menu.lua` · VM : Game Engine (GE) · 791 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_router_routes_menu` : `extensions.load("ui_router_routes_menu")`, puis la globale `ui_router_routes_menu`

Routes du menu principal (Vue) : sélecteurs de jeu (freeroam, quickrace, lightrunner, bus, scénarios, expériences, rallye), niveaux, véhicules et configuration (vehicleconfig, partpacks), options (audio, caméra, contrôles, affichage, gameplay, graphismes, langue, autres, interface), mods, discover, replay, crédits, infos de version, sons d'UI. Plusieurs sous-arbres sont montés par `include` (mods, freeroamLevels, quickraceWizard, lightrunnerWizard, busRouteWizard, multiplayer). Le retour de la racine passe par `mainmenuExitHandler`.

## Remarques

- Module de configuration de routes : il n'exporte aucune fonction. routeManager le lit (via l'extension ui_router_routes_<nom>) quand routes.lua l'inclut par `{ include = "<nom>" }`.
- Les clés de `Children` forment les segments du nom pointé : « <module>.<enfant> ». `children` (minuscule) dans un nœud désigne ses sous-routes ; `include` y monte un autre module.
- `ui` est hérité par les routes enfants (uiTypes, uiTypesFilter, infoBar, topBar, uiApps, uiNav, triggerPause) : un enfant ne le redéfinit que pour ce qui change.
- `replayBackTarget` est calculé au chargement du fichier : « menu » si Engine.UI.isSimpleMenu(), sinon « menu.others » (les replays sont dans « More » hors menu simple).

## Champs

| Champ | Type | Description |
|---|---|---|
| `Children` | table<string, table> | Entre autres : bigmapMenu, campaigns, dragRaceOverview, careerPause, freeroamconfigurator, freeroamselector, quickraceWizard, lightrunnerWizard, busRouteWizard, environment, discover (> details, multiseat), gameplay, rallySelector, experiencesSelector, photomode, rally, levels, levelDetails, others, credits, modsDetails (Angular), options (abstrait), release-info, replay, scenarios, threeElementSelect, uiSounds, vehicleconfig, vehicles, vehiclesdetails, vehiclesnew. |
| `Root` | table | {screenId = "menu", title = "ui.common.menu", scopeTree root, back = handler mainmenuExitHandler, ui = Vue uniquement} |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/router/routes/menu.lua`.*
