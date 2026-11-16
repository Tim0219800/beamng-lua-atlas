# `editor_aiTests`

*File: `lua/ge/extensions/editor/aiTests.lua` · VM: Game Engine (GE) · 420 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_aiTests`: `extensions.load("editor_aiTests")`, then the global `editor_aiTests`

Editor tool "Vehicle AI Path/Plan Debug" (Debug menu of the editor windows). Two tabs: "Route" lets you define a start, an end and waypoints (draggable markers, or the player vehicle's / camera's position), computes the route on the navgraph (gameplay/route/route), displays it with debugDrawer and can send it to the ground markers; "AI Vehicles" lets you select AI vehicles, adjust their parameters (aggression, turnForceCoef, awarenessForceCoef, edgeDist, lookAheadKv, staticFrictionCoefMult), then launch, stop, reposition or reload all the vehicles on the current route or a random 2000 m path. Useful to compare the AI's behavior with different settings.

## Notes

- Disabling dynamic collisions (Enable Dynamic Collisions checkbox) makes the vehicles "ghosts" to compare trajectories; they are re-enabled when the editor is closed (onEditorDeactivated).
- On launch, each vehicle receives ai.driveUsingPath({wpTargetList = ..., avoidCars = 'off'}), ai.setAggression, ai.setParameters and the path debug mode.
- In tabParams, the branch `elseif type(p[0]) == "boolean"` tests p[0] instead of p[1][0]; since all parameters are numbers, it is never used.
- The tool's functions are all local: only the three editor hooks are exported.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_aiTests.onEditorDeactivated()` | Hook emitted when the editor is closed: re-enables dynamic collisions if the tool had disabled them. *(internal)* *(hook)* | 404 |
| `editor_aiTests.onEditorGui()` | Editor drawing hook: displays the Route / AI Vehicles tabbed window. *(internal)* *(hook)* | 384 |
| `editor_aiTests.onEditorInitialized()` | Hook emitted when the editor initializes: registers the window (520x420) and its menu entry in the Debug group. *(internal)* *(hook)* | 410 |

## Calls into the engine (C++)

- `be:` `setDynamicCollisionEnabled`
- `debugDrawer:` `drawSphere`, `drawSquarePrism`, `drawTextAdvanced`
- `obj:` `getDirectionVector`, `getDirectionVectorUp`, `getPosition`, `getRotation`, `queueLuaCommand`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/aiTests.lua`.*
