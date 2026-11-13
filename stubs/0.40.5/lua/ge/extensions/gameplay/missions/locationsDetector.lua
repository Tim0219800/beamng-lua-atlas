---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/missions/locationsDetector.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Détecte les missions dont le cluster de marqueurs contient la position donnée du joueur. getNearbyLocations parcourt les clusters de gameplay_missions_clustering (avec le rayon de fusion de la grande carte si elle est active) et renvoie, pour chaque mission trouvée, son type, l'objet mission, le cluster et l'id. La partie « missions d'arrière-plan » est commentée dans le fichier.
--- Accès : extension `gameplay_missions_locationsDetector` : `extensions.load("gameplay_missions_locationsDetector")`, puis la globale `gameplay_missions_locationsDetector`
---@class gameplay_missions_locationsDetector
---@field isEnabled nil Toujours nil : référence à une variable locale non définie.
---@field onPoiTriggered nil Toujours nil : référence à une variable locale non définie.
gameplay_missions_locationsDetector = {}

--- Renvoie les missions dont un cluster contient la position du joueur.
---Source : lua/ge/extensions/gameplay/missions/locationsDetector.lua:43
---@param level string Identifiant du niveau (transmis à la fonction de test, non utilisé).
---@param playerPosition vec3 Position du joueur.
---@return table  {missions = {{type, mission, location, id}, ...}, missionsChanged = false}.
function gameplay_missions_locationsDetector.getNearbyLocations(level, playerPosition) end

