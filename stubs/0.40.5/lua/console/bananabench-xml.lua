---@meta
-- tim19Atlas stub generated from lua/console/bananabench-xml.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Small XML document builder (global class).
---@class bananabench_xml_XML
local bananabench_xml_XML = {}

--- Adds a child node.
---Source: lua/console/bananabench-xml.lua:dyn
---@param xml table Child node.
function bananabench_xml_XML:addChild(xml) end

--- Creates an empty XML node (name, attribs, children).
---Source: lua/console/bananabench-xml.lua:dyn
---@return table  XML node.
function bananabench_xml_XML:create() end

--- Returns the complete document with the header `<?xml version="1.0" encoding="UTF-8"?>`.
---Source: lua/console/bananabench-xml.lua:dyn
---@return string  XML text.
function bananabench_xml_XML:encode() end

--- Serializes the node and its children with 2-space indentation.
---Source: lua/console/bananabench-xml.lua:dyn
---@param indent integer|nil Indentation level (default 0).
---@return string  XML text.
function bananabench_xml_XML:toString(indent) end

---@type table
XML = nil
