---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/speedTrapLeaderboards.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Extension qui tient les classements (top 10) des radars de vitesse, par niveau et par radar (triggerName), en mode freeroam uniquement. Les classements sont chargés depuis settings/cloud/speedTrapLeaderboards/<niveau>.json au démarrage du niveau et sauvegardés à la fin de la mission ou avant l'activation du mode carrière. Une entrée contient speed (m/s), modelName (nom JBeam) et date (UTC ISO 8601).
--- Accès : extension `gameplay_speedTrapLeaderboards` : `extensions.load("gameplay_speedTrapLeaderboards")`, puis la globale `gameplay_speedTrapLeaderboards`
---@class gameplay_speedTrapLeaderboards
gameplay_speedTrapLeaderboards = {}

--- Ajoute un passage au classement du radar du niveau courant s'il y a de la place (10 entrées max) ou s'il bat la dernière entrée, puis trie par vitesse décroissante.
---Source : lua/ge/extensions/gameplay/speedTrapLeaderboards.lua:58
---@param speedTrapData table Données du trigger (utilise triggerName).
---@param playerSpeed number Vitesse du véhicule en m/s.
---@param overSpeed number Dépassement de la limite en m/s (non utilisé pour l'entrée).
---@param veh userdata Objet véhicule (son champ JBeam donne le modèle).
---@return boolean  true si la vitesse égale ou dépasse le meilleur score du classement.
---@return table[]  Classement de ce radar, trié.
function gameplay_speedTrapLeaderboards.addRecord(speedTrapData, playerSpeed, overSpeed, veh) end

--- Renvoie tous les classements en mémoire.
---Source : lua/ge/extensions/gameplay/speedTrapLeaderboards.lua:106
---@return table<string, table>  niveau -> radar -> liste d'entrées {speed, modelName, date}.
function gameplay_speedTrapLeaderboards.getLeaderboards() end

--- Vide la mémoire puis charge tous les *.json du dossier ; le nom de fichier sans extension sert de nom de niveau.
---Source : lua/ge/extensions/gameplay/speedTrapLeaderboards.lua:21
---@param folderPath string|nil Dossier ; défaut settings/cloud/speedTrapLeaderboards/.
function gameplay_speedTrapLeaderboards.loadLeaderboards(folderPath) end

--- Hook appelé avant l'activation de la carrière : en freeroam, sauvegarde.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/speedTrapLeaderboards.lua:100
function gameplay_speedTrapLeaderboards.onBeforeCareerActivate() end

--- Hook appelé à la fin de la mission : en freeroam, sauvegarde les classements.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/speedTrapLeaderboards.lua:94
function gameplay_speedTrapLeaderboards.onClientEndMission() end

--- Hook appelé après le démarrage d'un niveau : en freeroam, charge les classements.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/speedTrapLeaderboards.lua:88
---@param levelPath string Chemin du niveau.
function gameplay_speedTrapLeaderboards.onClientPostStartMission(levelPath) end

--- Restaure l'état après rechargement Lua.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/speedTrapLeaderboards.lua:116
---@param data table Table {leaderboards, dirtyLevels}.
function gameplay_speedTrapLeaderboards.onDeserialized(data) end

--- Sauvegarde l'état avant rechargement Lua (classements et niveaux modifiés) ; ne renvoie rien si la carrière est active.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/speedTrapLeaderboards.lua:110
function gameplay_speedTrapLeaderboards.onSerialize() end

--- Écrit sur disque les classements modifiés (un fichier par niveau).
---Source : lua/ge/extensions/gameplay/speedTrapLeaderboards.lua:35
---@param folderPath string|nil Dossier ; défaut settings/cloud/speedTrapLeaderboards/.
---@param forceOverwrite boolean|nil Écrire tous les niveaux, même non modifiés.
function gameplay_speedTrapLeaderboards.saveLeaderboards(folderPath, forceOverwrite) end

