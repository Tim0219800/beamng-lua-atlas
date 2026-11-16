# `utils_debugDraw`

*File: `lua/common/utils/debugDraw.lua` · VM: Common (GE + vehicle) · 58 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("utils/debugDraw")`

Fast wrapper (FFI) around the engine's debug drawing (BNG_DBG_DRAW_*). In the GE the calls are made in onPreRender(), on the vehicle side in onDebugDraw(). Loaded with require('utils/debugDraw'). Colors are 'packed' integers (see the global color() in utils.lua) and not ColorF/ColorI. The fields M.Sphere, M.Line, etc. are the raw FFI functions (separate x,y,z coordinates); the M.drawXxx accept vec3.

## Example

```lua
local dd = require('utils/debugDraw')
dd.drawSphere(vec3(0,0,1), 0.5, color(255,0,0,255))
dd.drawTextAdvanced(vec3(0,0,2), 'hello')
```

## Notes

- If ffi is absent, a log E is emitted and all fields are nop (empty function).
- Bug: drawTextAdvanced uses the variable `defaultTextColBg` (never defined; the local constant is named DEFAULTTEXTCOLBG): bgColorPacked is therefore nil by default instead of the intended translucent gray.
- The generation tool flags the fields M.Cylinder, M.Line, etc. as 'ffifound undefined': this is a false positive of the analysis, ffifound is properly defined locally (pcall(require,'ffi')).
- The fields Cylinder, Line, Text, LineInstance_MinArgBatch and TriSolidBatch have no vec3 wrapper; they must be called with separate coordinates (engine C signature, not visible in this file).

## Functions

| Function | Description | Line |
|---|---|---|
| `utils_debugDraw.drawLineInstance_MinArg(posA, posB, w, packedCol)` | Draws a line (instanced version, minimal arguments). | 37 |
| `utils_debugDraw.drawSphere(pos, r, packedCol, useZ)` | Draws a debug sphere. The only difference from debugDrawer: the color is a packed integer. | 33 |
| `utils_debugDraw.drawSquarePrism(base, tip, baseSize, tipSize, packedCol, useZ)` | Draws a square/rectangular-base prism between two points. | 40 |
| `utils_debugDraw.drawTextAdvanced(pos, txt, packedCol, useAdvancedText, twod, bgColorPacked, shadow, useZ)` | Draws text at a 3D or 2D position. Default values: white text, useAdvancedText=false, twod=false, shadow=false, useZ=true. | 44 |
| `utils_debugDraw.drawTriSolid(posA, posB, posC, packedCol, useZ)` | Draws a solid triangle. | 53 |

### Parameter details

#### `utils_debugDraw.drawLineInstance_MinArg(posA, posB, w, packedCol)`

Draws a line (instanced version, minimal arguments).

- `posA` (*vec3*) : Start
- `posB` (*vec3*) : End
- `w` (*number*) : Thickness
- `packedCol` (*integer*) : Packed RGBA color

#### `utils_debugDraw.drawSphere(pos, r, packedCol, useZ)`

Draws a debug sphere. The only difference from debugDrawer: the color is a packed integer.

- `pos` (*vec3*) : Center (m)
- `r` (*number*) : Radius (m)
- `packedCol` (*integer*) : Packed RGBA color (color())
- `useZ` (*boolean|nil*) : Depth test, true by default

#### `utils_debugDraw.drawSquarePrism(base, tip, baseSize, tipSize, packedCol, useZ)`

Draws a square/rectangular-base prism between two points.

- `base` (*vec3*) : Center of the base
- `tip` (*vec3*) : Center of the end
- `baseSize` (*vec3*) : Dimensions (x,y) of the base
- `tipSize` (*vec3*) : Dimensions (x,y) of the end
- `packedCol` (*integer*) : Packed RGBA color
- `useZ` (*boolean|nil*) : Depth test, true by default

#### `utils_debugDraw.drawTextAdvanced(pos, txt, packedCol, useAdvancedText, twod, bgColorPacked, shadow, useZ)`

Draws text at a 3D or 2D position. Default values: white text, useAdvancedText=false, twod=false, shadow=false, useZ=true.

- `pos` (*vec3*) : Position
- `txt` (*string*) : Text
- `packedCol` (*integer|nil*) : Text color (white by default)
- `useAdvancedText` (*boolean|nil*) : Advanced text, false by default
- `twod` (*boolean|nil*) : 2D screen position, false by default
- `bgColorPacked` (*integer|nil*) : Background color (see notes: bug, nil by default)
- `shadow` (*boolean|nil*) : Shadow, false by default
- `useZ` (*boolean|nil*) : Depth test, true by default

#### `utils_debugDraw.drawTriSolid(posA, posB, posC, packedCol, useZ)`

Draws a solid triangle.

- `posA` (*vec3*) : Vertex A
- `posB` (*vec3*) : Vertex B
- `posC` (*vec3*) : Vertex C
- `packedCol` (*integer*) : Packed RGBA color
- `useZ` (*boolean|nil*) : Depth test, true by default

## Fields

| Field | Type | Description |
|---|---|---|
| `Cylinder` | function | BNG_DBG_DRAW_Cylinder, raw FFI (signature not visible here). |
| `Line` | function | BNG_DBG_DRAW_Line, raw FFI (signature not visible here). |
| `LineInstance_MinArg` | function | BNG_DBG_DRAW_LineInstance_MinArg(ax,ay,az,bx,by,bz,w,packedCol), raw FFI. |
| `LineInstance_MinArgBatch` | function | Batch version of LineInstance_MinArg (raw FFI). |
| `Sphere` | function | BNG_DBG_DRAW_Sphere(x, y, z, r, packedCol, useZ), raw FFI. |
| `SquarePrism` | function | BNG_DBG_DRAW_SquarePrism(...), raw FFI. |
| `Text` | function | BNG_DBG_DRAW_Text, raw FFI (signature not visible here). |
| `TextAdvanced` | function | BNG_DBG_DRAW_TextAdvanced(x,y,z,txt,packedCol,useAdvancedText,twod,bgColorPacked,shadow,useZ), raw FFI. |
| `TriSolid` | function | BNG_DBG_DRAW_TriSolid(...), raw FFI. |
| `TriSolidBatch` | function | Batch version of TriSolid (raw FFI). |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/utils/debugDraw.lua`.*
