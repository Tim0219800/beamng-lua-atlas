---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/loop/standaloneFallbackStream.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flux de données de secours pour les apps d'interface de spéciale de rallye quand aucune boucle (rally loop) ne les alimente (spéciale lancée seule, « standalone »). Il conserve les dernières données reçues d'un nœud de compte à rebours (état actif, compte à rebours, proximité du véhicule, horloge) et les complète avec les données de la spéciale du gestionnaire de rallye (gameplay_rally.getRallyManager():getActiveStageData()), l'horloge de l'environnement, les couleurs de thème et le réglage rallyShowStageApps. getStreamData renvoie la table à envoyer à l'UI.
--- Accès : extension `gameplay_rally_loop_standaloneFallbackStream` : `extensions.load("gameplay_rally_loop_standaloneFallbackStream")`, puis la globale `gameplay_rally_loop_standaloneFallbackStream`
---@class gameplay_rally_loop_standaloneFallbackStream
gameplay_rally_loop_standaloneFallbackStream = {}

--- Efface tout l'état du flux de secours (données, délais, horloge, drapeau de reset).
---Source : lua/ge/extensions/gameplay/rally/loop/standaloneFallbackStream.lua:191
function gameplay_rally_loop_standaloneFallbackStream.clear() end

--- Construit la table de flux pour l'UI : activeState, rallyClock, stageData, scheduleData, vehicleProximity, countdownData, showStageApps, uiColors. Choisit entre le flux de secours mis à jour, les données de la spéciale seule (état stageActive) ou un état inactif avec données remises à zéro.
---Source : lua/ge/extensions/gameplay/rally/loop/standaloneFallbackStream.lua:211
---@param now number|nil Temps courant (RallyUtil.getTime() ou os.clockhp() par défaut).
---@return table  Données de flux.
function gameplay_rally_loop_standaloneFallbackStream.getStreamData(now) end

--- Indique si le flux doit être utilisé : des données de secours existent ou une spéciale est active côté gestionnaire de rallye.
---Source : lua/ge/extensions/gameplay/rally/loop/standaloneFallbackStream.lua:201
---@return boolean  true si actif.
function gameplay_rally_loop_standaloneFallbackStream.isActive() end

--- Hook appelé quand les réglages changent : relit rallyShowStageApps (true par défaut).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/loop/standaloneFallbackStream.lua:54
function gameplay_rally_loop_standaloneFallbackStream.onSettingsChanged() end

--- Avance l'horloge murale locale (fallbackClockSecs) de dtSim secondes, modulo 86400, si elle a été initialisée par un nœud.
---Source : lua/ge/extensions/gameplay/rally/loop/standaloneFallbackStream.lua:205
---@param dtSim number Temps de simulation écoulé, en secondes.
function gameplay_rally_loop_standaloneFallbackStream.updateClock(dtSim) end

--- Enregistre un paquet de données venant d'un nœud (activeState, vehicleProximity, countdownData, rallyClock, resetFallbackStreamData) et gère les délais de protection du compte à rebours et d'affichage de GO.
---Source : lua/ge/extensions/gameplay/rally/loop/standaloneFallbackStream.lua:279
---@param data table|nil Paquet du nœud ; ignoré si nil.
function gameplay_rally_loop_standaloneFallbackStream.updateStreamData(data) end

