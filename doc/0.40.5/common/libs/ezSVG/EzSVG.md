# `libs_ezSVG_EzSVG`

*File: `lua/common/libs/ezSVG/EzSVG.lua` · VM: Common (GE + vehicle) · 963 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("libs/ezSVG/EzSVG")`

EzSVG: third-party library (Patrick Borgeat, 2012, taken over by BeamNG) to generate SVG files from Lua. You create elements (Circle, Rect, Line, Path, Polyline, Text, Group, gradients...), add them to a group or a document (add) then write the file with Document:writeTo. A stack of default styles (setStyle, pushStyle, popStyle) applies to the elements created. Useful for exporting drawings (roads, graphs) from a script.

## Example

```lua
local svg = require('libs/ezSVG/EzSVG')
local doc = svg.Document(200, 200, svg.rgb(255,255,255))
doc:add(svg.Polyline({0, 0, 100, 100}, {fill = 'none', stroke = svg.rgb(255, 0, 0), stroke_width = 1}))
doc:writeTo('test.svg')
```

## Notes

- In style tables, keys with _ are converted to - (stroke_width becomes stroke-width).
- popStyle raises "Style Stack Underflow!" if the stack is empty.
- Document:writeTo performs a preliminary pass to place in <defs> the referenced objects that are not in the tree, then writes the file (io.open) without checking that the open succeeded.
- The last style argument of each constructor is optional.

## Functions

| Function | Description | Line |
|---|---|---|
| `libs_ezSVG_EzSVG.Circle(cx, cy, r, style)` | Creates a circle. | 421 |
| `libs_ezSVG_EzSVG.Document(width, height, bgcolor, style)` | Creates the root SVG document (svg group with xmlns, size and optional background). Has add and writeTo(filename). | 850 |
| `libs_ezSVG_EzSVG.Ellipse(cx, cy, rx, ry, style)` | Creates an ellipse. | 430 |
| `libs_ezSVG_EzSVG.Group(style)` | Creates a <g> group containing other elements (add method). | 709 |
| `libs_ezSVG_EzSVG.Image(href, x, y, width, height, style)` | Creates a referenced image. | 641 |
| `libs_ezSVG_EzSVG.Line(x1, y1, x2, y2, style)` | Creates a line segment. | 440 |
| `libs_ezSVG_EzSVG.LinearGradient(x1, y1, x2, y2, userSpaceUnits, spread, style)` | Creates a linear gradient (stops added afterwards on the object). | 750 |
| `libs_ezSVG_EzSVG.Mask(x, y, width, height, maskUnits, maskContentUnits, style)` | Creates a <mask> mask. | 817 |
| `libs_ezSVG_EzSVG.Path(style)` | Creates a <path> whose d commands are built by methods on the object. | 450 |
| `libs_ezSVG_EzSVG.Pattern(x, y, width, height, preserveAspectRatio, patternUnits, patternContentUnits, viewbox, style)` | Creates a <pattern> fill pattern. | 800 |
| `libs_ezSVG_EzSVG.Polygon(points, style)` | Creates a closed polygon. | 624 |
| `libs_ezSVG_EzSVG.Polyline(points, style)` | Creates an open polyline. | 620 |
| `libs_ezSVG_EzSVG.RadialGradient(cx, cy, r, fx, fy, userSpaceUnits, spread, style)` | Creates a radial gradient. | 764 |
| `libs_ezSVG_EzSVG.Rect(x, y, width, height, rx, ry, style)` | Creates a rectangle, optionally with rounded corners. | 628 |
| `libs_ezSVG_EzSVG.SVG(x, y, width, height, style)` | Creates a nested <svg> element (positioned group). | 901 |
| `libs_ezSVG_EzSVG.Symbol(preserveAspectRatio, viewBox, style)` | Creates a <symbol> (reusable template via Use). | 791 |
| `libs_ezSVG_EzSVG.Text(text, x, y, style)` | Creates a text element. | 664 |
| `libs_ezSVG_EzSVG.TextRef(href, style)` | Creates a text reference (<tref>) to another element. | 702 |
| `libs_ezSVG_EzSVG.Use(href, x, y, width, height, style)` | Creates a <use> that reuses an element defined elsewhere. | 779 |
| `libs_ezSVG_EzSVG.clearStyle()` | Resets the default styles of all known tags (empty tables). | 379 |
| `libs_ezSVG_EzSVG.gray(v)` | Gray: rgb(v, v, v). | 919 |
| `libs_ezSVG_EzSVG.hsv(h, s, v)` | Converts a TSV color into an rgb() string. The three components are in 0..255 (divided by 255). | 923 |
| `libs_ezSVG_EzSVG.popStyle()` | Restores the saved default styles; error if the stack is empty. | 399 |
| `libs_ezSVG_EzSVG.pushStyle()` | Saves a copy of the default styles on the stack. | 386 |
| `libs_ezSVG_EzSVG.rgb(r, g, b)` | Formats an SVG color "rgb(r, g, b)" (values 0..255, rounded down to the integer). | 915 |
| `libs_ezSVG_EzSVG.setStyle(key, value, tag)` | Sets a default style, for one tag or for all. Accepts either (key, value, tag?), or (style table, tag?). | 407 |

### Parameter details

#### `libs_ezSVG_EzSVG.Circle(cx, cy, r, style)`

Creates a circle.

- `cx` (*number*) : Center X
- `cy` (*number*) : Center Y
- `r` (*number*) : Radius
- `style` (*table|nil*) : Style

#### `libs_ezSVG_EzSVG.Document(width, height, bgcolor, style)`

Creates the root SVG document (svg group with xmlns, size and optional background). Has add and writeTo(filename).

- `width` (*number*) : Width
- `height` (*number*) : Height
- `bgcolor` (*string|nil*) : Background color (adds a rectangle)
- `style` (*table|nil*) : Style
- **returns**: table Document

#### `libs_ezSVG_EzSVG.Ellipse(cx, cy, rx, ry, style)`

Creates an ellipse.

- `cx` (*number*) : Center X
- `cy` (*number*) : Center Y
- `rx` (*number*) : X radius
- `ry` (*number*) : Y radius
- `style` (*table|nil*) : Style

#### `libs_ezSVG_EzSVG.Group(style)`

Creates a <g> group containing other elements (add method).

- `style` (*table|nil*) : Style

#### `libs_ezSVG_EzSVG.Image(href, x, y, width, height, style)`

Creates a referenced image.

- `href` (*string*) : Image URL or path
- `x` (*number*) : X
- `y` (*number*) : Y
- `width` (*number*) : Width
- `height` (*number*) : Height
- `style` (*table|nil*) : Style

#### `libs_ezSVG_EzSVG.Line(x1, y1, x2, y2, style)`

Creates a line segment.

- `x1` (*number*) : Start X
- `y1` (*number*) : Start Y
- `x2` (*number*) : End X
- `y2` (*number*) : End Y
- `style` (*table|nil*) : Style

#### `libs_ezSVG_EzSVG.LinearGradient(x1, y1, x2, y2, userSpaceUnits, spread, style)`

Creates a linear gradient (stops added afterwards on the object).

- `x1` (*number*) : Start X
- `y1` (*number*) : Start Y
- `x2` (*number*) : End X
- `y2` (*number*) : End Y
- `userSpaceUnits` (*boolean|nil*) : Use user units (inferred from the name)
- `spread` (*string|nil*) : Spread method (spreadMethod)
- `style` (*table|nil*) : Style

#### `libs_ezSVG_EzSVG.Mask(x, y, width, height, maskUnits, maskContentUnits, style)`

Creates a <mask> mask.

- `x` (*number*) : X
- `y` (*number*) : Y
- `width` (*number*) : Width
- `height` (*number*) : Height
- `maskUnits` (*string|nil*) : SVG attribute
- `maskContentUnits` (*string|nil*) : SVG attribute
- `style` (*table|nil*) : Style

#### `libs_ezSVG_EzSVG.Path(style)`

Creates a <path> whose d commands are built by methods on the object.

- `style` (*table|nil*) : Style

#### `libs_ezSVG_EzSVG.Pattern(x, y, width, height, preserveAspectRatio, patternUnits, patternContentUnits, viewbox, style)`

Creates a <pattern> fill pattern.

- `x` (*number*) : X
- `y` (*number*) : Y
- `width` (*number*) : Width
- `height` (*number*) : Height
- `preserveAspectRatio` (*string|nil*) : SVG attribute
- `patternUnits` (*string|nil*) : SVG attribute
- `patternContentUnits` (*string|nil*) : SVG attribute
- `viewbox` (*string|nil*) : SVG viewBox attribute
- `style` (*table|nil*) : Style

#### `libs_ezSVG_EzSVG.Polygon(points, style)`

Creates a closed polygon.

- `points` (*table<integer, number>*) : Flat list of coordinates {x1, y1, ...}
- `style` (*table|nil*) : Style

#### `libs_ezSVG_EzSVG.Polyline(points, style)`

Creates an open polyline.

- `points` (*table<integer, number>*) : Flat list of coordinates {x1, y1, x2, y2, ...}
- `style` (*table|nil*) : Style

#### `libs_ezSVG_EzSVG.RadialGradient(cx, cy, r, fx, fy, userSpaceUnits, spread, style)`

Creates a radial gradient.

- `cx` (*number*) : Center X
- `cy` (*number*) : Center Y
- `r` (*number*) : Radius
- `fx` (*number|nil*) : Focus X
- `fy` (*number|nil*) : Focus Y
- `userSpaceUnits` (*boolean|nil*) : Use user units (inferred from the name)
- `spread` (*string|nil*) : Spread method
- `style` (*table|nil*) : Style

#### `libs_ezSVG_EzSVG.Rect(x, y, width, height, rx, ry, style)`

Creates a rectangle, optionally with rounded corners.

- `x` (*number*) : X
- `y` (*number*) : Y
- `width` (*number*) : Width
- `height` (*number*) : Height
- `rx` (*number|nil*) : Corner radius in X
- `ry` (*number|nil*) : Corner radius in Y
- `style` (*table|nil*) : Style

#### `libs_ezSVG_EzSVG.SVG(x, y, width, height, style)`

Creates a nested <svg> element (positioned group).

- `x` (*number*) : X
- `y` (*number*) : Y
- `width` (*number*) : Width
- `height` (*number*) : Height
- `style` (*table|nil*) : Style

#### `libs_ezSVG_EzSVG.Symbol(preserveAspectRatio, viewBox, style)`

Creates a <symbol> (reusable template via Use).

- `preserveAspectRatio` (*string|nil*) : SVG attribute
- `viewBox` (*string|nil*) : SVG attribute
- `style` (*table|nil*) : Style

#### `libs_ezSVG_EzSVG.Text(text, x, y, style)`

Creates a text element.

- `text` (*string*) : Content
- `x` (*number*) : X
- `y` (*number*) : Y
- `style` (*table|nil*) : Style

#### `libs_ezSVG_EzSVG.TextRef(href, style)`

Creates a text reference (<tref>) to another element.

- `href` (*any*) : Referenced element or identifier (inferred from code)
- `style` (*table|nil*) : Style

#### `libs_ezSVG_EzSVG.Use(href, x, y, width, height, style)`

Creates a <use> that reuses an element defined elsewhere.

- `href` (*any*) : Element or identifier to reuse
- `x` (*number|nil*) : X
- `y` (*number|nil*) : Y
- `width` (*number|nil*) : Width
- `height` (*number|nil*) : Height
- `style` (*table|nil*) : Style

#### `libs_ezSVG_EzSVG.gray(v)`

Gray: rgb(v, v, v).

- `v` (*number*) : Level 0..255
- **returns**: string Color

#### `libs_ezSVG_EzSVG.hsv(h, s, v)`

Converts a TSV color into an rgb() string. The three components are in 0..255 (divided by 255).

- `h` (*number*) : Hue 0..255
- `s` (*number*) : Saturation 0..255
- `v` (*number*) : Value 0..255
- **returns**: string rgb(...) color

#### `libs_ezSVG_EzSVG.rgb(r, g, b)`

Formats an SVG color "rgb(r, g, b)" (values 0..255, rounded down to the integer).

- `r` (*number*) : Red
- `g` (*number*) : Green
- `b` (*number*) : Blue
- **returns**: string Color

#### `libs_ezSVG_EzSVG.setStyle(key, value, tag)`

Sets a default style, for one tag or for all. Accepts either (key, value, tag?), or (style table, tag?).

- `key` (*string|table*) : Property name (stroke_width...) or table of properties
- `value` (*any*) : Value (or tag name if key is a table)
- `tag` (*string|nil*) : Targeted tag; all if nil

## Fields

| Field | Type | Description |
|---|---|---|
| `knownTags` | table<integer, string> | List of known SVG tags (rect, circle, ellipse, line, polyline, polygon, path, text, tspan, textPath, image, svg, g, defs, tref, linearGradient, radialGradient, stop, use, symbol, pattern, mask) for which a default style exists. |
| `styleStack` | table | Stack of style sets saved by pushStyle. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/libs/ezSVG/EzSVG.lua`.*
