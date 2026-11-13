# `editor_rallyEditor_recceTab`

*Fichier : `lua/ge/extensions/editor/rallyEditor/recceTab.lua` · VM : Game Engine (GE) · 174 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/editor/rallyEditor/recceTab")` (fichier sous extensions/ mais pas une extension classique)

## Classe `C`

Le module renvoie un constructeur : `local obj = require("editor_rallyEditor_recceTab")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:downsample()` |  | 54 |
| `C:draw(mouseInfo)` |  | 156 |
| `C:drawDebugEntrypoint(mouseInfo)` |  | 161 |
| `C:drawSectionV3()` |  | 59 |
| `C:formatDistance(dist)` |  | 43 |
| `C:import()` |  | 147 |
| `C:init(rallyEditor)` |  | 14 |
| `C:refresh()` |  | 138 |
| `C:selected()` | called by RallyEditor when this tab is selected. | 29 |
| `C:setPath(path)` |  | 24 |
| `C:unselect()` | called by RallyEditor when this tab is unselected. | 37 |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onEditorEditModeChanged` — écouté par 1 module(s)

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/rallyEditor/recceTab.lua`.*
