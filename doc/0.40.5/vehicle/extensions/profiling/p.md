# `profiling_p`

*Fichier : `lua/vehicle/extensions/profiling/p.lua` · VM : Véhicule · 320 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `profiling_p` : `extensions.load (VM véhicule)("profiling_p")`, puis la globale `profiling_p`

LuaJIT profiler.
 Copyright (C) 2005-2016 Mike Pall. All rights reserved.
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
| `profiling_p.start(mode, outfile)` |  | 304 |
| `profiling_p.stop(doOutput)` | Finish profiling and dump result. | 231 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/extensions/profiling/p.lua`.*
