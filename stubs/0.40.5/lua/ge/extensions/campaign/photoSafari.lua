---@meta
-- tim19Atlas stub generated from lua/ge/extensions/campaign/photoSafari.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Logic of the campaign's "photo safari" mission: the player must photograph places. On acceptance, a JSON file lists the places (keys = trigger names) with their hints, the target object (objectName) and the closeToPhoto trigger. BeamNG triggers (onBeamNGTrigger) unlock hints and open photo mode; takepiccheck, called by photomode.js, checks that the target is entirely within the camera's field of view and close enough.
--- Access: extension `campaign_photoSafari`: `extensions.load("campaign_photoSafari")`, then the global `campaign_photoSafari`
---@class campaign_photoSafari
---@field accept boolean True when the mission has been accepted and its JSON loaded.
---@field photomodeOpen boolean True when the player is in a place's trigger and can take the photo.
---@field targetObj string|nil Name of the scene object to photograph.
campaign_photoSafari = {}

--- Loads the mission's JSON file (jsonReadFile), sets accept to true, resets hints, found and seen places, and stores each place's hints. Does nothing if the file does not exist.
---Source: lua/ge/extensions/campaign/photoSafari.lua:22
---@param file string Path of the photo safari mission's JSON.
function campaign_photoSafari.missionaccepted(file) end

--- Hook called when a trigger is crossed. Ignores everything except the player's vehicle. On entering a hint trigger: unlocks the next hint of each place not yet found; in a place trigger: stores location/targetObj and opens photo mode; in closeToPhoto: computes the camera-object distance. On exit, closes photo mode or closeToPhoto.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/campaign/photoSafari.lua:40
---@param data table Trigger data: subjectID, event ('enter'/'exit'), triggerName.
function campaign_photoSafari.onBeamNGTrigger(data) end

--- Checks the photo: refuses if the player is not close enough, otherwise tests the camera's distance to the object and that the object's bounding box is entirely within the frustum (Engine.sceneGetCameraFrustum). On success, marks the place as found. Displays the result message.
---Source: lua/ge/extensions/campaign/photoSafari.lua:144
---@return boolean|nil  true if the photo is valid, false otherwise, nil if the place is already found or if the player is too far.
function campaign_photoSafari.takepiccheck() end

