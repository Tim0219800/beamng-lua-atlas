---@meta
-- tim19Atlas stub generated from lua/vehicle/powertrain/sequentialGearbox.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Composant powertrain `sequentialGearbox` : boîte séquentielle (type course) dont le rapport ne peut changer que d'un cran à la fois (plus un, moins un). Pas de synchroniseurs ni de craquement : le passage de vitesse prend effet à la mise à jour par image suivante (updateGFX). Comme manualGearbox, le parent doit être un embrayage. Gère le neutre (masse virtuelle), le verrouillage (setLock), l'usure/dégâts et des sons d'engrenage de type « droit » (straight-cut). Un contrôleur de boîte séquentielle appelle setGearIndex.
--- Accès : type de composant powertrain `sequentialGearbox` (jbeam `powertrain`), accessible par `powertrain.getDevice("nom")`
---@class powertrain_sequentialGearbox
---@field deviceCategories table<string, boolean> {gearbox=true}.
---@field outputPorts table<integer, boolean> {[1]=true}.
---@field requiredExternalInertiaOutputs table<integer, integer> {1}.
local powertrain_sequentialGearbox = {}

--- Construit la boîte séquentielle : table des rapports avant et arrière, coefficients de bruit d'engrenage, nœud de la transmission, puis passe au neutre.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/sequentialGearbox.lua:306
---@param jbeamData table Données jbeam du composant (gearRatios obligatoire).
---@return table  Le device (classe `device`).
function powertrain_sequentialGearbox.new(jbeamData) end

--- Objet renvoyé par new(jbeamData). velocityUpdate/torqueUpdate dépendent du rapport (normal ou neutre).
---@class powertrain_sequentialGearbox_device
local powertrain_sequentialGearbox_device = {}

--- Augmente le coefficient de frottement de dégâts (0.01 de dégât = +0.1).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/sequentialGearbox.lua:146
---@param damageAmount number Quantité de dégâts du groupe de déformation.
function powertrain_sequentialGearbox_device:applyDeformGroupDamage(damageAmount) end

--- Prend l'inertie et les rapports cumulés du premier enfant ; cumulativeInertia = inertie / gearRatio² (2 * maxGearRatio si neutre).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/sequentialGearbox.lua:216
function powertrain_sequentialGearbox_device:calculateInertia() end

--- Renvoie l'intégrité 0..1 (0 si cassée) et {damageFrictionCoef, isBroken}.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/sequentialGearbox.lua:165
---@return number  Intégrité 0..1.
---@return table  État sauvegardable.
function powertrain_sequentialGearbox_device:getPartCondition() end

--- Crée les boucles sonores d'engrenage (entrée et sortie), les lisseurs et les coefficients de hauteur, et règle le paramètre FMOD c_gearboxMaxPower.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/sequentialGearbox.lua:247
---@param jbeamData table Données jbeam du composant.
function powertrain_sequentialGearbox_device:initSounds(jbeamData) end

--- Marque la boîte comme cassée et passe en mode neutre (masse virtuelle).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/sequentialGearbox.lua:134
function powertrain_sequentialGearbox_device:onBreak() end

--- Réinitialise l'état (vitesses, couple, coefficients, verrouillage) et repasse au neutre.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/sequentialGearbox.lua:281
---@param jbeamData table Données jbeam du composant.
function powertrain_sequentialGearbox_device:reset(jbeamData) end

--- Remet à zéro les lisseurs et valeurs de son d'engrenage.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/sequentialGearbox.lua:235
function powertrain_sequentialGearbox_device:resetSounds() end

--- Demande un rapport. Le rapport est borné à ±1 cran autour du rapport courant et à [minGearIndex, maxGearIndex]. Depuis le neutre, il est appliqué immédiatement ; sinon différé à la prochaine updateGFX.
---Source : lua/vehicle/powertrain/sequentialGearbox.lua:112
---@param index integer Indice de rapport voulu (0 neutre, >0 avant, <0 arrière).
function powertrain_sequentialGearbox_device:setGearIndex(index) end

--- Verrouille (lockCoef = 0) ou déverrouille (1) la transmission et propage l'appel au parent s'il a setLock.
---Source : lua/vehicle/powertrain/sequentialGearbox.lua:139
---@param enabled boolean true pour verrouiller.
function powertrain_sequentialGearbox_device:setLock(enabled) end

--- Applique l'usure (odomètre, coefficient de 1 à 2) et les dégâts (intégrité nombre 0..1 ou table) ; appelle onBreak si isBroken.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/sequentialGearbox.lua:150
---@param subSystem any Non utilisé.
---@param odometer number Distance parcourue en mètres.
---@param integrity number|table Nombre 0..1 ou table {damageFrictionCoef, isBroken}.
---@param visual any Non utilisé.
function powertrain_sequentialGearbox_device:setPartCondition(subSystem, odometer, integrity, visual) end

--- Appelée à chaque pas physique : outputTorque1 = (couple parent - frottements) * gearRatio * lockCoef, et alimente les lisseurs de son. Au neutre, intègre la masse virtuelle et met le couple de sortie à 0.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/sequentialGearbox.lua:71
---@param dt number Pas de temps en secondes (utilisé au neutre).
function powertrain_sequentialGearbox_device:torqueUpdate(dt) end

--- Mise à jour par image : applique le changement de rapport en attente (targetGearIndex), met à jour gearRatio, invMaxExpectedOutputTorque et l'inertie du groupe motopropulseur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/sequentialGearbox.lua:95
---@param dt number Durée de l'image en secondes (inutilisé).
function powertrain_sequentialGearbox_device:updateGFX(dt) end

--- Met à jour volume et hauteur des boucles sonores d'engrenage (entrée et sortie) d'après vitesses et couples lissés. Appelée à chaque image.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/sequentialGearbox.lua:19
---@param dt number Durée de l'image en secondes.
function powertrain_sequentialGearbox_device:updateSounds(dt) end

--- Vérifie que le parent est un embrayage (ou un faux), sinon journalise des erreurs et renvoie false. Détermine transmissionNodeID et les valeurs attendues (couple, vitesse, puissance max) pour normaliser les sons.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/sequentialGearbox.lua:174
---@return boolean  false si le parent n'est pas un embrayage.
function powertrain_sequentialGearbox_device:validate() end

--- Appelée à chaque pas physique : inputAV = outputAV1 * gearRatio * lockCoef (ou masse virtuelle au neutre), écrit dans le parent.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/sequentialGearbox.lua:66
---@param dt number Pas de temps en secondes (inutilisé).
function powertrain_sequentialGearbox_device:velocityUpdate(dt) end

return powertrain_sequentialGearbox
