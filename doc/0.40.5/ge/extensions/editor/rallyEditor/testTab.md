# `editor_rallyEditor_testTab`

*Fichier : `lua/ge/extensions/editor/rallyEditor/testTab.lua` · VM : Game Engine (GE) · 83 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/editor/rallyEditor/testTab")` (fichier sous extensions/ mais pas une extension classique)

## Classe `C`

Le module renvoie un constructeur : `local obj = require("editor_rallyEditor_testTab")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:draw()` |  | 42 |
| `C:drawDebugEntrypoint()` |  | 71 |
| `C:init(rallyEditor)` |  | 13 |
| `C:selected()` | called by RallyEditor when this tab is selected. | 25 |
| `C:setPath(path)` |  | 20 |
| `C:test1()` |  | 64 |
| `C:unselect()` | called by RallyEditor when this tab is unselected. | 36 |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onEditorEditModeChanged` — écouté par 1 module(s)

**Charge les extensions :** `gameplay_rally_recceApp`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/rallyEditor/testTab.lua`.*
