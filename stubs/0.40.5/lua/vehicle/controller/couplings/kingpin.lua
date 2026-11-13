---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/couplings/kingpin.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Contrôleur auxiliaire du pivot d'attelage (kingpin) d'une semi-remorque. Il ne fait que répondre au contrôleur `couplings/fifthwheel` d'un tracteur : si la clé de la sellette correspond à la sienne, il renvoie son cid de noeud et sa position monde. Il peut aussi afficher son noeud en debug quand la sellette demande l'affichage de l'indicateur.
--- Accès : contrôleur `couplings/kingpin` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`
---@class controller_couplings_kingpin
---@field debugDraw function|nil nil par défaut ; fonction de dessin du noeud de pivot quand l'indicateur est visible.
---@field type string "auxiliary".
local controller_couplings_kingpin = {}

--- Retrouve le noeud de pivot par nom et lit la clé.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/couplings/kingpin.lua:42
---@param jbeamData table Données jbeam du contrôleur.
function controller_couplings_kingpin.init(jbeamData) end

--- Vide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/couplings/kingpin.lua:39
---@param jbeamData table Données jbeam.
function controller_couplings_kingpin.reset(jbeamData) end

--- Appelée à distance par une sellette : si `couplerTag` est égal à la clé de ce pivot, renvoie {nodeId, nodePosition} à `kingpinDataCallback` du contrôleur de sellette du véhicule demandeur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/couplings/kingpin.lua:13
---@param objId integer Id du véhicule demandeur (tracteur).
---@param controllerName string Nom du contrôleur de sellette à rappeler.
---@param couplerTag string Clé de sellette demandée.
function controller_couplings_kingpin.sendDataToVehicle(objId, controllerName, couplerTag) end

--- Active ou retire l'affichage de debug du noeud de pivot si la clé correspond.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/couplings/kingpin.lua:31
---@param key string Clé de sellette concernée.
---@param visible boolean true pour afficher.
function controller_couplings_kingpin.setKingpinVisibility(key, visible) end

return controller_couplings_kingpin
