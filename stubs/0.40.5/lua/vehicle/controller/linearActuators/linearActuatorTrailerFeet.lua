---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/linearActuators/linearActuatorTrailerFeet.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Contrôleur auxiliaire pour les béquilles d'une remorque à actionneur linéaire électrique (type "auxiliary"). Même logique que hydraulics/hydraulicTrailerFeet : il mémorise les positions du vérin à l'état attelé et détaché et ramène les béquilles automatiquement à l'attelage ou au dételage, en écrivant la commande du moteur dans electrics. La différence : l'actionneur est un dispositif powertrain et on peut filtrer sur un nœud de coupleur précis.
--- Accès : contrôleur `linearActuators/linearActuatorTrailerFeet` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`
---@class controller_linearActuators_linearActuatorTrailerFeet
---@field type string "auxiliary".
local controller_linearActuators_linearActuatorTrailerFeet = {}

--- Renvoie l'état (positions, entrée manuelle, état d'attelage).
---Source : lua/vehicle/controller/linearActuators/linearActuatorTrailerFeet.lua:110
---@return table  Table d'état (réutilisée).
function controller_linearActuators_linearActuatorTrailerFeet.getState() end

--- Retrouve l'actionneur et le nom electrics de commande, initialise positions et états.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/linearActuators/linearActuatorTrailerFeet.lua:74
---@param jbeamData table Données jbeam du contrôleur.
function controller_linearActuators_linearActuatorTrailerFeet.init(jbeamData) end

--- Commande manuelle des béquilles, -1 à 1 ; interrompt un mouvement automatique.
---Source : lua/vehicle/controller/linearActuators/linearActuatorTrailerFeet.lua:28
---@param input number Entrée de direction -1..1.
function controller_linearActuators_linearActuatorTrailerFeet.moveFeet(input) end

--- Hook appelé par le moteur à l'attelage ; lance le mouvement vers la position « attaché ».
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/linearActuators/linearActuatorTrailerFeet.lua:62
---@param nodeId integer Nœud de ce véhicule.
---@param obj2id integer Id du véhicule partenaire.
---@param obj2nodeId integer Nœud du partenaire.
function controller_linearActuators_linearActuatorTrailerFeet.onCouplerAttached(nodeId, obj2id, obj2nodeId) end

--- Hook appelé au dételage ; lance le mouvement vers la position « détaché ».
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/linearActuators/linearActuatorTrailerFeet.lua:68
---@param nodeId integer Nœud de ce véhicule.
---@param obj2id integer Id du véhicule partenaire.
---@param obj2nodeId integer Nœud du partenaire.
---@param breakForce number Force de rupture (non utilisée).
function controller_linearActuators_linearActuatorTrailerFeet.onCouplerDetached(nodeId, obj2id, obj2nodeId, breakForce) end

--- Restaure l'état renvoyé par getState.
---Source : lua/vehicle/controller/linearActuators/linearActuatorTrailerFeet.lua:118
---@param data table|nil Table d'état.
function controller_linearActuators_linearActuatorTrailerFeet.setState(data) end

--- Écrit la commande moteur (manuelle ou automatique vers la position mémorisée).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/linearActuators/linearActuatorTrailerFeet.lua:37
---@param dt number Pas de temps (s).
function controller_linearActuators_linearActuatorTrailerFeet.updateGFX(dt) end

return controller_linearActuators_linearActuatorTrailerFeet
