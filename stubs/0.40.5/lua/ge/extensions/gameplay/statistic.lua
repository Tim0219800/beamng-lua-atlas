---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/statistic.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Extension de statistiques de jeu. Elle tient des métriques nommées (compteurs, valeurs, minuteurs) enregistrées dans settings/cloud/gameplay_stat.json, et une copie séparée par profil de carrière (career/gameplay_stat.json dans le slot de sauvegarde). Elle mesure le temps passé par mode, niveau et activité, compte des événements (véhicules apparus, resets, changements de véhicule, scénarios finis) et charge les modules de gameplay/statisticModules (watchJturn, watchRollover…) dont la fonction workload est appelée tour à tour sur le véhicule du joueur. Les moddeurs s'en servent pour lire, incrémenter ou observer des métriques.
--- Accès : extension `gameplay_statistic` : `extensions.load("gameplay_statistic")`, puis la globale `gameplay_statistic`
---@class gameplay_statistic
---@field dependencies string[] Extensions chargées avant : ui_imgui et core_gamestate.
gameplay_statistic = {}

--- Ajoute une fonction à la file des surveillances par véhicule. Appelée fn(vehicleObj, vehicleId, dtSim), une fonction par frame en tourniquet.
---Source : lua/ge/extensions/gameplay/statistic.lua:128
---@param fn function Fonction de surveillance.
function gameplay_statistic.addSchedule(fn) end

--- Enregistre une fonction appelée quand une métrique change. Signature du callback : fn(name, oldEntry, newEntry) ; newEntry.career indique le contexte carrière. Avec trigger, appelée une seule fois quand la valeur atteint le seuil.
---Source : lua/ge/extensions/gameplay/statistic.lua:356
---@param name string Nom de métrique, ou motif contenant « * ».
---@param trigger number|nil Seuil de valeur ; nil = à chaque changement.
---@param callbackFunction function Callback.
---@param career boolean|nil Écouter les métriques de carrière.
function gameplay_statistic.callbackRegister(name, trigger, callbackFunction, career) end

--- Retire un callback enregistré (mêmes name, trigger, fonction et career).
---Source : lua/ge/extensions/gameplay/statistic.lua:382
---@param name string Nom ou motif.
---@param trigger number|nil Seuil utilisé à l'enregistrement.
---@param callbackFunction function Callback.
---@param career boolean|nil Contexte carrière.
---@return boolean  true si retiré.
function gameplay_statistic.callbackRemove(name, trigger, callbackFunction, career) end

--- Enregistre le temps écoulé de tous les minuteurs en cours (sans les arrêter).
---Source : lua/ge/extensions/gameplay/statistic.lua:782
function gameplay_statistic.forceTimerUpdate() end

--- Ajoute value à la métrique name (la crée si absente), pour les statistiques générales et, si la carrière est active, pour celles de la carrière. Déclenche les callbacks associés.
---Source : lua/ge/extensions/gameplay/statistic.lua:230
---@param name string Nom de la métrique.
---@param value number Valeur à ajouter.
---@param aggregate boolean|nil Suivre aussi last, count, min, max.
function gameplay_statistic.metricAdd(name, value, aggregate) end

--- Renvoie une copie de l'entrée d'une métrique.
---Source : lua/ge/extensions/gameplay/statistic.lua:293
---@param name string Nom de la métrique.
---@param carreer boolean|nil true pour lire les données de la carrière (si active).
---@return table|nil  {value, …} ou nil si inconnue.
function gameplay_statistic.metricGet(name, carreer) end

--- Renvoie les copies de toutes les métriques dont le nom correspond à un motif Lua (string.match).
---Source : lua/ge/extensions/gameplay/statistic.lua:307
---@param namePattern string Motif Lua.
---@param carreer boolean|nil true pour la carrière (si active).
---@return table<string, table>  nom -> entrée.
function gameplay_statistic.metricGetMatchPattern(namePattern, carreer) end

--- Fixe la valeur de la métrique (général et carrière). Déclenche les callbacks.
---Source : lua/ge/extensions/gameplay/statistic.lua:273
---@param name string Nom de la métrique.
---@param value number Nouvelle valeur.
---@param aggregate boolean|nil Suivre aussi count, min, max.
function gameplay_statistic.metricSet(name, value, aggregate) end

--- Hook appelé à l'activation ou désactivation de la carrière : charge ou libère les statistiques du profil.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/statistic.lua:757
---@param active boolean true si la carrière devient active.
function gameplay_statistic.onCareerActive(active) end

--- Hook appelé à la fin d'un niveau : termine l'activité et sauvegarde.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/statistic.lua:526
---@param levelPath string Chemin du niveau.
function gameplay_statistic.onClientEndMission(levelPath) end

--- Hook appelé après le chargement du niveau : démarre l'activité et recharge les sous-modules.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/statistic.lua:531
---@param levelPath string Chemin du niveau.
function gameplay_statistic.onClientPostStartMission(levelPath) end

--- Hook appelé au début d'un niveau : redémarre le suivi d'activité.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/statistic.lua:522
---@param levelPath string Chemin du niveau.
function gameplay_statistic.onClientStartMission(levelPath) end

--- Hook : recharge le fichier et restaure l'état après rechargement Lua.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/statistic.lua:94
---@param data table Données de onSerialize.
function gameplay_statistic.onDeserialized(data) end

--- Hook : démarre le minuteur general/editor.time.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/statistic.lua:544
function gameplay_statistic.onEditorActivated() end

--- Hook : arrête le minuteur general/editor.time.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/statistic.lua:548
function gameplay_statistic.onEditorDeactivated() end

--- Hook appelé à la fermeture du jeu : termine l'activité et sauvegarde.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/statistic.lua:71
function gameplay_statistic.onExit() end

--- Hook : charge le fichier de statistiques et les sous-modules statisticModules.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/statistic.lua:776
function gameplay_statistic.onExtensionLoaded() end

--- Hook : sauvegarde.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/statistic.lua:78
function gameplay_statistic.onExtensionUnloaded() end

--- Hook appelé au changement d'état de jeu : redémarre le suivi d'activité (ignoré en carrière tant que le temps réel est à 0).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/statistic.lua:582
---@param newState table|nil Nouvel état.
function gameplay_statistic.onGameStateUpdate(newState) end

--- Hook : incrémente vehicle/spawned.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/statistic.lua:595
function gameplay_statistic.onPlayerVehicleCloned() end

--- Hook appelé à la sauvegarde du profil de carrière : écrit career/gameplay_stat.json dans le slot.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/statistic.lua:747
---@param currentSavePath string Dossier du slot de sauvegarde.
function gameplay_statistic.onSaveCurrentProfile(currentSavePath) end

--- Hook appelé à la fin d'un scénario : incrémente scenario/finished.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/statistic.lua:566
---@param scenario table Scénario.
function gameplay_statistic.onScenarioFinished(scenario) end

--- Hook appelé au chargement d'un scénario : redémarre le suivi d'activité.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/statistic.lua:559
---@param scenario table Scénario.
function gameplay_statistic.onScenarioLoaded(scenario) end

--- Hook appelé au redémarrage d'un scénario : incrémente scenario/restarted.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/statistic.lua:574
---@param scenario table Scénario.
function gameplay_statistic.onScenarioRestarted(scenario) end

--- Hook : sauvegarde puis renvoie l'état (activité, niveau, mode, minuteurs) avant rechargement Lua.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/statistic.lua:82
function gameplay_statistic.onSerialize() end

--- Hook : incrémente vehicle/spawned.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/statistic.lua:598
function gameplay_statistic.onSpawnDefaultVehicle() end

--- Hook appelé à chaque frame : cumule les temps réel et simulé, exécute une fonction de surveillance du véhicule joueur, dessine la fenêtre de debug si ouverte.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/statistic.lua:603
---@param dtReal number Temps réel écoulé (s).
---@param dtSim number Temps simulé écoulé (s).
---@param dtRaw number Temps brut écoulé (s).
function gameplay_statistic.onUpdate(dtReal, dtSim, dtRaw) end

--- Hook : oublie le véhicule du joueur s'il est détruit.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/statistic.lua:720
---@param vid integer Identifiant du véhicule.
function gameplay_statistic.onVehicleDestroyed(vid) end

--- Hook : incrémente vehicle/reset si c'est le véhicule du joueur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/statistic.lua:716
---@param vid integer Identifiant du véhicule.
function gameplay_statistic.onVehicleResetted(vid) end

--- Hook : incrémente vehicle/spawned.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/statistic.lua:592
function gameplay_statistic.onVehicleSelectorReplaceCurrent() end

--- Hook : incrémente vehicle/spawned.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/statistic.lua:589
function gameplay_statistic.onVehicleSelectorSpawnNew() end

--- Hook appelé à l'apparition d'un véhicule ; ne fait rien.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/statistic.lua:701
---@param vid integer Identifiant du véhicule.
---@param v userdata Objet véhicule.
function gameplay_statistic.onVehicleSpawned(vid, v) end

--- Hook appelé au changement de véhicule : pour le joueur 0, mémorise le véhicule et incrémente vehicle/switch.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/statistic.lua:704
---@param oldid integer Ancien véhicule.
---@param newid integer Nouveau véhicule (-1 si aucun).
---@param player integer Indice du joueur.
function gameplay_statistic.onVehicleSwitched(oldid, newid, player) end

--- Hook appelé au changement d'état du monde ; ne fait rien.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/statistic.lua:540
---@param worldReadyState integer État.
function gameplay_statistic.onWorldReadyState(worldReadyState) end

--- Retire une fonction de la file des surveillances.
---Source : lua/ge/extensions/gameplay/statistic.lua:133
---@param fn function Fonction ajoutée avec addSchedule.
---@return boolean  true si retirée.
function gameplay_statistic.removeSchedule(fn) end

--- Sauvegarde si nécessaire puis envoie à l'interface l'évènement StatisticData avec {general = entrées, career = entrées si active}.
---Source : lua/ge/extensions/gameplay/statistic.lua:735
function gameplay_statistic.sendGUIState() end

--- Ouvre ou ferme la fenêtre imgui de debug « gameplay_statistic Debugger » (modules, entrées, callbacks).
---Source : lua/ge/extensions/gameplay/statistic.lua:727
---@param newValue boolean true pour afficher.
function gameplay_statistic.setDebug(newValue) end

--- Démarre un minuteur nommé. Si un minuteur de ce nom tourne déjà, l'appel est ignoré avec un avertissement.
---Source : lua/ge/extensions/gameplay/statistic.lua:323
---@param name string Nom (aussi nom de la métrique alimentée).
---@param increment boolean|nil true (défaut) : ajoute le temps avec metricAdd ; false : metricSet.
---@param aggregate boolean|nil Mode agrégat (défaut false).
---@param useSimTime boolean|nil Utiliser le temps simulé plutôt que le temps réel (défaut false).
function gameplay_statistic.timerStart(name, increment, aggregate, useSimTime) end

--- Arrête le minuteur et enregistre le temps écoulé dans la métrique.
---Source : lua/ge/extensions/gameplay/statistic.lua:346
---@param name string Nom du minuteur.
---@return number  Secondes écoulées depuis le dernier enregistrement (0 si le minuteur n'existe pas).
function gameplay_statistic.timerStop(name) end

