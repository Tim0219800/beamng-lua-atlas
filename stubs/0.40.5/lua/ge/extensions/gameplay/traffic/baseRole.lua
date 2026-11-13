---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/traffic/baseRole.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Instance d'un rôle de trafic. Champs : veh (objet véhicule de trafic), name, class, actionName, actionTimer, state, flags, actions (table nom -> fonction(args)), baseActions (pullOver, disabled), driver {personality, aggression}, targetId, targetVisible, targetNear, flowgraph, lockAction, ignorePersonality, keepPersonalityOnRefresh, keepActionOnRefresh.
---@class gameplay_traffic_baseRole
local gameplay_traffic_baseRole = {}

--- Applique une personnalité (fusionnée dans driver.personality) et envoie l'agressivité à l'IA. Si data n'est pas une table, restaure la personnalité neutre.
---Source : lua/ge/extensions/gameplay/traffic/baseRole.lua:171
---@param data table|nil Valeurs aggression, patience, bravery.
function gameplay_traffic_baseRole:applyPersonality(data) end

--- Teste par lancer de rayon statique si le véhicule cible est visible depuis ce véhicule (point visé 1 m au-dessus de la cible).
---Source : lua/ge/extensions/gameplay/traffic/baseRole.lua:191
---@param id integer|nil Cible ; défaut self.targetId.
---@return boolean  true si visible.
function gameplay_traffic_baseRole:checkTargetVisible(id) end

--- Arrête et supprime le flowgraph, remet le mode IA par défaut et déverrouille l'action.
---Source : lua/ge/extensions/gameplay/traffic/baseRole.lua:99
function gameplay_traffic_baseRole:clearFlowgraph() end

--- Pour véhicules d'urgence : force les feux. À true, avance les séquences ayant un feu vert, et fige (timer coupé) celles dont tous les feux sont rouges ; à false, relance les séquences figées. Sans effet si les feux de signalisation ne sont pas actifs.
---Source : lua/ge/extensions/gameplay/traffic/baseRole.lua:202
---@param state boolean true pour figer, false pour relâcher.
function gameplay_traffic_baseRole:freezeTrafficSignals(state) end

--- Génère une personnalité aléatoire (aggression, patience, bravery). Renvoie la personnalité neutre (0,5) si ignorePersonality.
---Source : lua/ge/extensions/gameplay/traffic/baseRole.lua:152
---@return table<string, number>|nil  Personnalité ; nil si le véhicule n'est pas IA.
function gameplay_traffic_baseRole:generatePersonality() end

--- Initialise les champs par défaut du rôle et les actions de base pullOver et disabled. Options lues dans data : ignorePersonality, keepPersonalityOnRefresh, keepActionOnRefresh.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/traffic/baseRole.lua:9
---@param veh table Véhicule de trafic associé.
---@param name string|nil Nom du rôle, 'none' par défaut.
---@param data table|nil Options (voir description).
function gameplay_traffic_baseRole:init(veh, name, data) end

--- Point d'extension (vide) : appelé par le système de trafic quand le véhicule a fini d'être actif.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/traffic/baseRole.lua:243
function gameplay_traffic_baseRole:onActiveDone() end

--- Point d'extension (vide) : collision de ce véhicule avec un autre.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/traffic/baseRole.lua:261
---@param otherId integer Autre véhicule.
---@param data table Données de collision.
function gameplay_traffic_baseRole:onCollision(otherId, data) end

--- Point d'extension (vide) : dégâts de crash sur ce véhicule.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/traffic/baseRole.lua:255
---@param data table Données de l'évènement.
function gameplay_traffic_baseRole:onCrashDamage(data) end

--- Restaure le rôle après rechargement Lua.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/traffic/baseRole.lua:287
---@param data table Données de onSerialize.
---@param veh table|nil Véhicule de trafic ; défaut gameplay_traffic.getTraffic()[data.id].
function gameplay_traffic_baseRole:onDeserialized(data, veh) end

--- Point d'extension (vide) : collision entre deux autres véhicules.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/traffic/baseRole.lua:264
---@param id1 integer Premier véhicule.
---@param id2 integer Second véhicule.
---@param data table Données de collision.
function gameplay_traffic_baseRole:onOtherCollision(id1, id2, data) end

--- Point d'extension (vide) : dégâts de crash sur un autre véhicule.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/traffic/baseRole.lua:258
---@param otherId integer Véhicule touché.
---@param data table Données de l'évènement.
function gameplay_traffic_baseRole:onOtherCrashDamage(otherId, data) end

--- Point d'extension (vide) : évènement lié à un autre véhicule.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/traffic/baseRole.lua:267
---@param eventType string Type d'évènement.
---@param otherId integer Autre véhicule.
---@param data table Données.
function gameplay_traffic_baseRole:onOtherEvent(eventType, otherId, data) end

--- Point d'extension (vide) : appelé par postInit, à la création et au refresh du véhicule.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/traffic/baseRole.lua:246
function gameplay_traffic_baseRole:onRefresh() end

--- Point d'extension (vide) : appelé quand le rôle se termine.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/traffic/baseRole.lua:252
function gameplay_traffic_baseRole:onRoleEnded() end

--- Point d'extension (vide) : appelé quand le rôle devient actif.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/traffic/baseRole.lua:249
function gameplay_traffic_baseRole:onRoleStarted() end

--- Sérialise id du véhicule, nom, état, nom d'action et cible.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/traffic/baseRole.lua:276
---@return table  Données {id, name, state, actionName, targetId}.
function gameplay_traffic_baseRole:onSerialize() end

--- Point d'extension (vide) : tick périodique du système de trafic.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/traffic/baseRole.lua:270
---@param tickTime number Durée du tick (s).
function gameplay_traffic_baseRole:onTrafficTick(tickTime) end

--- Point d'extension (vide) : mise à jour à chaque frame.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/traffic/baseRole.lua:273
---@param dt number Temps réel (s).
---@param dtSim number Temps simulé (s).
function gameplay_traffic_baseRole:onUpdate(dt, dtSim) end

--- Appelé après la construction (et à chaque refresh de véhicule) : réinitialise l'action et regénère la personnalité sauf si keepActionOnRefresh / keepPersonalityOnRefresh, puis appelle onRefresh.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/traffic/baseRole.lua:65
function gameplay_traffic_baseRole:postInit() end

--- Remet l'action par défaut : mode IA par défaut, paramètres et électriques réinitialisés, flags vidés, état 'none', cible effacée. Sans effet si lockAction. Appelé à chaque réapparition du véhicule sauf keepActionOnRefresh.
---Source : lua/ge/extensions/gameplay/traffic/baseRole.lua:137
function gameplay_traffic_baseRole:resetAction() end

--- Exécute l'action nommée de self.actions (sauf si lockAction), mémorise son nom et émet le hook onTrafficAction(vehId, name, {targetId, data}). Erreur journalisée si l'action n'existe pas.
---Source : lua/ge/extensions/gameplay/traffic/baseRole.lua:118
---@param name string Nom de l'action.
---@param args table|nil Arguments passés à l'action.
function gameplay_traffic_baseRole:setAction(name, args) end

--- Calcule et envoie à l'IA du véhicule l'agressivité (ai.setAggression), en tenant compte de la personnalité sauf si ignorée.
---Source : lua/ge/extensions/gameplay/traffic/baseRole.lua:130
---@param baseAggression number|nil Valeur de base ; défaut baseAggression des variables de trafic.
---@param ignorePersonality boolean|nil Ne pas appliquer le modificateur de personnalité.
function gameplay_traffic_baseRole:setAggression(baseAggression, ignorePersonality) end

--- Définit le véhicule cible (si l'identifiant existe) et, pour un véhicule IA, envoie ai.setTargetObjectID.
---Source : lua/ge/extensions/gameplay/traffic/baseRole.lua:108
---@param id integer Identifiant de l'objet cible.
function gameplay_traffic_baseRole:setTarget(id) end

--- Charge un flowgraph propre à ce véhicule, fixe ses variables, l'active (avec keepTrafficState), met l'IA du véhicule en mode 'stop' et verrouille l'action (lockAction). Journalise une erreur si le fichier est introuvable.
---Source : lua/ge/extensions/gameplay/traffic/baseRole.lua:75
---@param fgFile string Chemin du fichier flowgraph.
---@param varData table<string, any>|nil Valeurs des variables du flowgraph (avertissement si la variable n'existe pas).
function gameplay_traffic_baseRole:setupFlowgraph(fgFile, varData) end

--- Point d'extension (vide) : tentative d'évènement aléatoire du rôle.
---Source : lua/ge/extensions/gameplay/traffic/baseRole.lua:240
function gameplay_traffic_baseRole:tryRandomEvent() end

