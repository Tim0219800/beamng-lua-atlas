---@meta
-- tim19Atlas stub generated from lua/ge/server/server.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Chargement et déchargement d'un niveau côté « serveur » du jeu (mode solo/freeroam). `createGame` ouvre l'écran de chargement puis exécute la séquence complète : datablocks et matériaux, création du monde physique, chargement des objets du niveau (dossier main/ JSON, ou ancien format .mis), décals, démarrage de la physique, création de la caméra et du joueur, puis fondu de sortie. `destroy` fait l'inverse. Les durées de chaque étape sont journalisées.
--- Accès : globale `server`
---@class server
---@field loadingProgress any Exporté à l'initialisation du module, donc nil (voir notes) ; la vraie valeur est le handle LoadingManager local.
server = {}

--- Charge un niveau. Demande l'écran de chargement à core_gamestate, puis exécute createGameActual (datablocks, matériaux, objets, physique, spawn caméra et joueur). Si customLoadingFunction est donné, le fondu de sortie est retardé : c'est à cette fonction d'appeler server.fadeoutLoadingScreen.
---Source : lua/ge/server/server.lua:405
---@param levelPath string chemin du niveau (info.json, .mis ou dossier/nom de niveau ; mis en minuscules)
---@param customLoadingFunction function|nil appelée à la place du fondu de sortie automatique
function server.createGame(levelPath, customLoadingFunction) end

--- Détruit la session : met $missionRunning à faux, termine le niveau (endMission), détruit le monde physique, supprime les datablocks et incrémente $Server::Session.
---Source : lua/ge/server/server.lua:376
---@param p table|nil profileur optionnel exposant :add(nom) pour marquer les étapes
function server.destroy(p) end

--- Termine le chargement : demande la sortie de l'écran de chargement, appelle clientPostStartMission/clientStartMission (sauf si skipStart), coupe le chargement, émet onLoadingScreenFadeout et journalise la durée. Sans effet (avertissement) si aucun chargement n'est en cours.
---Source : lua/ge/server/server.lua:338
---@param skipStart boolean|nil si vrai, saute clientPostStartMission/clientStartMission et déclenche guihooks MenuHide
function server.fadeoutLoadingScreen(skipStart) end

--- Définit un décalage global appliqué à la transformée de tuile du prochain niveau chargé. Appeler sans argument supprime le décalage ; avec des arguments incomplets, journalise une erreur.
---Source : lua/ge/server/server.lua:61
---@param x number|nil décalage X en mètres ; nil annule le décalage
---@param y number|nil décalage Y en mètres
---@param z number|nil décalage Z en mètres
function server.setLevelOffset(x, y, z) end

