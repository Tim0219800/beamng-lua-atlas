---@meta
-- tim19Atlas stub generated from lua/common/guihooks.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Lua gateway to the HTML/JS interface (CEF). Allows triggering JS hooks on the UI side (guihooks.trigger) and sending high-frequency data streams to UI apps. Present in the GE VM (via `be`) and in the vehicle VM (via `obj`); both send through queueHookJS/queueStreamDataJS. A modder uses it to show a message, update a UI app or plot values in the 'Generic Graph' app.
--- Access: global `guihooks`
---@class guihooks
---@field queueStream function queueStream(key, value): caches the stream data `key` for later sending by sendStreams (vehicle VM: only if updateStreams is true). nop if neither `obj` nor `be` exists.
---@field send function Alias of queueStream.
guihooks = {}

--- Feeds the 'Generic Graph' UI app (stream 'genericGraphSimple'). Each argument is a table {key, value, scale, unit, renderNegatives, color}; defaults: key '#i', value 0, scale 1, unit '', renderNegatives false, color RGBA jet gradient. Returns the normalized list. Example: graph({'foo',foo}, {'bar',bar,100}, {'baz',baz,nil,'m/s',false,nil}).
---Source: lua/common/guihooks.lua:151
---@param a table|nil first graph {key, value, scale, unit, renderNegatives, color} (ignored if nil/false)
---@param ... table other graphs, same format
---@return table[]  list of graphs with default values filled in
function guihooks.graph(a, ...) end

--- Like graph, and also records each call as a row of an in-memory CSV (csvlib). The first call creates the file and sets the columns (key + unit). Write to disk with graphWithCSVWrite().
---Source: lua/common/guihooks.lua:167
---@param filename string|nil CSV file name (taken at the first call; default graphcsv.<date>.csv)
---@param ... table graphs, same arguments as graph
function guihooks.graphWithCSV(filename, ...) end

--- Writes the CSV accumulated by graphWithCSV to the file; logs an error if no CSV exists.
---Source: lua/common/guihooks.lua:185
function guihooks.graphWithCSVWrite() end

--- Displays a message in the UI via the 'Message' hook (data {msg, ttl, category, icon, availableOptionsCount, currentOptionIndex}). Does nothing if playerInfo.firstPlayerSeated is false.
---Source: lua/common/guihooks.lua:126
---@param msg string text (possibly a translation key, inferred from the UI code)
---@param ttl number|nil display duration in seconds, default 5
---@param category string|nil message category, default ''
---@param icon string|nil icon
---@param availableOptionsCount integer|nil number of options (choice menus)
---@param currentOptionIndex integer|nil current option
function guihooks.message(msg, ttl, category, icon, availableOptionsCount, currentOptionIndex) end

--- Sends the 'Message' hook once for each seated player (playerInfo.seatedPlayers), with the field data.player. Accepts either the same arguments as message, or a single table {msg=..., ...} passed as the first argument (ttl nil).
---Source: lua/common/guihooks.lua:132
---@param msg string|table text or data table with a msg field
---@param ttl number|nil duration, default 5
---@param category string|nil category, default ''
---@param icon string|nil icon
---@param availableOptionsCount integer|nil number of options
---@param currentOptionIndex integer|nil current option
function guihooks.messageForSeatedPlayers(msg, ttl, category, icon, availableOptionsCount, currentOptionIndex) end

--- Sets updateStreams back to false, empties the stream cache and sends the 'VehicleReset' hook if the first player is seated. Called on a vehicle/VM reset.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/guihooks.lua:97
function guihooks.reset() end

--- Sends to the UI all streams cached by queueStream then empties the cache. Called by the engine (vehicle VM: from onGraphicsStep; must not be called from GE according to the code comment).
---*(internal: called by the engine or the main loop)*
---Source: lua/common/guihooks.lua:88
function guihooks.sendStreams() end

--- Triggers the JS hook `hookName` on the UI side with the given arguments (JSON-encoded in an array). nil values are ignored. Garbage-collector sensitive (reuses a temporary table): do not modify it lightly.
---Source: lua/common/guihooks.lua:26
---@param hookName string JS hook name
---@param ... any JSON-serializable arguments (nil ignored)
function guihooks.trigger(hookName, ...) end

--- Like trigger but for a specific UI client identified by targetDsmId.
---Source: lua/common/guihooks.lua:41
---@param targetDsmId integer target client/UI identifier
---@param hookName string JS hook name
---@param ... any arguments (nil ignored)
function guihooks.triggerClient(targetDsmId, hookName, ...) end

--- Triggers a JS hook by passing raw JS (inserted as is between brackets, no escaping or JSON encoding). To be used only with trusted text.
---Source: lua/common/guihooks.lua:54
---@param hookName string JS hook name
---@param rawJs any raw JS code converted with tostring
function guihooks.triggerRawJS(hookName, rawJs) end

--- Immediately sends stream data to the UI under the name streamName (JSON-encoded).
---Source: lua/common/guihooks.lua:58
---@param streamName string stream name
---@param streamData any JSON-serializable data
function guihooks.triggerStream(streamName, streamData) end

