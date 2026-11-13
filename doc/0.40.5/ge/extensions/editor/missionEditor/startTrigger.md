# `editor_missionEditor_startTrigger`

*Fichier : `lua/ge/extensions/editor/missionEditor/startTrigger.lua` · VM : Game Engine (GE) · 218 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/editor/missionEditor/startTrigger")` (fichier sous extensions/ mais pas une extension classique)

## Classe `C`

Le module renvoie un constructeur : `local obj = require("editor_missionEditor_startTrigger")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:draw()` |  | 158 |
| `C:getStartTriggerTransform()` |  | 203 |
| `C:init(missionEditor)` |  | 136 |
| `C:setMission(mission)` |  | 147 |

## Appels vers le moteur (C++)

- `debugDrawer:` `drawSphere`, `drawSquarePrism`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/missionEditor/startTrigger.lua`.*
