# `cdefGpuMesh`

*File: `lua/common/cdefGpuMesh.lua` · VM: Common (GE + vehicle) · 83 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("cdefGpuMesh")`

FFI declaration of the type gpuPrimitive_t (startIndex, indexCount, materialId: three uint32_t) describing a GPU mesh primitive. The other structures (gpuFlexMesh_t, gpuPropMesh_t, gpuMesh_t) are commented out, kept only for reference.

## Notes

- No Lua function: only an ffi.cdef executed if ffi exists.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/cdefGpuMesh.lua`.*
