# `flowgraph_nodes_scene_particleEmitter`

*File: `lua/ge/extensions/flowgraph/nodes/scene/particleEmitter.lua` · VM: Game Engine (GE) · 153 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/scene/particleEmitter")` (file under extensions/ but not a regular extension)

Flowgraph node "Particle Emitter" (repeat_instant, author BeamNG). Creates a ParticleEmitterNode object (emitter BNGP_confetti, dataBlock lightExampleEmitterNodeData1) added to the MissionGroup and positions it. Inputs: clear (impulse), position (vec3), rotation (quat), color. Output: flow.

## Notes

- Bug: _afterTrigger calls self:hideobject() (lowercase) whereas the method is hideObject: Lua error if this branch runs.
- Bug: fillFields reads self.pinIn.radius, but no 'radius' pin is declared in pinSchema.
- Bug: setPosition tests self.object.objBase which is never defined: the position is therefore never applied.
- The rotation and color pins are not used by the code.

## Class `C`

Flowgraph node class (returned by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.

| Method | Description | Line |
|---|---|---|
| `C:_afterTrigger()` | After the trigger: if the input flow is false and the emitter is shown, tries to hide it. | 77 |
| `C:_executionStopped()` | On stop: removes the object from the editor tree if possible, deletes it and resets the state to zero. | 83 |
| `C:createObject(objectName)` | Creates the ParticleEmitterNode (canSave = false) and registers it under the given name. | 33 |
| `C:destroy()` | Called when the node is destroyed: deletes the emitter. | 147 |
| `C:fillFields()` | Reads position/radius/color from the pins with default values (radius 2, color {1,0,0,0.8}). | 96 |
| `C:hideObject()` | Hides the object (hidden = true) and sets shown to false. | 69 |
| `C:init(mgr, ...)` | Initializes position, radius, clr, object and shown. | 24 |
| `C:onClientEndMission()` | End-of-mission hook: deletes the emitter. | 142 |
| `C:setPosition()` | Positions and scales (radius, radius, 50) the object. | 109 |
| `C:showObject()` | Shows the existing object or creates it (name particles__<time>_<id>) and adds it to scenetree.MissionGroup. | 49 |
| `C:work()` | Creates/shows the emitter; on flow, shows and positions it (flow output true); on clear, hides it (flow output false). | 122 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/scene/particleEmitter.lua`.*
