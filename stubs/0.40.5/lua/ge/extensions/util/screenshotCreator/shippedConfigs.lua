---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/screenshotCreator/shippedConfigs.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Détermine si un modèle de véhicule ou une configuration (.pc) est « livré » avec le jeu, c'est-à-dire non exclu par le fichier de filtres de déploiement /DevTools/deployfilters/shared_prepack.txt. Le fichier est lu une fois (règles en minuscules, lignes vides et commentaires # ignorés), les règles de type glob (*, **, ?) sont converties en motifs Lua et les résultats sont mis en cache. Utilisé par le créateur de vignettes (modelSelection, job) pour ne photographier que les véhicules livrés.
--- Accès : extension `util_screenshotCreator_shippedConfigs` : `extensions.load("util_screenshotCreator_shippedConfigs")`, puis la globale `util_screenshotCreator_shippedConfigs`
---@class util_screenshotCreator_shippedConfigs
util_screenshotCreator_shippedConfigs = {}

--- Oublie les règles chargées et le cache de résultats ; le fichier de filtres sera relu au prochain appel.
---Source : lua/ge/extensions/util/screenshotCreator/shippedConfigs.lua:87
function util_screenshotCreator_shippedConfigs.clearCache() end

--- Indique si le modèle ET le fichier /vehicles/<modèle>/<config>.pc sont livrés.
---Source : lua/ge/extensions/util/screenshotCreator/shippedConfigs.lua:82
---@param modelName string Nom du modèle.
---@param configName string Nom de la configuration, sans extension .pc.
---@return boolean  true si la config est livrée.
function util_screenshotCreator_shippedConfigs.isConfigShipped(modelName, configName) end

--- Indique si le dossier /vehicles/<modèle>/ n'est pas exclu par les filtres de déploiement.
---Source : lua/ge/extensions/util/screenshotCreator/shippedConfigs.lua:78
---@param modelName string Nom du modèle (dossier de véhicule).
---@return boolean  true si le modèle est livré.
function util_screenshotCreator_shippedConfigs.isModelShipped(modelName) end

