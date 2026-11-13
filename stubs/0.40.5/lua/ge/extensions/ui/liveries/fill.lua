---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/liveries/fill.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Gère la couche de remplissage de base (« fill layer ») d'une livrée dans l'éditeur de livrées. Il s'appuie sur editor_api_dynamicDecals pour créer ou retrouver la couche tout en bas de la pile, et sur ui_liveries_paint pour lire et modifier sa couleur. L'écran de peinture de l'interface l'utilise pour afficher et changer la couleur de fond du véhicule.
--- Accès : extension `ui_liveries_fill` : `extensions.load("ui_liveries_fill")`, puis la globale `ui_liveries_fill`
---@class ui_liveries_fill
---@field dependencies string[] Extensions chargées avant celle-ci : editor_api_dynamicDecals et ui_liveries_paint.
ui_liveries_fill = {}

--- Après chargement d'une livrée existante, cherche dans la pile de couches la première couche de type fill et mémorise son uid. Journalise un avertissement et renvoie false si aucune n'existe (l'écran de peinture reste alors inactif).
---Source : lua/ge/extensions/ui/liveries/fill.lua:21
---@return boolean  true si une couche fill a été trouvée.
function ui_liveries_fill.bindLoadedLayer() end

--- Renvoie la peinture de la couche de base (via ui_liveries_paint.getLayerPaint) complétée par paint.vehicleColor = {r, g, b, a} lue sur la couleur du véhicule du joueur 0. Renvoie nil, avec un avertissement, si aucune couche de base n'est liée.
---Source : lua/ge/extensions/ui/liveries/fill.lua:45
---@return table|nil  Table layerUid, color, metallic, roughness, presets et vehicleColor.
function ui_liveries_fill.getPaint() end

--- Applique une peinture à la couche de base en déléguant à ui_liveries_paint.setLayerPaint. Renvoie false, avec un avertissement, si aucune couche de base n'est liée.
---Source : lua/ge/extensions/ui/liveries/fill.lua:67
---@param paint table Table avec color {r, g, b, a} normalisée entre 0 et 1 (metallic et roughness sont ignorés pour une couche fill).
---@return boolean  true si la couche a été mise à jour.
function ui_liveries_fill.setPaint(paint) end

--- Crée la couche de remplissage de base d'une nouvelle livrée : règle l'id de palette et la couleur par défaut des couches fill, puis ajoute la couche et mémorise son uid. Renvoie false si l'API de décalques n'est pas chargée ou si vehicleColor est absent.
---Source : lua/ge/extensions/ui/liveries/fill.lua:10
---@param vehicleColor Point4F|table Couleur du véhicule passée à setFillLayerColor (type déduit du code).
---@return boolean  true si une couche a été créée et son uid mémorisé.
function ui_liveries_fill.setup(vehicleColor) end

--- Oublie l'uid de la couche de base. Ne supprime pas la couche elle-même.
---Source : lua/ge/extensions/ui/liveries/fill.lua:41
function ui_liveries_fill.teardown() end

