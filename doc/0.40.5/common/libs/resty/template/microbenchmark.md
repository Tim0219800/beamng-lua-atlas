# `libs_resty_template_microbenchmark`

*File: `lua/common/libs/resty/template/microbenchmark.lua` · VM: Common (GE + vehicle) · 148 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("libs/resty/template/microbenchmark")`

Third-party library lua-resty-template: engine micro-benchmark (parse, compile and execution time of a small template in a loop). Development tool of the library, of no use to a modder.

## Notes

- Bug: the last loop of `run` references the tables `views` and `contexts`, which are declared nowhere in the file (nil globals); the call crashes at the "Execution Time" measurement.
- Prints via print (or ngx.say); clears `template.cache` during the compilation measurement.

## Functions

| Function | Description | Line |
|---|---|---|
| `libs_resty_template_microbenchmark.run(iterations)` | Runs the benchmark: measures `parse`, `compile` and template execution over `iterations` loops and prints the times (os.clock). | 8 |

### Parameter details

#### `libs_resty_template_microbenchmark.run(iterations)`

Runs the benchmark: measures `parse`, `compile` and template execution over `iterations` loops and prints the times (os.clock).

- `iterations` (*integer|nil*) : Number of iterations (default 1000).

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/libs/resty/template/microbenchmark.lua`.*
