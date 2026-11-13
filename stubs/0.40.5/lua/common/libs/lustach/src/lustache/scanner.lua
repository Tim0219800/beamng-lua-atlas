---@meta
-- tim19Atlas stub generated from lua/common/libs/lustach/src/lustache/scanner.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Bibliothèque tierce lustache : scanneur de chaîne utilisé par l'analyseur de gabarits. Il garde la « queue » restante de la chaîne (`tail`) et la position courante (`pos`) et avance en consommant du texte par motifs Lua.
--- Accès : `require("libs/lustach/src/lustache/scanner")`
---@class libs_lustach_src_lustache_scanner
local libs_lustach_src_lustache_scanner = {}

--- Vrai si la queue est vide (fin de chaîne).
---Source : lua/common/libs/lustach/src/lustache/scanner.lua:7
---@param self any
---@return boolean  true à la fin.
function libs_lustach_src_lustache_scanner.eos(self) end

--- Crée un scanneur sur `str` (tail = str, pos = 1).
---Source : lua/common/libs/lustach/src/lustache/scanner.lua:48
---@param self table Classe scanner (appel avec les deux-points).
---@param str string Texte à parcourir.
---@return table  Instance de scanneur.
function libs_lustach_src_lustache_scanner.new(self, str) end

--- Essaie de faire correspondre `pattern` exactement au début de la queue ; si oui, consomme et renvoie le texte trouvé, sinon renvoie nil.
---Source : lua/common/libs/lustach/src/lustache/scanner.lua:13
---@param self any
---@param pattern string Motif Lua.
---@return string|nil  Texte consommé ou nil.
function libs_lustach_src_lustache_scanner.scan(self, pattern) end

--- Avance jusqu'à la prochaine correspondance de `pattern` et renvoie le texte sauté. Renvoie toute la queue si aucune correspondance ; renvoie nil si le motif correspond dès la position courante.
---Source : lua/common/libs/lustach/src/lustache/scanner.lua:28
---@param self any
---@param pattern string Motif Lua.
---@return string|nil  Texte sauté, ou nil.
function libs_lustach_src_lustache_scanner.scan_until(self, pattern) end

return libs_lustach_src_lustache_scanner
