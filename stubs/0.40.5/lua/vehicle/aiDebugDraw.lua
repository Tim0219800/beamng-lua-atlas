---@meta
-- tim19Atlas stub generated from lua/vehicle/aiDebugDraw.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Dessin de debug de l'IA véhicule (sphères, cylindres, textes via obj.debugDrawProxy). Chargé par ai.lua (require 'aiDebugDraw') ; ai.setVehicleDebugMode l'active ou le coupe selon ai.debugMode. Il lit un contexte (ego, twt, route courante, carte, scriptai…) fourni par ai.lua via setContextBinder, et n'écrit que dans ai.debugDraw (fonction appelée par la boucle principale pour dessiner). Un moddeur ne l'appelle normalement pas directement.
--- Accès : `require("aiDebugDraw")`
---@class aiDebugDraw
local aiDebugDraw = {}

--- Désactive le dessin debug (ai.debugDraw = nop).
---Source : lua/vehicle/aiDebugDraw.lua:442
function aiDebugDraw.disable() end

--- Active le dessin debug : lie le contexte si nécessaire puis place la fonction de dessin dans ai.debugDraw.
---Source : lua/vehicle/aiDebugDraw.lua:435
function aiDebugDraw.enable() end

--- Stocke le contexte utilisé par le dessin.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/aiDebugDraw.lua:409
---@param context table Table avec ego, twt, lastCommand, player (fonction), getCurrentRoute, getMapData, getScriptai, roadNaturalContinuation, castRay, populateOBBinRange.
function aiDebugDraw.init(context) end

--- Hook appelé par ai.setVehicleDebugMode quand le mode debug change : vide les historiques de dessin (trajectoire, route) qui ne correspondent plus au mode choisi.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/aiDebugDraw.lua:413
---@param debugMode string Nouveau ai.debugMode ('off', 'target', 'route', 'speeds', 'trajectory', 'rays', 'all').
function aiDebugDraw.onDebugModeChanged(debugMode) end

--- Vide les historiques de dessin (trajectoire et route). Appelée par ai.setMode.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/aiDebugDraw.lua:428
function aiDebugDraw.reset() end

--- Enregistre la fonction qui construira le contexte (ego, twt, accès route/carte/scriptai, castRay…) au premier enable().
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/aiDebugDraw.lua:405
---@param fn function Fonction sans argument qui appelle aiDebugDraw.init(context).
function aiDebugDraw.setContextBinder(fn) end

return aiDebugDraw
