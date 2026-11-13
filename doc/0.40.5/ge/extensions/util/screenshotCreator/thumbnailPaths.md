# `util_screenshotCreator_thumbnailPaths`

*Fichier : `lua/ge/extensions/util/screenshotCreator/thumbnailPaths.lua` · VM : Game Engine (GE) · 44 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `util_screenshotCreator_thumbnailPaths` : `extensions.load("util_screenshotCreator_thumbnailPaths")`, puis la globale `util_screenshotCreator_thumbnailPaths`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `util_screenshotCreator_thumbnailPaths.getFinalOutputPath(item, captureMode)` |  | 12 |
| `util_screenshotCreator_thumbnailPaths.hasThumbnail(item)` | the game picks up either a .png or a .jpg thumbnail, from the game or the user folder | 19 |
| `util_screenshotCreator_thumbnailPaths.makeOutputPaths(item, captureMode)` |  | 24 |
| `util_screenshotCreator_thumbnailPaths.safePathPart(value)` |  | 7 |

## Appels vers le moteur (C++)

- `FS:` `directoryCreate`, `fileExists`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/util/screenshotCreator/thumbnailPaths.lua`.*
