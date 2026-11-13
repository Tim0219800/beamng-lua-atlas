# `editor_main`

*Fichier : `lua/ge/extensions/editor/main.lua` · VM : Game Engine (GE) · 794 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_main` : `extensions.load("editor_main")`, puis la globale `editor_main`

**Dépendances (chargées avant) :** `core_camera`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_main.initializeModules()` |  | 294 |
| `editor_main.isEditorActive()` |  | 594 |
| `editor_main.loadEditorExtension(name)` |  | 140 |
| `editor_main.loadEditorExtensions(names)` |  | 171 |
| `editor_main.loadExtensionsSettings()` |  | 85 |
| `editor_main.loadPreferences()` |  | 74 |
| `editor_main.loadState(filePath)` |  | 368 |
| `editor_main.log(msg)` |  | 50 |
| `editor_main.logDebug(msg)` |  | 54 |
| `editor_main.logError(msg)` |  | 58 |
| `editor_main.logInfo(msg)` |  | 50 |
| `editor_main.logWarn(msg)` |  | 62 |
| `editor_main.onClientEndMission()` | *(hook)* | 623 |
| `editor_main.onClientStartMission()` | *(hook)* | 608 |
| `editor_main.onDeserialized(data)` | *(hook)* | 733 |
| `editor_main.onExit()` | *(hook)* | 678 |
| `editor_main.onExtensionLoaded()` | *(hook)* | 683 |
| `editor_main.onExtensionUnloaded()` | *(hook)* | 686 |
| `editor_main.onFirstUpdate()` | *(hook)* | 747 |
| `editor_main.onPreExit()` | *(hook)* | 620 |
| `editor_main.onPreWindowClose()` | *(hook)* | 614 |
| `editor_main.onSerialize()` | *(hook)* | 690 |
| `editor_main.onUpdate()` | *(hook)* | 634 |
| `editor_main.saveExtensionsSettings()` |  | 89 |
| `editor_main.savePreferences()` |  | 81 |
| `editor_main.saveState(filePath)` |  | 356 |
| `editor_main.setEditorActive(activate, safeMode)` |  | 587 |
| `editor_main.shutdown()` |  | 598 |
| `editor_main.toggleActive(safeMode)` |  | 674 |
| `editor_main.unloadEditorExtension(extName)` |  | 213 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `active` | boolean |  |
| `additionalActionMaps` | table |  |
| `allExtensionNames` | table |  |
| `dependencies` | table |  |
| `extensionNames` | table |  |
| `initialized` | boolean |  |
| `preferencesRegistry` | any |  |
| `safeMode` | boolean |  |

**Globales affectées :** `editor`

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onEditorActivated` — écouté par 29 module(s)
- `onEditorDeactivated` — écouté par 26 module(s)
- `onEditorInitialized` — écouté par 121 module(s)
- `onEditorLoadState` — écouté par 2 module(s)
- `onEditorModulesInitialized`
- `onEditorRegisterApi` — écouté par 1 module(s)
- `onEditorSaveState` — écouté par 2 module(s)
- `onEditorShutdown` — écouté par 1 module(s)

**Évènements UI (guihooks.trigger) :** `ShowApps`

## Appels vers le moteur (C++)

- `Engine.` `getNeedCollisionRebuild`
- `FS:` `findFiles`
- `obj:` `setSelected`
- `scenetree.` `findObject`, `findObjectById`
- `worldEditorCppApi.` `enableEditor`, `enableSimSetAndSimObjectSignals`, `hideIconForObject`, `mustOpenEditorOnStart`, `setHoveredObjectId`, `setOpenEditorOnStart`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/main.lua`.*
