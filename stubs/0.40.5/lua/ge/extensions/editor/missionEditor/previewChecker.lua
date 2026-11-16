---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/missionEditor/previewChecker.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Instance of the panel. Fields: missionEditor, mission, previewFile, previewFound, previewImage, thumbFile, thumbFound, thumbImage (texObj objects from ui/imguiUtils).
---@class editor_missionEditor_previewChecker
local editor_missionEditor_previewChecker = {}

--- Determines the preview and thumbnail files (mission.previewFile / thumbnailFile or gameplay_missions_missions.getMissionPreviewFilepath / getThumbnailFilepath), indicates whether they are found and loads their textures.
---Source: lua/ge/extensions/editor/missionEditor/previewChecker.lua:19
function editor_missionEditor_previewChecker:checkPreview() end

--- Draws the status icons, the hover previews, the button that opens the mission folder and the "Always show Preview" checkbox.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/missionEditor/previewChecker.lua:64
function editor_missionEditor_previewChecker:draw() end

--- Calls setMission(m) then returns the issues: missing file (error), dimensions or weight out of limits (warning).
---Source: lua/ge/extensions/editor/missionEditor/previewChecker.lua:31
---@param m table Mission to check.
---@return table[]  List of elements {label, severity}.
function editor_missionEditor_previewChecker:getMissionIssues(m) end

--- Constructor.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/missionEditor/previewChecker.lua:8
---@param missionEditor table Main editor_missionEditor module.
function editor_missionEditor_previewChecker:init(missionEditor) end

--- Sets the current mission and reruns checkPreview.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/missionEditor/previewChecker.lua:12
---@param mission table Current mission.
function editor_missionEditor_previewChecker:setMission(mission) end

