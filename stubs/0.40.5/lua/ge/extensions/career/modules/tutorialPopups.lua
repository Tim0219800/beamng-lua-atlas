---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/tutorialPopups.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `career_modules_tutorialPopups` : `extensions.load("career_modules_tutorialPopups")`, puis la globale `career_modules_tutorialPopups`
---@class career_modules_tutorialPopups
---@field allTutorialFlags table
---@field dependencies table
career_modules_tutorialPopups = {}

---Source : lua/ge/extensions/career/modules/tutorialPopups.lua:236
function career_modules_tutorialPopups.drawDebugFunctions() end

---Source : lua/ge/extensions/career/modules/tutorialPopups.lua:24
---@param key any
function career_modules_tutorialPopups.getTutorialFlag(key) end

---Source : lua/ge/extensions/career/modules/tutorialPopups.lua:83
---@param id any
---@param force any
function career_modules_tutorialPopups.introPopup(id, force) end

---Source : lua/ge/extensions/career/modules/tutorialPopups.lua:105
---@param ids any
---@param force any
function career_modules_tutorialPopups.introPopupSequence(ids, force) end

---Source : lua/ge/extensions/career/modules/tutorialPopups.lua:41
function career_modules_tutorialPopups.onExtensionLoaded() end

--- Called when any tutorial popup is closed (from UI). Show damage popup first; once closed, show next queued popup.
---Source : lua/ge/extensions/career/modules/tutorialPopups.lua:71
---@param id any
function career_modules_tutorialPopups.onIntroPopupCareerClosed(id) end

---Source : lua/ge/extensions/career/modules/tutorialPopups.lua:47
---@param currentSavePath any
function career_modules_tutorialPopups.onSaveCurrentProfile(currentSavePath) end

---Source : lua/ge/extensions/career/modules/tutorialPopups.lua:20
---@param flagsTable any
function career_modules_tutorialPopups.setFlagsTable(flagsTable) end

---Source : lua/ge/extensions/career/modules/tutorialPopups.lua:28
---@param key any
---@param value any
function career_modules_tutorialPopups.setTutorialFlag(key, value) end

---Source : lua/ge/extensions/career/modules/tutorialPopups.lua:186
function career_modules_tutorialPopups.showAllSplashscreensAndLogbookEntries() end

---Source : lua/ge/extensions/career/modules/tutorialPopups.lua:171
function career_modules_tutorialPopups.showNonTutorialWelcomeSplashscreen() end

---Source : lua/ge/extensions/career/modules/tutorialPopups.lua:32
---@param pages any
function career_modules_tutorialPopups.wasIntroPopupsSeen(pages) end

