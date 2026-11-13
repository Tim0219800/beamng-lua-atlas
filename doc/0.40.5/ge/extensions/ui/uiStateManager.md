# `ui_uiStateManager`

*Fichier : `lua/ge/extensions/ui/uiStateManager.lua` · VM : Game Engine (GE) · 120 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_uiStateManager` : `extensions.load("ui_uiStateManager")`, puis la globale `ui_uiStateManager`

**Dépendances (chargées avant) :** `ui_router`, `ui_router_routeManager`, `ui_menuManager`, `ui_legal`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_uiStateManager._checkAllUiReady()` |  | 110 |
| `ui_uiStateManager.checkAndSyncRoute(uiType)` |  | 53 |
| `ui_uiStateManager.initialize(headlessMode)` | Public API | 15 |
| `ui_uiStateManager.isUiReady(uiType)` |  | 39 |
| `ui_uiStateManager.navigateToInitialScreen()` | Initial navigation | 86 |
| `ui_uiStateManager.onExtensionLoaded()` | *(hook)* | 78 |
| `ui_uiStateManager.uiReady(uiType)` |  | 23 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table |  |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onAllUiReady`
- `onUiReady` — écouté par 6 module(s)

**Évènements UI (guihooks.trigger) :** `ui_router_routeRefresh`

**Charge les extensions :** `ui_router`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/uiStateManager.lua`.*
