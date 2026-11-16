---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/dependencyTree.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Development tool that parses the content files of the 'levels/gridmap' level (*.level.json, *.material.json, *.datablock.json and *.meshes.json) to build a dependency graph: each entity declares what it provides (provides: object name, mapTo material, shape) and what it depends on (deps: files, textures, materials, shapes, objects). The result is written to dependencytree.json. A modder can use it to find out which textures, materials and shapes a level uses.
--- Access: extension `util_dependencyTree`: `extensions.load("util_dependencyTree")`, then the global `util_dependencyTree`
---@class util_dependencyTree
util_dependencyTree = {}

--- Analyzes all the content files of the folder, fills the entity list (deps and provides) and writes it to dependencytree.json (indented JSON).
---Source: lua/ge/extensions/util/dependencyTree.lua:220
function util_dependencyTree.test() end

