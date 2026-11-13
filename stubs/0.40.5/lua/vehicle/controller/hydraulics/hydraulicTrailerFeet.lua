---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/hydraulics/hydraulicTrailerFeet.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Contrôleur auxiliaire pour les béquilles hydrauliques d'une remorque (type "auxiliary"). Il mémorise la position du vérin quand la remorque est attelée et détachée (par réglage manuel) et ramène automatiquement les béquilles à la bonne position lors d'un attelage ou dételage, en écrivant la direction de vérin dans electrics (directionElectricsName du vérin).
--- Accès : contrôleur `hydraulics/hydraulicTrailerFeet` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`
---@class controller_hydraulics_hydraulicTrailerFeet
---@field type string "auxiliary".
local controller_hydraulics_hydraulicTrailerFeet = {}

--- Renvoie l'état (positions mémorisées, entrée manuelle, état d'attelage).
---Source : lua/vehicle/controller/hydraulics/hydraulicTrailerFeet.lua:95
---@return table  Table d'état (réutilisée).
function controller_hydraulics_hydraulicTrailerFeet.getState() end

--- Retrouve le vérin et initialise les positions et états.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/hydraulics/hydraulicTrailerFeet.lua:73
---@param jbeamData table Données jbeam du contrôleur.
function controller_hydraulics_hydraulicTrailerFeet.init(jbeamData) end

--- Commande manuelle des béquilles : -1 à 1 (la direction est écrite dans electrics). Interrompt un déplacement automatique en cours.
---Source : lua/vehicle/controller/hydraulics/hydraulicTrailerFeet.lua:27
---@param input number Entrée de direction -1..1.
function controller_hydraulics_hydraulicTrailerFeet.moveFeet(input) end

--- Hook appelé par le moteur quand un coupleur du véhicule s'attache ; lance le mouvement vers la position « attaché » si l'autre objet est un autre véhicule.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/hydraulics/hydraulicTrailerFeet.lua:61
---@param nodeId integer Nœud de ce véhicule.
---@param obj2id integer Id du véhicule partenaire.
---@param obj2nodeId integer Nœud du partenaire.
function controller_hydraulics_hydraulicTrailerFeet.onCouplerAttached(nodeId, obj2id, obj2nodeId) end

--- Hook appelé quand un coupleur se détache ; lance le mouvement vers la position « détaché ».
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/hydraulics/hydraulicTrailerFeet.lua:67
---@param nodeId integer Nœud de ce véhicule.
---@param obj2id integer Id du véhicule partenaire.
---@param obj2nodeId integer Nœud du partenaire.
---@param breakForce number Force de rupture (non utilisée).
function controller_hydraulics_hydraulicTrailerFeet.onCouplerDetached(nodeId, obj2id, obj2nodeId, breakForce) end

--- Restaure l'état renvoyé par getState.
---Source : lua/vehicle/controller/hydraulics/hydraulicTrailerFeet.lua:103
---@param data table|nil Table d'état.
function controller_hydraulics_hydraulicTrailerFeet.setState(data) end

--- Écrit la direction du vérin (manuelle ou automatique vers la position mémorisée).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/hydraulics/hydraulicTrailerFeet.lua:36
---@param dt number Pas de temps (s).
function controller_hydraulics_hydraulicTrailerFeet.updateGFX(dt) end

return controller_hydraulics_hydraulicTrailerFeet
