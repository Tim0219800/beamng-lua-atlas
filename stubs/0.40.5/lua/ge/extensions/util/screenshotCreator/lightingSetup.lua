---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/screenshotCreator/lightingSetup.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Sets up the studio lighting for vehicle thumbnails and restores it afterwards. It finds in the scene (scenetree) the objects marked by the dynamic field thumbnailRole: SpotLights (roles key, fill, rim, top, groundFill, horizonFill) and "lightplane" TSStatics serving as reflection cards (horizonCard, shoulderCard, topCard, cameraCard). adjust() places them around the vehicle based on the camera and the bounding box, sets their intensity in lux, applies an exposure correction, adjusts the SSAO, shows or hides the parking markup (field thumbnailLayer = parkingMarkup) and hides the vehicle's occupants. restore() undoes everything (transforms, light fields, visibility).
--- Access: extension `util_screenshotCreator_lightingSetup`: `extensions.load("util_screenshotCreator_lightingSetup")`, then the global `util_screenshotCreator_lightingSetup`
---@class util_screenshotCreator_lightingSetup
---@field dependencies string[] Extensions loaded before: util_screenshotCreator_settings and util_screenshotCreator_vehicleSetup.
---@field onClientEndMission function Alias of M.restore: restores the lighting at the end of the level.
---@field onExit function Alias of M.restore: restores the lighting when the game closes.
---@field onExtensionUnloaded function Alias of M.restore: restores the lighting when the extension is unloaded.
util_screenshotCreator_lightingSetup = {}

--- Sets up the capture lighting for this vehicle and this camera: rig spotlights, reflection cards, SSAO, parking markup, occupant hiding, and enabling the cards' render mask on the main view.
---Source: lua/ge/extensions/util/screenshotCreator/lightingSetup.lua:876
---@param vehicle table Vehicle object to photograph.
---@param camera table Resolved camera: {pos = vec3, rot = quat, ...} (framing result).
---@return boolean  true if everything was applied, false on failure (the state is then restored).
function util_screenshotCreator_lightingSetup.adjust(vehicle, camera) end

--- Clears the thumbnailLayer field of all parking markup objects.
---Source: lua/ge/extensions/util/screenshotCreator/lightingSetup.lua:719
---@return integer  Number of objects whose tag was cleared.
function util_screenshotCreator_lightingSetup.clearMarkupTags() end

--- Counts the scene objects marked thumbnailLayer = parkingMarkup.
---Source: lua/ge/extensions/util/screenshotCreator/lightingSetup.lua:714
---@return integer  Number of markup objects.
function util_screenshotCreator_lightingSetup.getMarkupCount() end

--- Temporarily hides the active reflection cards (setHidden and setRenderEnabled(false)) for a "Tech" capture. To be followed by restoreReflectionCardsAfterTechCapture.
---Source: lua/ge/extensions/util/screenshotCreator/lightingSetup.lua:295
---@return boolean  false if a hide is already in progress (nested call) or on error (visibility restored).
function util_screenshotCreator_lightingSetup.hideReflectionCardsForTechCapture() end

--- Undoes all the changes made by adjust: view mask, SSAO, markup, occupants, reflection cards and lights (transform and fields intensity, innerAngle, outerAngle, range, castShadows). Unrestored states are kept for a new attempt.
---Source: lua/ge/extensions/util/screenshotCreator/lightingSetup.lua:334
---@return boolean  true if everything was restored exactly.
function util_screenshotCreator_lightingSetup.restore() end

--- Restores the original visibility of the cards hidden by hideReflectionCardsForTechCapture.
---Source: lua/ge/extensions/util/screenshotCreator/lightingSetup.lua:260
---@return boolean  true if all cards have recovered their state.
function util_screenshotCreator_lightingSetup.restoreReflectionCardsAfterTechCapture() end

--- Internal assertion-based test on the card geometry (direction, transform, rear side, rotation around the vertical axis).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/screenshotCreator/lightingSetup.lua:548
---@return boolean  Always true (otherwise an assertion fails).
function util_screenshotCreator_lightingSetup.selfCheck() end

