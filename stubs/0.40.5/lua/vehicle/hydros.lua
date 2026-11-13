---@meta
-- tim19Atlas stub generated from lua/vehicle/hydros.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Gère les hydros jbeam (poutres/barres de torsion pilotées par une entrée : direction, bennes, grues, etc.) et le retour de force (FFB) du volant. À l'init il lit v.data.hydros (poutres) et v.data.torsionHydros, normalise leurs limites et centre, et sépare les hydros de direction (inputSource 'steering_input') des autres. À chaque pas de physique (update) il déplace chaque hydro vers sa commande (cmd, lue dans electrics.values via inputFlex) avec des taux inRate/outRate ; pour le volant physique, la position du volant pilote la direction et la force mesurée sur les poutres de direction est renvoyée au matériel (FFBcalc : lissage, compression, amortissement, butée logicielle « softlock »). Fournit aussi un volant virtuel pour les tests (enableVirtualWheel).
--- Accès : globale `hydros`
---@class hydros
---@field GforceCoef number Coefficient d'effet des forces G latérales (sensors.gx) sur la force du volant (défaut 0).
---@field curForceLimit number Limite de force courante (préventeur de pics) : repart de 0 après spawn/reload/pause et grimpe jusqu'à wheelFFBForceLimit.
---@field curForceLimitNorm number curForceLimit / FFmax.
---@field deviceLightingMode string Configuration d'éclairage du périphérique ('off' par défaut ; 'default' active l'envoi des LED de régime).
---@field enableBrakeForceFeedback boolean Active le retour de force du frein en mode vibration de manette (défaut true).
---@field enableFFB boolean true par défaut ; mis à false les requêtes réelles vers le matériel FFB sont ignorées (les calculs continuent).
---@field enableFFBflood boolean false par défaut ; true = ignore les contrôles de temps et envoie à ~2 kHz (debug uniquement : sature les pilotes).
---@field enableThrottleForceFeedback boolean Active le retour de force de l'accélérateur en mode vibration de manette (défaut true).
---@field enableVibration boolean false par défaut ; true en mode vibration (manette), le FFB volant est alors désactivé (FFBHydrosExist = false).
---@field ffbSpeedFast number Vitesse (m/s) au-delà de laquelle la force FFB atteint son coefficient normal (5 / 3.6).
---@field forceAtDriver number Force envoyée au pilote matériel dans [-FFmax, FFmax].
---@field forceAtDriverNorm number Force envoyée au pilote matériel, normalisée.
---@field forceAtWheelNorm number Force mesurée au volant, normalisée (force / FFmax).
---@field hydros table[] Liste de tous les hydros (poutres puis barres de torsion) avec leurs champs calculés.
---@field wheelFFBForceCoef number Coefficient de force FFB à vitesse normale (défaut 100).
---@field wheelFFBForceCoefCurrent number Coefficient courant, interpolé entre bas régime et normal selon la vitesse (ffbSpeedFast), 0 quand l'IA conduit.
---@field wheelFFBForceCoefLowSpeed number Coefficient de force aux vitesses de parking (initialement = wheelFFBForceCoef ; = forceCoef/10 si lowspeedCoef).
---@field wheelFFBForceCompressionCoef number Part de la limite à partir de laquelle la force est comprimée (0..1, défaut 0.9).
---@field wheelFFBForceLimit number Limite de force FFB stable (échelle 0..FFmax = 10).
---@field wheelPowerSteeringCoef number Coefficient de direction assistée (défaut 1) appliqué au déplacement de volant dans la force FFB.
hydros = {}

--- Appelée par main.lua:onDebugDraw. Réinitialise le lisseur FFB quand le temps réel d'image est aberrant (moins de 10 fps ou à l'arrêt) pour éviter des pics.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/hydros.lua:288
function hydros.debugDraw() end

--- Appelée à la suppression du véhicule (main.lua:onDespawnObject) : coupe toutes les interfaces FFB (force 0).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/hydros.lua:731
function hydros.destroy() end

--- Active ou désactive un volant virtuel (simulation logicielle d'un volant FFB) : active FFB avec FFBID 0, remplace la fonction d'envoi de force et celle de lecture d'angle.
---Source : lua/vehicle/hydros.lua:116
---@param isEnabled boolean|nil true (par défaut si nil) pour activer.
---@param wheelAngleFun function|nil Fonction renvoyant l'angle de volant -1..1 (volant virtuel par défaut).
---@param sendForceFun function|nil Fonction d'envoi de force (o, FFBID, torque, dampCoef, inertia, friction) ; virtualSendForceFeedback par défaut.
function hydros.enableVirtualWheel(isEnabled, wheelAngleFun, sendForceFun) end

--- Renvoie la fonction qui donne l'angle de volant actuel : celle du volant virtuel si activé, sinon une fonction lisant electrics.values.steering_input.
---Source : lua/vehicle/hydros.lua:761
---@return function  Fonction sans argument renvoyant l'angle.
function hydros.getAngleFunction() end

--- Renvoie la configuration FFB courante.
---Source : lua/vehicle/hydros.lua:488
---@return table  {forceCoef, softlockForce, smoothing, gforceCoef, wheelFFBDampLimit}.
function hydros.getFFBConfig() end

--- Renvoie l'identifiant du périphérique FFB de direction (-1 si aucun).
---Source : lua/vehicle/hydros.lua:753
---@return integer  FFBID (>= 0 valide).
function hydros.getFFBID() end

--- Renvoie la fonction d'envoi de force courante (obj.sendForceFeedback, ou celle du volant virtuel).
---Source : lua/vehicle/hydros.lua:749
---@return function  Fonction sendForceFeedback(obj, FFBID, force, ...).
function hydros.getForceFeedbackFunction() end

--- Prépare les hydros à partir de v.data.hydros et v.data.torsionHydros : calcul des multiplicateurs/centres, répartition direction / autres, inputFlex, coefficient FFB du véhicule (v.data.input.FFBcoef x 1.2), initialisation des haptiques, puis reset(). Appelée par main.lua (initSystems).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/hydros.lua:603
function hydros.init() end

--- Indique si hydros a besoin du pas de physique (update actif).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/hydros.lua:745
---@return boolean  true si M.update ~= nop.
function hydros.isPhysicsStepUsed() end

--- Hook appelé quand la configuration des périphériques FFB change : coupe les interfaces, relit steering/accelerate/brake, choisit FFBID, force, lissage, softlock, courbe de réponse, fréquence d'envoi et configure input_haptics.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/hydros.lua:513
---@param newFFBConfig table|nil Config {steering = {FFBID, ffbParams, ffbSendms}, accelerate = {FFBID}, brake = {FFBID}} ; nil pour désactiver.
function hydros.onFFBConfigChanged(newFFBConfig) end

--- Remet les états des hydros au centre, réinitialise lisseurs FFB et volant virtuel, coupe les interfaces FFB ; réactive update/updateGFX s'il y a des hydros (sinon nop).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/hydros.lua:701
function hydros.reset() end

--- Remet à 0 le lisseur de force FFB et la limite de force (anti-pic).
---Source : lua/vehicle/hydros.lua:203
function hydros.resetFFBSmoother() end

--- Envoie guihooks.trigger('HydrosUpdate', M.state) ; M.state n'est jamais défini dans ce fichier (voir notes).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/hydros.lua:735
function hydros.sendHydroStateToGUI() end

--- Envoie au périphérique FFB les LED de régime (obj:sendRPMLeds) si FFBID est valide et deviceLightingMode vaut 'default'.
---Source : lua/vehicle/hydros.lua:739
---@param currentRPM number Régime moteur courant.
---@param rpmFirstLedTurnsOn number Régime d'allumage de la première LED.
---@param rpmRedLine number Régime de la zone rouge.
function hydros.sendRPMLeds(currentRPM, rpmFirstLedTurnsOn, rpmRedLine) end

--- Ajoute une force externe au calcul du FFB au volant (avant le coefficient de force).
---Source : lua/vehicle/hydros.lua:134
---@param force number Force externe (même échelle que le déplacement de volant).
function hydros.setExternalForce(force) end

--- Met à jour des paramètres FFB à chaud (seuls les champs fournis sont modifiés) puis coupe les interfaces FFB.
---Source : lua/vehicle/hydros.lua:498
---@param ffbParams table Champs possibles : forceCoef, softlockForce (0..1), smoothing, gforceCoef, enableThrottleForceFeedback, enableBrakeForceFeedback, deviceLightingMode, wheelFFBDampLimit.
function hydros.setFFBConfig(ffbParams) end

--- Pas de physique (main.lua:onPhysicsStep, après controller.update). Avance chaque hydro vers sa commande ; pour les hydros de direction avec FFB actif, suit la position du volant réel et lance le calcul FFB (FFBcalc).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/hydros.lua:418
---@param dtSim number Pas de physique en secondes.
function hydros.update(dtSim) end

--- Frame graphique (après extensions et electrics, avant powertrain). Met à jour le volant virtuel, l'inputFlex, les commandes (cmd) et taux de lissage, le modèle de mouvement du volant pour le FFB, la limite de force, le coefficient de force selon la vitesse, et electrics.values.steering (angle en degrés).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/hydros.lua:293
---@param dt number Pas de temps en secondes.
function hydros.updateGFX(dt) end

