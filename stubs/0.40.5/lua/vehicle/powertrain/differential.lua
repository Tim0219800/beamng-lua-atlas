---@meta
-- tim19Atlas stub generated from lua/vehicle/powertrain/differential.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Composant powertrain `differential` : répartit le couple d'entrée sur deux sorties (port 1 et port 2) et calcule la vitesse d'entrée à partir des deux sorties. Plusieurs types (`diffType` du jbeam, modifiables en jeu via setMode) : `open`, `torqueVectoring`, `lsd`, `viscous`, `locked`, `dually`, `activeLock`. Il gère aussi un rapport de couple conique (gearRatio), les pertes par frottement, une limite de vitesse de glissement, l'usure et les dégâts. Un moddeur le déclare dans le jbeam `powertrain` et peut changer son mode ou régler le verrouillage actif (`activeLockCoef`).
--- Accès : type de composant powertrain `differential` (jbeam `powertrain`), accessible par `powertrain.getDevice("nom")`
---@class powertrain_differential
---@field deviceCategories table<string, boolean> {differential=true}.
---@field outputPorts table<integer, boolean> {[1]=true, [2]=true} : deux ports de sortie.
---@field requiredExternalInertiaOutputs table<integer, integer> {1, 2} : les deux sorties reçoivent leur inertie de leurs enfants.
local powertrain_differential = {}

--- Construit le device différentiel : lit gearRatio, frottements, répartition de couple, type(s) de différentiel, paramètres LSD, visqueux, verrouillé et verrouillage actif, puis sélectionne la fonction de couple selon le mode.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/differential.lua:333
---@param jbeamData table Données jbeam du composant.
---@return table  Le device (classe `device`).
function powertrain_differential.new(jbeamData) end

--- Objet renvoyé par new(jbeamData). torqueUpdate est remplacée selon le mode (selectUpdates).
---@class powertrain_differential_device
local powertrain_differential_device = {}

--- Calcule cumulativeInertia (somme pondérée des inerties des deux enfants, divisée par gearRatio²), les rapports cumulés (journalise un message de debug si les deux sorties ont des rapports différents), et les paramètres de verrouillage lockSpring/lockTorque/lockDamp/maxDiffAngle.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/differential.lua:259
function powertrain_differential_device:calculateInertia() end

--- Renvoie l'intégrité 0..1 (0 si isBroken) et la table {damageFrictionCoef, isBroken}.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/differential.lua:163
---@return number  Intégrité 0..1.
---@return table  {damageFrictionCoef, isBroken}.
function powertrain_differential_device:getPartCondition() end

--- Défini seulement s'il y a plusieurs modes. Renvoie stateData avec la clé '<nom>Mode' = mode courant.
---Source : lua/vehicle/powertrain/differential.lua:243
---@return table  stateData.
function powertrain_differential_device:getState() end

--- Remet à zéro vitesses, couples, lisseurs visqueux, diffAngle, activeLockCoef et coefficients d'usure/dégâts ; relit gearRatio et friction du jbeam.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/differential.lua:302
---@param jbeamData table Données jbeam du composant.
function powertrain_differential_device:reset(jbeamData) end

--- Change le mode du différentiel s'il est dans availableModes (liste diffType du jbeam) ; ignoré sinon. Réselectionne torqueUpdate et met à jour le bouton UI. Mode possibles : open, torqueVectoring, lsd, viscous, locked, dually, activeLock.
---Source : lua/vehicle/powertrain/differential.lua:228
---@param mode string Nom du mode.
function powertrain_differential_device:setMode(mode) end

--- Applique l'usure (wearFrictionCoef de 1 à 2 entre 30000 km et 1000 km*1000) et les dégâts (damageFrictionCoef de 1 à 10) selon l'odomètre et l'intégrité (nombre 0..1 ou table).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/differential.lua:141
---@param subSystem any Non utilisé.
---@param odometer number Distance parcourue en mètres.
---@param integrity number|table Nombre 0..1 ou table {damageFrictionCoef, isBroken}.
---@param visual any Non utilisé.
function powertrain_differential_device:setPartCondition(subSystem, odometer, integrity, visual) end

--- Défini seulement s'il y a plusieurs modes. Restaure le mode depuis data['<nom>Mode'] si c'est une chaîne différente du mode actuel.
---Source : lua/vehicle/powertrain/differential.lua:248
---@param data table|nil Table d'état produite par getState.
function powertrain_differential_device:setState(data) end

--- Appelée à chaque pas physique. Calcule le couple d'entrée (couple du parent moins frottements, réduit par la limite de glissement, multiplié par gearRatio) puis outputTorque1/outputTorque2 selon le mode actif (open, lsd, viscous, locked, activeLock).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/differential.lua:102
---@param dt number Pas de temps en secondes (utilisé par lsd, locked, activeLock pour intégrer diffAngle).
function powertrain_differential_device:torqueUpdate(dt) end

--- Si plusieurs modes sont disponibles et uiSimpleModeControl est vrai, met à jour le bouton de l'interface simple avec une icône selon le mode et l'essieu (déduit des mots front, rear, middle, center, transfer du nom).
---Source : lua/vehicle/powertrain/differential.lua:220
function powertrain_differential_device:updateSimpleControlButtons() end

--- Appelée à chaque pas physique : inputAV = (outputAV1 * splitA + outputAV2 * splitB) * gearRatio, écrit dans le champ de vitesse du parent.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/differential.lua:17
function powertrain_differential_device:velocityUpdate() end

return powertrain_differential
