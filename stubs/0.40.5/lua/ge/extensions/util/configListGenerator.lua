---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/configListGenerator.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Génère des listes aléatoires de véhicules (configs) à partir de filtres, utilisées par les systèmes de gameplay qui ont besoin de véhicules vendus ou de trafic (vendeurs de la carrière, par exemple). Il part de la liste des configs de core_vehicles, exclut props, utilitaires et configs sans valeur, puis tire des configs au hasard en pondérant par un attribut de popularité.
--- Accès : extension `util_configListGenerator` : `extensions.load("util_configListGenerator")`, puis la globale `util_configListGenerator`
---@class util_configListGenerator
util_configListGenerator = {}

--- Indique si un véhicule (config) satisfait un filtre {whiteList, blackList}.
---Source : lua/ge/extensions/util/configListGenerator.lua:70
---@param vehicleInfo table Config de véhicule (avec aggregates).
---@param filter table Filtre {whiteList = table|nil, blackList = table|nil}.
---@return boolean  true si le véhicule passe.
function util_configListGenerator.doesVehiclePassFilter(vehicleInfo, filter) end

--- Renvoie la liste triée (modèle puis config) des configs éligibles : ayant un Type et une Value, hors Prop, Utility, PropParked et PropTraffic ; la marque traduite est écrite dans Brand.
---Source : lua/ge/extensions/util/configListGenerator.lua:175
---@param allowAuxiliaryVehicles boolean|nil true pour inclure les configs auxiliaires.
---@param allowLoadedTrailers boolean|nil true pour inclure les remorques chargées (hasLoad).
---@return table[]  Copies des infos de configs.
function util_configListGenerator.getEligibleVehicles(allowAuxiliaryVehicles, allowLoadedTrailers) end

--- Tire jusqu'à numberOfVehicles configs différentes selon les filtres d'un vendeur (filterSet.filter, avec subFilters éventuels) : choix d'un filtre, d'un modèle puis d'une config pondérée. Chaque résultat reçoit un champ filter (le filtre utilisé).
---Source : lua/ge/extensions/util/configListGenerator.lua:195
---@param filterSet table Vendeur {filter = {...}, subFilters = {...}|nil}.
---@param numberOfVehicles integer|nil Nombre de véhicules voulus, 10 par défaut.
---@param eligibleVehicles table[]|nil Liste issue de getEligibleVehicles ; calculée si nil.
---@param popAttribute string|nil Attribut de popularité, 'Population' par défaut.
---@return table[]  Infos des véhicules tirés (peut être plus court que demandé).
function util_configListGenerator.getRandomVehicleInfos(filterSet, numberOfVehicles, eligibleVehicles, popAttribute) end

