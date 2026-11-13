---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/ribbonInput.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_toolUtilities_ribbonInput` : `extensions.load("editor_toolUtilities_ribbonInput")`, puis la globale `editor_toolUtilities_ribbonInput`
---@class editor_toolUtilities_ribbonInput
editor_toolUtilities_ribbonInput = {}

--- Handles the user input events for ribbon splines.
---  [ribbons - The array of ribbons to edit.]
---  [out - A table with the following common fields (will be updated as the user interacts with the ribbons):]
---  [ribbonIdx - The index of the ribbon to edit.]
---  [nodeIdx - The index of the node to edit.]
---  [isGizmoActive - Whether the gizmo is active.]
---  [useGizmo - Whether the gizmo is useable or not.]
---  [isRigidTranslation - Whether the translation is rigid (all nodes move by the same amount on drag), or free (each node moves independently).]
---  [masterDepth - The depth to use for new pairs of nodes.]
---  [updateRibbonDataFn - A callback function to update the ribbon data after a change has been made.]
---  [deepCopyFn - A callback function to deep copy ALL the ribbon data (full state of collection of ribbons).]
---  [undoFn - A callback function to undo ALL the ribbon data (full state of collection of ribbons).]
---  [redoFn - A callback function to redo ALL the ribbon data (full state of collection of ribbons).]
---  [Returns - The best found segment for the cursor segment search, on the selected ribbon.]
---Source : lua/ge/extensions/editor/toolUtilities/ribbonInput.lua:281
---@param ribbons any
---@param out any
---@param useGizmo any
---@param isRigidTranslation any
---@param masterDepth any
---@param updateRibbonDataFn any
---@param deepCopyFn any
---@param undoFn any
---@param redoFn any
function editor_toolUtilities_ribbonInput.handlePrismEvents(ribbons, out, useGizmo, isRigidTranslation, masterDepth, updateRibbonDataFn, deepCopyFn, undoFn, redoFn) end

--- Handles the user input events for ribbon splines.
---  [ribbons - The array of ribbons to edit.]
---  [out - A table with the following common fields (will be updated as the user interacts with the ribbons):]
---  [ribbonIdx - The index of the ribbon to edit.]
---  [nodeIdx - The index of the node to edit.]
---  [isGizmoActive - Whether the gizmo is active.]
---  [useGizmo - Whether the gizmo is useable or not.]
---  [isRigidTranslation - Whether the translation is rigid (all nodes move by the same amount on drag), or free (each node moves independently).]
---  [masterDepth - The depth to use for new pairs of nodes.]
---  [updateRibbonDataFn - A callback function to update the ribbon data after a change has been made.]
---  [deepCopyFn - A callback function to deep copy ALL the ribbon data (full state of collection of ribbons).]
---  [undoFn - A callback function to undo ALL the ribbon data (full state of collection of ribbons).]
---  [redoFn - A callback function to redo ALL the ribbon data (full state of collection of ribbons).]
---  [Returns - The best found segment for the cursor segment search, on the selected ribbon.]
---Source : lua/ge/extensions/editor/toolUtilities/ribbonInput.lua:281
---@param ribbons any
---@param out any
---@param useGizmo any
---@param isRigidTranslation any
---@param masterDepth any
---@param updateRibbonDataFn any
---@param deepCopyFn any
---@param undoFn any
---@param redoFn any
function editor_toolUtilities_ribbonInput.handleRibbonEvents(ribbons, out, useGizmo, isRigidTranslation, masterDepth, updateRibbonDataFn, deepCopyFn, undoFn, redoFn) end

