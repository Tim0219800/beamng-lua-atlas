# `editor_missionEditor_objectives`

*Fichier : `lua/ge/extensions/editor/missionEditor/objectives.lua` · VM : Game Engine (GE) · 587 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/editor/missionEditor/objectives")` (fichier sous extensions/ mais pas une extension classique)

## Classe `C`

Le module renvoie un constructeur : `local obj = require("editor_missionEditor_objectives")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:attributeDropdown()` |  | 171 |
| `C:draw()` |  | 505 |
| `C:drawAddReward(key, rewards)` |  | 219 |
| `C:drawAttributeInput(re, idx, key)` |  | 191 |
| `C:drawCareerSetup()` |  | 371 |
| `C:drawDefaultStar(defaultIndex)` |  | 148 |
| `C:drawOutroText(key)` |  | 328 |
| `C:drawRewardAmount(re, idx, key)` |  | 208 |
| `C:drawStarRewards(key)` |  | 268 |
| `C:getMissionIssues(m)` |  | 46 |
| `C:getStarLabel(key)` |  | 133 |
| `C:init(missionEditor)` |  | 20 |
| `C:setMission(mission)` |  | 113 |
| `C:starSlotSelector(key)` |  | 300 |

**Charge les extensions :** `career_branches`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/missionEditor/objectives.lua`.*
