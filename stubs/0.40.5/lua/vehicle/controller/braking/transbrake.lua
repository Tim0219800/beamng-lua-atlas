---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/braking/transbrake.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Contrôleur auxiliaire de transbrake (frein de boîte de drag racing) : il bloque la boîte via `gearbox:setLock(value)`. Le blocage est actif quand `gearbox.lockCoef == 0`. Publie cet état dans `electrics.values[electricsName]` et ajoute une entrée au menu radial. Peut aussi être commandé par l'évènement de gameplay `controller:<nom>`.
--- Accès : contrôleur `braking/transbrake` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`
---@class controller_braking_transbrake
---@field type string "auxiliary".
---@field updateGFX function nop par défaut, remplacé dans init par la fonction qui publie l'electrics quand la boîte existe.
local controller_braking_transbrake = {}

--- Renvoie si le transbrake est actif.
---Source : lua/vehicle/controller/braking/transbrake.lua:74
---@return table  Clé `<nom>Active` (boolean).
function controller_braking_transbrake.getState() end

--- Retrouve la boîte, choisit la fonction updateGFX et ajoute l'entrée du menu radial (une seule fois).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/braking/transbrake.lua:37
---@param jbeamData table Données jbeam du contrôleur.
function controller_braking_transbrake.init(jbeamData) end

--- Hook de controller.lua. Si le nom d'évènement est "controller:<typeName>" ou "controller:<name>", exécute la commande contenue dans eventData : {"setTransbrake", boolean}. Exemple : onGameplayEvent("controller:transbrake", {"setTransbrake", true}).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/braking/transbrake.lua:92
---@param event string Nom de l'évènement.
---@param eventData table {nomDeCommande, valeur}.
function controller_braking_transbrake.onGameplayEvent(event, eventData) end

--- Active ou désactive le transbrake pour correspondre à l'état sauvegardé (silencieusement).
---Source : lua/vehicle/controller/braking/transbrake.lua:79
---@param data table|nil Table d'état.
function controller_braking_transbrake.setState(data) end

--- Active ou relâche le blocage de la boîte (`gearbox:setLock`) et affiche un message sauf si silent.
---Source : lua/vehicle/controller/braking/transbrake.lua:21
---@param value boolean true pour bloquer.
---@param silent boolean|nil true pour ne pas afficher de message.
function controller_braking_transbrake.setTransbrake(value, silent) end

--- Inverse l'état du transbrake.
---Source : lua/vehicle/controller/braking/transbrake.lua:30
function controller_braking_transbrake.toggleTransbrake() end

return controller_braking_transbrake
