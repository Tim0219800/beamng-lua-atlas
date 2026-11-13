---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/asyncBulkLoader.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Chargeur asynchrone de gros jeux de données (véhicules, missions, sélecteur de gameplay, niveaux, profils de sauvegarde carrière). Chaque loadXxx lance un job (core_jobsystem, intervalle 1/30 s) qui exécute le chargement lourd en cédant la main au fil des étapes, publie la progression dans le flux 'asyncBulkLoaderProgress' et signale la fin par guihooks et extensions.hook. Les variantes xxxDirect chargent de façon synchrone avec mesure du temps.
--- Accès : extension `util_asyncBulkLoader` : `extensions.load("util_asyncBulkLoader")`, puis la globale `util_asyncBulkLoader`
---@class util_asyncBulkLoader
---@field yield function|nil Fonction de cession (job.yield) posée par setupYield ; nop au départ. Appelée par le code de chargement pour laisser respirer le jeu.
util_asyncBulkLoader = {}

--- Ajoute au nombre d'éléments déjà traités et publie la progression.
---Source : lua/ge/extensions/util/asyncBulkLoader.lua:30
---@param count number Éléments traités à ajouter.
function util_asyncBulkLoader.addCount(count) end

--- Ajoute au total d'éléments à charger et publie la progression.
---Source : lua/ge/extensions/util/asyncBulkLoader.lua:23
---@param total number Éléments à ajouter au total.
function util_asyncBulkLoader.addTotal(total) end

--- Indique si les données du sélecteur de gameplay sont chargées.
---Source : lua/ge/extensions/util/asyncBulkLoader.lua:102
---@return boolean  true si chargées.
function util_asyncBulkLoader.isGameplaySelectorLoaded() end

--- Indique si la liste des niveaux est chargée (core_levels.isListLoaded).
---Source : lua/ge/extensions/util/asyncBulkLoader.lua:106
---@return boolean  true si chargée.
function util_asyncBulkLoader.isLevelsLoaded() end

--- Indique si un chargement asynchrone est en cours.
---Source : lua/ge/extensions/util/asyncBulkLoader.lua:135
---@return boolean  true si en cours.
function util_asyncBulkLoader.isLoading() end

--- Indique si toutes les missions sont chargées.
---Source : lua/ge/extensions/util/asyncBulkLoader.lua:98
---@return boolean  true si chargées.
function util_asyncBulkLoader.isMissionsLoaded() end

--- Indique si les données des modèles de véhicules sont chargées (core_vehicles.isModelsDataLoaded).
---Source : lua/ge/extensions/util/asyncBulkLoader.lua:94
---@return boolean  true si chargées.
function util_asyncBulkLoader.isVehiclesLoaded() end

--- Construit en asynchrone les données du sélecteur de gameplay, puis émet 'asyncGameplaySelectorLoadComplete'.
---Source : lua/ge/extensions/util/asyncBulkLoader.lua:228
---@return string  'alreadyLoaded', 'alreadyLoading' ou 'startLoading'.
function util_asyncBulkLoader.loadGameplaySelector() end

--- Construit les tuiles du sélecteur de gameplay de façon synchrone et affiche le temps.
---Source : lua/ge/extensions/util/asyncBulkLoader.lua:122
function util_asyncBulkLoader.loadGameplaySelectorDirect() end

--- Charge en asynchrone la liste des niveaux, puis émet 'asyncLevelLoadComplete'.
---Source : lua/ge/extensions/util/asyncBulkLoader.lua:268
---@return string  'alreadyLoaded', 'alreadyLoading' ou 'startLoading'.
function util_asyncBulkLoader.loadLevels() end

--- Charge la liste des niveaux de façon synchrone et affiche le temps.
---Source : lua/ge/extensions/util/asyncBulkLoader.lua:128
function util_asyncBulkLoader.loadLevelsDirect() end

--- Charge en asynchrone toutes les missions, puis émet le guihook 'asyncMissionLoadComplete'.
---Source : lua/ge/extensions/util/asyncBulkLoader.lua:193
---@return string  'alreadyLoaded', 'alreadyLoading' ou 'startLoading'.
function util_asyncBulkLoader.loadMissions() end

--- Charge toutes les missions de façon synchrone et affiche le temps.
---Source : lua/ge/extensions/util/asyncBulkLoader.lua:116
function util_asyncBulkLoader.loadMissionsDirect() end

--- Charge en asynchrone les données des modèles de véhicules, puis émet 'asyncVehicleLoadComplete' (UI et extensions). Utilisé par le sélecteur de véhicules.
---Source : lua/ge/extensions/util/asyncBulkLoader.lua:155
---@return string  'alreadyLoaded', 'alreadyLoading' ou 'startLoading'.
function util_asyncBulkLoader.loadVehicles() end

--- Charge la liste des modèles de véhicules de façon synchrone (core_vehicles.loadModelListNoGarbage) et affiche le temps.
---Source : lua/ge/extensions/util/asyncBulkLoader.lua:110
function util_asyncBulkLoader.loadVehiclesDirect() end

--- Met à jour le pourcentage de l'analyse de fichiers (décodage des véhicules) et publie la progression.
---Source : lua/ge/extensions/util/asyncBulkLoader.lua:18
---@param percent number 0 à 100 déterminé, -1 indéterminé.
function util_asyncBulkLoader.reportScanPercent(percent) end

--- Envoie l'état de progression courant dans le flux 'asyncBulkLoaderProgress'.
---Source : lua/ge/extensions/util/asyncBulkLoader.lua:13
function util_asyncBulkLoader.reportStream() end

--- Dans un job, envoie à l'UI les données de tous les emplacements de sauvegarde carrière (career_career.sendAllCareerProfilesData).
---Source : lua/ge/extensions/util/asyncBulkLoader.lua:304
---@return string  'startLoading'.
function util_asyncBulkLoader.sendAllCareerSaveSlotsDataAsync() end

--- Prépare M.yield à partir d'un job : job.yield, ou une version avec profilage si le seuil est abaissé.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/asyncBulkLoader.lua:139
---@param job table Job de core_jobsystem.
function util_asyncBulkLoader.setupYield(job) end

