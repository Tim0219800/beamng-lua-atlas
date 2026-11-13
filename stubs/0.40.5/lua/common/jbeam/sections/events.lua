---@meta
-- tim19Atlas stub generated from lua/common/jbeam/sections/events.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Traite les sections jbeam d'interaction : events (évènements d'entrée, simplement nettoyés), triggers (zones de déclenchement 3D box/sphère créées dans le moteur avec addTrigger, position, rotation, taille, couleur, label, meshes à surligner) et triggerEventLinks / triggerEventLinks2 (liens entre un trigger et une action d'entrée). Construit vehicle.triggerEventLinksDict[triggerId][entrée] = liste de liens et migre les anciens liens (v1, vers vehicle.events) vers le format v2 (inputActions). Charge l'extension core_vehicleTriggers si au moins un trigger a été créé.
--- Accès : `require("jbeam/sections/events")`
---@class jbeam_sections_events
local jbeam_sections_events = {}

--- Traite events, triggers et liens trigger-évènement du véhicule (crée les triggers dans le moteur et remplit vehicle.triggerEventLinksDict).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/jbeam/sections/events.lua:324
---@param objID integer Identifiant du véhicule (non utilisé).
---@param vehicleObj userdata Objet véhicule moteur (addTrigger, getTrigger).
---@param vehicle table Données jbeam du véhicule (modifiées en place).
function jbeam_sections_events.process(objID, vehicleObj, vehicle) end

return jbeam_sections_events
