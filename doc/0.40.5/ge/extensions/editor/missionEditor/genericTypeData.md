# `editor_missionEditor_genericTypeData`

*Fichier : `lua/ge/extensions/editor/missionEditor/genericTypeData.lua` · VM : Game Engine (GE) · 398 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/editor/missionEditor/genericTypeData")` (fichier sous extensions/ mais pas une extension classique)

## Classe `C`

Le module renvoie un constructeur : `local obj = require("editor_missionEditor_genericTypeData")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:changeMissionType(newType, force)` |  | 77 |
| `C:draw()` |  | 244 |
| `C:drawTools()` |  | 340 |
| `C:drawViews()` |  | 364 |
| `C:drawViewsMenu()` |  | 352 |
| `C:fillGeneric(mission)` |  | 72 |
| `C:getCurrentEditorHelper()` |  | 372 |
| `C:getMissionIssues(m)` |  | 375 |
| `C:init(missionEditor)` |  | 25 |
| `C:loadEditor(missionType)` | see if the mission type has an editor. | 41 |
| `C:openPopup()` |  | 99 |
| `C:setMission(mission)` |  | 60 |
| `C:variablesHelperPopup()` |  | 103 |

## Appels vers le moteur (C++)

- `FS:` `fileExists`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/missionEditor/genericTypeData.lua`.*
