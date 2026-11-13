# `career_modules_spawnPoints`

*Fichier : `lua/ge/extensions/career/modules/spawnPoints.lua` · VM : Game Engine (GE) · 120 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `career_modules_spawnPoints` : `extensions.load("career_modules_spawnPoints")`, puis la globale `career_modules_spawnPoints`

**Dépendances (chargées avant) :** `career_career`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `career_modules_spawnPoints.getUnlockedSpawnpointsData()` |  | 77 |
| `career_modules_spawnPoints.isSpawnPointDiscovered(level, spawnPointName)` |  | 91 |
| `career_modules_spawnPoints.onCareerActive(active)` | *(hook)* | 103 |
| `career_modules_spawnPoints.onExtensionLoaded()` | *(hook)* | 98 |
| `career_modules_spawnPoints.onSaveCurrentProfile(currentSavePath)` | this should only be loaded when the career is active *(hook)* | 109 |
| `career_modules_spawnPoints.onUpdate(dtReal, dtSim, dtRaw)` | *(hook)* | 28 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table |  |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onSpawnPointUnlocked`

## Appels vers le moteur (C++)

- `obj:` `getPosition`
- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/career/modules/spawnPoints.lua`.*
