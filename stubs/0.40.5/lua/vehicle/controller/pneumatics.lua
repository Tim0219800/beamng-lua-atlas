---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/pneumatics.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Contrôleur auxiliaire de suspension/vérins pneumatiques simples (type "auxiliary") : il pilote la pression de poutres « pressurées » (obj:setBeamPressureRel) regroupées en groupes nommés, avec niveaux de pression nommés (minPressure, maxPressure, defaultPressure…), vitesses de montée/descente et sons de gonflage/dégonflage. Contrairement à pneumatics/actuators, aucune physique de gaz ni réservoir n'est modélisée : la pression suit simplement la cible à vitesse limitée. Les fonctions publiques s'appellent depuis des entrées ou d'autres contrôleurs avec une liste de noms de groupes.
--- Accès : contrôleur `pneumatics` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`
---@class controller_pneumatics
---@field type string "auxiliary".
local controller_pneumatics = {}

--- Construit les groupes de poutres à partir des tables jbeam et des niveaux de pression.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/pneumatics.lua:245
---@param jbeamData table Données jbeam du contrôleur.
function controller_pneumatics.init(jbeamData) end

--- Crée les sources sonores de montée/descente de chaque groupe. Appelé par le gestionnaire de contrôleurs.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/pneumatics.lua:317
---@param jbeamData table Données jbeam du contrôleur.
function controller_pneumatics.initSounds(jbeamData) end

--- Indique si toutes les poutres d'un groupe sont exactement au niveau de pression nommé.
---Source : lua/vehicle/controller/pneumatics.lua:167
---@param groupName string Nom du groupe.
---@param levelName string Nom du niveau (ex. "maxPressure").
---@return boolean  Vrai si le groupe est à ce niveau ; false aussi si le groupe n'existe pas.
function controller_pneumatics.isBeamGroupAtPressureLevel(groupName, levelName) end

--- Remet toutes les poutres à leur pression par défaut.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/pneumatics.lua:235
function controller_pneumatics.reset() end

--- Coupe le volume des sons et réinitialise leur état.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/pneumatics.lua:344
function controller_pneumatics.resetSounds() end

--- Cible la pression par défaut (defaultPressure) des groupes.
---Source : lua/vehicle/controller/pneumatics.lua:104
---@param groupNames string[] Noms de groupes de poutres (groupName de la table des poutres sous pression).
function controller_pneumatics.setBeamDefault(groupNames) end

--- Cible la pression maximale (maxPressure) des groupes.
---Source : lua/vehicle/controller/pneumatics.lua:100
---@param groupNames string[] Noms de groupes de poutres (groupName de la table des poutres sous pression).
function controller_pneumatics.setBeamMax(groupNames) end

--- Cible la pression minimale (minPressure) des groupes.
---Source : lua/vehicle/controller/pneumatics.lua:96
---@param groupNames string[] Noms de groupes de poutres (groupName de la table des poutres sous pression).
function controller_pneumatics.setBeamMin(groupNames) end

--- Active/désactive la diminution continue de pression des groupes ; désactive l'augmentation.
---Source : lua/vehicle/controller/pneumatics.lua:147
---@param groupNames string[] Noms de groupes de poutres (groupName de la table des poutres sous pression).
---@param enabled boolean Vrai pour diminuer.
function controller_pneumatics.setBeamMomentaryDecrease(groupNames, enabled) end

--- Active/désactive l'augmentation continue de pression des groupes (tant que enabled est vrai) ; désactive la diminution.
---Source : lua/vehicle/controller/pneumatics.lua:127
---@param groupNames string[] Noms de groupes de poutres (groupName de la table des poutres sous pression).
---@param enabled boolean Vrai pour augmenter.
function controller_pneumatics.setBeamMomentaryIncrease(groupNames, enabled) end

--- Fixe directement la pression cible des groupes, bornée par le min et le max de chaque poutre.
---Source : lua/vehicle/controller/pneumatics.lua:61
---@param groupNames string[] Noms de groupes de poutres (groupName de la table des poutres sous pression).
---@param pressure number Pression cible en PSI.
function controller_pneumatics.setBeamPressure(groupNames, pressure) end

--- Cible un niveau de pression nommé (clé de poutre, ex. "maxPressure" ou un niveau défini dans pressureLevels).
---Source : lua/vehicle/controller/pneumatics.lua:90
---@param groupNames string[] Noms de groupes de poutres (groupName de la table des poutres sous pression).
---@param pressureName string Nom du niveau de pression.
function controller_pneumatics.setBeamPressureLevel(groupNames, pressureName) end

--- Pour chaque groupe : passe au minimum si tout est au maximum, sinon au maximum.
---Source : lua/vehicle/controller/pneumatics.lua:108
---@param groupNames string[] Noms de groupes de poutres (groupName de la table des poutres sous pression).
function controller_pneumatics.toggleBeamMinMax(groupNames) end

--- Chaque image : applique les augmentations/diminutions momentanées, fait avancer la pression courante vers la cible à vitesse limitée et gère l'arrêt des sons.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/pneumatics.lua:181
---@param dt number Pas de temps (s).
function controller_pneumatics.updateGFX(dt) end

return controller_pneumatics
