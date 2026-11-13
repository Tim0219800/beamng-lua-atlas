# `career_modules_unlockFlags`

*Fichier : `lua/ge/extensions/career/modules/unlockFlags.lua` · VM : Game Engine (GE) · 70 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `career_modules_unlockFlags` : `extensions.load("career_modules_unlockFlags")`, puis la globale `career_modules_unlockFlags`

**Dépendances (chargées avant) :** `career_saveSystem`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `career_modules_unlockFlags.getFlag(flagName)` | Get flag value, returns false if flag doesn't exist | 29 |
| `career_modules_unlockFlags.getFlagDefinition(flagName)` |  | 38 |
| `career_modules_unlockFlags.onCareerActivated()` | *(hook)* | 59 |
| `career_modules_unlockFlags.onSaveCurrentProfile(currentSavePath)` | Save current flags to file *(hook)* | 23 |
| `career_modules_unlockFlags.resetFlags()` | Reset all flags | 55 |
| `career_modules_unlockFlags.setFlag(flagName, value)` | Set flag value | 49 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table |  |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onGetUnlockFlagDefinitions` — écouté par 1 module(s)
- `onUnlockFlagChanged`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/career/modules/unlockFlags.lua`.*
