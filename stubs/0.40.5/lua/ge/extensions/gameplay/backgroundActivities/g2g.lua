---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/backgroundActivities/g2g.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Activité de fond « g2g » : à l'activation, fondu au noir, apparition d'un véhicule aléatoire (voiture ou camion avec Top Speed > 10), puis fondu depuis le noir, le tout via util_stepHandler. À la désactivation, les véhicules créés sont supprimés. getVehicleOptions construit (et met en cache) la liste des modèles et configs candidats à partir de core_vehicles.getVehicleList().
--- Accès : extension `gameplay_backgroundActivities_g2g` : `extensions.load("gameplay_backgroundActivities_g2g")`, puis la globale `gameplay_backgroundActivities_g2g`
---@class gameplay_backgroundActivities_g2g
---@field dependencies table<integer, string> Extensions chargées avant : {"util_stepHandler"}.
gameplay_backgroundActivities_g2g = {}

--- Active l'activité : sans effet si déjà active. Lance une séquence de pas (fondu au noir, spawn d'un véhicule aléatoire parmi getVehicleOptions, fondu depuis le noir) qui appelle activateFinished à la fin. Les ids des véhicules créés sont mémorisés.
---Source : lua/ge/extensions/gameplay/backgroundActivities/g2g.lua:13
function gameplay_backgroundActivities_g2g.activate() end

--- Callback de fin de la séquence d'activation : journalise et force active = true.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/backgroundActivities/g2g.lua:30
function gameplay_backgroundActivities_g2g.activateFinished() end

--- Supprime les véhicules créés (notifie l'éditeur si présent, puis obj:delete()) et vide la liste d'ids. Sans effet si l'activité n'est pas active.
---Source : lua/ge/extensions/gameplay/backgroundActivities/g2g.lua:35
function gameplay_backgroundActivities_g2g.deactivate() end

--- Retourne (et met en cache) la liste des véhicules candidats : modèles de type Car ou Truck, hors bus et auxiliaires, avec au moins une config dont Top Speed > 10 et non auxiliaire.
---Source : lua/ge/extensions/gameplay/backgroundActivities/g2g.lua:89
---@return table<integer, {model: string, configs: table[], paints: string[]}>  Chaque entrée : clé du modèle, configs {config, name} et noms de peintures.
function gameplay_backgroundActivities_g2g.getVehicleOptions() end

--- Indique si l'activité est active.
---Source : lua/ge/extensions/gameplay/backgroundActivities/g2g.lua:70
---@return boolean|nil  true si active ; nil tant qu'elle n'a jamais été activée.
function gameplay_backgroundActivities_g2g.isActive() end

--- Hook appelé quand le mode carrière change d'état ; désactive l'activité si la carrière devient active.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/backgroundActivities/g2g.lua:81
---@param enabled boolean true si la carrière est activée.
function gameplay_backgroundActivities_g2g.onCareerActive(enabled) end

--- Hook appelé à la fin d'un niveau : désactive l'activité.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/backgroundActivities/g2g.lua:62
function gameplay_backgroundActivities_g2g.onClientEndMission() end

--- Hook appelé après le rechargement des extensions : corps vide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/backgroundActivities/g2g.lua:78
function gameplay_backgroundActivities_g2g.onDeserialized() end

--- Hook appelé avant le rechargement des extensions : désactive l'activité.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/backgroundActivities/g2g.lua:74
function gameplay_backgroundActivities_g2g.onSerialize() end

--- Hook de mise à jour : corps vide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/backgroundActivities/g2g.lua:59
---@param dtReal number Delta temps réel (s).
---@param dtSim number Delta temps simulation (s).
---@param dtRaw number Delta temps brut (s).
function gameplay_backgroundActivities_g2g.onUpdate(dtReal, dtSim, dtRaw) end

--- Hook appelé au changement de véhicule contrôlé : ne fait rien.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/backgroundActivities/g2g.lua:66
function gameplay_backgroundActivities_g2g.onVehicleSwitched() end

--- Désactive l'activité si elle est active, sinon l'active.
---Source : lua/ge/extensions/gameplay/backgroundActivities/g2g.lua:50
function gameplay_backgroundActivities_g2g.toggleActive() end

