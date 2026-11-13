---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/highscores.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Extension GE `core_highscores` : stockage des meilleurs temps des scénarios dans settings/highscores.json, organisés par niveau, scénario et clé de configuration. Garde les 50 meilleurs enregistrements de chaque combinaison. Un moddeur s'en sert pour enregistrer un temps (setScenarioHighscores) ou lire le classement (getScenarioHighscores).
--- Accès : extension `core_highscores` : `extensions.load("core_highscores")`, puis la globale `core_highscores`
---@class core_highscores
core_highscores = {}

--- Lit et décode tout le fichier settings/highscores.json (après migration éventuelle de l'ancien fichier).
---Source : lua/ge/extensions/core/highscores.lua:25
---@return table  Table complète, {} si le fichier est absent ou vide.
function core_highscores.getHighscores() end

--- Enregistrements d'une combinaison niveau/scénario/config, triés du meilleur au moins bon, avec le champ `place` ajouté.
---Source : lua/ge/extensions/core/highscores.lua:38
---@param levelName string Nom du niveau.
---@param scenarioName string Nom du scénario.
---@param configKey string Clé de configuration (véhicule, options…).
---@return table[]  Liste d'enregistrements, {} si aucun.
function core_highscores.getScenarioHighscores(levelName, scenarioName, configKey) end

--- Écrit la table complète des highscores dans settings/highscores.json (JSON indenté).
---Source : lua/ge/extensions/core/highscores.lua:34
---@param scores table Table complète niveau -> scénario -> config -> enregistrements.
function core_highscores.setHighscores(scores) end

--- Enregistre un temps avec joueur et véhicule (construit l'enregistrement puis appelle setScenarioHighscoresCustom).
---Source : lua/ge/extensions/core/highscores.lua:77
---@param timeInMillis number Temps en millisecondes.
---@param vehicleBrand string Marque du véhicule.
---@param vehicleName string Nom du véhicule.
---@param playerName string Nom du joueur.
---@param levelName string Nom du niveau.
---@param scenarioName string Nom du scénario.
---@param configKey string Clé de configuration.
---@return integer  Place obtenue (1 = meilleur), -1 si hors du top 50.
function core_highscores.setScenarioHighscores(timeInMillis, vehicleBrand, vehicleName, playerName, levelName, scenarioName, configKey) end

--- Enregistre un temps avec un enregistrement libre : complète record (detailed, timeStamp, formattedTimestamp, timeInMillis, formattedTime), l'insère, trie, garde les 50 meilleurs et sauvegarde.
---Source : lua/ge/extensions/core/highscores.lua:86
---@param timeInMillis number Temps en millisecondes (arrondi à l'entier).
---@param record table Données libres de l'enregistrement ; modifié en place.
---@param levelName string Nom du niveau.
---@param scenarioName string Nom du scénario.
---@param configKey string Clé de configuration.
---@return integer  Place obtenue (1 = meilleur), -1 si hors du top 50.
function core_highscores.setScenarioHighscoresCustom(timeInMillis, record, levelName, scenarioName, configKey) end

