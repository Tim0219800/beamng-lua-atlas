---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/liveries/routeLifecycleCallbacks.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Links the livery editor's UI routes (liveries, liveries.edit, liveries.edit.decals...) to Lua code. The UI router calls these Enter, Mount and Leave hooks when the user changes screen; they start and stop the sessions (ui_liveries, ui_liveries_decal), freeze the simulation, drive the camera and the decal cursor, and fill data.liveries with the destination screen's data.
--- Access: extension `ui_liveries_routeLifecycleCallbacks`: `extensions.load("ui_liveries_routeLifecycleCallbacks")`, then the global `ui_liveries_routeLifecycleCallbacks`
---@class ui_liveries_routeLifecycleCallbacks
---@field dependencies string[] Extensions loaded before this one: ui_liveries_saves, ui_liveries, ui_liveries_fill, ui_liveries_decal, ui_liveries_textures, ui_liveries_camera.
ui_liveries_routeLifecycleCallbacks = {}

--- Called when entering the view selection screen. Runs onDecalsEnter and puts the ui_liveries_camera.getViews() list in data.liveries.cameraViews.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/liveries/routeLifecycleCallbacks.lua:137
---@param context any
---@param toRoute any
---@param fromRoute any
---@param data any
function ui_liveries_routeLifecycleCallbacks.onDecalCameraEnter(context, toRoute, fromRoute, data) end

--- Called when entering a decal's material screen. Runs onDecalsEnter, moves the free camera to the decal (params.layerUid) and puts its paint in data.liveries.layerPaint.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/liveries/routeLifecycleCallbacks.lua:144
---@param context any
---@param toRoute any
---@param fromRoute any
---@param data any
function ui_liveries_routeLifecycleCallbacks.onDecalMaterialEnter(context, toRoute, fromRoute, data) end

--- Called when entering a decal's mirror screen. Runs onDecalsEnter, warns if params.layerUid is missing, frames the orbit camera on the decal and puts its mirror settings in data.liveries.decalMirror.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/liveries/routeLifecycleCallbacks.lua:155
---@param context any
---@param toRoute any
---@param fromRoute any
---@param data any
function ui_liveries_routeLifecycleCallbacks.onDecalMirrorEnter(context, toRoute, fromRoute, data) end

--- Called when the decal selector is mounted. Loads the textures with ui_liveries_textures.loadTextures.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/liveries/routeLifecycleCallbacks.lua:170
---@param context any
---@param toRoute any
---@param fromRoute any
---@param data any
function ui_liveries_routeLifecycleCallbacks.onDecalSelectorMount(context, toRoute, fromRoute, data) end

--- Called when leaving the new decal transform screen. Hides the cursor unless going to the settings, then runs onDecalsLeave.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/liveries/routeLifecycleCallbacks.lua:196
---@param context any
---@param toRoute any
---@param fromRoute any
---@param data any
function ui_liveries_routeLifecycleCallbacks.onDecalTransformLeave(context, toRoute, fromRoute, data) end

--- Called when the new decal transform screen is mounted. Notifies the UI, resumes the action map if returning from the settings, otherwise shows the selected decal's cursor, then puts decalTransform and decalMouseMode in data.liveries.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/liveries/routeLifecycleCallbacks.lua:174
---@param context any
---@param toRoute any
---@param fromRoute any
---@param data any
function ui_liveries_routeLifecycleCallbacks.onDecalTransformMount(context, toRoute, fromRoute, data) end

--- Called when entering the new decal transform settings. Runs onDecalsEnter, suspends the transform action map and puts decalMirror and layerPaint in data.liveries.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/liveries/routeLifecycleCallbacks.lua:203
---@param context any
---@param toRoute any
---@param fromRoute any
---@param data any
function ui_liveries_routeLifecycleCallbacks.onDecalTransformSettingsEnter(context, toRoute, fromRoute, data) end

--- Called when leaving the transform settings. If returning to a transform route, resumes the action map; otherwise runs onDecalsLeave.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/liveries/routeLifecycleCallbacks.lua:212
---@param context any
---@param toRoute any
---@param fromRoute any
---@param data any
function ui_liveries_routeLifecycleCallbacks.onDecalTransformSettingsLeave(context, toRoute, fromRoute, data) end

--- Called when entering the liveries.edit.decals branch. Starts ui_liveries_decal.setup only if coming from outside this branch.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/liveries/routeLifecycleCallbacks.lua:124
---@param context any
---@param toRoute any
---@param fromRoute any
---@param data any
function ui_liveries_routeLifecycleCallbacks.onDecalsEnter(context, toRoute, fromRoute, data) end

--- Called when leaving the decals branch. If the destination stays within this branch, does nothing; otherwise calls ui_liveries_decal.teardown then onLiveriesLeave.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/liveries/routeLifecycleCallbacks.lua:187
---@param context any
---@param toRoute any
---@param fromRoute any
---@param data any
function ui_liveries_routeLifecycleCallbacks.onDecalsLeave(context, toRoute, fromRoute, data) end

--- Called when the decals screen is mounted. Asks ui_liveries_decal.notifyUi to send the state to the UI.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/liveries/routeLifecycleCallbacks.lua:133
---@param context any
---@param toRoute any
---@param fromRoute any
---@param data any
function ui_liveries_routeLifecycleCallbacks.onDecalsMount(context, toRoute, fromRoute, data) end

--- Called when entering the existing decal transform screen. Runs onDecalsEnter then ui_liveries_decal.beginExistingTransform(params.layerUid); warns if layerUid is missing.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/liveries/routeLifecycleCallbacks.lua:220
---@param context any
---@param toRoute any
---@param fromRoute any
---@param data any
function ui_liveries_routeLifecycleCallbacks.onExistingDecalTransformEnter(context, toRoute, fromRoute, data) end

--- Called when leaving the existing decal transform. Ends the transform (endExistingTransform) unless going to the settings, then runs onDecalsLeave.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/liveries/routeLifecycleCallbacks.lua:245
---@param context any
---@param toRoute any
---@param fromRoute any
---@param data any
function ui_liveries_routeLifecycleCallbacks.onExistingDecalTransformLeave(context, toRoute, fromRoute, data) end

--- Called when the existing decal transform screen is mounted. Resumes the action map if returning from the settings, otherwise shows the existing decal's cursor, then puts decalTransform and decalMouseMode in data.liveries.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/liveries/routeLifecycleCallbacks.lua:233
---@param context any
---@param toRoute any
---@param fromRoute any
---@param data any
function ui_liveries_routeLifecycleCallbacks.onExistingDecalTransformMount(context, toRoute, fromRoute, data) end

--- Called when entering liveries.edit. If coming from outside the edit branch, starts the session with ui_liveries.setup(params.saveName) (no saveName: new livery) and logs a warning on failure. Sets data.liveries.currentSaveName so that the save form offers to overwrite.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/liveries/routeLifecycleCallbacks.lua:81
---@param context any
---@param toRoute any
---@param fromRoute any
---@param data any
function ui_liveries_routeLifecycleCallbacks.onLiveriesEditEnter(context, toRoute, fromRoute, data) end

--- Called when entering the liveries route. Pauses the simulation and puts the list of saved liveries (ui_liveries_saves.getAll) in data.liveries.saveFiles.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/liveries/routeLifecycleCallbacks.lua:70
---@param context any
---@param toRoute any
---@param fromRoute any
---@param data any
function ui_liveries_routeLifecycleCallbacks.onLiveriesEnter(context, toRoute, fromRoute, data) end

--- Called when leaving a liveries route. If the destination stays within the edit branch, does nothing more; otherwise calls ui_liveries.teardown then applies the pending skin (ui_liveries_saves.consumeStagedApplySkin) with core_vehicle_partmgmt.setSkin.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/liveries/routeLifecycleCallbacks.lua:110
---@param context any
---@param toRoute any
---@param fromRoute any
---@param data any
function ui_liveries_routeLifecycleCallbacks.onLiveriesLeave(context, toRoute, fromRoute, data) end

--- Called when the liveries route is mounted. Does nothing.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/liveries/routeLifecycleCallbacks.lua:78
---@param context any
---@param toRoute any
---@param fromRoute any
---@param data any
function ui_liveries_routeLifecycleCallbacks.onLiveriesMount(context, toRoute, fromRoute, data) end

--- Called when entering the paint screen. Puts the base layer's paint (ui_liveries_fill.getPaint) in data.liveries.layerPaint.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/liveries/routeLifecycleCallbacks.lua:100
---@param context any
---@param toRoute any
---@param fromRoute any
---@param data any
function ui_liveries_routeLifecycleCallbacks.onLiveriesPaintEnter(context, toRoute, fromRoute, data) end

--- Called when leaving the liveries home screen. Removes the simulation pause request (no other Leave hook exists for this screen).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/liveries/routeLifecycleCallbacks.lua:106
---@param context any
---@param toRoute any
---@param fromRoute any
---@param data any
function ui_liveries_routeLifecycleCallbacks.onLiveriesRootLeave(context, toRoute, fromRoute, data) end

