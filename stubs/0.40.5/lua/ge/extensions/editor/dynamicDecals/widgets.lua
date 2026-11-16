---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/dynamicDecals/widgets.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- ImGui widget library of the Dynamic Decals tool. draw() displays a property (name, description tooltip, optional widget type choice) then the widget suited to its type: bool (checkbox), int (Input/Slider/Drag/Combo), float (Input/Slider/Drag), Point2F (Input/Slider/Drag), Point3F and Point4F (Slider/Color), string (Input/InputMultiline), Texture (File/ImageButton), File, ColorI and MultiColor (gradient). The properties come from the dynamicDecals API (api.propertiesMap, api.types, api.widgetTypes). Also handles the temporary highlighting of a property with automatic scrolling.
--- Access: extension `editor_dynamicDecals_widgets`: `extensions.load("editor_dynamicDecals_widgets")`, then the global `editor_dynamicDecals_widgets`
---@class editor_dynamicDecals_widgets
editor_dynamicDecals_widgets = {}

--- Draws a "refresh" icon button followed by SameLine; calls cbFunc on click.
---Source: lua/ge/extensions/editor/dynamicDecals/widgets.lua:59
---@param widgetId string Widget identifier (the button is "widgetId_resetButton")
---@param cbFunc function Function called on click
---@param tooltipMsg string|nil Optional tooltip
function editor_dynamicDecals_widgets.defaultButton(widgetId, cbFunc, tooltipMsg) end

--- Draws a property and its widget. Returns true if the value was modified this frame; editEnded[0] is updated to indicate the end of an edit (mouse release, validation).
---Source: lua/ge/extensions/editor/dynamicDecals/widgets.lua:1325
---@param value any Current value of the property (type according to property.type)
---@param property table Property {id, name?, description?, type?, widgetType?, default?, value, ...}; id is used to find api.propertiesMap
---@param guiId string imgui identifier suffix to make the widget unique (widgetId = "##guiId_property.id")
---@param editEnded table|nil imgui boolean pointer ([0]) set to true at the end of the edit
---@param widgetOptions table|nil Rendering options, for example widthMod (width adjustment in pixels)
---@return boolean|nil  true if modified, otherwise nil
function editor_dynamicDecals_widgets.draw(value, property, guiId, editEnded, widgetOptions) end

--- Empty preference hook.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/dynamicDecals/widgets.lua:1582
---@param path string Path
---@param value any Value
function editor_dynamicDecals_widgets.editorPreferenceValueChanged(path, value) end

--- Highlights a property (frame in the BeamNG color) and scrolls the window to it. Replaces any previous highlight.
---Source: lua/ge/extensions/editor/dynamicDecals/widgets.lua:1553
---@param id string Full widget identifier, in the format "##guiId_propertyId"
---@param time number Duration in seconds (decremented with dtReal)
function editor_dynamicDecals_widgets.highlight(id, time) end

--- Registers the preferences texturePreviewSize and multiColorWidgetWidth.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/dynamicDecals/widgets.lua:1575
---@param prefsRegistry table Preferences registry
function editor_dynamicDecals_widgets.registerEditorPreferences(prefsRegistry) end

--- Initializes with the parent tool, gets the dynamicDecals API and the helper, and registers the update that expires the highlights.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/dynamicDecals/widgets.lua:1567
---@param tool_in table Module editor_dynamicDecalsTool
function editor_dynamicDecals_widgets.setup(tool_in) end

