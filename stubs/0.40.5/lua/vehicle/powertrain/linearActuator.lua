---@meta
-- tim19Atlas stub generated from lua/vehicle/powertrain/linearActuator.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Composant powertrain `linearActuator` : vérin à vis (actionneur linéaire mécanique) entraîné par un arbre. Il transforme le couple d'entrée en force axiale sur des poutres (obj:screwBeam) repérées par les tags `beamTags` et mesure la vitesse d'extension, qu'il renvoie à son parent comme vitesse de rotation (vitesse / pas de vis). Catégorie `torqueConsumer`, sans port de sortie. Utile pour benne, plateforme ou vérin électrique. Il suit l'extension (`currentExtend`, `currentExtendPercent`).
--- Accès : type de composant powertrain `linearActuator` (jbeam `powertrain`), accessible par `powertrain.getDevice("nom")`
---@class powertrain_linearActuator
---@field deviceCategories table<string, boolean> {torqueConsumer=true}.
---@field outputPorts table Table vide : aucun port de sortie.
local powertrain_linearActuator = {}

--- Construit le vérin à vis : géométrie de la vis (diamètre, pas, angle d'hélice), limites d'extension, vitesse limite et liste des poutres motrices à partir des tags beamTags.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/linearActuator.lua:128
---@param jbeamData table Données jbeam du composant (leadMillimeterPerRevolution obligatoire).
---@return table  Le device (classe `device`).
function powertrain_linearActuator.new(jbeamData) end

--- Objet renvoyé par new(jbeamData).
---@class powertrain_linearActuator_device
local powertrain_linearActuator_device = {}

--- Augmente le coefficient de frottement de dégâts (0.01 de dégât = +0.1).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/linearActuator.lua:52
---@param damageAmount number Quantité de dégâts du groupe de déformation.
function powertrain_linearActuator_device:applyDeformGroupDamage(damageAmount) end

--- Inertie purement virtuelle : cumulativeInertia = virtualInertia / gearRatio² ; rapports cumulés = gearRatio.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/linearActuator.lua:90
function powertrain_linearActuator_device:calculateInertia() end

--- Renvoie l'intégrité 0..1 (0 si cassé) et {damageFrictionCoef, isBroken}.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/linearActuator.lua:71
---@return number  Intégrité 0..1.
---@return table  État sauvegardable.
function powertrain_linearActuator_device:getPartCondition() end

--- Marque le vérin comme cassé (isBroken = true) et réselectionne les mises à jour (sans effet réel).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/linearActuator.lua:84
function powertrain_linearActuator_device:onBreak() end

--- Remet à zéro vitesses, extension, coefficients d'usure/dégâts et isBroken ; relit gearRatio et friction.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/linearActuator.lua:103
---@param jbeamData table Données jbeam du composant.
---@return table  Le device.
function powertrain_linearActuator_device:reset(jbeamData) end

--- Applique usure (coefficient de 1 à 1.5) et dégâts selon l'odomètre et l'intégrité ; appelle onBreak si isBroken.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/linearActuator.lua:56
---@param subSystem any Non utilisé.
---@param odometer number Distance parcourue en mètres.
---@param integrity number|table Nombre 0..1 ou table {damageFrictionCoef, isBroken}.
---@param visual any Non utilisé.
function powertrain_linearActuator_device:setPartCondition(subSystem, odometer, integrity, visual) end

--- Appelée à chaque pas physique : calcule la force de vis depuis le couple parent (moins frottements), l'applique à chaque poutre par obj:screwBeam avec minExtend/maxExtend/speedLimit, puis met à jour velocity, currentExtend et currentExtendPercent.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/linearActuator.lua:21
function powertrain_linearActuator_device:torqueUpdate() end

--- Appelée après construction du powertrain ; renvoie toujours true.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/linearActuator.lua:80
---@return boolean  true.
function powertrain_linearActuator_device:validate() end

--- Appelée à chaque pas physique : inputAV = velocity * invLeadRadian * gearRatio, écrit dans le parent ; outputAV1 = 0.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/linearActuator.lua:14
---@param dt number Pas de temps en secondes (inutilisé).
function powertrain_linearActuator_device:velocityUpdate(dt) end

return powertrain_linearActuator
