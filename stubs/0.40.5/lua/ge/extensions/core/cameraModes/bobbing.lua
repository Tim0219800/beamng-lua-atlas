---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/cameraModes/bobbing.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Objet filtre renvoyé par le constructeur. Champs : walkBobScale, standingBobScale, t, bobPhase, phase (vec3 de phases aléatoires).
---@class core_cameraModes_bobbing
local core_cameraModes_bobbing = {}

--- Initialise : isFilter et hidden à true, lit les réglages, remet à zéro. Appelé par le constructeur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/cameraModes/bobbing.lua:8
function core_cameraModes_bobbing:init() end

--- Relit les réglages cameraSteadycamWalkBob et cameraSteadycamStandingBob (bornés à 0..2, défaut 1). Appelé par camera.lua quand les réglages changent, ou par le mode propriétaire.
---Source : lua/ge/extensions/core/cameraModes/bobbing.lua:15
function core_cameraModes_bobbing:onSettingsChanged() end

--- Remet le temps et la phase à zéro et tire de nouvelles phases aléatoires pour le balancement.
---Source : lua/ge/extensions/core/cameraModes/bobbing.lua:20
function core_cameraModes_bobbing:reset() end

--- Applique le balancement à data.res.pos et data.res.rot.
---Source : lua/ge/extensions/core/cameraModes/bobbing.lua:26
---@param data table Données de frame : dt, res {pos, rot}, openxrSessionRunning
---@param walkAmt number|nil Intensité de marche [0..1], 0 par défaut
---@param dt number|nil Pas de temps en s, data.dt par défaut
---@return boolean  Toujours true
function core_cameraModes_bobbing:update(data, walkAmt, dt) end

