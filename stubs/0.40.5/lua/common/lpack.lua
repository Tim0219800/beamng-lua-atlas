---@meta
-- tim19Atlas stub generated from lua/common/lpack.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Sérialiseur/désérialiseur rapide de valeurs Lua (tables, nombres, chaînes, booléens, vec3, quat) vers des chaînes compactes, utilisé pour échanger des données entre VM (GE <-> véhicule) et pour la sauvegarde. Trois formats : texte propriétaire ('a...~'), binaire basé sur string.buffer ('b...'), et source Lua (encodeLua). decode reconnaît automatiquement le texte ou le binaire. Un tableau de doubles peut aussi être empaqueté en 8 octets par valeur.
--- Accès : globale `lpack`
---@class lpack
lpack = {}

--- Désérialise une valeur produite par encode ou encodeBin (détecte le format au premier caractère : 'b' = binaire). Accepte une chaîne ou un string.buffer.
---Source : lua/common/lpack.lua:268
---@param is string|table|nil chaîne sérialisée ou string.buffer
---@param target table|vec3|quat|nil objet à remplir sur place (format binaire seulement)
---@return any  valeur décodée, nil si entrée vide
function lpack.decode(is, target) end

--- Convertit une chaîne de doubles (8 octets chacun, little-endian) en tableau Lua. Remplit tbl s'il est donné.
---Source : lua/common/lpack.lua:76
---@param sda string chaîne binaire
---@param tbl table|nil table de destination, nouvelle table si nil
---@return number[]  valeurs décodées à partir de l'indice 1
function lpack.decodeDoubleArray(sda, tbl) end

--- Évalue une chaîne produite par encodeLua (loadstring('return '..s)()). Dangereux avec des données non fiables. Renvoie nil si s est nil.
---Source : lua/common/lpack.lua:91
---@param s string|nil source Lua d'une valeur
---@return any  valeur
function lpack.decodeLua(s) end

--- Sérialise v au format texte compact (début 'a', fin '~'). Renvoie '' si v est nil.
---Source : lua/common/lpack.lua:96
---@param v any valeur Lua (table, nombre, chaîne, booléen, vec3, quat)
---@return string  chaîne sérialisée
function lpack.encode(v) end

--- Sérialise v au format binaire (string.buffer encode, préfixe 'b') avec types spéciaux pour vec3 et quat. Renvoie '' si nil.
---Source : lua/common/lpack.lua:105
---@param v any valeur Lua
---@return string  chaîne binaire
function lpack.encodeBin(v) end

--- Comme encodeBin mais renvoie le buffer de travail partagé du module au lieu d'une chaîne (zéro copie). Le contenu est écrasé à l'appel suivant.
---Source : lua/common/lpack.lua:112
---@param v any valeur Lua
---@return string.buffer|string  buffer de travail (ou '' si v est nil)
function lpack.encodeBinWorkBuffer(v) end

--- Convertit un tableau de nombres en chaîne binaire de doubles (8 octets par valeur, via ffi).
---Source : lua/common/lpack.lua:71
---@param tbl number[] tableau de nombres (indice 0 inclus s'il existe)
---@return string  chaîne binaire
function lpack.encodeDoubleArray(tbl) end

--- Sérialise v en texte source Lua (chaînes avec %q, tables avec crochets pour les clés non séquentielles) à relire avec decodeLua.
---Source : lua/common/lpack.lua:85
---@param v any valeur Lua
---@return string  source Lua
function lpack.encodeLua(v) end

