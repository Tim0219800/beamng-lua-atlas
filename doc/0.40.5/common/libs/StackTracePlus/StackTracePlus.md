# `libs_StackTracePlus_StackTracePlus`

*Fichier : `lua/common/libs/StackTracePlus/StackTracePlus.lua` · VM : Commun (GE + véhicule) · 564 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("libs/StackTracePlus/StackTracePlus")`

The MIT License

Copyright (c) 2010 Ignacio Burgueño

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
 tables

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `libs_StackTracePlus_StackTracePlus.add_known_function(fun, description)` | Adds a function to the list of known functions | 556 |
| `libs_StackTracePlus_StackTracePlus.add_known_table(tab, description)` | Adds a table to the list of known tables | 547 |
| `libs_StackTracePlus_StackTracePlus.stacktrace(thread, message, level, level_limit, dump_locals)` | Public:<br> Collects a detailed stack trace, dumping locals, resolving function names when they're not available, etc.<br> This function is suitable to be used as an error handler with pcall or xpcall<br> @param thread An optional thread whose stack is to be inspected (defaul is the current thread)<br> @param message An optional error string or object.<br> @param level An optional number telling at which level to start the traceback (default is 1)<br> Returns a string with the stack trace and a string with the original error. | 439 |
| `libs_StackTracePlus_StackTracePlus.stacktraceSimple(thread, message, level, level_limit, dump_locals)` |  | 326 |

## Classe `Dumper`

| Méthode | Description | Ligne |
|---|---|---|
| `Dumper:DumpLocals(level)` | Private:<br> Iterates over the local variables of a given function.<br> @param level The stack level where the function is. | 254 |
| `Dumper:add(text)` | helpers for collecting strings to be used when assembling the final trace | 238 |
| `Dumper:add_f(fmt, ...)` |  | 241 |
| `Dumper:concat_lines()` |  | 244 |
| `Dumper.new(thread)` |  | 207 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/libs/StackTracePlus/StackTracePlus.lua`.*
