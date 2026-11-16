---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/session.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Shared session save and load helper for the editor's custom spline and zone tools. It handles what is identical for all tools: the portable JSON envelope (version, tool, mapName, items or state, globals, records), file reading/writing, the load loop in replace or merge mode, the Save / Save As / Load buttons at the top of the window and the Replace/Merge modal window. Everything tool-specific goes through a spec table. Wiring reference: heroRoadEditor and roadSpline.
--- Access: extension `editor_toolUtilities_session`: `extensions.load("editor_toolUtilities_session")`, then the global `editor_toolUtilities_session`
---@class editor_toolUtilities_session
editor_toolUtilities_session = {}

--- Returns the file the document is attached to and whether it has unsaved changes.
---Source: lua/ge/extensions/editor/toolUtilities/session.lua:109
---@param toolId string Tool identifier.
---@return table  { path = string|nil, dirty = true|nil }
function editor_toolUtilities_session.attachment(toolId) end

--- Returns only the bound path, for per-frame calls that must not allocate a table.
---Source: lua/ge/extensions/editor/toolUtilities/session.lua:114
---@param toolId string Tool identifier.
---@return string|nil  Path of the bound file.
function editor_toolUtilities_session.boundPath(toolId) end

--- Deep copy of an item via the string.buffer codec (encode then decode), optionally with keys replaced by {} or removed. Used to write serializeItem without mutating the live item.
---Source: lua/ge/extensions/editor/toolUtilities/session.lua:138
---@param item table Item to copy.
---@param emptyKeys string[]|nil Keys to replace with an empty table.
---@param nilKeys string[]|nil Keys to remove.
---@return table  Clean copy.
function editor_toolUtilities_session.itemToTable(item, emptyKeys, nilKeys) end

--- Reads the JSON file then applies spec.loadJson if it exists, otherwise the module's loadJson.
---Source: lua/ge/extensions/editor/toolUtilities/session.lua:209
---@param path string File path.
---@param spec table Tool specification.
---@param replace boolean true to replace, false to merge.
---@return boolean  ok.
---@return integer|string  Number of items or error.
---@return boolean|nil  keepUnbound (partial file) when spec.loadJson returns it.
function editor_toolUtilities_session.loadFromFile(path, spec, replace) end

--- Applies an already decoded session JSON. replace first clears the current items (and applies globals/records); otherwise the loaded items are merged, an id already in use receiving a new UUID. For a global-state tool, passes state to spec.loadWhole.
---Source: lua/ge/extensions/editor/toolUtilities/session.lua:183
---@param j table Decoded JSON.
---@param spec table Tool specification.
---@param replace boolean true to replace, false to merge.
---@return boolean  ok.
---@return integer|string  Number of items loaded, or error message ("not a valid <toolId> session file").
function editor_toolUtilities_session.loadJson(j, spec, replace) end

--- Marks a tool's document as modified (unsaved). To be called from the tool's rebuild pass, once per pass. The load guard swallows one call after a Load.
---Source: lua/ge/extensions/editor/toolUtilities/session.lua:92
---@param toolId string Tool identifier.
function editor_toolUtilities_session.markEdited(toolId) end

--- Restores the file binding and the modified state from a table returned by attachment (for example after an extension reload).
---Source: lua/ge/extensions/editor/toolUtilities/session.lua:131
---@param toolId string Tool identifier.
---@param at table { path, dirty }; ignored if it is not a table.
function editor_toolUtilities_session.reattach(toolId, at) end

--- Converts in place an array of positions loaded from JSON (plain {x,y,z}) into vec3. Idempotent (existing vec3s, which have a distance method, are left as is); safe on nil or a non-table.
---Source: lua/ge/extensions/editor/toolUtilities/session.lua:147
---@param arr table|nil Array of positions.
function editor_toolUtilities_session.rehydrateVec3Array(arr) end

--- Inline variant: draws Save (once a file is known), Save As (if the tool is not empty) and Load side by side, then the Replace/Merge modal window.
---Source: lua/ge/extensions/editor/toolUtilities/session.lua:345
---@param spec table Tool specification.
function editor_toolUtilities_session.renderButtons(spec) end

--- Column variant: draws Save, Save As and Load as three grid cells.
---Source: lua/ge/extensions/editor/toolUtilities/session.lua:357
---@param spec table Tool specification.
function editor_toolUtilities_session.renderButtonsColumns(spec) end

--- Rewrites the modified document to the file it is bound to, for a tool whose work must never wait for a Save press. Returns false if there is no bound file or no modification.
---Source: lua/ge/extensions/editor/toolUtilities/session.lua:173
---@param spec table Tool specification.
---@return boolean  true if saved.
function editor_toolUtilities_session.saveIfEdited(spec) end

--- Writes all items to path as portable session JSON: version, tool, mapName (current level), items or state, globals, records.
---Source: lua/ge/extensions/editor/toolUtilities/session.lua:156
---@param path string File path.
---@param spec table Tool specification.
---@return boolean  ok (always true).
---@return integer  Number of items from getItems().
function editor_toolUtilities_session.saveToFile(path, spec) end

--- Detaches a tool from its file: the next Save will have to ask where to write instead of silently overwriting the last loaded file.
---Source: lua/ge/extensions/editor/toolUtilities/session.lua:104
---@param toolId string Tool identifier.
function editor_toolUtilities_session.unbind(toolId) end

--- Window title naming the bound file (or newName before there is one, "New Session" by default). The id follows "###" so that ImGui keeps the docking and size. Cached per tool.
---Source: lua/ge/extensions/editor/toolUtilities/session.lua:121
---@param toolId string Tool identifier.
---@param label string Displayed label.
---@param id string Stable ImGui identifier.
---@param newName string|nil Name displayed as long as no file is bound.
---@return string  Title "label - [name]###id".
function editor_toolUtilities_session.windowTitle(toolId, label, id, newName) end

