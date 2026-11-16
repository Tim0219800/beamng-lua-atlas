# `bananabench_xml`

*File: `lua/console/bananabench-xml.lua` · VM: Console · 197 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("bananabench-xml")`

Console VM script: runs bananabench on a fixed list of 9 vehicles (barstow, burnside, etki, fullsize, moonhawk, pessima, pickup, pigeon, pressure_ball) and writes an XML "performance" report (report > test > result with success, performance, executiontime, compiletime and realtime/maxmbeams metrics) to bananabench.xml. It also defines a small global `XML` class (create, addChild, encode, toString) to generate XML.

## Notes

- Probably broken with the current version of bananabench: `writeXML` reads `v.tests[1].res[dynamicCol]` and the `beamspersec` fields, whereas bananabench.lua returns flat `res` {Mbeamspersec, percentRealtime, time, spawntime} (without index 1/2 or a beamspersec field); accessing res[dynamicCol] gives nil and causes an error.
- The script runs on load; the `XML` class is a global. The `str` variables of XML:encode and XML:toString are also global (no `local`).
- The report's `measure` and `unit` attributes follow the format of an external performance reporting tool; the executed field is always 'yes' and passed 'yes' (log analysis is commented out).

## Class `XML`

Small XML document builder (global class).

| Method | Description | Line |
|---|---|---|
| `XML:addChild(xml)` | Adds a child node. | dyn |
| `XML:create()` | Creates an empty XML node (name, attribs, children). | dyn |
| `XML:encode()` | Returns the complete document with the header `<?xml version="1.0" encoding="UTF-8"?>`. | dyn |
| `XML:toString(indent)` | Serializes the node and its children with 2-space indentation. | dyn |

**Globals assigned:** `XML`

## Calls into the engine (C++)

- `obj:` `encode`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/console/bananabench-xml.lua`.*
