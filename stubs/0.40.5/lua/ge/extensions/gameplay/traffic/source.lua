---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/traffic/source.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Gère les « sources » (foyers) du gestionnaire de trafic, utile quand plusieurs joueurs (écran partagé) doivent chacun avoir du trafic autour d'eux. Une source est un véhicule ou une position fixe ; le module fait tourner le foyer du trafic (gameplay_traffic.setFocus) de source en source à intervalle régulier. Chargé à la demande.
--- Accès : extension `gameplay_traffic_source` : `extensions.load("gameplay_traffic_source")`, puis la globale `gameplay_traffic_source`
---@class gameplay_traffic_source
gameplay_traffic_source = {}

--- Ajoute une source au trafic. Mode 'vehicle' : data est un id de véhicule ou une table {vehId}. Mode 'custom' : data = {pos, dir, speed?}. Autre mode (ex. 'camera') : entrée sans donnée.
---Source : lua/ge/extensions/gameplay/traffic/source.lua:34
---@param mode string 'camera', 'vehicle' ou 'custom'.
---@param data integer|table|nil Id de véhicule, ou table {vehId=…} ou {pos=vec3, dir=vec3, speed=number}.
---@return table|boolean  L'entrée de source ajoutée, ou false si les données sont invalides (véhicule inexistant, pos/dir manquants).
function gameplay_traffic_source.addSource(mode, data) end

--- Réinitialise les sources puis ajoute comme source le véhicule de chaque joueur (multiseat), si au moins 2 joueurs ont rejoint. Active ensuite le mode de mise à jour.
---Source : lua/ge/extensions/gameplay/traffic/source.lua:118
---@param defaultMode string|nil Mode de mise à jour, 'default' si nil.
function gameplay_traffic_source.autoAddPlayers(defaultMode) end

--- Renvoie la table des sources courantes (référence directe, pas une copie).
---Source : lua/ge/extensions/gameplay/traffic/source.lua:72
---@return table  Liste d'entrées {mode, auto, vehId?, pos?, dirVec?, speed?}.
function gameplay_traffic_source.getSources() end

--- Hook appelé à chaque frame. Fait avancer le timer ; à l'intervalle, appelle updateSource puis gèle le timer (-1).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/traffic/source.lua:167
---@param dt number Delta temps réel (s).
---@param dtSim number Delta temps de simulation (s), utilisé par le timer.
function gameplay_traffic_source.onUpdate(dt, dtSim) end

--- Hook appelé quand un véhicule est réinitialisé. Si le timer de rotation est gelé (-1) et que le véhicule est une IA de trafic, relance le timer à 0.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/traffic/source.lua:157
---@param vehId integer Id du véhicule réinitialisé.
function gameplay_traffic_source.onVehicleResetted(vehId) end

--- Hook appelé quand un joueur change de véhicule. En écran partagé, autoAddPlayers est souvent appelé avant que chacun soit assis : si le nouveau véhicule n'est pas déjà source et qu'il y a au moins 2 joueurs, relance autoAddPlayers.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/traffic/source.lua:151
---@param oldId integer Ancien id de véhicule.
---@param newId integer Nouvel id de véhicule.
---@param player integer Joueur concerné (non utilisé).
function gameplay_traffic_source.onVehicleSwitched(oldId, newId, player) end

--- Retire la source à l'indice donné ; si c'était l'indice courant de rotation, la rotation repart à 1.
---Source : lua/ge/extensions/gameplay/traffic/source.lua:65
---@param index integer Indice (à partir de 1) dans la liste des sources.
function gameplay_traffic_source.removeSource(index) end

--- Supprime toutes les sources (remet trafficClearRadius à 0 sur les véhicules concernés), rétablit le foyer par défaut du trafic et réactive enableDynamicValues.
---Source : lua/ge/extensions/gameplay/traffic/source.lua:17
function gameplay_traffic_source.resetSources() end

--- Définit le mode de mise à jour des sources et réinitialise l'état de rotation. En mode 'default', crée un timer et un intervalle (minimum 1 s, 5 s par défaut).
---Source : lua/ge/extensions/gameplay/traffic/source.lua:76
---@param mode string 'off' ou 'default'.
---@param options table|nil Options ; options.interval = intervalle de rotation en secondes.
function gameplay_traffic_source.setSourceMode(mode, options) end

--- Passe à la source suivante (en privilégiant une source dont le véhicule roule à plus de 1 m/s) ou à l'indice donné, puis appelle gameplay_traffic.setFocus(mode, source). Appelée automatiquement par onUpdate ou manuellement.
---Source : lua/ge/extensions/gameplay/traffic/source.lua:96
---@param index integer|nil Indice forcé ; si nil, avance à la prochaine source.
function gameplay_traffic_source.updateSource(index) end

