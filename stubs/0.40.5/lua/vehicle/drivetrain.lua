---@meta
-- tim19Atlas stub generated from lua/vehicle/drivetrain.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Couche de compatibilité ascendante : reproduit l'ancienne API `drivetrain` en lisant les périphériques du nouveau système `powertrain` ('mainEngine' et 'gearbox') à chaque frame. Un vieux mod ou script qui lit drivetrain.rpm, drivetrain.gear, drivetrain.torque… continue de fonctionner. Les nouveaux développements devraient utiliser powertrain directement.
--- Accès : globale `drivetrain`
---@class drivetrain
---@field avgAV number Jamais mis à jour.
---@field brake number Jamais mis à jour (reste à 0).
---@field engineAV number|nil Vitesse angulaire du moteur (rad/s) ou nil sans moteur principal.
---@field engineDisabled boolean isDisabled du moteur principal.
---@field engineLoad number engineLoad du moteur principal.
---@field esc table Faux objet ESC de compatibilité : update, updateGFX, toggleESCMode, getCarData valent nop, escPulse = 0.
---@field fuel number Valeur par défaut 100, jamais mise à jour.
---@field fuelCapacity number Valeur par défaut 100, jamais mise à jour.
---@field fuelLeakRate number Débit de fuite de carburant (L/s) ; jamais mis à jour.
---@field fuelUsage number Jamais mis à jour.
---@field gear integer Index de rapport de la boîte ('gearbox').
---@field rpm number Régime moteur en tr/min.
---@field shifterMode integer Toujours 2 (arcade) après updateGFX.
---@field shifterPosition number Jamais mis à jour.
---@field throttle number Copie de electrics.values.throttle.
---@field torque number Couple de sortie du moteur principal (outputTorque1, N·m).
---@field torqueTransmission number Couple de sortie de la boîte (N·m).
---@field wheelCount integer Jamais mis à jour.
drivetrain = {}

--- Appelé à l'init et au reset : assigne M.wheels et remet rpm, engineDisabled, gear, torqueTransmission et engineLoad à zéro.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/drivetrain.lua:66
function drivetrain.init() end

--- Identique à init.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/drivetrain.lua:66
function drivetrain.reset() end

--- Fixe le mode de boîte : mode 2 donne 'arcade', tout autre valeur 'realistic' (controller.mainController.setGearboxMode).
---Source : lua/vehicle/drivetrain.lua:49
---@param v integer 0 manuel, 1 manuel embrayage auto, 2 arcade, 3 automatique réaliste (commentaire du code).
function drivetrain.setShifterMode(v) end

--- Demande un rapport via controller.mainController.shiftToGearIndex.
---Source : lua/vehicle/drivetrain.lua:62
---@param gear integer Index de rapport voulu.
function drivetrain.shiftToGear(gear) end

--- Appelé chaque frame (updateProxy) : recopie l'état du moteur principal et de la boîte dans les champs drivetrain.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/drivetrain.lua:31
function drivetrain.updateGFX() end

