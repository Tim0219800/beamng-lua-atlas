# `gameplay_missions_missionTypes_baseMission`

*File: `lua/ge/extensions/gameplay/missions/missionTypes/baseMission.lua` · VM: Game Engine (GE) · 40 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/gameplay/missions/missionTypes/baseMission")` (file under extensions/ but not a regular extension)

Base class of mission types (non-flowgraph). The module returns a factory `function(derivedClass, ...)`: it creates an object from the options table, gives it the metatable C, calls init(), copies into the object all keys of the derived class (which therefore overwrite the base methods), then calls init() again. Provides empty onStart / onUpdate / onStop methods that mission types override, and the translation of progress keys.

## Example

```lua
-- in a mission type: local C = {}
-- ... define C:init(), C:onStart() ...
-- return require('/lua/ge/extensions/gameplay/missions/missionTypes/baseMission')(C, ...)
```

## Notes

- init() is called TWICE by the factory: once with the base version (before the derived keys are copied), once after (derived version if it exists). A derived init must therefore tolerate being run on an already initialized object; only the return value of the second call is returned (2nd return value of the factory).
- The derived class's keys are copied into the object itself (o[k] = v), not into a metatable: they mask the methods of C.
- C.__index = C is reassigned on every object creation (harmless).

## Class `C`

Base class of a mission. The object carries the mission data (missionType, etc.) provided via the options table.

The module returns a constructor: `local obj = require("gameplay_missions_missionTypes_baseMission")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:getProgressKeyTranslation(progressKey)` | Returns the translation key of a progress key ("default", "custom"); if unknown, returns the key as is. | 13 |
| `C:init()` | Called when a mission of this type is created. Sets self.missionTypeLabel = "bigMap.missionLabels."..self.missionType and self.progressKeyTranslations = {default, custom} (translation keys missions.progressKeyLabels.*). | 8 |
| `C:onStart()` | Called when the mission starts. Empty in the base, to be overridden. | 23 |
| `C:onStop(data)` | Called when the mission stops. `data` (the attempt) can be nil. Empty in the base. | 27 |
| `C:onUpdate(dtReal, dtSim, dtRaw)` | Called every frame during the mission. Empty in the base, to be overridden. | 25 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/missions/missionTypes/baseMission.lua`.*
