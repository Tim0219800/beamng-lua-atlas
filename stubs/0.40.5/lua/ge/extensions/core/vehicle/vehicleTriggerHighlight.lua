---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/vehicle/vehicleTriggerHighlight.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Extension GE `core_vehicle_vehicleTriggerHighlight` : met en surbrillance dans le monde 3D des triggers de véhicule (zones d'interaction définies dans le jbeam). Chaque frame, onUpdate dessine avec debugDrawer une sphère (avec un cercle face caméra) ou une boîte pulsante (alpha oscillant) et, si demandé, une étiquette 'id - nom [section]'. Utile pour les outils de debug/édition de triggers.
--- Accès : extension `core_vehicle_vehicleTriggerHighlight` : `extensions.load("core_vehicle_vehicleTriggerHighlight")`, puis la globale `core_vehicle_vehicleTriggerHighlight`
---@class core_vehicle_vehicleTriggerHighlight
core_vehicle_vehicleTriggerHighlight = {}

--- Retire toutes les surbrillances de tous les véhicules.
---Source : lua/ge/extensions/core/vehicle/vehicleTriggerHighlight.lua:207
function core_vehicle_vehicleTriggerHighlight.clearHighlightedTrigger() end

--- Exporte les surbrillances sous forme de liste sérialisable.
---Source : lua/ge/extensions/core/vehicle/vehicleTriggerHighlight.lua:211
---@return table[]  liste de {vehId, triggerId, options}
function core_vehicle_vehicleTriggerHighlight.getSerializedHighlightedTriggerData() end

--- Indique si au moins un trigger est en surbrillance.
---Source : lua/ge/extensions/core/vehicle/vehicleTriggerHighlight.lua:154
---@return boolean  true s'il y en a
function core_vehicle_vehicleTriggerHighlight.hasHighlightedTriggers() end

--- Indique si un trigger donné est en surbrillance.
---Source : lua/ge/extensions/core/vehicle/vehicleTriggerHighlight.lua:158
---@param vehId integer véhicule
---@param triggerId integer|string cid du trigger
---@return boolean  true si en surbrillance
function core_vehicle_vehicleTriggerHighlight.isHighlightedTrigger(vehId, triggerId) end

--- Hook par frame : dessine chaque trigger en surbrillance (sphère ou boîte pulsante, étiquette).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/vehicle/vehicleTriggerHighlight.lua:282
---@param dt number temps écoulé (s), sert à faire pulser l'alpha
function core_vehicle_vehicleTriggerHighlight.onUpdate(dt) end

--- Ajoute un trigger à la surbrillance (n'efface pas les autres).
---Source : lua/ge/extensions/core/vehicle/vehicleTriggerHighlight.lua:164
---@param vehId integer véhicule
---@param triggerId integer|string cid du trigger
---@param options table|nil {showTriggerIdAsLabel = boolean}
function core_vehicle_vehicleTriggerHighlight.setHighlightedTrigger(vehId, triggerId, options) end

--- Comme setHighlightedTrigger mais retrouve le trigger par son nom, son id jbeam ou son cid dans vdata.triggers du véhicule.
---Source : lua/ge/extensions/core/vehicle/vehicleTriggerHighlight.lua:189
---@param vehId integer véhicule
---@param triggerName string|number nom, id ou cid du trigger
---@param options table|nil {showTriggerIdAsLabel = boolean}
---@return boolean  false si le trigger est introuvable
function core_vehicle_vehicleTriggerHighlight.setHighlightedTriggerByName(vehId, triggerName, options) end

--- Remplace toutes les surbrillances par celles de la liste donnée (format de getSerialized…). Accepte aussi l'ancien format d'un seul tuple {vehId, triggerId}.
---Source : lua/ge/extensions/core/vehicle/vehicleTriggerHighlight.lua:224
---@param data table liste de {vehId, triggerId, options}
function core_vehicle_vehicleTriggerHighlight.setSerializedHighlightedTriggerData(data) end

--- Retire un trigger de la surbrillance.
---Source : lua/ge/extensions/core/vehicle/vehicleTriggerHighlight.lua:196
---@param vehId integer véhicule
---@param triggerId integer|string cid du trigger
function core_vehicle_vehicleTriggerHighlight.unhighlightTrigger(vehId, triggerId) end

