---@meta
-- tim19Atlas stub generated from lua/common/utils/pixellib.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Small in-memory pixel drawing library (8-bit RGBA buffer via FFI): points, lines, circles, rectangles, icons and text in the 'mini_font' bitmap font (capitals, digits and a few signs). The buffer is saved as an image (GBitmap:saveFile). Loaded with require('utils/pixellib'); M.create() returns a LuaPixelBuffer object. Useful to generate debug images (maps, graphs) without UI. See M.test() for a complete example.
--- Access: `require("utils/pixellib")`
---@class utils_pixellib
local utils_pixellib = {}

--- Creates an empty LuaPixelBuffer object; then call :init(width, height) to allocate the buffer.
---Source: lua/common/utils/pixellib.lua:32
---@return table  LuaPixelBuffer instance
function utils_pixellib.create() end

--- Demonstration: draws several primitives and text in a 250x250 buffer then saves it as 'helloworld.png'.
---Source: lua/common/utils/pixellib.lua:240
function utils_pixellib.test() end

--- RGBA pixel buffer returned by create(). Fields: width, height, bufSize, buf (cdata rgba_pixel_t[?]).
---@class utils_pixellib_LuaPixelBuffer
local utils_pixellib_LuaPixelBuffer = {}

--- Descriptive text 'LuaPixelBuffer - ... [resolution: W x H (RGBA)]'.
---Source: lua/common/utils/pixellib.lua:65
---@return string  Description
function utils_pixellib_LuaPixelBuffer:__tostring() end

--- Allocates the FFI array of n pixels. Called by init.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/utils/pixellib.lua:60
---@param n integer Number of pixels
function utils_pixellib_LuaPixelBuffer:_allocate_buffer(n) end

--- Draws the outline of a circle (midpoint algorithm).
---Source: lua/common/utils/pixellib.lua:97
---@param pos vec3 Center (x,y)
---@param radius number Radius in pixels
---@param color table Color
---@param lineWidth number|nil Line thickness, 1 by default
function utils_pixellib_LuaPixelBuffer:drawCircle(pos, radius, color, lineWidth) end

--- Draws a filled disc.
---Source: lua/common/utils/pixellib.lua:130
---@param pos vec3 Center (x,y)
---@param radius number Radius in pixels
---@param color table Color
function utils_pixellib_LuaPixelBuffer:drawFilledCircle(pos, radius, color) end

--- Fills a rectangle (bounds included: width+1 by height+1 pixels).
---Source: lua/common/utils/pixellib.lua:155
---@param p1 vec3 Top-left corner (x,y)
---@param width number Width
---@param height number Height
---@param color table Color
function utils_pixellib_LuaPixelBuffer:drawFilledRect(p1, width, height, color) end

--- Draws a small icon: 'x' (5x5 cross) or 'o' (circle of radius 2). Any other type: nothing.
---Source: lua/common/utils/pixellib.lua:194
---@param pos vec3 Center (x,y)
---@param type string 'x' or 'o'
---@param color table Color
function utils_pixellib_LuaPixelBuffer:drawIcon(pos, type, color) end

--- Draws a segment (pixel by pixel along the dominant axis).
---Source: lua/common/utils/pixellib.lua:217
---@param pos1 vec3 Start (x,y)
---@param pos2 vec3 End (x,y)
---@param color table Color
---@param lineWidth number|nil Thickness, 1 by default
function utils_pixellib_LuaPixelBuffer:drawLine(pos1, pos2, color, lineWidth) end

--- Writes the color to a pixel (copies r, g, b, a, no alpha blending). Ignores coordinates outside the buffer.
---Source: lua/common/utils/pixellib.lua:69
---@param x number Column
---@param y number Row
---@param color table Color {r,g,b,a} 0..255
function utils_pixellib_LuaPixelBuffer:drawPixel(x, y, color) end

--- Draws a point: one pixel if size is 1/nil/0, otherwise a filled disc of approximate diameter size.
---Source: lua/common/utils/pixellib.lua:83
---@param x number Column
---@param y number Row
---@param color table Color
---@param size number|nil Size in pixels, 1 by default
function utils_pixellib_LuaPixelBuffer:drawPoint(x, y, color, size) end

--- Draws the outline of a rectangle with 4 lines.
---Source: lua/common/utils/pixellib.lua:141
---@param p1 vec3 Top-left corner (x,y)
---@param width number Width
---@param height number Height
---@param color table Color
---@param lineWidth number|nil Thickness, 1 by default
function utils_pixellib_LuaPixelBuffer:drawRect(p1, width, height, color, lineWidth) end

--- Writes text with the internal bitmap font (5 pixels tall). pos.y is the bottom of the line.
---Source: lua/common/utils/pixellib.lua:164
---@param pos vec3 Position (x,y)
---@param text string Text (uppercased)
---@param color table Color
---@return integer  Number of characters actually drawn
function utils_pixellib_LuaPixelBuffer:drawText(pos, text, color) end

--- Fills the whole buffer with a color.
---Source: lua/common/utils/pixellib.lua:93
---@param color table Color
function utils_pixellib_LuaPixelBuffer:fill(color) end

--- Reads a pixel from the buffer.
---Source: lua/common/utils/pixellib.lua:78
---@param x integer Column
---@param y integer Row
---@return cdata|nil  rgba_pixel_t (fields r,g,b,a), nil if outside the buffer
function utils_pixellib_LuaPixelBuffer:getPixel(x, y) end

--- Allocates the buffer and sets width/height (rounded down to the integer). Pixels initially zero (transparent black).
---Source: lua/common/utils/pixellib.lua:38
---@param width number Width in pixels
---@param height number Height in pixels
function utils_pixellib_LuaPixelBuffer:init(width, height) end

--- Saves the buffer as an image via an engine GBitmap (format depends on the extension, e.g. .png). Logs an error if loading into the bitmap fails.
---Source: lua/common/utils/pixellib.lua:56
---@param filename string Output file
function utils_pixellib_LuaPixelBuffer:saveFile(filename) end

return utils_pixellib
