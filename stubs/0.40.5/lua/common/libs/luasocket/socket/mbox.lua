---@meta
-- tim19Atlas stub generated from lua/common/libs/luasocket/socket/mbox.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Analyseur de boîtes aux lettres au format mbox de LuaSocket : découpe un fichier mbox en messages, sépare en-têtes et corps, interprète les en-têtes et l'adresse de l'expéditeur. Utilitaire de courrier électronique sans lien direct avec le jeu.
--- Accès : `require("libs/luasocket/socket/mbox")`
---@class libs_luasocket_socket_mbox
local libs_luasocket_socket_mbox = {}

--- Analyse tout un fichier mbox : liste de messages {headers, body}.
---Source : lua/common/libs/luasocket/socket/mbox.lua:77
---@param mbox_s string Contenu mbox.
---@return table[]  Messages.
function libs_luasocket_socket_mbox.parse(mbox_s) end

--- Extrait nom et adresse d'un champ 'From' du type 'Nom <adresse>' (ou une simple adresse).
---Source : lua/common/libs/luasocket/socket/mbox.lua:51
---@param from string Valeur du champ From.
---@return string  Nom (l'adresse si vide, guillemets retirés).
---@return string  Adresse.
function libs_luasocket_socket_mbox.parse_from(from) end

--- Décompose une ligne d'en-tête 'Nom: valeur'.
---Source : lua/common/libs/luasocket/socket/mbox.lua:29
---@param header_s string Ligne d'en-tête.
---@return string|nil  Nom.
---@return string|nil  Valeur.
function libs_luasocket_socket_mbox.parse_header(header_s) end

--- Analyse un bloc d'en-têtes en table nom (minuscules) -> valeur.
---Source : lua/common/libs/luasocket/socket/mbox.lua:36
---@param headers_s string En-têtes bruts.
---@return table<string, string>  En-têtes.
function libs_luasocket_socket_mbox.parse_headers(headers_s) end

--- Analyse un message : renvoie {headers = table des en-têtes analysés, body = corps}.
---Source : lua/common/libs/luasocket/socket/mbox.lua:85
---@param message_s string Message brut.
---@return table  Message.
function libs_luasocket_socket_mbox.parse_message(message_s) end

--- Découpe un bloc d'en-têtes en lignes, en dépliant les lignes de continuation.
---Source : lua/common/libs/luasocket/socket/mbox.lua:21
---@param headers_s string En-têtes bruts.
---@return string[]  Une chaîne par en-tête.
function libs_luasocket_socket_mbox.split_headers(headers_s) end

--- Découpe un fichier mbox en messages bruts, séparés par les lignes 'From ...' précédées d'une ligne vide.
---Source : lua/common/libs/luasocket/socket/mbox.lua:63
---@param mbox_s string Contenu du fichier mbox.
---@return string[]  Messages bruts.
function libs_luasocket_socket_mbox.split_mbox(mbox_s) end

--- Sépare un message en en-têtes et corps (premier saut de ligne vide). Convertit CRLF en LF.
---Source : lua/common/libs/luasocket/socket/mbox.lua:7
---@param message_s string Message brut.
---@return string  En-têtes bruts (chaîne vide s'il n'y en a pas).
---@return string  Corps.
function libs_luasocket_socket_mbox.split_message(message_s) end

return libs_luasocket_socket_mbox
