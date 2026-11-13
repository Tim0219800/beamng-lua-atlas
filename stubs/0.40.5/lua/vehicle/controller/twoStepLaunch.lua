---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/twoStepLaunch.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Contrôleur auxiliaire de « two-step » (limiteur de régime de départ arrêté). Une fois activé, il s'arme quand le véhicule est quasi à l'arrêt avec gaz ET frein enfoncés, puis impose au moteur un limiteur de régime temporaire (engine:setTempRevLimiter) à tempRevLimiterRPM. Relâcher frein ou gaz le désarme. Un moddeur l'active par toggleTwoStep/setTwoStep ou via le menu radial qu'il enregistre. Publie electrics.values.twoStep (nom jbeam electricsName).
--- Accès : contrôleur `twoStepLaunch` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`
---@class controller_twoStepLaunch
---@field type string "auxiliary".
local controller_twoStepLaunch = {}

--- Ajoute une valeur à la limite de régime du two-step et affiche un message.
---Source : lua/vehicle/controller/twoStepLaunch.lua:56
---@param amount number Variation en tr/min.
function controller_twoStepLaunch.changeTwoStepRPM(amount) end

--- Restaure l'état et le régime depuis la table de serialize.
---Source : lua/vehicle/controller/twoStepLaunch.lua:176
---@param data table Table {state, rpm}.
function controller_twoStepLaunch.deserialize(data) end

--- État synchronisable : <nom>_enabled (booléen) et <nom>_rpm.
---Source : lua/vehicle/controller/twoStepLaunch.lua:192
---@return table  Table d'état.
function controller_twoStepLaunch.getState() end

--- Lit les clés jbeam, récupère le moteur, fixe la limite de régime et enregistre les entrées du menu rapide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/twoStepLaunch.lua:91
---@param jbeamData table Données jbeam du contrôleur.
function controller_twoStepLaunch.init(jbeamData) end

--- Réinitialise le limiteur temporaire du moteur et repasse l'état en idle s'il était actif.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/twoStepLaunch.lua:82
function controller_twoStepLaunch.reset() end

--- Renvoie {state, rpm} pour la sauvegarde.
---Source : lua/vehicle/controller/twoStepLaunch.lua:169
---@return table  État courant.
function controller_twoStepLaunch.serialize() end

--- Applique des paramètres externes : isEnabled (booléen) et launchRPM (tr/min).
---Source : lua/vehicle/controller/twoStepLaunch.lua:183
---@param parameters table Table {isEnabled?, launchRPM?}.
function controller_twoStepLaunch.setParameters(parameters) end

--- Restaure activation et régime depuis la table de getState (silencieux).
---Source : lua/vehicle/controller/twoStepLaunch.lua:198
---@param data table|nil Table produite par getState.
function controller_twoStepLaunch.setState(data) end

--- Active (état idle) ou désactive le two-step (réinitialise le limiteur temporaire) et affiche un message sauf si silent.
---Source : lua/vehicle/controller/twoStepLaunch.lua:28
---@param enabled boolean Activer ?
---@param silent boolean|nil Ne pas afficher de message.
function controller_twoStepLaunch.setTwoStep(enabled, silent) end

--- Bascule l'activation du two-step.
---Source : lua/vehicle/controller/twoStepLaunch.lua:42
function controller_twoStepLaunch.toggleTwoStep() end

--- Chaque frame : fait avancer l'état (idle -> armed) et applique/enlève le limiteur temporaire, publie l'electric. (assignée dynamiquement)
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/twoStepLaunch.lua:dyn
---@param dt number Pas de temps en secondes.
function controller_twoStepLaunch.updateGFX(dt) end

return controller_twoStepLaunch
