---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/docCreator.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Internal BeamNG tool to generate the JSON data and resources (images copied with a name based on the SHA1 hash) that feed the online documentation (Hugo system). For each available language, it exports the list of levels and vehicles (models and configurations); it also exports the game version, physical materials, JBeam defaults, JBeam statistics and tested game controllers (from /settings/inputmaps/). Everything is written to the doc-out/ folder (data/ and resources/). Of little use to a modder, except as an example of accessing the level/vehicle lists.
--- Access: extension `util_docCreator`: `extensions.load("util_docCreator")`, then the global `util_docCreator`
---@class util_docCreator
util_docCreator = {}

--- Creates an asynchronous job that generates all the documentation data (levels, vehicles per language, then common data) in doc-out/data/ and doc-out/resources/.
---Source: lua/ge/extensions/util/docCreator.lua:290
function util_docCreator.run() end

--- Like run(), but exits the game (shutdown(0)) once generation is finished. Intended for command-line generation.
---Source: lua/ge/extensions/util/docCreator.lua:294
function util_docCreator.runAndQuit() end

