---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/playerController.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Contrôleur principal (type "main", defaultOrder 500) du véhicule « unicycle » utilisé pour le joueur à pied (mode marche). Le personnage est une boule physique (nœuds tag "ball") sur laquelle un torque propulse le joueur, avec des forces de stabilisation par PID qui gardent le corps vertical et le tournent vers la direction de la caméra. Il gère marche, sprint, saut, accroupissement (pression de la boule), blocage de la boule à l'arrêt et gel. Il implémente aussi, en nop, l'API obligatoire des contrôleurs principaux (boîte de vitesses, démarreur...) pour être interchangeable avec un contrôleur de véhicule.
--- Accès : contrôleur `playerController` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`
---@class controller_playerController
---@field brake number Toujours 0.
---@field clutchRatio number Toujours 0.
---@field cycleGearboxModes function nop.
---@field defaultOrder number Ordre par défaut (500).
---@field engineInfo table Tableau de 21 valeurs statiques (index 14 = "manual", index 15 = id de l'objet véhicule, index 18 = 1) compatible avec le format d'info moteur des autres contrôleurs principaux.
---@field fireEngineTemperature number Toujours 0 (API de contrôleur principal).
---@field sendTorqueData function nop.
---@field setAggressionOverride function nop.
---@field setDefaultForwardMode function nop.
---@field setEngineIgnition function nop.
---@field setGearboxMode function nop.
---@field setStarter function nop.
---@field shiftDown function nop.
---@field shiftToGearIndex function nop.
---@field shiftUp function nop (API principale obligatoire).
---@field smartParkingBrake function nop.
---@field throttle number Toujours 0.
---@field type string "main" (contrôleur principal obligatoire pour ce véhicule).
---@field vehicleActivated function nop.
local controller_playerController = {}

--- Value < 0 : s'accroupit (réduit la pression de la boule à ballPressureCrouch) ; value > 0 : relève progressivement.
---Source : lua/vehicle/controller/playerController.lua:428
---@param value number Valeur d'entrée ; seul le signe compte.
function controller_playerController.crouch(value) end

--- Dessine les vecteurs de debug stockés dans debugVectors (vide en pratique).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/playerController.lua:143
---@param focusPos vec3 Position de focus (non utilisée).
function controller_playerController.debugDraw(focusPos) end

--- Lit les paramètres jbeam, repère nœuds et poutres de stabilisation, de boule et de verrouillage, active le suivi mapmgr et désactive la mise en veille physique du véhicule.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/playerController.lua:480
---@param jbeamData table Données jbeam du contrôleur (voir notes).
function controller_playerController.init(jbeamData) end

--- Déclenche un saut si le personnage touche le sol, hors délai de 0.5 s et hors gel.
---Source : lua/vehicle/controller/playerController.lua:417
---@param value number Valeur d'entrée (non utilisée).
function controller_playerController.jump(value) end

--- Appelé par le moteur à chaque particule de collision d'un nœud ; estime la vitesse du joueur à partir de la vitesse de la boule et du glissement.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/playerController.lua:149
---@param p table Particule physique (champs slipVec, nodeVel, id1).
function controller_playerController.nodeCollision(p) end

--- Remet à zéro gel, verrouillage, accroupissement, vecteur de marche, forces et PID.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/playerController.lua:455
function controller_playerController.reset() end

--- Fournit l'orientation de la caméra qui détermine direction de marche et direction de regard.
---Source : lua/vehicle/controller/playerController.lua:556
---@param controlData table Table avec cameraRotation (quat).
function controller_playerController.setCameraControlData(controlData) end

--- Gèle ou dégèle le personnage (plus de déplacement, saut ni accroupissement).
---Source : lua/vehicle/controller/playerController.lua:451
---@param mode integer 1 = gelé, toute autre valeur = libre.
function controller_playerController.setFreeze(mode) end

--- Fixe le coefficient de vitesse (0 marche, 1 sprint).
---Source : lua/vehicle/controller/playerController.lua:409
---@param value number 0 à 1.
function controller_playerController.setSpeedCoef(value) end

--- Alterne accroupi/debout.
---Source : lua/vehicle/controller/playerController.lua:442
function controller_playerController.toggleCrouch() end

--- Inverse le coefficient de vitesse (1 - valeur).
---Source : lua/vehicle/controller/playerController.lua:413
function controller_playerController.toggleSpeedCoef() end

--- Chaque pas physique : applique forces de stabilisation, forces de lacet, torque de propulsion de la boule et force de saut.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/playerController.lua:170
---@param dt number Pas de temps (s).
function controller_playerController.update(dt) end

--- Pas fixe : calcule inclinaison, PID de stabilisation et de lacet, torque de propulsion selon la vitesse désirée et gère le verrouillage de la boule.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/playerController.lua:249
---@param dt number Pas de temps (s).
function controller_playerController.updateFixedStep(dt) end

--- Chaque image : détecte contact sol/eau, gère la remontée de pression après accroupissement, décrémente le délai de saut et écrit electrics.values.gearboxMode et freezeState.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/playerController.lua:360
---@param dt number Pas de temps graphique (s).
function controller_playerController.updateGFX(dt) end

--- Ajoute à la composante gauche/droite (pour combiner plusieurs touches).
---Source : lua/vehicle/controller/playerController.lua:397
---@param value number Incrément.
function controller_playerController.walkLeftRight(value) end

--- Fixe la composante gauche/droite de la marche (+1 = droite).
---Source : lua/vehicle/controller/playerController.lua:393
---@param value number -1 à 1.
function controller_playerController.walkLeftRightRaw(value) end

--- Ajoute à la composante avant/arrière.
---Source : lua/vehicle/controller/playerController.lua:405
---@param value number Incrément.
function controller_playerController.walkUpDown(value) end

--- Fixe la composante avant/arrière de la marche (+1 = avant).
---Source : lua/vehicle/controller/playerController.lua:401
---@param value number -1 à 1.
function controller_playerController.walkUpDownRaw(value) end

return controller_playerController
