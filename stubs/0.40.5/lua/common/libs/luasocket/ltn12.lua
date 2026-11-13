---@meta
-- tim19Atlas stub generated from lua/common/libs/luasocket/ltn12.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- LTN12 1.0.3 (Diego Nehab, bibliothèque LuaSocket) : cadre de traitement de flux de données par morceaux. Quatre notions : sources (fonctions qui renvoient le morceau suivant), sinks (fonctions qui reçoivent des morceaux), filters (transforment un morceau en un autre) et pumps (transfèrent d'une source vers un sink). Utilisé par socket.http, socket.ftp et mime ; un moddeur s'en sert pour lire/écrire des réponses HTTP en flux (table, fichier, chaîne).
--- Accès : `require("libs/luasocket/ltn12")`
---@class libs_luasocket_ltn12
---@field BLOCKSIZE integer Taille des morceaux lus par source.file et source.string : 2048 octets.
---@field _VERSION string 'LTN12 1.0.3'.
---@field filter table Fonctions de filtrage : cycle, chain.
---@field pump table Transfert de données : step, all.
---@field sink table Fabriques de sinks : table, simplify, file, null, error, chain.
---@field source table Fabriques de sources : empty, error, file, simplify, string, rewind, chain, cat.
local libs_luasocket_ltn12 = {}

--- ltn12.filter : construction de filtres.
---@class libs_luasocket_ltn12_filter
local libs_luasocket_ltn12_filter = {}

--- Enchaîne plusieurs filtres en un seul.
---Source : lua/common/libs/luasocket/ltn12.lua:45
---@param ... function Filtres à enchaîner, dans l'ordre.
---@return function  Filtre composé.
function libs_luasocket_ltn12_filter.chain(...) end

--- Transforme un filtre bas niveau low(ctx, chunk, extra) -> (sortie, nouveau ctx) en filtre haut niveau qui conserve le contexte entre les appels.
---Source : lua/common/libs/luasocket/ltn12.lua:34
---@param low function Filtre bas niveau.
---@param ctx any Contexte initial.
---@param extra any Argument supplémentaire transmis à low.
---@return function  Filtre haut niveau.
function libs_luasocket_ltn12_filter.cycle(low, ctx, extra) end

--- ltn12.pump : transfert source vers sink.
---@class libs_luasocket_ltn12_pump
local libs_luasocket_ltn12_pump = {}

--- Transfère toutes les données de la source vers le sink avec la fonction step.
---Source : lua/common/libs/luasocket/ltn12.lua:295
---@param src function Source.
---@param snk function Sink.
---@param step function|nil Fonction de pas (défaut pump.step).
---@return integer|nil  1 en cas de succès ; nil et l'erreur sinon.
function libs_luasocket_ltn12_pump.all(src, snk, step) end

--- Transfère un morceau de la source au sink.
---Source : lua/common/libs/luasocket/ltn12.lua:287
---@param src function Source.
---@param snk function Sink.
---@return integer|nil  1 si un morceau a été transféré ; nil (et éventuellement l'erreur) à la fin ou en cas d'erreur.
function libs_luasocket_ltn12_pump.step(src, snk) end

--- ltn12.sink : fabriques de sinks.
---@class libs_luasocket_ltn12_sink
local libs_luasocket_ltn12_sink = {}

--- Sink précédé d'un ou plusieurs filtres.
---Source : lua/common/libs/luasocket/ltn12.lua:262
---@param f function Filtre.
---@param snk function Sink (ou autre filtre suivi d'autres arguments ; le dernier argument est le sink).
---@param ... function Éléments supplémentaires.
---@return function  Sink.
function libs_luasocket_ltn12_sink.chain(f, snk, ...) end

--- Sink qui renvoie toujours nil, err.
---Source : lua/common/libs/luasocket/ltn12.lua:255
---@param err string Erreur.
---@return function  Sink.
function libs_luasocket_ltn12_sink.error(err) end

--- Sink qui écrit dans un fichier et le ferme à la fin. Sans handle, renvoie un sink d'erreur.
---Source : lua/common/libs/luasocket/ltn12.lua:234
---@param handle file*|nil Fichier ouvert.
---@param io_err string|nil Message d'erreur (défaut 'unable to open file').
---@return function  Sink.
function libs_luasocket_ltn12_sink.file(handle, io_err) end

--- Sink qui ignore les données.
---Source : lua/common/libs/luasocket/ltn12.lua:250
---@return function  Sink.
function libs_luasocket_ltn12_sink.null() end

--- Transforme un sink 'sophistiqué' en sink simple.
---Source : lua/common/libs/luasocket/ltn12.lua:223
---@param snk function Sink.
---@return function  Sink simple.
function libs_luasocket_ltn12_sink.simplify(snk) end

--- Sink qui range chaque morceau dans une table.
---Source : lua/common/libs/luasocket/ltn12.lua:213
---@param t table|nil Table de destination (créée si absente).
---@return function  Sink.
---@return table  Table utilisée.
function libs_luasocket_ltn12_sink.table(t) end

--- ltn12.source : fabriques de sources.
---@class libs_luasocket_ltn12_source
local libs_luasocket_ltn12_source = {}

--- Concatène plusieurs sources l'une après l'autre.
---Source : lua/common/libs/luasocket/ltn12.lua:196
---@param ... function Sources.
---@return function  Source.
function libs_luasocket_ltn12_source.cat(...) end

--- Source filtrée : applique un ou plusieurs filtres à une source.
---Source : lua/common/libs/luasocket/ltn12.lua:145
---@param src function Source.
---@param f function Filtre.
---@param ... function Filtres supplémentaires.
---@return function  Source.
function libs_luasocket_ltn12_source.chain(src, f, ...) end

--- Source vide : renvoie toujours nil.
---Source : lua/common/libs/luasocket/ltn12.lua:83
---@return function  Source.
function libs_luasocket_ltn12_source.empty() end

--- Source qui renvoie toujours nil, err.
---Source : lua/common/libs/luasocket/ltn12.lua:88
---@param err string Erreur.
---@return function  Source.
function libs_luasocket_ltn12_source.error(err) end

--- Source qui lit un fichier par blocs de BLOCKSIZE et le ferme à la fin. Sans handle, renvoie une source d'erreur.
---Source : lua/common/libs/luasocket/ltn12.lua:95
---@param handle file*|nil Fichier ouvert.
---@param io_err string|nil Message d'erreur si handle est nil (défaut 'unable to open file').
---@return function  Source.
function libs_luasocket_ltn12_source.file(handle, io_err) end

--- Source 'rembobinable' : appelée avec un morceau, elle le remet de côté ; sans argument, elle rend d'abord les morceaux remis de côté puis la source d'origine.
---Source : lua/common/libs/luasocket/ltn12.lua:130
---@param src function Source.
---@return function  Source rembobinable.
function libs_luasocket_ltn12_source.rewind(src) end

--- Transforme une source 'sophistiquée' (qui peut renvoyer une nouvelle source) en source simple.
---Source : lua/common/libs/luasocket/ltn12.lua:106
---@param src function Source.
---@return function  Source simple.
function libs_luasocket_ltn12_source.simplify(src) end

--- Source qui découpe une chaîne en morceaux de BLOCKSIZE. Sans chaîne, renvoie une source vide.
---Source : lua/common/libs/luasocket/ltn12.lua:117
---@param s string|nil Chaîne.
---@return function  Source.
function libs_luasocket_ltn12_source.string(s) end

return libs_luasocket_ltn12
