---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/trailerFeet.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Contrôleur auxiliaire pour les béquilles de remorque : écrit un electric (« feet » par défaut) à une valeur « attachée » quand un coupleur de ce véhicule s'accroche à un AUTRE véhicule et à une valeur « détachée » quand il s'en détache. L'electric sert à animer/rétracter les béquilles.
--- Accès : contrôleur `trailerFeet` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`
---@class controller_trailerFeet
---@field type string "auxiliary".
local controller_trailerFeet = {}

--- Lit la configuration et initialise l'electric à startValue.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/trailerFeet.lua:26
---@param jbeamData table Données jbeam.
function controller_trailerFeet.init(jbeamData) end

--- Hook appelé par le moteur quand un coupleur s'accroche ; si l'autre objet est un autre véhicule, passe l'electric à attachedValue.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/trailerFeet.lua:14
---@param nodeId integer Nœud coupleur de ce véhicule.
---@param obj2id integer Id de l'autre véhicule.
---@param obj2nodeId integer Nœud de l'autre véhicule.
function controller_trailerFeet.onCouplerAttached(nodeId, obj2id, obj2nodeId) end

--- Hook appelé quand un coupleur se détache ; si l'autre objet est un autre véhicule, passe l'electric à detachedValue.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/trailerFeet.lua:20
---@param nodeId integer Nœud coupleur de ce véhicule.
---@param obj2id integer Id de l'autre véhicule.
---@param obj2nodeId integer Nœud de l'autre véhicule.
---@param breakForce number Force de rupture (non utilisée).
function controller_trailerFeet.onCouplerDetached(nodeId, obj2id, obj2nodeId, breakForce) end

return controller_trailerFeet
