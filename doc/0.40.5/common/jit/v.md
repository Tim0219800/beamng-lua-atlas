# `jit_v`

*Fichier : `lua/common/jit/v.lua` · VM : Commun (GE + véhicule) · 175 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("jit/v")`

Verbose mode of the LuaJIT compiler.
 Copyright (C) 2005-2026 Mike Pall. All rights reserved.
 Released under the MIT license. See Copyright Notice in luajit.h
 This module shows verbose information about the progress of the
 JIT compiler. It prints one line for each generated trace. This module
 is useful to see which code has been compiled or where the compiler
 punts and falls back to the interpreter.
 Example usage:
   luajit -jv -e "for i=1,1000 do for j=1,1000 do end end"
   luajit -jv=myapp.out myapp.lua
 Default output is to stderr. To redirect the output to a file, pass a
 filename as an argument (use '-' for stdout) or set the environment
 variable LUAJIT_VERBOSEFILE. The file is overwritten every time the
 module is started.
 The output from the first example should look like this:
 [TRACE   1 (command line):1 loop]
 [TRACE   2 (1/3) (command line):1 -> 1]
 The first number in each line is the internal trace number. Next are
 the file name ('(command line)') and the line number (':1') where the
 trace has started. Side traces also show the parent trace number and
 the exit number where they are attached to in parentheses ('(1/3)').
 An arrow at the end shows where the trace links to ('-> 1'), unless
 it loops to itself.
 In this case the inner loop gets hot and is traced first, generating
 a root trace. Then the last exit from the 1st trace gets hot, too,
 and triggers generation of the 2nd trace. The side trace follows the
 path along the outer loop and *around* the inner loop, back to its
 start, and then links to the 1st trace. Yes, this may seem unusual,
 if you know how traditional compilers work. Trace compilers are full
 of surprises like this -- have fun! :-)
 Aborted traces are shown like this:
 [TRACE --- foo.lua:44 -- leaving loop in root trace at foo:lua:50]
 Don't worry -- trace aborts are quite common, even in programs which
 can be fully compiled. The compiler may retry several times until it
 finds a suitable trace.
 Of course this doesn't work with features that are not-yet-implemented
 (NYI error messages). The VM simply falls back to the interpreter. This
 may not matter at all if the particular trace is not very high up in
 the CPU usage profile. Oh, and the interpreter is quite fast, too.
 Also check out the -jdump module, which prints all the gory details.
 Cache some library functions and objects.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `jit_v.off()` | Detach dump handlers. | 146 |
| `jit_v.on(outfile)` | Open the output file and attach dump handlers. | 156 |
| `jit_v.start(outfile)` | Open the output file and attach dump handlers. | 156 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/jit/v.lua`.*
