---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/util/editorElementHelper.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Instance of the element helper (with elements, autoAdditionalAttributes, mode, typeDataFieldName, container).
---@class editor_util_editorElementHelper
local editor_util_editorElementHelper = {}

--- Decoration: large title (color by name: default, orange, red, green, blue, white, black).
---Source: lua/ge/extensions/editor/util/editorElementHelper.lua:240
---@param text string|nil Text.
---@param color string|nil Color name.
---@return table  Element.
function editor_util_editorElementHelper:addBigDecoHeader(text, color) end

--- Checkbox, default false. With hideElementList, those elements are moved right after it and hidden (hidden) while the box is unchecked.
---Source: lua/ge/extensions/editor/util/editorElementHelper.lua:35
---@param label string Label.
---@param fieldName string Key.
---@param defaultValue boolean|nil Default value.
---@param hideElementList table[]|nil Elements to display only if checked.
---@param displayOptions table|nil Options.
---@return table  Element.
function editor_util_editorElementHelper:addBool(label, fieldName, defaultValue, hideElementList, displayOptions) end

--- Reference to another element of the container by identifier, default "(none)"; idType is ignored by the code.
---Source: lua/ge/extensions/editor/util/editorElementHelper.lua:212
---@param label string Label.
---@param fieldName string Key.
---@param idType any Not used.
---@param defaultValue string|nil Default.
---@param displayOptions table|nil Options.
---@return table  Element.
function editor_util_editorElementHelper:addContainerId(label, fieldName, idType, defaultValue, displayOptions) end

--- Custom element: getNewFunction(e) returns a list {fieldName, value}, setContainerFunction(e, data) loads the values, drawFunction draws. All three are nop by default.
---Source: lua/ge/extensions/editor/util/editorElementHelper.lua:22
---@param label string Label.
---@param getNewFunction function|nil Default values.
---@param setContainerFunction function|nil Loading from the container.
---@param drawFunction function|nil Imgui drawing.
---@return table  Element.
function editor_util_editorElementHelper:addCustomElement(label, getNewFunction, setContainerFunction, drawFunction) end

--- Decoration: vertical space of given height (default 1).
---Source: lua/ge/extensions/editor/util/editorElementHelper.lua:245
---@param height number|nil Height.
---@return table  Element.
function editor_util_editorElementHelper:addDecoDummy(height) end

--- Decoration: colored section title.
---Source: lua/ge/extensions/editor/util/editorElementHelper.lua:241
---@param text string|nil Text.
---@param color string|nil Color name.
---@return table  Element.
function editor_util_editorElementHelper:addDecoHeader(text, color) end

--- Decoration: separator.
---Source: lua/ge/extensions/editor/util/editorElementHelper.lua:243
---@return table  Element.
function editor_util_editorElementHelper:addDecoSeparator() end

--- Decoration: vertical space of 4.
---Source: lua/ge/extensions/editor/util/editorElementHelper.lua:244
---@return table  Element.
function editor_util_editorElementHelper:addDecoSpacer() end

--- Decoration: plain text with optional tooltip.
---Source: lua/ge/extensions/editor/util/editorElementHelper.lua:242
---@param text string|nil Text.
---@param tooltip string|nil Tooltip.
---@return table  Element.
function editor_util_editorElementHelper:addDecoText(text, tooltip) end

--- Dropdown; if values is empty, it contains "issues Values!". Default: first value.
---Source: lua/ge/extensions/editor/util/editorElementHelper.lua:177
---@param label string Label.
---@param fieldName string Key.
---@param values string[]|nil Choices.
---@param defaultValue string|nil Default value.
---@param valueTooltips table|nil Tooltips per value.
---@return table  Element.
function editor_util_editorElementHelper:addDropdown(label, fieldName, values, defaultValue, valueTooltips) end

--- Adds an already built element to the list: gives it a unique _id, normalizes displayOptions and returns it.
---Source: lua/ge/extensions/editor/util/editorElementHelper.lua:246
---@param element table Element (type, label, fieldName...).
---@return table  The added element.
function editor_util_editorElementHelper:addElement(element) end

--- File selector (1024-character string); allowedExtensions is a list of {description, pattern} pairs.
---Source: lua/ge/extensions/editor/util/editorElementHelper.lua:107
---@param label string Label.
---@param fieldName string Key.
---@param defaultValue string|nil Default path.
---@param allowedExtensions table[]|nil Pairs {label, pattern}.
---@param displayOptions table|nil Options (optional = no existence check).
---@return table  Element.
function editor_util_editorElementHelper:addFile(label, fieldName, defaultValue, allowedExtensions, displayOptions) end

--- Expected file(s) at a fixed location in the folder; a string or a list (only one of the files is required).
---Source: lua/ge/extensions/editor/util/editorElementHelper.lua:120
---@param label string Label.
---@param filepathsInfolder string|string[] Relative path(s).
---@param displayOptions table|nil Options.
---@return table  Element.
function editor_util_editorElementHelper:addFixedFile(label, filepathsInfolder, displayOptions) end

--- Ranking: number of entries and best, medium, worst times/results. Defaults: 10, 80, 120, 200.
---Source: lua/ge/extensions/editor/util/editorElementHelper.lua:152
---@param label string Label.
---@param fieldName string Prefix of the fields.
---@param defaultCount integer|nil Default 10.
---@param defaultBest number|nil Default 80.
---@param defaultMedium number|nil Default 120.
---@param defaultWorst number|nil Default 200.
---@return table  Element.
function editor_util_editorElementHelper:addLeaderboard(label, fieldName, defaultCount, defaultBest, defaultMedium, defaultWorst) end

--- Vehicle model and configuration selector; default sbr / TT_RWD_S_M.
---Source: lua/ge/extensions/editor/util/editorElementHelper.lua:96
---@param label string Label.
---@param fieldName string Prefix of the Model/Config/ConfigPath fields.
---@param defaultModel string|nil Default model.
---@param defaultConfig string|nil Default configuration.
---@param displayOptions table|nil Options.
---@return table  Element.
function editor_util_editorElementHelper:addModelConfig(label, fieldName, defaultModel, defaultConfig, displayOptions) end

--- Numeric field (FloatPtr), default 0.
---Source: lua/ge/extensions/editor/util/editorElementHelper.lua:25
---@param label string Label.
---@param fieldName string Key in the data.
---@param defaultValue number|nil Default value.
---@param displayOptions table|nil Display options.
---@return table  Element.
function editor_util_editorElementHelper:addNumeric(label, fieldName, defaultValue, displayOptions) end

--- Path file (*.path.json), element of type 'race'.
---Source: lua/ge/extensions/editor/util/editorElementHelper.lua:136
---@param label string Label.
---@param fieldName string Key.
---@param defaultValue string|nil Default.
---@param ... any Passed to addFile (displayOptions).
---@return table  Element.
function editor_util_editorElementHelper:addRace(label, fieldName, defaultValue, ...) end

--- Numeric field of type 'reward'.
---Source: lua/ge/extensions/editor/util/editorElementHelper.lua:172
---@param label string Label.
---@param fieldName string Key.
---@param defaultValue number|nil Default.
---@return table  Element.
function editor_util_editorElementHelper:addReward(label, fieldName, defaultValue) end

--- Simple lap configuration (lapConfigUtil), default {}.
---Source: lua/ge/extensions/editor/util/editorElementHelper.lua:141
---@param label string Label.
---@param fieldName string Key.
---@param displayOptions table|nil Options.
---@return table  Element.
function editor_util_editorElementHelper:addSimpleLapConfig(label, fieldName, displayOptions) end

--- Sites file (*.sites.json), element of type 'sites'.
---Source: lua/ge/extensions/editor/util/editorElementHelper.lua:147
---@param label string Label.
---@param fieldName string Key.
---@param defaultValue string|nil Default.
---@return table  Element.
function editor_util_editorElementHelper:addSites(label, fieldName, defaultValue) end

--- Text field (ArrayChar), length 1024 by default, default empty.
---Source: lua/ge/extensions/editor/util/editorElementHelper.lua:29
---@param label string Label.
---@param fieldName string Key.
---@param defaultValue string|nil Default value.
---@param len integer|nil Buffer size.
---@param displayOptions table|nil Options.
---@return table  Element.
function editor_util_editorElementHelper:addString(label, fieldName, defaultValue, len, displayOptions) end

--- Editable 3D transform (position, rotation, scale) with gizmo (transformUtil). valueOptions: defaultPos, defaultRot, defaultScl, hasPos, hasRot, hasScl, oneDimScale; displayOptions: drawMode ('sphere' by default, 'vehicle', 'sphereDir', 'halfBox', 'fullBox'), drawColor (default {1,0.25,0,0.5}).
---Source: lua/ge/extensions/editor/util/editorElementHelper.lua:58
---@param label string Label.
---@param fieldName string Prefix of the Pos/Rot/Scl fields.
---@param valueOptions table|nil Values and active components.
---@param displayOptions table|nil Rendering.
---@return table  Element.
function editor_util_editorElementHelper:addTransform(label, fieldName, valueOptions, displayOptions) end

--- Vehicle filter (vehicleFilterUtil): base filter, probability settings, manual additions/removals, maxVehicles (0 = all), popAttribute ("Population"), auxiliary vehicles and loaded trailers.
---Source: lua/ge/extensions/editor/util/editorElementHelper.lua:187
---@param label string Label.
---@param fieldName string Key.
---@param displayOptions table|nil Options.
---@return table  Element.
function editor_util_editorElementHelper:addVehicleFilter(label, fieldName, displayOptions) end

--- Selector of initial and destination zones (zoneSelectorUtil), read from the sites file of the folder given by globalInfoFolderFieldName.
---Source: lua/ge/extensions/editor/util/editorElementHelper.lua:217
---@param label string Label.
---@param fieldName string Prefix of the fields.
---@param globalInfoFolderFieldName string Field containing the global info folder.
---@param displayOptions table|nil Options.
---@return table  Element.
function editor_util_editorElementHelper:addZoneSelector(label, fieldName, globalInfoFolderFieldName, displayOptions) end

--- Checks a container: missing fields, types different from those expected, nonexistent models/configs, missing files, etc. Returns a list of problems {label, severity, fixable, data}. The fix parameter allows repairing fixable problems (inferred from code).
---Source: lua/ge/extensions/editor/util/editorElementHelper.lua:496
---@param c table Container.
---@param fix boolean|nil Apply the fixes.
---@param tags any Labels (inferred from code).
---@return table[]  Problems detected.
function editor_util_editorElementHelper:checkContainer(c, fix, tags) end

--- Empties the list of elements.
---Source: lua/ge/extensions/editor/util/editorElementHelper.lua:259
function editor_util_editorElementHelper:clear() end

--- Draws the form (visible elements) and handles transform editing by click in the 3D view (in objectSelect mode, hovering a transform = "Click to Edit").
---Source: lua/ge/extensions/editor/util/editorElementHelper.lua:1287
---@param filterOptions table|nil Display filtering options.
function editor_util_editorElementHelper:draw(filterOptions) end

--- Draws an axis-aligned box (corner, x, y, z vectors, color) with debugDrawer.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/util/editorElementHelper.lua:1420
---@param corner vec3 Corner.
---@param x vec3 Axis x.
---@param y vec3 Axis y.
---@param z vec3 Axis z.
---@param clr any Color.
function editor_util_editorElementHelper:drawAxisBox(corner, x, y, z, clr) end

--- Draws a transform as a sphere with direction (debugDrawer).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/util/editorElementHelper.lua:1327
---@param e table Transform element.
function editor_util_editorElementHelper:drawTransformAsSphereDir(e) end

--- Draws a transform as a vehicle footprint (debugDrawer).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/util/editorElementHelper.lua:1346
---@param e table Transform element.
function editor_util_editorElementHelper:drawTransformAsVehicle(e) end

--- True if a transform of the helper (or the start trigger transform of the mission editor) is being edited.
---Source: lua/ge/extensions/editor/util/editorElementHelper.lua:1271
---@return boolean  Editing in progress.
function editor_util_editorElementHelper:editingAnyTransform() end

--- List of the managed field names with their type, all elements combined.
---Source: lua/ge/extensions/editor/util/editorElementHelper.lua:1519
---@return table[]  Field name/type entries.
function editor_util_editorElementHelper:getAllFieldNames() end

--- Gathers the default values of all elements into a fieldName -> value table (new container).
---Source: lua/ge/extensions/editor/util/editorElementHelper.lua:327
---@return table<string, any>  Default values.
function editor_util_editorElementHelper:getNewData() end

--- Enables (default true) or disables the automatic handling of additional attributes for the given key.
---Source: lua/ge/extensions/editor/util/editorElementHelper.lua:1529
---@param key string Key.
---@param auto boolean|nil True by default.
function editor_util_editorElementHelper:setAutoAdditionalAttributes(key, auto) end

--- Remembers the container and loads into each element the values of c[typeDataFieldName]; calls valueChangedCallback of the elements concerned. C.setContainerBaseFunction is an alias.
---Source: lua/ge/extensions/editor/util/editorElementHelper.lua:380
---@param c table Container (mission, quest or test).
function editor_util_editorElementHelper:setContainer(c) end

--- Updates mouseInfo: camera position, mouse ray, ray hit (forest collision disabled for the duration of the shot), button down/held state and closest hovered transform.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/util/editorElementHelper.lua:1203
---@param container table Current container.
function editor_util_editorElementHelper:updateMouseInfo(container) end

