---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/esc.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Contrôleur auxiliaire (type "auxiliary", defaultOrder 50) qui implémente le contrôle de stabilité (ESC) et l'antipatinage (TCS) de la voiture. L'ESC compare le taux de lacet mesuré à un taux de lacet désiré (calculé depuis l'angle des roues avant, la vitesse, une vitesse caractéristique et une accélération latérale max) et freine une roue pour corriger survirage ou sous-virage. Le TCS compare la vitesse de chaque roue motrice à celle de la roue diagonale et réduit la poussée du moteur (facteurs d'accélérateur écrits dans electrics.values) et/ou freine la roue qui patine. Un moddeur s'en sert en déclarant le contrôleur dans le jbeam avec un bloc de configurations, ou le pilote par ses fonctions de mode (toggleESCMode, setESCMode). Il écrit electrics.values.esc, tcs, escActive, tcsActive, hasESC, hasTCS et un ou plusieurs facteurs d'accélérateur (par défaut electrics.values.throttleFactor), qui doivent être lus par le moteur/l'accélérateur pour que le TCS agisse.
--- Accès : contrôleur `esc` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`
---@class controller_esc
---@field calibrationMeasurementReady boolean Vrai quand la mesure de rigidité de calibration est terminée.
---@field calibrationSettled boolean Vrai quand la phase de stabilisation de la calibration est terminée.
---@field debugData table Données pour l'appli de debug : debugData.esc (steeringAngle, yawRate, desiredYawRate, difference, desiredYawRateAcceleration, desiredYawRateSteering, speed) et debugData.tcs (wheelBrakeFactors, wheelSlips, slipThreshold, throttleFactors, allWheelSlips). Seuls yawRate, desiredYawRate, difference et les champs tcs sont mis à jour ; steeringAngle, desiredYawRateAcceleration/Steering et speed restent à 0.
---@field defaultOrder number Ordre d'exécution par défaut du contrôleur (50).
---@field doMeasure boolean À mettre à true pour lancer la phase de mesure de la calibration (3500 pas) ; repasse à false à la fin.
---@field doSettle boolean À mettre à true pour lancer la phase de stabilisation de la calibration (1500 pas) ; repasse à false à la fin.
---@field isExisting boolean Toujours true : sert de marqueur indiquant qu'un ESC existe.
---@field pauseESCAction boolean Si vrai, l'ESC ne freine plus et le TCS est traité comme désactivé. Remis à false à initSecondStage.
---@field stiffnessFront number Rigidité de dérive moyenne estimée de l'essieu avant par la calibration.
---@field stiffnessRear number Rigidité de dérive moyenne estimée de l'essieu arrière par la calibration.
---@field type string Toujours "auxiliary".
---@field wheelAngleFront number Angle de braquage réel des roues avant (rad), mis à jour à chaque pas.
---@field wheelAngleRear number Angle de braquage réel des roues arrière (rad), mis à jour à chaque pas.
local controller_esc = {}

--- Restaure la configuration à partir de serialize().
---Source : lua/vehicle/controller/esc.lua:1062
---@param data table|nil Table renvoyée par serialize.
function controller_esc.deserialize(data) end

--- Renvoie la géométrie calculée du véhicule, ou nil si la masse est nulle.
---Source : lua/vehicle/controller/esc.lua:621
---@return table|nil  {wheels, frontLeftWheelId, frontRightWheelId, rearLeftWheelId, rearRightWheelId, wheelBase (m), trackWidth (m), distanceCOGRearAxle (m), distanceCOGFrontAxle (m), mass (kg)}
function controller_esc.getCarData() end

--- Renvoie la table de la configuration ESC courante (champs sanitisés, avec name).
---Source : lua/vehicle/controller/esc.lua:640
---@return table|nil  Configuration courante ; nil si pas d'ESC.
function controller_esc.getCurrentConfigData() end

--- Renvoie la table d'état (clé "<nomContrôleur>ConfigKey" = indice courant) pour la sauvegarde/synchronisation du véhicule.
---Source : lua/vehicle/controller/esc.lua:1068
---@return table  Table d'état partagée (réutilisée).
function controller_esc.getState() end

--- Mémorise les données jbeam, crée la table d'état pour la sauvegarde et réinitialise la couleur de LED. Appelé par le chargement des contrôleurs.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/esc.lua:820
---@param jbeamData table Données du contrôleur dans le jbeam (voir notes).
function controller_esc.init(jbeamData) end

--- Construit les caches de roues, identifie par géométrie les roues avant/arrière gauche/droite, charge et trie les configurations, calcule empattement, répartition de masse, vitesse caractéristique, enregistre l'entrée du menu radial et installe updateWheelsIntermediate et updateGFX. Appelé après l'init de tous les contrôleurs.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/esc.lua:828
function controller_esc.initSecondStage() end

--- Passe à la configuration suivante, sans boucler (reste sur la dernière).
---Source : lua/vehicle/controller/esc.lua:715
function controller_esc.nextESCMode() end

--- Passe à la configuration précédente, sans boucler (reste sur la première).
---Source : lua/vehicle/controller/esc.lua:720
function controller_esc.previousESCMode() end

--- Renvoie l'état à sauvegarder : l'indice de configuration courant.
---Source : lua/vehicle/controller/esc.lua:1058
---@return table  {escConfigKey = integer}
function controller_esc.serialize() end

--- Active la configuration d'indice key (retombe à 1 si key dépasse le nombre de configurations), recalcule les valeurs précalculées et affiche un message d'interface sauf si silent. Ne fait rien si le véhicule n'a pas d'ESC ou a perdu une roue.
---Source : lua/vehicle/controller/esc.lua:684
---@param key integer Indice 1..n dans la liste de configurations triée par order.
---@param silent boolean|nil Si vrai, pas de message guihooks.
function controller_esc.setESCMode(key, silent) end

--- Applique un état renvoyé par getState si l'indice est un entier valide et différent de l'actuel (sans message).
---Source : lua/vehicle/controller/esc.lua:1075
---@param data table|nil Table d'état.
function controller_esc.setState(data) end

--- Remet à zéro les compteurs et résultats de calibration puis active le calcul de rigidité de dérive à chaque pas (à utiliser avec doMeasure/doSettle).
---Source : lua/vehicle/controller/esc.lua:603
function controller_esc.startESCCalibration() end

--- Désactive le calcul de calibration.
---Source : lua/vehicle/controller/esc.lua:617
function controller_esc.stopESCCalibration() end

--- Passe à la configuration ESC suivante ; après la dernière, revient à la première. Appelé par le bouton de l'interface.
---Source : lua/vehicle/controller/esc.lua:709
function controller_esc.toggleESCMode() end

--- Fait clignoter les voyants esc/tcs (période 0.15 s quand actifs), écrit electrics.values.esc/tcs/escActive/tcsActive et remplit debugData. Défini dynamiquement par initSecondStage. (assignée dynamiquement)
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/esc.lua:dyn
---@param dt number Pas de temps graphique en secondes.
function controller_esc.updateGFX(dt) end

--- Force la (re)création du bouton « ESC & TC » dans le panneau de contrôle simplifié du groupe motopropulseur (ui_simplePowertrainControl), avec la couleur de la configuration courante.
---Source : lua/vehicle/controller/esc.lua:147
function controller_esc.updateSimpleControlButtons() end

--- Boucle ESC + TCS + décision à chaque pas physique (voir notes du module). Défini dynamiquement par initSecondStage. (assignée dynamiquement)
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/esc.lua:dyn
---@param dt number Pas de temps en secondes.
function controller_esc.updateWheelsIntermediate(dt) end

return controller_esc
