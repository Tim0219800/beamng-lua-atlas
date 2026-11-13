---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/photomodeAttach.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Attache la caméra libre au véhicule du joueur pendant le mode photo : la caméra garde son décalage par rapport au véhicule et le suit à chaque frame (onPreRender). En option, elle suit aussi la rotation du véhicule, uniquement en lacet (yaw), sans tangage ni roulis. Ne fonctionne que si la caméra active est la caméra libre « free ».
--- Accès : extension `util_photomodeAttach` : `extensions.load("util_photomodeAttach")`, puis la globale `util_photomodeAttach`
---@class util_photomodeAttach
---@field enabled boolean true tant que l'attache est active
---@field followRotation boolean true si la caméra suit aussi le lacet du véhicule
---@field offsetLocal vec3|nil Décalage dans le repère du véhicule, lacet seul (mode avec rotation)
---@field offsetWorld vec3|nil Décalage caméra - véhicule en repère monde (mode sans rotation)
---@field rotOffset quat|nil Rotation de la caméra relative au lacet du véhicule
util_photomodeAttach = {}

--- Active ou désactive l'attache. À l'activation, mémorise le décalage actuel de la caméra libre par rapport au véhicule joueur (et son orientation relative si followRotation).
---Source : lua/ge/extensions/util/photomodeAttach.lua:50
---@param en boolean true pour activer, tout autre valeur désactive
---@param opts table|nil Options : followRotation (boolean) pour suivre le lacet du véhicule
function util_photomodeAttach.enable(en, opts) end

--- Hook appelé chaque frame avant le rendu : replace la caméra par rapport au véhicule.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/photomodeAttach.lua:134
---@param dtReal number Delta de temps réel en secondes (non utilisé)
---@param dtSim number Delta de temps de simulation (non utilisé)
---@param dtRaw number Delta de temps brut (non utilisé)
function util_photomodeAttach.onPreRender(dtReal, dtSim, dtRaw) end

--- Applique immédiatement la transformation mémorisée à la caméra (même traitement que celui fait à chaque frame). Sans effet si l'attache est inactive.
---Source : lua/ge/extensions/util/photomodeAttach.lua:100
function util_photomodeAttach.syncCameraToVehicle() end

