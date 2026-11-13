---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/ezObjectSelect/objectBoxAnchors.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Calcule des points d'ancrage sur le bas de la boîte englobante d'un objet pour l'outil Easy Select. Trois motifs sont produits : shortEdge (milieu du petit côté, à z min), longEdge (milieu du grand côté) et shortEdgeOrigin (comme shortEdge mais à z = 0 local, au niveau de l'origine). Le « long » axe est X si l'étendue mise à l'échelle en X >= celle en Y. Sert à décrire des arêtes de référence pour le déplacement/aimantation.
--- Accès : extension `editor_ezObjectSelect_objectBoxAnchors` : `extensions.load("editor_ezObjectSelect_objectBoxAnchors")`, puis la globale `editor_ezObjectSelect_objectBoxAnchors`
---@class editor_ezObjectSelect_objectBoxAnchors
editor_ezObjectSelect_objectBoxAnchors = {}

--- Décrit une boîte locale (méthodes getCenter/getExtents et minExtents/maxExtents). Renvoie nil si la boîte n'est pas valide.
---Source : lua/ge/extensions/editor/ezObjectSelect/objectBoxAnchors.lua:54
---@param box table Boîte englobante locale
---@param scale vec3|nil Échelle de l'objet (défaut 1,1,1)
---@return table|nil  {isLongX, scaledX, scaledY, shortEdge, longEdge, shortEdgeOrigin}, chaque arête ayant firstLocal/secondLocal
function editor_ezObjectSelect_objectBoxAnchors.describeBox(box, scale) end

--- Idem describeBox pour une boîte de mesh simple {minExtents, maxExtents, center, extents}. nil si un champ manque.
---Source : lua/ge/extensions/editor/ezObjectSelect/objectBoxAnchors.lua:59
---@param meshBox table Boîte de mesh
---@param scale vec3|nil Échelle (défaut 1,1,1)
---@return table|nil  Même structure que describeBox
function editor_ezObjectSelect_objectBoxAnchors.describeMeshBox(meshBox, scale) end

--- Décrit un objet de la scène en coordonnées monde. Utilise getObjBox + getTransform + getScale si possible ; sinon retombe sur la boîte monde getWorldBox. Chaque motif contient first, second, firstOffset, secondOffset, centerOffset (offsets relatifs à la position de l'objet).
---Source : lua/ge/extensions/editor/ezObjectSelect/objectBoxAnchors.lua:88
---@param obj userdata Objet de la scène (doit avoir getPosition)
---@return table|nil  {isLongX, scaledX, scaledY, shortEdge, longEdge, shortEdgeOrigin} ou nil si aucune boîte valide
function editor_ezObjectSelect_objectBoxAnchors.describeObject(obj) end

