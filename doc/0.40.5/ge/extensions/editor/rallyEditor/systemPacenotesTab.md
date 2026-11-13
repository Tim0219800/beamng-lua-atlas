# `editor_rallyEditor_systemPacenotesTab`

*Fichier : `lua/ge/extensions/editor/rallyEditor/systemPacenotesTab.lua` · VM : Game Engine (GE) · 204 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/editor/rallyEditor/systemPacenotesTab")` (fichier sous extensions/ mais pas une extension classique)

## Classe `C`

Le module renvoie un constructeur : `local obj = require("editor_rallyEditor_systemPacenotesTab")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:clearState()` |  | 18 |
| `C:draw(mouseInfo)` |  | 122 |
| `C:init(rallyEditor)` |  | 11 |
| `C:selected()` | called by RallyEditor when this tab is selected. | 36 |
| `C:setPath(path)` | this is the notebook. why am I still calling it a path??? | 25 |
| `C:unselect()` | called by RallyEditor when this tab is unselected. | 50 |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onEditorEditModeChanged` — écouté par 1 module(s)

## Appels vers le moteur (C++)

- `FS:` `fileExists`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/rallyEditor/systemPacenotesTab.lua`.*
