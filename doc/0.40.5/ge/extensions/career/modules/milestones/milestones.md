# `career_modules_milestones_milestones`

*Fichier : `lua/ge/extensions/career/modules/milestones/milestones.lua` · VM : Game Engine (GE) · 231 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `career_modules_milestones_milestones` : `extensions.load("career_modules_milestones_milestones")`, puis la globale `career_modules_milestones_milestones`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `career_modules_milestones_milestones.claim(id, noGuiEvent)` |  | 47 |
| `career_modules_milestones_milestones.claimAllUnclaimed()` |  | 67 |
| `career_modules_milestones_milestones.getMilestones(filter)` |  | 89 |
| `career_modules_milestones_milestones.loadSaveData()` |  | 136 |
| `career_modules_milestones_milestones.majorLinear(step)` |  | 186 |
| `career_modules_milestones_milestones.milestoneReached(label)` | put here so it can eventually be delayed if in a mission, grouped up if multiple... | 122 |
| `career_modules_milestones_milestones.minorLinear(step)` | common reward functions | 185 |
| `career_modules_milestones_milestones.onCareerActive(active)` | *(hook)* | 169 |
| `career_modules_milestones_milestones.onExtensionLoaded()` | *(hook)* | 145 |
| `career_modules_milestones_milestones.onGetMilestones(list)` | *(hook)* | 112 |
| `career_modules_milestones_milestones.onMilestonesRouteEnter(context, toRoute, fromRoute, data)` | *(hook)* | 218 |
| `career_modules_milestones_milestones.onMilestonesRouteMount(context, toRoute, fromRoute, data)` | *(hook)* | 223 |
| `career_modules_milestones_milestones.onSaveCurrentProfile(currentSavePath)` | *(hook)* | 150 |
| `career_modules_milestones_milestones.requestMilestones(filter)` |  | 116 |
| `career_modules_milestones_milestones.unclaimedMilestonesCount()` |  | 155 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `colorGeneralGray` | string |  |
| `colorMissionBlue` | string |  |
| `colorOrange` | string |  |
| `saveData` | table |  |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onGetMilestones` — écouté par 2 module(s)

**Évènements UI (guihooks.trigger) :** `allMilestonesClaimed`, `milestoneClaimed`, `milestonesData`, `toastrMsg`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/career/modules/milestones/milestones.lua`.*
