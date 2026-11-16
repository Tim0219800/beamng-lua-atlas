---@meta
-- tim19Atlas stub generated from lua/common/utils/debugDraw.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Fast wrapper (FFI) around the engine's debug drawing (BNG_DBG_DRAW_*). In the GE the calls are made in onPreRender(), on the vehicle side in onDebugDraw(). Loaded with require('utils/debugDraw'). Colors are 'packed' integers (see the global color() in utils.lua) and not ColorF/ColorI. The fields M.Sphere, M.Line, etc. are the raw FFI functions (separate x,y,z coordinates); the M.drawXxx accept vec3.
--- Access: `require("utils/debugDraw")`
---@class utils_debugDraw
---@field Cylinder function BNG_DBG_DRAW_Cylinder, raw FFI (signature not visible here).
---@field Line function BNG_DBG_DRAW_Line, raw FFI (signature not visible here).
---@field LineInstance_MinArg function BNG_DBG_DRAW_LineInstance_MinArg(ax,ay,az,bx,by,bz,w,packedCol), raw FFI.
---@field LineInstance_MinArgBatch function Batch version of LineInstance_MinArg (raw FFI).
---@field Sphere function BNG_DBG_DRAW_Sphere(x, y, z, r, packedCol, useZ), raw FFI.
---@field SquarePrism function BNG_DBG_DRAW_SquarePrism(...), raw FFI.
---@field Text function BNG_DBG_DRAW_Text, raw FFI (signature not visible here).
---@field TextAdvanced function BNG_DBG_DRAW_TextAdvanced(x,y,z,txt,packedCol,useAdvancedText,twod,bgColorPacked,shadow,useZ), raw FFI.
---@field TriSolid function BNG_DBG_DRAW_TriSolid(...), raw FFI.
---@field TriSolidBatch function Batch version of TriSolid (raw FFI).
local utils_debugDraw = {}

--- Draws a line (instanced version, minimal arguments).
---Source: lua/common/utils/debugDraw.lua:37
---@param posA vec3 Start
---@param posB vec3 End
---@param w number Thickness
---@param packedCol integer Packed RGBA color
function utils_debugDraw.drawLineInstance_MinArg(posA, posB, w, packedCol) end

--- Draws a debug sphere. The only difference from debugDrawer: the color is a packed integer.
---Source: lua/common/utils/debugDraw.lua:33
---@param pos vec3 Center (m)
---@param r number Radius (m)
---@param packedCol integer Packed RGBA color (color())
---@param useZ boolean|nil Depth test, true by default
function utils_debugDraw.drawSphere(pos, r, packedCol, useZ) end

--- Draws a square/rectangular-base prism between two points.
---Source: lua/common/utils/debugDraw.lua:40
---@param base vec3 Center of the base
---@param tip vec3 Center of the end
---@param baseSize vec3 Dimensions (x,y) of the base
---@param tipSize vec3 Dimensions (x,y) of the end
---@param packedCol integer Packed RGBA color
---@param useZ boolean|nil Depth test, true by default
function utils_debugDraw.drawSquarePrism(base, tip, baseSize, tipSize, packedCol, useZ) end

--- Draws text at a 3D or 2D position. Default values: white text, useAdvancedText=false, twod=false, shadow=false, useZ=true.
---Source: lua/common/utils/debugDraw.lua:44
---@param pos vec3 Position
---@param txt string Text
---@param packedCol integer|nil Text color (white by default)
---@param useAdvancedText boolean|nil Advanced text, false by default
---@param twod boolean|nil 2D screen position, false by default
---@param bgColorPacked integer|nil Background color (see notes: bug, nil by default)
---@param shadow boolean|nil Shadow, false by default
---@param useZ boolean|nil Depth test, true by default
function utils_debugDraw.drawTextAdvanced(pos, txt, packedCol, useAdvancedText, twod, bgColorPacked, shadow, useZ) end

--- Draws a solid triangle.
---Source: lua/common/utils/debugDraw.lua:53
---@param posA vec3 Vertex A
---@param posB vec3 Vertex B
---@param posC vec3 Vertex C
---@param packedCol integer Packed RGBA color
---@param useZ boolean|nil Depth test, true by default
function utils_debugDraw.drawTriSolid(posA, posB, posC, packedCol, useZ) end

return utils_debugDraw
