# `ui_appContainers`

*Fichier : `lua/ge/extensions/ui/appContainers.lua` · VM : Game Engine (GE) · 255 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_appContainers` : `extensions.load("ui_appContainers")`, puis la globale `ui_appContainers`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_appContainers.getAppVisibility(containerId, appId)` |  | 78 |
| `ui_appContainers.getAvailableApps(containerId)` |  | 142 |
| `ui_appContainers.getVisibleApps(containerId)` |  | 125 |
| `ui_appContainers.hideAllApps(containerId)` |  | 94 |
| `ui_appContainers.hideApp(containerId, appId)` |  | 117 |
| `ui_appContainers.onDeserialize(data)` | *(hook)* | 163 |
| `ui_appContainers.onExtensionLoaded()` | *(hook)* | 186 |
| `ui_appContainers.onExtensionUnloaded()` | *(hook)* | 189 |
| `ui_appContainers.onSerialize()` | *(hook)* | 152 |
| `ui_appContainers.onUpdate()` | *(hook)* | 193 |
| `ui_appContainers.registerContainer(config)` |  | 35 |
| `ui_appContainers.resolveContainerId(containerId)` |  | 18 |
| `ui_appContainers.setAppVisibility(containerId, appId, visible)` |  | 56 |
| `ui_appContainers.setDebug(enabled)` |  | 178 |
| `ui_appContainers.setVerboseLogging(enabled)` |  | 182 |
| `ui_appContainers.showApp(containerId, appId)` |  | 113 |
| `ui_appContainers.toggleApp(containerId, appId)` |  | 121 |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onUIContainerAppsHidden`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/appContainers.lua`.*
