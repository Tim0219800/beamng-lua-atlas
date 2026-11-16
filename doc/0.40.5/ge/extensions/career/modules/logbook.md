# `career_modules_logbook`

*File: `lua/ge/extensions/career/modules/logbook.lua` · VM: Game Engine (GE) · 257 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `career_modules_logbook`: `extensions.load("career_modules_logbook")`, then the global `career_modules_logbook`

Career logbook (logbook.json in the save's career folder). Stores the entries displayed in the UI: unlocking of missions, delivery facilities, spawn points, and help/tutorial pages. On first launch (empty logbook), it creates the introduction entries (welcome, logbook, driving, delivery…) from ui/modules/careerLogbook/pages/<id>/.

## Example

```lua
career_modules_logbook.genericInfoUnlocked("Titre", "Texte", "/ui/cover.jpg")
```

## Notes

- Each entry receives time = os.time(), entryId (increasing counter) and isNew = true.
- getLogbook fires the onLogbookGetEntries(ret) hook so that other extensions add entries, then sorts by descending time (on a tie, by descending entryId).
- setLogbookEntryRead only modifies isNew (not read); getPopups and getLogbookMostRecentUnread read the read field: these two fields are never synchronized in this file (probable inconsistency).
- missionUnlocked reads mission.name before testing id: crashes if id is nil or unknown (mission nil).
- logbookEntry reads the content.html file with readFile without checking that it exists.

**Dependencies (loaded first):** `career_career`

## Functions

| Function | Description | Line |
|---|---|---|
| `career_modules_logbook.addNewLogbookEntry(entry, skipSave)` | Creates the actual entry: sets time, entryId, isNew, inserts it at the head of the list (unless skipSave) and, if entry.showMessage and outside the tutorial, displays a UI message (guihooks Message, 15 s). | 84 |
| `career_modules_logbook.deliveryFacilityUnlocked(id)` | Called when a delivery facility is unlocked: creates a progress entry (facility name and preview). Does nothing if the facility is not found. | 120 |
| `career_modules_logbook.genericInfoUnlocked(title, text, cover, ratio, flavour, type)` | "Normal" information/tutorial entry; plays the UI_Checkpoint sound (only once per frame, never during the tutorial). | 148 |
| `career_modules_logbook.genericLogbookEntry(title, text, cover, coverText)` | Generic info-type entry, with no sound or special behavior. | 170 |
| `career_modules_logbook.getLogbook()` | Returns a copy of the entries list, enriched by the onLogbookGetEntries hook and sorted from most recent to oldest. | 23 |
| `career_modules_logbook.getLogbookMostRecentUnread(limit)` | Returns up to `limit` recent entries (hideInRecent excluded), placing unread ones first, then read ones. | 46 |
| `career_modules_logbook.getPopups()` | Returns the unread entries (read false) marked isPopup. | 35 |
| `career_modules_logbook.logbookEntry(id)` | Creates a help entry from a page id: title ui.introPopup.<id>.title, content from ui/modules/careerLogbook/pages/<id>/content.html (line breaks removed) and header.jpg image. | 203 |
| `career_modules_logbook.missionUnlocked(id)` | Called when a mission is unlocked: creates a progress entry with the mission name and image. | 106 |
| `career_modules_logbook.onCareerActive(active)` | Hook: loads logbook.json; if empty, creates the introduction entries in reverse order of the internal list. *(internal)* *(hook)* | 221 |
| `career_modules_logbook.onSaveCurrentProfile(currentSavePath)` | Save hook: writes {logbook = ...} to <save>/career/logbook.json. *(internal)* *(hook)* | 232 |
| `career_modules_logbook.onUpdate()` | Hook called every frame: resets the sound guard (one sound max per frame). *(internal)* *(hook)* | 239 |
| `career_modules_logbook.setLogbookEntryRead(entryId, read)` | Sets isNew = not read on the entry with identifier entryId. Ignores entryId == -1. | 72 |
| `career_modules_logbook.spawnPointUnlocked(spawnPoint)` | Called when a spawn point is discovered: creates a progress entry with showMessage = true. | 134 |

### Parameter details

#### `career_modules_logbook.addNewLogbookEntry(entry, skipSave)`

Creates the actual entry: sets time, entryId, isNew, inserts it at the head of the list (unless skipSave) and, if entry.showMessage and outside the tutorial, displays a UI message (guihooks Message, 15 s).

- `entry` (*table|nil*) : Entry data (type, title, text, cover...).
- `skipSave` (*boolean|nil*) : If true, the entry is returned but not stored.
- **returns**: table The completed entry.

#### `career_modules_logbook.deliveryFacilityUnlocked(id)`

Called when a delivery facility is unlocked: creates a progress entry (facility name and preview). Does nothing if the facility is not found.

- `id` (*string*) : Facility identifier.

#### `career_modules_logbook.genericInfoUnlocked(title, text, cover, ratio, flavour, type)`

"Normal" information/tutorial entry; plays the UI_Checkpoint sound (only once per frame, never during the tutorial).

- `title` (*string|table*) : Title or translation key.
- `text` (*string|table*) : Content.
- `cover` (*string|nil*) : Cover image.
- `ratio` (*string|nil*) : Image ratio, "16x9" by default.
- `flavour` (*any*) : Not used in the code.
- `type` (*string|nil*) : Entry type, "info" by default.
- **returns**: table The created entry.

#### `career_modules_logbook.genericLogbookEntry(title, text, cover, coverText)`

Generic info-type entry, with no sound or special behavior.

- `title` (*string|table*) : Title.
- `text` (*string|table*) : Content.
- `cover` (*string|nil*) : Cover image.
- `coverText` (*string|nil*) : Text on the cover.
- **returns**: table The created entry.

#### `career_modules_logbook.getLogbook()`

Returns a copy of the entries list, enriched by the onLogbookGetEntries hook and sorted from most recent to oldest.

- **returns**: table[] Logbook entries.

#### `career_modules_logbook.getLogbookMostRecentUnread(limit)`

Returns up to `limit` recent entries (hideInRecent excluded), placing unread ones first, then read ones.

- `limit` (*integer|nil*) : Maximum number of entries, 3 by default.
- **returns**: table[] Selected entries.

#### `career_modules_logbook.getPopups()`

Returns the unread entries (read false) marked isPopup.

- **returns**: table[] Entries to display in a popup.

#### `career_modules_logbook.logbookEntry(id)`

Creates a help entry from a page id: title ui.introPopup.<id>.title, content from ui/modules/careerLogbook/pages/<id>/content.html (line breaks removed) and header.jpg image.

- `id` (*string*) : Page name (e.g. welcome, driving).

#### `career_modules_logbook.missionUnlocked(id)`

Called when a mission is unlocked: creates a progress entry with the mission name and image.

- `id` (*string*) : Mission identifier.

#### `career_modules_logbook.onCareerActive(active)`

Hook: loads logbook.json; if empty, creates the introduction entries in reverse order of the internal list.

- `active` (*boolean*) : Nothing if false.

#### `career_modules_logbook.onSaveCurrentProfile(currentSavePath)`

Save hook: writes {logbook = ...} to <save>/career/logbook.json.

- `currentSavePath` (*string*) : Save folder.

#### `career_modules_logbook.setLogbookEntryRead(entryId, read)`

Sets isNew = not read on the entry with identifier entryId. Ignores entryId == -1.

- `entryId` (*integer*) : Entry identifier.
- `read` (*boolean*) : true to mark it as read.

#### `career_modules_logbook.spawnPointUnlocked(spawnPoint)`

Called when a spawn point is discovered: creates a progress entry with showMessage = true.

- `spawnPoint` (*table*) : Spawn point (translationId, previews, logbookEntry).

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | table<integer, string> | Extensions loaded before: career_career. |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onLogbookGetEntries` — listened to by 1 module(s)

**UI events (guihooks.trigger):** `Message`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/career/modules/logbook.lua`.*
