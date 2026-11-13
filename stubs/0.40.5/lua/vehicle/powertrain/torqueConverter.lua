---@meta
-- tim19Atlas stub generated from lua/vehicle/powertrain/torqueConverter.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Convertisseur de couple hydraulique d'une boîte automatique, avec embrayage de verrouillage (lockup). Il se branche derrière un moteur (le parent doit être un device de catégorie engine) et transmet un couple dépendant de l'écart de vitesse entre pompe (entrée) et turbine (sortie), avec multiplication de couple jusqu'à stallTorqueRatio à bas régime de turbine. Le verrouillage est piloté par la valeur electrics 'lockupClutchRatio' (0 ouvert, 1 verrouillé). Un moddeur l'utilise via le jbeam powertrain (type torqueConverter) et lit device.outputTorque1 / inputAV / outputAV1.
--- Accès : type de composant powertrain `torqueConverter` (jbeam `powertrain`), accessible par `powertrain.getDevice("nom")`
---@class powertrain_torqueConverter
---@field deviceCategories table<string, boolean> Catégories : clutchlike, viscouscoupling.
---@field outputPorts table<integer, boolean> Ports de sortie : {[1]=true}.
---@field requiredExternalInertiaOutputs table<integer, integer> Sorties dont l'inertie est fournie de l'extérieur : {1}.
local powertrain_torqueConverter = {}

--- Construit un convertisseur de couple à partir de la définition jbeam du composant.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/torqueConverter.lua:136
---@param jbeamData table Données jbeam du composant (name, type, inputName, inputIndex, clés listées dans notes).
---@return table  Objet device (voir la classe device).
function powertrain_torqueConverter.new(jbeamData) end

--- Objet renvoyé par new(jbeamData). Champs utiles : inputAV (rad/s, vitesse pompe = vitesse de sortie du moteur), outputAV1 (rad/s, vitesse turbine, écrite par l'enfant), outputTorque1 (N·m), torqueDiff (N·m, couple de réaction sur l'entrée), lockupClutchAngle (rad), impellerClutchCoef, isBroken, mode.
---@class powertrain_torqueConverter_device
local powertrain_torqueConverter_device = {}

--- Réduit le couple de verrouillage quand un groupe de déformation est endommagé (retire jusqu'à 0.05 par 0.01 de dégât) puis recalcule l'inertie.
---Source : lua/vehicle/powertrain/torqueConverter.lua:52
---@param damageAmount number Quantité de dégât.
function powertrain_torqueConverter_device:applyDeformGroupDamage(damageAmount) end

--- Calcule inertie cumulée, rapports cumulés, raideur et amortissement du verrouillage (lockupClutchSpring/Damp) et l'angle maximal de lockup à partir du premier enfant.
---Source : lua/vehicle/powertrain/torqueConverter.lua:97
function powertrain_torqueConverter_device:calculateInertia() end

--- Renvoie l'état de condition de la pièce.
---Source : lua/vehicle/powertrain/torqueConverter.lua:73
---@return number  Intégrité 0..1.
---@return table  {damageLockupClutchTorqueCoef}.
function powertrain_torqueConverter_device:getPartCondition() end

--- Remet à zéro vitesses, couple, état de casse, angle de lockup, coefficients de dégâts/usure.
---Source : lua/vehicle/powertrain/torqueConverter.lua:117
---@param jbeamData table Données jbeam (non utilisées ici).
---@return table  Le device lui-même.
function powertrain_torqueConverter_device:reset(jbeamData) end

--- Mémorise le mode et réinstalle les fonctions velocityUpdate/torqueUpdate (le mode n'a pas d'autre effet dans ce fichier).
---Source : lua/vehicle/powertrain/torqueConverter.lua:92
---@param mode any Mode demandé (non interprété ici).
function powertrain_torqueConverter_device:setMode(mode) end

--- Applique un état d'usure/intégrité (jeu de sauvegarde de pièces) : usure selon l'odomètre et coefficient de dégât selon l'intégrité.
---Source : lua/vehicle/powertrain/torqueConverter.lua:58
---@param subSystem any Sous-système (non utilisé).
---@param odometer number Odomètre de la pièce.
---@param integrity number|table Intégrité 0..1, ou table {damageLockupClutchTorqueCoef}.
---@param visual any Non utilisé.
function powertrain_torqueConverter_device:setPartCondition(subSystem, odometer, integrity, visual) end

--- Pas de physique, étape couples : calcule le couple hydraulique (facteur K lissé, limité à converterTorque), la multiplication de couple (jusqu'à stallTorqueRatio) et le couple de lockup (ressort/amortisseur limité à lockupClutchTorque), puis outputTorque1 et torqueDiff.
---Source : lua/vehicle/powertrain/torqueConverter.lua:21
---@param dt number Pas de physique (s).
function powertrain_torqueConverter_device:torqueUpdate(dt) end

--- Vérifie que le parent est un moteur (catégorie engine) et fixe converterTorque par défaut. Appelée à l'initialisation du powertrain.
---Source : lua/vehicle/powertrain/torqueConverter.lua:80
---@return boolean  false (avec logs d'erreur) si le parent n'est pas un moteur.
function powertrain_torqueConverter_device:validate() end

--- Pas de physique, étape vitesses : recopie la vitesse de sortie du moteur parent (parent.outputAV1) dans inputAV. Choisi par selectUpdates (modifiable via setMode).
---Source : lua/vehicle/powertrain/torqueConverter.lua:17
---@param dt number Pas de physique (s).
function powertrain_torqueConverter_device:velocityUpdate(dt) end

return powertrain_torqueConverter
