---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/assetDeduplicator.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Editor tool "Asset Deduplicator" (Window > Assets menu): finds duplicate files in the current level and offers to replace them with link files. It builds a hash cache (/temp/assetdeduplicator.cache.json, version 3, tied to the game version) via a job, then compares either by content hash (safe) or by file name (manual review required). Mostly useful to teams preparing levels; nothing to call from a mod.
--- Access: extension `editor_assetDeduplicator`: `extensions.load("editor_assetDeduplicator")`, then the global `editor_assetDeduplicator`
---@class editor_assetDeduplicator
editor_assetDeduplicator = {}

--- Hook called when the editor is activated; empty body.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/assetDeduplicator.lua:976
function editor_assetDeduplicator.onEditorActivated() end

--- Hook called when the editor is deactivated; empty body.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/assetDeduplicator.lua:980
function editor_assetDeduplicator.onEditorDeactivated() end

--- Hook called every editor frame: draws the "Asset Deduplicator" window (cache state, hash/name mode choice, "Run assessment" button, link preview and application, cache reset buttons). Launches the cache generation job on first open.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/assetDeduplicator.lua:849
function editor_assetDeduplicator.onEditorGui() end

--- Hook called at editor initialization: adds the "Asset Deduplicator" menu entry (Assets group) and registers the 'assetDeduplicator' window (500x300).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/assetDeduplicator.lua:984
function editor_assetDeduplicator.onEditorInitialized() end

--- Menu callback: shows the 'assetDeduplicator' window.
---Source: lua/ge/extensions/editor/assetDeduplicator.lua:38
function editor_assetDeduplicator.onWindowMenuItem() end

