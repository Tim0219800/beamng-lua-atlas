---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/util/transformUtil.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe locale `C` de lua/ge/extensions/editor/util/transformUtil.lua (instanciée par la fonction renvoyée par le module)
---@class editor_util_transformUtil
local editor_util_transformUtil = {}

--- dragging functions
---Source : lua/ge/extensions/editor/util/transformUtil.lua:674
function editor_util_transformUtil:beginDrag() end

---Source : lua/ge/extensions/editor/util/transformUtil.lua:418
function editor_util_transformUtil:combinedWidget() end

--- draws helper functionality
---Source : lua/ge/extensions/editor/util/transformUtil.lua:366
function editor_util_transformUtil:contextMenu() end

--- helper function for getting if the correct edit mode is active
---Source : lua/ge/extensions/editor/util/transformUtil.lua:742
function editor_util_transformUtil:correctEditMode() end

---Source : lua/ge/extensions/editor/util/transformUtil.lua:681
function editor_util_transformUtil:dragging() end

---Source : lua/ge/extensions/editor/util/transformUtil.lua:306
---@param cooldown any
function editor_util_transformUtil:enableEditing(cooldown) end

---Source : lua/ge/extensions/editor/util/transformUtil.lua:732
function editor_util_transformUtil:endDragging() end

---Source : lua/ge/extensions/editor/util/transformUtil.lua:547
function editor_util_transformUtil:getValidButtons() end

--- draws a button to enter the editmode and handles the gizmo if in the edit mode
---Source : lua/ge/extensions/editor/util/transformUtil.lua:559
function editor_util_transformUtil:gizmo() end

---Source : lua/ge/extensions/editor/util/transformUtil.lua:355
function editor_util_transformUtil:helperAlignWithTerrain() end

---Source : lua/ge/extensions/editor/util/transformUtil.lua:329
function editor_util_transformUtil:helperCameraToPosition() end

---Source : lua/ge/extensions/editor/util/transformUtil.lua:343
function editor_util_transformUtil:helperCameraToPositionRotation() end

---Source : lua/ge/extensions/editor/util/transformUtil.lua:336
function editor_util_transformUtil:helperCameraToRotation() end

---Source : lua/ge/extensions/editor/util/transformUtil.lua:313
function editor_util_transformUtil:helperFocus() end

---Source : lua/ge/extensions/editor/util/transformUtil.lua:349
function editor_util_transformUtil:helperMoveToTransform() end

---Source : lua/ge/extensions/editor/util/transformUtil.lua:322
function editor_util_transformUtil:helperPositionDownToTerrain() end

---Source : lua/ge/extensions/editor/util/transformUtil.lua:319
function editor_util_transformUtil:helperPositionInFrontOfToCamera() end

---Source : lua/ge/extensions/editor/util/transformUtil.lua:316
function editor_util_transformUtil:helperPositionToCamera() end

---Source : lua/ge/extensions/editor/util/transformUtil.lua:361
function editor_util_transformUtil:helperRotateWithCamera() end

---Source : lua/ge/extensions/editor/util/transformUtil.lua:326
function editor_util_transformUtil:helperRotationToCamera() end

--- initializes stuff for the helper.
---Source : lua/ge/extensions/editor/util/transformUtil.lua:68
---@param editName any
---@param objectName any
function editor_util_transformUtil:init(editName, objectName) end

--- helper callbacks for the edit mode
---Source : lua/ge/extensions/editor/util/transformUtil.lua:747
function editor_util_transformUtil:onActivate() end

---Source : lua/ge/extensions/editor/util/transformUtil.lua:751
function editor_util_transformUtil:onDeactivate() end

---Source : lua/ge/extensions/editor/util/transformUtil.lua:737
function editor_util_transformUtil:resetDragging() end

--- sets the position, rotation and scale of the helper. nil parameters are ignored,
---  so you can only set the rotation with :set(nil, quat(...), nil) for example
---Source : lua/ge/extensions/editor/util/transformUtil.lua:146
---@param pos any
---@param rot any
---@param scl any
function editor_util_transformUtil:set(pos, rot, scl) end

--- toggles between single value and vec3 value for scale.
---Source : lua/ge/extensions/editor/util/transformUtil.lua:116
---@param ods any
function editor_util_transformUtil:setOneDimensionalScale(ods) end

---Source : lua/ge/extensions/editor/util/transformUtil.lua:201
---@param mouseInfo any
function editor_util_transformUtil:shiftUpdate(mouseInfo) end

--- starts the edit mode if not already in it
---Source : lua/ge/extensions/editor/util/transformUtil.lua:131
function editor_util_transformUtil:start() end

--- stops the edit mode if currently in it
---Source : lua/ge/extensions/editor/util/transformUtil.lua:138
function editor_util_transformUtil:stop() end

---Source : lua/ge/extensions/editor/util/transformUtil.lua:254
---@param mouseInfo any
function editor_util_transformUtil:update(mouseInfo) end

--- updates the input fields
---Source : lua/ge/extensions/editor/util/transformUtil.lua:182
function editor_util_transformUtil:updateInputFields() end

--- updates the transform associated with the object
---Source : lua/ge/extensions/editor/util/transformUtil.lua:164
function editor_util_transformUtil:updateTransform() end

--- draws all widgets that are enabled.
---Source : lua/ge/extensions/editor/util/transformUtil.lua:597
function editor_util_transformUtil:widget() end

--- draws all widgets that are enabled.
---Source : lua/ge/extensions/editor/util/transformUtil.lua:635
function editor_util_transformUtil:widgetCondensed() end

