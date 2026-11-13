# `gameplay_drift_sounds`

*Fichier : `lua/ge/extensions/gameplay/drift/sounds.lua` · VM : Game Engine (GE) · 216 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_drift_sounds` : `extensions.load("gameplay_drift_sounds")`, puis la globale `gameplay_drift_sounds`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_drift_sounds.getDriftDebugInfo()` |  | 67 |
| `gameplay_drift_sounds.onDriftCompletedScored(data)` | *(hook)* | 186 |
| `gameplay_drift_sounds.onDriftCrash()` | *(hook)* | 172 |
| `gameplay_drift_sounds.onDriftDebugChanged(value)` | *(hook)* | 180 |
| `gameplay_drift_sounds.onDriftNewCombo(data)` | *(hook)* | 159 |
| `gameplay_drift_sounds.onDriftSpinout()` | *(hook)* | 176 |
| `gameplay_drift_sounds.onExtensionUnloaded()` | *(hook)* | 195 |
| `gameplay_drift_sounds.onNewDriftTierReached(tierData)` | *(hook)* | 153 |
| `gameplay_drift_sounds.onUpdate(dtReal, _dtSim, dtRaw)` | *(hook)* | 135 |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onNewDriftTierReached` — écouté par 2 module(s)

## Appels vers le moteur (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/drift/sounds.lua`.*
