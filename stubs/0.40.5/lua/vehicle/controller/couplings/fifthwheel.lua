---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/couplings/fifthwheel.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Contrôleur auxiliaire de sellette d'attelage (fifth wheel) du tracteur : il cherche, parmi les véhicules en collision, les pivots (kingpin) compatibles en demandant leurs données au contrôleur `couplings/kingpin` de la remorque, calcule les distances, et attache un coupleur externe (`obj:attachExternalCoupler`) quand un pivot passe à moins de 80 % du rayon du coupleur. Il suit l'état attached, attaching, detaching, detached, joue des sons et publie un electrics d'attache.
--- Accès : contrôleur `couplings/fifthwheel` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`
---@class controller_couplings_fifthwheel
---@field debugDraw function|nil nil par défaut ; devient la fonction de dessin du noeud de sellette quand l'indicateur est visible.
---@field type string "auxiliary".
local controller_couplings_fifthwheel = {}

--- Détache le coupleur de la sellette (obj:detachCoupler). Appelée par l'entrée du menu radial.
---Source : lua/vehicle/controller/couplings/fifthwheel.lua:64
function controller_couplings_fifthwheel.detachFifthwheel() end

--- Retrouve le noeud de sellette, lit les paramètres du coupleur sur ce noeud, initialise l'état et ajoute l'entrée du menu radial de détachement (une seule fois).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/couplings/fifthwheel.lua:233
---@param jbeamData table Données jbeam du contrôleur.
function controller_couplings_fifthwheel.init(jbeamData) end

--- Lit les événements et volumes de sons d'attache et de détache.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/couplings/fifthwheel.lua:226
---@param jbeamData table Données jbeam du contrôleur.
function controller_couplings_fifthwheel.initSounds(jbeamData) end

--- Indique si la sellette est attachée à un pivot.
---Source : lua/vehicle/controller/couplings/fifthwheel.lua:202
---@return boolean  true si l'état est attached.
function controller_couplings_fifthwheel.isAttached() end

--- Rappel venant du contrôleur kingpin d'une remorque : calcule la distance entre la sellette et le pivot et la met en cache.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/couplings/fifthwheel.lua:75
---@param obj2Id integer Id du véhicule remorque.
---@param data table {nodeId = cid du pivot, nodePosition = position monde}.
function controller_couplings_fifthwheel.kingpinDataCallback(obj2Id, data) end

--- Hook : pour le noeud de sellette, passe à attached, mémorise le pivot, joue le son d'attache et prévient l'extension couplings. Masque l'indicateur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/couplings/fifthwheel.lua:171
---@param nodeId integer cid du noeud local.
---@param obj2id integer Id du véhicule remorque.
---@param obj2nodeId integer cid du pivot.
---@param attachForce number Reçoit en pratique `attachSpeed` de controller.lua (déduit du code) ; sert à l'agressivité du son.
function controller_couplings_fifthwheel.onCouplerAttached(nodeId, obj2id, obj2nodeId, attachForce) end

--- Hook : pour le noeud de sellette, passe à detaching, mémorise le pivot quitté, joue le son de détache et prévient l'extension couplings.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/couplings/fifthwheel.lua:187
---@param nodeId integer cid du noeud local.
---@param obj2id integer Id du véhicule remorque.
---@param obj2nodeId integer cid du pivot.
---@param breakForce number Force de rupture (non utilisée).
function controller_couplings_fifthwheel.onCouplerDetached(nodeId, obj2id, obj2nodeId, breakForce) end

--- Hook de coupleur trouvé, vide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/couplings/fifthwheel.lua:167
---@param nodeId integer cid du noeud local.
---@param obj2id integer Id de l'autre véhicule.
---@param obj2nodeId integer cid du noeud de l'autre véhicule.
function controller_couplings_fifthwheel.onCouplerFound(nodeId, obj2id, obj2nodeId) end

--- Remet l'état à detached et vide les caches de pivots.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/couplings/fifthwheel.lua:212
---@param jbeamData table Données jbeam.
function controller_couplings_fifthwheel.reset(jbeamData) end

--- Affiche ou masque l'indicateur de debug de la sellette ici et sur les pivots de tous les véhicules (par clé).
---Source : lua/vehicle/controller/couplings/fifthwheel.lua:53
---@param visible boolean true pour afficher.
function controller_couplings_fifthwheel.setFifthwheelIndicatorVisibility(visible) end

--- Inverse la visibilité de l'indicateur.
---Source : lua/vehicle/controller/couplings/fifthwheel.lua:60
function controller_couplings_fifthwheel.toggleFifthwheelIndicatorVisibility() end

--- Chaque frame : met à jour les collisions et les délais de requêtes, interroge les pivots proches, gère la sortie de l'état detaching, déclenche l'attache externe vers le pivot le plus proche et publie l'electrics.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/couplings/fifthwheel.lua:95
---@param dt number Pas de temps en secondes.
function controller_couplings_fifthwheel.updateGFX(dt) end

return controller_couplings_fifthwheel
