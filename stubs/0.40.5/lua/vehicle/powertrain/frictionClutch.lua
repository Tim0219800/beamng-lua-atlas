---@meta
-- tim19Atlas stub generated from lua/vehicle/powertrain/frictionClutch.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Composant powertrain `frictionClutch` : embrayage à friction placé juste après un moteur (le parent doit être de catégorie `engine`). Il modélise un ressort de verrouillage sur un angle d'embrayage, un amortissement, un jeu libre, l'usure/dégâts et un modèle thermique (température, efficacité, fumée, messages au joueur, dommage permanent). Le taux d'embrayage vient de `electrics.values.clutchRatio` (1 = embrayé, 0 = débrayé). Un moddeur règle ses paramètres dans le jbeam ou lit sa température.
--- Accès : type de composant powertrain `frictionClutch` (jbeam `powertrain`), accessible par `powertrain.getDevice("nom")`
---@class powertrain_frictionClutch
---@field deviceCategories table<string, boolean> {clutchlike=true, clutch=true}.
---@field outputPorts table<integer, boolean> {[1]=true} : un seul port de sortie.
---@field requiredExternalInertiaOutputs table<integer, integer> {1} : le port 1 reçoit son inertie de l'extérieur (le powertrain gère l'inertie côté sortie).
local powertrain_frictionClutch = {}

--- Construit le device frictionClutch : coefficients d'usure/dégâts, lissages, paramètres thermiques (température d'alerte, de sécurité, de destruction, masse et chaleur spécifique) et sélectionne velocityUpdate/torqueUpdate.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/frictionClutch.lua:232
---@param jbeamData table Données jbeam du composant.
---@return table  Le device (classe `device`).
function powertrain_frictionClutch.new(jbeamData) end

--- Objet renvoyé par new(jbeamData).
---@class powertrain_frictionClutch_device
local powertrain_frictionClutch_device = {}

--- Augmente le jeu libre (damageClutchFreePlayCoef) et réduit le couple de verrouillage (min 0.2) selon les dégâts, puis recalcule l'inertie.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/frictionClutch.lua:123
---@param damageAmount number Quantité de dégâts du groupe de déformation.
function powertrain_frictionClutch_device:applyDeformGroupDamage(damageAmount) end

--- Prend l'inertie et les rapports cumulés du premier enfant, borne l'inertie à la moitié de celle du moteur, et calcule lockSpring, lockDamp et maxClutchAngle.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/frictionClutch.lua:178
function powertrain_frictionClutch_device:calculateInertia() end

--- Renvoie l'intégrité 0..1 (minimum entre jeu libre et couple de verrouillage, 0 si détruit) et la table d'état correspondante.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/frictionClutch.lua:149
---@return number  Intégrité 0..1.
---@return table  {damageClutchFreePlayCoef, damageLockTorqueCoef, clutchPermanentlyDamaged}.
function powertrain_frictionClutch_device:getPartCondition() end

--- Remet à zéro vitesses, couple, angle, lisseurs, température (à celle de l'environnement), coefficients d'usure/dégâts et état de dommage permanent.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/frictionClutch.lua:202
---@param jbeamData table Données jbeam (non relues ici).
function powertrain_frictionClutch_device:reset(jbeamData) end

--- Active ou non le « verrouillage » thermique : si enabled est vrai, l'embrayage ne chauffe plus (clutchThermalsCoef = 0), sinon il chauffe normalement.
---Source : lua/vehicle/powertrain/frictionClutch.lua:119
---@param enabled boolean true pour supprimer l'échauffement.
function powertrain_frictionClutch_device:setLock(enabled) end

--- Applique usure (selon l'odomètre) et dégâts (selon l'intégrité : nombre 0..1 ou table) puis recalcule l'inertie. Restaure aussi clutchPermanentlyDamaged.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/frictionClutch.lua:129
---@param subSystem any Non utilisé.
---@param odometer number Distance parcourue en mètres (usure de 30000 km à 500000 km).
---@param integrity number|table Nombre 0..1 ou table {damageClutchFreePlayCoef, damageLockTorqueCoef, clutchPermanentlyDamaged}.
---@param visual any Non utilisé.
function powertrain_frictionClutch_device:setPartCondition(subSystem, odometer, integrity, visual) end

--- Appelée à chaque pas physique : intègre l'angle d'embrayage selon la différence de vitesse, applique jeu libre et ressort/amortissement, borne par lockTorque, écrit outputTorque1 et cumule la perte de friction.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/frictionClutch.lua:83
---@param dt number Pas de temps en secondes.
function powertrain_frictionClutch_device:torqueUpdate(dt) end

--- Mise à jour non physique (une fois par image) : échauffement et refroidissement de l'embrayage, efficacité thermique, fumée, messages d'alerte, dommage permanent, envoi du flux GUI 'clutchThermalData'. Remet frictionLossPerUpdate à 0.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/frictionClutch.lua:19
---@param dt number Durée de l'image en secondes.
function powertrain_frictionClutch_device:updateGFX(dt) end

--- Vérifie que le parent est un moteur (deviceCategories.engine), sinon journalise des erreurs et renvoie false. Calcule lockTorque par défaut = 1.25 * couple max du moteur + inertie du moteur * régime max (rad/s).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/frictionClutch.lua:166
---@return boolean  false si le parent n'est pas un moteur.
function powertrain_frictionClutch_device:validate() end

--- Appelée à chaque pas physique : inputAV = parent.outputAV1.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/frictionClutch.lua:79
---@param dt number Pas de temps en secondes (inutilisé).
function powertrain_frictionClutch_device:velocityUpdate(dt) end

return powertrain_frictionClutch
