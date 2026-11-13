---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/dynamicDecals/vehicleColorPalette.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Section « Vehicle Color Palette » de l'outil Dynamic Decals : permet de changer les couleurs du véhicule joueur (color, colorPalette0, colorPalette1) et ses données de peinture métallique (metallicPaintData : Metallic, Roughness, Clear Coat, Clear Coat Roughness, via getField/setField) pour voir l'effet sur un design. Enregistre aussi une préférence « palettes » avec 19 palettes de 3 couleurs prédéfinies (BeamNG, Camouflage, Chocolate, Dunes, Fast Car, France, Icy, Italy, Lilac, Midnight, Moss, Neptune, Pastelle, Retro Handheld Console, Sunset, Tape Deck, The 80's, Vintage, Watermelon). Les couleurs du véhicule sont sérialisées avec l'état de l'outil et restaurées après 5 frames.
--- Accès : extension `editor_dynamicDecals_vehicleColorPalette` : `extensions.load("editor_dynamicDecals_vehicleColorPalette")`, puis la globale `editor_dynamicDecals_vehicleColorPalette`
---@class editor_dynamicDecals_vehicleColorPalette
editor_dynamicDecals_vehicleColorPalette = {}

--- Hook de préférence vide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/dynamicDecals/vehicleColorPalette.lua:394
---@param path string Chemin de préférence
---@param value any Nouvelle valeur
function editor_dynamicDecals_vehicleColorPalette.editorPreferenceValueChanged(path, value) end

--- Hook de désérialisation : programme la restauration des couleurs sauvegardées dans 5 frames.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/dynamicDecals/vehicleColorPalette.lua:454
---@param data table Données renvoyées par onSerialize
function editor_dynamicDecals_vehicleColorPalette.onDeserialized(data) end

--- Dessine le contenu de la section (couleurs et réglages métalliques du véhicule joueur). Appelé par l'outil dans la section et dans sa fenêtre dédiée.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/dynamicDecals/vehicleColorPalette.lua:66
---@param guiId string Suffixe d'identifiant imgui pour éviter les collisions entre section et fenêtre
function editor_dynamicDecals_vehicleColorPalette.onGui(guiId) end

--- Hook de sérialisation : renvoie {colors = {{color}, {colorPalette0}, {colorPalette1}}} (4 composantes chacune) du véhicule joueur, ou colors = nil sans véhicule.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/dynamicDecals/vehicleColorPalette.lua:438
---@return table  {colors = table|nil}
function editor_dynamicDecals_vehicleColorPalette.onSerialize() end

--- Enregistre dans la sous-catégorie dynamicDecalsTool.vehicleColorPalette la préférence palettes (table de {name, values = 3 triplets RGB}).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/dynamicDecals/vehicleColorPalette.lua:322
---@param prefsRegistry table Registre de préférences
function editor_dynamicDecals_vehicleColorPalette.registerEditorPreferences(prefsRegistry) end

--- Initialise le module avec l'outil parent : enregistre la section (ordre 120, fermée par défaut, bouton d'aide), la fonction de mise à jour de restauration des couleurs et la page de documentation.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/dynamicDecals/vehicleColorPalette.lua:426
---@param tool_in table Module editor_dynamicDecalsTool
function editor_dynamicDecals_vehicleColorPalette.setup(tool_in) end

