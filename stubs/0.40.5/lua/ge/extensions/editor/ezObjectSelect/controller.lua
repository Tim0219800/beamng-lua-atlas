---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/ezObjectSelect/controller.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_ezObjectSelect_controller` : `extensions.load("editor_ezObjectSelect_controller")`, puis la globale `editor_ezObjectSelect_controller`
---@class editor_ezObjectSelect_controller
editor_ezObjectSelect_controller = {}

---Source : lua/ge/extensions/editor/ezObjectSelect/controller.lua:1005
function editor_ezObjectSelect_controller.activate() end

---Source : lua/ge/extensions/editor/ezObjectSelect/controller.lua:1033
function editor_ezObjectSelect_controller.deactivate() end

---Source : lua/ge/extensions/editor/ezObjectSelect/controller.lua:508
function editor_ezObjectSelect_controller.drawScreenDebug() end

---Source : lua/ge/extensions/editor/ezObjectSelect/controller.lua:1808
function editor_ezObjectSelect_controller.drawWorkspace() end

---Source : lua/ge/extensions/editor/ezObjectSelect/controller.lua:1112
---@param reason any
function editor_ezObjectSelect_controller.invalidateSelectionCache(reason) end

---Source : lua/ge/extensions/editor/ezObjectSelect/controller.lua:1063
function editor_ezObjectSelect_controller.isActive() end

---Source : lua/ge/extensions/editor/ezObjectSelect/controller.lua:2194
function editor_ezObjectSelect_controller.loadPreferences() end

---Source : lua/ge/extensions/editor/ezObjectSelect/controller.lua:1098
function editor_ezObjectSelect_controller.onAxisGizmoAlignmentChanged() end

---Source : lua/ge/extensions/editor/ezObjectSelect/controller.lua:1074
---@param mode any
function editor_ezObjectSelect_controller.onAxisGizmoModeChanged(mode) end

---Source : lua/ge/extensions/editor/ezObjectSelect/controller.lua:2263
---@param path any
---@param value any
function editor_ezObjectSelect_controller.onEditorPreferenceValueChanged(path, value) end

---Source : lua/ge/extensions/editor/ezObjectSelect/controller.lua:2330
---@param prefsRegistry any
function editor_ezObjectSelect_controller.onEditorRegisterPreferences(prefsRegistry) end

---Source : lua/ge/extensions/editor/ezObjectSelect/controller.lua:1067
function editor_ezObjectSelect_controller.refreshSelectedTint() end

---Source : lua/ge/extensions/editor/ezObjectSelect/controller.lua:1207
function editor_ezObjectSelect_controller.requestFocusShortcut() end

---Source : lua/ge/extensions/editor/ezObjectSelect/controller.lua:1272
---@param preset any
function editor_ezObjectSelect_controller.requestNumpadPreset(preset) end

---Source : lua/ge/extensions/editor/ezObjectSelect/controller.lua:1154
function editor_ezObjectSelect_controller.requestRotateShortcut() end

---Source : lua/ge/extensions/editor/ezObjectSelect/controller.lua:1163
function editor_ezObjectSelect_controller.requestScaleShortcut() end

---Source : lua/ge/extensions/editor/ezObjectSelect/controller.lua:1145
function editor_ezObjectSelect_controller.requestTransformShortcut() end

---Source : lua/ge/extensions/editor/ezObjectSelect/controller.lua:410
function editor_ezObjectSelect_controller.resetInputFilters() end

---Source : lua/ge/extensions/editor/ezObjectSelect/controller.lua:1594
function editor_ezObjectSelect_controller.update() end

--- Classe locale `prefUi` de lua/ge/extensions/editor/ezObjectSelect/controller.lua
---@class editor_ezObjectSelect_controller_prefUi
local editor_ezObjectSelect_controller_prefUi = {}

---Source : lua/ge/extensions/editor/ezObjectSelect/controller.lua:2057
---@param _ any
---@param _ any
---@param item any
function editor_ezObjectSelect_controller_prefUi.boundsDepthTest(_, _, item) end

---Source : lua/ge/extensions/editor/ezObjectSelect/controller.lua:2109
---@param _ any
---@param _ any
---@param item any
function editor_ezObjectSelect_controller_prefUi.clipMoveConstraintPlane(_, _, item) end

---Source : lua/ge/extensions/editor/ezObjectSelect/controller.lua:1953
---@param _ any
---@param _ any
---@param item any
function editor_ezObjectSelect_controller_prefUi.debug(_, _, item) end

---Source : lua/ge/extensions/editor/ezObjectSelect/controller.lua:1967
---@param _ any
---@param _ any
---@param item any
function editor_ezObjectSelect_controller_prefUi.discoveryRadius(_, _, item) end

---Source : lua/ge/extensions/editor/ezObjectSelect/controller.lua:2077
---@param _ any
---@param _ any
---@param item any
function editor_ezObjectSelect_controller_prefUi.dragBoundsDepthTest(_, _, item) end

---Source : lua/ge/extensions/editor/ezObjectSelect/controller.lua:2087
---@param _ any
---@param _ any
---@param item any
function editor_ezObjectSelect_controller_prefUi.labelPlacementMode(_, _, item) end

---Source : lua/ge/extensions/editor/ezObjectSelect/controller.lua:1976
---@param _ any
---@param _ any
---@param item any
function editor_ezObjectSelect_controller_prefUi.maxDiscoveryOutlines(_, _, item) end

---Source : lua/ge/extensions/editor/ezObjectSelect/controller.lua:2001
---@param _ any
---@param _ any
---@param item any
function editor_ezObjectSelect_controller_prefUi.maxPickDistance(_, _, item) end

---Source : lua/ge/extensions/editor/ezObjectSelect/controller.lua:2017
---@param _ any
---@param _ any
---@param item any
function editor_ezObjectSelect_controller_prefUi.maxPickVolume(_, _, item) end

---Source : lua/ge/extensions/editor/ezObjectSelect/controller.lua:2026
---@param _ any
---@param _ any
---@param item any
function editor_ezObjectSelect_controller_prefUi.maxStackDistance(_, _, item) end

---Source : lua/ge/extensions/editor/ezObjectSelect/controller.lua:1985
---@param _ any
---@param _ any
---@param item any
function editor_ezObjectSelect_controller_prefUi.maxStackOutlines(_, _, item) end

---Source : lua/ge/extensions/editor/ezObjectSelect/controller.lua:2180
---@param _ any
---@param _ any
---@param item any
function editor_ezObjectSelect_controller_prefUi.numpadMode(_, _, item) end

---Source : lua/ge/extensions/editor/ezObjectSelect/controller.lua:2156
---@param _ any
---@param _ any
---@param item any
function editor_ezObjectSelect_controller_prefUi.orientationGizmoRightOffset(_, _, item) end

---Source : lua/ge/extensions/editor/ezObjectSelect/controller.lua:2144
---@param _ any
---@param _ any
---@param item any
function editor_ezObjectSelect_controller_prefUi.orientationGizmoTopOffset(_, _, item) end

---Source : lua/ge/extensions/editor/ezObjectSelect/controller.lua:2042
---@param _ any
---@param _ any
---@param item any
function editor_ezObjectSelect_controller_prefUi.outlineMode(_, _, item) end

---Source : lua/ge/extensions/editor/ezObjectSelect/controller.lua:2067
---@param _ any
---@param _ any
---@param item any
function editor_ezObjectSelect_controller_prefUi.selectedBoundsDepthTest(_, _, item) end

---Source : lua/ge/extensions/editor/ezObjectSelect/controller.lua:2035
---@param _ any
---@param _ any
---@param item any
function editor_ezObjectSelect_controller_prefUi.selectedTintEnabled(_, _, item) end

---Source : lua/ge/extensions/editor/ezObjectSelect/controller.lua:2119
---@param _ any
---@param _ any
---@param item any
function editor_ezObjectSelect_controller_prefUi.selectionGizmoLengthScale(_, _, item) end

---Source : lua/ge/extensions/editor/ezObjectSelect/controller.lua:2128
---@param _ any
---@param _ any
---@param item any
function editor_ezObjectSelect_controller_prefUi.selectionGizmoLineWidth(_, _, item) end

---Source : lua/ge/extensions/editor/ezObjectSelect/controller.lua:1994
---@param _ any
---@param _ any
---@param item any
function editor_ezObjectSelect_controller_prefUi.showDistanceRing(_, _, item) end

---Source : lua/ge/extensions/editor/ezObjectSelect/controller.lua:1960
---@param _ any
---@param _ any
---@param item any
function editor_ezObjectSelect_controller_prefUi.showHoverRing(_, _, item) end

---Source : lua/ge/extensions/editor/ezObjectSelect/controller.lua:2102
---@param _ any
---@param _ any
---@param item any
function editor_ezObjectSelect_controller_prefUi.showMoveConstraintPlane(_, _, item) end

---Source : lua/ge/extensions/editor/ezObjectSelect/controller.lua:2137
---@param _ any
---@param _ any
---@param item any
function editor_ezObjectSelect_controller_prefUi.showOrientationGizmo(_, _, item) end

---Source : lua/ge/extensions/editor/ezObjectSelect/controller.lua:2010
---@param _ any
---@param _ any
---@param item any
function editor_ezObjectSelect_controller_prefUi.showVolumeFilteredObjects(_, _, item) end

---Source : lua/ge/extensions/editor/ezObjectSelect/controller.lua:2168
---@param _ any
---@param _ any
---@param item any
function editor_ezObjectSelect_controller_prefUi.suppressCameraForGrs(_, _, item) end

