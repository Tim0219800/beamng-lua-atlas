---@meta
-- tim19Atlas stub generated from lua/common/libs/inspect/inspect.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- inspect.lua 3.1.0
---    http://github.com/kikito/inspect.lua
---    MIT LICENSE
---    Copyright (c) 2013 Enrique García Cota
---    Permission is hereby granted, free of charge, to any person obtaining a
---    copy of this software and associated documentation files (the
---    "Software"), to deal in the Software without restriction, including
---    without limitation the rights to use, copy, modify, merge, publish,
---    distribute, sublicense, and/or sell copies of the Software, and to
---    permit persons to whom the Software is furnished to do so, subject to
---    the following conditions:
---    The above copyright notice and this permission notice shall be included
---    in all copies or substantial portions of the Software.
---    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
---    OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
---    MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
---    IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
---    CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
---    TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
---    SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
--- Accès : `require("libs/inspect/inspect")`
---@class libs_inspect_inspect
---@field KEY any
---@field METATABLE any
local libs_inspect_inspect = {}

---Source : lua/common/libs/inspect/inspect.lua:298
---@param root any
---@param options any
function libs_inspect_inspect.inspect(root, options) end

--- Classe locale `Inspector` de lua/common/libs/inspect/inspect.lua
---@class libs_inspect_inspect_Inspector
local libs_inspect_inspect_Inspector = {}

---Source : lua/common/libs/inspect/inspect.lua:208
---@param v any
function libs_inspect_inspect_Inspector:alreadyVisited(v) end

---Source : lua/common/libs/inspect/inspect.lua:198
---@param f any
function libs_inspect_inspect_Inspector:down(f) end

---Source : lua/common/libs/inspect/inspect.lua:212
---@param v any
function libs_inspect_inspect_Inspector:getId(v) end

---Source : lua/common/libs/inspect/inspect.lua:223
---@param k any
function libs_inspect_inspect_Inspector:putKey(k) end

---Source : lua/common/libs/inspect/inspect.lua:230
---@param t any
function libs_inspect_inspect_Inspector:putTable(t) end

---Source : lua/common/libs/inspect/inspect.lua:281
---@param v any
function libs_inspect_inspect_Inspector:putValue(v) end

---Source : lua/common/libs/inspect/inspect.lua:188
---@param ... any
function libs_inspect_inspect_Inspector:puts(...) end

---Source : lua/common/libs/inspect/inspect.lua:204
function libs_inspect_inspect_Inspector:tabify() end

---@type number
i = nil
return libs_inspect_inspect
