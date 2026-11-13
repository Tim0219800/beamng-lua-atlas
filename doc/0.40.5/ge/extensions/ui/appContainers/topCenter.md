# `ui_appContainers_topCenter`

*Fichier : `lua/ge/extensions/ui/appContainers/topCenter.lua` · VM : Game Engine (GE) · 326 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_appContainers_topCenter` : `extensions.load("ui_appContainers_topCenter")`, puis la globale `ui_appContainers_topCenter`

**Dépendances (chargées avant) :** `ui_appContainers`, `ui_firstDrive_moveOff`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_appContainers_topCenter.clearAllFlashMessages()` |  | 183 |
| `ui_appContainers_topCenter.clearMessagesFromSource(source)` |  | 166 |
| `ui_appContainers_topCenter.clearSpeedTarget()` |  | 60 |
| `ui_appContainers_topCenter.getActiveFlashMessage()` | Used by the hud app to catch up on a message that was sent before it mounted. | 200 |
| `ui_appContainers_topCenter.getAppVisibility(containerId, appId)` |  | 27 |
| `ui_appContainers_topCenter.getAvailableApps(containerId)` |  | 64 |
| `ui_appContainers_topCenter.getAvailableContexts(containerId)` |  | 64 |
| `ui_appContainers_topCenter.getContainerContext(containerId)` |  | 87 |
| `ui_appContainers_topCenter.getSpeedTarget()` |  | 56 |
| `ui_appContainers_topCenter.getVisibleApps(containerId)` |  | 47 |
| `ui_appContainers_topCenter.hideAllApps(containerId)` |  | 31 |
| `ui_appContainers_topCenter.hideApp(containerId, appId)` |  | 39 |
| `ui_appContainers_topCenter.onExtensionLoaded()` | *(hook)* | 267 |
| `ui_appContainers_topCenter.onExtensionUnloaded()` | *(hook)* | 285 |
| `ui_appContainers_topCenter.onGameplayFlashMessage(data)` | *(hook)* | 206 |
| `ui_appContainers_topCenter.onScenarioFlashMessage(data)` | *(hook)* | 103 |
| `ui_appContainers_topCenter.onScenarioFlashMessageClear()` | *(hook)* | 130 |
| `ui_appContainers_topCenter.onScenarioNotRunning()` | *(hook)* | 134 |
| `ui_appContainers_topCenter.onUpdate(dtReal, dtSim, dtRaw)` | *(hook)* | 229 |
| `ui_appContainers_topCenter.resetContainerContext(containerId)` |  | 80 |
| `ui_appContainers_topCenter.setAppVisibility(containerId, appId, visible)` |  | 23 |
| `ui_appContainers_topCenter.setContainerContext(containerId, context)` |  | 68 |
| `ui_appContainers_topCenter.setDebug(enabled)` |  | 95 |
| `ui_appContainers_topCenter.setSpeedTarget(data)` |  | 51 |
| `ui_appContainers_topCenter.setVerboseLogging(enabled)` |  | 99 |
| `ui_appContainers_topCenter.showApp(containerId, appId)` |  | 35 |
| `ui_appContainers_topCenter.showFlashMessage(msg, ttl, big)` | Shows a single flash message and remembers it for the duration of its ttl. So that even if the hud app mounts late, it will show | 191 |
| `ui_appContainers_topCenter.toggleApp(containerId, appId)` |  | 43 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table |  |

**Évènements UI (guihooks.trigger) :** `TechDriverTrainingSpeedBarTarget`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/appContainers/topCenter.lua`.*
