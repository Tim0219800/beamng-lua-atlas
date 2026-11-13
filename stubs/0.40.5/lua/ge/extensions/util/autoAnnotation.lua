---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/autoAnnotation.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `util_autoAnnotation` : `extensions.load("util_autoAnnotation")`, puis la globale `util_autoAnnotation`
---@class util_autoAnnotation
util_autoAnnotation = {}

---Source : lua/ge/extensions/util/autoAnnotation.lua:132
function util_autoAnnotation.autoAnnotateGroups() end

---Source : lua/ge/extensions/util/autoAnnotation.lua:137
function util_autoAnnotation.autoAnnotateLevel() end

---Source : lua/ge/extensions/util/autoAnnotation.lua:121
function util_autoAnnotation.autoAnnotateScenetree() end

---Source : lua/ge/extensions/util/autoAnnotation.lua:118
function util_autoAnnotation.onInit() end

--- Classe locale `visitors` de lua/ge/extensions/util/autoAnnotation.lua
---@class util_autoAnnotation_visitors
local util_autoAnnotation_visitors = {}

---Source : lua/ge/extensions/util/autoAnnotation.lua:94
---@param parent any
---@param node any
function util_autoAnnotation_visitors.visitForest(parent, node) end

---Source : lua/ge/extensions/util/autoAnnotation.lua:102
---@param parent any
---@param node any
function util_autoAnnotation_visitors.visitGroundCover(parent, node) end

