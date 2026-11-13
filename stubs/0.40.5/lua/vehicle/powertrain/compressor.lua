---@meta
-- tim19Atlas stub generated from lua/vehicle/powertrain/compressor.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Composant powertrain `compressor` : compresseur d'air pneumatique (freins à air, suspension pneumatique de camions). C'est un consommateur de couple sans port de sortie (feuille de l'arbre powertrain) : il reçoit la vitesse de son parent, pompe de l'air vers un réservoir `pressureTank` enregistré (energyStorage) et renvoie à son parent un couple résistant `torqueDiff`. Il se débraye (deload) au-dessus de la pression de coupure et se rembraye sous la pression d'enclenchement. Il joue des sons de compresseur et de purge, et envoie les données au flux GUI 'pneumaticsData'.
--- Accès : type de composant powertrain `compressor` (jbeam `powertrain`), accessible par `powertrain.getDevice("nom")`
---@class powertrain_compressor
---@field deviceCategories table<string, boolean> {clutchlike=true, clutch=true, pneumaticPowerSource=true, torqueConsumer=true}.
---@field outputPorts table Table vide : aucun port de sortie.
local powertrain_compressor = {}

--- Construit le compresseur : cylindrée (pumpDisplacement), rendement, pressions de coupure/enclenchement, mode et nom des sorties.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/compressor.lua:228
---@param jbeamData table Données jbeam du composant.
---@return table  Le device (classe `device`).
function powertrain_compressor.new(jbeamData) end

--- Objet renvoyé par new(jbeamData).
---@class powertrain_compressor_device
local powertrain_compressor_device = {}

--- Ne fait rien (corps vide).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/compressor.lua:113
---@param damageAmount number Quantité de dégâts (ignorée).
function powertrain_compressor_device:applyDeformGroupDamage(damageAmount) end

--- Inertie purement virtuelle : cumulativeInertia = virtualInertia / gearRatio² ; rapports cumulés = gearRatio.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/compressor.lua:161
function powertrain_compressor_device:calculateInertia() end

--- Renvoie 1 (0 si cassé) et la table {isBroken}.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/compressor.lua:128
---@return number  Intégrité.
---@return table  {isBroken}.
function powertrain_compressor_device:getPartCondition() end

--- Crée la boucle sonore du compresseur (lancée à volume 0), lit les nœuds et événements de son depuis le jbeam (par défaut le nœud moteur du parent) et crée le lisseur de hauteur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/compressor.lua:177
---@param jbeamData table Données jbeam du composant.
function powertrain_compressor_device:initSounds(jbeamData) end

--- Marque isBroken = true (sans autre effet réel car selectUpdates est vide dans ce cas).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/compressor.lua:141
function powertrain_compressor_device:onBreak() end

--- Enregistre un réservoir d'air : le stockage doit être de type pressureTank et de même energyType que requiredEnergyType, sinon une erreur est journalisée. Mémorise le réservoir dans pressureTank.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/compressor.lua:146
---@param storageName string Nom du stockage d'énergie (energyStorage.getStorage).
function powertrain_compressor_device:registerStorage(storageName) end

--- Remet à zéro vitesses, pression, débit et énergie pompée, coefficients d'usure/dégâts, deloadCoef = 1 et lisseur de son ; relit gearRatio et friction.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/compressor.lua:195
---@param jbeamData table Données jbeam du composant.
---@return table  Le device.
function powertrain_compressor_device:reset(jbeamData) end

--- Ne fait rien.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/compressor.lua:174
---@param jbeamData table Données jbeam (ignorées).
function powertrain_compressor_device:resetSounds(jbeamData) end

--- Applique isBroken de l'intégrité (nombre : pas cassé ; table : champ isBroken) en appelant onBreak si besoin.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/compressor.lua:116
---@param subSystem any Non utilisé.
---@param odometer number Non utilisé.
---@param integrity number|table Nombre 0..1 ou table {isBroken}.
---@param visual any Non utilisé.
function powertrain_compressor_device:setPartCondition(subSystem, odometer, integrity, visual) end

--- Appelée à chaque pas physique : torqueDiff = pumpPressure * pumpDisplacement / (2π) si inputAV > 0, sinon 0 (couple résistant du compresseur).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/compressor.lua:70
---@param dt number Pas de temps en secondes (inutilisé).
function powertrain_compressor_device:torqueUpdate(dt) end

--- Mise à jour par image : envoie au flux GUI 'pneumaticsData' la pression du réservoir (kPa relatifs) et l'état 'Engaged' ou 'Disengaged', seulement si le flux est demandé.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/compressor.lua:78
---@param dt number Durée de l'image en secondes (inutilisé).
function powertrain_compressor_device:updateGFX(dt) end

--- Règle le volume (selon inputAV de 10 à 20 rad/s), la hauteur (régime lissé) et la couleur (1 - deloadCoef) du son de compresseur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/compressor.lua:94
---@param dt number Durée de l'image en secondes.
function powertrain_compressor_device:updateSounds(dt) end

--- Appelée après construction du powertrain ; renvoie toujours true.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/compressor.lua:137
---@return boolean  true.
function powertrain_compressor_device:validate() end

--- Appelée à chaque pas physique : lit inputAV du parent, calcule le débit d'air (max(0, inputAV/(2π) * pumpDisplacement * pumpEfficiency * (1 - deloadCoef))), ajoute l'énergie pompée au réservoir, gère l'enclenchement/délestage selon les pressions de coupure (joue le son de purge au délestage) et calcule pumpPressure.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/compressor.lua:17
---@param dt number Pas de temps en secondes.
function powertrain_compressor_device:velocityUpdate(dt) end

return powertrain_compressor
