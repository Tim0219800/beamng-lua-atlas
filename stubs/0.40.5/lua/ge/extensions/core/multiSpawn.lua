---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/multiSpawn.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Extension GE `core_multiSpawn` : génération et placement de groupes de véhicules. Elle peut construire un groupe aléatoire à partir des véhicules installés (avec poids de population, filtres, pays, année), le faire apparaître en formation (route devant/derrière, grille de course, trafic, lignes), ou téléporter des véhicules existants dans une nouvelle formation. L'apparition se fait via un job, un véhicule par frame, et un seul groupe à la fois (les suivants sont mis en file). Utilisée notamment par l'app trafic de l'interface et par du code de gameplay (onVehicleGroupSpawned est écouté par 5 modules).
--- Accès : extension `core_multiSpawn` : `extensions.load("core_multiSpawn")`, puis la globale `core_multiSpawn`
---@class core_multiSpawn
---@field startEngines boolean true par défaut : les véhicules d'un groupe apparaissent moteur démarré (via onSpawnCCallback).
---@field useFullData boolean false par défaut. Si vrai, createGroup ajoute modelPop et configPop dans chaque entrée du groupe.
core_multiSpawn = {}

--- Crée un groupe aléatoire de `amount` véhicules (10 par défaut) à partir des véhicules installés, selon les filtres et populations.
---Source : lua/ge/extensions/core/multiSpawn.lua:291
---@param amount integer|nil Taille du groupe (10 par défaut).
---@param params table|nil { allMods, allConfigs, filters, country, modelPopPower, configPopPower, popDecreaseFactor, minPop, maxYear }.
---@return table[]  Entrées { model, config } ; {} si aucun véhicule ne correspond.
function core_multiSpawn.createGroup(amount, params) end

--- Calcule `amount` positions/rotations de formation selon options.mode (voir notes), en partant du joueur, de la caméra ou de options.pos.
---Source : lua/ge/extensions/core/multiSpawn.lua:509
---@param amount integer|nil Nombre de positions (20 par défaut).
---@param options table|nil { mode, gap, pos, dir, rot, startIndex, func }.
---@return table[]  Éléments { pos = vec3, rot = quat }.
function core_multiSpawn.createSpawnPositions(amount, options) end

--- Supprime des véhicules créés via ce module (ceux qui ont le champ vehicleGroup), en partant de la fin de la liste, avec limite et nom de groupe facultatifs. Utilisée par l'app de trafic.
---Source : lua/ge/extensions/core/multiSpawn.lua:847
---@param amount integer|nil Nombre max à supprimer ; nil = tous.
---@param groupName string|nil Ne supprime que ce groupe ; nil = tout groupe.
function core_multiSpawn.deleteVehicles(amount, groupName) end

--- Ajuste un groupe à `amount` éléments, en place : duplique les entrées en boucle s'il est trop petit, tronque s'il est trop grand.
---Source : lua/ge/extensions/core/multiSpawn.lua:703
---@param group table[] Groupe (modifié).
---@param amount integer|nil Taille cible.
---@return table[]  Le même groupe.
function core_multiSpawn.fitGroup(group, amount) end

--- Parcourt les modèles et configs installés (core_vehicles) et construit la table de base servant à tirer un groupe : par modèle { model, country, popBase, popFactor, configData = [{ config, popBase, popFactor }] }, plus countryCounts. Par défaut seuls les contenus officiels sont pris (allMods = false).
---Source : lua/ge/extensions/core/multiSpawn.lua:140
---@param params table|nil { allMods, allConfigs, filters, minPop, maxYear, country }. filters par défaut { Type = { car = 1, truck = 1 } }. Note : si params est fourni sans allConfigs, seule la config par défaut de chaque modèle est retenue.
---@return table  Liste de modèles avec champ countryCounts.
function core_multiSpawn.getInstalledVehicleData(params) end

--- Hook appelé à la création d'un véhicule côté C++ : pendant un spawn de groupe, demande au véhicule d'apparaître moteur tournant (selon startEngines).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/multiSpawn.lua:863
---@param id integer Id du véhicule créé.
function core_multiSpawn.onSpawnCCallback(id) end

--- Téléporte des véhicules existants dans une nouvelle formation (un par intervalle de 0.02 s via un job, ou immédiatement si options.instant). Les positions sont corrigées par le décalage du nœud de référence sauf ignoreAdjust ; safeTeleport est utilisé sauf ignoreSafe.
---Source : lua/ge/extensions/core/multiSpawn.lua:685
---@param vehIds integer[] Ids des véhicules à placer.
---@param options table|nil { mode, gap, pos, dir, rot, startIndex, func, customTransforms, instant, ignoreAdjust, ignoreSafe }.
function core_multiSpawn.placeGroup(vehIds, options) end

--- Prépare les données d'apparition à partir d'un groupe : copie, ajuste à la taille demandée (fitGroup), complète la config par défaut, résout les peintures (y compris aléatoires). Un modèle introuvable est remplacé par le modèle 'pickup' par défaut (erreur loggée).
---Source : lua/ge/extensions/core/multiSpawn.lua:727
---@param group table[] Groupe de véhicules.
---@param amount integer|nil Taille voulue ; nil garde la taille du groupe.
---@return table[]|nil  Données d'apparition, nil si le groupe est vide.
function core_multiSpawn.setVehicleSpawnData(group, amount) end

--- Obsolète : crée un groupe aléatoire puis le fait apparaître. Utiliser spawnGroup.
---Source : lua/ge/extensions/core/multiSpawn.lua:842
---@param amount integer Nombre de véhicules.
---@param shuffle boolean|nil Mélange l'ordre.
---@param spawnMode string|nil Mode de formation.
---@param spawnGap number|nil Espacement en mètres.
---@return integer|nil  Id du groupe.
function core_multiSpawn.setupVehicles(amount, shuffle, spawnMode, spawnGap) end

--- Fait apparaître un groupe de véhicules en formation. Si un groupe est déjà en cours, la demande est mise en file. Groupe vide : en crée un par défaut ; amount <= 0 : ne fait rien.
---Source : lua/ge/extensions/core/multiSpawn.lua:796
---@param group table[]|nil Groupe de véhicules.
---@param amount integer Nombre de véhicules.
---@param options table|nil { name ('custom'), mode ('roadAhead'), gap (15), shuffle, randomPaints, cling, ignoreAdjust, canSpawnAnotherVehicleCheck, pos, dir, rot, startIndex, func, customTransforms }.
---@return integer|nil  Identifiant unique du groupe (nil si en file, refusé, ou scène sans MissionGroup).
function core_multiSpawn.spawnGroup(group, amount, options) end

--- Étape basse niveau de spawnGroup : affecte positions et rotations aux données d'apparition déjà préparées par setVehicleSpawnData, les assainit (sanitizeVehicleSpawnOptions) et lance le job de création (un véhicule par frame).
---Source : lua/ge/extensions/core/multiSpawn.lua:617
---@param spawnData table[] Sortie de setVehicleSpawnData.
---@param spawnOptions table Mêmes options que spawnGroup (name, mode, gap, cling, ...).
---@return integer|nil  Nouvel identifiant de groupe, nil si pas de MissionGroup ou données vides.
function core_multiSpawn.spawnProcessedGroup(spawnData, spawnOptions) end

--- Convertit tous les véhicules actuellement dans la scène (getAllVehiclesByType) en groupe, avec exclusions facultatives.
---Source : lua/ge/extensions/core/multiSpawn.lua:339
---@param ignorePlayer boolean|nil Exclut le véhicule joueur 0.
---@param ignoreTraffic boolean|nil Exclut les véhicules de trafic ou garés.
---@return table[]  Entrées de groupe.
function core_multiSpawn.spawnedVehsToGroup(ignorePlayer, ignoreTraffic) end

--- Alias de placeGroup.
---Source : lua/ge/extensions/core/multiSpawn.lua:685
---@param vehIds integer[] Ids des véhicules.
---@param options table|nil Voir placeGroup.
function core_multiSpawn.teleportGroup(vehIds, options) end

--- Convertit des véhicules existants en entrées de groupe (modèle, config, peintures, les noms de peinture valent '(Custom)').
---Source : lua/ge/extensions/core/multiSpawn.lua:316
---@param vehIds integer[]|nil Ids de véhicules.
---@return table[]  Entrées de groupe.
function core_multiSpawn.vehIdsToGroup(vehIds) end

