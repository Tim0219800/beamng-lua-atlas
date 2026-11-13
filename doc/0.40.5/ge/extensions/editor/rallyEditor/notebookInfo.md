# `editor_rallyEditor_notebookInfo`

*Fichier : `lua/ge/extensions/editor/rallyEditor/notebookInfo.lua` · VM : Game Engine (GE) · 242 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/editor/rallyEditor/notebookInfo")` (fichier sous extensions/ mais pas une extension classique)

## Classe `C`

Le module renvoie un constructeur : `local obj = require("editor_rallyEditor_notebookInfo")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:clearState()` |  | 34 |
| `C:draw(mouseInfo)` |  | 78 |
| `C:drawCalibrationMetadataFields()` |  | 142 |
| `C:drawGhostNotebook()` |  | 96 |
| `C:drawNotebook()` |  | 165 |
| `C:init(rallyEditor)` |  | 29 |
| `C:isValid()` |  | 42 |
| `C:selected()` | called by RallyEditor when this tab is selected. | 60 |
| `C:setPath(path)` |  | 55 |
| `C:unselect()` | called by RallyEditor when this tab is unselected. | 72 |
| `C:validate()` |  | 46 |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onEditorEditModeChanged` — écouté par 1 module(s)

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/rallyEditor/notebookInfo.lua`.*
