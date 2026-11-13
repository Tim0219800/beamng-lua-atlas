---@meta
-- tim19Atlas stub generated from lua/vehicle/extensions/input/haptics.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Génère les vibrations de manette (retour haptique) à partir de la dynamique du véhicule : secousses (jerk) de l'accélération, énergie de glissement des roues, roues bloquées au freinage (gâchette de frein) et roues motrices qui patinent (gâchette d'accélérateur). Les forces sont envoyées au pilote de périphérique via hydros.getForceFeedbackFunction() sur les identifiants FFB fournis. Appelé par le système d'entrée, pas par un moddeur en général.
--- Accès : extension `input_haptics` : `extensions.load (VM véhicule)("input_haptics")`, puis la globale `input_haptics`
---@class input_haptics
input_haptics = {}

--- Recense les roues motrices (powertrain.getPoweredWheelNames) et le nombre de roues. À appeler après le chargement du véhicule.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/extensions/input/haptics.lua:48
function input_haptics.initHaptics() end

--- Définit les identifiants des sorties de retour de force (-1 = désactivée).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/extensions/input/haptics.lua:33
---@param _FFBID integer Sortie de vibration principale.
---@param _FFBID_accelerate integer Sortie de la gâchette d'accélérateur.
---@param _FFBID_brake integer Sortie de la gâchette de frein.
function input_haptics.setFFBIDs(_FFBID, _FFBID_accelerate, _FFBID_brake) end

--- Définit la période entre deux envois au pilote (secondes) et programme le prochain envoi.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/extensions/input/haptics.lua:39
---@param period number Période en secondes (défaut 1/30).
function input_haptics.setFFBPeriod(period) end

--- Multiplicateur de la composante de vibration due aux secousses (debug).
---Source : lua/vehicle/extensions/input/haptics.lua:182
---@param multiplier number Défaut 1.
function input_haptics.setJerkForceMultiplier(multiplier) end

--- Prévu pour régler le seuil de secousse ; sans effet réel (voir notes).
---Source : lua/vehicle/extensions/input/haptics.lua:184
---@param min number Seuil (non utilisé).
function input_haptics.setJerkMin(min) end

--- Multiplicateur de la composante de vibration due au glissement des roues (debug).
---Source : lua/vehicle/extensions/input/haptics.lua:181
---@param multiplier number Défaut 1.
function input_haptics.setWheelSlipForceMultiplier(multiplier) end

--- Seuil minimal d'énergie de glissement pour déclencher la vibration (debug).
---Source : lua/vehicle/extensions/input/haptics.lua:183
---@param min number Défaut 15000.
function input_haptics.setWheelSlipMin(min) end

--- Calcule et envoie les forces de vibration (moteur principal, gâchette d'accélérateur, gâchette de frein) si la période FFB est écoulée.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/extensions/input/haptics.lua:60
---@param dt number Pas de temps de simulation en secondes.
function input_haptics.vibrationUpdate(dt) end

