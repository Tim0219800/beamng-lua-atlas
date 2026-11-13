---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/race/race.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Course en cours. Champs : path, vehIds, states (par id de véhicule), recoveryStates (instantanés de récupération par id), time (temps de course en s), lapCount, finishCount, started, suspended, checkpointTimes ('<tour>_<segment>' -> temps), aiPath, aiDetailedPath, sortPlacements (comparateur de classement : tour décroissant, puis index de point de contrôle décroissant, puis distance croissante au prochain point).
---@class gameplay_race_race
local gameplay_race_race = {}

--- Abandonne la course d'un véhicule (ignoré s'il a fini ou n'est pas actif) : événement raceAborted, IA arrêtée.
---Source : lua/ge/extensions/gameplay/race/race.lua:615
---@param id integer Véhicule.
function gameplay_race_race:abortRace(id) end

--- Calcule le chemin IA (aiPath, aiDetailedPath) à partir du chemin de course.
---Source : lua/ge/extensions/gameplay/race/race.lua:47
function gameplay_race_race:calcAIPath() end

--- Remplace un véhicule de course par un autre (transfère états et récupérations, recalcule les coins des roues).
---Source : lua/ge/extensions/gameplay/race/race.lua:361
---@param lastId integer Ancien véhicule.
---@param newId integer Nouveau véhicule.
function gameplay_race_race:changeRaceVehicle(lastId, newId) end

--- Vide la table d'événements d'un véhicule.
---Source : lua/ge/extensions/gameplay/race/race.lua:1166
---@param id integer Véhicule.
function gameplay_race_race:clearEvents(id) end

--- Termine le tour d'un véhicule : enregistre les temps du tour (lap, beginTime, endTime, lapTime, segmentTimes). S'il reste des tours, repart sur les segments de départ (événement lapComplete) ; sinon marque la course terminée (placement, raceComplete, IA à l'agressivité 0.5) et écrit éventuellement l'historique dans raceRecord/ si logRaceInfo.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/race/race.lua:667
---@param id integer Véhicule.
---@param endTime number Temps de fin du tour (s).
function gameplay_race_race:completeLap(id, endTime) end

--- Enregistre un instantané de l'état du véhicule avec le temps de course et la position de récupération associée.
---Source : lua/ge/extensions/gameplay/race/race.lua:628
---@param id integer Véhicule.
---@param recovery table startPosition de récupération.
function gameplay_race_race:createRecoveryPoint(id, recovery) end

--- Dessine des sphères pour les données hors piste d'un véhicule (chemin hors piste, points de sortie, de retour et de coupe maximale).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/race/race.lua:109
---@param data table État du véhicule contenant offTrackData.
function gameplay_race_race:debugDraw(data) end

--- Détecte les sorties et retours de piste d'un véhicule, enregistre sa trajectoire hors piste et calcule la profondeur de coupe et la distance parcourue hors piste (données de debug). Son appel est actuellement désactivé dans getTrackedData.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/race/race.lua:118
---@param data table État du véhicule.
---@param dt number Delta temps (s).
function gameplay_race_race:detectOffTrack(data, dt) end

--- En attente d'un départ lancé : teste si le véhicule est entré dans un des segments de départ, calcule alors l'heure exacte de départ (interpolée) et lève rollingStarted.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/race/race.lua:822
---@param id integer Véhicule.
---@param dt number Delta temps (s).
function gameplay_race_race:detectRollingStart(id, dt) end

--- Traite les événements d'un véhicule : notifie Hotlapping et LapTimes (pour le véhicule du joueur), remplit le journal d'événements, émet les hooks onRaceStarted, onRacePathnodeReached, onRaceComplete, onRaceAborted, enregistre les points de récupération et joue le son de point de passage.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/race/race.lua:1028
---@param id integer Véhicule.
---@param dt number Delta temps (s).
function gameplay_race_race:digestEvents(id, dt) end

--- Suspend ou reprend la course (le temps et le suivi s'arrêtent) et prévient les applications Hotlapping et LapTimes.
---Source : lua/ge/extensions/gameplay/race/race.lua:330
---@param sus boolean true pour suspendre.
function gameplay_race_race:doSuspend(sus) end

--- Dessine les prochains pathnodes (rouge), les suivants (orange) et les annonces restantes d'un véhicule.
---Source : lua/ge/extensions/gameplay/race/race.lua:1175
---@param id integer Véhicule.
function gameplay_race_race:drawDebug(id) end

--- Recalcule pour un véhicule les prochains pathnodes visibles (nextPathnodes), ceux d'après (overNextPathnodes) et la liste décalée sans branchement, avec un type par pathnode : 'branch', 'final', 'lap', 'start', 'recovery' ou 'default'.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/race/race.lua:734
---@param id integer Véhicule.
function gameplay_race_race:findNextPathnodes(id) end

--- Formate un écart de temps avec signe au format +MM:SS.mmm ; renvoie 'N/A' si nil. Attend des secondes (voir notes pour l'incohérence avec timeDifferenceToFirst).
---Source : lua/ge/extensions/gameplay/race/race.lua:1315
---@param timeDiff number|nil Écart en secondes.
---@return string  Texte formaté.
function gameplay_race_race:formatTimeDifference(timeDiff) end

--- Calcule, pour une portion hors route, la distance qu'il aurait fallu parcourir le long du chemin de navigation et la distance coupée à vol d'oiseau.
---Source : lua/ge/extensions/gameplay/race/race.lua:67
---@param pointA vec3 Point de sortie de route.
---@param pointB vec3 Point de retour sur la route.
---@param inNextAiPathIdx integer Index du point suivant du chemin IA à la sortie.
---@param inPrevAiPathIdx integer Index du point précédent à la sortie.
---@param outNextAiPathIdx integer Index du point suivant au retour.
---@param outPrevAiPathIdx integer Index du point précédent au retour.
---@return number  Distance le long du chemin (m).
---@return number  Distance coupée entre A et B (m).
function gameplay_race_race:getDistOnNav(pointA, pointB, inNextAiPathIdx, inPrevAiPathIdx, outNextAiPathIdx, outPrevAiPathIdx) end

--- Pour chaque véhicule ayant un timeDifferenceToFirst, renvoie l'écart avec le premier à avoir franchi le même point, son texte formaté et le classement.
---Source : lua/ge/extensions/gameplay/race/race.lua:1327
---@return table<integer, table>  id -> {timeDifference, timeDifferenceFormatted, placement}
function gameplay_race_race:getTimeDifferencesToFirst() end

--- Met à jour pour chaque véhicule en course la position de l'avant, l'index sur le chemin IA, l'état isOnRoad, puis calcule le classement (placement), en comptant les véhicules déjà arrivés.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/race/race.lua:182
---@param dt number Delta temps (s).
function gameplay_race_race:getTrackedData(dt) end

--- Position d'un véhicule : objet de scène, sinon map.objects ; renvoie vec3() avec un log d'erreur si introuvable.
---Source : lua/ge/extensions/gameplay/race/race.lua:602
---@param id integer Véhicule.
---@return vec3  Position.
function gameplay_race_race:getVehiclePosition(id) end

--- Détecte si le véhicule traverse une annonce non encore déclenchée dans ses segments courants ; lève pacenoteReached et pacenoteIdReached (une seule par image).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/race/race.lua:1005
---@param id integer Véhicule.
function gameplay_race_race:handlePacenotes(id) end

--- Restaure l'état du dernier instantané, le temps de course si recoverAffectsTotalTime, et replace le véhicule sur la position de récupération sans réparation (moveResetVehicleTo avec repair false), puis réinitialise la caméra.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/race/race.lua:650
---@param id integer Véhicule.
function gameplay_race_race:handleRecover(id) end

--- Indique s'il existe au moins un point de récupération pour ce véhicule.
---Source : lua/ge/extensions/gameplay/race/race.lua:636
---@param id integer Véhicule.
---@return boolean  true s'il existe.
function gameplay_race_race:hasRecoveryPosition(id) end

--- Affiche en ImGui le journal d'événements d'un véhicule (colonnes Time et Event).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/race/race.lua:1194
---@param id integer Véhicule.
---@param im table Module ui_imgui.
function gameplay_race_race:inDrawEventlog(id, im) end

--- Affiche en ImGui un tour et ses temps de segments.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/race/race.lua:1300
---@param lTimes table Entrée de historicTimes.
---@param im table Module ui_imgui.
function gameplay_race_race:inDrawLapTimes(lTimes, im) end

--- Affiche en ImGui la liste des temps de segments (du plus récent au plus ancien).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/race/race.lua:1280
---@param sTimes table[] Temps de segments.
---@param im table Module ui_imgui.
---@param mode string|nil 'index' (défaut), 'names' ou 'id'.
---@param prefix string|nil Préfixe du libellé.
function gameplay_race_race:inDrawSegmentTimes(sTimes, im, mode, prefix) end

--- Affiche en ImGui les temps d'un véhicule (tour courant, total, tours précédents, segments si detail).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/race/race.lua:1220
---@param id integer Véhicule.
---@param im table Module ui_imgui.
---@param detail boolean|nil true pour afficher les temps de segments.
---@return boolean  true si l'icône de détail a été cliquée.
function gameplay_race_race:inDrawTimes(id, im, detail) end

--- Constructeur : valeurs par défaut et comparateur de classement.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/race/race.lua:7
function gameplay_race_race:init() end

--- À appeler à chaque image : pour chaque véhicule, vide les événements, gère les récupérations demandées, met à jour la position sur le parcours (updateVehicle), le dessin de debug et digère les événements ; puis met à jour le classement, l'application LapTimes et avance le temps de course. Ne fait rien tant que la course n'est pas démarrée.
---Source : lua/ge/extensions/gameplay/race/race.lua:278
---@param dt number Delta temps simulé (s).
function gameplay_race_race:onUpdate(dt) end

--- Formate un temps en secondes au format MM:SS.mmm.
---Source : lua/ge/extensions/gameplay/race/race.lua:1308
---@param time number Temps en secondes.
---@return string  Texte formaté.
function gameplay_race_race:raceTime(time) end

--- Demande la récupération du véhicule au dernier point de récupération ; effective à la prochaine mise à jour.
---Source : lua/ge/extensions/gameplay/race/race.lua:644
---@param id integer Véhicule.
---@return boolean  true seulement si un état de récupération existe.
function gameplay_race_race:requestRecover(id) end

--- Définit le chemin de course, lance autoConfig et calcule le chemin IA.
---Source : lua/ge/extensions/gameplay/race/race.lua:51
---@param path table Chemin (gameplay/race/path).
function gameplay_race_race:setPath(path) end

--- Charge un chemin de course depuis un fichier JSON (désérialisé dans un nouveau chemin) puis l'applique avec setPath. Logue une erreur si le fichier est introuvable.
---Source : lua/ge/extensions/gameplay/race/race.lua:35
---@param file string|nil Chemin du fichier .race.json / .path.json.
function gameplay_race_race:setPathFile(file) end

--- Définit la liste des véhicules participants et réinitialise leurs états.
---Source : lua/ge/extensions/gameplay/race/race.lua:57
---@param ids integer[] Ids de véhicules.
function gameplay_race_race:setVehicleIds(ids) end

--- Invalide le tour en cours d'un véhicule (circuits fermés uniquement). Sans keepLapProgress, saute aussi la progression : le prochain pathnode devient la ligne d'arrivée du tour.
---Source : lua/ge/extensions/gameplay/race/race.lua:349
---@param id integer Véhicule.
---@param keepLapProgress boolean|nil true pour garder la progression du tour.
function gameplay_race_race:skipLap(id, keepLapProgress) end

--- Lance l'IA d'un véhicule sur le chemin de course (ai.driveUsingPath) : boucle jusqu'à un tour de plus pour un circuit fermé, ou chemin prolongé de 250 m après l'arrivée sinon. Sans agressivité donnée, l'estime d'après la classe de performance du véhicule (S 1, A 0.9, B 0.8, C 0.7, D 0.6, autre 0.85).
---Source : lua/ge/extensions/gameplay/race/race.lua:395
---@param id integer Véhicule.
---@param aggression number|nil Agressivité de 0 à 1.
function gameplay_race_race:startAiVehicle(id, aggression) end

--- Démarre la course : charge si besoin core_hotlapping / core_lapTimes, remet le temps à 0, crée l'état de chaque véhicule (segments de départ, coins des roues, IA si autoAiMode) et calcule les prochains pathnodes. L'événement raceStarted est levé pour chaque véhicule.
---Source : lua/ge/extensions/gameplay/race/race.lua:469
function gameplay_race_race:startRace() end

--- Arrête l'IA d'un véhicule (mode 'stop').
---Source : lua/ge/extensions/gameplay/race/race.lua:461
---@param id integer Véhicule.
function gameplay_race_race:stopAiVehicle(id) end

--- Arrête la course : prévient Hotlapping et LapTimes et arrête les véhicules IA.
---Source : lua/ge/extensions/gameplay/race/race.lua:584
function gameplay_race_race:stopRace() end

--- Avance les coins des roues du véhicule, gère le départ lancé, les annonces, un éventuel tour invalidé, puis teste si un segment est terminé ou un suivant atteint. Enregistre le temps du segment (interpolé avec l'instant de franchissement), applique l'agressivité IA des champs personnalisés (aiAggression, tag aiCoef), termine le tour si besoin, met à jour les prochains pathnodes et signale un point de récupération atteint.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/race/race.lua:852
---@param id integer Véhicule.
---@param dt number Delta temps (s).
function gameplay_race_race:updateVehicle(id, dt) end

