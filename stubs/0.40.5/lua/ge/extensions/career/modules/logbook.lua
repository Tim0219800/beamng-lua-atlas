---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/logbook.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Career logbook (logbook.json in the save's career folder). Stores the entries displayed in the UI: unlocking of missions, delivery facilities, spawn points, and help/tutorial pages. On first launch (empty logbook), it creates the introduction entries (welcome, logbook, driving, delivery…) from ui/modules/careerLogbook/pages/<id>/.
--- Access: extension `career_modules_logbook`: `extensions.load("career_modules_logbook")`, then the global `career_modules_logbook`
---@class career_modules_logbook
---@field dependencies table<integer, string> Extensions loaded before: career_career.
career_modules_logbook = {}

--- Creates the actual entry: sets time, entryId, isNew, inserts it at the head of the list (unless skipSave) and, if entry.showMessage and outside the tutorial, displays a UI message (guihooks Message, 15 s).
---Source: lua/ge/extensions/career/modules/logbook.lua:84
---@param entry table|nil Entry data (type, title, text, cover...).
---@param skipSave boolean|nil If true, the entry is returned but not stored.
---@return table  The completed entry.
function career_modules_logbook.addNewLogbookEntry(entry, skipSave) end

--- Called when a delivery facility is unlocked: creates a progress entry (facility name and preview). Does nothing if the facility is not found.
---Source: lua/ge/extensions/career/modules/logbook.lua:120
---@param id string Facility identifier.
function career_modules_logbook.deliveryFacilityUnlocked(id) end

--- "Normal" information/tutorial entry; plays the UI_Checkpoint sound (only once per frame, never during the tutorial).
---Source: lua/ge/extensions/career/modules/logbook.lua:148
---@param title string|table Title or translation key.
---@param text string|table Content.
---@param cover string|nil Cover image.
---@param ratio string|nil Image ratio, "16x9" by default.
---@param flavour any Not used in the code.
---@param type string|nil Entry type, "info" by default.
---@return table  The created entry.
function career_modules_logbook.genericInfoUnlocked(title, text, cover, ratio, flavour, type) end

--- Generic info-type entry, with no sound or special behavior.
---Source: lua/ge/extensions/career/modules/logbook.lua:170
---@param title string|table Title.
---@param text string|table Content.
---@param cover string|nil Cover image.
---@param coverText string|nil Text on the cover.
---@return table  The created entry.
function career_modules_logbook.genericLogbookEntry(title, text, cover, coverText) end

--- Returns a copy of the entries list, enriched by the onLogbookGetEntries hook and sorted from most recent to oldest.
---Source: lua/ge/extensions/career/modules/logbook.lua:23
---@return table[]  Logbook entries.
function career_modules_logbook.getLogbook() end

--- Returns up to `limit` recent entries (hideInRecent excluded), placing unread ones first, then read ones.
---Source: lua/ge/extensions/career/modules/logbook.lua:46
---@param limit integer|nil Maximum number of entries, 3 by default.
---@return table[]  Selected entries.
function career_modules_logbook.getLogbookMostRecentUnread(limit) end

--- Returns the unread entries (read false) marked isPopup.
---Source: lua/ge/extensions/career/modules/logbook.lua:35
---@return table[]  Entries to display in a popup.
function career_modules_logbook.getPopups() end

--- Creates a help entry from a page id: title ui.introPopup.<id>.title, content from ui/modules/careerLogbook/pages/<id>/content.html (line breaks removed) and header.jpg image.
---Source: lua/ge/extensions/career/modules/logbook.lua:203
---@param id string Page name (e.g. welcome, driving).
function career_modules_logbook.logbookEntry(id) end

--- Called when a mission is unlocked: creates a progress entry with the mission name and image.
---Source: lua/ge/extensions/career/modules/logbook.lua:106
---@param id string Mission identifier.
function career_modules_logbook.missionUnlocked(id) end

--- Hook: loads logbook.json; if empty, creates the introduction entries in reverse order of the internal list.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/logbook.lua:221
---@param active boolean Nothing if false.
function career_modules_logbook.onCareerActive(active) end

--- Save hook: writes {logbook = ...} to <save>/career/logbook.json.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/logbook.lua:232
---@param currentSavePath string Save folder.
function career_modules_logbook.onSaveCurrentProfile(currentSavePath) end

--- Hook called every frame: resets the sound guard (one sound max per frame).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/logbook.lua:239
function career_modules_logbook.onUpdate() end

--- Sets isNew = not read on the entry with identifier entryId. Ignores entryId == -1.
---Source: lua/ge/extensions/career/modules/logbook.lua:72
---@param entryId integer Entry identifier.
---@param read boolean true to mark it as read.
function career_modules_logbook.setLogbookEntryRead(entryId, read) end

--- Called when a spawn point is discovered: creates a progress entry with showMessage = true.
---Source: lua/ge/extensions/career/modules/logbook.lua:134
---@param spawnPoint table Spawn point (translationId, previews, logbookEntry).
function career_modules_logbook.spawnPointUnlocked(spawnPoint) end

