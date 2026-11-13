---@meta
-- tim19Atlas stub generated from lua/common/libs/luasocket/socket/url.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Bibliothèque tierce LuaSocket (Diego Nehab), version « URL 1.0.3 » : analyse, composition et résolution d'URL relatives selon la RFC 2396. Utile pour découper une URL en scheme/authority/userinfo/host/port/path/params/query/fragment, la reconstruire, encoder/décoder les caractères réservés (%XX) et manipuler les segments de chemin.
--- Accès : `require("libs/luasocket/socket/url")`
---@class libs_luasocket_socket_url
---@field _VERSION string Version du module : "URL 1.0.3".
local libs_luasocket_socket_url = {}

--- Construit une URL absolue à partir d'une URL de base et d'une URL relative (RFC 2396).
---Source : lua/common/libs/luasocket/socket/url.lua:221
---@param base_url string|table URL de base (chaîne ou table issue de parse).
---@param relative_url string|table URL relative (chaîne ou table issue de parse).
---@return string  URL absolue correspondante.
function libs_luasocket_socket_url.absolute(base_url, relative_url) end

--- Reconstruit une URL à partir d'une table du type renvoyé par parse ; les composants contenant des caractères réservés sont protégés.
---Source : lua/common/libs/luasocket/socket/url.lua:185
---@param parsed table Parties de l'URL.
---@return string  URL composée.
function libs_luasocket_socket_url.build(parsed) end

--- Recompose un chemin à partir de ses segments en échappant les caractères protégés.
---Source : lua/common/libs/luasocket/socket/url.lua:281
---@param parsed table Segments du chemin (comme renvoyé par parse_path).
---@param unsafe boolean|nil Si true, les segments ne sont pas protégés avant composition.
---@return string  Chemin composé.
function libs_luasocket_socket_url.build_path(parsed, unsafe) end

--- Encode une chaîne binaire en remplaçant chaque octet non alphanumérique par sa représentation %XX.
---Source : lua/common/libs/luasocket/socket/url.lua:30
---@param s string Chaîne à encoder.
---@return string  Chaîne échappée.
function libs_luasocket_socket_url.escape(s) end

--- Découpe une URL en table avec les champs scheme, authority, userinfo, user, password, host, port, path, params, query, fragment (seuls ceux présents sont remplis). Le '/' initial du chemin fait partie de path.
---Source : lua/common/libs/luasocket/socket/url.lua:126
---@param url string URL à analyser.
---@param default table|nil Valeurs par défaut copiées dans le résultat avant l'analyse.
---@return table|nil  Parties de l'URL, ou nil et "invalid url".
function libs_luasocket_socket_url.parse(url, default) end

--- Découpe un chemin en segments (désencodés) ; un chemin commençant par '/' donne un champ is_absolute.
---Source : lua/common/libs/luasocket/socket/url.lua:260
---@param path string Chemin de l'URL.
---@return table  Liste des segments (un par entrée).
function libs_luasocket_socket_url.parse_path(path) end

--- Décode les séquences %XX d'une chaîne en octets.
---Source : lua/common/libs/luasocket/socket/url.lua:73
---@param s string Chaîne échappée.
---@return string  Chaîne décodée.
function libs_luasocket_socket_url.unescape(s) end

return libs_luasocket_socket_url
