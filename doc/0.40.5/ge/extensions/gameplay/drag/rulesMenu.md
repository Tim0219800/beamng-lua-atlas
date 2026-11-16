# `gameplay_drag_rulesMenu`

*File: `lua/ge/extensions/gameplay/drag/rulesMenu.lua` · VM: Game Engine (GE) · 204 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_drag_rulesMenu`: `extensions.load("gameplay_drag_rulesMenu")`, then the global `gameplay_drag_rulesMenu`

Context of the drag rules screen (Vue interface "mission.dragRules"). It finds the track associated with a facility (facility.id, with the "Rules" suffix removed), provides the UI with the options (heads-up/bracket dragType, .400/.500 tree, available timers, default and saved values) and saves or restores the chosen rules for a track. It also places a 12 m tether around the facility's door: the menu closes by itself if the player's vehicle moves away.

## Notes

- The rules are stored in an in-memory fallback presetManager (presetManagerFallback): the real multiplayer presetManager is commented out in getPresetManager. The rules therefore do not survive an extension or game reload through this module.
- Default rules: dragType 'headsUpRace', treeType '.500', importantTimerId 'time_1_4'.
- Timer types returned to the UI: 'velocity' or 'distanceTimer' (anything that is not 'velocity' becomes distanceTimer).
- The tether radius is POI_RADIUS = 12 m.

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_drag_rulesMenu.applyRulesRestore(levelId, stripId)` | Returns the saved rules of a track so that the UI can restore them (Restore button). | 192 |
| `gameplay_drag_rulesMenu.applyRulesSave(levelId, stripId, rules)` | Saves the rules of a track (UI Save button). Does nothing if an argument is missing. | 186 |
| `gameplay_drag_rulesMenu.closeMenu()` | Closes the rules context: removes the tether, forgets the facility and the track data. | 113 |
| `gameplay_drag_rulesMenu.getCurrentFacility()` | Facility opened via a facility POI. | 126 |
| `gameplay_drag_rulesMenu.getRulesScreenData(facilityIdOrStripId)` | Data for the Vue rules screen: levelId, stripId, stripName, location (level title), numLanes, timers (id, label, labelKey, shortLabel, type, distance), dragTypeOptions, treeTypeOptions, defaults (from the track) and saved (saved or created preset). | 136 |
| `gameplay_drag_rulesMenu.getSavedRulesForStrip(levelId, stripId)` | Saved rules of a track (dragType, treeType, importantTimerId), used by poi.applyUserRulesToData when starting from a POI. | 131 |
| `gameplay_drag_rulesMenu.isMenuOpen()` | True if the rules context is active. | 121 |
| `gameplay_drag_rulesMenu.onUpdate(dtReal, dtSim, dtRaw)` | Per-frame hook: closes the menu if the player's vehicle (player 0) leaves the 12 m tether (or no longer exists). *(internal)* *(hook)* | 197 |
| `gameplay_drag_rulesMenu.openMenu(facility)` | Opens the rules context for a facility: loads the data of the matching track and places the tether on the nearest door (freeroam_facilities). | 104 |

### Parameter details

#### `gameplay_drag_rulesMenu.applyRulesRestore(levelId, stripId)`

Returns the saved rules of a track so that the UI can restore them (Restore button).

- `levelId` (*string*) : Level identifier.
- `stripId` (*string*) : Track identifier.
- **returns**: table|nil {dragType, treeType, importantTimerId} or nil.

#### `gameplay_drag_rulesMenu.applyRulesSave(levelId, stripId, rules)`

Saves the rules of a track (UI Save button). Does nothing if an argument is missing.

- `levelId` (*string*) : Level identifier.
- `stripId` (*string*) : Track identifier.
- `rules` (*table*) : {dragType, treeType, importantTimerId}.

#### `gameplay_drag_rulesMenu.getCurrentFacility()`

Facility opened via a facility POI.

- **returns**: table|nil Facility or nil.

#### `gameplay_drag_rulesMenu.getRulesScreenData(facilityIdOrStripId)`

Data for the Vue rules screen: levelId, stripId, stripName, location (level title), numLanes, timers (id, label, labelKey, shortLabel, type, distance), dragTypeOptions, treeTypeOptions, defaults (from the track) and saved (saved or created preset).

- `facilityIdOrStripId` (*string*) : Facility identifier (e.g. 'alderStripRules') or track identifier.
- **returns**: table|nil Data, nil if the track is not found in the current level.

#### `gameplay_drag_rulesMenu.getSavedRulesForStrip(levelId, stripId)`

Saved rules of a track (dragType, treeType, importantTimerId), used by poi.applyUserRulesToData when starting from a POI.

- `levelId` (*string*) : Level identifier.
- `stripId` (*string*) : Track identifier.
- **returns**: table|nil Rules or nil.

#### `gameplay_drag_rulesMenu.isMenuOpen()`

True if the rules context is active.

- **returns**: boolean Whether the menu is open.

#### `gameplay_drag_rulesMenu.onUpdate(dtReal, dtSim, dtRaw)`

Per-frame hook: closes the menu if the player's vehicle (player 0) leaves the 12 m tether (or no longer exists).

- `dtReal` (*number*) : Real time delta (s).
- `dtSim` (*number*) : Simulated time delta (s).
- `dtRaw` (*number*) : Raw delta (s).

#### `gameplay_drag_rulesMenu.openMenu(facility)`

Opens the rules context for a facility: loads the data of the matching track and places the tether on the nearest door (freeroam_facilities).

- `facility` (*table*) : Facility (id field).

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | string[] | Empty list. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/drag/rulesMenu.lua`.*
