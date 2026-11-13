---@meta
-- tim19Atlas stub generated from lua/ge/extensions/oneshotRace/oneshotRaceCore.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Cœur commun des assistants (wizards) de course « one shot » : à partir d'un descripteur, createConfigurator() renvoie un objet qui garde la sélection (niveau, piste/« middle », réglages, véhicule), la résume pour l'interface (getConfiguration), fournit les meilleurs scores et démarre la course. Utilisé par quickraceConfigurator et lightrunnerConfigurator ; un moddeur peut s'en servir pour créer un nouvel assistant de sélection.
--- Accès : extension `oneshotRace_oneshotRaceCore` : `extensions.load("oneshotRace_oneshotRaceCore")`, puis la globale `oneshotRace_oneshotRaceCore`
---@class oneshotRace_oneshotRaceCore
---@field todNames string[] Noms des heures du jour proposées (night, sunrise, morning, earlyNoon, noon, lateNoon, afternoon, evening, sunset), indexées à partir de 1 (tod = 3 correspond à morning).
oneshotRace_oneshotRaceCore = {}

--- Crée un configurateur lié à un descripteur. L'objet renvoyé (Cfg) possède : getSelection, selectLevel(levelName), selectMiddle(levelName, middleName), selectVehicle(model, config, additionalData), updateSetting(key, value), toggleShowLapRecords(), getHighscores(), getConfiguration(), onWizardRouteEnter / onWizardLevelRouteEnter / onWizardMiddleRouteEnter / onWizardVehicleRouteEnter(context, toRoute, fromRoute, data), start().
---Source : lua/ge/extensions/oneshotRace/oneshotRaceCore.lua:78
---@param descriptor table Descripteur respectant le contrat décrit dans les notes.
---@return table  Configurateur (Cfg). getConfiguration renvoie {level, middle, vehicle, highscores, showLapRecords, isDisabled, todOptionKeys} ; isDisabled est vrai tant que niveau, piste et véhicule ne sont pas tous définis.
function oneshotRace_oneshotRaceCore.createConfigurator(descriptor) end

