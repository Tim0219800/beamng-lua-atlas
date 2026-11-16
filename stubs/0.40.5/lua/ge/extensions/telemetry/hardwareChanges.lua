---@meta
-- tim19Atlas stub generated from lua/ge/extensions/telemetry/hardwareChanges.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Hardware telemetry utility module (loaded by require): compares two controller snapshots to produce connection/disconnection events, and says which display transitions (window/fullscreen) are tracked. Relies on telemetry/hardwareInput.
--- Access: extension `telemetry_hardwareChanges`: `extensions.load("telemetry_hardwareChanges")`, then the global `telemetry_hardwareChanges`
---@class telemetry_hardwareChanges
telemetry_hardwareChanges = {}

--- Compares two snapshots and returns the list of events {...device fields, connected = true|false}. Connections come first, sorted by name, then disconnections. If the same name changes vidpid or productName, it produces a connection (new device) and a disconnection (old one).
---Source: lua/ge/extensions/telemetry/hardwareChanges.lua:46
---@param previous table<string, table> Previous snapshot.
---@param current table<string, table> Current snapshot.
---@return table[]  Change events.
function telemetry_hardwareChanges.connectionChanges(previous, current) end

--- Builds a snapshot keyed by device name, limited to the gamepad, joystick, wheel and xinput types (keyboard, mouse, openxr, vinput ignored). Each entry contains device, deviceType, productName, vidpid and forceFeedback; for a wheel, the official English name is looked up via hardwareInput.officialEnglishName.
---Source: lua/ge/extensions/telemetry/hardwareChanges.lua:15
---@param controllerInfo table[]|nil List of controllers (name, type, productName, vidpid, ffbAxes...).
---@return table<string, table>  Snapshot per device name.
function telemetry_hardwareChanges.controllerSnapshot(controllerInfo) end

--- True only for the direct transitions 'Window' to 'Fullscreen' and 'Fullscreen' to 'Window'.
---Source: lua/ge/extensions/telemetry/hardwareChanges.lua:69
---@param from string Old display mode.
---@param to string New display mode.
---@return boolean  true if the transition is tracked.
function telemetry_hardwareChanges.isTrackedDisplayTransition(from, to) end

