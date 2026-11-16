---@meta
-- tim19Atlas stub generated from lua/vehicle/extensions/skeleton.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Minimal vehicle extension template, and an extension actually used: main.lua always loads it (extensions.load("skeleton")) at the end of vehicle initialization. Lifecycle: the extension manager loads it, calls onExtensionLoaded(), and if that returns false the extension is unloaded immediately (its hooks will never be called); otherwise it stays active and receives the global hooks (here onDebugDraw, called every debug frame by main.lua). Convention: an extension exposes its hooks in the table M (onExtensionLoaded, onInit, onReset, updateGFX, onDebugDraw, onExtensionUnloaded…) and returns M.
--- This one draws the vehicle's beams and nodes to help get started in jbeam when there is no flexbody.
--- Access: extension `skeleton`: `extensions.load (vehicle VM)("skeleton")`, then the global `skeleton`
---@class skeleton
skeleton = {}

--- Hook called every frame by main.lua (extensions.hook('onDebugDraw', focusPos)). Draws all beams (drawBeam3d), all nodes (drawNodeSphere) and the collision triangles, unless beam debug (bdebug) is active.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/extensions/skeleton.lua:24
---@param focusPos vec3 Camera focus position (unused).
function skeleton.onDebugDraw(focusPos) end

--- Hook called right after the extension loads. Returns false to unload itself (no beams/nodes, showSkeleton false, or flexbodies present), true otherwise.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/extensions/skeleton.lua:11
---@return boolean  false = unload the extension, true = keep it.
function skeleton.onExtensionLoaded() end

