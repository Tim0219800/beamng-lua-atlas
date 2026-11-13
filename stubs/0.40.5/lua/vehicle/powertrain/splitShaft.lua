---@meta
-- tim19Atlas stub generated from lua/vehicle/powertrain/splitShaft.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Composant powertrain `splitShaft` : répartiteur à deux sorties, typiquement une boîte de transfert 4x4 ou un coupleur d'essieu. Une sortie est « primaire » (reçoit tout le couple d'entrée) et l'autre « secondaire » (reçoit un couple de couplage). Types de couplage (`splitType`) : `viscous` (couple proportionnel à la différence de vitesse, avec exposant) ou `locked` (accouplement à ressort quadratique, borné par lockTorque). Peut être déconnecté (mode `disconnected` : la sortie secondaire ne reçoit plus rien). Catégories `shaft` et `differential`.
--- Accès : type de composant powertrain `splitShaft` (jbeam `powertrain`), accessible par `powertrain.getDevice("nom")`
---@class powertrain_splitShaft
---@field deviceCategories table<string, boolean> {shaft=true, differential=true}.
---@field outputPorts table<integer, boolean> {[1]=true, [2]=true}.
---@field requiredExternalInertiaOutputs table<integer, integer> {1, 2} : les deux sorties reçoivent leur inertie de leurs enfants.
local powertrain_splitShaft = {}

--- Construit le répartiteur : sorties primaire et secondaire, type de couplage (viscous ou locked), modes disponibles et paramètres de couplage.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/splitShaft.lua:223
---@param jbeamData table Données jbeam du composant.
---@return table  Le device (classe `device`).
function powertrain_splitShaft.new(jbeamData) end

--- Objet renvoyé par new(jbeamData). torqueUpdate dépend de splitType et du mode.
---@class powertrain_splitShaft_device
local powertrain_splitShaft_device = {}

--- Augmente les coefficients de dégâts de frottement, de couple de verrouillage et de couple visqueux selon les dégâts.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/splitShaft.lua:60
---@param damageAmount number Quantité de dégâts du groupe de déformation.
function powertrain_splitShaft_device:applyDeformGroupDamage(damageAmount) end

--- Prend l'inertie et les rapports cumulés de la sortie primaire ; calcule lockSpring, lockDamp et maxShaftAngle à partir de l'inertie de la sortie secondaire.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/splitShaft.lua:156
function powertrain_splitShaft_device:calculateInertia() end

--- Renvoie l'intégrité 0..1 (0 si cassé) et la table d'état des dégâts (voir bug dans notes).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/splitShaft.lua:89
---@return number  Intégrité 0..1.
---@return table  {damageFrictionCoef, damageLockTorqueCoef, damageViscousTorqueCoef, isBroken}.
function powertrain_splitShaft_device:getPartCondition() end

--- Défini seulement s'il y a plusieurs modes. Renvoie stateData avec la clé '<nom>Mode' = mode courant.
---Source : lua/vehicle/powertrain/splitShaft.lua:124
---@return table  stateData.
function powertrain_splitShaft_device:getState() end

--- Marque isBroken = true et passe aux fonctions de couple déconnectées (secondaire sans couple).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/splitShaft.lua:149
function powertrain_splitShaft_device:onBreak() end

--- Remet à zéro vitesses, couples, angle d'arbre, lisseur visqueux, coefficients d'usure/dégâts et mode ; relit gearRatio, friction, viscousCoef et defaultClutchRatio.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/splitShaft.lua:183
---@param jbeamData table Données jbeam du composant.
function powertrain_splitShaft_device:reset(jbeamData) end

--- Change le mode ('connected' ou 'disconnected', doit figurer dans availableModes). Un device physiquement déconnecté reste 'disconnected'. Réselectionne torqueUpdate.
---Source : lua/vehicle/powertrain/splitShaft.lua:106
---@param mode string 'connected' ou 'disconnected'.
function powertrain_splitShaft_device:setMode(mode) end

--- Applique usure (selon l'odomètre) et dégâts (intégrité nombre 0..1 ou table) aux coefficients de frottement, de verrouillage et de viscosité ; appelle onBreak si isBroken.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/splitShaft.lua:66
---@param subSystem any Non utilisé.
---@param odometer number Distance parcourue en mètres.
---@param integrity number|table Nombre 0..1 ou table {damageFrictionCoef, damageLockTorqueCoef, damageViscousTorqueCoef, isBroken}.
---@param visual any Non utilisé.
function powertrain_splitShaft_device:setPartCondition(subSystem, odometer, integrity, visual) end

--- Défini seulement s'il y a plusieurs modes. Restaure le mode depuis data['<nom>Mode'].
---Source : lua/vehicle/powertrain/splitShaft.lua:129
---@param data table|nil Table d'état produite par getState.
function powertrain_splitShaft_device:setState(data) end

--- Appelée à chaque pas physique : calcule le couple secondaire (viscous : coef * |ΔAV|^exposant, ou locked : ressort quadratique sur l'angle d'arbre + amortissement) et le couple primaire. Déconnecté : secondaire à 0.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/splitShaft.lua:42
function powertrain_splitShaft_device:torqueUpdate() end

--- Appelée après construction du powertrain : force le mode 'disconnected' si isPhysicallyDisconnected ; renvoie true.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/splitShaft.lua:140
---@return boolean  true.
function powertrain_splitShaft_device:validate() end

--- Appelée à chaque pas physique : inputAV = vitesse de la sortie primaire * gearRatio, écrit dans le parent.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/splitShaft.lua:15
---@param dt number Pas de temps en secondes (inutilisé).
function powertrain_splitShaft_device:velocityUpdate(dt) end

return powertrain_splitShaft
