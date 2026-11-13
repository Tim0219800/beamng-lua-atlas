# `zone`

*Fichier : `lua/common/libs/LuaJIT/zone.lua` · VM : Commun (GE + véhicule) · 45 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** globale `zone`

LuaJIT profiler zones.
 Copyright (C) 2005-2017 Mike Pall. All rights reserved.
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
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/libs/LuaJIT/zone.lua`.*
