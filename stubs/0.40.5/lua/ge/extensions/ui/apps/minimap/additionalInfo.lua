---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/apps/minimap/additionalInfo.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Computes the extra information shown by the minimap: remaining distance to the destination (routePlanner of core_groundMarkers), place name (highest-priority gameplay_city zone under the camera, otherwise the level title) and police pursuit state (disabled, visibleToPolice, hiddenFromPolice). Changes are sent to the 'minimap' stream via guihooks.queueStream.
--- Access: extension `ui_apps_minimap_additionalInfo`: `extensions.load("ui_apps_minimap_additionalInfo")`, then the global `ui_apps_minimap_additionalInfo`
---@class ui_apps_minimap_additionalInfo
ui_apps_minimap_additionalInfo = {}

--- End-of-level hook: empties the info (visible reset to true) and forces a resend.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/apps/minimap/additionalInfo.lua:100
function ui_apps_minimap_additionalInfo.onClientEndMission() end

--- Hook called when the destination is reached: clears the distance to the target.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/apps/minimap/additionalInfo.lua:42
function ui_apps_minimap_additionalInfo.onReachedTargetPos() end

--- Hook called when the big map's navigation focus changes; if pos is nil, clears the distance to the target.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/apps/minimap/additionalInfo.lua:106
---@param pos vec3|nil Target position, or nil if the navigation is removed.
function ui_apps_minimap_additionalInfo.onSetBigmapNavFocus(pos) end

--- Frame hook: checks the route, the place name and the police, then sends the info if one has changed.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/apps/minimap/additionalInfo.lua:89
function ui_apps_minimap_additionalInfo.onUpdate() end

--- Forces the information to be resent to the 'minimap' stream at the next update (called when the interface mounts).
---Source: lua/ge/extensions/ui/apps/minimap/additionalInfo.lua:7
function ui_apps_minimap_additionalInfo.requestAdditionalInfo() end

--- Shows or hides the information block in the interface; returns nothing if the value does not change. Anything that is not false is treated as true.
---Source: lua/ge/extensions/ui/apps/minimap/additionalInfo.lua:11
---@param visible boolean|nil false to hide.
function ui_apps_minimap_additionalInfo.setVisible(visible) end

