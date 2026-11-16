---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/resourceChecker.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Editor "Resources Checker" window (Assets menu) to audit the current level's resources. Three tabs: "Materials Verification" (material version, duplicates, pid removal, PNG conversion, verification of texture maps/files, missing or dummy materials), "Resources Explorer" (loaded TSStatics, ForestItems, terrains, used or unused materials/meshes/textures, collision data) and "Asset Stats" (file scan, treemap and list by size). Also allows image preview, resolving duplicates and deleting unused files. The heavy computations are done by resourceUtil (extensions.editor_resourceChecker_resourceUtil) which returns its results through jobData.
--- Access: extension `editor_resourceChecker`: `extensions.load("editor_resourceChecker")`, then the global `editor_resourceChecker`
---@class editor_resourceChecker
editor_resourceChecker = {}

--- Receives the result of an asynchronous resourceUtil job and stores it for display.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/resourceChecker.lua:1805
---@param type integer 2 = material verification results, 3 = resources explorer results.
---@param data any Job data.
function editor_resourceChecker.jobData(type, data) end

--- Hook on editor activation; empty.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/resourceChecker.lua:1818
function editor_resourceChecker.onEditorActivated() end

--- Hook on editor deactivation; empty.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/resourceChecker.lua:1822
function editor_resourceChecker.onEditorDeactivated() end

--- Hook: draws the tabbed window, the image preview and the duplicate resolver.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/resourceChecker.lua:1778
function editor_resourceChecker.onEditorGui() end

--- Hook: adds the "Resources Checker" menu entry (Assets group) and registers the three windows (main, image preview, duplicates).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/resourceChecker.lua:1826
function editor_resourceChecker.onEditorInitialized() end

--- Shows the "resourceChecker" window (called by the menu entry).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/resourceChecker.lua:17
function editor_resourceChecker.onWindowMenuItem() end

--- Replaces the duplicates table displayed in the duplicate resolver.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/resourceChecker.lua:1814
---@param data table Duplicates table computed by resourceUtil (inferred from code).
function editor_resourceChecker.updateDuplicateTable(data) end

