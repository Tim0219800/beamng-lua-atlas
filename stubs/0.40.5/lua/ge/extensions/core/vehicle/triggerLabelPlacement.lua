---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/vehicle/triggerLabelPlacement.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Extension GE `core_vehicle_triggerLabelPlacement` : calcule où placer l'étiquette d'UI d'un trigger de véhicule (zones d'interaction jbeam) autour de sa boîte projetée à l'écran. Reconstruit la base (axes) du trigger à partir des noeuds idRef/idX/idY et de ses rotations (en reproduisant la séquence du code C++), en déduit les demi-dimensions, projette les 8 coins à l'écran et choisit le côté (droite, gauche, haut, bas) avec le plus de place. Fonctions utilitaires sans état persistant, utilisées par les outils d'UI/debug des triggers et par core_vehicle_vehicleTriggerHighlight.
--- Accès : extension `core_vehicle_triggerLabelPlacement` : `extensions.load("core_vehicle_triggerLabelPlacement")`, puis la globale `core_vehicle_triggerLabelPlacement`
---@class core_vehicle_triggerLabelPlacement
core_vehicle_triggerLabelPlacement = {}

--- Calcule le placement de l'étiquette d'un trigger : projette la boîte du trigger à l'écran et choisit le côté de l'étiquette avec sa position (labelX, labelY en fraction d'écran) et décalages CSS (labelTx, labelTy, avec 0.6em de marge).
---Source : lua/ge/extensions/core/vehicle/triggerLabelPlacement.lua:282
---@param vehicleObj userdata véhicule portant le trigger
---@param triggerObj userdata|nil objet trigger (méthode getCenter) ; inutile si centerWorld est fourni
---@param triggerData table données jbeam du trigger (idRef, idX, idY, size, baseRotation, rotation…)
---@param worldToScreenPercent01 function|nil fonction(posMonde, sortie) -> {x, y} en fractions d'écran
---@param p table|nil profileur optionnel (méthode add) pour mesurer les étapes
---@param centerWorld vec3|nil centre du trigger en repère monde (sinon triggerObj:getCenter())
---@param centerScreen table|nil centre à l'écran, déjà calculé (sinon calculé via worldToScreenPercent01)
---@return table|nil  {labelX, labelY, labelTx, labelTy, labelSide ('right'|'left'|'top'|'bottom'), bounds = {minX, maxX, minY, maxY, centerX, centerY}} ; nil si la projection est impossible
function core_vehicle_triggerLabelPlacement.computeForTrigger(vehicleObj, triggerObj, triggerData, worldToScreenPercent01, p, centerWorld, centerScreen) end

--- Renvoie la base orthonormée du trigger et ses demi-dimensions, partagées avec les dessins debug/surbrillance pour rester cohérentes avec le placement.
---Source : lua/ge/extensions/core/vehicle/triggerLabelPlacement.lua:352
---@param vehicleObj userdata véhicule portant le trigger
---@param triggerData table données du trigger
---@return vec3  axe X
---@return vec3  axe Y
---@return vec3  axe Z
---@return number  demi-dimension X
---@return number  demi-dimension Y
---@return number  demi-dimension Z
function core_vehicle_triggerLabelPlacement.computeTriggerBasisAndHalfExtents(vehicleObj, triggerData) end

