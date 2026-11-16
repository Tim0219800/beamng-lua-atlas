---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/pause/providers/nearbyActivities.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Pause menu provider for the "nearby activities" section. It reads the big map points of interest (freeroam_vueBigMap.getPoiData) and the level's raw POIs (gameplay_rawPois), computes the distance to the player (camera position, marker radius inferred), then keeps up to 6 items: 2 closest, 2 of medium distance and the rest at random, sorted by distance. Each item carries two buttons: view on the map and set a route.
--- Access: extension `ui_pause_providers_nearbyActivities`: `extensions.load("ui_pause_providers_nearbyActivities")`, then the global `ui_pause_providers_nearbyActivities`
---@class ui_pause_providers_nearbyActivities
ui_pause_providers_nearbyActivities = {}

--- Executes the button (view/route) identified by buttonId. Returns false if buttonId is nil.
---Source: lua/ge/extensions/ui/pause/providers/nearbyActivities.lua:88
---@param buttonId any buttonId present in items[].actions.view / .route.
---@param payload any Data passed to the button's callback.
---@return any  Button result (true/false).
function ui_pause_providers_nearbyActivities.executeNearbyActivityAction(buttonId, payload) end

--- Builds the section data: {mode, sections = {{id = "nearbyActivities", title, items}}}. Each item contains id, title, icon, description (translated POI type), actionLabel, poiType, distanceM (m, rounded) and actions {view, route}.
---Source: lua/ge/extensions/ui/pause/providers/nearbyActivities.lua:250
---@param context table|nil Fields read: mode (default "freeroam") and isBigMapAllowed.
---@return table  Section data for the pause UI.
function ui_pause_providers_nearbyActivities.getData(context) end

