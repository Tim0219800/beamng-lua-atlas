---@meta
-- tim19Atlas stub generated from lua/common/libs/luasocket/ltn12.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- LTN12 1.0.3 (Diego Nehab, LuaSocket library): framework for processing data streams in chunks. Four concepts: sources (functions that return the next chunk), sinks (functions that receive chunks), filters (transform one chunk into another) and pumps (transfer from a source to a sink). Used by socket.http, socket.ftp and mime; a modder uses it to read/write HTTP responses as streams (table, file, string).
--- Access: `require("libs/luasocket/ltn12")`
---@class libs_luasocket_ltn12
---@field BLOCKSIZE integer Size of the chunks read by source.file and source.string: 2048 bytes.
---@field _VERSION string 'LTN12 1.0.3'.
---@field filter table Filter functions: cycle, chain.
---@field pump table Data transfer: step, all.
---@field sink table Sink factories: table, simplify, file, null, error, chain.
---@field source table Source factories: empty, error, file, simplify, string, rewind, chain, cat.
local libs_luasocket_ltn12 = {}

--- ltn12.filter: filter construction.
---@class libs_luasocket_ltn12_filter
local libs_luasocket_ltn12_filter = {}

--- Chains several filters into one.
---Source: lua/common/libs/luasocket/ltn12.lua:45
---@param ... function Filters to chain, in order.
---@return function  Composite filter.
function libs_luasocket_ltn12_filter.chain(...) end

--- Turns a low-level filter low(ctx, chunk, extra) -> (output, new ctx) into a high-level filter that keeps the context between calls.
---Source: lua/common/libs/luasocket/ltn12.lua:34
---@param low function Low-level filter.
---@param ctx any Initial context.
---@param extra any Extra argument passed to low.
---@return function  High-level filter.
function libs_luasocket_ltn12_filter.cycle(low, ctx, extra) end

--- ltn12.pump: source-to-sink transfer.
---@class libs_luasocket_ltn12_pump
local libs_luasocket_ltn12_pump = {}

--- Transfers all the data from the source to the sink using the step function.
---Source: lua/common/libs/luasocket/ltn12.lua:295
---@param src function Source.
---@param snk function Sink.
---@param step function|nil Step function _anon(default pump.step).
---@return integer|nil  1 on success; nil and the error otherwise.
function libs_luasocket_ltn12_pump.all(src, snk, step) end

--- Transfers one chunk from the source to the sink.
---Source: lua/common/libs/luasocket/ltn12.lua:287
---@param src function Source.
---@param snk function Sink.
---@return integer|nil  1 if a chunk was transferred; nil (and possibly the error) at the end or on error.
function libs_luasocket_ltn12_pump.step(src, snk) end

--- ltn12.sink: sink factories.
---@class libs_luasocket_ltn12_sink
local libs_luasocket_ltn12_sink = {}

--- Sink preceded by one or more filters.
---Source: lua/common/libs/luasocket/ltn12.lua:262
---@param f function Filter.
---@param snk function Sink (or another filter followed by other arguments; the last argument is the sink).
---@param ... function Extra elements.
---@return function  Sink.
function libs_luasocket_ltn12_sink.chain(f, snk, ...) end

--- Sink that always returns nil, err.
---Source: lua/common/libs/luasocket/ltn12.lua:255
---@param err string Error.
---@return function  Sink.
function libs_luasocket_ltn12_sink.error(err) end

--- Sink that writes to a file and closes it at the end. Without a handle, returns an error sink.
---Source: lua/common/libs/luasocket/ltn12.lua:234
---@param handle file*|nil Open file.
---@param io_err string|nil Error message (default 'unable to open file').
---@return function  Sink.
function libs_luasocket_ltn12_sink.file(handle, io_err) end

--- Sink that ignores the data.
---Source: lua/common/libs/luasocket/ltn12.lua:250
---@return function  Sink.
function libs_luasocket_ltn12_sink.null() end

--- Turns a 'sophisticated' sink into a simple sink.
---Source: lua/common/libs/luasocket/ltn12.lua:223
---@param snk function Sink.
---@return function  Simple sink.
function libs_luasocket_ltn12_sink.simplify(snk) end

--- Sink that stores each chunk in a table.
---Source: lua/common/libs/luasocket/ltn12.lua:213
---@param t table|nil Destination table (created if absent).
---@return function  Sink.
---@return table  Table used.
function libs_luasocket_ltn12_sink.table(t) end

--- ltn12.source: source factories.
---@class libs_luasocket_ltn12_source
local libs_luasocket_ltn12_source = {}

--- Concatenates several sources one after another.
---Source: lua/common/libs/luasocket/ltn12.lua:196
---@param ... function Sources.
---@return function  Source.
function libs_luasocket_ltn12_source.cat(...) end

--- Filtered source: applies one or more filters to a source.
---Source: lua/common/libs/luasocket/ltn12.lua:145
---@param src function Source.
---@param f function Filter.
---@param ... function Additional filters.
---@return function  Source.
function libs_luasocket_ltn12_source.chain(src, f, ...) end

--- Empty source: always returns nil.
---Source: lua/common/libs/luasocket/ltn12.lua:83
---@return function  Source.
function libs_luasocket_ltn12_source.empty() end

--- Source that always returns nil, err.
---Source: lua/common/libs/luasocket/ltn12.lua:88
---@param err string Error.
---@return function  Source.
function libs_luasocket_ltn12_source.error(err) end

--- Source that reads a file in BLOCKSIZE blocks and closes it at the end. Without a handle, returns an error source.
---Source: lua/common/libs/luasocket/ltn12.lua:95
---@param handle file*|nil Open file.
---@param io_err string|nil Error message if handle is nil (default 'unable to open file').
---@return function  Source.
function libs_luasocket_ltn12_source.file(handle, io_err) end

--- 'Rewindable' source: called with a chunk, it sets it aside; without an argument, it first returns the chunks set aside, then the original source.
---Source: lua/common/libs/luasocket/ltn12.lua:130
---@param src function Source.
---@return function  Rewindable source.
function libs_luasocket_ltn12_source.rewind(src) end

--- Turns a 'sophisticated' source (which may return a new source) into a simple source.
---Source: lua/common/libs/luasocket/ltn12.lua:106
---@param src function Source.
---@return function  Simple source.
function libs_luasocket_ltn12_source.simplify(src) end

--- Source that splits a string into BLOCKSIZE chunks. Without a string, returns an empty source.
---Source: lua/common/libs/luasocket/ltn12.lua:117
---@param s string|nil String.
---@return function  Source.
function libs_luasocket_ltn12_source.string(s) end

return libs_luasocket_ltn12
