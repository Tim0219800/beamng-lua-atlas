---@meta
-- tim19Atlas stub generated from lua/common/testFramework/TestManager.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Unit Test Manager for the BeamNG
---   Copyright 2024 BeamNG GmbH, Thomas Fischer <tfischer@beamng.gmbh>
---
---   This module provides a simple test manager for running unit tests
---   It collects test functions, executes them, logs the results, and outputs the results
---   in JUnit XML format for integration with other tools.
---
---   Usage:
---     - Define your test functions in a separate table.
---     - Each test function should be named starting with "test".
---     - If a test is expected to fail, append "_shouldFail" to its name.
---     - Use the TestManager to run your tests.
---
---   Example:
---     -- See the example usage at the end of this file.
---
---
---     -- extensions.testFramework_TestManager.runTestFiles()
---  Import required modules
--- Accès : `require("testFramework/TestManager")`
---@class testFramework_TestManager
local testFramework_TestManager = {}

