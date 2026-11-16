# `gameplay_rally_notebook_test_testNotebook`

*File: `lua/ge/extensions/gameplay/rally/notebook/test/testNotebook.lua` · VM: Game Engine (GE) · 401 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_rally_notebook_test_testNotebook`: `extensions.load("gameplay_rally_notebook_test_testNotebook")`, then the global `gameplay_rally_notebook_test_testNotebook`

Manual tests of the rally notebook, to run from the game's Lua console. testAll() chains ten tests with a homemade assertion (assertEqual: logs 'I' if OK, 'E' log then error() on the first failure) then displays the total/passed/failed counters. The tests cover the migration of structured storage (schemas v1, v2, v3 to six slots), the removal of legacy fields (arcDegrees, intensity, direction, lengthFeel…), the projection of live measurements (structuredForProjection) and the distance/modifier order of compositorUtil.compositePhraseEntries.

## Example

```lua
extensions.unload('gameplay_rally_notebook_test_testNotebook') extensions.load('gameplay_rally_notebook_test_testNotebook') gameplay_rally_notebook_test_testNotebook.testAll()
```

## Notes

- The file's header comment cites the extension name 'gameplay_notebook_test_testNotebook', which does not match the real name derived from the path (gameplay_rally_notebook_test_testNotebook): the command in the comment would not work as is.
- Two tests read /gameplay/missions/driver_training/rallyStage/aip-test3/rally/notebooks/test_v3_1.notebook.json and write test_v3_1_out.notebook.json (notebook:save()): these mission files must exist.
- The first failing assertEqual interrupts testAll via error(); dump(assertCounts) is then not reached.
- Test file, not intended for modders; mainly serves as examples of the expected behavior of Structured and Pacenote.

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_rally_notebook_test_testNotebook.testAll()` | Runs all the tests (structured: deserialization, serialization, migration, lengthMode, v1 -> fixed slots, v3 round trip, v2 with empty slots, slotItem; measurement projection of a dummy Pacenote; compositor distance/modifier order) and displays the counters with dump(). | 384 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/rally/notebook/test/testNotebook.lua`.*
