# `gameplay_missions_missionTypes_editorHelper`

*File: `lua/ge/extensions/gameplay/missions/missionTypes/editorHelper.lua` · VM: Game Engine (GE) · 1310 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/gameplay/missions/missionTypes/editorHelper")` (file under extensions/ but not a regular extension)

Base class for writing the editor of a mission type in the game's editor (imgui interface). A mission type declares its missionTypeData fields with addXxx methods (number, text, boolean, 3D transform, vehicle model/config, file, race, leaderboard, dropdown...); the helper can then provide the default values (getNewData), load a mission (setMission), check its fields (checkMission), draw the widgets and the 3D gizmos (draw). The module returns a factory `function(derivedClass, ...)` that creates the object, copies the keys of the derived class, initializes elements and autoAdditionalAttributes then calls init() if it exists.

## Example

```lua
-- editor.lua of a mission type (old style)
local C = {}
function C:init()
  self:addNumeric('Laps', 'laps', 3)
  self:addTransform('Start', 'start', {hasScl=false}, {drawMode='vehicle'})
end
return function() return gameplay_missions_missions.editorHelper(C) end
```

## Notes

- Each element is a table {type, label, fieldName, displayOptions, ...}. addElement gives them a unique _id and converts displayOptions.associatedStars (string) into a table {key=true}.
- A multi-field element writes several keys in missionTypeData: transform -> <fieldName>Pos / Rot / Scl; modelconfig -> <fieldName>Model / Config / ConfigPath; leaderboard -> <fieldName>BestResult / MediumResult / WorstResult (and Count on the interface side).
- Severities of checkMission problems: "error" for a missing field, different type or model/config/file not found; "warning" for an extra field (fixable = true).
- Bug: newDataFunctions.reward and newDataFunctions.simpleLapConfig equal `defaultValue`, a variable undefined at this point (nil): these two types therefore have no default value in getNewData nor a check in checkMission (treated as nop). SetMission functions exist for them.
- Bug: missionIdSetMission reads `mtd.value` instead of `mtd[e.fieldName]`: a missionId field is never reloaded from the mission.
- The colors defaultColors.default / orange / red are built with 5 components (e.g. ImVec4(1,0.6,0,8,0.75)), a sign of a typo (0.8 expected); only the first 4 are taken into account.
- gameplay_missions_missions.editorHelper(C, ...) does not return this file but editor/util/editorElementHelper (context 'mission'); this module is only used by direct calls (e.g. editor/missionEditor/genericTypeData.lua).

## Class `C`

Mission type editor class. Instance fields: elements (ordered list), autoAdditionalAttributes, mission (mission being edited), mouseInfo (mouse state for the gizmos).

The module returns a constructor: `local obj = require("gameplay_missions_missionTypes_editorHelper")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:addBool(label, fieldName, defaultValue, hideElementList, displayOptions)` | Checkbox; default false. If hideElementList is given, these elements are moved right after it and hidden when the checkbox is unchecked. | 32 |
| `C:addCustomElement(label, getNewFunction, setMissionFunction, drawFunction)` | Adds a custom element managed by your own functions. | 19 |
| `C:addDecoDummy(height)` | Decoration: vertical space of given height (1 by default). | 197 |
| `C:addDecoHeader(text, color)` | Decoration: colored title (default, orange, red, green, blue, white, black). | 193 |
| `C:addDecoSeparator()` | Decoration: separator line. | 195 |
| `C:addDecoSpacer()` | Decoration: 4-pixel vertical space. | 196 |
| `C:addDecoText(text, tooltip)` | Decoration: text line with optional tooltip. | 194 |
| `C:addDropdown(label, fieldName, values, defaultValue, valueTooltips)` | Dropdown list of values; if the list is empty, it contains "issues Values!". Default: first element. | 166 |
| `C:addElement(element)` | Adds an already built element to the list (assigns _id, normalizes displayOptions). All addXxx methods go through it and return the element. | 198 |
| `C:addFile(label, fieldName, defaultValue, allowedExtensions, displayOptions)` | File path with file selector. | 104 |
| `C:addFixedFile(label, filepathsInMissionfolder, displayOptions)` | File expected at a fixed name in the mission folder (a string, or a list of which one of the files is required). Stores no value. | 113 |
| `C:addLeaderboard(label, fieldName, defaultCount, defaultBest, defaultMedium, defaultWorst)` | Leaderboard settings: number of entries and reference results best / medium / worst. Defaults: 10, 80, 120, 200. | 141 |
| `C:addMissionId(label, fieldName, defaultValue, displayOptions)` | Field containing the id of another mission; default "(none)". | 176 |
| `C:addModelConfig(label, fieldName, defaultModel, defaultConfig, displayOptions)` | Vehicle choice (model + configuration). Default: model "sbr", config "TT_RWD_S_M". Stored in <fieldName>Model / Config / ConfigPath. | 93 |
| `C:addNumeric(label, fieldName, defaultValue, displayOptions)` | Numeric (float) field; default 0. | 22 |
| `C:addRace(label, fieldName, defaultValue, ...)` | Race file (addFile filtered on *.path.json) of type "race". | 125 |
| `C:addReward(label, fieldName, defaultValue)` | Numeric field of type "reward". | 161 |
| `C:addSimpleLapConfig(label, fieldName, displayOptions)` | Simple lap configuration (editor/util/lapConfigUtil tool). | 130 |
| `C:addSites(label, fieldName, defaultValue)` | Sites file (addFile filtered on *.sites.json) of type "sites". | 136 |
| `C:addString(label, fieldName, defaultValue, len, displayOptions)` | Text field (1024-character buffer by default); default empty string. | 26 |
| `C:addTransform(label, fieldName, valueOptions, displayOptions)` | Position / rotation / scale editable in the 3D world (transformUtil gizmo). Stored in <fieldName>Pos, <fieldName>Rot, <fieldName>Scl. | 55 |
| `C:checkMission(m, fix)` | Checks missionTypeData against the elements: missing fields, different types, extra fields, nonexistent models/configs/files. Returns the list of problems {label, severity, fixable, data}. | 374 |
| `C:clear()` | Empties the list of elements. | 211 |
| `C:draw(filterOptions)` | Draws all elements (imgui widgets and 3D gizmos); marks mission._dirty when a value changes. filterOptions.onlyStar limits the display to the elements associated with a star. | 1024 |
| `C:drawAxisBox(corner, x, y, z, clr)` | Draws a box aligned on three axes from a corner with debugDrawer. | 1179 |
| `C:drawTransformAsSphereDir(e)` | Draws a transform as a sphere with a direction arrow. | 1066 |
| `C:drawTransformAsVehicle(e)` | Draws a transform as a vehicle box (other drawing helper functions). | 1105 |
| `C:editingAnyTransform()` | Returns whether a transform (of an element or of the start trigger) is being edited. | 1011 |
| `C:getAllFieldNames()` | Lists all missionTypeData fields handled by the editor, with their type. | 1278 |
| `C:getNewData()` | Builds the default missionTypeData table of a new mission by gathering the default values of all elements. | 256 |
| `C:setAutoAdditionalAttributes(key, auto)` | Enables or disables the automatic generation of an additional mission attribute. | 1288 |
| `C:setMission(m)` | Loads a mission into the editor: stores self.mission and updates each widget from mission.missionTypeData, then calls valueChangedCallback. | 297 |
| `C:updateMouseInfo(mission)` | Updates mouseInfo: camera position, ray and ray hit under the mouse (forest collision disabled during the cast), click/hold/release state, hovered element. | 946 |

## Calls into the engine (C++)

- `FS:` `fileExists`, `findFiles`
- `Sim.` `getUniqueName`
- `debugDrawer:` `drawLine`, `drawSphere`, `drawSquarePrism`, `drawTextAdvanced`, `drawTriSolid`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/missions/missionTypes/editorHelper.lua`.*
