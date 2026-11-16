---@meta
-- tim19Atlas stub generated from lua/ge/extensions/campaign/comics.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Shows a comic (sequence of panels) in the campaign interface. playComic builds the list of panels from comicData then opens the UI screen "campaign.comic"; when the Spine animation is finished, the provided callback is called. The GUI audio channel is played during the display.
--- Access: extension `campaign_comics`: `extensions.load("campaign_comics")`, then the global `campaign_comics`
---@class campaign_comics
campaign_comics = {}

--- Scenario change hook: if sc is nil or its state is "pre-start", restores the stored audio volumes.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/campaign/comics.lua:68
---@param sc table|nil Current scenario; its state field is read.
function campaign_comics.onScenarioChange(sc) end

--- Hook called by the interface at the end of the Spine animation: runs the stored callback (only once), restores the volumes and stops the AudioChannelGui channel (stop with parameter 1).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/campaign/comics.lua:56
function campaign_comics.onSpineAnimationFinished() end

--- Prepares the panels, starts the AudioChannelGui audio channel and navigates to the "campaign.comic" screen with the list of panels. Stores the end callback.
---Source: lua/ge/extensions/campaign/comics.lua:18
---@param comicData table Description of the comic: path, order, backgroundSound.
---@param comicFinishedCallback function|nil Called once the comic is finished; nop if absent.
function campaign_comics.playComic(comicData, comicFinishedCallback) end

