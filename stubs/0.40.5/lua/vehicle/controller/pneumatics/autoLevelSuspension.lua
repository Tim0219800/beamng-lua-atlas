---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/pneumatics/autoLevelSuspension.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Contrôleur auxiliaire de suspension pneumatique à mise à niveau automatique (defaultOrder 80). Pour chaque « groupe de contrôle » (une poutre de mesure + un ou plusieurs groupes de poutres d'airbags), il compare la longueur mesurée de la poutre à une longueur cible et ouvre/ferme les vannes de l'actuateur (contrôleur « airbags » par défaut) en proportion de l'écart. Un moddeur l'utilise pour régler la hauteur de caisse (setTargetLength), la monter/descendre manuellement (setAdjustmentRate) ou suspendre temporairement la régulation.
--- Accès : contrôleur `pneumatics/autoLevelSuspension` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`
---@class controller_pneumatics_autoLevelSuspension
---@field defaultOrder number Ordre d'exécution (80).
---@field type string "auxiliary".
local controller_pneumatics_autoLevelSuspension = {}

--- Débit moyen d'air dans les groupes de poutres de l'actuateur pour ce groupe.
---Source : lua/vehicle/controller/pneumatics/autoLevelSuspension.lua:113
---@param groupName string Nom du groupe.
---@return number  Débit moyen (unité de l'actuateur).
function controller_pneumatics_autoLevelSuspension.getAverageFlowRate(groupName) end

--- Renvoie la dernière longueur mesurée de la poutre de contrôle (0 et log E si inconnu).
---Source : lua/vehicle/controller/pneumatics/autoLevelSuspension.lua:104
---@param groupName string Nom du groupe.
---@return number  Longueur en m.
function controller_pneumatics_autoLevelSuspension.getCurrentLength(groupName) end

--- État sauvegardable : longueur cible et taux d'ajustement de chaque groupe (clés préfixées par le nom du contrôleur).
---Source : lua/vehicle/controller/pneumatics/autoLevelSuspension.lua:294
---@return table  Table d'état (réutilisée entre appels).
function controller_pneumatics_autoLevelSuspension.getState() end

--- Renvoie la longueur cible d'un groupe (0 et log E si inconnu).
---Source : lua/vehicle/controller/pneumatics/autoLevelSuspension.lua:95
---@param groupName string Nom du groupe.
---@return number  Longueur cible en m.
function controller_pneumatics_autoLevelSuspension.getTargetLength(groupName) end

--- Construit les groupes de contrôle à partir de la section jbeam actuatorGroups et lit les paramètres d'actuation.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/pneumatics/autoLevelSuspension.lua:213
---@param jbeamData table Données jbeam du contrôleur.
function controller_pneumatics_autoLevelSuspension.init(jbeamData) end

--- Récupère le contrôleur d'actuateur (jbeam actuatorName, « airbags » par défaut). Appelé après l'init de tous les contrôleurs.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/pneumatics/autoLevelSuspension.lua:282
---@param jbeamData table Données jbeam.
function controller_pneumatics_autoLevelSuspension.initSecondStage(jbeamData) end

--- Vrai tant que le groupe est en calibration initiale (1.5 s).
---Source : lua/vehicle/controller/pneumatics/autoLevelSuspension.lua:131
---@param groupName string Nom du groupe.
---@return boolean  En calibration ?
function controller_pneumatics_autoLevelSuspension.isCalibrating(groupName) end

--- Vrai si la valeur absolue du débit moyen dépasse 1e-4.
---Source : lua/vehicle/controller/pneumatics/autoLevelSuspension.lua:122
---@param groupName string Nom du groupe.
---@return boolean  Le groupe bouge ?
function controller_pneumatics_autoLevelSuspension.isMoving(groupName) end

--- Remet cibles, longueurs, timers et vitesses d'ajustement à zéro ; relance la calibration des groupes sans defaultTargetLength.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/pneumatics/autoLevelSuspension.lua:196
function controller_pneumatics_autoLevelSuspension.reset() end

--- Force un ajustement manuel de la hauteur : l'état de vanne est imposé à rate (-1 descend, 1 monte).
---Source : lua/vehicle/controller/pneumatics/autoLevelSuspension.lua:53
---@param groupNames string|table<integer, string> Groupe(s) de contrôle.
---@param rate number Taux -1..1 (borné).
function controller_pneumatics_autoLevelSuspension.setAdjustmentRate(groupNames, rate) end

--- Obsolète (log W) : équivaut à setAdjustmentRate(groupes, -1) puis stopAdjusting(groupes, true).
---Source : lua/vehicle/controller/pneumatics/autoLevelSuspension.lua:76
---@param groupNames string|table<integer, string> Groupe(s).
---@param decrease boolean Descendre (true) ou arrêter (false).
function controller_pneumatics_autoLevelSuspension.setMomentaryDecrease(groupNames, decrease) end

--- Obsolète (log W) : équivaut à setAdjustmentRate(groupes, 1) puis stopAdjusting(groupes, true).
---Source : lua/vehicle/controller/pneumatics/autoLevelSuspension.lua:67
---@param groupNames string|table<integer, string> Groupe(s).
---@param increase boolean Monter (true) ou arrêter (false).
function controller_pneumatics_autoLevelSuspension.setMomentaryIncrease(groupNames, increase) end

--- Restaure cibles et taux d'ajustement (valeurs NaN ou non numériques ignorées).
---Source : lua/vehicle/controller/pneumatics/autoLevelSuspension.lua:302
---@param data table|nil Table produite par getState.
function controller_pneumatics_autoLevelSuspension.setState(data) end

--- Fixe la longueur cible (m) des groupes ; avec immediate vrai, la régulation démarre sans attendre actuationDelay.
---Source : lua/vehicle/controller/pneumatics/autoLevelSuspension.lua:85
---@param groupNames string|table<integer, string> Groupe(s) de contrôle.
---@param targetLength number Longueur cible de la poutre de mesure en m.
---@param immediate boolean|nil Contourner le délai d'actuation.
function controller_pneumatics_autoLevelSuspension.setTargetLength(groupNames, targetLength, immediate) end

--- Suspend (true) ou reprend (false) la régulation automatique des groupes ; vannes fermées pendant la suspension.
---Source : lua/vehicle/controller/pneumatics/autoLevelSuspension.lua:47
---@param groupNames string|table<integer, string> Groupe(s) de contrôle.
---@param disabled boolean Suspendre ?
function controller_pneumatics_autoLevelSuspension.setTemporarilyDisabled(groupNames, disabled) end

--- Arrête l'ajustement manuel ; avec commitNewHeight vrai la longueur courante devient la nouvelle cible.
---Source : lua/vehicle/controller/pneumatics/autoLevelSuspension.lua:60
---@param groupNames string|table<integer, string> Groupe(s) de contrôle.
---@param commitNewHeight boolean|nil Mémoriser la hauteur atteinte comme cible.
function controller_pneumatics_autoLevelSuspension.stopAdjusting(groupNames, commitNewHeight) end

--- Pas physique : pour chaque groupe, calibre, applique un ajustement manuel ou régule vers la longueur cible via actuator.setBeamGroupsValveState.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/pneumatics/autoLevelSuspension.lua:140
---@param dt number Pas physique en secondes.
function controller_pneumatics_autoLevelSuspension.updateFixedStep(dt) end

return controller_pneumatics_autoLevelSuspension
