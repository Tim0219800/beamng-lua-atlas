---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/cameraModes/topDown.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Mode vue de dessus. Champs : alignToCar, tilt, ortho, fov, refNodes.
---@class core_cameraModes_topDown
local core_cameraModes_topDown = {}

--- Restaure l'état de serialize.
---Source : lua/ge/extensions/core/cameraModes/topDown.lua:99
---@param s table table de serialize
function core_cameraModes_topDown:deserialize(s) end

--- Crée les lisseurs et valeurs par défaut.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/cameraModes/topDown.lua:10
function core_cameraModes_topDown:init() end

--- Réglages UI : align, tilt (0-80), ortho, fov (10-140).
---Source : lua/ge/extensions/core/cameraModes/topDown.lua:109
---@return table[]  descripteurs
function core_cameraModes_topDown:listParams() end

--- Hook : FOV par défaut à 20.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/cameraModes/topDown.lua:28
function core_cameraModes_topDown:onVehicleCameraConfigChanged() end

--- État pour les vues flux vidéo : alignToCar, fov, tilt, ortho.
---Source : lua/ge/extensions/core/cameraModes/topDown.lua:95
---@return table  état
function core_cameraModes_topDown:serialize() end

--- Modifie align, tilt, ortho ou fov.
---Source : lua/ge/extensions/core/cameraModes/topDown.lua:118
---@param key string align, tilt, ortho, fov
---@param value any nouvelle valeur
function core_cameraModes_topDown:setParam(key, value) end

--- Définit les nœuds de référence du véhicule (utilisés pour alignToCar).
---Source : lua/ge/extensions/core/cameraModes/topDown.lua:86
---@param centerNodeID integer nœud centre
---@param leftNodeID integer nœud gauche
---@param backNodeID integer nœud arrière
function core_cameraModes_topDown:setRefNodes(centerNodeID, leftNodeID, backNodeID) end

--- Calcule la pose d'après la vitesse et le cap, écrit data.res (pos, rot, fov, targetPos, ortho).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/cameraModes/topDown.lua:32
---@param data table camData
---@return boolean  true
function core_cameraModes_topDown:update(data) end

