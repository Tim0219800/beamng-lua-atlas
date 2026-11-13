# `editor_rallyEditor_voicepacksTab`

*Fichier : `lua/ge/extensions/editor/rallyEditor/voicepacksTab.lua` · VM : Game Engine (GE) · 291 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/editor/rallyEditor/voicepacksTab")` (fichier sous extensions/ mais pas une extension classique)

## Classe `C`

Le module renvoie un constructeur : `local obj = require("editor_rallyEditor_voicepacksTab")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:draw(mouseInfo)` |  | 255 |
| `C:drawGlobalVoicepacks(missionDir)` |  | 241 |
| `C:drawMissionLocalVoicepacks(missionDir)` |  | 248 |
| `C:drawPickers(missionDir)` |  | 130 |
| `C:init(rallyEditor)` |  | 20 |
| `C:selected()` |  | 29 |
| `C:setPath(path)` |  | 25 |
| `C:unselect()` |  | 33 |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onEditorEditModeChanged` — écouté par 1 module(s)

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/rallyEditor/voicepacksTab.lua`.*
