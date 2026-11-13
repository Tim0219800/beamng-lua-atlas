---@meta
-- tim19Atlas stub generated from lua/common/libs/LuaJIT/zone.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Module jit.zone de LuaJIT (Mike Pall, licence MIT) : pile hiérarchique de « zones » nommées, utilisée par le profileur LuaJIT pour étiqueter les portions de code. Le module renvoie une table appelable : zone("nom") empile une zone, zone() en dépile une et la renvoie. Un moddeur n'en a normalement pas besoin.
--- Accès : globale `zone`
---@class zone
zone = {}

--- Vide la pile de zones (méthode : zone:flush()). (assignée dynamiquement)
---Source : lua/common/libs/LuaJIT/zone.lua:dyn
---@param t table La table zone (self)
function zone.flush(t) end

--- Renvoie la zone courante, c'est-à-dire le sommet de la pile (zone:get()), ou nil si vide. (assignée dynamiquement)
---Source : lua/common/libs/LuaJIT/zone.lua:dyn
---@param t table La table zone (self)
---@return string|nil  Nom de la zone courante
function zone.get(t) end

