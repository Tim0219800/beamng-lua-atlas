# `editor_rallyEditor_missionTab`

*Fichier : `lua/ge/extensions/editor/rallyEditor/missionTab.lua` · VM : Game Engine (GE) · 116 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/editor/rallyEditor/missionTab")` (fichier sous extensions/ mais pas une extension classique)

## Classe `C`

Le module renvoie un constructeur : `local obj = require("editor_rallyEditor_missionTab")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:draw(mouseInfo)` |  | 45 |
| `C:init(rallyEditor)` |  | 14 |
| `C:selected()` |  | 22 |
| `C:setPath(path)` |  | 18 |
| `C:unselect()` |  | 26 |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onEditorEditModeChanged` — écouté par 1 module(s)

## Appels vers le moteur (C++)

- `FS:` `directoryExists`, `fileExists`, `findFiles`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/rallyEditor/missionTab.lua`.*
