---@meta
-- tim19Atlas stub generated from lua/ge/extensions/freeroam/levelStats.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Statistiques d'usage des niveaux et des points de départ pour l'interface : compte combien de fois chaque niveau/point de départ a été lancé et quand. Les données sont persistées dans `/settings/cloud/uiStats.json` (table `levels` avec count, lastUsed, spawnPoints, et table `vehicles`). Global : freeroam_levelStats.
--- Accès : extension `freeroam_levelStats` : `extensions.load("freeroam_levelStats")`, puis la globale `freeroam_levelStats`
---@class freeroam_levelStats
freeroam_levelStats = {}

--- Niveaux triés par usage (dernier utilisé en premier, puis par nombre).
---Source : lua/ge/extensions/freeroam/levelStats.lua:34
---@return table  Liste de {levelName, count, lastUsed}.
function freeroam_levelStats.getTopLevels() end

--- Points de départ d'un niveau triés de la même façon.
---Source : lua/ge/extensions/freeroam/levelStats.lua:52
---@param levelName string Nom du niveau.
---@return table  Liste de {spawnPointName|nil, count, lastUsed}.
function freeroam_levelStats.getTopSpawnPoints(levelName) end

--- Regroupe topLevels et topSpawnPoints (les points de départ de tous les niveaux, concaténés, sans nom de niveau).
---Source : lua/ge/extensions/freeroam/levelStats.lua:70
---@return table  {topLevels, topSpawnPoints}
function freeroam_levelStats.getUiStats() end

--- Incrémente le compteur et la date du niveau et du point de départ, puis sauvegarde le fichier de stats.
---Source : lua/ge/extensions/freeroam/levelStats.lua:16
---@param levelName string Nom du niveau.
---@param spawnPointName string|nil Nom du point de départ ; nil = point par défaut.
function freeroam_levelStats.recordLevelSpawn(levelName, spawnPointName) end

