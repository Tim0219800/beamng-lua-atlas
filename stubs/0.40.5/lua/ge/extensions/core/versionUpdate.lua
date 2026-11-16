---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/versionUpdate.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Detects at startup whether the game was just updated to a new major version (comparison of the first two numbers of beamng_version with the lastVersion setting). In that case it runs FS:folderCleanup to back up the user folders of the old version, then stores the current version in the settings. A modder rarely uses it; updatedFromVersion() indicates which version we come from.
--- Access: extension `core_versionUpdate`: `extensions.load("core_versionUpdate")`, then the global `core_versionUpdate`
---@class core_versionUpdate
---@field lastVersion string|nil Previous game version if a major update was detected at this launch, otherwise nil.
core_versionUpdate = {}

--- Hook called on load: compares the current version and the last stored version, optionally runs the folder backup/cleanup and stores lastVersion.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/versionUpdate.lua:12
function core_versionUpdate.onExtensionLoaded() end

--- Hook called every frame, but only until the 2nd time: stores the current version in the settings then removes itself.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/versionUpdate.lua:41
function core_versionUpdate.onUpdate() end

--- Returns the version we just migrated from.
---Source: lua/ge/extensions/core/versionUpdate.lua:51
---@return string|nil  Old version, nil if there was no major update at this launch.
function core_versionUpdate.updatedFromVersion() end

