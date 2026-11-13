---@meta
-- tim19Atlas stub generated from lua/vehicle/extensions/test/ffbCalibration.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Procédure automatique de calibrage du retour de force (FFB) du volant. Le véhicule est lancé par le régulateur de vitesse (cruiseControl) puis le volant est tourné progressivement ; à chaque pas de physique le module enregistre vitesse, angle de volant et force normalisée au volant (hydros.forceAtWheelNorm, brute et lissée). À la fin il calcule un conseil de correction du coefficient FFB et renvoie tout au Lua du jeu via test_ffbCalibration.onFFBCalibrationFinished(données encodées avec lpack). Modes : "steerPeak" (s'arrête quand la force a passé son pic), "steerFull" (va jusqu'en butée), "straight" (enregistre en ligne droite).
--- Accès : extension `test_ffbCalibration` : `extensions.load (VM véhicule)("test_ffbCalibration")`, puis la globale `test_ffbCalibration`
---@class test_ffbCalibration
test_ffbCalibration = {}

--- Termine la calibration : remet la physique à vitesse normale (côté GE), rend le contrôle (entrée, cruise, boîte, frein, embrayage), calcule le conseil de correction FFB, envoie les données au GE par test_ffbCalibration.onFFBCalibrationFinished et libère `data`.
---Source : lua/vehicle/extensions/test/ffbCalibration.lua:184
function test_ffbCalibration.finish() end

--- Hook de chargement : appelle enablePhysicsStepHook() pour recevoir onPhysicsStep.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/extensions/test/ffbCalibration.lua:263
function test_ffbCalibration.onExtensionLoaded() end

--- Hook de pas de physique (activé par enablePhysicsStepHook dans onExtensionLoaded, appelé par main.lua à la fréquence physique). Met à jour airspeed (obj:getGroundSpeed) puis exécute la logique du mode courant.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/extensions/test/ffbCalibration.lua:173
---@param dtSim number Pas de physique en secondes.
function test_ffbCalibration.onPhysicsStep(dtSim) end

--- Lance une calibration FFB dans le mode donné : initialise tous les compteurs et la table de résultats, prend le contrôle du volant et de la boîte, charge cruiseControl, règle la vitesse cible et désactive le FFB normal.
---Source : lua/vehicle/extensions/test/ffbCalibration.lua:207
---@param mode string "steerPeak", "steerFull" ou "straight" ; autre valeur : log d'erreur et finish().
---@param fastmotion boolean|nil true pour accélérer la physique (x100) pendant la calibration.
function test_ffbCalibration.start(mode, fastmotion) end

