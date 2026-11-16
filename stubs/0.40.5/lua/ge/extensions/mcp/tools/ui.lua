---@meta
-- tim19Atlas stub generated from lua/ge/extensions/mcp/tools/ui.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- MCP tools for the interface (CEF/Vue): read the route and Pinia state, navigate, show/hide the UI, display a message, and drive the DOM (arbitrary JS, click, wheel, typing, keyboard, hover) for interface testing. JS commands are sent with be:executeJS; results come back to GE through window.beamng.sendEngineLua to the `_cb.vueDump` / `_cb.uiEval` callbacks.
--- Access: extension `mcp_tools_ui`: `extensions.load("mcp_tools_ui")`, then the global `mcp_tools_ui`
---@class mcp_tools_ui
---@field cb table<string, function> Callbacks `vueDump(s)` and `uiEval(s)`: store the string in shared.asyncResults.vue / .ui.
---@field schemas table<string, table> Schemas of the interface tools.
mcp_tools_ui = {}

--- Requests a snapshot of the current route and the Pinia stores (asynchronous).
---Source: lua/ge/extensions/mcp/tools/ui.lua:50
---@return string  Previous JSON {route, stores}, or message.
---@return boolean  false.
function mcp_tools_ui.dump_vue_state() end

--- UI state: route/scope (ui_router.getState) and game state (core_gamestate.getGameState).
---Source: lua/ge/extensions/mcp/tools/ui.lua:36
---@return string  JSON {route, gameState}.
---@return boolean  false.
function mcp_tools_ui.get_ui_state() end

--- Navigates to a UI route (ui_router.navigate).
---Source: lua/ge/extensions/mcp/tools/ui.lua:42
---@param args table {route: string (e.g. 'menu', 'menu.vehicles'), params?: table}
---@return string  Message.
---@return boolean  true on error.
function mcp_tools_ui.set_ui_state(args) end

--- Displays a message in the game's message app via ui_message; reusing the same category replaces the previous message.
---Source: lua/ge/extensions/mcp/tools/ui.lua:66
---@param args table {text: string, ttl?: number s (default 5), category?: string (default 'mcp'), icon?: string (default 'info')}
---@return string  "shown: …".
---@return boolean  true if text is missing.
function mcp_tools_ui.show_message(args) end

--- Shows/hides the UI (like Alt+U) via ui_visibility.
---Source: lua/ge/extensions/mcp/tools/ui.lua:58
---@param args table|nil {show?: boolean} true/false to set, absent to toggle.
---@return string  "ui visible: …".
---@return boolean  true if ui_visibility is absent.
function mcp_tools_ui.toggle_ui(args) end

--- Simulates a full click (pointerdown, mousedown, pointerup, mouseup, click, optional dblclick) at the center of an element found by CSS selector; right click also triggers contextmenu.
---Source: lua/ge/extensions/mcp/tools/ui.lua:89
---@param args table {selector: string, nth?: integer, button?: 'left'|'middle'|'right'|0|1|2, doubleClick?: boolean}
---@return string  Message.
---@return boolean  true if selector is missing.
function mcp_tools_ui.ui_click(args) end

--- Evaluates JavaScript in the UI and returns its value as JSON (asynchronous).
---Source: lua/ge/extensions/mcp/tools/ui.lua:76
---@param args table {js: string}
---@return string  JSON result or "dispatched" message.
---@return boolean  true if js is missing.
function mcp_tools_ui.ui_eval(args) end

--- Simulates hovering (pointerover, mouseover, pointerenter, mouseenter, pointermove, mousemove) over an element.
---Source: lua/ge/extensions/mcp/tools/ui.lua:134
---@param args table {selector: string, nth?: integer}
---@return string  Message.
---@return boolean  true if selector is missing.
function mcp_tools_ui.ui_hover(args) end

--- Sends a keyboard event to an element or to the active element.
---Source: lua/ge/extensions/mcp/tools/ui.lua:124
---@param args table {key: string (e.g. 'Enter'), selector?: string, event?: 'down'|'up'|'press' (default keydown+keyup), nth?: integer}
---@return string  Message.
---@return boolean  true if key is missing.
function mcp_tools_ui.ui_key(args) end

--- Sends a wheel event to an element (deltaY>0 = down; 120 by default if no delta).
---Source: lua/ge/extensions/mcp/tools/ui.lua:103
---@param args table {selector: string, deltaX?: number, deltaY?: number, nth?: integer}
---@return string  Message.
---@return boolean  true if selector is missing.
function mcp_tools_ui.ui_scroll(args) end

--- Types text into an input/textarea/contenteditable (sets the value then triggers input and change, v-model compatible).
---Source: lua/ge/extensions/mcp/tools/ui.lua:113
---@param args table {selector: string, text: string, clear?: boolean (default true, false = append), nth?: integer}
---@return string  Message.
---@return boolean  true if a parameter is missing.
function mcp_tools_ui.ui_type(args) end

