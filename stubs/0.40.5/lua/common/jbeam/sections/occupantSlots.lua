---@meta
-- tim19Atlas stub generated from lua/common/jbeam/sections/occupantSlots.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Traite la section jbeam « occupantSlots » (places d'occupants). Normalise chaque entrée : id (id, name ou clé de table), defaultPermissionMode (driver, passenger ou unrestricted ; déduit de la caméra sinon), seatSide (left/right/center, déduit de exitSide, driverSide ou du suffixe L/R de l'id), cameraName 'occupant.<id>', entryTrigger 'enterSeat_<id>', cargoGroup '<id>Occupant' et actionMaps (toujours une table). Produit vehicle.occupantSlotsById et active vehicle.occupantSystem.enabled s'il y a des places ou si une pièce active expose un slot de type 'seat_occupant'.
--- Accès : `require("jbeam/sections/occupantSlots")`
---@class jbeam_sections_occupantSlots
local jbeam_sections_occupantSlots = {}

--- Normalise les occupantSlots du véhicule et active le système d'occupants si nécessaire.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/jbeam/sections/occupantSlots.lua:32
---@param _ any Identifiant du véhicule (ignoré).
---@param vehicle table Données jbeam (occupantSlots, occupantSystem).
---@param activePartsData table<string, table>|nil Pièces actives (pour détecter un slot seat_occupant).
function jbeam_sections_occupantSlots.process(_, vehicle, activePartsData) end

return jbeam_sections_occupantSlots
