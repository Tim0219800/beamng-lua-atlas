---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/pause/camera.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Caméra orbitale automatique du menu pause : prévue pour passer la caméra du joueur en mode orbit et la faire tourner lentement autour du véhicule pendant la pause, puis restaurer la caméra et l'état d'orbite d'origine. Elle s'arrête si le joueur tourne la caméra à la main. Dans 0.40.5, cette fonctionnalité est désactivée dans le code.
--- Accès : extension `ui_pause_camera` : `extensions.load("ui_pause_camera")`, puis la globale `ui_pause_camera`
---@class ui_pause_camera
ui_pause_camera = {}

--- Prévu pour mémoriser caméra, véhicule et état d'orbite au début de la pause. Sans effet dans 0.40.5 (return immédiat).
---Source : lua/ge/extensions/ui/pause/camera.lua:155
function ui_pause_camera.beginPauseSession() end

--- Renvoie une copie profonde de l'état interne (pauseSessionActive, active, orbiting, stoppedByManualInput, previousCameraName, etc.) pour le débogage.
---Source : lua/ge/extensions/ui/pause/camera.lua:214
---@return table  Copie de l'état.
function ui_pause_camera.debugState() end

--- Prévu pour arrêter l'orbite et restaurer la caméra et l'état d'orbite d'avant la pause. Sans effet dans 0.40.5 (return immédiat).
---Source : lua/ge/extensions/ui/pause/camera.lua:160
function ui_pause_camera.endPauseSession() end

--- Hook appelé à chaque frame ; fait tourner la caméra orbit autour du véhicule joueur si la session est active. Sans effet tant que start est désactivée.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/pause/camera.lua:181
---@param dtReal number Temps réel écoulé depuis la frame précédente, en secondes.
function ui_pause_camera.onUpdate(dtReal) end

--- Prévu pour passer la caméra du joueur en orbit et lancer la rotation automatique. Sans effet dans 0.40.5 (return immédiat).
---Source : lua/ge/extensions/ui/pause/camera.lua:114
function ui_pause_camera.start() end

--- Prévu pour arrêter la rotation automatique et revenir à la caméra précédente. Sans effet dans 0.40.5 (return immédiat).
---Source : lua/ge/extensions/ui/pause/camera.lua:136
function ui_pause_camera.stop() end

