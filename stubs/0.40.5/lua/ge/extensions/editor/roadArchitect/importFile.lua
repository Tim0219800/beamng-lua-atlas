---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/roadArchitect/importFile.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_roadArchitect_importFile` : `extensions.load("editor_roadArchitect_importFile")`, puis la globale `editor_roadArchitect_importFile`
---@class editor_roadArchitect_importFile
editor_roadArchitect_importFile = {}

--- Sync World Editor APIs needed for import/finalize without opening the UI.
---  setEditorActive is deferred across splash frames, so it cannot satisfy a
---  same-request BeamNGpy import. initializeModules creates history; preferences
---  attach during full activate via loadPreferences — ensurePreferencesApi covers
---  the headless case (roadRiver.getPreference during DecalRoad finalize).
---Source : lua/ge/extensions/editor/roadArchitect/importFile.lua:84
function editor_roadArchitect_importFile.ensureEditorHistory() end

--- Lays DecalRoads / meshes, reloads collision, and rebuilds the navgraph.
---  Same work as Road Architect's Render/finalise toggle, without opening the UI.
---  options.finalize must be true (tech/BeamNGpy default); editor UI imports omit it.
---Source : lua/ge/extensions/editor/roadArchitect/importFile.lua:114
---@param options any
function editor_roadArchitect_importFile.maybeFinalise(options) end

---Source : lua/ge/extensions/editor/roadArchitect/importFile.lua:16
---@param filePath any
function editor_roadArchitect_importFile.readTextFile(filePath) end

---Source : lua/ge/extensions/editor/roadArchitect/importFile.lua:60
---@param filePath any
---@param fileContent any
function editor_roadArchitect_importFile.stageText(filePath, fileContent) end

