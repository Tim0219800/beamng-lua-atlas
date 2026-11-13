---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/vehicleTriggersDebug.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Fenêtre imgui « Vehicle event debug » pour inspecter les triggers de véhicule : affiche l'état de core_vehicleTriggers (caméra, trigger tenu, position survolée, libellés), liste les véhicules avec leurs triggers, leurs liens d'action et les événements JBeam, et permet de les déclencher à la souris. Chargée par core_vehicleTriggers.enableDebugUI() et déchargée par disableDebugUI(). Un moddeur de véhicule s'en sert pour vérifier ses sections triggers et triggerEventLinks.
--- Accès : extension `core_vehicleTriggersDebug` : `extensions.load("core_vehicleTriggersDebug")`, puis la globale `core_vehicleTriggersDebug`
---@class core_vehicleTriggersDebug
---@field dependencies string[] core_vehicleTriggers et core_vehicle_vehicleTriggerHighlight.
core_vehicleTriggersDebug = {}

--- Hook appelé après un rechargement des extensions : restaure les triggers surlignés via core_vehicle_vehicleTriggerHighlight.setSerializedHighlightedTriggerData.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/vehicleTriggersDebug.lua:485
---@param data table|nil Données de onSerialize ({highLightedTriggerData}).
function core_vehicleTriggersDebug.onDeserialized(data) end

--- Hook appelé avant un rechargement des extensions : sauvegarde les triggers surlignés.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/vehicleTriggersDebug.lua:475
---@return table  {highLightedTriggerData = données de surbrillance ou nil}
function core_vehicleTriggersDebug.onSerialize() end

--- Hook appelé à chaque image : dessine la fenêtre imgui de debug.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/vehicleTriggersDebug.lua:471
---@param dtReal number Temps réel écoulé (s).
---@param dtSim number Temps de simulation écoulé (s).
---@param dtRaw number Temps brut écoulé (s).
function core_vehicleTriggersDebug.onUpdate(dtReal, dtSim, dtRaw) end

