# `cdefMath`

*Fichier : `lua/common/cdefMath.lua` · VM : Commun (GE + véhicule) · 12 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("cdefMath")`

Déclaration FFI des structures C __luaVec3_t {double x, y, z} et __luaQuat_t {double x, y, z, w}, qui servent de représentation mémoire aux types vec3 et quat de Lua (en double précision).

## Remarques

- Aucune fonction Lua : un seul ffi.cdef, exécuté si ffi existe.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/cdefMath.lua`.*
