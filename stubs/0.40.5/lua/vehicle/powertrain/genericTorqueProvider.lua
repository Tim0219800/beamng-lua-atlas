---@meta
-- tim19Atlas stub generated from lua/vehicle/powertrain/genericTorqueProvider.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Composant powertrain `genericTorqueProvider` : source de couple générique, de catégorie `engine`, dont le couple est simplement `desiredOutputTorque` (N·m) fixé de l'extérieur par un contrôleur ou un script (le moteur n'a ni courbe, ni papillon, ni énergie). Il retranche le frottement et expose l'interface minimale d'un moteur (scaleFriction, scaleOutputTorque, disable, enable, lockUp, getTorqueData…) pour que embrayages, boîtes et contrôleurs puissent le traiter comme un moteur. Utile pour un moteur piloté par un contrôleur personnalisé.
--- Accès : type de composant powertrain `genericTorqueProvider` (jbeam `powertrain`), accessible par `powertrain.getDevice("nom")`
---@class powertrain_genericTorqueProvider
---@field deviceCategories table<string, boolean> {engine=true}.
---@field outputPorts table<integer, boolean> {[1]=true}.
local powertrain_genericTorqueProvider = {}

--- Construit le fournisseur de couple avec les stubs d'interface moteur (nop pour son, allumage, démarreur) et la position visuelle déduite des nœuds de réaction de couple.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/genericTorqueProvider.lua:124
---@param jbeamData table Données jbeam du composant.
---@return table  Le device (classe `device`).
function powertrain_genericTorqueProvider.new(jbeamData) end

--- Objet renvoyé par new(jbeamData).
---@class powertrain_genericTorqueProvider_device
local powertrain_genericTorqueProvider_device = {}

--- Prend l'inertie et le rapport cumulés du premier enfant comme cumulativeInertia et cumulativeGearRatio.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/genericTorqueProvider.lua:92
function powertrain_genericTorqueProvider_device:calculateInertia() end

--- Coupe le couple : outputTorqueState = 0 et isDisabled = true.
---Source : lua/vehicle/powertrain/genericTorqueProvider.lua:34
function powertrain_genericTorqueProvider_device:disable() end

--- Rétablit le couple : outputTorqueState = 1 et isDisabled = false.
---Source : lua/vehicle/powertrain/genericTorqueProvider.lua:39
function powertrain_genericTorqueProvider_device:enable() end

--- Renvoie une table de courbe de couple vide : {maxRPM=0, curves={}, maxTorque=0, maxPower=0, maxTorqueRPM=0, maxPowerRPM=0, finalCurveName=1, deviceName, vehicleID}.
---Source : lua/vehicle/powertrain/genericTorqueProvider.lua:15
---@return table  Données de courbe (toutes nulles).
function powertrain_genericTorqueProvider_device:getTorqueData() end

--- Identique à disable : coupe le couple et marque isDisabled (pas de blocage de vitesse ici).
---Source : lua/vehicle/powertrain/genericTorqueProvider.lua:44
function powertrain_genericTorqueProvider_device:lockUp() end

--- Remet à zéro vitesse, couple, couple voulu, outputTorqueState et isDisabled ; relit friction, dynamicFriction et inertia du jbeam.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/genericTorqueProvider.lua:106
---@param jbeamData table Données jbeam du composant.
function powertrain_genericTorqueProvider_device:reset(jbeamData) end

--- Multiplie le frottement (friction) par le facteur donné.
---Source : lua/vehicle/powertrain/genericTorqueProvider.lua:26
---@param friction number Facteur multiplicatif.
function powertrain_genericTorqueProvider_device:scaleFriction(friction) end

--- Multiplie outputTorqueState par state (cumulatif).
---Source : lua/vehicle/powertrain/genericTorqueProvider.lua:30
---@param state number Facteur multiplicatif.
function powertrain_genericTorqueProvider_device:scaleOutputTorque(state) end

--- Envoie l'événement GUI 'TorqueCurveChanged' avec les données de courbe (calculées si non fournies).
---Source : lua/vehicle/powertrain/genericTorqueProvider.lua:19
---@param data table|nil Résultat de getTorqueData ; nil pour le recalculer.
function powertrain_genericTorqueProvider_device:sendTorqueData(data) end

--- Appelée à chaque pas physique : outputTorque1 = desiredOutputTorque * outputTorqueState - couple de frottement (limité par la vitesse * inertie * 2000 pour la stabilité).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/genericTorqueProvider.lua:55
---@param dt number Pas de temps en secondes (inutilisé).
function powertrain_genericTorqueProvider_device:torqueUpdate(dt) end

--- Mise à jour par image : outputRPM = outputAV1 en tr/min.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/genericTorqueProvider.lua:49
---@param dt number Durée de l'image en secondes (inutilisé).
function powertrain_genericTorqueProvider_device:updateGFX(dt) end

--- Si le device n'a pas d'enfant, pose clutchChild = {torqueDiff = 0} ; enregistre le moteur dans powertrain.engineData ; sélectionne les fonctions de mise à jour.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/genericTorqueProvider.lua:77
---@return boolean  Toujours true.
function powertrain_genericTorqueProvider_device:validate() end

--- Toujours nop.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/genericTorqueProvider.lua:dyn
function powertrain_genericTorqueProvider_device:velocityUpdate() end

return powertrain_genericTorqueProvider
