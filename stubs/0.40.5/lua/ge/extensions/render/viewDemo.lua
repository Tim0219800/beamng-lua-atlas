---@meta
-- tim19Atlas stub generated from lua/ge/extensions/render/viewDemo.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Small example of using render views (RenderViewManagerInstance): creates a view named 'Demo view 1' rendered into a named texture, moves its camera in a circle and displays it in an ImGui window. To be loaded by hand with extensions.load('render_viewDemo'); serves as a template for a modder who wants a virtual camera to a texture.
--- Access: extension `render_viewDemo`: `extensions.load("render_viewDemo")`, then the global `render_viewDemo`
---@class render_viewDemo
render_viewDemo = {}

--- Hook called every frame: creates the view on the first call, moves the camera (position sin/cos of simulated time, height 1.5), draws a debug text and displays the view's texture in the ImGui window 'Render view test'.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/render/viewDemo.lua:25
---@param dtReal number Real frame duration (s), unused.
---@param dtSim number Simulated duration (s), added to a local timer.
---@param dtRaw number Raw duration (s), unused.
function render_viewDemo.onUpdate(dtReal, dtSim, dtRaw) end

