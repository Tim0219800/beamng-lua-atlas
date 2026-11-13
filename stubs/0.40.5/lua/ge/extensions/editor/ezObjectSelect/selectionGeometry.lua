---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/ezObjectSelect/selectionGeometry.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Géométrie de la sélection de l'outil Easy Select : validation de boîtes, calcul des 8 coins monde d'un objet (boîte orientée via getObjBox + transform + scale, boîte alignée monde pour les véhicules ou en repli), contexte caméra, signatures de bornes pour détecter qu'un objet a bougé, et création de « proxies » projetés à l'écran (polygone d'enveloppe convexe, aire, centroïde, distances, volume). Ces proxies servent à choisir l'objet sous la souris.
--- Accès : extension `editor_ezObjectSelect_selectionGeometry` : `extensions.load("editor_ezObjectSelect_selectionGeometry")`, puis la globale `editor_ezObjectSelect_selectionGeometry`
---@class editor_ezObjectSelect_selectionGeometry
editor_ezObjectSelect_selectionGeometry = {}

--- Compare deux signatures élément par élément.
---Source : lua/ge/extensions/editor/ezObjectSelect/selectionGeometry.lua:91
---@param first table|nil
---@param second table|nil
---@return boolean  false si l'une est nil ou de longueur différente
function editor_ezObjectSelect_selectionGeometry.boundsSignaturesEqual(first, second) end

--- Capture la caméra de l'éditeur (core_camera position, quat, FOV) et le viewport imgui principal.
---Source : lua/ge/extensions/editor/ezObjectSelect/selectionGeometry.lua:99
---@return table|nil  {pos, rangeOrigin, right, forward, up, halfTan, aspect, width, height, viewportX, viewportY, nearDistance} ou nil si une donnée manque ou si le viewport est vide
function editor_ezObjectSelect_selectionGeometry.createCameraContext() end

--- Construit le proxy d'un objet pour la caméra : polygone écran de l'enveloppe convexe des coins (découpée au plan proche), aire, centroïde, distances caméra/vue, volume, boîte orientée.
---Source : lua/ge/extensions/editor/ezObjectSelect/selectionGeometry.lua:414
---@param obj userdata Objet de la scène
---@param camera table Contexte de createCameraContext
---@param boundsSignature table|nil Signature déjà calculée (sinon calculée)
---@return table|nil  {source, sourceId, boundsType, worldCorners, polygon, area, centroid, cameraDistance, viewDistance, volume, cameraInside, orientedBox, boundsSignature}
---@return string|nil  raison de l'échec si nil
function editor_ezObjectSelect_selectionGeometry.createProjectedProxy(obj, camera, boundsSignature) end

--- Raccourci : createProjectedProxy puis updateCursorMetrics puis updateRayEntry.
---Source : lua/ge/extensions/editor/ezObjectSelect/selectionGeometry.lua:464
---@param obj userdata
---@param camera table
---@param mousePosition table {x, y}
---@param rayOrigin vec3|nil
---@param rayDirection vec3|nil
---@return table|nil  proxy
---@return string|nil  raison de l'échec
function editor_ezObjectSelect_selectionGeometry.createProxy(obj, camera, mousePosition, rayOrigin, rayDirection) end

--- Renvoie une liste de nombres décrivant les bornes courantes d'un objet (type, transform, échelle, boîte). Sert à comparer deux états avec boundsSignaturesEqual. La table result est réutilisée si fournie.
---Source : lua/ge/extensions/editor/ezObjectSelect/selectionGeometry.lua:55
---@param obj userdata Objet de la scène
---@param result table|nil Table à remplir (réutilisée)
---@return table|nil  signature, ou nil si aucune boîte valide
function editor_ezObjectSelect_selectionGeometry.getBoundsSignature(obj, result) end

--- Volume de la boîte (étendues x échelle absolue pour les objets orientés).
---Source : lua/ge/extensions/editor/ezObjectSelect/selectionGeometry.lua:185
---@param obj userdata|nil Objet de la scène
---@return number|nil  volume en m3 (unités monde), nil si invalide ou non fini
function editor_ezObjectSelect_selectionGeometry.getObjectVolume(obj) end

--- Les 8 coins monde de la boîte d'un objet.
---Source : lua/ge/extensions/editor/ezObjectSelect/selectionGeometry.lua:181
---@param obj userdata Objet de la scène
---@return table|nil  liste de 8 vec3 (ou nil)
---@return string  type de bornes, ou "invalidBounds"
function editor_ezObjectSelect_selectionGeometry.getWorldCorners(obj) end

--- Ajoute au proxy cursorDistance (distance en pixels du curseur au polygone, 0 si dedans) et centerBias (distance au centroïde divisée par racine de l'aire).
---Source : lua/ge/extensions/editor/ezObjectSelect/selectionGeometry.lua:449
---@param proxy table Proxy
---@param mousePosition table {x, y} relatif au viewport
---@return table  le même proxy
function editor_ezObjectSelect_selectionGeometry.updateCursorMetrics(proxy, mousePosition) end

--- Ajoute proxy.rayEntry : distance d'entrée du rayon dans la boîte orientée (math.huge s'il la manque ou sans rayon).
---Source : lua/ge/extensions/editor/ezObjectSelect/selectionGeometry.lua:458
---@param proxy table Proxy
---@param rayOrigin vec3|nil
---@param rayDirection vec3|nil
---@return table  le même proxy
function editor_ezObjectSelect_selectionGeometry.updateRayEntry(proxy, rayOrigin, rayDirection) end

--- Teste qu'une boîte a minExtents/maxExtents finis (|v| < 1e10, pas de NaN) et min <= max sur chaque axe.
---Source : lua/ge/extensions/editor/ezObjectSelect/selectionGeometry.lua:23
---@param box table|nil Boîte avec minExtents et maxExtents
---@return boolean
function editor_ezObjectSelect_selectionGeometry.validBox(box) end

