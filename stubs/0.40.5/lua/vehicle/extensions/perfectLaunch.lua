---@meta
-- tim19Atlas stub generated from lua/vehicle/extensions/perfectLaunch.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Aide au départ arrêté 'parfait' (launch control) pour dragsters : gaz à fond, puis contrôle PI de la patinage des roues motrices et du lacet en modulant les gaz, avec maintien de la trajectoire via l'extension straightLine. Séquence : prepare(cible) (véhicule gelé, gaz à fond), go() (dégel, départ), stop() (remise à zéro).
--- Accès : extension `perfectLaunch` : `extensions.load (VM véhicule)("perfectLaunch")`, puis la globale `perfectLaunch`
---@class perfectLaunch
---@field launchFailed boolean true si un tête-à-queue (lacet lissé > 0,5) a été détecté pendant le départ.
perfectLaunch = {}

--- Lance le départ : dégèle le véhicule et passe en état 'go'.
---Source : lua/vehicle/extensions/perfectLaunch.lua:35
function perfectLaunch.go() end

--- Hook d'initialisation : état 'idle', remise à zéro des régulations, mode de boîte 'arcade' et rechargement de straightLine.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/extensions/perfectLaunch.lua:18
function perfectLaunch.onInit() end

--- Même fonction que onInit.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/extensions/perfectLaunch.lua:18
function perfectLaunch.onReset() end

--- Prépare le départ : gèle le véhicule, gaz à fond, donne la direction cible à straightLine.
---Source : lua/vehicle/extensions/perfectLaunch.lua:40
---@param target vec3|table Cible ou direction passée à straightLine.setTargetDirection (déduit du code).
function perfectLaunch.prepare(target) end

--- Arrête tout : relâche frein à main, frein et gaz, dégèle, arrête straightLine et réinitialise.
---Source : lua/vehicle/extensions/perfectLaunch.lua:50
function perfectLaunch.stop() end

--- Appelé chaque frame : exécute la machine à états et le contrôle des gaz, puis straightLine.updateGFX.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/extensions/perfectLaunch.lua:59
---@param dt number Pas de temps en secondes.
function perfectLaunch.updateGFX(dt) end

