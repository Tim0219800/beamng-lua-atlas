---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/audioForestEditor.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- "Audio Forest Editor" edit mode of the level editor: configures a forest ambience sound from the trees of the Forest object. The tool builds a node graph (minimum spacing 20 m) from the included forest instances, classifies them as S/M/L according to the volume of their bounding box, sends this cloud to the runtime module core/audioForest and gives it the main event (default 'event:>Ambient>Ambiences>Forest_Static') and an optional "roomtone" ('event:>Ambient>Ambiences>Roomtone'). The window lets you exclude tree types, choose the class of each type, adjust the node visualization and select a type by clicking in the view. The state is persisted with the level through onSerialize / onDeserialized.
--- Access: extension `editor_audioForestEditor`: `extensions.load("editor_audioForestEditor")`, then the global `editor_audioForestEditor`
---@class editor_audioForestEditor
editor_audioForestEditor = {}

--- Receives the persisted state after level load; keeps it pending, marks the forest list as to be refreshed and rebuilds the node cloud if the mode is active. Ignores data that is not a table.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/audioForestEditor.lua:1005
---@param data table Table previously returned by onSerialize.
function editor_audioForestEditor.onDeserialized(data) end

--- Called every editor frame: if the mode is active, refreshes the type list, draws the window, handles tree hover/selection and draws the graph nodes (and the centroid of the main emitter).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/audioForestEditor.lua:918
function editor_audioForestEditor.onEditorGui() end

--- Registers the audioForestEditMode edit mode (create_forest icon) and the "audioForestEditor" window (520x820).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/audioForestEditor.lua:991
function editor_audioForestEditor.onEditorInitialized() end

--- Returns the tool state as a table (version=1, visualization radii, showNodes, mainEvent, roomtoneEnabled/Event/Z, selectedRow, includeByShape, classSelByShape, classOverrideByShape) for level persistence and the runtime.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/audioForestEditor.lua:113
---@return table  Serializable editor state.
function editor_audioForestEditor.onSerialize() end

