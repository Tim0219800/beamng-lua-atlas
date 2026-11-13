---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/hotlapping.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Extension GE `core_hotlapping` : mode « tours chronométrés » du freeroam (appli Hotlapping). Le joueur pose des checkpoints (points de passage avec position, direction et rayon) pour définir un circuit, le chrono démarre quand il passe dans le premier, puis les tours et sections sont chronométrés avec écarts par rapport au meilleur tour. Le circuit peut être sauvegardé/chargé (gameplay/hotlapping/<niveau>/*.race.json) et les véhicules IA peuvent le parcourir. Le module sert aussi d'afficheur de temps pour les scénarios de course (ancien système `onRace*`) et pour le nouveau système de course (`newRace*`).
--- Accès : extension `core_hotlapping` : `extensions.load("core_hotlapping")`, puis la globale `core_hotlapping`
---@class core_hotlapping
core_hotlapping = {}

--- Ajoute un checkpoint au circuit (mode édition seulement) et le relie au précédent par un segment. Sans argument, utilise la position du véhicule joueur posée sur la surface (ou la caméra), sa direction si le véhicule est à moins de 5 m, et le rayon courant (automatique ou fixé par changeRadius).
---Source : lua/ge/extensions/core/hotlapping.lua:250
---@param cpPos vec3|nil Position monde du centre.
---@param cpDir vec3|nil Direction/normal ; nil = pas de normal (passage dans les deux sens).
---@param cpRadius number|nil Rayon en mètres.
function core_hotlapping.addCheckPoint(cpPos, cpDir, cpRadius) end

--- Modifie le rayon de tous les checkpoints : +1 m si sign > 0, -1 m si sign < 0 (borné 1..15), retour au rayon automatique si sign == 0 (le 1er changement part de 5).
---Source : lua/ge/extensions/core/hotlapping.lua:842
---@param sign number +1, -1 ou 0.
function core_hotlapping.changeRadius(sign) end

--- Oublie le compteur et l'id du dernier checkpoint et arrête l'IA. Ne vide pas le chemin lui-même.
---Source : lua/ge/extensions/core/hotlapping.lua:291
function core_hotlapping.clearAllCP() end

--- Formate des millisecondes en 'MM:SS.mmm' (arrondi à l'entier) ; avec addSign, préfixe '+' ou '-'.
---Source : lua/ge/extensions/core/hotlapping.lua:714
---@param timeInMillis number|nil Temps en ms.
---@param addSign boolean|nil true = ajoute le signe (écarts).
---@return string|nil  Texte ; nil si timeInMillis est nil.
function core_hotlapping.formatMillis(timeInMillis, addSign) end

--- Couleur CSS d'un écart : 'red' si > 0 (plus lent), 'green' si < 0, '' si nul.
---Source : lua/ge/extensions/core/hotlapping.lua:732
---@param val number Écart en ms.
---@return string  'red', 'green' ou ''.
function core_hotlapping.getDiffColor(val) end

--- Données de temps formatées pour l'UI : {normal = résumé par tour, detail = sections puis tour}. La table est réutilisée à chaque appel.
---Source : lua/ge/extensions/core/hotlapping.lua:592
---@return table  {normal, detail}.
function core_hotlapping.getTimeInfo() end

--- Table brute des temps par tour et section (voir notes).
---Source : lua/ge/extensions/core/hotlapping.lua:584
---@return table  times (référence interne).
function core_hotlapping.getTimeInfoRaw() end

--- Charge un circuit depuis gameplay/hotlapping/<niveau>/<nom>.race.json ; à défaut, cherche l'ancien format dans settings/hotlapping (fichiers dont le chemin contient le nom). Puis arrête le chrono, vide, relance le mode hotlapping et prévient l'UI.
---Source : lua/ge/extensions/core/hotlapping.lua:748
---@param originalFilename string Nom du circuit sans extension.
function core_hotlapping.load(originalFilename) end

--- Hook du nouveau système : le tour courant a été sauté ; le marque 'skipped' et remet le checkpoint à 1 si state.skippedLap.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/hotlapping.lua:932
---@param state table État du véhicule.
---@param info table Non utilisé.
function core_hotlapping.newRaceLapSkipped(state, info) end

--- Hook du nouveau système : passage d'un pathnode du joueur. Termine la course si state.complete, sinon avance tour/checkpoint (ignore les recoveries) et met à jour les temps.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/hotlapping.lua:906
---@param state table État du véhicule dans la course (complete, events).
---@param info table Infos du passage (lapped).
function core_hotlapping.newRacePathnodeReached(state, info) end

--- Hook du nouveau système de course : démarre le suivi (course fermée, tours depuis 1, horloge = race.time*1000) et détecte les circuits à branches (comparaisons désactivées).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/hotlapping.lua:890
---@param race table Objet course (time, path.pathnodes, path.config.branching).
function core_hotlapping.newRaceStart(race) end

--- Hook du nouveau système : arrêt de la course (started = false).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/hotlapping.lua:961
function core_hotlapping.newRaceStop() end

--- Prévu pour le passage d'un checkpoint (mode freeroam hérité) : si index est le prochain attendu, avance le compteur de tours/checkpoints. Aucun appel dans ce fichier.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/hotlapping.lua:329
---@param index integer Indice du checkpoint passé (0 = ligne de départ).
function core_hotlapping.onCheckPointPassed(index) end

--- Hook de fin de niveau : arrête le mode hotlapping.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/hotlapping.lua:878
function core_hotlapping.onClientEndMission() end

--- Hook de début de niveau : arrête le mode hotlapping et remet l'appli à zéro (HotlappingResetApp).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/hotlapping.lua:873
function core_hotlapping.onClientStartMission() end

--- Hook de déchargement : arrête le mode hotlapping.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/hotlapping.lua:882
function core_hotlapping.onExtensionUnloaded() end

--- Hook de changement d'état de jeu : force le prochain envoi à l'UI.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/hotlapping.lua:949
---@param ... any Non utilisé.
function core_hotlapping.onGameStateUpdate(...) end

--- Hook d'ouverture/fermeture de menu : force le prochain envoi à l'UI.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/hotlapping.lua:953
---@param ... any Non utilisé.
function core_hotlapping.onMenuToggled(...) end

--- Hook de rendu : en édition, dessine sphères, colonnes verticales (la première en orange) et flèches de direction des checkpoints ; sinon fait rendre les marqueurs de course.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/hotlapping.lua:362
---@param dt number Delta temps de rendu en secondes.
---@param dtSim number Delta temps de simulation.
function core_hotlapping.onPreRender(dt, dtSim) end

--- Hook de l'ancien système : fin de course ; arrête le chrono et stocke les temps détaillés dans scenario.detailedTimes.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/hotlapping.lua:1017
---@param final any Non utilisé.
function core_hotlapping.onRaceResult(final) end

--- Hook de l'ancien système de scénario de course : démarre le suivi avec le chrono du scénario (scenario.timer en secondes), course fermée, tours depuis 1 ; circuits à branches si lapConfigBranches est défini.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/hotlapping.lua:969
function core_hotlapping.onRaceStart() end

--- Hook de l'ancien système : le joueur a atteint un waypoint. Gère fin de course, changement de tour (lapDiff == 1) ou de checkpoint et met à jour les temps. Ignore les autres véhicules.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/hotlapping.lua:986
---@param wpInfo table {vehicleId, next, lapDiff, …}.
function core_hotlapping.onRaceWaypointReached(wpInfo) end

--- Hook de fondu d'écran : force le prochain envoi à l'UI.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/hotlapping.lua:957
---@param ... any Non utilisé.
function core_hotlapping.onScreenFadeState(...) end

--- Hook par image : démarre la course quand le joueur entre dans le premier checkpoint, gère la pause, met à jour la course et le temps total, puis envoie l'état à l'UI.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/hotlapping.lua:389
---@param dt number Delta temps réel en secondes.
---@param dtSim number Delta temps de simulation.
function core_hotlapping.onUpdate(dt, dtSim) end

--- Hook de reset de véhicule : si le joueur est remis près (moins de 80 m) du départ pendant une course, arrête l'IA et la replace à son point de départ.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/hotlapping.lua:866
---@param id integer Id du véhicule.
function core_hotlapping.onVehicleResetted(id) end

--- Envoie à l'UI (HotlappingTimer) l'état du chrono (getTimeInfo plus stop, justLapped, delta, closed, running, justStarted) si un checkpoint vient d'être passé, un tour terminé ou un envoi forcé est demandé.
---Source : lua/ge/extensions/core/hotlapping.lua:459
function core_hotlapping.passTimeToGUI() end

--- Liste les circuits disponibles (niveau courant, plus anciens dans settings/hotlapping) sans extension.
---Source : lua/ge/extensions/core/hotlapping.lua:827
---@return string[]  Noms de circuits (caractères alphanumériques, '-' et '_' avant le premier autre caractère).
function core_hotlapping.refreshTracklist() end

--- Renomme un circuit du niveau courant (<ancien>.race.json -> <nouveau>.race.json).
---Source : lua/ge/extensions/core/hotlapping.lua:813
---@param oldName string Ancien nom sans extension.
---@param newName string Nouveau nom sans extension.
function core_hotlapping.rename(oldName, newName) end

--- Sauvegarde le circuit en JSON (gameplay/hotlapping/<niveau>/<date>.race.json par défaut), envoie HotlappingSuccessfullySaved à l'UI. Refuse si le chemin est invalide.
---Source : lua/ge/extensions/core/hotlapping.lua:797
---@param filePath string|nil Chemin de sortie ; défaut daté dans le dossier du niveau courant.
function core_hotlapping.save(filePath) end

--- Fige les temps de la section et du tour à totalTime à la fin de la course et met à jour écart et meilleur tour.
---Source : lua/ge/extensions/core/hotlapping.lua:475
function core_hotlapping.setEndTime() end

--- Met à jour les temps courants : crée au besoin l'enregistrement du tour et du checkpoint, ferme le précédent, calcule durées, écarts par rapport au meilleur tour et met à jour le meilleur tour (comparaisons désactivées pour les courses à branches).
---Source : lua/ge/extensions/core/hotlapping.lua:504
---@param ignoreNewLap any Non utilisé dans le code.
function core_hotlapping.setTime(ignoreNewLap) end

--- Affiche ou cache les marqueurs de la course et coupe/remet le son des checkpoints.
---Source : lua/ge/extensions/core/hotlapping.lua:298
---@param value boolean true = visibles.
function core_hotlapping.setVisible(value) end

--- Passe le tour en cours (marqué 'skipped' dans les temps) via raceData:skipLap pour le véhicule joueur.
---Source : lua/ge/extensions/core/hotlapping.lua:209
---@param keepLapProgress boolean|nil Transmis à raceData:skipLap : conserver ou non la progression dans le tour (déduit du code).
function core_hotlapping.skipLap(keepLapProgress) end

--- Démarre le chrono (appelé automatiquement quand le joueur passe dans le premier checkpoint). En mode édition, valide le chemin, crée l'objet de course (1000 tours, appli hotlapping, audio de checkpoint), les marqueurs visuels et joue le son UI_Checkpoint. Arrête immédiatement si le chemin est invalide.
---Source : lua/ge/extensions/core/hotlapping.lua:168
function core_hotlapping.start() end

--- Fait parcourir le circuit en boucle (1000 tours, évitement de véhicules activé) à tous les véhicules IA non trafic/non garés. Si aucune course n'est démarrée et que l'on est en édition, démarre d'abord la course.
---Source : lua/ge/extensions/core/hotlapping.lua:104
function core_hotlapping.startAi() end

--- Entre en mode édition du circuit : réinitialise l'état, crée un objet de chemin (gameplay/race/path) et ajoute le premier checkpoint à la position du véhicule. Désactive le mode (avertissement) s'il n'y a pas de véhicule joueur.
---Source : lua/ge/extensions/core/hotlapping.lua:56
function core_hotlapping.startHotlapping() end

--- Arrête les véhicules marqués isHotlapping (ai.setMode('stop')) et, si respawn, les replace à leur position sauvegardée (recovery.loadHome).
---Source : lua/ge/extensions/core/hotlapping.lua:135
---@param respawn boolean|nil true = remettre les véhicules à leur 'home'.
function core_hotlapping.stopAi(respawn) end

--- Arrête tout : stoppe le chrono, quitte le mode édition, détruit le chemin et retire le marquage isHotlapping des véhicules.
---Source : lua/ge/extensions/core/hotlapping.lua:88
function core_hotlapping.stopHotlapping() end

--- Arrête le chrono, vide les temps, arrête la course et les marqueurs ; repasse en mode édition si une course tournait ; arrête l'IA.
---Source : lua/ge/extensions/core/hotlapping.lua:216
function core_hotlapping.stopTimer() end

