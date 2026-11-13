---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/vehicleClassGrouping.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Génère des groupes de véhicules par classe de performance (S, A, B, C, D) pour le système core_multiSpawn (adversaires, courses). Parcourt tous les modèles Car/Truck et leurs configs, filtre par modèle, config et type de config, garde ceux dont la classe (gameplay_vehiclePerformance.getClassFromConfig) correspond, puis mélange le résultat. Fournit aussi un coefficient d'agressivité de l'IA par classe.
--- Accès : extension `career_modules_vehicleClassGrouping` : `extensions.load("career_modules_vehicleClassGrouping")`, puis la globale `career_modules_vehicleClassGrouping`
---@class career_modules_vehicleClassGrouping
---@field dependencies string[] {"gameplay_vehiclePerformance"}.
career_modules_vehicleClassGrouping = {}

--- Construit un groupe de véhicules d'une classe donnée, utilisable par core_multiSpawn.
---Source : lua/ge/extensions/career/modules/vehicleClassGrouping.lua:50
---@param class string|nil Classe de performance, défaut "B".
---@param mode string|nil "default" ou "drag" (sans effet).
---@param modelFilter table<string, any>|nil Modèles à exclure (clé = modèle).
---@param configFilter table<string, any>|nil Configs à exclure (clé "modèle/config").
---@param configTypeFilter table<string, any>|nil Types de config à exclure.
---@param invertedFilters table<string, boolean>|nil Ex. {modelFilter = true} inverse le filtre (liste blanche).
---@param randomizePaint boolean|nil Peinture « (Random) », vrai par défaut.
---@param smartShuffle boolean|nil Entrelacer les modèles, vrai par défaut.
---@param performanceIndexTarget number|nil Indice de performance visé.
---@param performanceIndexWindow number|nil Tolérance autour de la cible, défaut 5.
---@return table  {name = "Class X", type = "custom", data = {{model, config, paintName}, ...}}.
function career_modules_vehicleClassGrouping.generateGroup(class, mode, modelFilter, configFilter, configTypeFilter, invertedFilters, randomizePaint, smartShuffle, performanceIndexTarget, performanceIndexWindow) end

--- Retourne le coefficient d'agressivité de l'IA pour une classe.
---Source : lua/ge/extensions/career/modules/vehicleClassGrouping.lua:37
---@param class string|nil Classe S/A/B/C/D, défaut "B".
---@return number  Coefficient (1 si classe inconnue).
function career_modules_vehicleClassGrouping.getAggressionMultiplier(class) end

