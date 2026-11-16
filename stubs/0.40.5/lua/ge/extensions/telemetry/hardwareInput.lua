---@meta
-- tim19Atlas stub generated from lua/ge/extensions/telemetry/hardwareInput.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Hardware telemetry utility module (loaded by require): turns the game controllers' information into telemetry data. For all devices: type, productName, vidpid, forceFeedback. For wheels (type 'wheel') it adds the official English name, GUID, force feedback axes, FFB sampling periods, hardware/firmware revisions, controls and their count by type.
--- Access: extension `telemetry_hardwareInput`: `extensions.load("telemetry_hardwareInput")`, then the global `telemetry_hardwareInput`
---@class telemetry_hardwareInput
telemetry_hardwareInput = {}

--- Applies fromControllerInfo to each controller (looking up the official English name of wheels).
---Source: lua/ge/extensions/telemetry/hardwareInput.lua:77
---@param controllerInfo table[]|nil List of controllers.
---@return table[]  List of telemetry tables.
function telemetry_hardwareInput.collect(controllerInfo) end

--- Converts a controller's info into a telemetry table. Non-wheels only keep type, productName, vidpid and forceFeedback; wheels additionally receive reportedName, deviceName, guid, hidSupported, ffbAxes, FFB periods, revisions, controls, controlCounts, productId, vendorId and maxRawFfbUpdateRateHz.
---Source: lua/ge/extensions/telemetry/hardwareInput.lua:38
---@param info table Controller info (type, name, productName, vidpid, guid, ffbAxes, ff_sample_period, controls...).
---@param englishName string|nil Official English name of the wheel, if known.
---@return table  Controller telemetry data.
function telemetry_hardwareInput.fromControllerInfo(info, englishName) end

--- Reads /settings/inputmaps/<pidVid>.json and returns displayName or name, only if this file belongs to the game's official content.
---Source: lua/ge/extensions/telemetry/hardwareInput.lua:12
---@param pidVid string|nil Identifier of 8 hexadecimal digits.
---@return string|nil  Official English name, or nil.
function telemetry_hardwareInput.officialEnglishName(pidVid) end

