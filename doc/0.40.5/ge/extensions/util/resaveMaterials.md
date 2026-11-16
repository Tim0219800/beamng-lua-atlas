# `util_resaveMaterials`

*File: `lua/ge/extensions/util/resaveMaterials.lua` · VM: Game Engine (GE) · 73 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `util_resaveMaterials`: `extensions.load("util_resaveMaterials")`, then the global `util_resaveMaterials`

Migration tool for developers: loads old TorqueScript material files (materials.cs), then resaves them in the new (JSON) format via a PersistenceManager, then deletes the loaded objects. Processing starts as soon as the extension is loaded, in an asynchronous job.

## Example

```lua
extensions.load('util_resaveMaterials')
```

## Notes

- On load, the extension changes the IngameConsoleLogBlacklist and WinConsoleLogBlacklist settings (value "DA") to reduce console noise; they are not restored.
- The file search pattern is 'materials.cs\tmanaged*Data.csNOP': the second pattern (".csNOP") matches nothing, so only materials.cs files are processed.
- The materials.cs files are executed with TorqueScriptLua.exec then rewritten to disk (saveDirtyNewFormat): destructive operation, to be used only on a copy of the data.
- The final shutdown(0) call is commented out: the game does not quit automatically.

## Functions

| Function | Description | Line |
|---|---|---|
| `util_resaveMaterials.onExtensionLoaded()` | Called on extension load: disables console log categories and creates the work job (yield every second). *(internal)* *(hook)* | 62 |
| `util_resaveMaterials.work(job)` | Job body: for each materials.cs found, runs the script, identifies the objects created from that file, marks them modified, saves them in the new format then deletes them. Logs DONE at the end. | 25 |

### Parameter details

#### `util_resaveMaterials.work(job)`

Job body: for each materials.cs found, runs the script, identifies the objects created from that file, marks them modified, saves them in the new format then deletes them. Logs DONE at the end.

- `job` (*table*) : core_jobsystem job object (not used directly)

## Calls into the engine (C++)

- `FS:` `findFiles`
- `TorqueScriptLua.` `exec`
- `obj:` `delete`, `getClassName`, `getName`
- `scenetree.` `findObject`, `getAllObjects`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/util/resaveMaterials.lua`.*
