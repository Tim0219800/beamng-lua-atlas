# `gameplay_rallyStartClock`

*Fichier : `lua/ge/extensions/gameplay/rallyStartClock.lua` · VM : Game Engine (GE) · 528 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_rallyStartClock` : `extensions.load("gameplay_rallyStartClock")`, puis la globale `gameplay_rallyStartClock`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_rallyStartClock.getClockTypes()` |  | 525 |
| `gameplay_rallyStartClock.isRenderViewAvailable()` |  | 524 |
| `gameplay_rallyStartClock.onExtensionLoaded()` | *(hook)* | 69 |
| `gameplay_rallyStartClock.onExtensionUnloaded()` | *(hook)* | 426 |
| `gameplay_rallyStartClock.onPreRender(dtReal, dtSim)` | drawn after every onUpdate, so the display matches this frame's rally countdown whichever extension updates first *(hook)* | 499 |
| `gameplay_rallyStartClock.onRallyDataUpdated(data)` | *(hook)* | 440 |
| `gameplay_rallyStartClock.onRallySessionEnd()` | *(hook)* | 426 |
| `gameplay_rallyStartClock.onUpdate(dtReal, dtSim)` | *(hook)* | 476 |

## Appels vers le moteur (C++)

- `FS:` `findFiles`
- `Sim.` `getUniqueName`
- `core_environment.` `getTimeOfDay`
- `debugDrawer:` `currentRenderViewMaskClear`, `currentRenderViewMaskSet`, `drawLineInstance`
- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/rallyStartClock.lua`.*
