---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/bakeTest.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Dev-only: drives the GPU material baker + glTF exporter over a hardcoded set of
---  complex, multi-material meshes to validate the pipeline end to end. Load via:
---    -lua "extensions.load('util/bakeTest')"
---  Outputs go to /temp/bakeTest/<name>/ (atlas PNGs + <name>.gltf, co-located).
--- Accès : extension `util_bakeTest` : `extensions.load("util_bakeTest")`, puis la globale `util_bakeTest`
---@class util_bakeTest
util_bakeTest = {}

---Source : lua/ge/extensions/util/bakeTest.lua:50
function util_bakeTest.onClientPostStartMission() end

---Source : lua/ge/extensions/util/bakeTest.lua:55
function util_bakeTest.onUpdate() end

