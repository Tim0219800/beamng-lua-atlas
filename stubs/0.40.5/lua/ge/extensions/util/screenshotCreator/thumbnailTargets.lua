---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/screenshotCreator/thumbnailTargets.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Aide à la construction de la liste des cibles de vignettes (couples modèle/config) pour le compositeur de vignettes. Il valide les cibles reçues de l'interface (au plus 2000, noms de 128 caractères maximum, doublons supprimés), les transforme en éléments de travail à partir des données de core_vehicles, produit le catalogue des modèles et configs pour l'interface (avec l'indicateur « livré » de shippedConfigs) et gère le cas par défaut où seule la config du véhicule du joueur est photographiée.
--- Accès : extension `util_screenshotCreator_thumbnailTargets` : `extensions.load("util_screenshotCreator_thumbnailTargets")`, puis la globale `util_screenshotCreator_thumbnailTargets`
---@class util_screenshotCreator_thumbnailTargets
---@field dependencies string[] Extensions chargées avant : core_vehicles et util_screenshotCreator_shippedConfigs.
util_screenshotCreator_thumbnailTargets = {}

--- Transforme des cibles assainies en éléments de travail. Échoue si une config est inconnue.
---Source : lua/ge/extensions/util/screenshotCreator/thumbnailTargets.lua:54
---@param targets table[] Liste de {model, config}.
---@return table[]|nil  Éléments de travail.
---@return string|nil  « Unknown vehicle config: modèle/config ».
function util_screenshotCreator_thumbnailTargets.buildExplicitWorkItems(targets) end

--- Construit le catalogue trié des modèles pour l'interface : {key, label « Marque Nom », category = Type, configs = [{key, label, isDefault, shipped}]}. Les modèles sans config sont omis.
---Source : lua/ge/extensions/util/screenshotCreator/thumbnailTargets.lua:71
---@return table[]  Catalogue des modèles.
function util_screenshotCreator_thumbnailTargets.buildModelCatalog() end

--- Liste toutes les cibles {model, config} livrées (selon shippedConfigs) pour les modèles donnés.
---Source : lua/ge/extensions/util/screenshotCreator/thumbnailTargets.lua:100
---@param modelKeys string[] Clés de modèles.
---@return table[]  Cibles {model, config}.
function util_screenshotCreator_thumbnailTargets.buildShippedTargets(modelKeys) end

--- Cherche dans core_vehicles.getModel(modelKey).configs la configuration dont key vaut configName.
---Source : lua/ge/extensions/util/screenshotCreator/thumbnailTargets.lua:16
---@param modelKey string Clé du modèle.
---@param configName string Clé de la configuration.
---@return table|nil  Données de la config, ou nil.
function util_screenshotCreator_thumbnailTargets.getConfigData(modelKey, configName) end

--- Indique si la config est celle par défaut du modèle (is_default_config ou default_pc du modèle).
---Source : lua/ge/extensions/util/screenshotCreator/thumbnailTargets.lua:24
---@param modelKey string Clé du modèle.
---@param configName string Clé de la configuration.
---@param configData table|nil Données de la config, si déjà connues.
---@return boolean  true si config par défaut.
function util_screenshotCreator_thumbnailTargets.isDefaultConfig(modelKey, configName, configData) end

--- Extrait le nom de config d'un chemin .pc (dernier segment, sans extension). Renvoie nil si ce n'est pas une chaîne finissant par .pc.
---Source : lua/ge/extensions/util/screenshotCreator/thumbnailTargets.lua:9
---@param partConfig string|nil Valeur de vehicle.partConfig, ex. vehicles/pickup/d15_4wd.pc.
---@return string|nil  Nom de la configuration, ex. d15_4wd.
function util_screenshotCreator_thumbnailTargets.normalizeConfigName(partConfig) end

--- Convertit un message de démarrage de l'interface en éléments de travail : message.targets si présent, sinon la config actuelle du véhicule du joueur.
---Source : lua/ge/extensions/util/screenshotCreator/thumbnailTargets.lua:113
---@param message table|nil Message de l'interface ({targets = ...}).
---@return table[]|nil  Éléments de travail.
---@return string|nil  Message d'erreur.
function util_screenshotCreator_thumbnailTargets.resolveStartMessage(message) end

--- Valide et dédoublonne une liste de cibles.
---Source : lua/ge/extensions/util/screenshotCreator/thumbnailTargets.lua:30
---@param targets table|nil Liste de {model, config}.
---@return table|nil  Liste assainie ; nil si targets est nil.
---@return string|nil  Message d'erreur (liste invalide, cible invalide à l'indice N).
function util_screenshotCreator_thumbnailTargets.sanitizeTargets(targets) end

