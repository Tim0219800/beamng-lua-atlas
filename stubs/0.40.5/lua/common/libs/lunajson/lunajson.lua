---@meta
-- tim19Atlas stub generated from lua/common/libs/lunajson/lunajson.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Third-party library lunajson (fast pure-Lua JSON decoder/encoder). This file is the entry point: it creates a default decoder and encoder and also exposes the SAX (event-driven) parser. To have several independent contexts, you can require lunajson/decoder or lunajson/encoder directly. The game also provides its own jsonEncode/jsonDecode functions; this is the raw library.
--- Access: `require("libs/lunajson/lunajson")`
---@class libs_lunajson_lunajson
---@field decode function Decodes a JSON string into a Lua value (see lunajson/decoder).
---@field encode function Encodes a Lua value into a JSON string (see lunajson/encoder).
---@field newfileparser function Creates a SAX parser reading a file in 8192-byte blocks (see lunajson/sax).
---@field newparser function Creates a SAX parser on a string or a source function _anon(see lunajson/sax).
local libs_lunajson_lunajson = {}

return libs_lunajson_lunajson
