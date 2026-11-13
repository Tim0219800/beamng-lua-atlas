# `career_modules_milestones_general`

*Fichier : `lua/ge/extensions/career/modules/milestones/general.lua` · VM : Game Engine (GE) · 169 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `career_modules_milestones_general` : `extensions.load("career_modules_milestones_general")`, puis la globale `career_modules_milestones_general`

**Dépendances (chargées avant) :** `career_modules_milestones_milestones`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `career_modules_milestones_general.claim(id)` | milestone system interaction | 47 |
| `career_modules_milestones_general.getMilestone(id)` |  | 69 |
| `career_modules_milestones_general.onCareerActive(active)` | *(hook)* | 16 |
| `career_modules_milestones_general.onGetMilestones(list, filter)` | *(hook)* | 131 |
| `career_modules_milestones_general.printDebug()` |  | 151 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table |  |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onGeneralMilestoneClaimed` — écouté par 1 module(s)
- `onGeneralMilestonesCollect` — écouté par 7 module(s)
- `onGeneralMilestonesSetupCallbacks` — écouté par 5 module(s)

**Évènements UI (guihooks.trigger) :** `toastrMsg`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/career/modules/milestones/general.lua`.*
