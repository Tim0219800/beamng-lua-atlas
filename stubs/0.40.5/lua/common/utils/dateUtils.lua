---@meta
-- tim19Atlas stub generated from lua/common/utils/dateUtils.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Small date utilities: conversion of an ISO 8601 string to a Unix timestamp and computation of the time elapsed since a date. Loaded with require('utils/dateUtils'). Useful to compare dates received from an API or a file.
--- Access: `require("utils/dateUtils")`
---@class utils_dateUtils
local utils_dateUtils = {}

--- Converts an ISO 8601 date-time (ending with Z) to a Unix timestamp via os.time. Returns the current time if parsing fails.
---Source: lua/common/utils/dateUtils.lua:8
---@param datetime string E.g. '2025-01-31T12:00:00Z'
---@return integer  Unix timestamp in seconds
function utils_dateUtils.parseIso8601(datetime) end

--- Computes the number of seconds elapsed between the given date and now (UTC).
---Source: lua/common/utils/dateUtils.lua:38
---@param datetime string ISO 8601 date
---@return number  Difference in seconds (os.difftime)
function utils_dateUtils.timeSince(datetime) end

return utils_dateUtils
