---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/freeformDelivery/markers.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Submodule of the freeform delivery mode (freeformDelivery) that displays the visual markers of target areas: ground decals for parking spots (color depending on parking state), debug spheres/rectangles for locations, zones and spots, and the 3D attention markers of the active route. It is driven by freeformDelivery (setup, update every frame, cleanup).
--- Access: extension `gameplay_freeformDelivery_markers`: `extensions.load("gameplay_freeformDelivery_markers")`, then the global `gameplay_freeformDelivery_markers`
---@class gameplay_freeformDelivery_markers
gameplay_freeformDelivery_markers = {}

--- Clears the markers, decals and caches, forgets the active delivery and destroys the route markers.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/freeformDelivery/markers.lua:435
function gameplay_freeformDelivery_markers.cleanup() end

--- Hides the route markers (main, zone, parking) without destroying them.
---Source: lua/ge/extensions/gameplay/freeformDelivery/markers.lua:230
function gameplay_freeformDelivery_markers.hideRouteMarker() end

--- Creates (replacing the previous ones) the route attention marker at the given position, plus optionally a zone marker and a parking spot marker, then displays them.
---Source: lua/ge/extensions/gameplay/freeformDelivery/markers.lua:176
---@param pos vec3 Position of the main marker (raised by 2 m).
---@param zone table|nil Zone checkpoint data passed to the zone marker's setToCheckpoint.
---@param parkingSpot table|nil Parking spot data passed to the parking marker.
---@return boolean  false if pos is nil or if the marker could not be created, otherwise true.
function gameplay_freeformDelivery_markers.setRouteMarker(pos, zone, parkingSpot) end

--- Stores the active delivery, creates one marker per target area (targetAreas) found in delivery.sites, prepares the parking spot decal data and precomputes which vehicles are associated with which spot via the placement-type goals.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/freeformDelivery/markers.lua:242
---@param delivery table Delivery data (goals, targetAreas, sites, vehicles).
function gameplay_freeformDelivery_markers.setup(delivery) end

--- Called every frame: updates the parking state of the spots, draws the debug markers, adds the ground decals via Engine.Render.DynamicDecalMgr.addDecals and updates the route markers.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/freeformDelivery/markers.lua:292
---@param dtReal number Real-time delta in seconds.
---@param dtSim number Simulation time delta in seconds.
---@param dtRaw number Raw delta time (not used directly).
---@param profiler table|nil Optional profiler (add method) to measure sections.
function gameplay_freeformDelivery_markers.update(dtReal, dtSim, dtRaw, profiler) end

