# `core_cameraModes_smoothFree`

*File: `lua/ge/extensions/core/cameraModes/smoothFree.lua` · VM: Game Engine (GE) · 15 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/core/cameraModes/smoothFree")` (file under extensions/ but not a regular extension)

Cinematic free camera: builds a camera of the free mode, sets groupOrder = 20 (after the simple free camera) and enables smoothing via setSmoothedCam(true). Serves as the second member of the unattached cameras group: the camera key alternates free <-> smoothFree. No class of its own: the constructor returns a "free" object.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/core/cameraModes/smoothFree.lua`.*
