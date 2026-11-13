---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/couplings/containerLockLead.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Côté « leader » du système de verrouillage de conteneurs (twist-locks) : placé sur le véhicule qui porte les verrous (grue, portique, châssis porte-conteneur). Pour chaque site, un coupleur « tâteur » (feeler) cherche un conteneur, puis le leader interroge le contrôleur `containerLockFollow` du conteneur pour obtenir la position du verrou cible, calcule une force d'alignement dans un cône (appliquée aux deux véhicules) et, quand l'alignement vertical est suffisant, active le coupleur de verrou (lock). Gère les états feeling, locking, locked, la stabilité du verrouillage et les electrics de visibilité des props.
--- Accès : contrôleur `couplings/containerLockLead` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`
---@class controller_couplings_containerLockLead
---@field type string "auxiliary".
local controller_couplings_containerLockLead = {}

--- Hook de rupture de poutre, vide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/couplings/containerLockLead.lua:388
---@param id integer cid de la poutre.
---@param energy number Énergie de rupture.
function controller_couplings_containerLockLead.beamBroken(id, energy) end

--- Lit les paramètres communs et les sites depuis le jbeam, résout les noeuds par nom, crée les tables de recherche et initialise les electrics.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/couplings/containerLockLead.lua:513
---@param jbeamData table Données jbeam du contrôleur.
function controller_couplings_containerLockLead.init(jbeamData) end

--- Vide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/couplings/containerLockLead.lua:510
---@param jbeamData table Non utilisé.
function controller_couplings_containerLockLead.initSounds(jbeamData) end

--- Rappel venant du suiveur : enregistre la dernière position connue du verrou précédemment relâché, pour détecter que le leader s'en est éloigné.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/couplings/containerLockLead.lua:48
---@param lockCouplerNodeId integer cid du noeud verrou du suiveur.
---@param lastLockCouplerPosition vec3 Position monde.
function controller_couplings_containerLockLead.lastLockCouplerPositionCallback(lockCouplerNodeId, lastLockCouplerPosition) end

--- Rappel venant du suiveur : enregistre la position monde du verrou du suiveur et si un prop visuel est requis.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/couplings/containerLockLead.lua:65
---@param lockSiteId integer Id du site (cid du noeud tâteur côté suiveur).
---@param lockCouplerPosition vec3 Position monde du verrou du suiveur.
---@param needsVisualLockProp boolean true si le prop visuel de verrou est nécessaire.
function controller_couplings_containerLockLead.lockSitePositionCallback(lockSiteId, lockCouplerPosition, needsVisualLockProp) end

--- Hook : si le noeud est un tâteur, mémorise le véhicule suiveur et l'id du site, efface l'alignement ; si c'est un verrou, passe le site à locked et supprime la force d'alignement du suiveur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/couplings/containerLockLead.lua:394
---@param nodeId integer cid du noeud local.
---@param obj2id integer Id de l'autre véhicule.
---@param obj2nodeId integer cid du noeud de l'autre véhicule.
function controller_couplings_containerLockLead.onCouplerAttached(nodeId, obj2id, obj2nodeId) end

--- Hook : oublie le suiveur pour un tâteur ; pour un verrou, mémorise la cible précédente si le détachement est normal et le verrou stable (sinon l'efface) et remet le site en feeling.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/couplings/containerLockLead.lua:427
---@param nodeId integer cid du noeud local.
---@param obj2id integer Id de l'autre véhicule.
---@param obj2nodeId integer cid du noeud de l'autre véhicule.
---@param breakForce number Force de rupture (> 0 si le verrou a cassé).
function controller_couplings_containerLockLead.onCouplerDetached(nodeId, obj2id, obj2nodeId, breakForce) end

--- Hook de coupleur trouvé, vide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/couplings/containerLockLead.lua:391
---@param nodeId integer cid du noeud local.
---@param obj2id integer Id de l'autre véhicule.
---@param obj2nodeId integer cid du noeud de l'autre véhicule.
function controller_couplings_containerLockLead.onCouplerFound(nodeId, obj2id, obj2nodeId) end

--- Remet tous les sites en feeling avec des valeurs neutres et les electrics à 0.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/couplings/containerLockLead.lua:482
---@param jbeamData table Données jbeam.
function controller_couplings_containerLockLead.reset(jbeamData) end

--- Ramène tous les sites en feeling (ce qui déverrouille s'ils sont verrouillés). Quand rien n'est verrouillé, efface aussi la mémoire de dernière cible pour permettre de reverrouiller la même.
---Source : lua/vehicle/controller/couplings/containerLockLead.lua:464
function controller_couplings_containerLockLead.toggleLockState() end

--- Chaque frame : fait tourner la recherche de tâteurs inactifs (10 Hz), interroge les suiveurs, calcule et applique la force d'alignement, fait passer les sites de feeling à locking, met à jour la stabilité du verrou et les electrics, et envoie les données de debug.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/couplings/containerLockLead.lua:231
---@param dt number Pas de temps en secondes.
function controller_couplings_containerLockLead.updateGFX(dt) end

return controller_couplings_containerLockLead
