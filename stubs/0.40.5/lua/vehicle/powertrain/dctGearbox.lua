---@meta
-- tim19Atlas stub generated from lua/vehicle/powertrain/dctGearbox.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Composant powertrain `dctGearbox` : boîte à double embrayage (DCT). Elle contient deux embrayages internes (voie 1 et voie 2) qui reçoivent chacun un rapport pré-sélectionné (setGearIndex1 / setGearIndex2). Elle est de catégorie `clutchlike` et `gearbox` : le moteur la prend directement pour enfant (le parent doit être un moteur) et lit sa valeur `torqueDiff`. Les taux d'embrayage viennent de `electrics.values.clutchRatio1` et `clutchRatio2`, pilotés par un contrôleur de boîte DCT. Modes : 'neutral', 'park', ou autre (marche avant/arrière selon les rapports).
--- Accès : type de composant powertrain `dctGearbox` (jbeam `powertrain`), accessible par `powertrain.getDevice("nom")`
---@class powertrain_dctGearbox
---@field deviceCategories table<string, boolean> {clutchlike=true, gearbox=true} : le moteur le reconnaît comme embrayage.
---@field outputPorts table<integer, boolean> {[1]=true}.
---@field requiredExternalInertiaOutputs table<integer, integer> {1}.
local powertrain_dctGearbox = {}

--- Construit la boîte DCT : table des rapports (avant/arrière), paramètres des deux embrayages et du verrou de parking, coefficients de bruit d'engrenage, puis pré-sélectionne les rapports 1 et 2.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/dctGearbox.lua:351
---@param jbeamData table Données jbeam du composant (gearRatios obligatoire).
---@return table  Le device (classe `device`).
function powertrain_dctGearbox.new(jbeamData) end

--- Objet renvoyé par new(jbeamData). velocityUpdate/torqueUpdate dépendent du mode (normal, neutral, park).
---@class powertrain_dctGearbox_device
local powertrain_dctGearbox_device = {}

--- Réduit le coefficient de couple de verrouillage (damageLockTorqueCoef, minimum 0.2) selon les dégâts.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/dctGearbox.lua:145
---@param damageAmount number Quantité de dégâts du groupe de déformation.
function powertrain_dctGearbox_device:applyDeformGroupDamage(damageAmount) end

--- Calcule les inerties cumulées de chaque voie (bornées à la moitié de l'inertie du moteur), les ressorts et amortissements des deux embrayages, l'angle d'embrayage maximal, le verrou de parking et les rapports cumulés.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/dctGearbox.lua:233
function powertrain_dctGearbox_device:calculateInertia() end

--- Renvoie l'intégrité 0..1 (selon damageLockTorqueCoef) et la table {damageLockTorqueCoef}.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/dctGearbox.lua:162
---@return number  Intégrité 0..1.
---@return table  {damageLockTorqueCoef}.
function powertrain_dctGearbox_device:getPartCondition() end

--- Crée les boucles sonores d'engrenage (entrée et sortie), les lisseurs et les coefficients de hauteur depuis le jbeam, et règle le paramètre FMOD c_gearboxMaxPower.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/dctGearbox.lua:281
---@param jbeamData table Données jbeam du composant.
function powertrain_dctGearbox_device:initSounds(jbeamData) end

--- Réinitialise l'état des deux embrayages, des couples et des coefficients d'usure/dégâts, puis pré-sélectionne les rapports 1 et 2.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/dctGearbox.lua:315
---@param jbeamData table Données jbeam du composant (friction).
function powertrain_dctGearbox_device:reset(jbeamData) end

--- Remet à zéro les lisseurs et valeurs de son d'engrenage.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/dctGearbox.lua:269
function powertrain_dctGearbox_device:resetSounds() end

--- Pré-sélectionne le rapport de la voie 1 (indice borné à [minGearIndex, maxGearIndex]) et recalcule l'inertie du groupe motopropulseur.
---Source : lua/vehicle/powertrain/dctGearbox.lua:211
---@param index integer Indice du rapport (0 neutre, >0 avant, <0 arrière).
function powertrain_dctGearbox_device:setGearIndex1(index) end

--- Pré-sélectionne le rapport de la voie 2 (indice borné) et recalcule l'inertie du groupe motopropulseur.
---Source : lua/vehicle/powertrain/dctGearbox.lua:220
---@param index integer Indice du rapport (0 neutre, >0 avant, <0 arrière).
function powertrain_dctGearbox_device:setGearIndex2(index) end

--- Verrouille (lockCoef = 0) ou déverrouille (1) la transmission.
---Source : lua/vehicle/powertrain/dctGearbox.lua:229
---@param enabled boolean true pour verrouiller.
function powertrain_dctGearbox_device:setLock(enabled) end

--- Change le mode ('neutral', 'park' ou autre) sans validation, et sélectionne les fonctions de mise à jour correspondantes. 'park' remet parkEngaged à 0.
---Source : lua/vehicle/powertrain/dctGearbox.lua:206
---@param mode string 'neutral', 'park' ou autre (marche normale).
function powertrain_dctGearbox_device:setMode(mode) end

--- Applique l'usure (couple de verrouillage de 1 à 0.7 entre 30000 km et 500000 km) et les dégâts (intégrité nombre 0..1 ou table {damageLockTorqueCoef}).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/dctGearbox.lua:149
---@param subSystem any Non utilisé.
---@param odometer number Distance parcourue en mètres.
---@param integrity number|table Nombre 0..1 ou table {damageLockTorqueCoef}.
---@param visual any Non utilisé.
function powertrain_dctGearbox_device:setPartCondition(subSystem, odometer, integrity, visual) end

--- Appelée à chaque pas physique : calcule les deux couples d'embrayage (ressort sur l'angle d'embrayage + amortissement, bornés par lockTorque), torqueDiff = somme et outputTorque1 = somme des couples * rapports. En neutre : tout à 0. En park : couple de verrouillage de parking.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/dctGearbox.lua:111
---@param dt number Pas de temps en secondes.
function powertrain_dctGearbox_device:torqueUpdate(dt) end

--- Met à jour volume et hauteur des boucles sonores d'engrenage (entrée et sortie) d'après vitesses et couples lissés. Appelée à chaque image.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/dctGearbox.lua:19
---@param dt number Durée de l'image en secondes.
function powertrain_dctGearbox_device:updateSounds(dt) end

--- Vérifie que le parent est un moteur (sinon erreur loguée et false). Calcule lockTorque par défaut, et les valeurs attendues (couple, vitesse, puissance) pour normaliser les sons.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/dctGearbox.lua:172
---@return boolean  false si le parent n'est pas un moteur.
function powertrain_dctGearbox_device:validate() end

--- Appelée à chaque pas physique : inputAV = parent.outputAV1 ; clutchAV1/2 = outputAV1 * gearRatio1/2 * lockCoef. N'écrit pas de vitesse dans le parent : le moteur lit torqueDiff directement.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/dctGearbox.lua:105
---@param dt number Pas de temps en secondes.
function powertrain_dctGearbox_device:velocityUpdate(dt) end

return powertrain_dctGearbox
