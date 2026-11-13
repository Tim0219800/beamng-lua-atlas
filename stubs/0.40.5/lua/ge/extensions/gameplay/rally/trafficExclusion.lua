---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/trafficExclusion.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Calcule des zones sphériques d'exclusion du trafic IA le long des spéciales de rallye, puis les applique au navgraph (`map.setTrafficExclusionZones` + `map.reset`) pour que le trafic ne circule pas sur le parcours. Les zones viennent de la driveline (drivelineV3) de chaque mission `rallyStage`, échantillonnée tous les 1,5 x rayon, et, pour une boucle, d'un fichier optionnel `trafficGatedRoads.grzones.json` du dossier de la mission. Rayon par défaut : 10 m.
--- Accès : extension `gameplay_rally_trafficExclusion` : `extensions.load("gameplay_rally_trafficExclusion")`, puis la globale `gameplay_rally_trafficExclusion`
---@class gameplay_rally_trafficExclusion
gameplay_rally_trafficExclusion = {}

--- Applique l'exclusion de trafic pour une boucle : retrouve les missions via extractMissionIdsFromRallyLoop, crée les zones, ajoute les sphères du fichier optionnel trafficGatedRoads.grzones.json (champ spheres avec pos {x,y,z} et radius), puis appelle map.setTrafficExclusionZones et map.reset().
---Source : lua/ge/extensions/gameplay/rally/trafficExclusion.lua:211
---@param loopMission table Mission boucle.
---@param radius number|nil Rayon des zones issues des spéciales ; défaut 10.
---@return table[]  Zones appliquées ({pos, radius}) ; table vide si loopMission est nil.
function gameplay_rally_trafficExclusion.applyForRallyLoop(loopMission, radius) end

--- Supprime toutes les zones d'exclusion (map.clearTrafficExclusionZones) et recharge le navgraph (map.reset).
---Source : lua/ge/extensions/gameplay/rally/trafficExclusion.lua:258
function gameplay_rally_trafficExclusion.clearTrafficExclusion() end

--- Construit la liste de zones d'exclusion pour des missions de rallye. Pour chaque mission `rallyStage`, charge la driveline et échantillonne ses points tous les 1,5 x radius.
---Source : lua/ge/extensions/gameplay/rally/trafficExclusion.lua:101
---@param missions table[]|nil Missions (objets de gameplay_missions_missions). Si vide ou nil, utilise la mission de l'éditeur de rallye.
---@param radius number|nil Rayon des zones en mètres ; défaut 10.
---@return table[]  Liste de {pos = vec3, radius = number} ; vide si rien n'est disponible.
function gameplay_rally_trafficExclusion.createZones(missions, radius) end

--- Lit mission.fgVariables d'une mission de boucle et renvoie les ids des missions utilisées, dans l'ordre : pour chaque étape 1 à 4, la section de route (`stageN_rallyRoadSection`) puis la spéciale (`stageN_rallyStage`), enfin `return_rallyRoadSection`. Les valeurs ont le format « Nom (id) » ; `<none>` est ignoré.
---Source : lua/ge/extensions/gameplay/rally/trafficExclusion.lua:151
---@param mission table Mission de type boucle (avec fgVariables).
---@return string[]  Ids de missions ; vide si fgVariables est absent.
function gameplay_rally_trafficExclusion.extractMissionIdsFromRallyLoop(mission) end

--- Renvoie le rayon par défaut des zones.
---Source : lua/ge/extensions/gameplay/rally/trafficExclusion.lua:268
---@return number  10 (mètres).
function gameplay_rally_trafficExclusion.getDefaultRadius() end

