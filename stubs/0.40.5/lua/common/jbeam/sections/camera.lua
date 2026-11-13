---@meta
-- tim19Atlas stub generated from lua/common/jbeam/sections/camera.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Traite les sections jbeam de caméras du véhicule (cameras, et les anciennes camerasInternal/cameraExternal/camerasRelative/cameraChase). Migre l'ancien format vers vehicle.cameras.{onboard, orbit, relative, chase}, crée pour chaque caméra embarquée un nœud de caméra relié par des poutres aux nœuds id1..id8, convertit les caméras 'driver' en occupants, construit les caméras par place d'occupant (cameras.occupant) à partir des occupantSlots, calcule les caméras relatives par rapport au nœud de référence et produit vehicle.cameraData, une copie allégée (indices 1..N) envoyée à l'extension de caméra. Appelé dans la VM GE seulement.
--- Accès : `require("jbeam/sections/camera")`
---@class jbeam_sections_camera
local jbeam_sections_camera = {}

--- Effectue toutes les conversions et créations liées aux caméras du véhicule (vehicle.cameras, vehicle.cameraRefNodes, vehicle.cameraData).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/jbeam/sections/camera.lua:244
---@param objID integer Identifiant du véhicule (non utilisé).
---@param vehicle table Données jbeam du véhicule (modifiées en place).
function jbeam_sections_camera.process(objID, vehicle) end

return jbeam_sections_camera
