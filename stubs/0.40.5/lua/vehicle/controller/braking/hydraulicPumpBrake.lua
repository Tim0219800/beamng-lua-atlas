---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/braking/hydraulicPumpBrake.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Contrôleur auxiliaire pour un freinage hydraulique alimenté par la pompe du moteur (véhicules lourds ou anciens). Les freins avant et arrière (`brakeF`, `brakeR`) ne fonctionnent que moteur tournant ; sans pression ou si des poutres de dommage sont cassées, le frein de stationnement est serré automatiquement. Propose une assistance en côte (frein arrière résiduel sans accélérateur) et un blocage des freins avant. Ordre d'appel : `defaultOrder = 50` (tôt).
--- Accès : contrôleur `braking/hydraulicPumpBrake` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`
---@class controller_braking_hydraulicPumpBrake
---@field defaultOrder number 50 : rang d'appel par défaut, tôt dans la liste triée.
---@field type string "auxiliary".
local controller_braking_hydraulicPumpBrake = {}

--- Hook de rupture de poutre : si la poutre est dans les tags de dommage avant ou arrière, désactive le frein correspondant jusqu'au reset.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/braking/hydraulicPumpBrake.lua:75
---@param id integer cid de la poutre.
---@param energy number Énergie de rupture (non utilisée).
function controller_braking_hydraulicPumpBrake.beamBroken(id, energy) end

--- Ajoute une variation au coefficient d'assistance en côte.
---Source : lua/vehicle/controller/braking/hydraulicPumpBrake.lua:111
---@param change number Variation (peut être négative).
function controller_braking_hydraulicPumpBrake.changeHillAssistCoef(change) end

--- Renvoie l'assistance en côte et le blocage avant pour la sauvegarde d'état.
---Source : lua/vehicle/controller/braking/hydraulicPumpBrake.lua:159
---@return table  Clés `<nom>_hillAssistCoef` et `<nom>_frontLockOutEnabled`.
function controller_braking_hydraulicPumpBrake.getState() end

--- Retrouve le moteur et les listes de poutres de dommage (via les tags jbeam).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/braking/hydraulicPumpBrake.lua:140
---@param jbeamData table Données jbeam du contrôleur.
function controller_braking_hydraulicPumpBrake.init(jbeamData) end

--- Réinitialise le lisseur du moteur, les coefficients de dommage et le frein de stationnement automatique.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/braking/hydraulicPumpBrake.lua:133
---@param jbeamData table Données jbeam.
function controller_braking_hydraulicPumpBrake.reset(jbeamData) end

--- Active ou désactive le blocage du frein avant (le frein avant est coupé quand actif).
---Source : lua/vehicle/controller/braking/hydraulicPumpBrake.lua:115
---@param enabled boolean true pour couper le frein avant.
---@param silent boolean|nil true pour ne pas afficher de message.
function controller_braking_hydraulicPumpBrake.setFrontLockOutEnabled(enabled, silent) end

--- Fixe le coefficient d'assistance en côte (0 à 1, remis à 0 s'il est <= 0.01) et affiche un message UI sauf si silent.
---Source : lua/vehicle/controller/braking/hydraulicPumpBrake.lua:94
---@param coef number Coefficient 0 à 1.
---@param silent boolean|nil true pour ne pas afficher de message.
function controller_braking_hydraulicPumpBrake.setHillAssistCoef(coef, silent) end

--- Restaure ces deux valeurs (silencieusement).
---Source : lua/vehicle/controller/braking/hydraulicPumpBrake.lua:165
---@param data table|nil Table d'état.
function controller_braking_hydraulicPumpBrake.setState(data) end

--- Inverse l'état du blocage du frein avant.
---Source : lua/vehicle/controller/braking/hydraulicPumpBrake.lua:129
function controller_braking_hydraulicPumpBrake.toggleFrontLockOutEnabled() end

--- Chaque frame : calcule brakeF/brakeR en tenant compte du moteur en marche, de l'assistance en côte, du blocage avant et des poutres cassées ; gère le frein de stationnement automatique et publie les electrics.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/braking/hydraulicPumpBrake.lua:31
---@param dt number Pas de temps en secondes.
function controller_braking_hydraulicPumpBrake.updateGFX(dt) end

return controller_braking_hydraulicPumpBrake
