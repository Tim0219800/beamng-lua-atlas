---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/dynamicDecals/widgets.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Bibliothèque de widgets imgui de l'outil Dynamic Decals. draw() affiche une propriété (nom, infobulle de description, éventuel choix du type de widget) puis le widget adapté à son type : bool (case à cocher), int (Input/Slider/Drag/Combo), float (Input/Slider/Drag), Point2F (Input/Slider/Drag), Point3F et Point4F (Slider/Color), string (Input/InputMultiline), Texture (File/ImageButton), File, ColorI et MultiColor (dégradé). Les propriétés viennent de l'API dynamicDecals (api.propertiesMap, api.types, api.widgetTypes). Gère aussi la mise en évidence temporaire d'une propriété avec défilement automatique.
--- Accès : extension `editor_dynamicDecals_widgets` : `extensions.load("editor_dynamicDecals_widgets")`, puis la globale `editor_dynamicDecals_widgets`
---@class editor_dynamicDecals_widgets
editor_dynamicDecals_widgets = {}

--- Dessine un bouton icône « refresh » suivi de SameLine ; appelle cbFunc au clic.
---Source : lua/ge/extensions/editor/dynamicDecals/widgets.lua:59
---@param widgetId string Identifiant du widget (le bouton est « widgetId_resetButton »)
---@param cbFunc function Fonction appelée au clic
---@param tooltipMsg string|nil Infobulle optionnelle
function editor_dynamicDecals_widgets.defaultButton(widgetId, cbFunc, tooltipMsg) end

--- Dessine une propriété et son widget. Renvoie true si la valeur a été modifiée cette frame ; editEnded[0] est mis à jour pour indiquer la fin d'une édition (relâchement de la souris, validation).
---Source : lua/ge/extensions/editor/dynamicDecals/widgets.lua:1325
---@param value any Valeur actuelle de la propriété (type selon property.type)
---@param property table Propriété {id, name?, description?, type?, widgetType?, default?, value, ...} ; id sert à retrouver api.propertiesMap
---@param guiId string Suffixe d'identifiant imgui pour rendre le widget unique (widgetId = "##guiId_property.id")
---@param editEnded table|nil Pointeur booléen imgui ([0]) mis à true à la fin de l'édition
---@param widgetOptions table|nil Options de rendu, par exemple widthMod (ajustement de largeur en pixels)
---@return boolean|nil  true si modifié, sinon nil
function editor_dynamicDecals_widgets.draw(value, property, guiId, editEnded, widgetOptions) end

--- Hook de préférence vide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/dynamicDecals/widgets.lua:1582
---@param path string Chemin
---@param value any Valeur
function editor_dynamicDecals_widgets.editorPreferenceValueChanged(path, value) end

--- Met en évidence une propriété (cadre de la couleur BeamNG) et fait défiler la fenêtre jusqu'à elle. Remplace toute mise en évidence précédente.
---Source : lua/ge/extensions/editor/dynamicDecals/widgets.lua:1553
---@param id string Identifiant de widget complet, au format "##guiId_propertyId"
---@param time number Durée en secondes (décrémentée avec dtReal)
function editor_dynamicDecals_widgets.highlight(id, time) end

--- Enregistre les préférences texturePreviewSize et multiColorWidgetWidth.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/dynamicDecals/widgets.lua:1575
---@param prefsRegistry table Registre de préférences
function editor_dynamicDecals_widgets.registerEditorPreferences(prefsRegistry) end

--- Initialise avec l'outil parent, récupère l'API dynamicDecals et le helper, et enregistre la mise à jour qui fait expirer les mises en évidence.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/dynamicDecals/widgets.lua:1567
---@param tool_in table Module editor_dynamicDecalsTool
function editor_dynamicDecals_widgets.setup(tool_in) end

