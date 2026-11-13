---@meta
-- tim19Atlas stub generated from lua/ge/extensions/vehicles/saveConfigUtils.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Utilitaires de l'éditeur de métadonnées d'une configuration de véhicule (info_<config>.json) lors de la sauvegarde. Définit la liste des champs éditables (Description, Value, Years, vehicleSelectorSubCluster, vehicleSelectorSubGroup, Country, Region, Type, Body Style, Config Type, Commercial Class, Derby Class, InsuranceClass, Population) avec leur type, limites et libellés. `getFields` prépare ces champs pour l'interface (valeurs, options, valeur de repli) et `validateMetadata` normalise et valide les métadonnées avant écriture.
--- Accès : extension `vehicles_saveConfigUtils` : `extensions.load("vehicles_saveConfigUtils")`, puis la globale `vehicles_saveConfigUtils`
---@class vehicles_saveConfigUtils
vehicles_saveConfigUtils = {}

--- Vide les caches d'options (pays et catalogue) ; à appeler quand la liste des véhicules a changé.
---Source : lua/ge/extensions/vehicles/saveConfigUtils.lua:581
function vehicles_saveConfigUtils.clearCache() end

--- Construit la liste des champs de métadonnées pour l'éditeur. Pour chaque définition, calcule la valeur de la config cible (avec repli sur la config source si useSourceFallback), la valeur de repli du modèle, l'état `included`, et les options (avec une entrée « personnalisée » pour les listes qui autorisent une valeur libre). Retourne des copies des définitions, sans les clés internes.
---Source : lua/ge/extensions/vehicles/saveConfigUtils.lua:452
---@param modelKey string clé du modèle de véhicule
---@param vehicleDirectory string|nil dossier du véhicule (terminé par /) où lire info_<config>.json ; sinon core_vehicles.getConfig est utilisé
---@param sourceConfigName string|nil nom de la config d'origine (valeurs de repli)
---@param targetConfigName string|nil nom de la config cible dont on lit les valeurs actuelles
---@return table[]  liste ordonnée de champs : key, type, label, value, fallbackValue, included, optional, options, etc.
function vehicles_saveConfigUtils.getFields(modelKey, vehicleDirectory, sourceConfigName, targetConfigName) end

--- Valide et normalise une table de métadonnées. L'alias minuscule `description` est accepté pour `Description`. Refuse les clés inconnues et les valeurs invalides ; trim des textes, tri des multi-sélections.
---Source : lua/ge/extensions/vehicles/saveConfigUtils.lua:506
---@param metadata table|nil métadonnées à valider ; nil donne une table vide
---@param modelKey string|nil clé du modèle, utilisée pour résoudre les options des listes dépendantes du modèle
---@return table|nil  métadonnées normalisées, ou nil en cas d'erreur
---@return table|nil  en cas d'erreur : {field = clé ou nil, code = chaîne}
function vehicles_saveConfigUtils.validateMetadata(metadata, modelKey) end

