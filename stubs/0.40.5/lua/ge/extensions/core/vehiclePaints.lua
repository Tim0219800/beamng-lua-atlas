---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/vehiclePaints.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Extension GE `core_vehiclePaints` : gestion des peintures de véhicules. Lit les fichiers de bibliothèque de peintures (paints, multiPaintSetups, paintCollections) via core_vehicles, résout les peintures déclarées par chaque modèle et chaque config (`setupPaints`, appelé par core_vehicles.getModel), compare les peintures d'un .pc avec celles du modèle/de la bibliothèque, et tire des peintures aléatoires selon les distributions randomPaintDistribution / randomMultiPaintDistribution. Une peinture est une table {baseColor = {r,g,b,a}, metallic, roughness, clearcoat, clearcoatRoughness, name, class…}.
--- Accès : extension `core_vehiclePaints` : `extensions.load("core_vehiclePaints")`, puis la globale `core_vehiclePaints`
---@class core_vehiclePaints
core_vehiclePaints = {}

--- Comme writePcPaintsAsInfoPaints, mais réutilise une référence existante (peinture du modèle, de la bibliothèque, ou multiPaintSetup équivalent trouvé par signature) quand elle existe, au lieu de dupliquer la peinture.
---Source : lua/ge/extensions/core/vehiclePaints.lua:1069
---@param pcData table contenu du .pc
---@param infoData table contenu info à compléter (defaultMultiPaintSetup)
---@param configName string nom de la config
---@param modelName string modèle, pour chercher ses peintures
function core_vehiclePaints.convertPcPaintsToInfoPaints(pcData, infoData, configName, modelName) end

--- Génère un multiPaintSetup aléatoire en tirant trois peintures simples (les multiPaintSetups de la distribution sont ignorés).
---Source : lua/ge/extensions/core/vehiclePaints.lua:1215
---@param model_key string modèle
---@param config_key string config
---@param avoidDuplicates boolean|nil si true, une peinture déjà tirée ne peut pas être retirée
---@return table  {paintName1, paintName2, paintName3} ('White' en secours)
function core_vehiclePaints.createRandomMultiPaintSetup(model_key, config_key, avoidDuplicates) end

--- Tire au hasard une entrée de peinture selon les probabilités de la config (ou à défaut du modèle). Le helper est construit à la première demande.
---Source : lua/ge/extensions/core/vehiclePaints.lua:1169
---@param model_key string nom du modèle
---@param config_key string clé de la config (peut être sans config propre : alors le modèle est utilisé)
---@return table|nil  {type ('paint' ou multiPaintSetup), paintName1, paintName2, paintName3, probability}
function core_vehiclePaints.getRandomPaints(model_key, config_key) end

--- Tire des peintures pour un véhicule existant, d'après son modèle et sa config (extraits de partConfig).
---Source : lua/ge/extensions/core/vehiclePaints.lua:1195
---@param vehId integer|nil identifiant du véhicule
---@return string[]  {nom1, nom2, nom3} utilisable par core_vehicle_manager.setVehicleColorsNames ; {'White','White','White'} si le véhicule ou la config est introuvable
function core_vehiclePaints.getRandomPaintsByVehicle(vehId) end

--- Signature d'un ensemble de 3 peintures : {"paint1":..,"paint2":..,"paint3":..} où chaque élément est une paintSignature.
---Source : lua/ge/extensions/core/vehiclePaints.lua:19
---@param multiPaintSetup table table avec paint1, paint2, paint3 (peintures complètes)
---@return string  signature
function core_vehiclePaints.multiPaintSetupSignature(multiPaintSetup) end

--- Chaîne JSON canonique d'une peinture ({baseColor, clearcoat, clearcoatRoughness, metallic, roughness}, 5 décimales) servant à comparer deux peintures.
---Source : lua/ge/extensions/core/vehiclePaints.lua:17
---@param paint table peinture complète
---@return string  signature
function core_vehiclePaints.paintSignature(paint) end

--- Prépare les peintures d'un modèle et de ses configs : collecte les peintures directes, les libraryPaints, les paintCollections, résout les multiPaintSetups et les peintures par défaut (modèle d'abord, puis configs) et finalise les classes. Modifie `model` et `configs` en place. Appelée par core_vehicles.getModel.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/vehiclePaints.lua:351
---@param model table table du modèle (model.key, model.paints…)
---@param configs table<string, table> configs du modèle
function core_vehiclePaints.setupPaints(model, configs) end

--- Outil de test : tire `amount` peintures et logue (niveau I) la répartition obtenue.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/vehiclePaints.lua:1266
---@param model_key string modèle
---@param config_key string config
---@param amount integer nombre de tirages
function core_vehiclePaints.testRandomPaint(model_key, config_key, amount) end

--- Analyse les peintures d'un .pc : pour chacune des 3, indique si elle correspond à une peinture du modèle, de la bibliothèque ou est personnalisée, et si l'ensemble correspond à un multiPaintSetup connu.
---Source : lua/ge/extensions/core/vehiclePaints.lua:1143
---@param pcData table contenu du .pc
---@param modelName string nom du modèle
---@return table  {paints = {{index, source ('model'|'library'|'custom'), modelPaintName, libraryPaintId, libraryPaintName, resolvedReference}}, multiPaintSetup = {found, source, name, id}, defaultStorageMode ('individualPaints'|'multiPaintSetup'), canOverridePaints, modelDefaultColors, modelDefaultMultiPaintSetup}
function core_vehiclePaints.validatePcPaints(pcData, modelName) end

--- Écrit les peintures d'un .pc comme `defaultMultiPaintSetup` d'un fichier info, avec des peintures explicites (class 'hidden', nommées '<config> Paint N'). Modifie infoData.
---Source : lua/ge/extensions/core/vehiclePaints.lua:1055
---@param pcData table contenu du .pc (champ paints)
---@param infoData table contenu info à compléter
---@param configName string nom de la config
function core_vehiclePaints.writePcPaintsAsInfoPaints(pcData, infoData, configName) end

