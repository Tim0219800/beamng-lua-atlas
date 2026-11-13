---@meta
-- tim19Atlas stub generated from lua/vehicle/powertrain/centrifugalClutch.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Type de device powertrain `centrifugalClutch` : embrayage centrifuge (catégories clutchlike et clutch) placé directement après un moteur thermique. Il s'engage automatiquement avec le régime d'entrée (entre engageRPMStart et engageRPMEnd) : le taux d'engagement clutchRatio passe de 0 à 1, et le couple transmis suit un ressort/amortisseur sur l'angle d'embrayage, limité par lockTorque. Il modélise aussi l'échauffement (température, efficacité thermique, fumée, dommage permanent) et l'usure. Utile pour scooters, karts, tondeuses… Le parent doit être un moteur (catégorie engine) et il a un seul enfant sur le port 1.
--- Accès : type de composant powertrain `centrifugalClutch` (jbeam `powertrain`), accessible par `powertrain.getDevice("nom")`
---@class powertrain_centrifugalClutch
---@field deviceCategories table<string, boolean> {clutchlike = true, clutch = true}. clutchlike est requis par le moteur combustionEngine pour ses enfants.
---@field outputPorts table<integer, boolean> {[1] = true} : un seul port de sortie.
---@field requiredExternalInertiaOutputs integer[] {1} : powertrain ajoute un arbre factice (dummy shaft) sur ce port si aucun enfant n'y est branché.
local powertrain_centrifugalClutch = {}

--- Fabrique du device appelée par powertrain.init pour une entrée jbeam de type 'centrifugalClutch'. Lit les clés jbeam (voir notes) et renvoie le device.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/centrifugalClutch.lua:232
---@param jbeamData table Données jbeam du device.
---@return table  Le device centrifugalClutch.
function powertrain_centrifugalClutch.new(jbeamData) end

--- Objet renvoyé par new(jbeamData). Méthodes appelées par powertrain.lua.
---@class powertrain_centrifugalClutch_device
local powertrain_centrifugalClutch_device = {}

--- Applique un dégât de déformation : augmente le jeu libre et réduit le couple de verrouillage (plancher 0.2), puis recalcule l'inertie.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/centrifugalClutch.lua:123
---@param damageAmount number Dégât ajouté.
function powertrain_centrifugalClutch_device:applyDeformGroupDamage(damageAmount) end

--- Reprend inertie et rapports de l'enfant (inertie plafonnée à la moitié de celle du moteur) et recalcule lockSpring, lockDamp et maxClutchAngle.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/centrifugalClutch.lua:178
function powertrain_centrifugalClutch_device:calculateInertia() end

--- Renvoie l'intégrité 0..1 (0 si dommage permanent) et la table d'état {damageClutchFreePlayCoef, damageLockTorqueCoef, clutchPermanentlyDamaged}.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/centrifugalClutch.lua:149
---@return number  Intégrité 0..1.
---@return table  État détaillé.
function powertrain_centrifugalClutch_device:getPartCondition() end

--- Remet tous les états à leurs valeurs initiales (vitesses, angle, température extérieure, usure et dommages) puis sélectionne les fonctions de mise à jour.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/centrifugalClutch.lua:202
---@param jbeamData table Données jbeam (non utilisées ici).
function powertrain_centrifugalClutch_device:reset(jbeamData) end

--- Verrouille/déverrouille le chauffage de l'embrayage : enabled = true met clutchThermalsCoef à 0 (plus d'énergie dissipée comptée comme chaleur), false à 1.
---Source : lua/vehicle/powertrain/centrifugalClutch.lua:119
---@param enabled boolean true pour supprimer l'échauffement.
function powertrain_centrifugalClutch_device:setLock(enabled) end

--- Applique usure (odomètre) et intégrité (nombre ou table d'état) : coefficients de jeu libre et de couple de verrouillage, état de dommage permanent ; recalcule l'inertie.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/centrifugalClutch.lua:129
---@param subSystem string|nil Non utilisé.
---@param odometer number Usure cumulée.
---@param integrity number|table Intégrité 0..1 ou table d'état de getPartCondition.
---@param visual any Non utilisé.
function powertrain_centrifugalClutch_device:setPartCondition(subSystem, odometer, integrity, visual) end

--- Pas de physique (couples) : calcule clutchRatio d'après le régime d'entrée, l'angle d'embrayage et le couple transmis (torqueDiff = outputTorque1), et accumule la perte par friction.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/centrifugalClutch.lua:84
---@param dt number Pas de physique en secondes.
function powertrain_centrifugalClutch_device:torqueUpdate(dt) end

--- Une fois par frame : calcule l'énergie dissipée dans l'embrayage et son refroidissement, met à jour clutchTemperature (bornée à [température extérieure, maxClutchTemp]) et thermalEfficiency, produit la fumée et les messages d'avertissement, signale un dommage permanent, remet frictionLossPerUpdate à 0 et publie 'clutchThermalData'.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/centrifugalClutch.lua:20
---@param dt number Pas de temps en secondes.
function powertrain_centrifugalClutch_device:updateGFX(dt) end

--- Vérifie que le parent est un moteur (catégorie engine), sinon log d'erreur et renvoie false (avorte l'init). Calcule lockTorque par défaut.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/centrifugalClutch.lua:166
---@return boolean  false si le parent n'est pas un moteur.
function powertrain_centrifugalClutch_device:validate() end

--- Pas de physique (vitesses) : inputAV = vitesse de sortie du parent (outputAV1 du moteur).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/centrifugalClutch.lua:80
---@param dt number Pas de physique en secondes.
function powertrain_centrifugalClutch_device:velocityUpdate(dt) end

return powertrain_centrifugalClutch
