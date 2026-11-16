---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/commandhandler.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Executes the asynchronous commands sent to the game by the "beamng:v1/<command>/<data>" protocol scheme (browser link, -command command-line argument, pipe channel). Commands received before the interface is ready are queued then replayed on onUiReady. On the first update, reads the startup arguments (-command beamng:...).
--- Access: extension `core_commandhandler`: `extensions.load("core_commandhandler")`, then the global `core_commandhandler`
---@class core_commandhandler
---@field onExtensionLoaded function Empty function _anon(nop): the extension does nothing on load.
core_commandhandler = {}

--- Hook: restores ignoreStartupCmd.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/commandhandler.lua:319
---@param d table table returned by onSerialize
function core_commandhandler.onDeserialized(d) end

--- Hook: on the first update, looks for "-command beamng:..." in Engine.getStartingArgs() and executes it (ignored if the extension was reloaded).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/commandhandler.lua:291
function core_commandhandler.onFirstUpdate() end

--- Processes a "version/command/data" scheme command (without the "beamng:" prefix). Queues if the UI is not ready. Unknown or malformed commands are logged as errors.
---Source: lua/ge/extensions/core/commandhandler.lua:53
---@param scheme string e.g. "v1/openMap/{...json...}", percent-encoded
---@param isStartingArg boolean true if the command comes from the game's startup arguments
function core_commandhandler.onSchemeCommand(scheme, isStartingArg) end

--- Hook: returns {ignoreStartupCmd = true} so that the GE reload does not replay the startup command.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/commandhandler.lua:315
---@return table  data to serialize
function core_commandhandler.onSerialize() end

--- Hook: the interface is ready; runs the queued commands.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/commandhandler.lua:283
function core_commandhandler.onUiReady() end

