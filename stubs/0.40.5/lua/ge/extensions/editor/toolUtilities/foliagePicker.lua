---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/foliagePicker.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_toolUtilities_foliagePicker` : `extensions.load("editor_toolUtilities_foliagePicker")`, puis la globale `editor_toolUtilities_foliagePicker`
---@class editor_toolUtilities_foliagePicker
editor_toolUtilities_foliagePicker = {}

--- Draws the picker for `target` (needs .species and .speciesWeights tables). opts:
---    id           unique imgui id suffix, required (e.g. 'ts', 'fze', 'plHatch')
---    height       listbox height in px (default 150)
---    onBeginEdit()          -> token   optional undo snapshot, captured before a mutation
---    onCommit(label, token)            optional history commit after a mutation
---    onChange()                        optional dirty mark after any mutation
---Source : lua/ge/extensions/editor/toolUtilities/foliagePicker.lua:53
---@param target any
---@param opts any
function editor_toolUtilities_foliagePicker.draw(target, opts) end

--- Cached species list, scanning lazily on first use.
---Source : lua/ge/extensions/editor/toolUtilities/foliagePicker.lua:32
function editor_toolUtilities_foliagePicker.getList() end

--- Rescans the level's ForestItemData into the shared cache.
---Source : lua/ge/extensions/editor/toolUtilities/foliagePicker.lua:26
function editor_toolUtilities_foliagePicker.refresh() end

--- Ticks a species (giving it a default weight) or unticks it.
---Source : lua/ge/extensions/editor/toolUtilities/foliagePicker.lua:38
---@param target any
---@param nm any
---@param on any
function editor_toolUtilities_foliagePicker.setTicked(target, nm, on) end

