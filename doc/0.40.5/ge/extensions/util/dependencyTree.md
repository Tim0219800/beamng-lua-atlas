# `util_dependencyTree`

*File: `lua/ge/extensions/util/dependencyTree.lua` · VM: Game Engine (GE) · 247 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `util_dependencyTree`: `extensions.load("util_dependencyTree")`, then the global `util_dependencyTree`

Development tool that parses the content files of the 'levels/gridmap' level (*.level.json, *.material.json, *.datablock.json and *.meshes.json) to build a dependency graph: each entity declares what it provides (provides: object name, mapTo material, shape) and what it depends on (deps: files, textures, materials, shapes, objects). The result is written to dependencytree.json. A modder can use it to find out which textures, materials and shapes a level uses.

## Example

```lua
util_dependencyTree.test()  -- writes dependencytree.json
```

## Notes

- The analyzed folder is hardcoded: 'levels/gridmap'.
- Recognized SimObject classes: BeamNGVehicle (JBeam, partConfig), BasicClouds, CloudLayer, DecalRoad, MeshRoad, River, WaterPlane, ScatterSky, SkyBox, Sun, Forest (data file), ForestBrush, ForestItemData, Material (4 stages, textures and cubemap), SFXAmbience, SFXDescription, DecalData, GroundCover, ParticleData, ParticleEmitterData, PrecipitationData, ConvexShape, GroundPlane, LevelInfo, TSStatic.
- Relative file paths (without a folder) are completed with the source file's folder; the extensions of shapes and textures are removed.
- Inconsistency: GroundCover registers its layer dependency under the category 'SimObject' (capitalized), whereas the others use 'simobject'.
- Probable bug: for the Material class, the code reads n.Stages[i] for i from 1 to 4 without checking that the stage exists: error if a material has fewer than 4 stages.
- removeFileExtensions builds a pattern with an unescaped '.' to remove the extension (may also hit another identical character in the path).
- The name of the provided shape is deduced from the .meshes.json file name by removing its last 12 characters ('.meshes.json').

## Functions

| Function | Description | Line |
|---|---|---|
| `util_dependencyTree.test()` | Analyzes all the content files of the folder, fills the entity list (deps and provides) and writes it to dependencytree.json (indented JSON). | 220 |

## Calls into the engine (C++)

- `FS:` `findFiles`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/util/dependencyTree.lua`.*
