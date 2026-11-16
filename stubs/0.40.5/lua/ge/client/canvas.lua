---@meta
-- tim19Atlas stub generated from lua/ge/client/canvas.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Manages the GuiCanvas (the render window) on the client side: one-time creation of the "Canvas" object and showing/hiding the mouse cursor. Called at game startup (initializeCanvas); a modder can use showCursor/hideCursor to release or lock the mouse.
--- Access: `require("client/canvas")`
---@class client_canvas
---@field canvasCreated boolean True once the canvas has been created by initializeCanvas; prevents a second creation.
local client_canvas = {}

--- Returns the GuiCanvas object "Canvas", creating and registering it if it does not exist. Applies the fullscreen and graphics auto-detection preferences.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/client/canvas.lua:8
---@param windowPlacement any Window placement; not used in the function body (inferred from code).
---@return userdata  The Canvas object.
function client_canvas.createCanvas(windowPlacement) end

--- Locks the mouse (lockMouse(true)) and hides the canvas cursor.
---Source: lua/ge/client/canvas.lua:57
function client_canvas.hideCursor() end

--- Creates the canvas only once (logs an error if already created), reads WindowPlacement from the graphics options, and calls quit() if creation fails.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/client/canvas.lua:28
---@return userdata|nil  The canvas, or nil if already created.
function client_canvas.initializeCanvas() end

--- Unlocks the mouse (lockMouse(false)) and makes the canvas cursor visible.
---Source: lua/ge/client/canvas.lua:48
function client_canvas.showCursor() end

return client_canvas
