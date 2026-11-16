---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/dynamicDecals/vehicleColorPalette.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- "Vehicle Color Palette" section of the Dynamic Decals tool: lets you change the player vehicle's colors (color, colorPalette0, colorPalette1) and its metallic paint data (metallicPaintData: Metallic, Roughness, Clear Coat, Clear Coat Roughness, via getField/setField) to see the effect on a design. Also registers a "palettes" preference with 19 predefined palettes of 3 colors (BeamNG, Camouflage, Chocolate, Dunes, Fast Car, France, Icy, Italy, Lilac, Midnight, Moss, Neptune, Pastelle, Retro Handheld Console, Sunset, Tape Deck, The 80's, Vintage, Watermelon). The vehicle colors are serialized with the tool state and restored after 5 frames.
--- Access: extension `editor_dynamicDecals_vehicleColorPalette`: `extensions.load("editor_dynamicDecals_vehicleColorPalette")`, then the global `editor_dynamicDecals_vehicleColorPalette`
---@class editor_dynamicDecals_vehicleColorPalette
editor_dynamicDecals_vehicleColorPalette = {}

--- Empty preference hook.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/dynamicDecals/vehicleColorPalette.lua:394
---@param path string Preference path
---@param value any New value
function editor_dynamicDecals_vehicleColorPalette.editorPreferenceValueChanged(path, value) end

--- Deserialization hook: schedules the restoration of the saved colors in 5 frames.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/dynamicDecals/vehicleColorPalette.lua:454
---@param data table Data returned by onSerialize
function editor_dynamicDecals_vehicleColorPalette.onDeserialized(data) end

--- Draws the section content (player vehicle colors and metallic settings). Called by the tool in the section and in its dedicated window.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/dynamicDecals/vehicleColorPalette.lua:66
---@param guiId string imgui identifier suffix to avoid collisions between section and window
function editor_dynamicDecals_vehicleColorPalette.onGui(guiId) end

--- Serialization hook: returns {colors = {{color}, {colorPalette0}, {colorPalette1}}} (4 components each) of the player vehicle, or colors = nil without a vehicle.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/dynamicDecals/vehicleColorPalette.lua:438
---@return table  {colors = table|nil}
function editor_dynamicDecals_vehicleColorPalette.onSerialize() end

--- Registers in the subcategory dynamicDecalsTool.vehicleColorPalette the palettes preference (table of {name, values = 3 RGB triplets}).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/dynamicDecals/vehicleColorPalette.lua:322
---@param prefsRegistry table Preferences registry
function editor_dynamicDecals_vehicleColorPalette.registerEditorPreferences(prefsRegistry) end

--- Initializes the module with the parent tool: registers the section (order 120, closed by default, help button), the color restoration update function and the documentation page.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/dynamicDecals/vehicleColorPalette.lua:426
---@param tool_in table Module editor_dynamicDecalsTool
function editor_dynamicDecals_vehicleColorPalette.setup(tool_in) end

