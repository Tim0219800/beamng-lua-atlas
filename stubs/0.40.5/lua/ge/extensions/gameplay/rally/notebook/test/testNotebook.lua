---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/notebook/test/testNotebook.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Manual tests of the rally notebook, to run from the game's Lua console. testAll() chains ten tests with a homemade assertion (assertEqual: logs 'I' if OK, 'E' log then error() on the first failure) then displays the total/passed/failed counters. The tests cover the migration of structured storage (schemas v1, v2, v3 to six slots), the removal of legacy fields (arcDegrees, intensity, direction, lengthFeel…), the projection of live measurements (structuredForProjection) and the distance/modifier order of compositorUtil.compositePhraseEntries.
--- Access: extension `gameplay_rally_notebook_test_testNotebook`: `extensions.load("gameplay_rally_notebook_test_testNotebook")`, then the global `gameplay_rally_notebook_test_testNotebook`
---@class gameplay_rally_notebook_test_testNotebook
gameplay_rally_notebook_test_testNotebook = {}

--- Runs all the tests (structured: deserialization, serialization, migration, lengthMode, v1 -> fixed slots, v3 round trip, v2 with empty slots, slotItem; measurement projection of a dummy Pacenote; compositor distance/modifier order) and displays the counters with dump().
---Source: lua/ge/extensions/gameplay/rally/notebook/test/testNotebook.lua:384
function gameplay_rally_notebook_test_testNotebook.testAll() end

