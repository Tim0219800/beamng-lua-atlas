---@meta
-- tim19Atlas stub generated from lua/vehicle/powertrain/hydrodynamicRetarder.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Composant powertrain `hydrodynamicRetarder` : ralentisseur hydrodynamique (frein moteur de camion/bus) monté en dérivation sur l'arbre. Il possède un rotor virtuel (inertie `virtualInertia`) dont il intègre lui-même la vitesse `outputAV1` ; il renvoie à son parent `inputAV = outputAV1 * gearRatio`. Quand le coefficient demandé est > 0, il applique un couple de freinage lu dans la courbe `brakeTorque` (couple selon le régime du rotor), lissé par `strengthSmoothing`. La puissance dissipée peut être renvoyée au liquide de refroidissement du moteur (`thermals.additionalCoolantEnergyPerStep`). Catégories `retarder` et `torqueConsumer`, sans port de sortie.
--- Accès : type de composant powertrain `hydrodynamicRetarder` (jbeam `powertrain`), accessible par `powertrain.getDevice("nom")`
---@class powertrain_hydrodynamicRetarder
---@field deviceCategories table<string, boolean> {retarder=true, torqueConsumer=true}.
---@field outputPorts table Table vide : aucun port de sortie.
local powertrain_hydrodynamicRetarder = {}

--- Construit le ralentisseur : lit et valide la courbe brakeTorque, construit la courbe par tr/min avec la zone de décroissance, règle l'inertie virtuelle et les lisseurs.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/hydrodynamicRetarder.lua:154
---@param jbeamData table Données jbeam du composant (brakeTorque obligatoire).
---@return table  Le device (classe `device`).
function powertrain_hydrodynamicRetarder.new(jbeamData) end

--- Objet renvoyé par new(jbeamData). velocityUpdate et torqueUpdate sont posées par selectUpdates.
---@class powertrain_hydrodynamicRetarder_device
local powertrain_hydrodynamicRetarder_device = {}

--- Augmente le coefficient de frottement de dégâts (0.01 de dégât = +0.1).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/hydrodynamicRetarder.lua:75
---@param damageAmount number Quantité de dégâts du groupe de déformation.
function powertrain_hydrodynamicRetarder_device:applyDeformGroupDamage(damageAmount) end

--- cumulativeInertia = virtualInertia / gearRatio² ; rapports cumulés = gearRatio ; calcule invVirtualInertia.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/hydrodynamicRetarder.lua:112
function powertrain_hydrodynamicRetarder_device:calculateInertia() end

--- Renvoie l'intégrité 0..1 (0 si cassé) et {damageFrictionCoef, isBroken}.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/hydrodynamicRetarder.lua:94
---@return number  Intégrité 0..1.
---@return table  État sauvegardable.
function powertrain_hydrodynamicRetarder_device:getPartCondition() end

--- Crée la boucle sonore du ralentisseur (désactivée au départ) et le lisseur de vitesse.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/hydrodynamicRetarder.lua:126
---@param jbeamData table Données jbeam du composant (retarderWhineEvent, retarderWhinePitchCoefSmoothing).
function powertrain_hydrodynamicRetarder_device:initSounds(jbeamData) end

--- Marque le ralentisseur comme cassé et passe à la version de couple sans freinage.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/hydrodynamicRetarder.lua:107
function powertrain_hydrodynamicRetarder_device:onBreak() end

--- Remet à zéro vitesses, couple, coefficient demandé, lisseur, coefficients d'usure/dégâts ; relit friction et dynamicFriction.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/hydrodynamicRetarder.lua:136
---@param jbeamData table Données jbeam du composant.
function powertrain_hydrodynamicRetarder_device:reset(jbeamData) end

--- Remet à zéro le lisseur de vitesse du son.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/hydrodynamicRetarder.lua:122
function powertrain_hydrodynamicRetarder_device:resetSounds() end

--- Applique l'usure (odomètre, coefficient de 1 à 2) et les dégâts (intégrité nombre 0..1 ou table {damageFrictionCoef, isBroken}) ; appelle onBreak si isBroken.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/hydrodynamicRetarder.lua:79
---@param subSystem any Non utilisé.
---@param odometer number Distance parcourue en mètres.
---@param integrity number|table Nombre 0..1 ou table d'état.
---@param visual any Non utilisé.
function powertrain_hydrodynamicRetarder_device:setPartCondition(subSystem, odometer, integrity, visual) end

--- Règle la force de freinage demandée (0 = aucun, 1 = maximum de la courbe). Le couple réel suit via un lisseur. À appeler depuis un contrôleur (levier de ralentisseur).
---Source : lua/vehicle/powertrain/hydrodynamicRetarder.lua:17
---@param coef number|nil Coefficient 0..1 (borné ; nil = 0).
function powertrain_hydrodynamicRetarder_device:setRetarderCoef(coef) end

--- Appelée à chaque pas physique : intègre la vitesse du rotor avec le couple du parent (moins frottement) plus le couple de freinage, et ajoute la puissance dissipée à l'énergie du circuit de refroidissement. Version « cassé ou sans courbe » : sans freinage.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/hydrodynamicRetarder.lua:dyn
---@param dt number Pas de temps en secondes.
function powertrain_hydrodynamicRetarder_device:torqueUpdate(dt) end

--- Mise à jour par image : ne fait rien.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/hydrodynamicRetarder.lua:66
---@param dt number Durée de l'image en secondes (inutilisé).
function powertrain_hydrodynamicRetarder_device:updateGFX(dt) end

--- Règle volume, hauteur et couleur du son de sifflement du ralentisseur d'après la vitesse lissée et le coefficient demandé.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/hydrodynamicRetarder.lua:21
---@param dt number Durée de l'image en secondes.
function powertrain_hydrodynamicRetarder_device:updateSounds(dt) end

--- Appelée après construction du powertrain ; renvoie false si la courbe brakeTorque est absente ou invalide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/hydrodynamicRetarder.lua:103
---@return boolean  true si une courbe de freinage valide existe.
function powertrain_hydrodynamicRetarder_device:validate() end

--- Appelée à chaque pas physique : inputAV = outputAV1 * gearRatio, écrit dans le champ de vitesse du parent.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/hydrodynamicRetarder.lua:31
---@param dt number Pas de temps en secondes (inutilisé).
function powertrain_hydrodynamicRetarder_device:velocityUpdate(dt) end

return powertrain_hydrodynamicRetarder
