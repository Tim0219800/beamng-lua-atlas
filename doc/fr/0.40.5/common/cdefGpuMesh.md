# `cdefGpuMesh`

*Fichier : `lua/common/cdefGpuMesh.lua` · VM : Commun (GE + véhicule) · 83 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("cdefGpuMesh")`

Déclaration FFI du type gpuPrimitive_t (startIndex, indexCount, materialId : trois uint32_t) décrivant une primitive de maillage GPU. Les autres structures (gpuFlexMesh_t, gpuPropMesh_t, gpuMesh_t) sont en commentaire, conservées seulement pour référence.

## Remarques

- Aucune fonction Lua : uniquement un ffi.cdef exécuté si ffi existe.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/cdefGpuMesh.lua`.*
