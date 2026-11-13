---@meta
-- tim19Atlas stub generated from lua/vehicle/wheels.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Gère toutes les roues du véhicule côté Lua : table des roues (wheels), des rotors (rotators) et de l'ensemble des deux (wheelRotators), lecture de leurs vitesses angulaires depuis le noyau physique, calcul des couples de freinage (frein de service + frein de stationnement), ABS (modes realistic / arcade / off, avec vitesse air virtuelle), thermique des freins (température de surface/coeur, fading, glaçage des plaquettes, fumée, lueur), crevaisons, bruit de freins et suivi de dégâts. Un moddeur lit surtout M.wheels[i] pour connaître la vitesse, le glissement, la charge ou la température d'une roue, ou appelle setABSBehavior / scaleBrakeTorque / setWheelBrakeUpdate pour modifier le freinage.
--- Accès : globale `wheels`
---@class wheels
---@field brakeSurfaceTempOverride number|nil Si non nil, impose la température de surface (°C) de tous les freins dans la simulation thermique. nil par défaut.
---@field rotatorCount integer Nombre de rotors intacts.
---@field rotatorIDs table<string, integer> Nom de rotor -> wheelID.
---@field rotators table<integer, table> Éléments de type 'rotator' (rotors sans pneu comme des hélices ou disques), indices 0..rotatorCount-1.
---@field wheelCount integer Nombre de roues intactes de type wheel (décrémenté quand un axe casse).
---@field wheelIDs table<string, integer> Nom de roue -> wheelID pour les wheels.
---@field wheelPower number Puissance totale transmise aux roues en W (somme propulsionTorque*angularVelocity des roues intactes), recalculée à chaque updateGFX.
---@field wheelRotatorCount integer Nombre total de roues et rotors reconnus par le moteur. Non décrémenté en cas de casse d'axe.
---@field wheelRotatorIDs table<string, integer> Nom de roue/rotor -> cid dans wheelRotators.
---@field wheelRotators table<integer, table> Toutes les roues et rotors, indexés par cid à partir de 0. Voir notes pour les champs d'une roue.
---@field wheelTorque number Couple de propulsion total en N·m (somme propulsionTorque*wheelDir), recalculé à chaque updateGFX.
---@field wheels table<integer, table> Roues de type 'wheel' uniquement, indices contigus 0..wheelCount-1 (remplie par initSecondStage).
wheels = {}

--- Hook appelé quand une poutre casse : si c'est une poutre d'axe (axleBeams) d'une roue, la roue est déclarée cassée (couples et vitesse à 0, dégâts enregistrés, compteurs wheelCount/rotatorCount et moyennes de vitesse mis à jour).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/wheels.lua:119
---@param id integer Index de la poutre cassée.
function wheels.beamBroke(id) end

--- Marque toutes les roues et rotors comme crevés (isPunctured = true).
---Source : lua/vehicle/wheels.lua:781
function wheels.deflateAllTires() end

--- Marque une roue comme crevée (isPunctured = true) ; la fuite d'air et le dégonflage final se déroulent ensuite dans updateGFX.
---Source : lua/vehicle/wheels.lua:777
---@param wheelID integer Index (cid) dans wheelRotators.
function wheels.deflateTire(wheelID) end

--- Premier étage d'initialisation : crée l'objet-roue Lua pour chaque roue du jbeam (valeurs par défaut des clés brakeTorque, parkingTorque, absHz, punctureLeakRate…), installe l'ABS par défaut puis initialise la thermique des freins. Désactive updateGFX/updateWheelTorques/updateWheelVelocities s'il n'y a aucune roue.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/wheels.lua:1217
function wheels.init() end

--- Second étage (après powertrain et contrôleurs) : sépare wheelRotators en wheels et rotators, calcule le côté gauche/droite de chaque roue, le volume de pneu, les lisseurs de rayon dynamique et les gains de vitesse air virtuelle.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/wheels.lua:1244
function wheels.initSecondStage() end

--- Crée les sons de grincement de frein (boucle 3D sur node1) et de pneu à plat pour chaque roue. Appelée à l'initialisation des sons du véhicule.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/wheels.lua:901
function wheels.initSounds() end

--- Indique si le module a besoin d'être appelé à chaque pas de physique (au moins une roue).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/wheels.lua:1357
---@return boolean  wheelRotatorCount > 0.
function wheels.isPhysicsStepUsed() end

--- Hook de collision d'un noeud : mémorise le noeud de bande de roulement en contact et déclenche les sons de collision de carrosserie (sounds.bodyCollision) quand il y a du glissement.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/wheels.lua:100
---@param p table Données de collision du moteur (id1, slipForce, materialID, materialID2…).
function wheels.nodeCollision(p) end

--- Réinitialise l'état de toutes les roues (vitesses, couples, ABS, crevaisons, thermique) et restaure les couples de frein initiaux. Appelée au reset du véhicule.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/wheels.lua:896
function wheels.reset() end

--- Remet le mode ABS sur la valeur par défaut du réglage utilisateur 'absBehavior' ('realistic' si absent). Utilisé par .Tech.
---Source : lua/vehicle/wheels.lua:760
function wheels.resetABSBehavior() end

--- Réinitialise les compteurs de roues, le suivi de dégâts et l'état de la vitesse air virtuelle après un reset.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/wheels.lua:1222
function wheels.resetSecondStage() end

--- Met à l'échelle le couple de frein et le couple de frein de stationnement de toutes les wheels à partir de leurs valeurs initiales (initialBrakeTorque * coef). Non cumulatif. Sans argument, coef = 0 (freins coupés).
---Source : lua/vehicle/wheels.lua:154
---@param coef number|nil Coefficient multiplicateur (0 si nil).
function wheels.scaleBrakeTorque(coef) end

--- Choisit le mode ABS et reconstruit les méthodes de frein de chaque roue (active la vitesse air virtuelle seulement en realistic) ; met à jour electrics.values.hasABS.
---Source : lua/vehicle/wheels.lua:744
---@param behavior string 'realistic', 'arcade' ou 'off'.
function wheels.setABSBehavior(behavior) end

--- Remplace les fonctions de calcul du frein d'une roue (sans ABS / avec ABS) puis reconstruit les méthodes actives. Permet à un contrôleur de gérer lui-même le couple de frein d'une roue.
---Source : lua/vehicle/wheels.lua:1347
---@param wheelName string Nom de la roue (name jbeam).
---@param brakeUpdateMethodNoABS function function(wd, brake, invAirspeed, airspeed, airspeedCutOff, dt) -> couple de frein désiré (N·m) sans ABS.
---@param brakeUpdateMethodABS function Même signature, version avec ABS.
function wheels.setWheelBrakeUpdate(wheelName, brakeUpdateMethodNoABS, brakeUpdateMethodABS) end

--- Change le rotatorType ('wheel' ou 'rotator') d'une roue existante. Les tables wheels/rotators ne sont pas reconstruites automatiquement.
---Source : lua/vehicle/wheels.lua:773
---@param wheelID integer Index cid dans wheelRotators.
---@param rotatorType string 'wheel' ou 'rotator'.
function wheels.setWheelRotatorType(wheelID, rotatorType) end

--- Hook appelé quand les réglages utilisateur changent : relit le réglage 'absBehavior' pour le mode ABS par défaut (ne change pas le mode courant).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/wheels.lua:756
function wheels.settingsChanged() end

--- Bascule l'ABS entre 'off' et le mode par défaut (jamais 'off' comme défaut : retombe sur 'realistic') et affiche un message 'ABS behavior: …'.
---Source : lua/vehicle/wheels.lua:764
function wheels.toggleABSBehavior() end

--- Régulateur ABS d'une roue (PID sur l'erreur de glissement). Renvoie le coefficient 0..1 à appliquer au couple de frein désiré, ou 0 si le frein n'est pas actionné. Ne travaille qu'à la période absTime de la roue ; entre deux, renvoie lastABSCoef. Limite aussi la roue au coefficient du côté opposé.
---Source : lua/vehicle/wheels.lua:569
---@param wd table Objet roue.
---@param brake number Entrée de frein 0..1.
---@param invAirspeed number 1 / vitesse air (s/m).
---@param airspeed number Vitesse air (m/s) : virtuelle en realistic, electrics.airspeed en arcade.
---@param airspeedCutOff boolean Vrai si la vitesse dépasse 5 m/s ; sinon l'ABS ne module pas (coef 1).
---@param dt number Pas de temps (s).
---@return number  Coefficient ABS entre 0 et 1.
function wheels.updateABSCoef(wd, brake, invAirspeed, airspeed, airspeedCutOff, dt) end

--- Appelée à chaque frame graphique : met à jour thermique des freins/sons, puis pour chaque roue le glissement, la charge, le rayon dynamique, les crevaisons (herse et fuite d'air), wheelPower/wheelTorque, et les valeurs electrics abs, absActive et odometer.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/wheels.lua:503
---@param dt number Pas de temps de la frame (s).
function wheels.updateGFX(dt) end

--- Appelée à chaque pas de physique après le powertrain : applique le délai de pression de frein et l'efficacité thermique, puis écrit propulsionTorque, brakingTorque et engineReactionTorque dans la structure FFI de chaque roue (0 si la roue est cassée).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/wheels.lua:702
---@param dt number Pas de physique (s). Non utilisé.
function wheels.updateWheelTorques(dt) end

--- Appelée à chaque pas de physique : lit les vitesses angulaires du noyau, calcule wheelSpeed, avgWheelAV, wheelspeed, la vitesse air virtuelle et les couples de frein désirés (ABS inclus) de chaque roue.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/wheels.lua:624
---@param dt number Pas de physique (s).
function wheels.updateWheelVelocities(dt) end

