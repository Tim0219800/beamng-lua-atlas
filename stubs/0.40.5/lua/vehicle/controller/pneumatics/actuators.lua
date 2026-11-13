---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/pneumatics/actuators.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Contrôleur auxiliaire (type "auxiliary", defaultOrder 50) de vérins pneumatiques avec physique de gaz simplifiée : un réservoir d'air (energyStorage) alimente, via des vannes, des « tampons virtuels » (cross-flow groups) puis les poutres pressurées d'un groupe. Les débits dépendent des différences de pression et des sections de passage, l'énergie de l'air est conservée (PV = e) et la consommation d'air vide le réservoir. Une vanne par groupe (valveState -1..1) ouvre l'admission (> 0) ou l'échappement ; elle peut être lue depuis une valeur electrics. Il joue aussi des sons selon le débit.
--- Accès : contrôleur `pneumatics/actuators` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`
---@class controller_pneumatics_actuators
---@field defaultOrder number 50.
---@field type string "auxiliary".
local controller_pneumatics_actuators = {}

--- Renvoie le débit moyen vers les poutres d'un groupe (m³/s ; 0 si introuvable).
---Source : lua/vehicle/controller/pneumatics/actuators.lua:210
---@param groupName string Nom du groupe.
---@return number  Débit moyen.
function controller_pneumatics_actuators.getAverageFlowRate(groupName) end

--- Renvoie la pression moyenne des poutres d'un groupe (Pa absolus ; 0 si introuvable).
---Source : lua/vehicle/controller/pneumatics/actuators.lua:219
---@param groupName string Nom du groupe.
---@return number  Pression moyenne.
function controller_pneumatics_actuators.getAveragePressure(groupName) end

--- Renvoie la moyenne des débits moyens de plusieurs groupes.
---Source : lua/vehicle/controller/pneumatics/actuators.lua:228
---@param groupNames string[] Noms de groupes.
---@return number  Débit moyen (0 si liste vide).
function controller_pneumatics_actuators.getBeamGroupsAverageFlowRate(groupNames) end

--- Renvoie l'état de la vanne d'un groupe (0 si introuvable).
---Source : lua/vehicle/controller/pneumatics/actuators.lua:201
---@param groupName string Nom du groupe.
---@return number  État de vanne -1..1.
function controller_pneumatics_actuators.getValveState(groupName) end

--- Construit groupes de poutres, tampons virtuels et paramètres de débit à partir du jbeam et retrouve le réservoir d'air.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/pneumatics/actuators.lua:528
---@param jbeamData table Données jbeam du contrôleur.
function controller_pneumatics_actuators.init(jbeamData) end

--- Crée les sources sonores d'augmentation/diminution de débit pour chaque groupe. Appelé par le gestionnaire de contrôleurs.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/pneumatics/actuators.lua:683
---@param jbeamData table Données jbeam du contrôleur.
function controller_pneumatics_actuators.initSounds(jbeamData) end

--- Remet pressions, énergies stockées, vannes et tampons virtuels à leur état initial.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/pneumatics/actuators.lua:500
function controller_pneumatics_actuators.reset() end

--- Coupe le volume des sons et réinitialise leur état.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/pneumatics/actuators.lua:717
function controller_pneumatics_actuators.resetSounds() end

--- Change le tampon virtuel (cross-flow group) auquel un groupe est relié ; réinitialise le tampon si le groupe est le premier à l'utiliser.
---Source : lua/vehicle/controller/pneumatics/actuators.lua:169
---@param groupName string Nom du groupe.
---@param crossFlowTag string Nom du tampon virtuel.
function controller_pneumatics_actuators.setBeamGroupCrossFlowTag(groupName, crossFlowTag) end

--- Fixe la pression d'alimentation maximale d'un groupe.
---Source : lua/vehicle/controller/pneumatics/actuators.lua:154
---@param groupName string Nom du groupe.
---@param maxSupplyPressure number Pression absolue maximale (Pa).
function controller_pneumatics_actuators.setBeamGroupMaximumSupplyPressure(groupName, maxSupplyPressure) end

--- Fixe l'état de la vanne d'un groupe.
---Source : lua/vehicle/controller/pneumatics/actuators.lua:122
---@param groupName string Nom du groupe.
---@param valveState number -1..1 ; > 0 admission, <= 0 échappement ; la valeur absolue règle l'ouverture.
function controller_pneumatics_actuators.setBeamGroupValveState(groupName, valveState) end

--- Même chose pour plusieurs groupes.
---Source : lua/vehicle/controller/pneumatics/actuators.lua:163
---@param groupNames string[] Noms de groupes.
---@param maxSupplyPressure number Pression absolue maximale (Pa).
function controller_pneumatics_actuators.setBeamGroupsMaximumSupplyPressure(groupNames, maxSupplyPressure) end

--- Même chose pour plusieurs groupes.
---Source : lua/vehicle/controller/pneumatics/actuators.lua:131
---@param groupNames string[] Noms de groupes.
---@param valveState number -1..1.
function controller_pneumatics_actuators.setBeamGroupsValveState(groupNames, valveState) end

--- Bascule la vanne entre 1 (admission) et -1 (échappement) : si l'état courant est < 0 elle passe à 1, sinon à -1.
---Source : lua/vehicle/controller/pneumatics/actuators.lua:137
---@param groupName string Nom du groupe.
function controller_pneumatics_actuators.toggleBeamGroupValveState(groupName) end

--- Même chose pour plusieurs groupes.
---Source : lua/vehicle/controller/pneumatics/actuators.lua:148
---@param groupNames string[] Noms de groupes.
function controller_pneumatics_actuators.toggleBeamGroupsValveState(groupNames) end

--- Chaque pas physique : calcule les débits réservoir -> tampons -> poutres, met à jour pressions et énergie du réservoir, applique les pressions aux poutres.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/pneumatics/actuators.lua:243
---@param dt number Pas de temps (s).
function controller_pneumatics_actuators.updateFixedStep(dt) end

--- Chaque image : gère les sons selon le débit, remet à zéro les énergies par tick, écrit la pression moyenne relative dans electrics et trace les graphes de debug.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/pneumatics/actuators.lua:415
---@param dt number Pas de temps (s).
function controller_pneumatics_actuators.updateGFX(dt) end

return controller_pneumatics_actuators
