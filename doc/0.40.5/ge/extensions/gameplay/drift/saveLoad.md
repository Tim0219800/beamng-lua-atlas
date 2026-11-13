# `gameplay_drift_saveLoad`

*Fichier : `lua/ge/extensions/gameplay/drift/saveLoad.lua` · VM : Game Engine (GE) · 175 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_drift_saveLoad` : `extensions.load("gameplay_drift_saveLoad")`, puis la globale `gameplay_drift_saveLoad`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_drift_saveLoad.clearCache()` |  | 17 |
| `gameplay_drift_saveLoad.getDriftSpotById(spotId)` |  | 45 |
| `gameplay_drift_saveLoad.getDriftSpotsById()` |  | 50 |
| `gameplay_drift_saveLoad.getPreviewWithFallback(dir)` |  | 119 |
| `gameplay_drift_saveLoad.loadAndSanitizeDriftFreeroamSpotsCurrMap()` |  | 132 |
| `gameplay_drift_saveLoad.loadDriftData(fileName)` |  | 142 |
| `gameplay_drift_saveLoad.onCareerActive()` | *(hook)* | 13 |
| `gameplay_drift_saveLoad.onSaveCurrentProfile(currentSavePath)` | *(hook)* | 27 |
| `gameplay_drift_saveLoad.saveDriftSpotsScoresForSpotById(spotId)` |  | 36 |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onAfterDriftSpotsLoaded`

## Appels vers le moteur (C++)

- `FS:` `fileExists`, `findFiles`
- `obj:` `setHidden`
- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/drift/saveLoad.lua`.*
