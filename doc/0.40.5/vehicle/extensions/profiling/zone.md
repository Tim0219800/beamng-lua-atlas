# `profiling_zone`

*Fichier : `lua/vehicle/extensions/profiling/zone.lua` · VM : Véhicule · 46 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/profiling/zone")` (fichier sous extensions/ mais pas une extension classique)

LuaJIT profiler zones.
 Copyright (C) 2005-2016 Mike Pall. All rights reserved.
 Released under the MIT license. See Copyright Notice in luajit.h
 This module implements a simple hierarchical zone model.
 Example usage:
   local zone = require("jit.zone")
   zone("AI")
   ...
     zone("A*")
     ...
     print(zone:get()) --> "A*"
     ...
     zone()
   ...
   print(zone:get()) --> "AI"
   ...
   zone()

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/extensions/profiling/zone.lua`.*
