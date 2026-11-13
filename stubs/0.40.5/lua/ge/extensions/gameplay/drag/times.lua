---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/drag/times.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Chronométrage du drag. Chaque frame, onUpdate fait avancer le timer principal de chaque racer dont les timers sont démarrés (dtSim en solo, horloge de départ synchronisée en MP), détecte le franchissement de chaque distance configurée (timers de type distanceTimer et velocity, interpolés entre deux frames), calcule le temps de réaction (timer de distance < 0,5 m) et disqualifie un départ anticipé (temps de réaction négatif). Il fournit aussi des lecteurs de valeurs de timers (locaux ou reçus du réseau en MP) utilisés par le classement et le ticket. Débloque le succès DRAG_QUARTER_MILE pour un time_1_4 <= 8,20 s du joueur non disqualifié.
--- Accès : extension `gameplay_drag_times` : `extensions.load("gameplay_drag_times")`, puis la globale `gameplay_drag_times`
---@class gameplay_drag_times
---@field dependencies string[] gameplay_drag_core, gameplay_achievement.
gameplay_drag_times = {}

--- Marque les timers d'un racer comme démarrés (racer.timersStarted = true). Appelée via le hook dragRaceStarted quand le feu vert part.
---Source : lua/ge/extensions/gameplay/drag/times.lua:270
---@param vehId integer ID du véhicule du racer.
function gameplay_drag_times.dragRaceStarted(vehId) end

--- Valeur du timer important (data.importantTimerId, time_1_4 par défaut) d'un racer.
---Source : lua/ge/extensions/gameplay/drag/times.lua:89
---@param racer table Racer.
---@param data table|nil Données de piste (importantTimerId).
---@return number  Valeur en s (ou m/s pour un timer de vitesse), 0 si absente.
function gameplay_drag_times.getImportantTimerValue(racer, data) end

--- Temps effectif de comparaison pour le classement : valeur du timer important plus le temps de réaction si c'est un timer de distance (ou si le timer n'est pas dans la config) ; la valeur brute pour un timer de vitesse.
---Source : lua/ge/extensions/gameplay/drag/times.lua:112
---@param racer table Racer.
---@param data table|nil Données de piste (importantTimerId, timers).
---@return number  Temps effectif.
function gameplay_drag_times.getImportantTimerValueForWin(racer, data) end

--- En MP, renvoie la table des timers diffusés par le réseau pour le véhicule du racer (clé = id de timer). Utilise un cache véhicule vers joueur MP reconstruit si la course ou les joueurs changent.
---Source : lua/ge/extensions/gameplay/drag/times.lua:56
---@param racer table Racer (vehId).
---@return table|nil  Timers réseau, nil hors MP ou si inconnus.
function gameplay_drag_times.getNetworkTimersForRacer(racer) end

--- Valeur d'un timer pour un racer : la valeur réseau en MP si elle existe, sinon la valeur locale.
---Source : lua/ge/extensions/gameplay/drag/times.lua:82
---@param racer table Racer.
---@param timerId string Identifiant du timer (par ex. 'time_1_4').
---@return number  Valeur, 0 si absente.
function gameplay_drag_times.getRacerTimerValue(racer, timerId) end

--- Temps de réaction d'un racer : timer réseau dont l'id contient 'reaction' en MP, sinon valeur du timer de type distanceTimer à moins de 0,5 m.
---Source : lua/ge/extensions/gameplay/drag/times.lua:94
---@param racer table Racer.
---@return number  Temps de réaction en s (-1 si invalide, 0 si absent).
function gameplay_drag_times.getReactionTimerValue(racer) end

--- Hook de clear drag ; ne fait rien.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drag/times.lua:284
function gameplay_drag_times.onDragClear() end

--- Hook de reset drag : appelle reset().
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drag/times.lua:283
function gameplay_drag_times.onDragReset() end

--- Mise à jour par frame des timers : temps écoulé, passages de distance/vitesse, réaction, succès quart de mile, freinage d'urgence, synchronisation MP (et checkTimerDrift de l'hôte). Sans effet si la course est terminée.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drag/times.lua:138
---@param dtReal number Delta temps réel (s).
---@param dtSim number Delta temps simulé (s).
---@param dtRaw number Delta brut (s).
function gameplay_drag_times.onUpdate(dtReal, dtSim, dtRaw) end

--- Remet à zéro tous les timers sauf le dial de chaque racer (valeur 0, isSet = false) et timersStarted = false.
---Source : lua/ge/extensions/gameplay/drag/times.lua:12
function gameplay_drag_times.reset() end

--- Alias de reset().
---Source : lua/ge/extensions/gameplay/drag/times.lua:276
function gameplay_drag_times.resetDragRaceValues() end

