---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/siteLibrary.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Save, Save As and Open for single-document site tools. A massing building, an open space and a parking lot are each ONE document whose home is a library shelf folder (see siteAssets): Save rewrites over it without asking, Save As names a new folder and follows it, Open replaces the whole document. The site placer stands up the copies, the editor carves the original. new(cfg) builds, for each tool, a binding with the same three buttons, icons and labels.
--- Access: extension `editor_toolUtilities_siteLibrary`: `extensions.load("editor_toolUtilities_siteLibrary")`, then the global `editor_toolUtilities_siteLibrary`
---@class editor_toolUtilities_siteLibrary
editor_toolUtilities_siteLibrary = {}

--- Builds a tool's binding to its shelf. Returns a table with the functions: save(doc, name) (writes the document into the library under a name, which is also its folder; a single path for Save, Save As and Rename; returns ok), open(dir) (reopens a baked site from its model.json and binds to it; returns ok, error), buttons(doc) (draws Save, Save As, Open), settle() (opens the chosen folder before any drawing), unbind() (detaches from the open site and marks modified), saveOnLeave(doc) (on leaving the editor: rewrites the site if it changed, or gives it a free name, with numeric suffix), boundName() (name of the bound folder or nil), boundPath() (bound folder), attachment() (binding and modified state), reattach(at) and setOnOpened(fn) (to run once a document is loaded).
---Source: lua/ge/extensions/editor/toolUtilities/siteLibrary.lua:35
---@param cfg table { toolId, kind, noun, stateKey, editMode, hasContent, bakeRun, applyState, rename }.
---@return table  Binding with save, open, buttons, settle, unbind, saveOnLeave, boundName, boundPath, attachment, reattach, setOnOpened.
function editor_toolUtilities_siteLibrary.new(cfg) end

