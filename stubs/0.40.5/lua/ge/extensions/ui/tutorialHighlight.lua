---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/tutorialHighlight.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Manages the list of interface elements to highlight during a tutorial. Each element is identified by an id (string); the state (ids in order of appearance, options, revision) is broadcast to the UI via the `tutorialHighlight` stream (guihooks.triggerStream). A modder or a tutorial script calls show/hide to turn a marker on or off.
--- Access: extension `ui_tutorialHighlight`: `extensions.load("ui_tutorialHighlight")`, then the global `ui_tutorialHighlight`
---@class ui_tutorialHighlight
ui_tutorialHighlight = {}

--- Returns the current stream payload.
---Source: lua/ge/extensions/ui/tutorialHighlight.lua:17
---@return table  { ids = string[], options = table<string, table>, revision = integer }
function ui_tutorialHighlight.getState() end

--- Removes the id from the highlight and broadcasts the state.
---Source: lua/ge/extensions/ui/tutorialHighlight.lua:65
---@param id string Identifier of the element.
---@return boolean  true if the id was active.
function ui_tutorialHighlight.hide(id) end

--- Removes all highlights and broadcasts the state.
---Source: lua/ge/extensions/ui/tutorialHighlight.lua:85
---@return boolean  false if nothing was active.
function ui_tutorialHighlight.hideAll() end

--- Initialization hook on extension creation: sets the unload mode to "manual".
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/tutorialHighlight.lua:100
function ui_tutorialHighlight.onInit() end

--- Hook called when the UI is ready: rebroadcasts the current state.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/tutorialHighlight.lua:96
function ui_tutorialHighlight.onUiReady() end

--- Enables the highlight of the id (appended at the end of the order if new), stores its options and broadcasts the state.
---Source: lua/ge/extensions/ui/tutorialHighlight.lua:44
---@param id string Non-empty identifier of the element.
---@param options table|nil {focus = boolean, scroll = boolean}.
---@return boolean  true if the id was just added; false if it was already active or if the id is invalid.
function ui_tutorialHighlight.show(id, options) end

