---@meta
-- tim19Atlas stub generated from lua/common/libs/lua-MessagePack/MessagePack.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- lua-MessagePack (François Perrad, licence MIT, version de base 0.5.1, adaptée par BeamNG en 2022) : sérialisation binaire MessagePack. Cette version utilise string.buffer de LuaJIT et un tampon de travail partagé ; elle sait aussi sérialiser les vec3 et quat (cdata). Un moddeur s'en sert pour encoder/décoder des tables Lua en chaînes binaires compactes (échange réseau, fichiers).
--- Accès : `require("libs/lua-MessagePack/MessagePack")`
---@class libs_lua_MessagePack_MessagePack
local libs_lua_MessagePack_MessagePack = {}

--- Crochet appelé pour chaque valeur d'extension lue ; l'implémentation par défaut renvoie nil. À remplacer pour décoder vos types d'extension.
---Source : lua/common/libs/lua-MessagePack/MessagePack.lua:457
---@param tag integer Numéro d'extension.
---@param data string Octets de l'extension.
---@return any  Valeur construite.
function libs_lua_MessagePack_MessagePack.build_ext(tag, data) end

--- Sérialise une valeur Lua en chaîne MessagePack.
---Source : lua/common/libs/lua-MessagePack/MessagePack.lua:255
---@param data any nil, boolean, number, string, table, vec3, quat, string.buffer.
---@return string  Données binaires.
function libs_lua_MessagePack_MessagePack.pack(data) end

--- Sérialise data précédé de la chaîne prefix.
---Source : lua/common/libs/lua-MessagePack/MessagePack.lua:265
---@param prefix string Octets à écrire avant les données.
---@param data any Valeur.
---@return string  prefix suivi des données.
function libs_lua_MessagePack_MessagePack.packPrefix(prefix, data) end

--- Comme packPrefix, mais renvoie le tampon de travail partagé.
---Source : lua/common/libs/lua-MessagePack/MessagePack.lua:259
---@param prefix string Préfixe.
---@param data any Valeur.
---@return userdata  string.buffer interne.
function libs_lua_MessagePack_MessagePack.packPrefixWorkBuffer(prefix, data) end

--- Comme pack, mais renvoie le tampon de travail partagé sans le convertir en chaîne (évite une copie).
---Source : lua/common/libs/lua-MessagePack/MessagePack.lua:249
---@param data any Valeur à sérialiser.
---@return userdata  string.buffer interne, réutilisé à chaque appel.
function libs_lua_MessagePack_MessagePack.packWorkBuffer(data) end

--- Choisit comment les tables Lua sont sérialisées : 'without_hole' (tableau si indices consécutifs sans trou, sinon map), 'with_hole' (tableau jusqu'à l'indice max si toutes les clés sont des nombres positifs), 'always_as_map' (toujours une map). Toute autre valeur lève une erreur.
---Source : lua/common/libs/lua-MessagePack/MessagePack.lua:130
---@param array string 'without_hole', 'with_hole' ou 'always_as_map'.
function libs_lua_MessagePack_MessagePack.set_array(array) end

--- Désérialise une chaîne contenant exactement une valeur MessagePack. Lève une erreur 'missing bytes' si elle est tronquée et 'extra bytes' s'il reste des octets.
---Source : lua/common/libs/lua-MessagePack/MessagePack.lua:558
---@param s string Données.
---@return any  Valeur décodée.
function libs_lua_MessagePack_MessagePack.unpack(s) end

--- Décode la valeur suivante à partir d'un curseur {s, i, j, underflow}, en avançant c.i.
---Source : lua/common/libs/lua-MessagePack/MessagePack.lua:271
---@param c table Curseur sur la chaîne source.
---@return any  Valeur décodée.
function libs_lua_MessagePack_MessagePack.unpack_cursor(c) end

--- Renvoie un itérateur qui décode successivement plusieurs valeurs : depuis une chaîne (renvoie la position et la valeur) ou depuis une fonction fournissant des morceaux de données (renvoie true et la valeur).
---Source : lua/common/libs/lua-MessagePack/MessagePack.lua:568
---@param src string|function Chaîne, ou fonction renvoyant le morceau suivant (ou nil).
---@return function  Itérateur.
function libs_lua_MessagePack_MessagePack.unpacker(src) end

---@type number
k = nil
return libs_lua_MessagePack_MessagePack
