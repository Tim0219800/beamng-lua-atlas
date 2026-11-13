# `career_modules_playerAbstract`

*Fichier : `lua/ge/extensions/career/modules/playerAbstract.lua` · VM : Game Engine (GE) · 68 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `career_modules_playerAbstract` : `extensions.load("career_modules_playerAbstract")`, puis la globale `career_modules_playerAbstract`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `career_modules_playerAbstract.closePlayerAbstractMenu()` |  | 31 |
| `career_modules_playerAbstract.getPlayerAbstractData()` |  | 40 |
| `career_modules_playerAbstract.onComputerAddFunctions(menuData, computerFunctions)` | *(hook)* | 14 |
| `career_modules_playerAbstract.onRouteLeave(context, toRoute, fromRoute, data)` | Router lifecycle: clear route-local state when leaving the screen. *(hook)* | 51 |
| `career_modules_playerAbstract.onRouteMount(context, toRoute, fromRoute, data)` | Router lifecycle: attach the player abstract data into routeData so the UI<br> reads it from the routeData store instead of fetching it on mount. *(hook)* | 46 |
| `career_modules_playerAbstract.openPlayerAbstractMenu(_originComputerId)` |  | 6 |
| `career_modules_playerAbstract.sendPlayerAbstractDataToUI()` | Push fresh abstract data to an already-open screen (e.g. after a score reset). | 56 |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onComputerPlayerAbstract`

**Évènements UI (guihooks.trigger) :** `playerAbstractData`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/career/modules/playerAbstract.lua`.*
