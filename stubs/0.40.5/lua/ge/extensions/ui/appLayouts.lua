---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/appLayouts.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Manages the interface app layouts: reading, creating, copying, renaming, deleting and resetting `*.uilayout.json` files, as well as adding, removing and moving apps in a layout. The original layouts are in `/settings/ui_apps/originalLayouts/`, the user's in `/settings/ui_apps/layouts/`. A layout type to file table is stored in `/temp/ui-layout-map.json`. Used by modders who want to change the displayed apps by code; the Vue editor relies on the same functions.
--- Access: extension `ui_appLayouts`: `extensions.load("ui_appLayouts")`, then the global `ui_appLayouts`
---@class ui_appLayouts
---@field dependencies table<integer, string> Extensions loaded before: `{'ui_apps'}`.
ui_appLayouts = {}

--- Adds an app at the end of a layout, with optional placement. Refuses obsolete apps.
---Source: lua/ge/extensions/ui/appLayouts.lua:528
---@param layoutId string Layout file.
---@param appName string App name.
---@param placement table|nil Position and size of the app.
---@return boolean  true if added.
function ui_appLayouts.addApp(layoutId, appName, placement) end

--- Replaces the placement of an app in a layout and writes the file.
---Source: lua/ge/extensions/ui/appLayouts.lua:573
---@param layoutId string Layout file.
---@param appInstanceIdOrIndex integer|string 0-based index or "appName-<idx>".
---@param placement table New placement.
---@return boolean  true if applied.
function ui_appLayouts.applyPlacementPatch(layoutId, appInstanceIdOrIndex, placement) end

--- Replaces the settings of an app in a layout and writes the file.
---Source: lua/ge/extensions/ui/appLayouts.lua:600
---@param layoutId string Layout file.
---@param appInstanceIdOrIndex integer|string 0-based index or "appName-<idx>".
---@param settings table New app settings.
---@return boolean  true if applied.
function ui_appLayouts.applySettingsPatch(layoutId, appInstanceIdOrIndex, settings) end

--- Clears a type's layout preference.
---Source: lua/ge/extensions/ui/appLayouts.lua:678
---@param layoutType string Layout type.
---@return boolean  true if a preference existed.
function ui_appLayouts.clearLayoutForType(layoutType) end

--- Creates a new layout. Without `filename`, a free name is derived from the title in the user folder. Default title "My Layout", default type "custom".
---Source: lua/ge/extensions/ui/appLayouts.lua:455
---@param data table|nil Optional fields: title, type, apps, description, devonly, version, filename.
---@return string|nil  Created file name, nil if no name is available.
function ui_appLayouts.createLayout(data) end

--- Deletes a layout's file, unless it is part of the official content (a message is logged and nothing is deleted).
---Source: lua/ge/extensions/ui/appLayouts.lua:267
---@param filenameToDelete string File to delete.
---@return boolean  true if the layout was found (even if the deletion was refused), false otherwise.
function ui_appLayouts.deleteLayout(filenameToDelete) end

--- Copies a layout to a new file (title "<title> copy" by default), removing the `default` flag.
---Source: lua/ge/extensions/ui/appLayouts.lua:497
---@param filename string Source layout file.
---@param newTitle string|nil Title of the copy.
---@return string|nil  File name of the copy, nil on failure.
function ui_appLayouts.duplicateLayout(filename, newTitle) end

--- Lists all available layouts (originals without a user copy + user files), after updating the user files from the originals and filtering out removed apps.
---Source: lua/ge/extensions/ui/appLayouts.lua:101
---@return table<integer, table>  Layouts with `apps`, `title`, `type`, `filename`, `resettable`, `userFileExists`, `default`.
function ui_appLayouts.getAvailableLayouts() end

--- Returns the currently active layout (after filtering obsolete apps), or nil.
---Source: lua/ge/extensions/ui/appLayouts.lua:355
---@return table|nil  Current layout.
function ui_appLayouts.getCurrentLayout() end

--- Returns the layout file stored for a type.
---Source: lua/ge/extensions/ui/appLayouts.lua:687
---@param layoutType string Layout type.
---@return string|nil  File name, or nil.
function ui_appLayouts.getLayoutForType(layoutType) end

--- Returns the camera mode of each player (multi-seat); "unicycle" if the player is walking.
---Source: lua/ge/extensions/ui/appLayouts.lua:643
---@return table<integer, table>  List of `{player, name}`.
function ui_appLayouts.getPlayerCameraModes() end

--- Returns a copy of the layout type to file table.
---Source: lua/ge/extensions/ui/appLayouts.lua:692
---@return table<string, string>  Preferences by type.
function ui_appLayouts.getTypeLayoutMap() end

--- Indicates whether the edit mode is active.
---Source: lua/ge/extensions/ui/appLayouts.lua:634
---@return boolean  Edit mode state.
function ui_appLayouts.isEditing() end

--- Hook called when a player's camera changes. Sends `PlayerCameraModeChanged` to the UI with `{player, name}`.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/appLayouts.lua:657
---@param player integer|nil Player index (0 by default).
---@param camName string|nil Camera mode name.
function ui_appLayouts.onCameraChanged(player, camName) end

--- Removes an app from a layout by index (0-based) or by "name-index" identifier.
---Source: lua/ge/extensions/ui/appLayouts.lua:548
---@param layoutId string Layout file.
---@param appInstanceIdOrIndex integer|string 0-based index or "appName-<idx>".
---@return boolean  true if removed.
function ui_appLayouts.removeApp(layoutId, appInstanceIdOrIndex) end

--- Changes a layout's title. Refuses layouts from the official content.
---Source: lua/ge/extensions/ui/appLayouts.lua:482
---@param filename string Layout file.
---@param title string New title.
---@return boolean  true if renamed.
function ui_appLayouts.renameLayout(filename, title) end

--- Resets a user layout by deleting its file, which makes the original reappear. Refuses files outside the user folder.
---Source: lua/ge/extensions/ui/appLayouts.lua:299
---@param filenameToReset string|nil User file to reset.
---@param layoutType string|nil Type used to find the original if the file has none.
---@return string|boolean  File name of the reset layout, or false on failure.
function ui_appLayouts.resetLayout(filenameToReset, layoutType) end

--- Reloads the layout stored by setUsedLayout as the current layout. Returns the current layout as is if none was chosen.
---Source: lua/ge/extensions/ui/appLayouts.lua:443
---@return table|nil  Current layout.
function ui_appLayouts.resetUsedLayout() end

--- Saves a layout to disk (`filename` field required) then notifies the consumers.
---Source: lua/ge/extensions/ui/appLayouts.lua:261
---@param data table Layout to write, with `filename`.
function ui_appLayouts.saveLayout(data) end

--- Sets the current layout from a file name or a layout table, then notifies the change. Returns nil if the file is not found.
---Source: lua/ge/extensions/ui/appLayouts.lua:360
---@param layoutOrFilename string|table Layout file path or layout table.
---@return table|nil  The current layout.
function ui_appLayouts.setCurrentLayout(layoutOrFilename) end

--- Enables or disables the layout edit mode.
---Source: lua/ge/extensions/ui/appLayouts.lua:629
---@param enabled boolean New state.
---@return boolean  Stored state.
function ui_appLayouts.setEditing(enabled) end

--- Stores the layout to use for a layout type.
---Source: lua/ge/extensions/ui/appLayouts.lua:665
---@param layoutType string Layout type.
---@param filename string Layout file (must exist).
---@return boolean  true if saved.
function ui_appLayouts.setLayoutForType(layoutType, filename) end

--- Chooses the layout to use from a file name or a type. An explicit choice by file is stored as the type's preference, unless it is the type's default layout (the preference is then cleared).
---Source: lua/ge/extensions/ui/appLayouts.lua:415
---@param idOrType string Layout file name or layout type.
---@return table|nil  Activated layout, nil if not found.
function ui_appLayouts.setUsedLayout(idOrType) end

