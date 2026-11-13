# `editor_util_editorElementHelper`

*Fichier : `lua/ge/extensions/editor/util/editorElementHelper.lua` · VM : Game Engine (GE) · 1563 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/editor/util/editorElementHelper")` (fichier sous extensions/ mais pas une extension classique)

## Classe `C`

Le module renvoie un constructeur : `local obj = require("editor_util_editorElementHelper")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:addBigDecoHeader(text, color)` |  | 240 |
| `C:addBool(label, fieldName, defaultValue, hideElementList, displayOptions)` |  | 35 |
| `C:addContainerId(label, fieldName, idType, defaultValue, displayOptions)` |  | 212 |
| `C:addCustomElement(label, getNewFunction, setContainerFunction, drawFunction)` |  | 22 |
| `C:addDecoDummy(height)` |  | 245 |
| `C:addDecoHeader(text, color)` |  | 241 |
| `C:addDecoSeparator()` |  | 243 |
| `C:addDecoSpacer()` |  | 244 |
| `C:addDecoText(text, tooltip)` |  | 242 |
| `C:addDropdown(label, fieldName, values, defaultValue, valueTooltips)` |  | 177 |
| `C:addElement(element)` |  | 246 |
| `C:addFile(label, fieldName, defaultValue, allowedExtensions, displayOptions)` |  | 107 |
| `C:addFixedFile(label, filepathsInfolder, displayOptions)` |  | 120 |
| `C:addLeaderboard(label, fieldName, defaultCount, defaultBest, defaultMedium, defaultWorst)` |  | 152 |
| `C:addModelConfig(label, fieldName, defaultModel, defaultConfig, displayOptions)` | function C:addModelConfig(label, fieldName, defaultModel, defaultConfig) | 96 |
| `C:addNumeric(label, fieldName, defaultValue, displayOptions)` |  | 25 |
| `C:addRace(label, fieldName, defaultValue, ...)` |  | 136 |
| `C:addReward(label, fieldName, defaultValue)` |  | 172 |
| `C:addSimpleLapConfig(label, fieldName, displayOptions)` |  | 141 |
| `C:addSites(label, fieldName, defaultValue)` |  | 147 |
| `C:addString(label, fieldName, defaultValue, len, displayOptions)` |  | 29 |
| `C:addTransform(label, fieldName, valueOptions, displayOptions)` | function C:addTransform(label, fieldName, {defaultPos, defaultRot, defaultScl, hasPos, hasRot, hasScl, oneDimScale}, {drawMode, drawColor, ...}) | 58 |
| `C:addVehicleFilter(label, fieldName, displayOptions)` |  | 187 |
| `C:addZoneSelector(label, fieldName, globalInfoFolderFieldName, displayOptions)` |  | 217 |
| `C:checkContainer(c, fix, tags)` |  | 496 |
| `C:clear()` |  | 259 |
| `C:draw(filterOptions)` |  | 1287 |
| `C:drawAxisBox(corner, x, y, z, clr)` |  | 1420 |
| `C:drawTransformAsSphereDir(e)` |  | 1327 |
| `C:drawTransformAsVehicle(e)` | other helper functions | 1346 |
| `C:editingAnyTransform()` |  | 1271 |
| `C:getAllFieldNames()` |  | 1519 |
| `C:getNewData()` |  | 327 |
| `C:setAutoAdditionalAttributes(key, auto)` |  | 1529 |
| `C:setContainer(c)` |  | 380 |
| `C:updateMouseInfo(container)` |  | 1203 |

## Appels vers le moteur (C++)

- `FS:` `fileExists`, `findFiles`
- `Sim.` `getUniqueName`
- `debugDrawer:` `drawLine`, `drawSphere`, `drawSquarePrism`, `drawTextAdvanced`, `drawTriSolid`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/util/editorElementHelper.lua`.*
