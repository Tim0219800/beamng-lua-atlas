# `main`

*File: `lua/objectpool/main.lua` · VM: Common (GE + vehicle) · 108 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("main")`

Entry point of the Lua virtual machine "objectpool" (vmType = 'objectpool'), which stores serialized vehicle objects (lpack) in an `objPool` table keyed by object id. It is used to move vehicle data between VMs: the engine calls getObject, setObject, moveObject, deleteObject. It loads luaCore, utils, devUtils, ve_utils and mathlib, redefines `print` to the log and installs metatables on _G so that an object's global variables are stored in its record (objData).

## Notes

- This is not an extension: it is the main.lua file of a separate VM, loaded by the engine; package.path is redefined and package.cpath is emptied.
- After _setObj(objId, obj), any read or write of an unknown global goes through __indexHandler / __newIndexHandler and goes into objPool[objId] (rawget/rawset on objData).
- float3 is an alias of vec3. The hooks onNodeCollision, onVehicleReset, onBeamBroke and onBeamDeformed are empty.
- getObject and moveObject encode with lpack.encode; moveObject also removes the object from the pool. setObject and moveObject log via dump.

## Global functions defined here

| Function | Description | Line |
|---|---|---|
| `__indexHandler(t, key)` | Metatable of _G: reading a missing global is looked up in objData. | 100 |
| `__newIndexHandler(t, key, val)` | Metatable of _G: a global assignment is stored in objData instead of _G. | 96 |
| `_setObj(objId, _obj)` | Selects the current object: sets the globals obj, objectId and objData (= objPool[objId]) with rawset. | 90 |
| `deleteObject(objId)` | Removes the object from the pool. | 40 |
| `getObject(objId)` | Returns the pool object encoded as an lpack string, without removing it. | 24 |
| `init(path, initData)` | Called in the object's Lua VM: decodes initData (lpack), loads the vehicle with jbeam/stage2 (loadVehicleStage2) and stores it in objPool[obj:getId()] = {v = object}. Logs an error and returns false (unloads the Lua) if the data is invalid. | 49 |
| `initPool()` | Initialization of the pool's "thread" VM; does nothing. | 45 |
| `moveObject(objId)` | Returns the encoded object and removes it from the pool (transfer to another VM). | 28 |
| `onBeamBroke(id, energy)` | Hook called by the engine when a beam breaks; empty body. | 81 |
| `onBeamDeformed(id, ratio)` | Hook called by the engine when a beam deforms; empty body. | 84 |
| `onNodeCollision(id1, pos, normal, nodeVel, perpendicularVel, slipVec, slipVel, slipForce, normalForce, depth, materialId1, materialId2)` | Node collision hook called by the engine; empty body in this VM. | 74 |
| `onVehicleReset(retainDebug)` | Hook called by the engine on a reset; empty body. | 78 |
| `print(...)` | Replaces print: writes to the log with level 'A' and tag 'print'. Only the first argument is converted (tostring(...)). | 18 |
| `setObject(objId, objDataStr)` | Decodes an lpack string and stores it in the pool under objId. | 35 |

**Globals assigned:** `float3`, `objData`, `vmType`

## Calls into the engine (C++)

- `obj:` `getId`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/objectpool/main.lua`.*
