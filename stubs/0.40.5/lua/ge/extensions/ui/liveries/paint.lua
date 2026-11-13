---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/liveries/paint.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Lit et modifie la peinture (couleur RGBA, métallisation, rugosité) d'une couche de l'éditeur de livrées, retrouvée par son uid dans editor_api_dynamicDecals. Il fournit aussi les peintures prédéfinies du modèle de véhicule actuel. Il sert à l'écran de peinture de l'interface et à l'éditeur de décalques.
--- Accès : extension `ui_liveries_paint` : `extensions.load("ui_liveries_paint")`, puis la globale `ui_liveries_paint`
---@class ui_liveries_paint
---@field EDITABLE_COLOR_PALETTE_MAP_ID integer Vaut 0. C'est le seul mode où une couche affiche sa propre couleur ; tout autre id prend la couleur dans un emplacement de palette du véhicule et ignore celle de la couche.
---@field dependencies string[] Extensions chargées avant celle-ci : editor_api_dynamicDecals.
ui_liveries_paint = {}

--- Renvoie la peinture de la couche d'uid donné : layerUid, color {r, g, b, a} (blanc par défaut), metallic, roughness et presets. Renvoie nil, avec un avertissement, si l'uid n'est pas une chaîne ou si la couche n'existe pas.
---Source : lua/ge/extensions/ui/liveries/paint.lua:59
---@param layerUid string Uid de la couche.
---@return table|nil  Table de peinture.
function ui_liveries_paint.getLayerPaint(layerUid) end

--- Renvoie la liste model.paints du modèle du véhicule du joueur 0 (via core_vehicles.getModel), ou une table vide s'il n'y a pas de véhicule. Partagée avec l'éditeur de décalques.
---Source : lua/ge/extensions/ui/liveries/paint.lua:12
---@return table  Peintures prédéfinies du modèle.
function ui_liveries_paint.getVehiclePaintPresets() end

--- Convertit value en nombre et le borne entre 0 et 1 ; renvoie fallback si la conversion échoue.
---Source : lua/ge/extensions/ui/liveries/paint.lua:21
---@param value any Valeur reçue de l'interface.
---@param fallback number Valeur renvoyée si value n'est pas numérique.
---@return number  Valeur dans [0, 1] ou fallback.
function ui_liveries_paint.readNormalized(value, fallback) end

--- Applique color, metallic et roughness à la couche d'uid donné, via une copie de la couche passée à editor_api_dynamicDecals.setLayer. Renvoie false si la couche est introuvable ou si paint n'est pas une table.
---Source : lua/ge/extensions/ui/liveries/paint.lua:67
---@param layerUid string Uid de la couche.
---@param paint table Champs facultatifs color {r, g, b, a}, metallic, roughness, tous normalisés entre 0 et 1.
---@return boolean  true si la mise à jour a été faite.
function ui_liveries_paint.setLayerPaint(layerUid, paint) end

