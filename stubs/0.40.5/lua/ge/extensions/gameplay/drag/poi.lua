---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/drag/poi.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Points d'intérêt (POI) des pistes de drag. Pour chaque couloir de chaque piste du niveau, crée un déclencheur invisible de 6 m de rayon posé sur la ligne de stage. Quand un véhicule y entre, le module arme la piste (core.setDragRaceData avec les règles utilisateur sauvegardées) et lance la course (core.startDragRaceActivity), ou ouvre le menu MP si le mode multijoueur est actif. Gère aussi l'entrée multiseat (plusieurs joueurs, un par couloir) et empêche de rejoindre immédiatement après une course tant que le véhicule reste à la ligne.
--- Accès : extension `gameplay_drag_poi` : `extensions.load("gameplay_drag_poi")`, puis la globale `gameplay_drag_poi`
---@class gameplay_drag_poi
---@field dependencies string[] gameplay_drag_rulesMenu.
gameplay_drag_poi = {}

--- Applique à data les règles sauvegardées par l'utilisateur pour la piste (dragType, importantTimerId, prefabs.christmasTree.treeType).
---Source : lua/ge/extensions/gameplay/drag/poi.lua:55
---@param data table Données de piste, modifiées en place.
---@param stripId string|nil Identifiant de piste.
---@param levelId string|nil Identifiant de niveau.
function gameplay_drag_poi.applyUserRulesToData(data, stripId, levelId) end

--- Marque les racers encore à moins de 6 m d'une ligne de stage : ils ne pourront pas relancer une course tant qu'ils ne sont pas sortis de tous les déclencheurs de stage.
---Source : lua/ge/extensions/gameplay/drag/poi.lua:40
function gameplay_drag_poi.blockRejoinForStagedRacers() end

--- Efface la liste des véhicules interdits de relance.
---Source : lua/ge/extensions/gameplay/drag/poi.lua:51
function gameplay_drag_poi.clearRejoinBlocks() end

--- Crée la définition d'un POI (id et markerInfo.invisibleTrigger multiseat avec onInside/onExit) pour un couloir. Renvoie nil avec un warning si le couloir n'a pas de point de stage.
---Source : lua/ge/extensions/gameplay/drag/poi.lua:68
---@param data table Données de piste (strip, _fnWithoutExt...).
---@param lane table Couloir (waypoints.stage, shortName).
---@param laneIndex integer Indice du couloir.
---@return table|nil  POI {id, markerInfo} ou nil.
function gameplay_drag_poi.createStagePoi(data, lane, laneIndex) end

--- Hook (relayé par core) : ajoute à elements un POI par couloir de chaque piste de drag du niveau, si le drag est activé.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drag/poi.lua:205
---@param levelIdentifier string Nom du niveau.
---@param elements table[] Liste de POI complétée en place.
function gameplay_drag_poi.onGetRawPoiListForLevel(levelIdentifier, elements) end

