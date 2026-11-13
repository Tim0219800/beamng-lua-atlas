---@meta
-- tim19Atlas stub generated from lua/common/libs/lua-websockets/websocket/frame.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Encodage et décodage des trames WebSocket (RFC 6455) pour lua-websockets : en-têtes 7/16/64 bits de longueur, masquage XOR côté client, trames de fermeture (code + raison). Utilisé par sync, ev_common et les backends client/serveur. Exporte aussi les constantes d'opcodes.
--- Accès : `require("libs/lua-websockets/websocket/frame")`
---@class libs_lua_websockets_websocket_frame
---@field BINARY integer 2.
---@field CLOSE integer 8.
---@field CONTINUATION integer 0.
---@field PING integer 9.
---@field PONG integer 10.
---@field TEXT integer 1.
local libs_lua_websockets_websocket_frame = {}

--- Décode une trame depuis un tampon. Si les données sont incomplètes, renvoie nil et le nombre d'octets manquants.
---Source : lua/common/libs/lua-websockets/websocket/frame.lua:106
---@param encoded string Octets reçus (peut contenir plusieurs trames).
---@return string|nil  Charge utile démasquée, ou nil si incomplet.
---@return boolean|integer  fin (bit FIN), ou octets manquants si incomplet.
---@return integer  opcode.
---@return string  Octets restants après la trame.
---@return boolean  true si la trame était masquée.
function libs_lua_websockets_websocket_frame.decode(encoded) end

--- Extrait code et raison de la charge utile d'une trame CLOSE.
---Source : lua/common/libs/lua-websockets/websocket/frame.lua:186
---@param data string|nil Charge utile.
---@return integer|nil  Code.
---@return string|nil  Raison.
function libs_lua_websockets_websocket_frame.decode_close(data) end

--- Construit une trame WebSocket complète : en-tête, longueur, éventuel masque aléatoire (math.random) et données masquées.
---Source : lua/common/libs/lua-websockets/websocket/frame.lua:69
---@param data string Charge utile.
---@param opcode integer Opcode (1 = TEXT par défaut).
---@param masked boolean true pour masquer (obligatoire côté client).
---@param fin boolean|nil Bit FIN ; nil ou true = trame finale.
---@return string  Octets de la trame.
function libs_lua_websockets_websocket_frame.encode(data, opcode, masked, fin) end

--- Construit la charge utile d'une trame CLOSE : code sur 2 octets suivi de la raison. Renvoie une chaîne vide si code est nil.
---Source : lua/common/libs/lua-websockets/websocket/frame.lua:175
---@param code integer|nil Code de fermeture (ex. 1000).
---@param reason string|nil Raison.
---@return string  Charge utile.
function libs_lua_websockets_websocket_frame.encode_close(code, reason) end

--- En-tête avec longueur sur 64 bits (deux entiers 32 bits).
---Source : lua/common/libs/lua-websockets/websocket/frame.lua:65
---@param header integer Premier octet.
---@param payload integer Second octet.
---@param high integer 32 bits de poids fort.
---@param low integer 32 bits de poids faible.
---@return string  En-tête.
function libs_lua_websockets_websocket_frame.encode_header_big(header, payload, high, low) end

--- En-tête avec longueur sur 16 bits (126..65535).
---Source : lua/common/libs/lua-websockets/websocket/frame.lua:61
---@param header integer Premier octet.
---@param payload integer Second octet.
---@param len integer Longueur.
---@return string  En-tête.
function libs_lua_websockets_websocket_frame.encode_header_medium(header, payload, len) end

--- Deux octets d'en-tête (longueur < 126).
---Source : lua/common/libs/lua-websockets/websocket/frame.lua:57
---@param header integer Premier octet (FIN + opcode).
---@param payload integer Second octet (bit masque + longueur).
---@return string  En-tête.
function libs_lua_websockets_websocket_frame.encode_header_small(header, payload) end

return libs_lua_websockets_websocket_frame
