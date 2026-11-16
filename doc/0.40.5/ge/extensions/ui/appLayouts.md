# `ui_appLayouts`

*File: `lua/ge/extensions/ui/appLayouts.lua` · VM: Game Engine (GE) · 721 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_appLayouts`: `extensions.load("ui_appLayouts")`, then the global `ui_appLayouts`

Manages the interface app layouts: reading, creating, copying, renaming, deleting and resetting `*.uilayout.json` files, as well as adding, removing and moving apps in a layout. The original layouts are in `/settings/ui_apps/originalLayouts/`, the user's in `/settings/ui_apps/layouts/`. A layout type to file table is stored in `/temp/ui-layout-map.json`. Used by modders who want to change the displayed apps by code; the Vue editor relies on the same functions.

## Example

```lua
local layouts = ui_appLayouts.getAvailableLayouts()
for _, l in ipairs(layouts) do print(l.filename, l.type, l.title) end
ui_appLayouts.setUsedLayout('freeroam')
```

## Notes

- The official apps removed from the game (engineDebug, gravityApp, radioTest, simpleRpmDebug, replayAppV2) are filtered out of all layouts, including custom layouts; the `removedApps` list of an original layout is also used as an obsolescence list.
- App indices are 0-based on the JS side: removeApp, applyPlacementPatch and applySettingsPatch convert them to a 1-based Lua index. A string of the form "appName-<idx>" is also accepted (0-based idx).
- getAvailableLayouts updates the user files: if the original layout's `version` is newer, the user layout is replaced; otherwise the apps whose `appVersion` is newer are replaced or added. The file is then rewritten to disk.
- Each returned layout gets the fields `filename`, `resettable`, `userFileExists` and possibly `default` (if the path contains "default").
- addApp, removeApp and the patches write to disk without notification (silent write); saveLayout, createLayout, renameLayout, duplicateLayout, deleteLayout, resetLayout and setCurrentLayout notify `ui_apps.notifyLayoutsChanged`.
- The onCameraChanged hook sends `PlayerCameraModeChanged` to the UI; a walking player is reported as camera "unicycle".

**Dependencies (loaded first):** `ui_apps`

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_appLayouts.addApp(layoutId, appName, placement)` | Adds an app at the end of a layout, with optional placement. Refuses obsolete apps. | 528 |
| `ui_appLayouts.applyPlacementPatch(layoutId, appInstanceIdOrIndex, placement)` | Replaces the placement of an app in a layout and writes the file. | 573 |
| `ui_appLayouts.applySettingsPatch(layoutId, appInstanceIdOrIndex, settings)` | Replaces the settings of an app in a layout and writes the file. | 600 |
| `ui_appLayouts.clearLayoutForType(layoutType)` | Clears a type's layout preference. | 678 |
| `ui_appLayouts.createLayout(data)` | Creates a new layout. Without `filename`, a free name is derived from the title in the user folder. Default title "My Layout", default type "custom". | 455 |
| `ui_appLayouts.deleteLayout(filenameToDelete)` | Deletes a layout's file, unless it is part of the official content (a message is logged and nothing is deleted). | 267 |
| `ui_appLayouts.duplicateLayout(filename, newTitle)` | Copies a layout to a new file (title "<title> copy" by default), removing the `default` flag. | 497 |
| `ui_appLayouts.getAvailableLayouts()` | Lists all available layouts (originals without a user copy + user files), after updating the user files from the originals and filtering out removed apps. | 101 |
| `ui_appLayouts.getCurrentLayout()` | Returns the currently active layout (after filtering obsolete apps), or nil. | 355 |
| `ui_appLayouts.getLayoutForType(layoutType)` | Returns the layout file stored for a type. | 687 |
| `ui_appLayouts.getPlayerCameraModes()` | Returns the camera mode of each player (multi-seat); "unicycle" if the player is walking. | 643 |
| `ui_appLayouts.getTypeLayoutMap()` | Returns a copy of the layout type to file table. | 692 |
| `ui_appLayouts.isEditing()` | Indicates whether the edit mode is active. | 634 |
| `ui_appLayouts.onCameraChanged(player, camName)` | Hook called when a player's camera changes. Sends `PlayerCameraModeChanged` to the UI with `{player, name}`. *(internal)* *(hook)* | 657 |
| `ui_appLayouts.removeApp(layoutId, appInstanceIdOrIndex)` | Removes an app from a layout by index (0-based) or by "name-index" identifier. | 548 |
| `ui_appLayouts.renameLayout(filename, title)` | Changes a layout's title. Refuses layouts from the official content. | 482 |
| `ui_appLayouts.resetLayout(filenameToReset, layoutType)` | Resets a user layout by deleting its file, which makes the original reappear. Refuses files outside the user folder. | 299 |
| `ui_appLayouts.resetUsedLayout()` | Reloads the layout stored by setUsedLayout as the current layout. Returns the current layout as is if none was chosen. | 443 |
| `ui_appLayouts.saveLayout(data)` | Saves a layout to disk (`filename` field required) then notifies the consumers. | 261 |
| `ui_appLayouts.setCurrentLayout(layoutOrFilename)` | Sets the current layout from a file name or a layout table, then notifies the change. Returns nil if the file is not found. | 360 |
| `ui_appLayouts.setEditing(enabled)` | Enables or disables the layout edit mode. | 629 |
| `ui_appLayouts.setLayoutForType(layoutType, filename)` | Stores the layout to use for a layout type. | 665 |
| `ui_appLayouts.setUsedLayout(idOrType)` | Chooses the layout to use from a file name or a type. An explicit choice by file is stored as the type's preference, unless it is the type's default layout (the preference is then cleared). | 415 |

### Parameter details

#### `ui_appLayouts.addApp(layoutId, appName, placement)`

Adds an app at the end of a layout, with optional placement. Refuses obsolete apps.

- `layoutId` (*string*) : Layout file.
- `appName` (*string*) : App name.
- `placement` (*table|nil*) : Position and size of the app.
- **returns**: boolean true if added.

#### `ui_appLayouts.applyPlacementPatch(layoutId, appInstanceIdOrIndex, placement)`

Replaces the placement of an app in a layout and writes the file.

- `layoutId` (*string*) : Layout file.
- `appInstanceIdOrIndex` (*integer|string*) : 0-based index or "appName-<idx>".
- `placement` (*table*) : New placement.
- **returns**: boolean true if applied.

#### `ui_appLayouts.applySettingsPatch(layoutId, appInstanceIdOrIndex, settings)`

Replaces the settings of an app in a layout and writes the file.

- `layoutId` (*string*) : Layout file.
- `appInstanceIdOrIndex` (*integer|string*) : 0-based index or "appName-<idx>".
- `settings` (*table*) : New app settings.
- **returns**: boolean true if applied.

#### `ui_appLayouts.clearLayoutForType(layoutType)`

Clears a type's layout preference.

- `layoutType` (*string*) : Layout type.
- **returns**: boolean true if a preference existed.

#### `ui_appLayouts.createLayout(data)`

Creates a new layout. Without `filename`, a free name is derived from the title in the user folder. Default title "My Layout", default type "custom".

- `data` (*table|nil*) : Optional fields: title, type, apps, description, devonly, version, filename.
- **returns**: string|nil Created file name, nil if no name is available.

#### `ui_appLayouts.deleteLayout(filenameToDelete)`

Deletes a layout's file, unless it is part of the official content (a message is logged and nothing is deleted).

- `filenameToDelete` (*string*) : File to delete.
- **returns**: boolean true if the layout was found (even if the deletion was refused), false otherwise.

#### `ui_appLayouts.duplicateLayout(filename, newTitle)`

Copies a layout to a new file (title "<title> copy" by default), removing the `default` flag.

- `filename` (*string*) : Source layout file.
- `newTitle` (*string|nil*) : Title of the copy.
- **returns**: string|nil File name of the copy, nil on failure.

#### `ui_appLayouts.getAvailableLayouts()`

Lists all available layouts (originals without a user copy + user files), after updating the user files from the originals and filtering out removed apps.

- **returns**: table<integer, table> Layouts with `apps`, `title`, `type`, `filename`, `resettable`, `userFileExists`, `default`.

#### `ui_appLayouts.getCurrentLayout()`

Returns the currently active layout (after filtering obsolete apps), or nil.

- **returns**: table|nil Current layout.

#### `ui_appLayouts.getLayoutForType(layoutType)`

Returns the layout file stored for a type.

- `layoutType` (*string*) : Layout type.
- **returns**: string|nil File name, or nil.

#### `ui_appLayouts.getPlayerCameraModes()`

Returns the camera mode of each player (multi-seat); "unicycle" if the player is walking.

- **returns**: table<integer, table> List of `{player, name}`.

#### `ui_appLayouts.getTypeLayoutMap()`

Returns a copy of the layout type to file table.

- **returns**: table<string, string> Preferences by type.

#### `ui_appLayouts.isEditing()`

Indicates whether the edit mode is active.

- **returns**: boolean Edit mode state.

#### `ui_appLayouts.onCameraChanged(player, camName)`

Hook called when a player's camera changes. Sends `PlayerCameraModeChanged` to the UI with `{player, name}`.

- `player` (*integer|nil*) : Player index (0 by default).
- `camName` (*string|nil*) : Camera mode name.

#### `ui_appLayouts.removeApp(layoutId, appInstanceIdOrIndex)`

Removes an app from a layout by index (0-based) or by "name-index" identifier.

- `layoutId` (*string*) : Layout file.
- `appInstanceIdOrIndex` (*integer|string*) : 0-based index or "appName-<idx>".
- **returns**: boolean true if removed.

#### `ui_appLayouts.renameLayout(filename, title)`

Changes a layout's title. Refuses layouts from the official content.

- `filename` (*string*) : Layout file.
- `title` (*string*) : New title.
- **returns**: boolean true if renamed.

#### `ui_appLayouts.resetLayout(filenameToReset, layoutType)`

Resets a user layout by deleting its file, which makes the original reappear. Refuses files outside the user folder.

- `filenameToReset` (*string|nil*) : User file to reset.
- `layoutType` (*string|nil*) : Type used to find the original if the file has none.
- **returns**: string|boolean File name of the reset layout, or false on failure.

#### `ui_appLayouts.resetUsedLayout()`

Reloads the layout stored by setUsedLayout as the current layout. Returns the current layout as is if none was chosen.

- **returns**: table|nil Current layout.

#### `ui_appLayouts.saveLayout(data)`

Saves a layout to disk (`filename` field required) then notifies the consumers.

- `data` (*table*) : Layout to write, with `filename`.

#### `ui_appLayouts.setCurrentLayout(layoutOrFilename)`

Sets the current layout from a file name or a layout table, then notifies the change. Returns nil if the file is not found.

- `layoutOrFilename` (*string|table*) : Layout file path or layout table.
- **returns**: table|nil The current layout.

#### `ui_appLayouts.setEditing(enabled)`

Enables or disables the layout edit mode.

- `enabled` (*boolean*) : New state.
- **returns**: boolean Stored state.

#### `ui_appLayouts.setLayoutForType(layoutType, filename)`

Stores the layout to use for a layout type.

- `layoutType` (*string*) : Layout type.
- `filename` (*string*) : Layout file (must exist).
- **returns**: boolean true if saved.

#### `ui_appLayouts.setUsedLayout(idOrType)`

Chooses the layout to use from a file name or a type. An explicit choice by file is stored as the type's preference, unless it is the type's default layout (the preference is then cleared).

- `idOrType` (*string*) : Layout file name or layout type.
- **returns**: table|nil Activated layout, nil if not found.

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | table<integer, string> | Extensions loaded before: `{'ui_apps'}`. |

**UI events (guihooks.trigger):** `PlayerCameraModeChanged`

## Calls into the engine (C++)

- `FS:` `fileExists`, `findFiles`, `removeFile`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/appLayouts.lua`.*
