---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/foliagePicker.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Shared imgui species picker (level ForestItemData) for the editor's vegetation tools. Displays a checkbox list with a weight slider per checked species, plus buttons (check all, uncheck all, rescan). It reads and writes the tables target.species and target.speciesWeights.
--- Access: extension `editor_toolUtilities_foliagePicker`: `extensions.load("editor_toolUtilities_foliagePicker")`, then the global `editor_toolUtilities_foliagePicker`
---@class editor_toolUtilities_foliagePicker
editor_toolUtilities_foliagePicker = {}

--- Draws the picker for the target: checkbox list, weight sliders (0 to 1) and check all / uncheck all / rescan buttons. To be called every frame from a tool's imgui code.
---Source: lua/ge/extensions/editor/toolUtilities/foliagePicker.lua:53
---@param target table Target with the .species and .speciesWeights tables.
---@param opts table id (required, unique imgui id suffix), height (px), onBeginEdit() -> undo token, onCommit(label, token) for the history, onChange() to mark the state as modified.
function editor_toolUtilities_foliagePicker.draw(target, opts) end

--- Returns the cached species list, scanning it if it is empty.
---Source: lua/ge/extensions/editor/toolUtilities/foliagePicker.lua:32
---@return string[]  Names of the level's ForestItemData.
function editor_toolUtilities_foliagePicker.getList() end

--- Rescans the level's ForestItemData and fills the shared cache.
---Source: lua/ge/extensions/editor/toolUtilities/foliagePicker.lua:26
---@return string[]  List of species names.
function editor_toolUtilities_foliagePicker.refresh() end

--- Checks a species (with the default weight 1.0 if it has none) or unchecks it.
---Source: lua/ge/extensions/editor/toolUtilities/foliagePicker.lua:38
---@param target table Target with the species and speciesWeights tables.
---@param nm string Species name.
---@param on boolean true to check, false to uncheck.
function editor_toolUtilities_foliagePicker.setTicked(target, nm, on) end

