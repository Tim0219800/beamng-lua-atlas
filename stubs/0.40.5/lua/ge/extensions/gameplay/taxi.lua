---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/taxi.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Taxi system in freeroam and career: the player on foot can hail a traffic taxi (or call one from the quick menu), get in, choose a destination on the big map, then the taxi AI drives them along a route (speed up/slow down, skip the trip, stop, change destination, idle camera). In career, a ride is billed (base fare + per km + night surcharge). The extension registers a "taxi" special vehicle provider with gameplay_traffic (1 guaranteed, 1 reserved), manages the taxis' visual states (roof lights, indicators, floating labels) and blocks driving controls during the ride. Disabled during a mission, in multiplayer or in the freeroam tutorial.
--- Access: extension `gameplay_taxi`: `extensions.load("gameplay_taxi")`, then the global `gameplay_taxi`
---@class gameplay_taxi
---@field dependencies string[] Extensions loaded beforehand: gameplay_util_vehicleSighting.
gameplay_taxi = {}

--- Calls a taxi to the road closest to the player. Tries the available active taxis first (from nearest to farthest) then a reserve. Displays a message and emits the hook onTaxiCalled with 'tooFarFromRoad', 'dispatched' or 'noTaxiAvailable'.
---Source: lua/ge/extensions/gameplay/taxi.lua:1160
function gameplay_taxi.callForTaxi() end

--- Cancels the called taxis (not the hailed ones) and displays a message; no effect if no taxi was called.
---Source: lua/ge/extensions/gameplay/taxi.lua:1092
function gameplay_taxi.cancelTaxiCall() end

--- Confirms the chosen destination (choosingDestination phase with a destination set) and starts the ride.
---Source: lua/ge/extensions/gameplay/taxi.lua:1765
function gameplay_taxi.confirmTaxiDestination() end

--- Returns the current state of a taxi.
---Source: lua/ge/extensions/gameplay/taxi.lua:498
---@param vehId integer Vehicle identifier.
---@return string  State key ('available' by default).
function gameplay_taxi.getTaxiState(vehId) end

--- Data for the taxi UI: phase, ability to speed up/slow down/skip/stop/change destination, hurry up level, remaining and total distance, etc.
---Source: lua/ge/extensions/gameplay/taxi.lua:356
---@return table  Table for the UI (playerCurrentPhase, canHurryUp, canSlowDown, canSkip, canStop, distanceLeft, totalDistance...).
function gameplay_taxi.getTaxiViewData() end

--- Indicates whether a ride is in progress (driving or arriving phases).
---Source: lua/ge/extensions/gameplay/taxi.lua:1869
---@return boolean  true if on a ride.
function gameplay_taxi.isTaxiRideActive() end

--- Indicates whether the taxi UI view is active.
---Source: lua/ge/extensions/gameplay/taxi.lua:1870
---@return boolean  true if active.
function gameplay_taxi.isTaxiViewActive() end

--- Hook called when the AI has finished its route: switches to the arriving phase if it is the ride's taxi.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/taxi.lua:1698
---@param vehId integer AI vehicle.
function gameplay_taxi.onAiRouteDone(vehId) end

--- Hook: re-evaluates the system activation (disabled during a mission).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/taxi.lua:841
function gameplay_taxi.onAnyMissionChanged() end

--- Hook (Change destination button): returns to destination choice and reopens the big map.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/taxi.lua:1588
function gameplay_taxi.onChangeDestinationCalled() end

--- Hook: same handling as onTrafficStopped.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/taxi.lua:866
function gameplay_taxi.onClientEndMission() end

--- Hook: if the map is closed without a choice, resumes the route, the drop-off wait or re-displays the taxi view.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/taxi.lua:1771
function gameplay_taxi.onDeactivateBigMapCallback() end

--- Hook: removes the floating labels engine.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/taxi.lua:2048
function gameplay_taxi.onExtensionUnloaded() end

--- Interaction action hook: during a ride, stops the taxi; otherwise, hails a nearby available taxi.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/taxi.lua:1705
function gameplay_taxi.onGameplayInteract() end

--- Hook: goes up one AI urgency level.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/taxi.lua:1624
function gameplay_taxi.onHurryUpCalled() end

--- Hook: adds the Call / Cancel taxi entries to the quick menu (and a Taxi category in career).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/taxi.lua:1824
function gameplay_taxi.onRegisterQuickAccessMenus() end

--- Big map hook: stores the chosen destination and sends the UI TaxiDestinationPreviewed with the route length.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/taxi.lua:1752
---@param pos vec3|nil Chosen position, nil to clear.
function gameplay_taxi.onSetBigmapNavFocus(pos) end

--- Hook (Skip button): fade to black, teleports the taxi to skipPosition, restarts the route and accelerates physics for 1 s; only once per ride.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/taxi.lua:1627
function gameplay_taxi.onSkipCalled() end

--- Hook: goes down one AI urgency level.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/taxi.lua:1625
function gameplay_taxi.onSlowDownCalled() end

--- Hook (Stop button): if slow, switches to arrival; otherwise, makes the taxi pull over while driving.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/taxi.lua:1677
function gameplay_taxi.onStopTaxiCalled() end

--- UI router hook: adds data.taxi = getTaxiViewData().
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/taxi.lua:1799
---@param context any Router context.
---@param toRoute string Destination route.
---@param fromRoute string Origin route.
---@param data table View data table (modified).
function gameplay_taxi.onTaxiViewEnter(context, toRoute, fromRoute, data) end

--- Hook emitted by gameplay_traffic when preparing traffic: registers the 'taxi' provider (priority 5, 1 guaranteed, 1 reserved) if the system is enabled.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/taxi.lua:250
function gameplay_taxi.onTrafficSpecialVehiclesProviders() end

--- Hook: re-evaluates the system activation.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/taxi.lua:837
function gameplay_taxi.onTrafficStarted() end

--- Hook: ends the ride (onTaxiRideEnded reason 'trafficStopped'), clears the states and removes the labels.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/taxi.lua:866
function gameplay_taxi.onTrafficStopped() end

--- Hook: if the vehicle is a non-reserved AI taxi, assigns it an availability state.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/taxi.lua:845
---@param id integer Vehicle identifier.
function gameplay_taxi.onTrafficVehicleAdded(id) end

--- Hook: a crashed taxi is set aside (pickup canceled or marked unavailable) and its light switches to "driverDistress".
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/taxi.lua:1804
---@param vehId integer Vehicle identifier.
function gameplay_taxi.onTrafficVehicleCrashed(vehId) end

--- Hook: forgets the taxi removed from traffic.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/taxi.lua:854
---@param id integer Vehicle identifier.
function gameplay_taxi.onTrafficVehicleRemoved(id) end

--- Hook called every frame: detects the nearest taxi, updates pull over, arrivals, waiting and blocking of pickups, labels, idle camera, arrival approach, fare, ejection and interface.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/taxi.lua:1470
---@param dtReal number Real time (s).
---@param dtSim number Simulated time (s).
---@param dtRaw number Raw time (s).
function gameplay_taxi.onUpdate(dtReal, dtSim, dtRaw) end

--- Hook: randomly removes the state of a reset taxi (except the ride's or pickup's taxi).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/taxi.lua:1791
---@param id integer Vehicle identifier.
function gameplay_taxi.onVehicleResetted(id) end

--- Hook: when the player gets into a pickup taxi, starts the ride (hook onTaxiRideStarted), chooses the fare calculator, blocks driving actions, switches to the orbit camera and opens the destination map; when exiting the taxi, ends the ride.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/taxi.lua:1519
---@param oldId integer Old vehicle.
---@param newId integer New vehicle.
function gameplay_taxi.onVehicleSwitched(oldId, newId) end

--- Hook: the player triggered a taxi trigger during the ride; three warnings lead to stopping and ejection.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/taxi.lua:1713
---@param lnk any Trigger link.
---@param actionValue number 1 on press.
---@param vehicleId integer Vehicle concerned.
function gameplay_taxi.onVehicleTriggersExecuteLink(lnk, actionValue, vehicleId) end

--- Enables or disables (user preference) the idle camera (starts after 15 s without action during the ride).
---Source: lua/ge/extensions/gameplay/taxi.lua:1665
---@param enabled boolean true to allow.
function gameplay_taxi.setIdleCameraEnabled(enabled) end

--- Enables or disables the floating state labels ("TAXI" + state) above the taxis when the player is on foot; visible up to about 45 m.
---Source: lua/ge/extensions/gameplay/taxi.lua:1907
---@param enabled boolean true to show.
function gameplay_taxi.setUseBillboards(enabled) end

--- Closes the big map, computes the route to player.destinationPos then starts the taxi AI (ai.driveUsingPath, 1 lap, avoidance enabled) and switches to the driving phase. Runs in a job. Does nothing without a destination or without a route.
---Source: lua/ge/extensions/gameplay/taxi.lua:764
---@param skipWait boolean|nil true to not wait 2 s before departure (default false).
function gameplay_taxi.startTaxiWithCurrentRoute(skipWait) end

--- To call when the enableTaxiInFreeroam setting changes: re-evaluates whether the system should be active.
---Source: lua/ge/extensions/gameplay/taxi.lua:833
function gameplay_taxi.taxiSettingChanged() end

