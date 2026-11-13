# `editor_toolUtilities_splineLock`

*Fichier : `lua/ge/extensions/editor/toolUtilities/splineLock.lua` · VM : Game Engine (GE) · 150 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_toolUtilities_splineLock` : `extensions.load("editor_toolUtilities_splineLock")`, puis la globale `editor_toolUtilities_splineLock`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_toolUtilities_splineLock.applyObject(obj, isLocked, collides)` | Makes one generated object match the lock state. `collides` = whether it collides once locked; nil leaves collision alone. | 38 |
| `editor_toolUtilities_splineLock.capture(each)` | Records the hand-editable state of a spline's objects (pose, scale, shape, folder), keyed by object id. Taken before an<br> unlock resets them, so undoing the unlock can put the hand edits back. | 100 |
| `editor_toolUtilities_splineLock.dropDeleted(list)` | Drops handles to objects that are gone (e.g. deleted by hand in the scene tree), compacting the list in place. | 18 |
| `editor_toolUtilities_splineLock.hasAny(each)` | True if the tool still owns at least one live (not parked) object for the spline. | 46 |
| `editor_toolUtilities_splineLock.restore(rec, each)` | Puts a capture back, after the re-lock that undoes an unlock. Objects the unlock made in the meantime (for ones deleted by<br> hand while locked) are deleted again. | 118 |
| `editor_toolUtilities_splineLock.sync(applied, spline, toolName, each)` | Brings a spline's generated objects in line with its lock state. Only acts when the state differs from the last one applied<br> (`applied`: the tool's id -> isLocked table), as new objects are created in the right state. Returns true if it acted. | 62 |
| `editor_toolUtilities_splineLock.tag(obj, toolName, spline)` | Marks a generated object with the spline it came from, so it can be traced back from the scene tree / inspector. | 31 |

## Appels vers le moteur (C++)

- `be:` `reloadCollision`
- `obj:` `getClassName`, `getField`, `getGroup`, `getId`, `getScale`, `getTransform`, `postApply`, `setDynDataFieldbyName`, `setField`, `setScale`, `setTransform`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/toolUtilities/splineLock.lua`.*
