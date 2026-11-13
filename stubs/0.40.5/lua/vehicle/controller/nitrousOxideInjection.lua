---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/nitrousOxideInjection.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Contrôleur auxiliaire de commande du protoxyde d'azote (N2O, type "auxiliary", relevantDevice "mainEngine"). Il arme/désarme le système via electrics.values (électrique d'armement), purge les conduites à l'armement et ajoute un bouton « N2O » au panneau de contrôle simplifié et une entrée au menu radial. L'injection elle-même est gérée par le moteur (engine.nitrousOxideInjection) ; ce contrôleur ne fait que l'interface et l'armement.
--- Accès : contrôleur `nitrousOxideInjection` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`
---@class controller_nitrousOxideInjection
---@field relevantDevice string "mainEngine" : dispositif de powertrain concerné (valeur par défaut).
---@field type string "auxiliary".
local controller_nitrousOxideInjection = {}

--- Restaure l'état d'armement.
---Source : lua/vehicle/controller/nitrousOxideInjection.lua:71
---@param data table|nil Table renvoyée par serialize.
function controller_nitrousOxideInjection.deserialize(data) end

--- Renvoie le temps de purge restant.
---Source : lua/vehicle/controller/nitrousOxideInjection.lua:77
---@return table  Table d'état (réutilisée).
function controller_nitrousOxideInjection.getState() end

--- Lit la configuration, retrouve le moteur, enregistre le menu radial et affiche l'état.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/nitrousOxideInjection.lua:104
---@param jbeamData table Données jbeam du contrôleur.
function controller_nitrousOxideInjection.init(jbeamData) end

--- Efface les données d'état de l'interface.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/nitrousOxideInjection.lua:100
---@param jbeamData table Données jbeam du contrôleur.
function controller_nitrousOxideInjection.reset(jbeamData) end

--- Renvoie l'état d'armement.
---Source : lua/vehicle/controller/nitrousOxideInjection.lua:65
---@return table  {isArmed = valeur electrics}
function controller_nitrousOxideInjection.serialize() end

--- Active/désactive l'électrique d'override de l'injection.
---Source : lua/vehicle/controller/nitrousOxideInjection.lua:53
---@param active boolean Vrai pour forcer l'injection.
function controller_nitrousOxideInjection.setOverride(active) end

--- Restaure le temps de purge restant (borné 0..purgeTime).
---Source : lua/vehicle/controller/nitrousOxideInjection.lua:84
---@param data table|nil Table d'état.
function controller_nitrousOxideInjection.setState(data) end

--- Arme ou désarme le système (purge des conduites à l'armement) et affiche un message.
---Source : lua/vehicle/controller/nitrousOxideInjection.lua:57
function controller_nitrousOxideInjection.toggleActive() end

--- Met à jour le bouton du panneau simplifié quand le réservoir, l'armement ou l'activité changent (nop si pas de N2O) (assignée dynamiquement)
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/nitrousOxideInjection.lua:dyn
---@param dt number Pas de temps (s).
function controller_nitrousOxideInjection.updateGFX(dt) end

--- (Re)crée le bouton « N2O » du panneau simplifié avec la couleur (inactif, armé, actif) et le niveau du réservoir.
---Source : lua/vehicle/controller/nitrousOxideInjection.lua:25
function controller_nitrousOxideInjection.updateSimpleControlButtons() end

return controller_nitrousOxideInjection
