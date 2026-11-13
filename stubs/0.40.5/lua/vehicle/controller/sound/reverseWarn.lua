---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/sound/reverseWarn.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Contrôleur auxiliaire de bip de marche arrière. Tous les 0.5 s, il teste un electric (par défaut « reverse ») : s'il est > 0, il démarre une boucle sonore de bip ; sinon il l'arrête.
--- Accès : contrôleur `sound/reverseWarn` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`
---@class controller_sound_reverseWarn
---@field type string "auxiliary".
local controller_sound_reverseWarn = {}

--- Lit la configuration jbeam.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/sound/reverseWarn.lua:42
---@param jbeamData table Données jbeam.
function controller_sound_reverseWarn.init(jbeamData) end

--- Remet l'état et le minuteur à zéro.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/sound/reverseWarn.lua:37
function controller_sound_reverseWarn.reset() end

--- Chaque frame : démarre ou arrête le bip selon l'electric.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/sound/reverseWarn.lua:18
---@param dt number Pas de temps en secondes.
function controller_sound_reverseWarn.updateGFX(dt) end

return controller_sound_reverseWarn
