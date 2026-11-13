# tim19Atlas: BeamNG.drive Lua API atlas

*[Version française : README.fr.md](README.fr.md)* · **Browse online: https://tim0219800.github.io/beamng-lua-atlas/**

A detailed reference of the BeamNG.drive Lua API, plus LuaLS stubs for autocompletion in VS Code.
Everything is generated from the Lua code shipped with the game (read-only) and from an in-game scan of the C++ bindings.

**Game version covered: 0.40.5.0 (build 302427).**

> Unofficial project, not affiliated with or endorsed by BeamNG GmbH.
> The written descriptions are in **French**; signatures, types, hooks and C++ listings are language-neutral.

## What's inside

| Folder | Content |
|---|---|
| [`doc/0.40.5/index.md`](doc/0.40.5/index.md) | Entry point: every module, grouped by VM (vehicle, GE, common), with links |
| [`doc/0.40.5/hooks.md`](doc/0.40.5/hooks.md) | All 838 hooks: which modules fire them, which modules listen |
| [`doc/0.40.5/cpp.md`](doc/0.40.5/cpp.md) | C++ classes and modules exposed to Lua (`obj`, `be`, `Engine.*`, scene objects…) |
| `stubs/0.40.5/lua/...` | `---@meta` stubs for LuaLS, same tree as the game's `lua/` folder |
| `stubs/0.40.5/cpp/ge.lua`, `cpp/vehicle.lua` | Stubs for the C++ objects |
| `descriptions/0.40.5/` | Hand-checked descriptions (JSON), merged by the generator |
| `donnees-0.40.5.zip` (release asset) | Raw data: static extraction and in-game scans, needed to regenerate |
| `outils/` | The tools: `extraire.py`, `generer.py`, `importer_releve.py`, `mod_releve/` |

### Coverage

| Layer | Modules with written descriptions (✍) | Documented functions |
|---|---|---|
| Vehicle | 239 / 242 | 1664 / 1667 |
| Common (GE + vehicle) | 87 / 188 | 412 / 869 |
| GE | 234 / 2060 | 2394 / 11506 |

Written GE coverage focuses on what modders use most: `utils`, `mathlib` (vec3, quat), `extensions`, `guihooks`, jbeam,
`ge/main`, `map`, `spawn`, every `core_*`, `freeroam`, `scenario`, `render`, `mcp`.
Every other module still has an automatic page: exported functions with parameters, fields, classes, hooks and original comments.

C++ side (in-game scan): 103 instance classes in GE (including 76 scene object types such as `BeamNGVehicle` with 300 methods),
39 C++ modules with sub-modules (`Engine.Render`, `Engine.Audio`, `Engine.imgui`…), and `obj` (`BeamObject`, 347 methods) in the vehicle VM.

## Using the stubs in VS Code

1. Install the **Lua** extension (sumneko / LuaLS).
2. Download `stubs-0.40.5.zip` from the [latest release](https://github.com/Tim0219800/beamng-lua-atlas/releases/latest) and unzip it, or clone this repository, for example to `C:/dev/tim19Atlas`.
3. At the root of your mod, create `.luarc.json`. For **vehicle** Lua:

```json
{
  "runtime.version": "LuaJIT",
  "workspace.library": [
    "C:/dev/tim19Atlas/stubs/0.40.5/lua/vehicle",
    "C:/dev/tim19Atlas/stubs/0.40.5/lua/common",
    "C:/dev/tim19Atlas/stubs/0.40.5/cpp/vehicle.lua"
  ],
  "runtime.path": ["?.lua", "?/init.lua"],
  "diagnostics.globals": ["obj", "v"]
}
```

For **GE** Lua, replace `lua/vehicle` with `lua/ge` and `cpp/vehicle.lua` with `cpp/ge.lua`.
Do not mix `ge` and `vehicle`: the two Lua VMs are separate in the game (a vehicle extension cannot see `core_vehicles`, for example).

## Regenerating for a new game version

Unzip `donnees-<version>.zip` from the release into `donnees/` first (it is not tracked in git).

```
python -I outils/extraire.py "<BeamNG.drive install folder>" donnees/<version>/statique.json
python -I outils/importer_releve.py <version>     # after a game session with the tim19_atlas mod
python -I outils/generer.py <version>
```

In-game scan: copy `outils/mod_releve/` to `mods/unpacked/tim19_atlas/` in your BeamNG user folder, start the game and load a map with a vehicle.
Five seconds later it writes `atlas_dump/ge.json` and `atlas_dump/vehicle.json` in the user folder. It changes nothing in the game.
It can be run again from the GE console with `tim19Atlas_dump.run()`. Remove the mod afterwards.

## Reliability

- **Signatures, line numbers, hooks, dependencies**: extracted from the code, reliable.
- **Descriptions marked ✍**: written by reading the code; types are inferred. The source line is always given, check it when in doubt.
- **C++ classes**: exact names and methods from the running game. C++ parameters are not visible from Lua, so stubs declare them as `...`.
- **Game bugs**: several hundred inconsistencies found while reading the code are listed in each module's "Remarques" section,
  and 69 exports pointing to undefined functions are flagged with ⚠. Only a few were checked by hand.

## Roadmap

1. API diff between game versions (re-run the extraction on each update and compare the `statique.json` files).
2. Mod checker: file conflicts, calls to functions that no longer exist, bisection.
3. Written descriptions for `gameplay` (traffic, police, missions).

## License

- `doc/`, `stubs/`, `descriptions/`, `donnees/`: derived from BeamNG GmbH Lua code, distributed under the
  **bCDDL 1.1** (BeamNG's license for its Lua code, copy in [`LICENSE`](LICENSE)). Contributor: Tim0219800.
- `outils/`: **MIT** ([`LICENSE-tools`](LICENSE-tools)).

BeamNG and BeamNG.drive are trademarks of BeamNG GmbH.
