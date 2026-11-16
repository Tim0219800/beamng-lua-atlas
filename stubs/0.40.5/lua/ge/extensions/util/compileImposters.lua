---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/compileImposters.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Offline build tool: for a list of levels, starts each level in freeroam, waits for it to load then triggers imposter compilation (Engine.Render.updateImposters(true)). A counter tied to the console logs is used to wait for the engine to finish working. If the duration exceeds 6000 frames without the job finishing, the game exits (shutdown(0)).
--- Access: extension `util_compileImposters`: `extensions.load("util_compileImposters")`, then the global `util_compileImposters`
---@class util_compileImposters
util_compileImposters = {}

--- Starts processing a queue of levels in a job (one job at a time).
---Source: lua/ge/extensions/util/compileImposters.lua:92
---@param queue string[] Level names to process (passed to freeroam_freeroam.startFreeroamByName).
---@return boolean|nil  false if processing is already in progress, otherwise nil.
function util_compileImposters.compileImposters(queue) end

--- Hook called on each log line; resets logCooldown to 6000 (the engine is considered active).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/compileImposters.lua:121
---@param timer any Timestamp (unused).
---@param lvl string Log level.
---@param origin string Log origin.
---@param line string Log text.
function util_compileImposters.onConsoleLog(timer, lvl, origin, line) end

--- Initialization hook: sets the extension to manual unload.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/compileImposters.lua:12
function util_compileImposters.onInit() end

--- Hook called when the mod manager is ready: allows the job to continue.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/compileImposters.lua:117
---@param mod any Not used.
function util_compileImposters.onModManagerReady(mod) end

--- Hook called before each render: counts down logCooldown and monitors the maximum delay (6000 frames) during processing.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/compileImposters.lua:101
---@param dt number Frame duration (s).
function util_compileImposters.onPreRender(dt) end

