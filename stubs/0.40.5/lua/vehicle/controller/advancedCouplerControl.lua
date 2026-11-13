---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/advancedCouplerControl.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Contrôleur auxiliaire qui pilote un groupe de verrous locaux (portes, trappes, hayons, loquets) formés de paires de noeuds du même véhicule, via `obj:attachLocalCoupler`. Il suit l'état du groupe (attached, coupling, autoCoupling, detached, broken, desyncedAttached, desyncedDetached), joue les sons d'attache/détache, applique une force d'ouverture ou de fermeture pendant une courte durée, enregistre les groupes de casse des coupleurs auprès de `beamstate`, et publie deux electrics `<nom>_attached` et `<nom>_notAttached` (1/0). On l'instancie une fois par groupe, avec un `name` unique.
--- Accès : contrôleur `advancedCouplerControl` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`
---@class controller_advancedCouplerControl
---@field type string "auxiliary".
local controller_advancedCouplerControl = {}

--- Détache toutes les paires du groupe, déclenche la force d'ouverture si toutes les `openForceConditions` (états requis d'autres groupes) sont remplies et affiche `detachUIMessage`. Ne fait rien si le groupe est déjà détaché ou en autoCoupling.
---Source : lua/vehicle/controller/advancedCouplerControl.lua:175
function controller_advancedCouplerControl.detachGroup() end

--- Renvoie l'état du groupe.
---Source : lua/vehicle/controller/advancedCouplerControl.lua:377
---@return string  "attached", "coupling", "autoCoupling", "detached", "broken", "desyncedAttached" ou "desyncedDetached".
function controller_advancedCouplerControl.getGroupState() end

--- Renvoie l'état du groupe sous la clé `<nom>_groupState`.
---Source : lua/vehicle/controller/advancedCouplerControl.lua:512
---@return table<string, string>  Table d'état.
function controller_advancedCouplerControl.getState() end

--- Construit le groupe à partir du jbeam (paires de noeuds, sons, forces, messages), enregistre les groupes de casse de coupleurs, lance les attaches initiales et synchronise l'état.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/advancedCouplerControl.lua:412
---@param jbeamData table Données jbeam du groupe.
function controller_advancedCouplerControl.init(jbeamData) end

--- Vide ; présent pour le cycle de vie.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/advancedCouplerControl.lua:409
---@param jbeamData table Non utilisé.
function controller_advancedCouplerControl.initSounds(jbeamData) end

--- Hook : une paire du groupe s'est attachée. Met à jour l'état, joue le son d'attache (volume lié à la force) et annule les forces en cours quand tout le groupe est attaché.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/advancedCouplerControl.lua:331
---@param nodeId integer cid du noeud local.
---@param obj2id integer Id de l'autre véhicule.
---@param obj2nodeId integer cid du noeud de l'autre côté.
---@param attachForce number Reçoit en pratique l'argument `attachSpeed` de controller.lua (déduit du code) ; sert à l'agressivité du son.
function controller_advancedCouplerControl.onCouplerAttached(nodeId, obj2id, obj2nodeId, attachForce) end

--- Hook : une paire du groupe s'est détachée. État `detached` si breakForce <= 0, sinon `broken` ; remet en file le verrou automatique et joue le son de détache.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/advancedCouplerControl.lua:357
---@param nodeId integer cid du noeud local.
---@param obj2id integer Id de l'autre véhicule.
---@param obj2nodeId integer cid du noeud de l'autre côté.
---@param breakForce number Force de rupture (0 = détachement normal).
function controller_advancedCouplerControl.onCouplerDetached(nodeId, obj2id, obj2nodeId, breakForce) end

--- Hook de controller.lua quand un coupleur proche est trouvé ; vide ici.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/advancedCouplerControl.lua:323
---@param nodeId integer cid du noeud local.
---@param obj2id integer Id de l'autre véhicule.
---@param obj2nodeId integer cid du noeud de l'autre véhicule.
function controller_advancedCouplerControl.onCouplerFound(nodeId, obj2id, obj2nodeId) end

--- Hook d'évènement de gameplay, vide dans ce contrôleur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/advancedCouplerControl.lua:374
---@param eventName string Nom de l'évènement.
---@param ... any Arguments de l'évènement.
function controller_advancedCouplerControl.onGameplayEvent(eventName, ...) end

--- Remet tous les verrous à l'état détaché, relance les attaches initiales (`couplingStartRadius`) et ré-enregistre les groupes de casse.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/advancedCouplerControl.lua:390
---@param jbeamData table Données jbeam.
function controller_advancedCouplerControl.reset(jbeamData) end

--- Vide ; présent pour le cycle de vie.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/advancedCouplerControl.lua:387
---@param jbeamData table Non utilisé.
function controller_advancedCouplerControl.resetSounds(jbeamData) end

--- Tente de reproduire un état sauvegardé (attache, détache ou rupture de toutes les paires).
---Source : lua/vehicle/controller/advancedCouplerControl.lua:517
---@param data table|nil Table contenant `<nom>_groupState`.
function controller_advancedCouplerControl.setState(data) end

--- Ouvre ou ferme le groupe selon son état. Ignoré tant qu'une force d'ouverture ou de fermeture est en cours.
---Source : lua/vehicle/controller/advancedCouplerControl.lua:211
function controller_advancedCouplerControl.toggleGroup() end

--- Comme toggleGroup, mais d'abord vérifie des conditions sur d'autres contrôleurs advancedCouplerControl ; si l'un est dans l'état interdit, affiche le message d'erreur et ne fait rien.
---Source : lua/vehicle/controller/advancedCouplerControl.lua:223
---@param conditions table[] Liste de {nomContrôleur, étatInterdit, messageErreur?}.
function controller_advancedCouplerControl.toggleGroupConditional(conditions) end

--- Tente de refermer le groupe : selon groupType, relance les attaches locales des paires détachées, déclenche le message `attachingUIMessage` et une force de fermeture de `closeForceDuration`. Sans effet si le groupe est déjà attaché.
---Source : lua/vehicle/controller/advancedCouplerControl.lua:144
function controller_advancedCouplerControl.tryAttachGroupImpulse() end

--- Chaque frame : gère le délai des sons, les déclencheurs electrics de verrouillage/déverrouillage, les verrous automatiques en attente, la recherche du noeud cid2 le plus proche en mode multipoint, et applique les forces d'ouverture/fermeture.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/advancedCouplerControl.lua:254
---@param dt number Pas de temps en secondes.
function controller_advancedCouplerControl.updateGFX(dt) end

return controller_advancedCouplerControl
