---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/cameraModes/autozoom.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Objet filtre renvoyé par le constructeur. Champs : steps, fov, baseFov, userFov, mustReset, fovSmoother, smooth.
---@class core_cameraModes_autozoom
local core_cameraModes_autozoom = {}

--- Calcule le FOV pour une distance : choisit le palier, ajoute la correction manuelle de l'utilisateur (2.5 * dt * (zoomIn - zoomOut) * FOV actuel, limitée) puis lisse vers la cible (instantané si mustReset).
---Source : lua/ge/extensions/core/cameraModes/autozoom.lua:37
---@param distance number Distance caméra-cible (m)
---@param dt number Pas de temps (s)
---@return number  FOV en degrés
function core_cameraModes_autozoom:getFov(distance, dt) end

--- Initialise (ou réinitialise) le filtre : choisit le lisseur de FOV (par défaut newTemporalSpring(30, 10)), remet mustReset, fov=60, userFov=0 et les paliers par défaut. Peut être rappelé pour changer de lisseur.
---Source : lua/ge/extensions/core/cameraModes/autozoom.lua:8
---@param smoother table|nil Lisseur temporel (get/getUncapped, set) ; conserve l'actuel par défaut
function core_cameraModes_autozoom:init(smoother) end

--- Annule le zoom manuel de l'utilisateur (userFov = 0), touches pavé numérique 9/3.
---Source : lua/ge/extensions/core/cameraModes/autozoom.lua:65
function core_cameraModes_autozoom:reset() end

--- Calcule la distance entre data.res.targetPos et data.res.pos et écrit data.res.fov. Appelé par la caméra propriétaire.
---Source : lua/ge/extensions/core/cameraModes/autozoom.lua:68
---@param data table Données de frame : dt, res {pos, targetPos, fov}
---@return boolean  Toujours true
function core_cameraModes_autozoom:update(data) end

