---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/cameraV2/validation.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Contrôles partagés de Camera V2 pour rejeter les NaN, infinis et coordonnées extrêmes issus de raycasts ou de calculs de caméra défaillants, avant d'appliquer une position ou rotation. Utile à un moddeur qui veut valider des points, quaternions ou hauteurs de terrain avant de les passer à la caméra.
--- Accès : extension `editor_cameraV2_validation` : `extensions.load("editor_cameraV2_validation")`, puis la globale `editor_cameraV2_validation`
---@class editor_cameraV2_validation
editor_cameraV2_validation = {}

--- Vrai si value est un nombre ni NaN ni infini.
---Source : lua/ge/extensions/editor/cameraV2/validation.lua:14
---@param value any Valeur à tester
---@return boolean  true si nombre fini
function editor_cameraV2_validation.isFinite(value) end

--- Vrai si point se trouve près du segment de rayon origin -> origin + direction*maximumDistance : projection sur le rayon normalisé comprise entre -0,01 et maximumDistance+0,01, et distance perpendiculaire <= 1.
---Source : lua/ge/extensions/editor/cameraV2/validation.lua:76
---@param point vec3 Point à tester
---@param origin vec3 Origine du rayon
---@param direction vec3 Direction (normalisée en interne ; longueur <= 0,0001 refusée)
---@param maximumDistance number Longueur maximale du segment (>= 0)
---@return boolean  true si sur le segment
function editor_cameraV2_validation.isPointOnRaySegment(point, origin, direction, maximumDistance) end

--- Vrai si la valeur est finie et sa valeur absolue ne dépasse pas 10 000 000.
---Source : lua/ge/extensions/editor/cameraV2/validation.lua:35
---@param value any Coordonnée
---@return boolean  true si raisonnable
function editor_cameraV2_validation.isReasonableCoordinate(value) end

--- Vrai si x, y et z sont des coordonnées raisonnables.
---Source : lua/ge/extensions/editor/cameraV2/validation.lua:45
---@param point table|nil Point avec x, y, z
---@return boolean|nil  true/false, ou nil si point est nil
function editor_cameraV2_validation.isReasonablePoint(point) end

--- Vrai si x et y sont des coordonnées raisonnables.
---Source : lua/ge/extensions/editor/cameraV2/validation.lua:39
---@param point table|nil Point avec x, y
---@return boolean|nil  true/false, ou nil si point est nil
function editor_cameraV2_validation.isReasonableXY(point) end

--- Alias de isFinite pour une coordonnée.
---Source : lua/ge/extensions/editor/cameraV2/validation.lua:21
---@param value any Coordonnée
---@return boolean  true si finie
function editor_cameraV2_validation.isValidCoordinate(value) end

--- Vrai si x, y et z sont des nombres finis.
---Source : lua/ge/extensions/editor/cameraV2/validation.lua:31
---@param point table|nil Point avec x, y, z
---@return boolean|nil  true/false, ou nil si point est nil
function editor_cameraV2_validation.isValidPoint(point) end

--- Vrai si x, y, z, w sont finis et si x²+y²+z²+w² est dans [0,25 ; 2,25].
---Source : lua/ge/extensions/editor/cameraV2/validation.lua:49
---@param rotation table|nil Quaternion avec x, y, z, w
---@return boolean  true si valide
function editor_cameraV2_validation.isValidQuaternion(rotation) end

--- Vrai si la hauteur est finie et |hauteur| <= 1 000 000.
---Source : lua/ge/extensions/editor/cameraV2/validation.lua:66
---@param value any Hauteur
---@return boolean  true si valide
function editor_cameraV2_validation.isValidTerrainHeight(value) end

--- Vrai si point.x et point.y sont des nombres finis.
---Source : lua/ge/extensions/editor/cameraV2/validation.lua:25
---@param point table|nil Table avec champs x et y (vec3 possible)
---@return boolean|nil  true/false, ou nil si point est nil
function editor_cameraV2_validation.isValidXY(point) end

--- Interroge core_terrain.getTerrainHeight(vec3(x, y, 0)) pour un point raisonnable et renvoie la hauteur si elle est valide.
---Source : lua/ge/extensions/editor/cameraV2/validation.lua:70
---@param point table Point avec x, y
---@return number|nil  Hauteur du terrain, ou nil si le point ou la hauteur est invalide
function editor_cameraV2_validation.terrainHeightAt(point) end

--- Renvoie la limite de coordonnée utilisée par les tests 'raisonnable'.
---Source : lua/ge/extensions/editor/cameraV2/validation.lua:98
---@return number  10000000
function editor_cameraV2_validation.worldCoordinateLimit() end

