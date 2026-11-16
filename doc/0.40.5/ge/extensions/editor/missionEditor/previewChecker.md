# `editor_missionEditor_previewChecker`

*File: `lua/ge/extensions/editor/missionEditor/previewChecker.lua` · VM: Game Engine (GE) · 151 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/editor/missionEditor/previewChecker")` (file under extensions/ but not a regular extension)

"Preview" panel of the mission editor. It checks the presence and size of the preview image (preview.png/jpg/jpeg, expected at 1920x1080, <= 1024 KB) and of the thumbnail (thumbnail.*, square between 200 and 400 px, <= 100 KB) in the mission folder, displays tooltips with the images and reports the issues to the Issues tab. The module returns a constructor: require(...)(missionEditor).

## Notes

- Bug: in draw, the thumbnail size test compares size.y to 200 twice (size.y == 200 and size.y == 200); size.x is not checked for the green icon. getMissionIssues, on the other hand, does check for a square thumbnail between 200 and 400 px, so the two checks do not match.
- If no thumbnail is found but the preview exists, the preview is used as the thumbnail ("Using Preview as Thumbnail!" warning).
- The preference missionEditor.general.alwaysShowScreenshots permanently displays both images in the panel.

## Class `C`

Instance of the panel. Fields: missionEditor, mission, previewFile, previewFound, previewImage, thumbFile, thumbFound, thumbImage (texObj objects from ui/imguiUtils).

The module returns a constructor: `local obj = require("editor_missionEditor_previewChecker")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:checkPreview()` | Determines the preview and thumbnail files (mission.previewFile / thumbnailFile or gameplay_missions_missions.getMissionPreviewFilepath / getThumbnailFilepath), indicates whether they are found and loads their textures. | 19 |
| `C:draw()` | Draws the status icons, the hover previews, the button that opens the mission folder and the "Always show Preview" checkbox. | 64 |
| `C:getMissionIssues(m)` | Calls setMission(m) then returns the issues: missing file (error), dimensions or weight out of limits (warning). | 31 |
| `C:init(missionEditor)` | Constructor. | 8 |
| `C:setMission(mission)` | Sets the current mission and reruns checkPreview. | 12 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/missionEditor/previewChecker.lua`.*
