---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/assetManagementTool.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Editor tool "Asset Management Tool" (Window > Assets menu, 1200x900 window) for managing asset files and link files (for BeamNG's SVN repository). Tabs: Duplicated Assets (only visible in devMode), Link Checker, Delinker, Relinker, Link Files Cleanup, Naming Checker. It relies on FS:hashFile, FS:findLinkFiles, FS:convertLinkFileToTargetCopy, FS:copyFile, etc. Internal development tool, of little use to a mod.
--- Access: extension `editor_assetManagementTool`: `extensions.load("editor_assetManagementTool")`, then the global `editor_assetManagementTool`
---@class editor_assetManagementTool
editor_assetManagementTool = {}

--- Hook called when the editor is activated; empty body.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/assetManagementTool.lua:1989
function editor_assetManagementTool.onEditorActivated() end

--- Hook called every editor frame: draws the tabbed window (Duplicated Assets if devMode, Link Checker, Delinker, Relinker, Link Files Cleanup, Naming Checker) and the associated modal dialogs (e.g. confirmation to remove assets from the list).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/assetManagementTool.lua:1639
function editor_assetManagementTool.onEditorGui() end

--- Hook called at editor initialization: registers the 'assetManagementTool' window and its ~15 modal windows, adds the "Asset Management Tool" menu entry (Assets group) and loads the saved duplicates list (loadDuplicatesList).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/assetManagementTool.lua:1996
function editor_assetManagementTool.onEditorInitialized() end

--- Hook called when the extension is loaded; empty body.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/assetManagementTool.lua:2017
function editor_assetManagementTool.onExtensionLoaded() end

