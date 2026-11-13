# `editor_raceEditor_timeTrials`

*Fichier : `lua/ge/extensions/editor/raceEditor/timeTrials.lua` · VM : Game Engine (GE) · 250 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/editor/raceEditor/timeTrials")` (fichier sous extensions/ mais pas une extension classique)

## Classe `C`

Le module renvoie un constructeur : `local obj = require("editor_raceEditor_timeTrials")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:changeField(field, new, add)` |  | 65 |
| `C:displayClassification(classification, name, field, tt)` |  | 148 |
| `C:draw()` |  | 58 |
| `C:drawGeneralInfo()` |  | 74 |
| `C:drawPrefabs(fieldName, default)` |  | 195 |
| `C:existsIcon(f, inPathFolder)` |  | 159 |
| `C:findPreview()` |  | 48 |
| `C:init(raceEditor)` |  | 24 |
| `C:selected()` |  | 32 |
| `C:setPath(path)` |  | 28 |
| `C:unselect()` |  | 56 |

## Appels vers le moteur (C++)

- `FS:` `fileExists`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/raceEditor/timeTrials.lua`.*
