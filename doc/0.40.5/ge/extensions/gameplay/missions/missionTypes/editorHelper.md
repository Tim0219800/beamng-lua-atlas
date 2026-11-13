# `gameplay_missions_missionTypes_editorHelper`

*Fichier : `lua/ge/extensions/gameplay/missions/missionTypes/editorHelper.lua` · VM : Game Engine (GE) · 1310 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/gameplay/missions/missionTypes/editorHelper")` (fichier sous extensions/ mais pas une extension classique)

## Classe `C`

Le module renvoie un constructeur : `local obj = require("gameplay_missions_missionTypes_editorHelper")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:addBool(label, fieldName, defaultValue, hideElementList, displayOptions)` |  | 32 |
| `C:addCustomElement(label, getNewFunction, setMissionFunction, drawFunction)` |  | 19 |
| `C:addDecoDummy(height)` |  | 197 |
| `C:addDecoHeader(text, color)` |  | 193 |
| `C:addDecoSeparator()` |  | 195 |
| `C:addDecoSpacer()` |  | 196 |
| `C:addDecoText(text, tooltip)` |  | 194 |
| `C:addDropdown(label, fieldName, values, defaultValue, valueTooltips)` |  | 166 |
| `C:addElement(element)` |  | 198 |
| `C:addFile(label, fieldName, defaultValue, allowedExtensions, displayOptions)` |  | 104 |
| `C:addFixedFile(label, filepathsInMissionfolder, displayOptions)` |  | 113 |
| `C:addLeaderboard(label, fieldName, defaultCount, defaultBest, defaultMedium, defaultWorst)` |  | 141 |
| `C:addMissionId(label, fieldName, defaultValue, displayOptions)` |  | 176 |
| `C:addModelConfig(label, fieldName, defaultModel, defaultConfig, displayOptions)` | function C:addModelConfig(label, fieldName, defaultModel, defaultConfig) | 93 |
| `C:addNumeric(label, fieldName, defaultValue, displayOptions)` |  | 22 |
| `C:addRace(label, fieldName, defaultValue, ...)` |  | 125 |
| `C:addReward(label, fieldName, defaultValue)` |  | 161 |
| `C:addSimpleLapConfig(label, fieldName, displayOptions)` |  | 130 |
| `C:addSites(label, fieldName, defaultValue)` |  | 136 |
| `C:addString(label, fieldName, defaultValue, len, displayOptions)` |  | 26 |
| `C:addTransform(label, fieldName, valueOptions, displayOptions)` | function C:addTransform(label, fieldName, {defaultPos, defaultRot, defaultScl, hasPos, hasRot, hasScl, oneDimScale}, {drawMode, drawColor, ...}) | 55 |
| `C:checkMission(m, fix)` |  | 374 |
| `C:clear()` |  | 211 |
| `C:draw(filterOptions)` |  | 1024 |
| `C:drawAxisBox(corner, x, y, z, clr)` |  | 1179 |
| `C:drawTransformAsSphereDir(e)` |  | 1066 |
| `C:drawTransformAsVehicle(e)` | other helper functions | 1105 |
| `C:editingAnyTransform()` |  | 1011 |
| `C:getAllFieldNames()` |  | 1278 |
| `C:getNewData()` |  | 256 |
| `C:setAutoAdditionalAttributes(key, auto)` |  | 1288 |
| `C:setMission(m)` |  | 297 |
| `C:updateMouseInfo(mission)` |  | 946 |

## Appels vers le moteur (C++)

- `FS:` `fileExists`, `findFiles`
- `Sim.` `getUniqueName`
- `debugDrawer:` `drawLine`, `drawSphere`, `drawSquarePrism`, `drawTextAdvanced`, `drawTriSolid`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/missions/missionTypes/editorHelper.lua`.*
