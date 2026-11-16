# `utils_pixellib`

*File: `lua/common/utils/pixellib.lua` · VM: Common (GE + vehicle) · 566 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("utils/pixellib")`

Small in-memory pixel drawing library (8-bit RGBA buffer via FFI): points, lines, circles, rectangles, icons and text in the 'mini_font' bitmap font (capitals, digits and a few signs). The buffer is saved as an image (GBitmap:saveFile). Loaded with require('utils/pixellib'); M.create() returns a LuaPixelBuffer object. Useful to generate debug images (maps, graphs) without UI. See M.test() for a complete example.

## Example

```lua
local pb = require('utils/pixellib').create()
pb:init(250, 250)
pb:fill(ColorI(255,255,255,255))
pb:drawLine(vec3(0,0,0), vec3(100,50,0), ColorI(255,0,0,255), 2)
pb:drawText(vec3(10,200,0), 'Hello', ColorI(0,0,0,255))
pb:saveFile('test.png')
```

## Notes

- Drawing positions (pos, p1, pos1…) are vec3 of which only x and y are used (z ignored). Colors are tables/objects with integer fields r, g, b, a 0..255 (e.g. ColorI(255,0,0,255)).
- Coordinates are in pixels; the origin (0,0) is at the top left; pixels outside the buffer are ignored (drawPixel); the buffer memory is indexed y*width + x.
- drawText uppercases the text and only handles the mini_font characters (A-Z, 0-9, ! ? ' " . , : - _ and space); the position pos.y is the BOTTOM of the text line (the text goes up above it).
- Inconsistency: getPixel does not apply math.floor to x and y (unlike drawPixel); with non-integer coordinates the FFI index can be wrong.
- Inconsistency: LuaPixelBuffer:init allocates width*height without rounding (math.floor is only applied to the width/height fields), which can undersize the buffer with decimal dimensions.
- drawText: for a space, x advances by 4 then, since the letter is not found in mini_font, there is no extra advance; the consumedWidth count only counts the drawn characters.
- The M.test() functions write 'helloworld.png' in the current directory.

## Functions

| Function | Description | Line |
|---|---|---|
| `utils_pixellib.create()` | Creates an empty LuaPixelBuffer object; then call :init(width, height) to allocate the buffer. | 32 |
| `utils_pixellib.test()` | Demonstration: draws several primitives and text in a 250x250 buffer then saves it as 'helloworld.png'. | 240 |

### Parameter details

#### `utils_pixellib.create()`

Creates an empty LuaPixelBuffer object; then call :init(width, height) to allocate the buffer.

- **returns**: table LuaPixelBuffer instance

## Class `LuaPixelBuffer`

RGBA pixel buffer returned by create(). Fields: width, height, bufSize, buf (cdata rgba_pixel_t[?]).

| Method | Description | Line |
|---|---|---|
| `LuaPixelBuffer:__tostring()` | Descriptive text 'LuaPixelBuffer - ... [resolution: W x H (RGBA)]'. | 65 |
| `LuaPixelBuffer:_allocate_buffer(n)` | Allocates the FFI array of n pixels. Called by init. | 60 |
| `LuaPixelBuffer:drawCircle(pos, radius, color, lineWidth)` | Draws the outline of a circle (midpoint algorithm). | 97 |
| `LuaPixelBuffer:drawFilledCircle(pos, radius, color)` | Draws a filled disc. | 130 |
| `LuaPixelBuffer:drawFilledRect(p1, width, height, color)` | Fills a rectangle (bounds included: width+1 by height+1 pixels). | 155 |
| `LuaPixelBuffer:drawIcon(pos, type, color)` | Draws a small icon: 'x' (5x5 cross) or 'o' (circle of radius 2). Any other type: nothing. | 194 |
| `LuaPixelBuffer:drawLine(pos1, pos2, color, lineWidth)` | Draws a segment (pixel by pixel along the dominant axis). | 217 |
| `LuaPixelBuffer:drawPixel(x, y, color)` | Writes the color to a pixel (copies r, g, b, a, no alpha blending). Ignores coordinates outside the buffer. | 69 |
| `LuaPixelBuffer:drawPoint(x, y, color, size)` | Draws a point: one pixel if size is 1/nil/0, otherwise a filled disc of approximate diameter size. | 83 |
| `LuaPixelBuffer:drawRect(p1, width, height, color, lineWidth)` | Draws the outline of a rectangle with 4 lines. | 141 |
| `LuaPixelBuffer:drawText(pos, text, color)` | Writes text with the internal bitmap font (5 pixels tall). pos.y is the bottom of the line. | 164 |
| `LuaPixelBuffer:fill(color)` | Fills the whole buffer with a color. | 93 |
| `LuaPixelBuffer:getPixel(x, y)` | Reads a pixel from the buffer. | 78 |
| `LuaPixelBuffer:init(width, height)` | Allocates the buffer and sets width/height (rounded down to the integer). Pixels initially zero (transparent black). | 38 |
| `LuaPixelBuffer:saveFile(filename)` | Saves the buffer as an image via an engine GBitmap (format depends on the extension, e.g. .png). Logs an error if loading into the bitmap fails. | 56 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/utils/pixellib.lua`.*
