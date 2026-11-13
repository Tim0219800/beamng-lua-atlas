---@meta
-- tim19Atlas stub generated from lua/common/libs/luasocket/ltn12.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- LTN12 - Filters, sources, sinks and pumps.
---  LuaSocket toolkit.
---  Author: Diego Nehab
---  Declare module
--- Accès : `require("libs/luasocket/ltn12")`
---@class libs_luasocket_ltn12
---@field BLOCKSIZE number
---@field _VERSION string
---@field filter any
---@field pump any
---@field sink any
---@field source any
local libs_luasocket_ltn12 = {}

--- Classe locale `filter` de lua/common/libs/luasocket/ltn12.lua
---@class libs_luasocket_ltn12_filter
local libs_luasocket_ltn12_filter = {}

--- chains a bunch of filters together
---  (thanks to Wim Couwenberg)
---Source : lua/common/libs/luasocket/ltn12.lua:45
---@param ... any
function libs_luasocket_ltn12_filter.chain(...) end

--- Filter stuff
---  returns a high level filter that cycles a low-level filter
---Source : lua/common/libs/luasocket/ltn12.lua:34
---@param low any
---@param ctx any
---@param extra any
function libs_luasocket_ltn12_filter.cycle(low, ctx, extra) end

--- Classe locale `pump` de lua/common/libs/luasocket/ltn12.lua
---@class libs_luasocket_ltn12_pump
local libs_luasocket_ltn12_pump = {}

--- pumps all data from a source to a sink, using a step function
---Source : lua/common/libs/luasocket/ltn12.lua:295
---@param src any
---@param snk any
---@param step any
function libs_luasocket_ltn12_pump.all(src, snk, step) end

--- Pump stuff
---  pumps one chunk from the source to the sink
---Source : lua/common/libs/luasocket/ltn12.lua:287
---@param src any
---@param snk any
function libs_luasocket_ltn12_pump.step(src, snk) end

--- Classe locale `sink` de lua/common/libs/luasocket/ltn12.lua
---@class libs_luasocket_ltn12_sink
local libs_luasocket_ltn12_sink = {}

--- chains a sink with one or several filter(s)
---Source : lua/common/libs/luasocket/ltn12.lua:262
---@param f any
---@param snk any
---@param ... any
function libs_luasocket_ltn12_sink.chain(f, snk, ...) end

--- creates a sink that just returns an error
---Source : lua/common/libs/luasocket/ltn12.lua:255
---@param err any
function libs_luasocket_ltn12_sink.error(err) end

--- creates a file sink
---Source : lua/common/libs/luasocket/ltn12.lua:234
---@param handle any
---@param io_err any
function libs_luasocket_ltn12_sink.file(handle, io_err) end

---Source : lua/common/libs/luasocket/ltn12.lua:250
function libs_luasocket_ltn12_sink.null() end

--- turns a fancy sink into a simple sink
---Source : lua/common/libs/luasocket/ltn12.lua:223
---@param snk any
function libs_luasocket_ltn12_sink.simplify(snk) end

--- Sink stuff
---  creates a sink that stores into a table
---Source : lua/common/libs/luasocket/ltn12.lua:213
---@param t any
function libs_luasocket_ltn12_sink.table(t) end

--- Classe locale `source` de lua/common/libs/luasocket/ltn12.lua
---@class libs_luasocket_ltn12_source
local libs_luasocket_ltn12_source = {}

--- creates a source that produces contents of several sources, one after the
---  other, as if they were concatenated
---  (thanks to Wim Couwenberg)
---Source : lua/common/libs/luasocket/ltn12.lua:196
---@param ... any
function libs_luasocket_ltn12_source.cat(...) end

--- chains a source with one or several filter(s)
---Source : lua/common/libs/luasocket/ltn12.lua:145
---@param src any
---@param f any
---@param ... any
function libs_luasocket_ltn12_source.chain(src, f, ...) end

---Source : lua/common/libs/luasocket/ltn12.lua:83
function libs_luasocket_ltn12_source.empty() end

--- returns a source that just outputs an error
---Source : lua/common/libs/luasocket/ltn12.lua:88
---@param err any
function libs_luasocket_ltn12_source.error(err) end

--- creates a file source
---Source : lua/common/libs/luasocket/ltn12.lua:95
---@param handle any
---@param io_err any
function libs_luasocket_ltn12_source.file(handle, io_err) end

--- creates rewindable source
---Source : lua/common/libs/luasocket/ltn12.lua:130
---@param src any
function libs_luasocket_ltn12_source.rewind(src) end

--- turns a fancy source into a simple source
---Source : lua/common/libs/luasocket/ltn12.lua:106
---@param src any
function libs_luasocket_ltn12_source.simplify(src) end

--- creates string source
---Source : lua/common/libs/luasocket/ltn12.lua:117
---@param s any
function libs_luasocket_ltn12_source.string(s) end

return libs_luasocket_ltn12
