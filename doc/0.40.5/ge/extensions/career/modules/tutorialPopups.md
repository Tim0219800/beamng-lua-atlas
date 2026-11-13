# `career_modules_tutorialPopups`

*Fichier : `lua/ge/extensions/career/modules/tutorialPopups.lua` · VM : Game Engine (GE) · 304 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `career_modules_tutorialPopups` : `extensions.load("career_modules_tutorialPopups")`, puis la globale `career_modules_tutorialPopups`

**Dépendances (chargées avant) :** `ui_popup`, `gameplay_tutorial_damageTracker`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `career_modules_tutorialPopups.drawDebugFunctions()` |  | 236 |
| `career_modules_tutorialPopups.getTutorialFlag(key)` |  | 24 |
| `career_modules_tutorialPopups.introPopup(id, force)` |  | 83 |
| `career_modules_tutorialPopups.introPopupSequence(ids, force)` |  | 105 |
| `career_modules_tutorialPopups.onExtensionLoaded()` | *(hook)* | 41 |
| `career_modules_tutorialPopups.onIntroPopupCareerClosed(id)` | Called when any tutorial popup is closed (from UI). Show damage popup first; once closed, show next queued popup. *(hook)* | 71 |
| `career_modules_tutorialPopups.onSaveCurrentProfile(currentSavePath)` | *(hook)* | 47 |
| `career_modules_tutorialPopups.setFlagsTable(flagsTable)` |  | 20 |
| `career_modules_tutorialPopups.setTutorialFlag(key, value)` |  | 28 |
| `career_modules_tutorialPopups.showAllSplashscreensAndLogbookEntries()` |  | 186 |
| `career_modules_tutorialPopups.showNonTutorialWelcomeSplashscreen()` |  | 171 |
| `career_modules_tutorialPopups.wasIntroPopupsSeen(pages)` |  | 32 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `allTutorialFlags` | table |  |
| `dependencies` | table |  |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/career/modules/tutorialPopups.lua`.*
