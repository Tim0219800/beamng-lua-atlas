# `ui_router_routes_pause`

*Fichier : `lua/ge/extensions/ui/router/routes/pause.lua` · VM : Game Engine (GE) · 1498 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_router_routes_pause` : `extensions.load("ui_router_routes_pause")`, puis la globale `ui_router_routes_pause`

Routes du menu pause (Vue), le plus gros module : écran de pause racine (retour par pauseExitHandler) avec rails gauche/droite/bas, puis system, hudApps (éditeur de disposition), career (branches, missions, historique, journal), milestones, vehicleDetails, multiseat (réglages, modes de jeu, sélecteur de véhicule), vehicleSelector, stats, vehicle (configuration combinée, sauvegarde, miroirs, sélecteur, détails), manageVehicles, photomode (overlay > edit > adjust), freeroamselector, environment, replay, plus des sous-arbres inclus (mods, bigmap, options, multiplayer, freeroamLevels). Presque tous les enfants utilisent les hooks ui_pause_routeLifecycleCallbacks.onPauseEnter/onPauseMount/onPauseLeave.

## Remarques

- Module de configuration de routes : il n'exporte aucune fonction. routeManager le lit (via l'extension ui_router_routes_<nom>) quand routes.lua l'inclut par `{ include = "<nom>" }`.
- Les clés de `Children` forment les segments du nom pointé : « <module>.<enfant> ». `children` (minuscule) dans un nœud désigne ses sous-routes ; `include` y monte un autre module.
- `ui` est hérité par les routes enfants (uiTypes, uiTypesFilter, infoBar, topBar, uiApps, uiNav, triggerPause) : un enfant ne le redéfinit que pour ce qui change.
- Commentaire du code : sans onLeave, la demande de pause physique de ui_pause_home_tab reste bloquée ; c'est pourquoi les enfants mods reçoivent le cycle de vie de pause.
- Certains enfants gardent des screenId d'autres familles (career.milestones, bigmap.bigmapMenu, freeroamselector).

## Champs

| Champ | Type | Description |
|---|---|---|
| `Children` | table<string, table> | Voir le résumé du module. Inclusions : mods (avec backTarget pause.system et modsPauseLifecycle sur chaque enfant), bigmap (onLeave onPauseBigmapLeave), options, multiplayer, freeroamLevels. |
| `ModuleName` | string | Nom du module de routes (premier segment du nom pointé). |
| `Root` | table | {screenId = "pause", title = "ui.environment.pause", back = handler pauseExitHandler, hooks onPauseEnter/Mount/Leave, targetScope "pause-left-rails", scopeTree pause-root > (pause-left-rails, pause-right-rails, pause-bottom-rails, menu-content-card-1), ui = Vue uniquement, topBar masquée} |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/router/routes/pause.lua`.*
