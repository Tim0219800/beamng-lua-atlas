---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/loop/stagedCountdownUtils.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Fonctions communes au compte à rebours de départ de spéciale (nœud flowgraph et simulation de test) : lecture de l'horloge murale de l'environnement, réglages du compte à rebours selon les options rallyVisualPacenotes/rallyAudioPacenotes, calcul d'un compte à rebours calé sur la minute suivante, geler/dégeler le véhicule, dessin de debug du plan de départ et affichage ImGui d'état dans le nœud.
--- Accès : extension `gameplay_rally_loop_stagedCountdownUtils` : `extensions.load("gameplay_rally_loop_stagedCountdownUtils")`, puis la globale `gameplay_rally_loop_stagedCountdownUtils`
---@class gameplay_rally_loop_stagedCountdownUtils
gameplay_rally_loop_stagedCountdownUtils = {}

--- Données d'horloge pour l'UI : wallClockSecs, wallClockTime (texte 24 h via rallyUtil.formatTime24Hour) et trois drapeaux de saut à false.
---Source : lua/ge/extensions/gameplay/rally/loop/stagedCountdownUtils.lua:54
---@param wallClockSecs number Heure murale en secondes.
---@return table  {wallClockSecs, wallClockTime, canSkipTimeControls, isTimeControlSkipAvailable, canSkipCountdown}.
function gameplay_rally_loop_stagedCountdownUtils.buildRallyClockData(wallClockSecs) end

--- Prépare un compte à rebours qui se termine à la prochaine minute pleine de l'horloge murale (fenêtre de lancement = duration + 1 s).
---Source : lua/ge/extensions/gameplay/rally/loop/stagedCountdownUtils.lua:30
---@param duration number Durée du compte à rebours en secondes.
---@return table  {environmentStartTimeSecs, epochTime = 0, scheduledEventTime, targetStartTime = 1, timer}.
function gameplay_rally_loop_stagedCountdownUtils.calculateImmediateMinuteCountdown(duration) end

--- Dessine un plan violet (deux triangles de 10 m de large) avec une sphère au point d'origine ; avec normals, ajoute les axes « back » (vert) et « front » (rouge).
---Source : lua/ge/extensions/gameplay/rally/loop/stagedCountdownUtils.lua:64
---@param pos vec3 Position du plan.
---@param rot quat Orientation du plan.
---@param normals boolean|nil true pour dessiner les normales.
function gameplay_rally_loop_stagedCountdownUtils.drawDebugPlane(pos, rot, normals) end

--- Dessine une petite sphère au véhicule : verte si inside, rouge sinon.
---Source : lua/ge/extensions/gameplay/rally/loop/stagedCountdownUtils.lua:145
---@param vehPos vec3 Position.
---@param inside boolean Véhicule dans la zone.
function gameplay_rally_loop_stagedCountdownUtils.drawDebugVehiclePoint(vehPos, inside) end

--- Affiche dans le nœud (drawMiddle, ImGui) : indicateur TEST MODE, horloge, époque, heure de l'évènement, temps restant, contrôle de mise en place, état, replanifications, et zone/staged. Ne fait rien si nodeData.useImgui est faux.
---Source : lua/ge/extensions/gameplay/rally/loop/stagedCountdownUtils.lua:174
---@param im table ui_imgui.
---@param nodeData table Données du nœud (useImgui, test, wallClockSecs, currentEpochTime, scheduledEventTime, stagingCheckTime, state, rescheduleCount, maxReschedules, inZone, staged…).
---@param formatTimeFromSeconds function Fonction secondes -> texte.
function gameplay_rally_loop_stagedCountdownUtils.drawMiddleInfo(im, nodeData, formatTimeFromSeconds) end

--- Barre de progression du nœud : « Running » avec (duration - timer)/duration, « Done » (pleine) si terminé, « Waiting » (vide) sinon.
---Source : lua/ge/extensions/gameplay/rally/loop/stagedCountdownUtils.lua:227
---@param im table ui_imgui.
---@param state any État courant du nœud.
---@param duration number Durée totale en secondes.
---@param timer number Temps restant en secondes.
---@param STATE_COUNTDOWN_RUNNING any Valeur d'état « en cours ».
---@param STATE_FINISHED any Valeur d'état « terminé ».
function gameplay_rally_loop_stagedCountdownUtils.drawMiddleProgress(im, state, duration, timer, STATE_COUNTDOWN_RUNNING, STATE_FINISHED) end

--- Dessine la projection du véhicule sur le plan, une ligne et la distance signée (« past » orange si le véhicule a dépassé la ligne, « before » vert sinon). Les vec3 passés en paramètres servent de tampons pour éviter les allocations.
---Source : lua/ge/extensions/gameplay/rally/loop/stagedCountdownUtils.lua:95
---@param vehPos vec3 Position du véhicule.
---@param planePos vec3 Position du plan.
---@param rot quat Orientation du plan.
---@param tmpPlaneNormal vec3 Tampon réutilisable.
---@param tmpToVehicle vec3 Tampon réutilisable.
---@param tmpClosestPoint vec3 Tampon réutilisable.
---@param tmpMidPoint vec3 Tampon réutilisable.
function gameplay_rally_loop_stagedCountdownUtils.drawVehicleToPlaneDebug(vehPos, planePos, rot, tmpPlaneNormal, tmpToVehicle, tmpClosestPoint, tmpMidPoint) end

--- Gèle le véhicule (action 'setFreeze' true via core_vehicleBridge) pendant la phase de mise en place.
---Source : lua/ge/extensions/gameplay/rally/loop/stagedCountdownUtils.lua:150
---@param vehId integer|nil Id du véhicule.
---@param logTag string Étiquette de log.
---@return boolean  true si le véhicule a été trouvé.
function gameplay_rally_loop_stagedCountdownUtils.freezeVehicle(vehId, logTag) end

--- Heure murale actuelle de l'environnement, en secondes depuis minuit.
---Source : lua/ge/extensions/gameplay/rally/loop/stagedCountdownUtils.lua:9
---@return number  Secondes (0 si core_environment ou l'heure est indisponible).
function gameplay_rally_loop_stagedCountdownUtils.getEnvironmentWallClockSecs() end

--- Construit la table de réglages du compte à rebours : duration, maxAnnounced, showVisualCountdown (réglage rallyVisualPacenotes ou nil), playSoundEffects (vrai si rallyAudioPacenotes est désactivé), playVoiceCountdown (réglage rallyAudioPacenotes).
---Source : lua/ge/extensions/gameplay/rally/loop/stagedCountdownUtils.lua:17
---@param defaultDuration number Durée du compte à rebours en secondes.
---@param defaultMaxAnnounced number Non utilisé (déduit du code).
---@return table  {duration, maxAnnounced, showVisualCountdown, playSoundEffects, playVoiceCountdown}.
function gameplay_rally_loop_stagedCountdownUtils.getStageCountdownSettings(defaultDuration, defaultMaxAnnounced) end

--- Heure murale = (environmentStartTimeSecs + epochTime) modulo 86400.
---Source : lua/ge/extensions/gameplay/rally/loop/stagedCountdownUtils.lua:50
---@param environmentStartTimeSecs number|nil Heure de départ, 0 si nil.
---@param epochTime number|nil Secondes écoulées, 0 si nil.
---@return number  Secondes depuis minuit.
function gameplay_rally_loop_stagedCountdownUtils.getWallClockTime(environmentStartTimeSecs, epochTime) end

--- Dégèle le véhicule (action 'setFreeze' false).
---Source : lua/ge/extensions/gameplay/rally/loop/stagedCountdownUtils.lua:162
---@param vehId integer|nil Id du véhicule.
---@param logTag string Étiquette de log.
---@return boolean  true si le véhicule a été trouvé.
function gameplay_rally_loop_stagedCountdownUtils.unfreezeVehicle(vehId, logTag) end

