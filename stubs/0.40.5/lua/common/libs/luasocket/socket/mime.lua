---@meta
-- tim19Atlas stub generated from lua/common/libs/luasocket/socket/mime.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Couche Lua du module MIME de LuaSocket (Diego Nehab, RFC 2045-2049) : encodage et décodage base64 et quoted-printable, découpe de lignes, normalisation de fins de ligne, protection des points (dot-stuffing SMTP). Construit des filtres LTN12 par-dessus les fonctions natives du module 'mime.core' (b64, unb64, qp, unqp, wrp, qpwrp, eol, dot).
--- Accès : `require("libs/luasocket/socket/mime")`
---@class libs_luasocket_socket_mime
---@field decode function decode(nom, opt1, opt2) -> filtre ltn12 de décodage choisi dans decodet.
---@field decodet table<string, function> Fabriques de filtres de décodage ('base64', 'quoted-printable').
---@field encode function encode(nom, opt1, opt2) -> filtre ltn12 d'encodage choisi dans encodet.
---@field encodet table<string, function> Fabriques de filtres d'encodage ('base64', 'quoted-printable' ; en mode 'binary' le qp utilise =0D=0A).
---@field wrap function wrap(nom, longueur) -> filtre ltn12 de découpe de lignes choisi dans wrapt.
---@field wrapt table<string, function> Fabriques de filtres de découpe de lignes ('text', 'base64', 'default', 'quoted-printable').
local libs_luasocket_socket_mime = {}

--- Crée un filtre qui normalise les fins de ligne vers le marqueur donné (via mime.eol).
---Source : lua/common/libs/luasocket/socket/mime.lua:81
---@param marker string|nil Fin de ligne souhaitée (par ex. '\r\n').
---@return function  Filtre LTN12.
function libs_luasocket_socket_mime.normalize(marker) end

--- Crée un filtre de 'dot-stuffing' (double les points en début de ligne, pour SMTP) via mime.dot.
---Source : lua/common/libs/luasocket/socket/mime.lua:86
---@return function  Filtre LTN12.
function libs_luasocket_socket_mime.stuff() end

return libs_luasocket_socket_mime
