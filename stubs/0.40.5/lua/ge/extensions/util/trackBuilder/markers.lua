---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/trackBuilder/markers.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `util_trackBuilder_markers` : `extensions.load("util_trackBuilder_markers")`, puis la globale `util_trackBuilder_markers`
---@class util_trackBuilder_markers
---@field names table
util_trackBuilder_markers = {}

---Source : lua/ge/extensions/util/trackBuilder/markers.lua:999
---@param name any
---@param index any
function util_trackBuilder_markers.addMarkerChange(name, index) end

---Source : lua/ge/extensions/util/trackBuilder/markers.lua:921
---@param segments any
---@param closed any
function util_trackBuilder_markers.caps(segments, closed) end

---Source : lua/ge/extensions/util/trackBuilder/markers.lua:990
---@param name any
function util_trackBuilder_markers.clearMarkers(name) end

---Source : lua/ge/extensions/util/trackBuilder/markers.lua:982
---@param name any
function util_trackBuilder_markers.hideMarkers(name) end

--- interpolates the segments with given name of field to interpolate and an interpolation function.
---Source : lua/ge/extensions/util/trackBuilder/markers.lua:820
---@param nameOfField any
---@param track any
function util_trackBuilder_markers.interpolate(nameOfField, track) end

---Source : lua/ge/extensions/util/trackBuilder/markers.lua:972
---@param name any
---@param t any
---@param a any
---@param b any
---@param point any
---@param length any
function util_trackBuilder_markers.interpolateField(name, t, a, b, point, length) end

---Source : lua/ge/extensions/util/trackBuilder/markers.lua:721
---@param nameOfField any
---@param track any
function util_trackBuilder_markers.interpolateOverPoints(nameOfField, track) end

---Source : lua/ge/extensions/util/trackBuilder/markers.lua:781
---@param nameOfField any
---@param track any
function util_trackBuilder_markers.interpolateOverSegments(nameOfField, track) end

--- interpolation function for one segment
---Source : lua/ge/extensions/util/trackBuilder/markers.lua:931
---@param segment any
---@param startValue any
---@param endValue any
---@param startLength any
---@param endLength any
---@param nameOfField any
function util_trackBuilder_markers.interpolatePointsOfSegment(segment, startValue, endValue, startLength, endLength, nameOfField) end

---Source : lua/ge/extensions/util/trackBuilder/markers.lua:808
---@param nameOfField any
---@param track any
function util_trackBuilder_markers.interpolateSingle(nameOfField, track) end

---Source : lua/ge/extensions/util/trackBuilder/markers.lua:439
---@param t any
function util_trackBuilder_markers.linear(t) end

---Source : lua/ge/extensions/util/trackBuilder/markers.lua:449
---@param t any
function util_trackBuilder_markers.pow2(t) end

---Source : lua/ge/extensions/util/trackBuilder/markers.lua:459
---@param t any
function util_trackBuilder_markers.pow3(t) end

---Source : lua/ge/extensions/util/trackBuilder/markers.lua:469
---@param t any
function util_trackBuilder_markers.pow4(t) end

--- smooth slope interpolation, goes from 0/0 to 1/delta, having horizontal slope at 0 and 1
---Source : lua/ge/extensions/util/trackBuilder/markers.lua:480
---@param t any
function util_trackBuilder_markers.smoothSlope(t) end

--- smoother slope interpolation, goes from 0/0 to 1/delta, having horizontal slope at 0 and 1
---Source : lua/ge/extensions/util/trackBuilder/markers.lua:491
---@param t any
function util_trackBuilder_markers.smootherSlope(t) end

---Source : lua/ge/extensions/util/trackBuilder/markers.lua:435
---@param t any
function util_trackBuilder_markers.step(t) end

---Source : lua/ge/extensions/util/trackBuilder/markers.lua:976
---@param name any
---@param allNodes any
function util_trackBuilder_markers.transformMarkers(name, allNodes) end

---Source : lua/ge/extensions/util/trackBuilder/markers.lua:1007
function util_trackBuilder_markers.unloadAll() end

