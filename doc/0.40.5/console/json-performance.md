# `json_performance`

*File: `lua/console/json-performance.lua` · VM: Console · 162 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("json-performance")`

Console benchmark script (outside the game): it compares the speed of JSON decoding, lpack encoding/decoding (text and binary) and string.buffer on all *.jbeam files in the /vehicles folder. It runs as soon as it is loaded, without exporting any function. Only useful to measure performance, not for a mod.

## Notes

- The script runs entirely on load (require) and prints the times and throughputs in MB/s with print.
- It reads the files with FS:findFiles('/vehicles', '*.jbeam', -1, false, false) then readFile; each test is repeated 6 times (local variable reruns).
- The throughput displayed for lpack decoding is computed on the packed size (totalPackSize), not on the original JSON size.

## Calls into the engine (C++)

- `FS:` `findFiles`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/console/json-performance.lua`.*
