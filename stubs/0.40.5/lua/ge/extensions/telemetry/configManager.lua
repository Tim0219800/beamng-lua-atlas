---@meta
-- tim19Atlas stub generated from lua/ge/extensions/telemetry/configManager.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Extension GE (dépend de telemetry_userIdentity) qui gère la configuration de la télémétrie : lecture du cache /telemetry/config.json, validation, récupération périodique auprès du serveur (s11/v1/telemetryConfig, avec les faits de clientFacts et l'identifiant anonyme), puis application via un callback. Elle indique quels modules/trackers sont activés (moduleConfigs). Le démarrage avec l'argument -telemetryLocal active tous les trackers avec leurs valeurs par défaut sans jamais contacter le serveur ni rien envoyer.
--- Accès : extension `telemetry_configManager` : `extensions.load("telemetry_configManager")`, puis la globale `telemetry_configManager`
---@class telemetry_configManager
---@field dependencies string[] {'telemetry_userIdentity'}.
telemetry_configManager = {}

--- Si le délai de reprise est écoulé et que le TTL de la config est dépassé, relance fetchConfigFromAPI et applique la nouvelle config. Au plus une tentative toutes les 300 s.
---Source : lua/ge/extensions/telemetry/configManager.lua:145
function telemetry_configManager.checkConfigExpiry() end

--- Appelle core_online.apiCall('s11/v1/telemetryConfig') en envoyant les faits client et l'identifiant anonyme. Si la réponse est valide, la sauvegarde dans /telemetry/config.json et appelle callback ; sinon, appelle callback avec une config par défaut désactivée (sauf si une config existe déjà).
---Source : lua/ge/extensions/telemetry/configManager.lua:105
---@param callback function|nil Appelée avec la configuration obtenue.
function telemetry_configManager.fetchConfigFromAPI(callback) end

--- Renvoie la configuration actuellement appliquée.
---Source : lua/ge/extensions/telemetry/configManager.lua:158
---@return table|nil  Config (enabled, ttlHours, reportIntervalHours, runIds, moduleConfigs) ou nil avant initializeConfig.
function telemetry_configManager.getConfig() end

--- Renvoie la configuration d'un module de télémétrie : {enabled = true} en mode local, la table moduleConfigs[moduleName] si elle existe, sinon la table partagée {enabled = false}.
---Source : lua/ge/extensions/telemetry/configManager.lua:162
---@param moduleName string Nom du module/tracker.
---@return table  Config du module (ne pas la modifier : elle peut être partagée).
function telemetry_configManager.getModuleConfig(moduleName) end

--- Intervalle d'échantillonnage d'un module en heures : surveyIntervalHours, ou surveyIntervalDays * 24 pour les anciens caches, sinon la valeur par défaut. Les anciens caches en jours restent lus jusqu'à ce que toutes les installations aient récupéré le format en heures.
---Source : lua/ge/extensions/telemetry/configManager.lua:176
---@param moduleName string Nom du module.
---@param defaultHours number Valeur renvoyée si rien n'est configuré.
---@return number  Intervalle en heures.
function telemetry_configManager.getSurveyIntervalHours(moduleName, defaultHours) end

--- Renvoie la version du schéma de télémétrie.
---Source : lua/ge/extensions/telemetry/configManager.lua:187
---@return string  Actuellement '30'.
function telemetry_configManager.getTelemetryVersion() end

--- Charge la configuration : en mode local, applique une config par défaut activée ; sinon active le polling, applique le cache s'il est valide et récent, sinon une config par défaut désactivée (la récupération réelle a lieu après authentification en ligne).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/configManager.lua:191
---@param callback function|nil Appelée avec la config à chaque application (et mémorisée pour les mises à jour ultérieures).
function telemetry_configManager.initializeConfig(callback) end

--- Indique si le jeu a été lancé avec -telemetryLocal : tous les trackers sont actifs avec leurs valeurs par défaut, le serveur n'est jamais interrogé et rien n'est envoyé.
---Source : lua/ge/extensions/telemetry/configManager.lua:31
---@return boolean  true si l'argument est présent.
function telemetry_configManager.isLocalOnly() end

--- Indique si un module est activé (getModuleConfig(...).enabled == true).
---Source : lua/ge/extensions/telemetry/configManager.lua:170
---@param moduleName string Nom du module/tracker.
---@return boolean  true si activé.
function telemetry_configManager.isModuleEnabled(moduleName) end

--- Hook de chargement : passe l'extension en mode de déchargement manuel.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/configManager.lua:241
function telemetry_configManager.onExtensionLoaded() end

--- Active ou coupe le polling : installe/retire les hooks onUpdate (test d'expiration toutes les 60 s si la session en ligne est authentifiée) et onOnlineStateChanged (test dès la connexion), puis appelle extensions.hookUpdate.
---Source : lua/ge/extensions/telemetry/configManager.lua:230
---@param enabled boolean true pour activer.
function telemetry_configManager.setPollingEnabled(enabled) end

