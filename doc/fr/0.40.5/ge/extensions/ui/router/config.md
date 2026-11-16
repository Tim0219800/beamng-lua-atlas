# `ui_router_config`

*Fichier : `lua/ge/extensions/ui/router/config.lua` · VM : Game Engine (GE) · 46 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_router_config` : `extensions.load("ui_router_config")`, puis la globale `ui_router_config`

Constantes de configuration du routeur d'interface (ui_router) : route principale par défaut, délais des transitions (plat pour Angular/legacy, par phases pour le flux d'accusés Vue), source du décorateur de contexte et valeurs d'interface par défaut fusionnées dans la configuration d'une route. Module de données pur, sans fonction.

## Remarques

- Timeout = 3 s : délai plat de forçage de fin pour les transitions non phasées (Angular/legacy).
- PhaseTimeouts (secondes) : startupResendInterval = 1.0 (la phase startup renvoie l'évènement de changement de route à intervalle fixe, sans jamais expirer, car des routes Vue de mods peuvent s'enregistrer tard), routeCommit = 3.0, mountReady = 3.0, total = 8.0 (plafond d'urgence sur les phases après démarrage ; l'attente de startup n'y compte pas).
- Les phases : startup (attend routeNavigationStarted), routeCommit (attend routeChangeComplete), mountReady (attend routeMounted quand un accusé de montage est requis).
- RouteUiDefaults = {uiNav = true} : la navigation manette/clavier est activée sauf si la route (ou ses parents) la désactive.
- MainRoute vaut "menu" (valeur d'origine ; aucune utilisation n'est visible dans ce fichier).

## Champs

| Champ | Type | Description |
|---|---|---|
| `ContextDecoratorDefaultSource` | string | Source par défaut du décorateur de contexte : "core_gamestate.gameStateDecorator". |
| `MainRoute` | string | Route par défaut quand aucune route n'est précisée : "menu". |
| `PhaseTimeouts` | table<string, number> | Délais des transitions par phases (Vue) : startupResendInterval, routeCommit, mountReady, total (secondes). |
| `RouteUiDefaults` | table | Valeurs d'interface par défaut ajoutées à la configuration de route si elle ne les définit pas : {uiNav = true}. |
| `ShowContextDecoratorInBreadcrumbs` | boolean | false : le décorateur de contexte n'est pas affiché par défaut dans le fil d'Ariane. |
| `Timeout` | number | Délai en secondes (3) avant forçage de fin d'une transition non phasée (Angular/legacy). |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/router/config.lua`.*
