---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/couplings/containerLockFollow.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Côté « suiveur » du système de verrouillage de conteneurs (twist-locks) : placé sur le véhicule qui reçoit (par exemple le conteneur), il répond au contrôleur `containerLockLead` d'un autre véhicule. Il fournit la position de ses sites de verrouillage, reçoit une force d'alignement du leader, active ou désactive ses coupleurs selon un electrics, et durcit ou assouplit les poutres de verrouillage quand tous les sites sont verrouillés. Les échanges entre véhicules passent par `obj:queueObjectLuaCommand` vers `controller.getControllersByType('couplings/containerLockFollow')`.
--- Accès : contrôleur `couplings/containerLockFollow` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`
---@class controller_couplings_containerLockFollow
---@field type string "auxiliary".
local controller_couplings_containerLockFollow = {}

--- Appelée à distance par le leader : mémorise la force d'alignement à appliquer au noeud d'alignement du site (ignorée si le noeud verrou est déjà couplé).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/couplings/containerLockFollow.lua:51
---@param lockSiteId integer Id du site.
---@param forceVector vec3|nil Vecteur de force (N), nil pour l'annuler.
function controller_couplings_containerLockFollow.applyAligningForce(lockSiteId, forceVector) end

--- Hook de rupture de poutre, vide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/couplings/containerLockFollow.lua:133
---@param id integer cid de la poutre.
---@param energy number Énergie de rupture.
function controller_couplings_containerLockFollow.beamBroken(id, energy) end

--- Construit les sites de verrouillage depuis le jbeam (noeuds, tags, poutres de verrou, electrics) et assouplit les poutres de verrou.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/couplings/containerLockFollow.lua:167
---@param jbeamData table Données jbeam du contrôleur.
function controller_couplings_containerLockFollow.init(jbeamData) end

--- Hook : si le noeud est un noeud verrou, passe le site à l'état locked, efface la force d'alignement et durcit les poutres de verrou.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/couplings/containerLockFollow.lua:136
---@param nodeId integer cid du noeud local.
---@param obj2id integer Id de l'autre véhicule.
---@param obj2nodeId integer cid du noeud de l'autre véhicule.
function controller_couplings_containerLockFollow.onCouplerAttached(nodeId, obj2id, obj2nodeId) end

--- Hook : efface la force d'alignement du site et, pour un noeud verrou, repasse le site à unlocked.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/couplings/containerLockFollow.lua:146
---@param nodeId integer cid du noeud local.
---@param obj2id integer Id de l'autre véhicule.
---@param obj2nodeId integer cid du noeud de l'autre véhicule.
---@param breakForce number Force de rupture (non utilisée).
function controller_couplings_containerLockFollow.onCouplerDetached(nodeId, obj2id, obj2nodeId, breakForce) end

--- Appelée à distance par le leader : renvoie la position monde du noeud verrou du site dont le noeud verrou a l'id donné, via lastLockCouplerPositionCallback du leader.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/couplings/containerLockFollow.lua:21
---@param objId integer Id du véhicule leader à rappeler.
---@param controllerName string Nom du contrôleur leader.
---@param lockCouplerNodeId integer cid du noeud verrou de ce véhicule.
function controller_couplings_containerLockFollow.requestFollowLastLockCouplerPosition(objId, controllerName, lockCouplerNodeId) end

--- Appelée à distance par le leader : renvoie la position monde du noeud verrou d'un site (et `needsVisualLockProp`) via lockSitePositionCallback du leader.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/couplings/containerLockFollow.lua:36
---@param objId integer Id du véhicule leader à rappeler.
---@param controllerName string Nom du contrôleur leader.
---@param lockSiteId integer Id du site (cid du noeud tâteur).
function controller_couplings_containerLockFollow.requestFollowLockCouplerPosition(objId, controllerName, lockSiteId) end

--- Efface les forces d'alignement, force la réévaluation de l'activation et remet les electrics de verrouillage à 0.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/couplings/containerLockFollow.lua:159
---@param jbeamData table Données jbeam.
function controller_couplings_containerLockFollow.reset(jbeamData) end

--- Chaque frame : applique la force d'alignement, active ou désactive chaque site selon son electrics, publie l'état verrouillé et ajuste la raideur des poutres de verrou (verrouillées seulement si tous les sites le sont).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/couplings/containerLockFollow.lua:93
---@param dt number Pas de temps en secondes.
function controller_couplings_containerLockFollow.updateGFX(dt) end

return controller_couplings_containerLockFollow
