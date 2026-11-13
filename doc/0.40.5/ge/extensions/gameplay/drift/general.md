# `gameplay_drift_general`

*Fichier : `lua/ge/extensions/gameplay/drift/general.lua` · VM : Game Engine (GE) · 458 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_drift_general` : `extensions.load("gameplay_drift_general")`, puis la globale `gameplay_drift_general`

**Dépendances (chargées avant) :** `gameplay_drift_drift`, `gameplay_drift_scoring`, `gameplay_drift_statistics`, `gameplay_drift_saveLoad`, `gameplay_util_groundContact`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_drift_general.clear()` |  | 73 |
| `gameplay_drift_general.getChallengeMode()` |  | 196 |
| `gameplay_drift_general.getContext()` |  | 179 |
| `gameplay_drift_general.getDriftDebugInfo()` |  | 183 |
| `gameplay_drift_general.getExtensionDebug(extName)` |  | 187 |
| `gameplay_drift_general.getFrozen()` |  | 192 |
| `gameplay_drift_general.getGeneralDebug()` |  | 171 |
| `gameplay_drift_general.getMultiplayerEnabled()` |  | 200 |
| `gameplay_drift_general.getPaused()` |  | 175 |
| `gameplay_drift_general.onAnyMissionChanged(status, mission)` | *(hook)* | 204 |
| `gameplay_drift_general.onClientEndMission()` | *(hook)* | 427 |
| `gameplay_drift_general.onClientPostStartMission()` | hook fired when level is loaded (cough) *(hook)* | 393 |
| `gameplay_drift_general.onDeserialized(data)` | *(hook)* | 409 |
| `gameplay_drift_general.onExtensionLoaded()` | *(hook)* | 415 |
| `gameplay_drift_general.onMPSessionChanged(old, new)` | *(hook)* | 419 |
| `gameplay_drift_general.onSerialize()` | *(hook)* | 401 |
| `gameplay_drift_general.onUpdate()` | *(hook)* | 385 |
| `gameplay_drift_general.onVehicleResetted(vid)` | *(hook)* | 217 |
| `gameplay_drift_general.reset()` |  | 78 |
| `gameplay_drift_general.setChallengeMode(newChallengeMode)` |  | 136 |
| `gameplay_drift_general.setContext(newContext)` |  | 147 |
| `gameplay_drift_general.setDebug(value)` |  | 163 |
| `gameplay_drift_general.setPaused(newPaused)` |  | 143 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table |  |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onDriftContextChanged` — écouté par 3 module(s)
- `onDriftDebugChanged` — écouté par 3 module(s)
- `onDriftPlVehReset` — écouté par 4 module(s)

## Appels vers le moteur (C++)

- `FS:` `findFiles`

**Charge les extensions :** `gameplay_drift_freeroam_cruising`, `gameplay_drift_multiplayer`, `gameplay_drift_sounds`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/drift/general.lua`.*
