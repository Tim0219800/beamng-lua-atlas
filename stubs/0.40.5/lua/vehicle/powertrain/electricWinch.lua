---@meta
-- tim19Atlas stub generated from lua/vehicle/powertrain/electricWinch.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Composant powertrain `electricWinch` : treuil électrique très sommaire, de catégorie `winch` et `torqueConsumer`, sans port de sortie. Son code est un prototype : à chaque pas physique il tire sur la poutre étiquetée `ropeTest` avec une force fixe de 500000 N multipliée par le niveau d'allumage, sans paramètre jbeam de réglage. Un moddeur ne s'en sert pas en pratique ; voir hydraulicWinch (vide) et linearActuator pour des actionneurs réels.
--- Accès : type de composant powertrain `electricWinch` (jbeam `powertrain`), accessible par `powertrain.getDevice("nom")`
---@class powertrain_electricWinch
---@field deviceCategories table<string, boolean> {winch=true, torqueConsumer=true}.
---@field outputPorts table Table vide : aucun port de sortie.
local powertrain_electricWinch = {}

--- Construit le device treuil avec les champs standard (gearRatio, friction, coefficients d'usure/dégâts, inertie) et les fonctions de mise à jour. Il n'appelle pas selectUpdates : velocityUpdate et torqueUpdate sont posées directement.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/electricWinch.lua:77
---@param jbeamData table Données jbeam du composant.
---@return table  Le device (classe `device`).
function powertrain_electricWinch.new(jbeamData) end

--- Objet renvoyé par new(jbeamData).
---@class powertrain_electricWinch_device
local powertrain_electricWinch_device = {}

--- Augmente le coefficient de frottement de dégâts (0.01 de dégât = +0.1).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/electricWinch.lua:24
---@param damageAmount number Quantité de dégâts du groupe de déformation.
function powertrain_electricWinch_device:applyDeformGroupDamage(damageAmount) end

--- Pose cumulativeInertia = 0 (inertie de sortie nulle) et les rapports cumulés (maxCumulativeGearRatio reste nil, voir notes).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/electricWinch.lua:52
function powertrain_electricWinch_device:calculateInertia() end

--- Renvoie l'intégrité 0..1 (0 si cassé) et la table {damageFrictionCoef, isBroken}.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/electricWinch.lua:43
---@return number  Intégrité 0..1.
---@return table  État sauvegardable.
function powertrain_electricWinch_device:getPartCondition() end

--- Remet à zéro vitesses, couple, inertie cumulée, coefficients d'usure/dégâts et isBroken ; relit friction.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/electricWinch.lua:61
---@param jbeamData table Données jbeam du composant.
function powertrain_electricWinch_device:reset(jbeamData) end

--- Applique usure et dégâts selon l'odomètre et l'intégrité ; appelle onBreak si l'état indique isBroken, mais ce device ne définit pas onBreak.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/electricWinch.lua:28
---@param subSystem any Non utilisé.
---@param odometer number Distance parcourue en mètres.
---@param integrity number|table Nombre 0..1 ou table {damageFrictionCoef, isBroken}.
---@param visual any Non utilisé.
function powertrain_electricWinch_device:setPartCondition(subSystem, odometer, integrity, visual) end

--- Appelée à chaque pas physique : met outputTorque1 à 0 et actionne la première poutre étiquetée 'ropeTest' avec une force de -ignitionLevel * 500000 N, vitesse limite 10 et course 0 à 100.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/electricWinch.lua:15
function powertrain_electricWinch_device:torqueUpdate() end

--- Appelée à chaque pas physique : inputAV = outputAV1 * gearRatio, écrit dans le parent.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/electricWinch.lua:10
---@param dt number Pas de temps en secondes (inutilisé).
function powertrain_electricWinch_device:velocityUpdate(dt) end

return powertrain_electricWinch
