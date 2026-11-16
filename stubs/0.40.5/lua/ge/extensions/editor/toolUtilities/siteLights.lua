---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/siteLights.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- A single place that turns a light record into a scene object, for all tools of the suite. Each light is a night light as soon as it is placed: dark by day, lit after dusk, switched by the environment (core_environment). Provides creation (spawn), update (apply), a flag to ask the environment to rescan the scene again (markDirty) and a lightweight loop to call every frame (flush) that keeps new lights in sync with day and night.
--- Access: extension `editor_toolUtilities_siteLights`: `extensions.load("editor_toolUtilities_siteLights")`, then the global `editor_toolUtilities_siteLights`
---@class editor_toolUtilities_siteLights
---@field TONES table<string, number[]> Named tints: warm {1.00, 0.72, 0.34} (sodium), white {1.00, 0.95, 0.88}, cool {0.78, 0.87, 1.00} (metal halide). Prevents two neighboring sites from being lit in different colors.
editor_toolUtilities_siteLights = {}

--- Adjusts an existing light from a record: radius (or range and angles for a spotlight), brightness, color, shadows disabled, position, and rotation toward (dx, dy, dz) for a spotlight.
---Source: lua/ge/extensions/editor/toolUtilities/siteLights.lua:108
---@param obj userdata PointLight or SpotLight object.
---@param lt table Light record.
function editor_toolUtilities_siteLights.apply(obj, lt) end

--- To be called every frame by each tool that creates lights. Cheap as long as nothing is due: performs the deferred rescan, follows the environment's day/night state (core_environment.getLightState) and switches (setLightEnabled, or instance color for an emissive lens) the marked objects.
---Source: lua/ge/extensions/editor/toolUtilities/siteLights.lua:57
function editor_toolUtilities_siteLights.flush() end

--- Signals that a light is new (with obj: it will be put in the current day/night state) or that a full scene rescan is due (without obj: done after a 250 ms pause). Deleting a light needs no rescan: the environment ignores those that have vanished.
---Source: lua/ge/extensions/editor/toolUtilities/siteLights.lua:49
---@param obj userdata|nil New light or light element.
function editor_toolUtilities_siteLights.markDirty(obj) end

--- Creates a light object for a record (SpotLight if it carries a direction, otherwise PointLight), registers it under name and adds it to folder. Returns nil if creation fails. Unless always, the light is entrusted to the environment via markDirty.
---Source: lua/ge/extensions/editor/toolUtilities/siteLights.lua:135
---@param folder userdata|nil Parent scene group.
---@param name string|nil Object name (nil = unnamed).
---@param lt table Light record.
---@return userdata|nil  Created light object.
function editor_toolUtilities_siteLights.spawn(folder, name, lt) end

