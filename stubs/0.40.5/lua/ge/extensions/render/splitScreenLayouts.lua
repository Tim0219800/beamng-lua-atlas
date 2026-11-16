---@meta
-- tim19Atlas stub generated from lua/ge/extensions/render/splitScreenLayouts.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Catalog of split screen layouts, used by render_splitScreen. It provides predefined layouts for 2, 3 and 4 players, an automatic grid layout for any number of players, and on load loads modders' custom layouts from /settings/**/*.splitscreenLayout.json. Rectangles are normalized from 0 to 1: {x, y, width, height}.
--- Access: extension `render_splitScreenLayouts`: `extensions.load("render_splitScreenLayouts")`, then the global `render_splitScreenLayouts`
---@class render_splitScreenLayouts
render_splitScreenLayouts = {}

--- Returns the rectangles of the requested layout for this number of players. 'shared' gives a single full-screen rectangle; an unknown identifier or 'automatic' gives the automatic layout. Gaps between views are applied.
---Source: lua/ge/extensions/render/splitScreenLayouts.lua:224
---@param playerCount integer Number of players.
---@param layoutId string 'automatic', 'shared' or identifier of a predefined or custom layout.
---@param screenWidth number|nil Width in pixels (if invalid, a number below 2 is read as an aspect ratio).
---@param screenHeight number|nil Height in pixels.
---@return number[][]  List of normalized rectangles {x, y, w, h}.
function render_splitScreenLayouts.getLayout(playerCount, layoutId, screenWidth, screenHeight) end

--- List of layout choices offered to the user for this number of players (without 'shared'), with label and rectangles.
---Source: lua/ge/extensions/render/splitScreenLayouts.lua:240
---@param playerCount integer Number of players.
---@param screenWidth number|nil Screen width in pixels.
---@param screenHeight number|nil Screen height in pixels.
---@return table[]  Items {value, label, layout}.
function render_splitScreenLayouts.getOptions(playerCount, screenWidth, screenHeight) end

--- Converts a player count into a multiseatLayout<N> setting number: integer value between 0 and 8, or 9 beyond 8.
---Source: lua/ge/extensions/render/splitScreenLayouts.lua:235
---@param playerCount number Number of players.
---@return integer  Setting index.
function render_splitScreenLayouts.getSettingsPlayerCount(playerCount) end

--- True if the identifier is 'shared' (single shared view).
---Source: lua/ge/extensions/render/splitScreenLayouts.lua:262
---@param layoutId string Identifier.
---@return boolean  Result.
function render_splitScreenLayouts.isShared(layoutId) end

--- Indicates whether a layout identifier exists for this number of players ('automatic' and 'shared' are always valid).
---Source: lua/ge/extensions/render/splitScreenLayouts.lua:256
---@param playerCount integer Number of players.
---@param layoutId string Identifier.
---@return boolean  Validity.
function render_splitScreenLayouts.isValid(playerCount, layoutId) end

