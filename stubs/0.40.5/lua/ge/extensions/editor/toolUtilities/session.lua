---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/session.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_toolUtilities_session` : `extensions.load("editor_toolUtilities_session")`, puis la globale `editor_toolUtilities_session`
---@class editor_toolUtilities_session
editor_toolUtilities_session = {}

--- Which file the document is attached to and whether it has unsaved changes.
---Source : lua/ge/extensions/editor/toolUtilities/session.lua:109
---@param toolId any
function editor_toolUtilities_session.attachment(toolId) end

--- The bound path on its own, for callers that run every frame and should not allocate a table to read it.
---Source : lua/ge/extensions/editor/toolUtilities/session.lua:114
---@param toolId any
function editor_toolUtilities_session.boundPath(toolId) end

--- Deep-copies an item through the buffer codec.
---Source : lua/ge/extensions/editor/toolUtilities/session.lua:138
---@param item any
---@param emptyKeys any
---@param nilKeys any
function editor_toolUtilities_session.itemToTable(item, emptyKeys, nilKeys) end

---Source : lua/ge/extensions/editor/toolUtilities/session.lua:209
---@param path any
---@param spec any
---@param replace any
function editor_toolUtilities_session.loadFromFile(path, spec, replace) end

--- Applies a decoded session JSON. `replace` wipes current items first; otherwise the loaded items are MERGED (an incoming id that
---  clashes with a live item gets a fresh one so nothing is clobbered). Returns ok, countOrError.
---Source : lua/ge/extensions/editor/toolUtilities/session.lua:183
---@param j any
---@param spec any
---@param replace any
function editor_toolUtilities_session.loadJson(j, spec, replace) end

--- Marks a tool's document as having unsaved changes. Tools call this from their dirty/rebuild pass (once per pass, when something
---  actually rebuilt). The load guard swallows exactly one call so the forced rebuild a fresh Load triggers doesn't flip the doc dirty.
---Source : lua/ge/extensions/editor/toolUtilities/session.lua:92
---@param toolId any
function editor_toolUtilities_session.markEdited(toolId) end

---Source : lua/ge/extensions/editor/toolUtilities/session.lua:131
---@param toolId any
---@param at any
function editor_toolUtilities_session.reattach(toolId, at) end

--- Rehydrates an array of node positions loaded from JSON (plain {x,y,z}) back into vec3, in place. Idempotent: entries that are
---  already vec3 (the buffer/undo path) have a :distance method and are left as-is. Safe on nil / non-table.
---Source : lua/ge/extensions/editor/toolUtilities/session.lua:147
---@param arr any
function editor_toolUtilities_session.rehydrateVec3Array(arr) end

--- Inline variant: draws Save (once a file is known) + Save As (when non-empty) + Load side-by-side + the modal.
---Source : lua/ge/extensions/editor/toolUtilities/session.lua:345
---@param spec any
function editor_toolUtilities_session.renderButtons(spec) end

--- Column variant: draws Save + Save As + Load as three grid cells.
---Source : lua/ge/extensions/editor/toolUtilities/session.lua:357
---@param spec any
function editor_toolUtilities_session.renderButtonsColumns(spec) end

--- Writes an edited document back over the file it is bound to, for a tool whose work should never wait on a Save press.
---Source : lua/ge/extensions/editor/toolUtilities/session.lua:173
---@param spec any
function editor_toolUtilities_session.saveIfEdited(spec) end

--- Writes every item to `path` as a portable session JSON. Returns ok, count.
---Source : lua/ge/extensions/editor/toolUtilities/session.lua:156
---@param path any
---@param spec any
function editor_toolUtilities_session.saveToFile(path, spec) end

--- Detaches a tool from its file, so the next Save has to ask where instead of writing silently over whatever was last loaded.
---Source : lua/ge/extensions/editor/toolUtilities/session.lua:104
---@param toolId any
function editor_toolUtilities_session.unbind(toolId) end

---Source : lua/ge/extensions/editor/toolUtilities/session.lua:121
---@param toolId any
---@param label any
---@param id any
---@param newName any
function editor_toolUtilities_session.windowTitle(toolId, label, id, newName) end

