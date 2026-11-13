---@meta
-- tim19Atlas stub generated from lua/common/jit/zone.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Module jit.zone de LuaJIT (Mike Pall, licence MIT, 2005-2026) : pile hiérarchique de « zones » nommées utilisée par le profileur (jit.p avec l'option z) pour regrouper les échantillons par zone logique. Le module est un objet appelable : zone('nom') empile une zone, zone() sans argument en dépile une (erreur « empty zone stack » si vide).
--- Accès : globale `zone`
---@class zone
zone = {}

--- Vide complètement la pile de zones. (assignée dynamiquement)
---Source : lua/common/jit/zone.lua:dyn
---@param t table Le module lui-même (appel avec ':' : zone:flush()).
function zone.flush(t) end

--- Renvoie le nom de la zone courante (sommet de pile), nil si la pile est vide. (assignée dynamiquement)
---Source : lua/common/jit/zone.lua:dyn
---@param t table Le module lui-même (appel zone:get()).
---@return string|nil  Nom de la zone courante.
function zone.get(t) end

