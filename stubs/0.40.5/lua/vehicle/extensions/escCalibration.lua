---@meta
-- tim19Atlas stub generated from lua/vehicle/extensions/escCalibration.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Outil interne de calibration de l'ESC : automatise un test de 'rigidité de dérive' (skew stiffness) en balayant 13 vitesses (40 à 100 km/h) et 14 angles de braquage (0,5° à 7°), avec le régulateur de vitesse et le contrôleur 'esc'. Le résultat est écrit dans skewStiffnessPivot.csv et la progression est envoyée à l'UI via le hook 'ESCSkewStiffnessChange'.
--- Accès : extension `escCalibration` : `extensions.load (VM véhicule)("escCalibration")`, puis la globale `escCalibration`
---@class escCalibration
escCalibration = {}

--- Hook d'initialisation : remet tous les compteurs et résultats à zéro, la vitesse physique à normale et l'état à Idling.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/extensions/escCalibration.lua:165
function escCalibration.onInit() end

--- Même fonction que onInit.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/extensions/escCalibration.lua:165
function escCalibration.onReset() end

--- Démarre le test : récupère le contrôleur 'esc' (abandonne avec une erreur de log s'il n'existe pas), charge cruiseControl, lance la calibration ESC et passe en état Initialization.
---Source : lua/vehicle/extensions/escCalibration.lua:191
function escCalibration.startSkewStiffnessTest() end

--- Arrête le test : coupe le régulateur, arrête la calibration ESC, remet la vitesse physique normale et passe en état Finished (le CSV sera alors écrit à la prochaine frame).
---Source : lua/vehicle/extensions/escCalibration.lua:209
function escCalibration.stopSkewStiffnessTest() end

--- Appelé chaque frame : fait avancer la machine à états du test et pilote la direction.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/extensions/escCalibration.lua:57
---@param dt number Pas de temps en secondes.
function escCalibration.updateGFX(dt) end

