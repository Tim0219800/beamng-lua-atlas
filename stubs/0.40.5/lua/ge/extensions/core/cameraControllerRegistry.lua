---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/cameraControllerRegistry.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Optional routing layer placed in front of the camera input path. Registered 'controllers' (by id, with priority) can consume certain inputs (e.g. onRelativeInput, onEditorMouseWheel) when they are active; whatever is not consumed continues to the active camera as before. Loaded with require('core/cameraControllerRegistry') (it is not an extension). Used by core/cameraInput.lua. A modder uses it to intercept the mouse/wheel (e.g. a camera editing tool) without breaking normal cameras.
--- Access: extension `core_cameraControllerRegistry`: `extensions.load("core_cameraControllerRegistry")`, then the global `core_cameraControllerRegistry`
---@class core_cameraControllerRegistry
core_cameraControllerRegistry = {}

--- Takes exclusive capture of the inputs for this controller (see notes for the conditions).
---Source: lua/ge/extensions/core/cameraControllerRegistry.lua:70
---@param id string Identifier of a registered controller
---@return boolean  true if the capture is (or already was) held by this controller
function core_cameraControllerRegistry.acquire(id) end

--- Sends an event to the controllers: to the capture owner only if there is one, otherwise to all in order until one returns true.
---Source: lua/ge/extensions/core/cameraControllerRegistry.lua:51
---@param method string Name of the method to call on the controllers
---@param ... any Arguments passed to the method
---@return boolean  true if a controller consumed the event
function core_cameraControllerRegistry.dispatch(method, ...) end

--- Tests whether this controller holds the capture.
---Source: lua/ge/extensions/core/cameraControllerRegistry.lua:88
---@param id string Identifier
---@return boolean  true if owner
function core_cameraControllerRegistry.isOwner(id) end

--- Tests whether the id is registered (and, if controller is given, that it is this controller).
---Source: lua/ge/extensions/core/cameraControllerRegistry.lua:92
---@param id string Identifier
---@param controller table|nil Expected controller
---@return boolean  true if registered
function core_cameraControllerRegistry.isRegistered(id, controller) end

--- Registers a controller. Fails (false) if the id is not a non-empty string, if controller is not a table or if the id already exists.
---Source: lua/ge/extensions/core/cameraControllerRegistry.lua:31
---@param id string Unique identifier
---@param controller table Table of named callbacks
---@param priority number|nil Priority (larger = called first), 0 by default
---@return boolean  true if registered
function core_cameraControllerRegistry.register(id, controller, priority) end

--- Releases the capture if this controller holds it.
---Source: lua/ge/extensions/core/cameraControllerRegistry.lua:82
---@param id string Identifier
---@return boolean  true if released
function core_cameraControllerRegistry.release(id) end

--- Removes a controller. If controller is given, it must match the registered one. Releases the capture if needed.
---Source: lua/ge/extensions/core/cameraControllerRegistry.lua:42
---@param id string Identifier
---@param controller table|nil Expected controller (optional check)
---@return boolean  true if removed
function core_cameraControllerRegistry.unregister(id, controller) end

