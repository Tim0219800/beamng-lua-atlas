---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/rallyEditor/zSnap.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Aide de l'éditeur de rallye pour « coller » la hauteur (z) d'un point au terrain. Trois méthodes : aucune, hauteur du terrain (core_terrain.getTerrainHeight) ou lancer de rayon vertical (editorUtil.vertRaycast). La méthode courante vient de la préférence de l'éditeur de rallye (editor_rallyEditor.getPrefWaypointSnapMethod). Sert aussi à adapter la géométrie d'une spline au terrain.
--- Accès : extension `editor_rallyEditor_zSnap` : `extensions.load("editor_rallyEditor_zSnap")`, puis la globale `editor_rallyEditor_zSnap`
---@class editor_rallyEditor_zSnap
---@field defaultMethod string Méthode par défaut : methods.getTerrainHeight.
---@field methodValues string[] Liste ordonnée des libellés de méthodes (pour un menu déroulant).
---@field methods table<string, string> Noms des méthodes : noSnapping, getTerrainHeight, vertRaycast (valeurs = libellés affichables).
editor_rallyEditor_zSnap = {}

--- Génère la géométrie d'une spline Catmull-Rom collée au terrain, par raycast (geom.catmullRomRaycast) ou par hauteur du terrain (geom.catmullRomConformToTerrain).
---Source : lua/ge/extensions/editor/rallyEditor/zSnap.lua:81
---@param spline table Spline source.
---@param useRaycast boolean Choix de la méthode.
---@param minNumDivisions integer Nombre minimal de subdivisions (transmis à geom).
---@param minSpacing number Espacement minimal (transmis à geom).
---@param rayRaise number|nil Relèvement du rayon.
---@return table  Résultat de la fonction geom appelée.
function editor_rallyEditor_zSnap.conformSplineGeometry(spline, useRaycast, minNumDivisions, minSpacing, rayRaise) end

--- Renvoie la méthode choisie dans les préférences de l'éditeur de rallye, ou defaultMethod si absente/invalide.
---Source : lua/ge/extensions/editor/rallyEditor/zSnap.lua:60
---@return string  Libellé de méthode.
function editor_rallyEditor_zSnap.getCurrentMethod() end

--- Indique si le libellé est une méthode connue.
---Source : lua/ge/extensions/editor/rallyEditor/zSnap.lua:47
---@param method string Libellé de méthode.
---@return boolean  true si valide.
function editor_rallyEditor_zSnap.isValidMethod(method) end

--- Convertit un booléen en méthode : vertRaycast si true, sinon getTerrainHeight.
---Source : lua/ge/extensions/editor/rallyEditor/zSnap.lua:73
---@param useRaycast boolean Utiliser le raycast.
---@return string  Libellé de méthode.
function editor_rallyEditor_zSnap.methodForUseRaycast(useRaycast) end

--- Ne fait rien, renvoie pos tel quel.
---Source : lua/ge/extensions/editor/rallyEditor/zSnap.lua:24
---@param pos vec3 Position.
---@return vec3  pos inchangé.
function editor_rallyEditor_zSnap.noSnappingInPlace(pos) end

--- Colle un point de driveline au terrain avec la méthode déduite de useRaycast.
---Source : lua/ge/extensions/editor/rallyEditor/zSnap.lua:77
---@param pos vec3 Position modifiée en place.
---@param useRaycast boolean true = raycast, false = hauteur du terrain.
---@param rayRaise number|nil Relèvement du rayon.
---@return vec3  pos.
function editor_rallyEditor_zSnap.snapDrivelineInPlace(pos, useRaycast, rayRaise) end

--- Applique la méthode choisie (ou la méthode par défaut si inconnue) à pos, en place.
---Source : lua/ge/extensions/editor/rallyEditor/zSnap.lua:51
---@param pos vec3 Position modifiée en place.
---@param method string Libellé de méthode.
---@param rayRaise number|nil Relèvement du rayon (méthode raycast).
---@return vec3  pos.
function editor_rallyEditor_zSnap.snapInPlace(pos, method, rayRaise) end

--- snapInPlace avec la méthode courante.
---Source : lua/ge/extensions/editor/rallyEditor/zSnap.lua:69
---@param pos vec3 Position modifiée en place.
---@param rayRaise number|nil Relèvement du rayon.
---@return vec3  pos.
function editor_rallyEditor_zSnap.snapInPlaceWithCurrentMethod(pos, rayRaise) end

--- Ajuste pos.z par un lancer de rayon vertical (editorUtil.vertRaycast).
---Source : lua/ge/extensions/editor/rallyEditor/zSnap.lua:36
---@param pos vec3 Position modifiée en place.
---@param rayRaise number|nil Hauteur dont le rayon est relevé avant de tirer (transmis à vertRaycast).
---@return vec3  pos.
function editor_rallyEditor_zSnap.snapRaycastInPlace(pos, rayRaise) end

--- Met pos.z à la hauteur du terrain en (x, y) si disponible.
---Source : lua/ge/extensions/editor/rallyEditor/zSnap.lua:28
---@param pos vec3 Position modifiée en place.
---@return vec3  pos.
function editor_rallyEditor_zSnap.snapTerrainHeightInPlace(pos) end

--- Comme snapInPlace mais sur une copie de pos.
---Source : lua/ge/extensions/editor/rallyEditor/zSnap.lua:56
---@param pos vec3 Position source (non modifiée).
---@param method string Libellé de méthode.
---@param rayRaise number|nil Relèvement du rayon.
---@return vec3  Nouvelle position.
function editor_rallyEditor_zSnap.zSnap(pos, method, rayRaise) end

--- zSnap avec la méthode courante, sur une copie.
---Source : lua/ge/extensions/editor/rallyEditor/zSnap.lua:65
---@param pos vec3 Position source.
---@return vec3  Nouvelle position.
function editor_rallyEditor_zSnap.zSnapWithCurrentMethod(pos) end

