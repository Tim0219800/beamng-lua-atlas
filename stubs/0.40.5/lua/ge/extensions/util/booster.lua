---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/booster.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Tiny demo extension for a "booster" trigger: trigger(data) prints the received data, then should propel a vehicle upward via core_booster on the vehicle side. In the current state of the code, the propulsion never fires.
--- Access: extension `util_booster`: `extensions.load("util_booster")`, then the global `util_booster`
---@class util_booster
util_booster = {}

--- Prints "Booster triggered" and the contents of data. Intended to react to a trigger event (data.subjectID is the vehicle id), but does nothing else because of the reported bug.
---Source: lua/ge/extensions/util/booster.lua:7
---@param data table Trigger event data (subjectID expected).
function util_booster.trigger(data) end

