---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/vehiclePaint.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Small "Metallic paint" imgui debug window to adjust the metallic paint parameters of the player's vehicle live (3 paints: metallic, roughness, clearcoat, clearcoat roughness). It reads and writes the object field `metallicPaintData` of the vehicle as a string of 4 numbers.
--- Access: extension `ui_vehiclePaint`: `extensions.load("ui_vehiclePaint")`, then the global `ui_vehiclePaint`
---@class ui_vehiclePaint
---@field dependencies string[] ui_imgui.
ui_vehiclePaint = {}

--- Modifies one component of metallicPaintData of player 0's vehicle paint 0 and rewrites the field.
---Source: lua/ge/extensions/ui/vehiclePaint.lua:91
---@param change number New value.
---@param index integer Index (1 to 4) in the array of 4 values.
function ui_vehiclePaint.changeData(change, index) end

--- Hook called on load: creates the visibility boolean pointer (false) and the float pointer of the sliders.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/vehiclePaint.lua:82
function ui_vehiclePaint.onExtensionLoaded() end

--- Hook called every frame: if the window is open and a player vehicle exists, draws the sliders of paints 0, 1 and 2 and applies the changes via setField.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/vehiclePaint.lua:41
function ui_vehiclePaint.onUpdate() end

--- Opens the 'Metallic paint' window (the window is drawn in onUpdate).
---Source: lua/ge/extensions/ui/vehiclePaint.lua:78
function ui_vehiclePaint.show() end

