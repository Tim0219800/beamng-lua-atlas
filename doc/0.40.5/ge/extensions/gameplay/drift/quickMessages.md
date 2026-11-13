# `gameplay_drift_quickMessages`

*Fichier : `lua/ge/extensions/gameplay/drift/quickMessages.lua` · VM : Game Engine (GE) · 456 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_drift_quickMessages` : `extensions.load("gameplay_drift_quickMessages")`, puis la globale `gameplay_drift_quickMessages`

**Dépendances (chargées avant) :** `gameplay_drift_general`, `gameplay_drift_drift`, `gameplay_drift_scoring`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_drift_quickMessages.getDriftDebugInfo()` |  | 422 |
| `gameplay_drift_quickMessages.getGC()` |  | 426 |
| `gameplay_drift_quickMessages.getQuickMessages()` |  | 416 |
| `gameplay_drift_quickMessages.onDriftActiveDataFinished()` | *(hook)* | 402 |
| `gameplay_drift_quickMessages.onDriftCompleted()` | this is called when a drift chain is completed *(hook)* | 412 |
| `gameplay_drift_quickMessages.onDriftCrash()` | *(hook)* | 434 |
| `gameplay_drift_quickMessages.onDriftPlVehReset()` | this is called when the drift vehicle is reset *(hook)* | 407 |
| `gameplay_drift_quickMessages.onDriftSpinout()` | *(hook)* | 438 |
| `gameplay_drift_quickMessages.onUpdate(dt)` | *(hook)* | 345 |
| `gameplay_drift_quickMessages.reset()` |  | 393 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table |  |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onDriftQuickMessageDisplay` — écouté par 1 module(s)
- `onDriftQuickMessageReached` — écouté par 1 module(s)

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/drift/quickMessages.lua`.*
