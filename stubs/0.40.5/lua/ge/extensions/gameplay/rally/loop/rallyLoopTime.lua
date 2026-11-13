---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/loop/rallyLoopTime.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Gère l'heure de la journée d'une boucle de rallye. Construit le réglage joueur « Loop Time » (Défaut, Maintenant, puis chaque heure HH:MM listée dans loopTimes), traduit le choix en paramètres d'environnement pour missionManager, et pilote le ciel via core_environment (play, time, date). Ne touche que les champs liés à l'heure ; la météo de la mission est conservée.
--- Accès : extension `gameplay_rally_loop_rallyLoopTime` : `extensions.load("gameplay_rally_loop_rallyLoopTime")`, puis la globale `gameplay_rally_loop_rallyLoopTime`
---@class gameplay_rally_loop_rallyLoopTime
---@field defaultValue string Valeur de l'option Défaut : '__rallyLoopTimeDefault'.
---@field key string Clé du réglage : 'rallyLoopTime'.
---@field nowValue string Valeur de l'option Maintenant : '__rallyLoopTimeNow'.
gameplay_rally_loop_rallyLoopTime = {}

--- Avance l'heure de la journée de seconds secondes de jeu : time = (time + seconds / dayLength) % 1. Sans effet si l'horloge n'est pas en play ou si dayLength est invalide.
---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopTime.lua:158
---@param seconds number Secondes à ajouter (doit être > 0).
---@return boolean  true si l'heure a été modifiée.
function gameplay_rally_loop_rallyLoopTime.advancePlayingTime(seconds) end

--- Applique la date réelle du jour (year, month, day) au ciel (positions du soleil, de la lune, des étoiles) sans changer l'heure.
---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopTime.lua:145
---@return boolean  false si core_environment est indisponible, sinon true.
function gameplay_rally_loop_rallyLoopTime.applyCurrentDate() end

--- Applique le choix à la table d'environnement de la mission (module setup d'environnement). Maintenant : enabled=false. Défaut : time=0, timeScale=0, _rallyForceStatic=true. Heure CSV : time analysé, timeScale=7/36. Complète la météo manquante.
---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopTime.lua:81
---@param environment table Table d'environnement modifiée sur place (ignorée si ce n'est pas une table).
---@param selectedValue string|nil Valeur choisie : nowValue, defaultValue, nil (= défaut) ou chaîne 'HH:MM'.
function gameplay_rally_loop_rallyLoopTime.applyToEnvironment(environment, selectedValue) end

--- Construit le réglage de type 'select' « Loop Time » : options Défaut, Maintenant, puis une option par heure de missionTypeData.loopTimes (la valeur est la chaîne d'horloge pour éviter les dérives de flottant).
---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopTime.lua:55
---@param missionTypeData table|nil Données du type de mission, lit loopTimes.
---@return table  Table de réglage {key, label, type, values, value, defaultValue, currentOption}.
function gameplay_rally_loop_rallyLoopTime.buildMissionSetting(missionTypeData) end

--- Analyse une liste d'heures "HH:MM" séparées par des virgules ; les entrées invalides (format, heure > 23, minute > 59) sont ignorées.
---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopTime.lua:39
---@param str string Liste, par exemple "08:00, 17:30".
---@return table  Liste de {clock = 'HH:MM', time = valeur brute tod.time dans [0,1)} ; vide si str n'est pas une chaîne.
function gameplay_rally_loop_rallyLoopTime.parseTimes(str) end

--- Force l'état play de l'horloge du jour via core_environment.setTimeOfDay, avec éventuellement une heure à rétablir.
---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopTime.lua:130
---@param play boolean true pour faire avancer le temps, false pour le figer.
---@param time number|nil Valeur brute tod.time à appliquer en même temps.
---@return boolean  false si core_environment est indisponible, sinon true.
function gameplay_rally_loop_rallyLoopTime.setPlaying(play, time) end

