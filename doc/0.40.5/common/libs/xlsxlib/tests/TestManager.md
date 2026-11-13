# `libs_xlsxlib_tests_TestManager`

*Fichier : `lua/common/libs/xlsxlib/tests/TestManager.lua` · VM : Commun (GE + véhicule) · 195 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("libs/xlsxlib/tests/TestManager")`

Unit Test Manager for the xlsx library
  Copyright 2024 BeamNG GmbH, Thomas Fischer <tfischer@beamng.gmbh>

  This module provides a simple test manager for running unit tests on the xlsx library.
  It collects test functions, executes them, logs the results, and outputs the results
  in JUnit XML format for integration with other tools.

  Usage:
    - Define your test functions in a separate table.
    - Each test function should be named starting with "test".
    - If a test is expected to fail, append "_shouldFail" to its name.
    - Use the TestManager to run your tests.

  Example:
    -- See the example usage at the end of this file.
 Import required modules

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/libs/xlsxlib/tests/TestManager.lua`.*
