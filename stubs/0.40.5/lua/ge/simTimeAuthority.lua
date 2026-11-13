---@meta
-- tim19Atlas stub generated from lua/ge/simTimeAuthority.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Autorité sur la vitesse du temps de simulation : pause, ralenti (bullet time) et reprise, avec lissage. Un moddeur l'utilise pour mettre le jeu en pause, régler un ralenti (0.001 à 1) ou empiler des demandes de pause (pushPauseRequest/popPauseRequest). Il synchronise le moteur C++ (be:setSimulationTimeScale, be:setEnabled) et le replay (core_replay), et prévient l'interface (messages bullettime).
--- Accès : globale `simTimeAuthority`
---@class simTimeAuthority
---@field selectionSlot integer Indice (1 à 12) du cran de ralenti sélectionné dans la table interne des crans (12 = temps réel).
---@field simulationSpeed number Vitesse de simulation demandée (cible), 1 = temps réel, 0 = pause, 0.001 minimum hors pause. Initialisée depuis be:getSimulationTimeScale().
---@field simulationSpeedReal number Vitesse actuellement appliquée au moteur après lissage (mise à jour par la fonction update).
simTimeAuthority = {}

--- Vide toutes les demandes de pause et reprend la simulation (pause(false)).
---Source : lua/ge/simTimeAuthority.lua:269
function simTimeAuthority.clearPauseStack() end

--- Renvoie la vitesse de simulation demandée (cible, pas forcément atteinte).
---Source : lua/ge/simTimeAuthority.lua:152
---@return number  1 = temps réel, 0.5 = ralenti, 0 = pause.
function simTimeAuthority.get() end

--- Renvoie la vitesse sauvegardée avant la dernière pause : c'est celle qui sera restaurée à la reprise.
---Source : lua/ge/simTimeAuthority.lua:292
---@return number  Vitesse à restaurer.
function simTimeAuthority.getInitialTimeScale() end

--- Indique si le temps est en pause : état de pause du replay en lecture, sinon not be:getEnabled().
---Source : lua/ge/simTimeAuthority.lua:34
---@return boolean  true si en pause.
function simTimeAuthority.getPause() end

--- Renvoie la vitesse effectivement appliquée au moteur (tient compte du lissage).
---Source : lua/ge/simTimeAuthority.lua:148
---@return number  Vitesse en vigueur.
function simTimeAuthority.getReal() end

--- Hook appelé après un rechargement du Lua GE : restaure simulationSpeed et la vitesse initiale, puis vide la pile de pause.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/simTimeAuthority.lua:284
---@param data table Table renvoyée par onSerialize : {simulationSpeed, initialTimeScale}.
function simTimeAuthority.onDeserialized(data) end

--- Hook appelé avant un rechargement du Lua GE : renvoie la vitesse demandée et la vitesse initiale.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/simTimeAuthority.lua:279
---@return table  {simulationSpeed = number, initialTimeScale = number}.
function simTimeAuthority.onSerialize() end

--- Hook appelé quand l'interface est initialisée : vide la pile de pause (clearPauseStack).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/simTimeAuthority.lua:275
function simTimeAuthority.onUIInitialised() end

--- Met en pause ou reprend instantanément. Diffuse le hook onSimTimePauseCalled(paused). En pause : sauvegarde la vitesse courante, vitesse 0, be:setEnabled(false). À la reprise : restaure la vitesse sauvegardée avec lissage. Sans effet si l'état demandé est déjà celui en cours ou si aucun niveau n'est chargé.
---Source : lua/ge/simTimeAuthority.lua:170
---@param paused boolean true pour pause, false pour reprise.
---@param playPauseSound boolean|nil true pour jouer le son de pause (event:>UI>Main>Pause) en entrant en pause.
function simTimeAuthority.pause(paused, playPauseSound) end

--- Pause ou reprise avec transition lissée de la vitesse (ralentissement progressif jusqu'à 0, ou accélération). Diffuse le hook simTimePauseCalled(paused). Les taux sont donnés par l'appelant et servent pour cette seule transition.
---Source : lua/ge/simTimeAuthority.lua:199
---@param paused boolean true pour pause, false pour reprise.
---@param rateLimit number|nil Taux maximal de variation de la vitesse (20 par défaut si nil).
---@param startAccel number|nil Accélération au début de la transition (10 par défaut).
---@param stopAccel number|nil Décélération à la fin de la transition (3 par défaut).
---@param playPauseSound boolean|nil true pour jouer le son de pause.
function simTimeAuthority.pauseSmooth(paused, rateLimit, startAccel, stopAccel, playPauseSound) end

--- Retire une demande de pause identifiée. Quand le compteur retombe à 0 et que le jeu n'était pas en pause avant la première demande, la simulation reprend.
---Source : lua/ge/simTimeAuthority.lua:256
---@param id string Identifiant de la demande (le même que pour pushPauseRequest).
function simTimeAuthority.popPauseRequest(id) end

--- Ajoute une demande de pause identifiée et met en pause. Mémorise si le jeu était déjà en pause à la première demande. Un même id n'est compté qu'une fois.
---Source : lua/ge/simTimeAuthority.lua:242
---@param id string Identifiant unique de l'appelant.
function simTimeAuthority.pushPauseRequest(id) end

--- Affiche à l'écran (guihooks 'Message', catégorie bullettime) un message sur la vitesse : accéléré, temps réel, ralenti (simplifié) ou ralenti d'un facteur calculé avec l'option courante.
---Source : lua/ge/simTimeAuthority.lua:64
---@param speed number Vitesse à annoncer.
---@param simplified boolean true : message générique de ralenti sans facteur ni indice de cran.
function simTimeAuthority.reportSpeed(speed, simplified) end

--- Envoie à l'interface la vitesse demandée courante (guihooks 'BullettimeValueChanged').
---Source : lua/ge/simTimeAuthority.lua:166
function simTimeAuthority.requestValue() end

--- Sélectionne un cran de ralenti avec des touches de direction. Pendant un replay, pilote la vitesse du replay à la place.
---Source : lua/ge/simTimeAuthority.lua:122
---@param val string '^' : bascule entre temps réel et le dernier cran de ralenti ; 'v' : cran de ralenti instantané (1/8) ; '<' : cran plus lent ; '>' : cran plus rapide.
function simTimeAuthority.selectPreset(val) end

--- Change la vitesse de simulation demandée (lissage progressif jusqu'à la nouvelle valeur) et affiche le message de vitesse simplifié. La valeur est limitée à [0.001, 1]. Une valeur non numérique est refusée avec une erreur loguée.
---Source : lua/ge/simTimeAuthority.lua:156
---@param val number Nouvelle vitesse (1 = temps réel, 0.5 = moitié).
function simTimeAuthority.set(val) end

--- Comme set, mais force aussi la valeur lissée : la vitesse est appliquée sans transition. Ne montre pas de message.
---Source : lua/ge/simTimeAuthority.lua:161
---@param val number Nouvelle vitesse (limitée à [0.001, 1]).
function simTimeAuthority.setInstant(val) end

--- Bascule pause/reprise. Diffuse le hook onTogglePause ; en replay appelle core_replay.togglePlay().
---Source : lua/ge/simTimeAuthority.lua:229
---@param playPauseSound boolean|nil true pour jouer le son de pause.
function simTimeAuthority.togglePause(playPauseSound) end

--- Fonction de mise à jour enregistrée auprès du système d'extensions : applique à chaque appel le lissage de vitesse en cours (envoie la vitesse au moteur via be:setSimulationTimeScale et physicsEngineEvent) et se désactive à la fin de la transition. Elle sert d'enveloppe car un pointeur de fonction enregistré ne peut pas être remplacé par nop.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/simTimeAuthority.lua:297
---@param ... any Arguments de la mise à jour ; le premier est dt (s).
function simTimeAuthority.update(...) end

