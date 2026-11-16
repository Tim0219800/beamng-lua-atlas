# Description writing guidelines (tim19Atlas)

*[Version française : CONSIGNES_DESCRIPTIONS.md](CONSIGNES_DESCRIPTIONS.md)*

Goal: document the BeamNG.drive 0.40.5 Lua API in detail, from the **game code only**.
Source code (read-only, NEVER modify it): `<BeamNG.drive>/lua/` (game install folder).
Functions already extracted automatically: `<atlas-lua>/doc/0.40.5/<path>.md`
(read that page first: it lists the exported functions, fields, classes and instance methods, with line numbers).

## What to write

One JSON file per source file, in each language:
- English (main language): `<atlas-lua>/descriptions/0.40.5/<path relative to lua/>.json`
- French: `<atlas-lua>/descriptions/fr/0.40.5/<path relative to lua/>.json`

(e.g. `lua/vehicle/electrics.lua` -> `descriptions/0.40.5/vehicle/electrics.json` and `descriptions/fr/0.40.5/vehicle/electrics.json`).
Both files have exactly the same structure (same keys, same types); only the texts differ. Use the Write tool (no heredoc).

```json
{
  "path": "lua/vehicle/electrics.lua",
  "module": "2 to 5 sentences: what the module does, when a modder uses it, what it reads/writes.",
  "usage": "short, realistic Lua example (optional, only when useful)",
  "notes": ["pitfalls, units (m/s, rad, N·m, K…), call order, special values"],
  "fields": {
    "values": {"type": "table<string, number|boolean>", "desc": "…"}
  },
  "functions": {
    "setIgnitionLevel": {
      "desc": "What the function does (1 to 3 sentences).",
      "params": {"ignitionLevel": {"type": "integer", "desc": "0 off, 1 accessories, 2 on, 3 starter"}},
      "returns": [{"type": "boolean", "desc": "…"}],
      "internal": false
    }
  },
  "classes": {
    "device": {
      "desc": "Object returned by new(jbeamData) …",
      "functions": {"setIgnition": {"desc": "…", "params": {"value": {"type": "number", "desc": "…"}}}}
    }
  }
}
```

## Rules

1. **English** in `descriptions/<v>/`, **French** in `descriptions/fr/<v>/`; short, concrete sentences. Code names stay as they are.
2. **Nothing invented**: every claim comes from the code you read. If a parameter's meaning is uncertain, use `"type": "any"` and say "(inferred from code)", or say nothing.
3. LuaLS types: `number`, `integer`, `string`, `boolean`, `table`, `table<string, number>`, `vec3`, `quat`, `function`, `nil`, unions `number|nil`, `any`.
4. Document **all** exported functions and all class/instance methods listed in the .md page, within reason: for a huge file, prioritize what a modder needs; the rest may only have `desc`.
5. `internal: true` for what is only called by the engine or the main loop (init, reset, updateGFX, onXxx called by main.lua…); in that case `desc` says when it is called.
6. Hooks (`onXxx`): say when they are called and with which arguments.
7. If you spot a bug or an inconsistency in the game code (exported field that is nil, etc.), write it in `notes`.
8. Valid JSON (UTF-8, double quotes, no trailing comma). Check each file with `python -I -c "import json,sys;json.load(open(sys.argv[1],encoding='utf-8'))" <file>`.
9. Write nothing outside `descriptions/`.

## Final report (short, ≤ 150 words)

Number of files written, files skipped and why, game bugs spotted.
