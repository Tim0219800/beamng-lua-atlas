# `ui_photomode_session`

*Fichier : `lua/ge/extensions/ui/photomode/session.lua` · VM : Game Engine (GE) · 648 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_photomode_session` : `extensions.load("ui_photomode_session")`, puis la globale `ui_photomode_session`

**Dépendances (chargées avant) :** `ui_photomode_shared`, `ui_photomode_camera`, `ui_photomode_scene`, `ui_photomode_flash`, `ui_photomode_effects`, `ui_photomode_advancedRender`, `ui_photomode_capture`, `ui_photomode_presets`, `core_settings_graphic`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_photomode_session.beginPhotomodeSession(options)` |  | 540 |
| `ui_photomode_session.buildCapabilities()` |  | 271 |
| `ui_photomode_session.cancelExitConfirmation()` |  | 484 |
| `ui_photomode_session.confirmExit()` |  | 495 |
| `ui_photomode_session.consumeExitConfirmationBypass()` |  | 434 |
| `ui_photomode_session.endPhotomodeSession()` |  | 578 |
| `ui_photomode_session.getPanelSurfaceMode()` |  | 415 |
| `ui_photomode_session.getRoutePayload()` |  | 362 |
| `ui_photomode_session.handleExtensionLoaded()` |  | 625 |
| `ui_photomode_session.handleExtensionUnloaded()` |  | 633 |
| `ui_photomode_session.isCaptureInProgress()` |  | 385 |
| `ui_photomode_session.isDebugEnabled()` |  | 510 |
| `ui_photomode_session.isPersistentSessionEnabled()` |  | 389 |
| `ui_photomode_session.isPhotomodeSessionActive()` |  | 381 |
| `ui_photomode_session.onPhotomodeRouteEnter(routeName)` | *(hook)* | 532 |
| `ui_photomode_session.onPhotomodeRouteLeave(routeName)` | *(hook)* | 536 |
| `ui_photomode_session.requestExitConfirmation(route, params, context)` |  | 442 |
| `ui_photomode_session.setDebugEnabled(value)` |  | 514 |
| `ui_photomode_session.setHiddenCameraInputEnabled(enabled)` |  | 97 |
| `ui_photomode_session.setPanelSurfaceMode(mode)` |  | 420 |
| `ui_photomode_session.setPersistentSessionEnabled(value)` |  | 396 |
| `ui_photomode_session.traceCaptureDebug(scope, payload)` |  | 523 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table |  |

**Évènements UI (guihooks.trigger) :** `showConfirmationDialog`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/photomode/session.lua`.*
