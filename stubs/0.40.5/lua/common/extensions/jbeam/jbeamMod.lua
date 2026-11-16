---@meta
-- tim19Atlas stub generated from lua/common/extensions/jbeam/jbeamMod.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Example extension (file comment: "an example of how you could add things into jbeam loading") showing how to hook into the two JBeam loading phases. Both hooks just write a level I log line ("onJbeamLoadingPhase1/2 called :)"). It is not loaded by default: an extensions.load('jbeam_jbeamMod') is needed (commented-out line in the file).
--- Access: extension `jbeam_jbeamMod`: `extensions.load("jbeam_jbeamMod")`, then the global `jbeam_jbeamMod`
---@class jbeam_jbeamMod
jbeam_jbeamMod = {}

--- Hook called during phase 1 of a vehicle's JBeam loading. Here: only writes a log "onJbeamLoadingPhase1 called :)".
---*(internal: called by the engine or the main loop)*
---Source: lua/common/extensions/jbeam/jbeamMod.lua:14
---@param loadingProgress any Not used in this file.
---@param objID integer Not used (inferred from the name: vehicle object id).
---@param vehicle any Not used.
---@param unifyJournal any Not used.
---@param vehicleConfig table Not used (inferred from the name: vehicle configuration).
---@param vars any Not used.
function jbeam_jbeamMod.onJbeamLoadingPhase1(loadingProgress, objID, vehicle, unifyJournal, vehicleConfig, vars) end

--- Hook called during phase 2 of a vehicle's JBeam loading. Here: only writes a log "onJbeamLoadingPhase2 called :)".
---*(internal: called by the engine or the main loop)*
---Source: lua/common/extensions/jbeam/jbeamMod.lua:18
---@param loadingProgress any Not used in this file.
---@param objID integer Not used (inferred from the name: vehicle object id).
---@param vehicle any Not used.
---@param unifyJournal any Not used.
---@param vehicleConfig table Not used (inferred from the name: vehicle configuration).
---@param vars any Not used.
function jbeam_jbeamMod.onJbeamLoadingPhase2(loadingProgress, objID, vehicle, unifyJournal, vehicleConfig, vars) end

