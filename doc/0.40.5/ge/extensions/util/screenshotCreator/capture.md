# `util_screenshotCreator_capture`

*Fichier : `lua/ge/extensions/util/screenshotCreator/capture.lua` · VM : Game Engine (GE) · 70 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `util_screenshotCreator_capture` : `extensions.load("util_screenshotCreator_capture")`, puis la globale `util_screenshotCreator_capture`

**Dépendances (chargées avant) :** `render_renderViews`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `util_screenshotCreator_capture.captureFramedThumbnail(filepath, camera, options)` | Offscreen thumbnail, must be called from a coroutine.<br> Nothing on screen is touched, the render view hides the UI and markersS. | 16 |
| `util_screenshotCreator_capture.takeThumbnailScreenshot(filepath, camera, callback, uniqueId, options)` |  | 33 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table |  |

## Appels vers le moteur (C++)

- `FS:` `fileExists`, `fileSize`, `removeFile`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/util/screenshotCreator/capture.lua`.*
