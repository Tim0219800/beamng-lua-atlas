---@meta
-- tim19Atlas stub generated from lua/ge/extensions/telemetry/performanceSpatialConfig.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Module utilitaire (chargé par require) qui lit et valide la configuration serveur du tracker performanceSpatial. Les nombres sont bornés (NaN/infini remplacés par la valeur par défaut) ; toutes les options de collecte avancée sont désactivées par défaut et doivent être activées explicitement.
--- Accès : extension `telemetry_performanceSpatialConfig` : `extensions.load("telemetry_performanceSpatialConfig")`, puis la globale `telemetry_performanceSpatialConfig`
---@class telemetry_performanceSpatialConfig
telemetry_performanceSpatialConfig = {}

--- Renvoie la configuration normalisée : sampleIntervalSeconds, les booléens dipTrackingEnabled, recoveryTrackingEnabled, gameplayExitTrackingEnabled, shaderGenerationTrackingEnabled, sceneComplexityTrackingEnabled, renderTimingTrackingEnabled, éventuellement levels (table de recherche) et detector (seuils de chute).
---Source : lua/ge/extensions/telemetry/performanceSpatialConfig.lua:17
---@param config table|nil Configuration brute du module (une valeur non table est traitée comme {}).
---@return table  Configuration validée.
function telemetry_performanceSpatialConfig.read(config) end

