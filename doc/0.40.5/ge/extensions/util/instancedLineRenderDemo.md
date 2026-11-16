# `util_instancedLineRenderDemo`

*File: `lua/ge/extensions/util/instancedLineRenderDemo.lua` · VM: Game Engine (GE) · 248 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `util_instancedLineRenderDemo`: `extensions.load("util_instancedLineRenderDemo")`, then the global `util_instancedLineRenderDemo`

Technical demo of "instanced" line drawing in the debugDrawer (drawLineInstance, drawDot), which allows thick lines with an outline and rounded ends. Once loaded, the extension runs a simulation of 6 attracting masses (inspired by a JavaScript n-body) and draws their trajectories every frame at 3 m height above the origin, twice: without depth test and with it (offset by 5 m in X). The other demos (grid, sine waves, edges, traffic light) are dead code commented out in onPreRender.

## Example

```lua
extensions.load('util_instancedLineRenderDemo')
```

## Notes

- Trajectories accumulate (up to 10000 segments per mass, then the table is cleared): the drawing cost increases over time.
- There is no clean unload: unloading the extension simply stops the drawing. Reloading the extension adds new masses without clearing the old ones (startSim does not clear the masses table).
- The vec3Random(1) call ignores its argument; startSim creates nMasses+1 = 6 masses (loop from 0 to nMasses).
- testGrid, drawSinWaveTest, drawEdgeTest and drawSignal are never called (calls commented out).

## Functions

| Function | Description | Line |
|---|---|---|
| `util_instancedLineRenderDemo.onExtensionLoaded()` | Called when the extension is loaded: initializes the simulation masses (startSim). *(internal)* *(hook)* | 240 |
| `util_instancedLineRenderDemo.onPreRender(dtReal, dtSim, dtRaw)` | Hook called every frame before rendering. Advances the demo time, performs a simulation step and draws the trajectories (without then with depth). *(internal)* *(hook)* | 222 |

### Parameter details

#### `util_instancedLineRenderDemo.onPreRender(dtReal, dtSim, dtRaw)`

Hook called every frame before rendering. Advances the demo time, performs a simulation step and draws the trajectories (without then with depth).

- `dtReal` (*number*) : Real-time delta in seconds
- `dtSim` (*number*) : Simulation time delta in seconds (used by the demo)
- `dtRaw` (*number*) : Raw time delta (unused)

## Calls into the engine (C++)

- `debugDrawer:` `drawDot`, `drawLine`, `drawLineInstance`, `drawText`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/util/instancedLineRenderDemo.lua`.*
