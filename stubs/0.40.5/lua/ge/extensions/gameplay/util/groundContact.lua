---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/util/groundContact.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Utilitaire minimal pour savoir si un véhicule repose sur ses roues. Il lance un rayon statique vers le bas depuis le bas de la boîte englobante du véhicule (relevé de 0,3 m) et compare la distance au sol à un seuil de 1,1 m.
--- Accès : extension `gameplay_util_groundContact` : `extensions.load("gameplay_util_groundContact")`, puis la globale `gameplay_util_groundContact`
---@class gameplay_util_groundContact
gameplay_util_groundContact = {}

--- Teste la proximité du sol sous le centre du véhicule par un rayon statique vers le bas.
---Source : lua/ge/extensions/gameplay/util/groundContact.lua:20
---@param vehId integer Id du véhicule.
---@return boolean  true si le sol est à 1,1 m ou moins ; false si le véhicule est absent de map.objects.
function gameplay_util_groundContact.isOnWheels(vehId) end

