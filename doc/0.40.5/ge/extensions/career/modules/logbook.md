# `career_modules_logbook`

*Fichier : `lua/ge/extensions/career/modules/logbook.lua` · VM : Game Engine (GE) · 257 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `career_modules_logbook` : `extensions.load("career_modules_logbook")`, puis la globale `career_modules_logbook`

**Dépendances (chargées avant) :** `career_career`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `career_modules_logbook.addNewLogbookEntry(entry, skipSave)` | this function is used by other functions to create the actual entry. | 84 |
| `career_modules_logbook.deliveryFacilityUnlocked(id)` | called whenever a facility is unlocked | 120 |
| `career_modules_logbook.genericInfoUnlocked(title, text, cover, ratio, flavour, type)` | this is the "normal" logbook entry. a useful piece of info/tutorial/helps. also plays sound. | 148 |
| `career_modules_logbook.genericLogbookEntry(title, text, cover, coverText)` | this is a generic entry that can be anything, but nothing special. | 170 |
| `career_modules_logbook.getLogbook()` |  | 23 |
| `career_modules_logbook.getLogbookMostRecentUnread(limit)` |  | 46 |
| `career_modules_logbook.getPopups()` |  | 35 |
| `career_modules_logbook.logbookEntry(id)` | this creates a new logbook entry from an ID. it reads content and header from the folder in ui/modules/careerLogbook/pages/ID/ . Title is ui.introPopup.ID.title | 203 |
| `career_modules_logbook.missionUnlocked(id)` | called whenever a new mission is unlocked. | 106 |
| `career_modules_logbook.onCareerActive(active)` | *(hook)* | 221 |
| `career_modules_logbook.onSaveCurrentProfile(currentSavePath)` | this should only be loaded when the career is active *(hook)* | 232 |
| `career_modules_logbook.onUpdate()` | *(hook)* | 239 |
| `career_modules_logbook.setLogbookEntryRead(entryId, read)` |  | 72 |
| `career_modules_logbook.spawnPointUnlocked(spawnPoint)` | called when a spawnpoint is discovered. | 134 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table |  |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onLogbookGetEntries` — écouté par 1 module(s)

**Évènements UI (guihooks.trigger) :** `Message`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/career/modules/logbook.lua`.*
