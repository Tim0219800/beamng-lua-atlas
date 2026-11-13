---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/logbook.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `career_modules_logbook` : `extensions.load("career_modules_logbook")`, puis la globale `career_modules_logbook`
---@class career_modules_logbook
---@field dependencies table
career_modules_logbook = {}

--- this function is used by other functions to create the actual entry.
---Source : lua/ge/extensions/career/modules/logbook.lua:84
---@param entry any
---@param skipSave any
function career_modules_logbook.addNewLogbookEntry(entry, skipSave) end

--- called whenever a facility is unlocked
---Source : lua/ge/extensions/career/modules/logbook.lua:120
---@param id any
function career_modules_logbook.deliveryFacilityUnlocked(id) end

--- this is the "normal" logbook entry. a useful piece of info/tutorial/helps. also plays sound.
---Source : lua/ge/extensions/career/modules/logbook.lua:148
---@param title any
---@param text any
---@param cover any
---@param ratio any
---@param flavour any
---@param type any
function career_modules_logbook.genericInfoUnlocked(title, text, cover, ratio, flavour, type) end

--- this is a generic entry that can be anything, but nothing special.
---Source : lua/ge/extensions/career/modules/logbook.lua:170
---@param title any
---@param text any
---@param cover any
---@param coverText any
function career_modules_logbook.genericLogbookEntry(title, text, cover, coverText) end

---Source : lua/ge/extensions/career/modules/logbook.lua:23
function career_modules_logbook.getLogbook() end

---Source : lua/ge/extensions/career/modules/logbook.lua:46
---@param limit any
function career_modules_logbook.getLogbookMostRecentUnread(limit) end

---Source : lua/ge/extensions/career/modules/logbook.lua:35
function career_modules_logbook.getPopups() end

--- this creates a new logbook entry from an ID. it reads content and header from the folder in ui/modules/careerLogbook/pages/ID/ . Title is ui.introPopup.ID.title
---Source : lua/ge/extensions/career/modules/logbook.lua:203
---@param id any
function career_modules_logbook.logbookEntry(id) end

--- called whenever a new mission is unlocked.
---Source : lua/ge/extensions/career/modules/logbook.lua:106
---@param id any
function career_modules_logbook.missionUnlocked(id) end

---Source : lua/ge/extensions/career/modules/logbook.lua:221
---@param active any
function career_modules_logbook.onCareerActive(active) end

--- this should only be loaded when the career is active
---Source : lua/ge/extensions/career/modules/logbook.lua:232
---@param currentSavePath any
function career_modules_logbook.onSaveCurrentProfile(currentSavePath) end

---Source : lua/ge/extensions/career/modules/logbook.lua:239
function career_modules_logbook.onUpdate() end

---Source : lua/ge/extensions/career/modules/logbook.lua:72
---@param entryId any
---@param read any
function career_modules_logbook.setLogbookEntryRead(entryId, read) end

--- called when a spawnpoint is discovered.
---Source : lua/ge/extensions/career/modules/logbook.lua:134
---@param spawnPoint any
function career_modules_logbook.spawnPointUnlocked(spawnPoint) end

