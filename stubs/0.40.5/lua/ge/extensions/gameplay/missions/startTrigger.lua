---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/missions/startTrigger.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Transforme le champ `startTrigger` d'une mission en liste de « locations » (zones de démarrage) et regroupe les zones proches en clusters pour la carte. Seul le type « coordinates » (niveau + position + rayon) produit réellement une location ; « league » et « none » n'en produisent aucune (nop). Utilisé par gameplay_missions_missions (getLocations) et par les marqueurs de missions.
--- Accès : extension `gameplay_missions_startTrigger` : `extensions.load("gameplay_missions_startTrigger")`, puis la globale `gameplay_missions_startTrigger`
---@class gameplay_missions_startTrigger
gameplay_missions_startTrigger = {}

--- Teste si le joueur est dans la zone de démarrage : même niveau, position et rayon définis, et distance au centre <= rayon.
---Source : lua/ge/extensions/gameplay/missions/startTrigger.lua:16
---@param location table Location {level, pos, radius}.
---@param level string Identifiant du niveau courant (minuscules).
---@param playerPosition vec3 Position du joueur.
---@param mission table Mission concernée (non utilisée).
---@return boolean  true si le joueur est dans la zone.
function gameplay_missions_startTrigger.defaultLocationCheck(location, level, playerPosition, mission) end

--- Dessine avec debugDrawer le marqueur d'une zone de démarrage : cylindre au sol de rayon `radius` et mât de 5 m. Rouge hors zone, vert à l'intérieur.
---Source : lua/ge/extensions/gameplay/missions/startTrigger.lua:21
---@param location table Location {pos, radius}.
---@param playerPosition vec3 Position du joueur.
function gameplay_missions_startTrigger.defaultLocationDisplayMarker(location, playerPosition) end

--- Regroupe en clusters toutes les locations « coordinates » de toutes les missions, niveau par niveau, grâce à un quadtree. Deux zones se regroupent si leurs disques se chevauchent (rayon de fusion fixe si mergeRadius est donné).
---Source : lua/ge/extensions/gameplay/missions/startTrigger.lua:127
---@param mergeRadius number|nil Rayon (m) utilisé à la place du rayon propre de chaque location ; nil = rayons des missions.
---@return table  Liste de clusters {type, level, pos, rot, radius, check, displayMarker, missionIds, clusterId}.
function gameplay_missions_startTrigger.getMissionClusters(mergeRadius) end

--- Hook émis par missionManager quand une mission change d'état : vide le cache des clusters.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/missions/startTrigger.lua:187
function gameplay_missions_startTrigger.onAnyMissionChanged() end

--- Crée la liste des locations d'une mission à partir de mission.startTrigger. Vérifie le type et les champs obligatoires.
---Source : lua/ge/extensions/gameplay/missions/startTrigger.lua:62
---@param mission table Mission dont le champ startTrigger existe (supposé vérifié par l'appelant).
---@return table  Liste de locations (vide en cas d'erreur ou pour les types league/none).
---@return string|nil  Message d'erreur (type invalide ou champs manquants), nil si tout va bien.
function gameplay_missions_startTrigger.parseMission(mission) end

