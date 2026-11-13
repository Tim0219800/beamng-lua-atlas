---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/pyrotechnicCharge.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Contrôleur auxiliaire de charge pyrotechnique à usage unique : dès qu'un des electrics listés dans triggerElectrics vaut 1 ou true, il joue un son, casse des breakgroups et détache des coupleurs, puis affiche un message. Sert aux séparations explosives (boulons, étages, remorques). Peut aussi être déclenché à la main par trigger().
--- Accès : contrôleur `pyrotechnicCharge` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`
---@class controller_pyrotechnicCharge
---@field type string "auxiliary".
local controller_pyrotechnicCharge = {}

--- Lit la configuration jbeam et retrouve le nœud sonore.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/pyrotechnicCharge.lua:52
---@param jbeamData table Données jbeam du contrôleur.
function controller_pyrotechnicCharge.init(jbeamData) end

--- Réarme la charge (hasTriggered = false).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/pyrotechnicCharge.lua:48
function controller_pyrotechnicCharge.reset() end

--- Déclenche la charge : joue le son sur le nœud, casse les breakgroups, détache les coupleurs et affiche un message de 5 s.
---Source : lua/vehicle/controller/pyrotechnicCharge.lua:19
function controller_pyrotechnicCharge.trigger() end

--- Chaque frame : si un electric de déclenchement est actif et que la charge n'est pas déjà tirée, appelle trigger().
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/pyrotechnicCharge.lua:32
---@param dt number Pas de temps en secondes.
function controller_pyrotechnicCharge.updateGFX(dt) end

return controller_pyrotechnicCharge
