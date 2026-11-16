---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/vehicle/inplaceEdit.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- GE extension `core_vehicle_inplaceEdit`: rudimentary "in-game" parts editor ("ingame vehicle editor"): hides the CEF interface, displays as debug text (debugDrawer:drawTextAdvanced) the slot/part tree of player 0's vehicle and allows keyboard navigation (up/down/left/right), choosing a part for a slot and respawning the vehicle with the new config. Opened by core_vehicle_manager.toggleModifyKey. It is a development tool, not a gameplay API.
--- Access: extension `core_vehicle_inplaceEdit`: `extensions.load("core_vehicle_inplaceEdit")`, then the global `core_vehicle_inplaceEdit`
---@class core_vehicle_inplaceEdit
core_vehicle_inplaceEdit = {}

--- Input hook: receives the editor's navigation keys ('up', 'down', 'left', 'right', 'select', 'back') and moves the selection, descends/ascends in the parts or applies the choice of a part for a slot (vehicle respawn with the modified config).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/vehicle/inplaceEdit.lua:361
---@param type string action name
---@param value number 1 = press; other values are ignored
function core_vehicle_inplaceEdit.onInput(type, value) end

--- Per-frame hook: loads the vehicle data if needed, animates activation and, if the editor is active, draws the info and the slot/part list on screen.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/vehicle/inplaceEdit.lua:210
---@param dtReal number real time (s)
---@param dtSim number simulation time (s)
---@param dtRaw number raw time (s)
function core_vehicle_inplaceEdit.onUpdate(dtReal, dtSim, dtRaw) end

--- Enables or disables the editor (changes mode: hides/shows the CEF interface).
---Source: lua/ge/extensions/core/vehicle/inplaceEdit.lua:345
---@param val boolean true to show
function core_vehicle_inplaceEdit.setShowWindow(val) end

--- Toggles the editor state and switches the edit mode (toggleEditMode) of player 0's vehicle.
---Source: lua/ge/extensions/core/vehicle/inplaceEdit.lua:350
function core_vehicle_inplaceEdit.toggleShowWindow() end

