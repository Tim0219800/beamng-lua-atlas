# `editor_engineAudioDebug`

*Fichier : `lua/ge/extensions/editor/engineAudioDebug.lua` · VM : Game Engine (GE) · 329 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_engineAudioDebug` : `extensions.load("editor_engineAudioDebug")`, puis la globale `editor_engineAudioDebug`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_engineAudioDebug.onEditorActivated()` | *(hook)* | 297 |
| `editor_engineAudioDebug.onEditorDeactivated()` | *(hook)* | 290 |
| `editor_engineAudioDebug.onEditorInitialized()` | *(hook)* | 279 |
| `editor_engineAudioDebug.onEditorToolWindowHide(windowName)` | *(hook)* | 301 |
| `editor_engineAudioDebug.onEditorToolWindowShow(windowName)` | *(hook)* | 308 |
| `editor_engineAudioDebug.onExtensionLoaded()` | called when the extension is loaded (might be invisible still) *(hook)* | 275 |
| `editor_engineAudioDebug.onVehicleSwitched(oldVehicle, newVehicle, player)` | *(hook)* | 284 |
| `editor_engineAudioDebug.open()` | helper function to open the window | 269 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `onDebugDrawActive` | any |  ⚠ référence `onDebugDrawActive` non définie dans le fichier (vaut probablement nil) |
| `onUpdate` | any |  |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onUpdate` — écouté par 186 module(s)

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/engineAudioDebug.lua`.*
