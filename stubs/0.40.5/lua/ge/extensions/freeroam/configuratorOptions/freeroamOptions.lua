---@meta
-- tim19Atlas stub generated from lua/ge/extensions/freeroam/configuratorOptions/freeroamOptions.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Ajoute au configurateur de partie libre (écran de choix du niveau en freeroam) les options propres au freeroam : mode de trafic (désactivé, voitures garées, normal, police), heure du jour, date et défilement du jour (cycle jour/nuit). Il réagit aux hooks onFreeroamConfiguratorGetOptions (construction du menu) et onFreeroamConfiguratorApplyOptions (valeurs choisies) et écrit les choix dans freeroam_freeroam.spawningOptionsHelper. Un moddeur peut copier ce schéma pour ajouter ses propres options.
--- Accès : extension `freeroam_configuratorOptions_freeroamOptions` : `extensions.load("freeroam_configuratorOptions_freeroamOptions")`, puis la globale `freeroam_configuratorOptions_freeroamOptions`
---@class freeroam_configuratorOptions_freeroamOptions
freeroam_configuratorOptions_freeroamOptions = {}

--- Date par défaut d'un niveau pour l'environnement.
---Source : lua/ge/extensions/freeroam/configuratorOptions/freeroamOptions.lua:167
---@param levelName string Nom du niveau (résolu via core_levels.getLevelByName).
---@return integer  Horodatage os.time() de la date (heure fixée à 12 h).
function freeroam_configuratorOptions_freeroamOptions.getDefaultEnvironmentDate(levelName) end

--- Hook appelé quand le joueur valide le configurateur : transmet les options traffic_trafficMode, environment_timeOfDay, environment_date et environment_timePlay à freeroam_freeroam.spawningOptionsHelper (le mode de trafic est converti en trafficMode, trafficPolice et trafficParked).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/freeroam/configuratorOptions/freeroamOptions.lua:149
---@param options table<string, any> Valeurs choisies, indexées par la clé (key) de l'option.
function freeroam_configuratorOptions_freeroamOptions.onFreeroamConfiguratorApplyOptions(options) end

--- Hook appelé quand le configurateur construit ses options pour un niveau : insère dans options les groupes trafic et heure/date/défilement du jour.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/freeroam/configuratorOptions/freeroamOptions.lua:14
---@param level table Données du niveau (supportsTraffic, levelName, dir, defaultDate).
---@param options table[] Liste de groupes d'options à compléter (modifiée sur place).
function freeroam_configuratorOptions_freeroamOptions.onFreeroamConfiguratorGetOptions(level, options) end

