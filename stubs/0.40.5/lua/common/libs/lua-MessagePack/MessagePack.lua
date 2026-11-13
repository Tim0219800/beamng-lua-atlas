---@meta
-- tim19Atlas stub generated from lua/common/libs/lua-MessagePack/MessagePack.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- lua-MessagePack is licensed under the terms of the MIT/X11 license reproduced below.
---  Copyright (C) 2012-2014 Francois Perrad, 2022 BeamNG
---  Permission is hereby granted, free of charge, to any person obtaining a copy
---  of this software and associated documentation files (the "Software"), to deal
---  in the Software without restriction, including without limitation the rights
---  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
---  copies of the Software, and to permit persons to whom the Software is
---  furnished to do so, subject to the following conditions:
---  The above copyright notice and this permission notice shall be included in
---  all copies or substantial portions of the Software.
---  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
---  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
---  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL THE
---  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
---  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
---  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
---  THE SOFTWARE.
---  BASE VERSION = '0.5.1'
--- Accès : `require("libs/lua-MessagePack/MessagePack")`
---@class libs_lua_MessagePack_MessagePack
local libs_lua_MessagePack_MessagePack = {}

---Source : lua/common/libs/lua-MessagePack/MessagePack.lua:457
---@param tag any
---@param data any
function libs_lua_MessagePack_MessagePack.build_ext(tag, data) end

---Source : lua/common/libs/lua-MessagePack/MessagePack.lua:255
---@param data any
function libs_lua_MessagePack_MessagePack.pack(data) end

---Source : lua/common/libs/lua-MessagePack/MessagePack.lua:265
---@param prefix any
---@param data any
function libs_lua_MessagePack_MessagePack.packPrefix(prefix, data) end

---Source : lua/common/libs/lua-MessagePack/MessagePack.lua:259
---@param prefix any
---@param data any
function libs_lua_MessagePack_MessagePack.packPrefixWorkBuffer(prefix, data) end

---Source : lua/common/libs/lua-MessagePack/MessagePack.lua:249
---@param data any
function libs_lua_MessagePack_MessagePack.packWorkBuffer(data) end

---Source : lua/common/libs/lua-MessagePack/MessagePack.lua:130
---@param array any
function libs_lua_MessagePack_MessagePack.set_array(array) end

---Source : lua/common/libs/lua-MessagePack/MessagePack.lua:558
---@param s any
function libs_lua_MessagePack_MessagePack.unpack(s) end

---Source : lua/common/libs/lua-MessagePack/MessagePack.lua:271
---@param c any
function libs_lua_MessagePack_MessagePack.unpack_cursor(c) end

---Source : lua/common/libs/lua-MessagePack/MessagePack.lua:568
---@param src any
function libs_lua_MessagePack_MessagePack.unpacker(src) end

---@type number
k = nil
return libs_lua_MessagePack_MessagePack
