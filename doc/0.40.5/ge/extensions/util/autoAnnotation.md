# `util_autoAnnotation`

*File: `lua/ge/extensions/util/autoAnnotation.lua` · VM: Game Engine (GE) · 143 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `util_autoAnnotation`: `extensions.load("util_autoAnnotation")`, then the global `util_autoAnnotation`

Level editor tool: recursively walks the scene tree (MissionGroup) and the forest item dataset (ForestItemDataSet) to automatically set an annotation field (semantic category, 'Override' mode) on objects that lack one. Categories are guessed from the shape file name (TSStatic, ForestItemData) or the GroundCover name.

## Example

```lua
util_autoAnnotation.autoAnnotateLevel()
```

## Notes

- Shape matches (substring search, case-insensitive): building, fence, fencing, busstop -> BUILDINGS; tree -> NATURE; sidewalk -> SIDEWALK; sign -> TRAFFIC_SIGNS; tunnel -> STREET; road -> ASPHALT; excavator -> CAR. No match: OBSTACLES (warning logged).
- GroundCover: grass and shrubs -> NATURE; default NATURE (warning logged).
- Only objects whose annotation field is empty are modified. SFXSpace, SFXEmitter, PointLight and SpotLight are ignored.
- Modified objects receive setField('annotation', ...), setField('mode', 'Override') then postApply(): the level must then be saved by the editor.
- autoAnnotateGroups does not check that ForestItemDataSet exists: visitNode would crash if the object is absent.

## Functions

| Function | Description | Line |
|---|---|---|
| `util_autoAnnotation.autoAnnotateGroups()` | Annotates the forest object data (ForestItemDataSet). | 132 |
| `util_autoAnnotation.autoAnnotateLevel()` | Annotates the whole level: scene tree then forest dataset. | 137 |
| `util_autoAnnotation.autoAnnotateScenetree()` | Annotates the whole scene tree starting from MissionGroup. Logs an error and stops if MissionGroup is not found. | 121 |
| `util_autoAnnotation.onInit()` | Initialization hook with no effect (empty body). *(internal)* *(hook)* | 118 |

## Class `visitors`

Internal table of 'visit<Class>' visitors called according to each node's class. The TSStatic and ForestItemData visitors set the annotation from shapeName; those of SFXSpace, SFXEmitter, PointLight, SpotLight do nothing.

| Method | Description | Line |
|---|---|---|
| `visitors.visitForest(parent, node)` | Visits each element of a forest (Forest) and annotates the data of its items. | 94 |
| `visitors.visitGroundCover(parent, node)` | Annotates a GroundCover without annotation from its name (NATURE by default). | 102 |

## Calls into the engine (C++)

- `Sim.` `findObject`, `upcast`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/util/autoAnnotation.lua`.*
