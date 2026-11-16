# `console_lib`

*File: `lua/console/console-lib.lua` · VM: Console · 61 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("console-lib")`

Helper library of the console VM (BeamNG without the game): creates dummy Lua objects so that vehicle/physics code can run outside the full game, builds `ground_model` objects from the JSON description of ground materials, and reads art/groundmodels.json. Used by bananabench.

## Notes

- `initConsole` defines dummy GLOBALS: physicsEngineEvent, vehicleReset, map (setNameForId, objectData), gameplay_statistic (metricAdd), core_sounds (setEngineSoundParameter, setEngineSoundParameterList, initExhaustSound, setExhaustSoundNodes, initEngineSound), all with no effect.
- `createGroundModel` is marked TODO in the source: code duplicated from environment.lua (submitGroundModel). Default values: roughnessCoefficient 0, defaultDepth 0, staticFrictionCoefficient 1, slidingFrictionCoefficient 0.7, hydrodynamicFriction 0.01 (also accepts the misspelled key `hydrodnamicFriction`), stribeckVelocity 6, strength 1, fluidDensity 200, flowConsistencyIndex 10000, flowBehaviorIndex 0.5, dragAnisotropy 0, skidMarks false, shearStrength 0.
- collisiontype: if it is a string, it is converted to a particle material identifier (particles.getOrAddMaterialIDByName), otherwise 0.

## Functions

| Function | Description | Line |
|---|---|---|
| `console_lib.createGroundModel(v)` | Creates and fills a native `ground_model()` object from a parameter table (friction coefficients, depth, roughness, fluid…) with the default values listed in the notes. | 27 |
| `console_lib.initConsole()` | Creates the dummy globals needed to run vehicle code outside the game (map, gameplay_statistic, core_sounds, physicsEngineEvent, vehicleReset). | 6 |
| `console_lib.readGroundModels()` | Reads and returns the content of art/groundmodels.json. | 52 |

### Parameter details

#### `console_lib.createGroundModel(v)`

Creates and fills a native `ground_model()` object from a parameter table (friction coefficients, depth, roughness, fluid…) with the default values listed in the notes.

- `v` (*table*) : Description of a ground material (entry of art/groundmodels.json).
- **returns**: userdata Native ground_model object.

#### `console_lib.readGroundModels()`

Reads and returns the content of art/groundmodels.json.

- **returns**: table|nil Decoded ground model tables.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/console/console-lib.lua`.*
