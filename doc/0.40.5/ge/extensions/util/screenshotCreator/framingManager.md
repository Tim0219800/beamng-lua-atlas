# `util_screenshotCreator_framingManager`

*Fichier : `lua/ge/extensions/util/screenshotCreator/framingManager.lua` · VM : Game Engine (GE) · 124 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `util_screenshotCreator_framingManager` : `extensions.load("util_screenshotCreator_framingManager")`, puis la globale `util_screenshotCreator_framingManager`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `util_screenshotCreator_framingManager.deserialize(data)` |  | 88 |
| `util_screenshotCreator_framingManager.get()` |  | 54 |
| `util_screenshotCreator_framingManager.getSelected()` |  | 54 |
| `util_screenshotCreator_framingManager.getSelectedModeId()` |  | 54 |
| `util_screenshotCreator_framingManager.list()` |  | 50 |
| `util_screenshotCreator_framingManager.listModes()` |  | 50 |
| `util_screenshotCreator_framingManager.migrateLegacyState(data)` |  | 88 |
| `util_screenshotCreator_framingManager.onDeserialized(data)` | *(hook)* | 88 |
| `util_screenshotCreator_framingManager.onSerialize()` | *(hook)* | 84 |
| `util_screenshotCreator_framingManager.resolve(modeId, context)` |  | 66 |
| `util_screenshotCreator_framingManager.serialize()` |  | 84 |
| `util_screenshotCreator_framingManager.set(modeId)` |  | 58 |
| `util_screenshotCreator_framingManager.setSelected(modeId)` |  | 58 |
| `util_screenshotCreator_framingManager.setSelectedModeId(modeId)` |  | 58 |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onScreenshotCreatorCollectFramingModes` — écouté par 4 module(s)

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/util/screenshotCreator/framingManager.lua`.*
