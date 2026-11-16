# `utils_dateUtils`

*File: `lua/common/utils/dateUtils.lua` · VM: Common (GE + vehicle) · 49 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("utils/dateUtils")`

Small date utilities: conversion of an ISO 8601 string to a Unix timestamp and computation of the time elapsed since a date. Loaded with require('utils/dateUtils'). Useful to compare dates received from an API or a file.

## Example

```lua
local du = require('utils/dateUtils')
local seconds = du.timeSince('2025-01-31T12:00:00Z')
```

## Notes

- The expected pattern is YYYY-MM-DDTHH:MM:SSZ. A second fallback pattern accepts 'HH:MM:SS AMZ'/'PMZ'.
- If the string is unreadable, an error is logged and the current time is used (the result is then 'now').
- os.time interprets the table as LOCAL time, whereas timeSince compares against os.date('!*t') (UTC) converted back by os.time: the time zone offset can skew the difference (inferred from code).
- Probable bug in the AM/PM fallback branch: hour is 0 (number) or a string depending on the case, then tonumber is applied; '12 PM' stays '12'.

## Functions

| Function | Description | Line |
|---|---|---|
| `utils_dateUtils.parseIso8601(datetime)` | Converts an ISO 8601 date-time (ending with Z) to a Unix timestamp via os.time. Returns the current time if parsing fails. | 8 |
| `utils_dateUtils.timeSince(datetime)` | Computes the number of seconds elapsed between the given date and now (UTC). | 38 |

### Parameter details

#### `utils_dateUtils.parseIso8601(datetime)`

Converts an ISO 8601 date-time (ending with Z) to a Unix timestamp via os.time. Returns the current time if parsing fails.

- `datetime` (*string*) : E.g. '2025-01-31T12:00:00Z'
- **returns**: integer Unix timestamp in seconds

#### `utils_dateUtils.timeSince(datetime)`

Computes the number of seconds elapsed between the given date and now (UTC).

- `datetime` (*string*) : ISO 8601 date
- **returns**: number Difference in seconds (os.difftime)

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/utils/dateUtils.lua`.*
