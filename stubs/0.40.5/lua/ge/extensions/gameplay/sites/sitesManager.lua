---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/sites/sitesManager.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Extension qui recense les fichiers *.sites.json de chaque niveau, les charge en objets « sites » (lieux, zones, places de parking) et les met en cache. Les scénarios, missions et le trafic passent par elle pour obtenir les sites d'une carte. Garde un cache par chemin de fichier, vidé à la fin de la mission.
--- Accès : extension `gameplay_sites_sitesManager` : `extensions.load("gameplay_sites_sitesManager")`, puis la globale `gameplay_sites_sitesManager`
---@class gameplay_sites_sitesManager
gameplay_sites_sitesManager = {}

--- Parcourt les niveaux (core_levels.getList) et reconstruit la table des fichiers *.sites.json par niveau (clé = nom de niveau en minuscules). Journalise le nombre de fichiers trouvés.
---Source : lua/ge/extensions/gameplay/sites/sitesManager.lua:13
function gameplay_sites_sitesManager.getAllLevelSites() end

--- Renvoie la première place où le véhicule rentre (vehicleFits) et qui n'est occupée par aucun véhicule (hasAnyVehicles), sinon la dernière de la liste.
---Source : lua/ge/extensions/gameplay/sites/sitesManager.lua:121
---@param vehId integer|nil Véhicule ; par défaut le véhicule du joueur 0.
---@param parkingSpots table[] Liste d'objets parkingSpot.
---@return table  Place choisie.
function gameplay_sites_sitesManager.getBestParkingSpotForVehicleFromList(vehId, parkingSpots) end

--- Trouve le fichier sites du niveau courant dont le nom (sans « .sites.json ») correspond.
---Source : lua/ge/extensions/gameplay/sites/sitesManager.lua:112
---@param name string Nom du fichier sans extension.
---@return string|nil  Chemin complet ou nil.
function gameplay_sites_sitesManager.getCurrentLevelSitesFileByName(name) end

--- Liste des fichiers sites du niveau courant (getCurrentLevelIdentifier).
---Source : lua/ge/extensions/gameplay/sites/sitesManager.lua:108
---@param name any Inutilisé.
---@return string[]  Chemins, table vide si aucun.
function gameplay_sites_sitesManager.getCurrentLevelSitesFiles(name) end

--- Renvoie la table niveau -> liste de fichiers sites (la construit si besoin).
---Source : lua/ge/extensions/gameplay/sites/sitesManager.lua:104
---@return table<string, string[]>  Fichiers par niveau.
function gameplay_sites_sitesManager.getSitesFilesByLevel() end

--- Charge un fichier .sites.json et renvoie l'objet sites (désérialisé et finalisé). Utilise le cache si présent, sauf force. Ajoute site.dir et site.filename.
---Source : lua/ge/extensions/gameplay/sites/sitesManager.lua:30
---@param filepath string Chemin du fichier .sites.json.
---@param force boolean|nil Recharge même si en cache.
---@param ignoreCache boolean|nil Ne pas stocker le résultat dans le cache.
---@return table|nil  Objet sites, ou nil si le fichier est illisible (erreur journalisée).
function gameplay_sites_sitesManager.loadSites(filepath, force, ignoreCache) end

--- Hook appelé à la fin de la mission : vide le cache des sites.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/sites/sitesManager.lua:62
function gameplay_sites_sitesManager.onClientEndMission() end

--- Hook appelé au début d'une mission/niveau : mémorise le niveau courant.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/sites/sitesManager.lua:58
function gameplay_sites_sitesManager.onClientStartMission() end

--- Restaure l'état après un rechargement Lua.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/sites/sitesManager.lua:89
---@param data table|nil Données de onSerialize.
function gameplay_sites_sitesManager.onDeserialized(data) end

--- Hook appelé quand le gestionnaire de mods est prêt : construit la liste des fichiers sites.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/sites/sitesManager.lua:54
function gameplay_sites_sitesManager.onModManagerReady() end

--- Sérialise la liste des fichiers, le niveau courant et le cache pour le rechargement Lua. Renvoie nil si rien n'est en cache.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/sites/sitesManager.lua:73
function gameplay_sites_sitesManager.onSerialize() end

