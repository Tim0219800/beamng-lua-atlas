---@meta
-- tim19Atlas stub generated from lua/ge/extensions/campaign/photoSafari.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `campaign_photoSafari` : `extensions.load("campaign_photoSafari")`, puis la globale `campaign_photoSafari`
---@class campaign_photoSafari
---@field accept boolean
---@field photomodeOpen boolean
---@field targetObj any
campaign_photoSafari = {}

--- M.photoSafariData.subLocations[M.location].hints
---
--- is called when photosafari mission accepted
--- @file is json file of photsafari
--- this function reads json file in photosafaridata and added all the locations to photsafarimission table
--- also added hints to subLocationsHints table
---Source : lua/ge/extensions/campaign/photoSafari.lua:22
---@param file any
function campaign_photoSafari.missionaccepted(file) end

---Source : lua/ge/extensions/campaign/photoSafari.lua:40
---@param data any
function campaign_photoSafari.onBeamNGTrigger(data) end

--- this function is called inside photomode.js
--- check if the object is in the scene or not and if the camera is adjusted or away from the object
---Source : lua/ge/extensions/campaign/photoSafari.lua:144
function campaign_photoSafari.takepiccheck() end

