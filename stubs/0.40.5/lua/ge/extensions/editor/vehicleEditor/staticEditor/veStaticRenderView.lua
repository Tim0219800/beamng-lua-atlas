---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/vehicleEditor/staticEditor/veStaticRenderView.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Render views of the Vehicle Editor's Static Editor. Each "Static Render View##N" window has two RenderViews (the main view and a small axes gizmo), in 3D or orthographic mode (Left -X, Right +X, Back -Y, Front +Y, Bottom -Z, Top +Z). The file handles the camera (keyboard movement, mouse), the grid drawn with the debugDrawer, the clickable axis arrows, the context menu and saving the views to settings/vehicleEditorStatic/staticRenderView.json. Other extensions (vePartTree) use it to get the mouse ray in the main view.
--- Access: extension `editor_vehicleEditor_staticEditor_veStaticRenderView`: `extensions.load("editor_vehicleEditor_staticEditor_veStaticRenderView")`, then the global `editor_vehicleEditor_staticEditor_veStaticRenderView`
---@class editor_vehicleEditor_staticEditor_veStaticRenderView
editor_vehicleEditor_staticEditor_veStaticRenderView = {}

--- Creates a new render view (window + RenderViews): reuses the first entry whose window is hidden or deleted, otherwise creates a new entry, registers the window (400x600, vehicleEditor tool) if needed, shows it and saves the settings. Called by the View > Add View menu of veToolbar.
---Source: lua/ge/extensions/editor/vehicleEditor/staticEditor/veStaticRenderView.lua:191
function editor_vehicleEditor_staticEditor_veStaticRenderView.createRenderViewUI() end

--- Destroys all RenderView objects (main and gizmo) of all views, without closing the ImGui windows. Called when leaving the editor.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/vehicleEditor/staticEditor/veStaticRenderView.lua:757
function editor_vehicleEditor_staticEditor_veStaticRenderView.destroyAllRenderViews() end

--- Returns the mouse ray in the main view of the hovered window (rv:getUnprojectedRayPosDir on the mouse coordinates converted into the viewport), or nil if no window is hovered or the mouse is not over the image.
---Source: lua/ge/extensions/editor/vehicleEditor/staticEditor/veStaticRenderView.lua:748
---@return any  result of RenderView:getUnprojectedRayPosDir(x, y), used by vePartTree as (ok, position, direction); nil if outside the view
function editor_vehicleEditor_staticEditor_veStaticRenderView.getMainRenderViewMouseRay() end

--- Sets the intensity of the backward camera movement (camMove.backward). Intended for a keyboard action.
---Source: lua/ge/extensions/editor/vehicleEditor/staticEditor/veStaticRenderView.lua:801
---@param val number input value (0 released, positive pressed)
function editor_vehicleEditor_staticEditor_veStaticRenderView.moveBackward(val) end

--- Sets the intensity of the forward camera movement (camMove.forward).
---Source: lua/ge/extensions/editor/vehicleEditor/staticEditor/veStaticRenderView.lua:800
---@param val number input value
function editor_vehicleEditor_staticEditor_veStaticRenderView.moveForward(val) end

--- Sets the intensity of the leftward camera movement (camMove.left).
---Source: lua/ge/extensions/editor/vehicleEditor/staticEditor/veStaticRenderView.lua:798
---@param val number input value
function editor_vehicleEditor_staticEditor_veStaticRenderView.moveLeft(val) end

--- Sets the intensity of the rightward camera movement (camMove.right).
---Source: lua/ge/extensions/editor/vehicleEditor/staticEditor/veStaticRenderView.lua:799
---@param val number input value
function editor_vehicleEditor_staticEditor_veStaticRenderView.moveRight(val) end

--- Empty function exported under the name onDeserialize (probably a typo for onDeserialized, so never called by the engine).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/vehicleEditor/staticEditor/veStaticRenderView.lua:793
---@param data any unused
function editor_vehicleEditor_staticEditor_veStaticRenderView.onDeserialize(data) end

--- Editor hook called every frame: reads the camera inputs, then for each view opens the window, creates the RenderViews as needed (getOrCreateView, enterFocusObjectsMode) and draws the content; destroys the RenderViews of a closed window.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/vehicleEditor/staticEditor/veStaticRenderView.lua:686
---@param dt number time delta (s) used for camera movement
function editor_vehicleEditor_staticEditor_veStaticRenderView.onEditorGui(dt) end

--- Editor hook called when a headless tool is enabled or disabled. For the static editor, on exit: saves the settings and destroys the RenderViews.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/vehicleEditor/staticEditor/veStaticRenderView.lua:765
---@param enabled boolean true on entering the tool, false on leaving
---@param toolName string name of the tool concerned
function editor_vehicleEditor_staticEditor_veStaticRenderView.onEditorHeadlessChange(enabled, toolName) end

--- Editor hook called at initialization: reloads the saved views from settings/vehicleEditorStatic/staticRenderView.json.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/vehicleEditor/staticEditor/veStaticRenderView.lua:779
function editor_vehicleEditor_staticEditor_veStaticRenderView.onEditorInitialized() end

--- Hook called every frame before rendering: draws the grid (debugDrawer), the view mode text and the axis arrows of each open view.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/vehicleEditor/staticEditor/veStaticRenderView.lua:434
function editor_vehicleEditor_staticEditor_veStaticRenderView.onPreRender() end

--- Hook called before a Lua reload: saves the view settings to the settings file and returns nil.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/vehicleEditor/staticEditor/veStaticRenderView.lua:787
---@return nil  nothing to restore
function editor_vehicleEditor_staticEditor_veStaticRenderView.onSerialize() end

--- Sets the camera speed multiplier: camSpeedMult = s * (camFastSpeedMult - 1) + 1, with camFastSpeedMult = 2.5.
---Source: lua/ge/extensions/editor/vehicleEditor/staticEditor/veStaticRenderView.lua:802
---@param s number 0 for normal speed, 1 for fast speed (2.5x)
function editor_vehicleEditor_staticEditor_veStaticRenderView.setCameraSpeed(s) end

