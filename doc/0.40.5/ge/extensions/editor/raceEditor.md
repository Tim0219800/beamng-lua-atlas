# `editor_raceEditor`

*Fichier : `lua/ge/extensions/editor/raceEditor.lua` · VM : Game Engine (GE) · 569 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_raceEditor` : `extensions.load("editor_raceEditor")`, puis la globale `editor_raceEditor`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_raceEditor.allowGizmo()` |  | 551 |
| `editor_raceEditor.calculateAiRoute()` |  | 28 |
| `editor_raceEditor.changedFromExternal()` |  | 555 |
| `editor_raceEditor.getCurrentFilename()` |  | 552 |
| `editor_raceEditor.getCurrentPath()` |  | 553 |
| `editor_raceEditor.getToolsWindow()` |  | 567 |
| `editor_raceEditor.isVisible()` |  | 554 |
| `editor_raceEditor.loadRace(filename)` |  | 79 |
| `editor_raceEditor.onDeserialized(data)` | *(hook)* | 520 |
| `editor_raceEditor.onEditorGui()` | *(hook)* | 254 |
| `editor_raceEditor.onEditorInitialized()` | *(hook)* | 471 |
| `editor_raceEditor.onEditorRegisterPreferences(prefsRegistry)` | *(hook)* | 535 |
| `editor_raceEditor.onEditorToolWindowHide(windowName)` | *(hook)* | 499 |
| `editor_raceEditor.onSerialize()` | *(hook)* | 511 |
| `editor_raceEditor.onUpdate(dtReal, dtSim, dtRaw)` | Race Testing window *(hook)* | 113 |
| `editor_raceEditor.onWindowGotFocus(windowName)` | *(hook)* | 505 |
| `editor_raceEditor.saveRace(race, savePath)` |  | 67 |
| `editor_raceEditor.setupRace()` |  | 106 |
| `editor_raceEditor.show()` |  | 447 |

## Appels vers le moteur (C++)

- `FS:` `findFiles`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/raceEditor.lua`.*
