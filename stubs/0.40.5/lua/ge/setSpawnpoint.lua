---@meta
-- tim19Atlas stub generated from lua/ge/setSpawnpoint.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Mémorise et relit le point d'apparition par défaut choisi pour chaque niveau. Les données sont stockées dans settings/cloud/game-state.json (clé levels[nomNiveau].defaultSpawnPointName, plus lastLevelName). Il est utilisé par spawn.pickSpawnPoint et par le menu de choix de niveau.
--- Accès : globale `setSpawnpoint`
---@class setSpawnpoint
---@field settingsFilePath string Chemin du fichier JSON de sauvegarde : 'settings/cloud/game-state.json'.
setSpawnpoint = {}

--- Lit lastLevelName dans le fichier de sauvegarde.
---Source : lua/ge/setSpawnpoint.lua:58
---@return string|nil  Nom du dernier niveau enregistré par setDefaultSP, nil si absent.
function setSpawnpoint.getLastLevelName() end

--- Renvoie le nom du point d'apparition par défaut du niveau : celui enregistré par l'utilisateur s'il figure dans la liste spawnPoints du fichier info du niveau et existe dans la scène, sinon defaultSpawnPointName du fichier info du niveau, sinon ''.
---Source : lua/ge/setSpawnpoint.lua:30
---@param levelName string|nil Nom du niveau (niveau courant par défaut, via core_levels.getLevelName(getMissionFilename())).
---@return string  Nom (nom d'éditeur) du point d'apparition, ou '' ; '' aussi si le fichier info du niveau est illisible.
function setSpawnpoint.loadDefaultSpawnpoint(levelName) end

--- Enregistre dans settings/cloud/game-state.json le point d'apparition par défaut pour un niveau et mémorise ce niveau comme dernier niveau. Loge un avertissement si l'écriture échoue.
---Source : lua/ge/setSpawnpoint.lua:14
---@param defaultSPName string Nom (nom d'éditeur) du point d'apparition.
---@param levelName string Nom du niveau (converti en minuscules).
function setSpawnpoint.setDefaultSP(defaultSPName, levelName) end

