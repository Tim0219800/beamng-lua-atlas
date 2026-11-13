---@meta
-- tim19Atlas stub generated from lua/vehicle/extensions/dragAi.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Mini-IA de dragster : gaz à fond, direction proportionnelle vers un point cible, puis freinage et frein à main à l'arrivée. L'état évolue de 'ready' (gaz enclenchés, frein à main serré) à 'go' (frein à main relâché, roule vers la cible), 'stopping', 'finished'. Elle pilote le véhicule en envoyant des événements d'entrée (input.event).
--- Accès : extension `dragAi` : `extensions.load (VM véhicule)("dragAi")`, puis la globale `dragAi`
---@class dragAi
dragAi = {}

--- Passe en état 'ready' : applique les gaz à fond.
---Source : lua/vehicle/extensions/dragAi.lua:10
function dragAi.getReady() end

--- Passe en état 'go' : relâche le frein à main, la boucle conduit vers la cible.
---Source : lua/vehicle/extensions/dragAi.lua:14
function dragAi.go() end

--- Hook de reset du véhicule : état 'idle', gaz à zéro, frein à main serré.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/extensions/dragAi.lua:61
function dragAi.reset() end

--- Définit le point cible à atteindre.
---Source : lua/vehicle/extensions/dragAi.lua:19
---@param targetPos vec3 Position monde de la cible (x,y utilisés).
function dragAi.setTarget(targetPos) end

--- Appelé chaque frame : exécute la machine à états de conduite.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/extensions/dragAi.lua:23
---@param dt number Pas de temps en secondes (non utilisé).
function dragAi.updateGFX(dt) end

