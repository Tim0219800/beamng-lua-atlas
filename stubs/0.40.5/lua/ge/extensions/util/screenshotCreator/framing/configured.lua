---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/screenshotCreator/framing/configured.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- "Configured camera" framing mode of screenshotCreator: uses a custom camera saved in the vehicle's thumbnail configuration (per config, otherwise per model) and converts it to a world position/rotation from the stored offsets (rewindCameraOffsets). If no configured camera is usable, falls back to procedural framing. It registers itself in the mode list via the onScreenshotCreatorCollectFramingModes hook (id "configured", order 200).
--- Access: extension `util_screenshotCreator_framing_configured`: `extensions.load("util_screenshotCreator_framing_configured")`, then the global `util_screenshotCreator_framing_configured`
---@class util_screenshotCreator_framing_configured
---@field dependencies table
util_screenshotCreator_framing_configured = {}

--- Alias of resolve.
---Source: lua/ge/extensions/util/screenshotCreator/framing/configured.lua:75
---@param context table See resolve
---@return table|nil  See resolve
---@return string|nil  Error message
function util_screenshotCreator_framing_configured.frame(context) end

--- Framing mode collection hook: adds the mode {id = 'configured', label = 'Configured camera', order = 200, resolve} to the list.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/screenshotCreator/framing/configured.lua:82
---@param modes table[] List of modes to complete
function util_screenshotCreator_framing_configured.onScreenshotCreatorCollectFramingModes(modes) end

--- Resolves the camera for the context: tries the configured camera, otherwise delegates to util_screenshotCreator_framing_procedural.resolve.
---Source: lua/ge/extensions/util/screenshotCreator/framing/configured.lua:75
---@param context table Framing context: vehicle (required), configName, and the fields read by procedural framing
---@return table|nil  {pos, rot, name, debugData} or nil on error
---@return string|nil  Error message
function util_screenshotCreator_framing_configured.resolve(context) end

--- Resolves only the user-configured camera (config then model) without procedural fallback.
---Source: lua/ge/extensions/util/screenshotCreator/framing/configured.lua:37
---@param context table Framing context with vehicle and configName
---@return table|nil  {pos, rot, name = 'config camera' or 'model camera', debugData} or nil if no configured camera
---@return string|nil  Error message if the context is invalid
function util_screenshotCreator_framing_configured.resolveOverride(context) end

