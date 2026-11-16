# `ui_router_managers_frameworkManager`

*Fichier : `lua/ge/extensions/ui/router/managers/frameworkManager.lua` · VM : Game Engine (GE) · 73 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_router_managers_frameworkManager` : `extensions.load("ui_router_managers_frameworkManager")`, puis la globale `ui_router_managers_frameworkManager`

Pont sortant du routeur Lua vers les frameworks UI (Vue, Angular) par guihooks. Il émet les évènements de changement de route (démarrage, fin, annulation) et ne garde aucun état : l'état de transition, la progression, les timeouts et la validation des accusés sont dans transitionManager.lua et router.lua.

## Remarques

- Quand un transitionId est fourni, une copie superficielle de la charge utile est émise avec transitionId ajouté : l'entrée de navigation d'origine n'est jamais modifiée. Les champs existants (request, resolved, origin, toRoute, fromRoute, routeNode) sont conservés.
- Évènements GUI émis : ui_router_routeChange, ui_router_afterRouteChange (Constants.RouterHooks.AFTER_ROUTE_CHANGE), ui_router_routeChangeCancelled (ROUTE_CHANGE_CANCELLED).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_router_managers_frameworkManager.sendRouteChange(data, transitionId)` | Émet l'évènement GUI ui_router_routeChange pour demander au framework d'afficher la route. | 31 |
| `ui_router_managers_frameworkManager.sendRouteChangeCancelled(data, extras)` | Émet l'évènement GUI ui_router_routeChangeCancelled. Si extras contient transitionId ou reason, une copie de la route est émise avec ces champs pour que l'UI n'efface que le handoff correspondant. | 57 |
| `ui_router_managers_frameworkManager.sendRouteChangeComplete(data)` | Émet l'évènement GUI ui_router_afterRouteChange avec l'entrée de navigation validée. | 43 |

### Détail des paramètres

#### `ui_router_managers_frameworkManager.sendRouteChange(data, transitionId)`

Émet l'évènement GUI ui_router_routeChange pour demander au framework d'afficher la route.

- `data` (*table*) : Entrée de navigation (traitée comme immuable).
- `transitionId` (*string|nil*) : Identifiant de transition à joindre à la charge utile (copie).

#### `ui_router_managers_frameworkManager.sendRouteChangeCancelled(data, extras)`

Émet l'évènement GUI ui_router_routeChangeCancelled. Si extras contient transitionId ou reason, une copie de la route est émise avec ces champs pour que l'UI n'efface que le handoff correspondant.

- `data` (*table|nil*) : Route annulée (toRoute), traitée comme immuable.
- `extras` (*table|nil*) : {transitionId?, reason?}.

#### `ui_router_managers_frameworkManager.sendRouteChangeComplete(data)`

Émet l'évènement GUI ui_router_afterRouteChange avec l'entrée de navigation validée.

- `data` (*table*) : Entrée courante validée.

**Évènements UI (guihooks.trigger) :** `ui_router_`, `ui_router_routeChange`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/router/managers/frameworkManager.lua`.*
