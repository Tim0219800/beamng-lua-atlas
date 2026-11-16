---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/tutorialPopups.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Manages the career's introduction popups (tutorial and contextual help): remembers which ones have already been seen (flags saved in <profile>/career/tutorialData.json), opens them via ui_popup from /gameplay/tutorials/pages/, and queues those that would arrive during a tutorial "damaged vehicle" popup. Also exposes named functions (showWelcomeSplashscreen, onCareerTuningStarted, onEnterCargoOverviewScreen...) that serve as hooks or direct calls to display the associated popup only once.
--- Access: extension `career_modules_tutorialPopups`: `extensions.load("career_modules_tutorialPopups")`, then the global `career_modules_tutorialPopups`
---@class career_modules_tutorialPopups
---@field allTutorialFlags string[] List of known popup ids (welcome, driving, crashRecover, bigmap, refueling, missions, tuning, insurance, leagues, etc.).
---@field dependencies string[] {'ui_popup', 'gameplay_tutorial_damageTracker'}.
career_modules_tutorialPopups = {}

--- Draws the "Intro Popups" debug imgui menu: review all, mark all unseen, per-popup checkboxes, content edit button.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/tutorialPopups.lua:236
function career_modules_tutorialPopups.drawDebugFunctions() end

--- Reads a popup's flag (true if seen).
---Source: lua/ge/extensions/career/modules/tutorialPopups.lua:24
---@param key string Popup id.
---@return boolean|nil  Flag value.
function career_modules_tutorialPopups.getTutorialFlag(key) end

--- Opens an intro popup. Without force, does nothing if it has already been seen. May be queued after a tutorial damage popup.
---Source: lua/ge/extensions/career/modules/tutorialPopups.lua:83
---@param id string Page id (e.g. "v2/basicControls").
---@param force boolean|nil If true, ignores the "already seen" flag.
function career_modules_tutorialPopups.introPopup(id, force) end

--- Opens several popups in sequence (ui_popup.openPopupsByIds) and marks all ids as seen.
---Source: lua/ge/extensions/career/modules/tutorialPopups.lua:105
---@param ids string[] Page ids.
---@param force boolean|nil If false or nil, only marks the pages not yet seen; the sequence is opened in all cases.
function career_modules_tutorialPopups.introPopupSequence(ids, force) end

--- Load hook: reads the flags from tutorialData.json of the current profile.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/tutorialPopups.lua:41
function career_modules_tutorialPopups.onExtensionLoaded() end

--- Hook emitted when a popup closes: if it is a damage popup, marks the closing, then reopens the first queued popup.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/tutorialPopups.lua:71
---@param id string Id of the closed popup.
function career_modules_tutorialPopups.onIntroPopupCareerClosed(id) end

--- Profile save hook: writes the flags to tutorialData.json.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/tutorialPopups.lua:47
---@param currentSavePath string Profile save folder.
function career_modules_tutorialPopups.onSaveCurrentProfile(currentSavePath) end

--- Replaces the whole "popup seen" flags table.
---Source: lua/ge/extensions/career/modules/tutorialPopups.lua:20
---@param flagsTable table<string, boolean>|nil New table; nil gives an empty table.
function career_modules_tutorialPopups.setFlagsTable(flagsTable) end

--- Updates a popup's flag.
---Source: lua/ge/extensions/career/modules/tutorialPopups.lua:28
---@param key string Popup id.
---@param value boolean Seen or not.
function career_modules_tutorialPopups.setTutorialFlag(key, value) end

--- Resets all flags to false then redisplays all the welcome popups and all the popups of the internal table (useful to review the help).
---Source: lua/ge/extensions/career/modules/tutorialPopups.lua:186
function career_modules_tutorialPopups.showAllSplashscreensAndLogbookEntries() end

--- Displays (forced) the welcome popups without tutorial: welcomeNoTutorial, leagues, performanceIndex, logbook.
---Source: lua/ge/extensions/career/modules/tutorialPopups.lua:171
function career_modules_tutorialPopups.showNonTutorialWelcomeSplashscreen() end

--- Indicates whether all the listed popups have already been seen.
---Source: lua/ge/extensions/career/modules/tutorialPopups.lua:32
---@param pages string[]|nil Popup ids.
---@return boolean  true if all have their flag (also true for an empty list).
function career_modules_tutorialPopups.wasIntroPopupsSeen(pages) end

