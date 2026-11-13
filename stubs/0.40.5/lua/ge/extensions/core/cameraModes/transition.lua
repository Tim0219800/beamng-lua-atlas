---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/cameraModes/transition.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Filtre de transition.
---@class core_cameraModes_transition
local core_cameraModes_transition = {}

--- Dit si le fondu est autorisé entre deux points : toujours pour une demande de type « caméra » (false), sinon seulement si distance <= 100 m et visibilité mutuelle (rayons statiques).
---Source : lua/ge/extensions/core/cameraModes/transition.lua:29
---@param origin vec3 position de la nouvelle caméra
---@param target vec3 position de l'ancienne caméra
---@return boolean  true si autorisé
function core_cameraModes_transition:canTransition(origin, target) end

--- isGlobal, isFilter, hidden, runningOrder 0.2, état initial et lecture des réglages.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/cameraModes/transition.lua:8
function core_cameraModes_transition:init() end

--- Hook : relit cameraTransitionTime et cameraVehicleTransitionTime (millisecondes).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/cameraModes/transition.lua:22
function core_cameraModes_transition:onSettingsChanged() end

--- Demande un fondu depuis la dernière pose ; il démarre à la prochaine image.
---Source : lua/ge/extensions/core/cameraModes/transition.lua:102
---@param isVehicleSwitch boolean vrai pour un changement de véhicule (durée véhicule, test de visibilité)
---@param camPathTransitionData table|nil données de transition de chemin caméra (avec callback(res))
---@param duration number|nil durée en secondes qui remplace la durée configurée pour cette transition
function core_cameraModes_transition:start(isVehicleSwitch, camPathTransitionData, duration) end

--- Enregistre la pose ou applique le fondu à data.res.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/cameraModes/transition.lua:39
---@param data table camData
---@return boolean  true
function core_cameraModes_transition:update(data) end

