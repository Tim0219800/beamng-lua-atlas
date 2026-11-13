---@meta
-- tim19Atlas stub generated from lua/common/libs/slaxml/slaxml.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- v0.8 Copyright © 2013-2018 Gavin Kistner <!@phrogz.net>; MIT Licensed
--- See http://github.com/Phrogz/SLAXML for details.
--- --
--- Accès : `require("libs/slaxml/slaxml")`
---@class libs_slaxml_slaxml
local libs_slaxml_slaxml = {}

--- Optional parser that creates a flat DOM from parsing
---Source : lua/common/libs/slaxml/slaxml.lua:259
---@param self any
---@param xml any
---@param opts any
function libs_slaxml_slaxml.dom(self, xml, opts) end

---Source : lua/common/libs/slaxml/slaxml.lua:43
---@param self any
---@param xml any
---@param options any
function libs_slaxml_slaxml.parse(self, xml, options) end

---Source : lua/common/libs/slaxml/slaxml.lua:39
---@param self any
---@param callbacks any
function libs_slaxml_slaxml.parser(self, callbacks) end

return libs_slaxml_slaxml
