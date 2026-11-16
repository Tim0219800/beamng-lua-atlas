---@meta
-- tim19Atlas stub generated from lua/common/libs/lunajson/lunajson/sax.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Third-party library lunajson: SAX-type (event-driven) JSON parser. You give it a table of callbacks; it calls them as it reads without building the full tree, which allows processing large files or streams split into chunks.
--- Access: `require("libs/lunajson/lunajson/sax")`
---@class libs_lunajson_lunajson_sax
local libs_lunajson_lunajson_sax = {}

--- Like newparser, but reads the file `fn` in 8192-byte blocks (the file is opened with io.open then closed at the end of reading).
---Source: lua/common/libs/lunajson/lunajson/sax.lua:700
---@param fn string Path of the JSON file (io.open, real disk path).
---@param saxtbl table Callback table (see newparser).
---@return table  Object {run, tryc, read, tellpos}.
function libs_lunajson_lunajson_sax.newfileparser(fn, saxtbl) end

--- Creates a SAX parser on a JSON string or on a source function that supplies the text in pieces.
---Source: lua/common/libs/lunajson/lunajson/sax.lua:30
---@param src string|function JSON text, or function returning the next piece (nil when done).
---@param saxtbl table Callback table: startobject, key, endobject, startarray, endarray, string, number, boolean, null.
---@return table  Object {run, tryc, read, tellpos}.
function libs_lunajson_lunajson_sax.newparser(src, saxtbl) end

return libs_lunajson_lunajson_sax
