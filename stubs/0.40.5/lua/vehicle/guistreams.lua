---@meta
-- tim19Atlas stub generated from lua/vehicle/guistreams.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Data streams sent to the UI (HUD apps) at high frequency. Each stream has a name (wheelInfo, engineInfo, stats, electrics, sensors, environment, genericGraphAdvanced…); the UI indicates which ones it needs via setRequiredStreams, and only those are computed then queued with guihooks.queueStream. Accessible as the global `streams` (main.lua: streams = require('guistreams')). guihooks.lua calls streams.update() when sending.
--- Access: global `streams`
---@class streams
streams = {}

--- Adds a value to the UI's advanced generic graph ('genericGraphAdvanced' stream), if this stream is requested.
---Source: lua/vehicle/guistreams.lua:151
---@param k string Series name.
---@param val number Current value.
function streams.drawGraph(k, val) end

--- Indicates whether at least one stream is requested (or whether the list has never been set). Used by main.lua:onGraphicsStep.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/guistreams.lua:146
---@return boolean  true if streams are active.
function streams.hasActiveStreams() end

--- Clears the requested streams and the cache of static wheel positions.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/guistreams.lua:21
function streams.reset() end

--- Sets the list of streams requested by the UI (replaces the previous one). Called by the engine/the UI.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/guistreams.lua:137
---@param state string[] List of stream names.
function streams.setRequiredStreams(state) end

--- Called by guihooks when sending the streams: runs the handler of each requested stream (those of streamsHandlers), which queues its data.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/guistreams.lua:128
function streams.update() end

--- Indicates whether a stream must be sent this frame (stream requested by the UI and sending active).
---Source: lua/vehicle/guistreams.lua:17
---@param name string Stream name.
---@return boolean|nil  True if the stream must be produced (may return nil/false otherwise).
function streams.willSend(name) end

--- Local (non-exported) table of stream handlers, one argument-less function per stream name; update() calls them.
---@class streams_streamsHandlers
local streams_streamsHandlers = {}

--- Queues electrics.values.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/guistreams.lua:100
function streams_streamsHandlers.electrics() end

--- Queues controller.mainController.engineInfo.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/guistreams.lua:89
function streams_streamsHandlers.engineInfo() end

--- Queues ambient temperature and pressure.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/guistreams.lua:122
function streams_streamsHandlers.environment() end

--- Queues accelerations, steering wheel forces, position, roll/pitch/yaw and gravity.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/guistreams.lua:104
function streams_streamsHandlers.sensors() end

--- Queues obj:calcBeamStats() completed with tri_count and collidable_tri_count.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/guistreams.lua:93
function streams_streamsHandlers.stats() end

--- Builds and queues the 'wheelInfo' stream (see notes for the per-wheel format).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/guistreams.lua:26
function streams_streamsHandlers.wheelInfo() end

