# `gameplay_tutorial_bounds`

*Fichier : `lua/ge/extensions/gameplay/tutorial/bounds.lua` · VM : Game Engine (GE) · 287 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_tutorial_bounds` : `extensions.load("gameplay_tutorial_bounds")`, puis la globale `gameplay_tutorial_bounds`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_tutorial_bounds.cleanup()` |  | 278 |
| `gameplay_tutorial_bounds.getActiveZoneNames()` |  | 188 |
| `gameplay_tutorial_bounds.getDebugDrawBounds()` |  | 205 |
| `gameplay_tutorial_bounds.getEnabledZones()` |  | 197 |
| `gameplay_tutorial_bounds.getZoneEnabled(zoneName)` |  | 183 |
| `gameplay_tutorial_bounds.isInBounds()` |  | 209 |
| `gameplay_tutorial_bounds.onPreRender(dtReal, dtSim, dtRaw)` | *(hook)* | 271 |
| `gameplay_tutorial_bounds.setActiveZones(names)` |  | 170 |
| `gameplay_tutorial_bounds.setCallbacks(newCallbacks)` |  | 71 |
| `gameplay_tutorial_bounds.setCurrentStepGetter(getter)` |  | 63 |
| `gameplay_tutorial_bounds.setDebugDrawBounds(enabled)` |  | 201 |
| `gameplay_tutorial_bounds.setRuntimeActiveGetter(getter)` |  | 55 |
| `gameplay_tutorial_bounds.setSites(newSites)` |  | 166 |
| `gameplay_tutorial_bounds.setZoneEnabled(zoneName, enabled)` |  | 179 |
| `gameplay_tutorial_bounds.update(dtReal)` |  | 214 |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onCareerTutorialLeftBounds` — écouté par 8 module(s)
- `onCareerTutorialOutOfBoundsEnded` — écouté par 1 module(s)
- `onCareerTutorialOutOfBoundsStarted` — écouté par 1 module(s)
- `onCareerTutorialOutOfBoundsTimedOut` — écouté par 1 module(s)

**Évènements UI (guihooks.trigger) :** `DiscardTasklistItem`, `SetTasklistTask`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/tutorial/bounds.lua`.*
