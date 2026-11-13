# `jit_p`

*Fichier : `lua/common/jit/p.lua` · VM : Commun (GE + véhicule) · 310 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("jit/p")`

LuaJIT profiler.
 Copyright (C) 2005-2026 Mike Pall. All rights reserved.
 Released under the MIT license. See Copyright Notice in luajit.h
 This module is a simple command line interface to the built-in
 low-overhead profiler of LuaJIT.
 The lower-level API of the profiler is accessible via the "jit.profile"
 module or the luaJIT_profile_* C API.
 Example usage:
   luajit -jp myapp.lua
   luajit -jp=s myapp.lua
   luajit -jp=-s myapp.lua
   luajit -jp=vl myapp.lua
   luajit -jp=G,profile.txt myapp.lua
 The following dump features are available:
   f  Stack dump: function name, otherwise module:line. Default mode.
   F  Stack dump: ditto, but always prepend module.
   l  Stack dump: module:line.
   <number> stack dump depth (callee < caller). Default: 1.
   -<number> Inverse stack dump depth (caller > callee).
   s  Split stack dump after first stack level. Implies abs(depth) >= 2.
   p  Show full path for module names.
   v  Show VM states. Can be combined with stack dumps, e.g. vf or fv.
   z  Show zones. Can be combined with stack dumps, e.g. zf or fz.
   r  Show raw sample counts. Default: show percentages.
   a  Annotate excerpts from source code files.
   A  Annotate complete source code files.
   G  Produce raw output suitable for graphical tools (e.g. flame graphs).
   m<number> Minimum sample percentage to be shown. Default: 3.
   i<number> Sampling interval in milliseconds. Default: 10.
 Cache some library functions and objects.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `jit_p.start(mode, outfile)` |  | 294 |
| `jit_p.stop()` | Finish profiling and dump result. | 224 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/jit/p.lua`.*
