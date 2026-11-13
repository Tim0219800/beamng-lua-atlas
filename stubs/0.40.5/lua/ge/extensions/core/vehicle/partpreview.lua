---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/vehicle/partpreview.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Extension GE `core_vehicle_partpreview` : aperçu temporaire de pièces dans l'UI de configuration (survol dans les partpacks), sans respawn du véhicule. Compare les meshes (flexbodies) de la pièce actuelle d'un slot avec ceux d'une pièce candidate, masque les meshes de la pièce actuelle (alpha 0) et affiche ceux de la candidate (alpha 1), en mémorisant les alphas d'origine pour les restaurer.
--- Accès : extension `core_vehicle_partpreview` : `extensions.load("core_vehicle_partpreview")`, puis la globale `core_vehicle_partpreview`
---@class core_vehicle_partpreview
core_vehicle_partpreview = {}

--- Restaure l'alpha d'origine de tous les meshes modifiés par l'aperçu pour le véhicule et oublie l'état.
---Source : lua/ge/extensions/core/vehicle/partpreview.lua:99
---@param inVehID integer|nil véhicule ; nil = joueur 0
function core_vehicle_partpreview.clearPartPreview(inVehID) end

--- Calcule quels meshes de flexbodies disparaissent ou apparaissent si les pièces candidates remplaçaient les pièces actuelles de leurs slots.
---Source : lua/ge/extensions/core/vehicle/partpreview.lua:110
---@param partsBySlot table<string, string> [slot] = nom de pièce candidate (valeurs vides ignorées)
---@param inVehID integer|nil véhicule ; nil = joueur 0
---@return table[]  liste de {slotName, oldPartName, newPartName, oldMesh, newMesh} (oldMesh nil = nouveau mesh ; newMesh nil = mesh supprimé)
function core_vehicle_partpreview.getFlexmeshChanges(partsBySlot, inVehID) end

--- Affiche l'aperçu des pièces candidates : efface l'aperçu précédent, masque les meshes de la pièce actuelle de chaque slot et affiche ceux de la candidate (meshes de flexbodies et de props).
---Source : lua/ge/extensions/core/vehicle/partpreview.lua:171
---@param partsBySlot table<string, string> [slot] = nom de pièce candidate
---@param inVehID integer|nil véhicule ; nil = joueur 0
function core_vehicle_partpreview.previewPartMeshes(partsBySlot, inVehID) end

--- Oublie tous les états d'aperçu mémorisés, sans restaurer les alphas (à utiliser quand les véhicules ont été recréés).
---Source : lua/ge/extensions/core/vehicle/partpreview.lua:210
function core_vehicle_partpreview.reset() end

