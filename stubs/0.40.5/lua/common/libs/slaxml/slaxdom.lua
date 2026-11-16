---@meta
-- tim19Atlas stub generated from lua/common/libs/slaxml/slaxdom.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Extension of SLAXML (third-party library by Gavin Kistner): adds to the SLAXML table a `dom` parser that builds a flat DOM (with nsPrefix, cdata) and an `xml` serializer that rewrites a node or a document as XML text (indentation, attribute sorting, omission of namespaces). The module returns the modified SLAXML table. Used by xlsxlib and by the JUnit writers of the testFramework.
--- Access: `require("libs/slaxml/slaxdom")`
---@class libs_slaxml_slaxdom
local libs_slaxml_slaxdom = {}

--- Parses the XML into a flat DOM. Returns a document node {type='document', name='#doc', kids, root}. Elements carry name, nsURI, nsPrefix, kids, attr (list + dictionary) and, outside simple mode, el and parent. Texts have type='text', value and cdata.
---Source: lua/common/libs/slaxml/slaxdom.lua:3
---@param self any
---@param xml string XML text.
---@param opts table|nil {simple = boolean, stripWhitespace = boolean}.
---@return table  DOM document.
function libs_slaxml_slaxdom.dom(self, xml, opts) end

--- Serializes a node (document, element, text, comment, processing instruction) into an XML string.
---Source: lua/common/libs/slaxml/slaxdom.lua:52
---@param self any
---@param n table DOM node to write.
---@param opts table|nil indent (number of spaces or string), sort (sort the attributes), omit (list of namespace URIs or values to omit).
---@return string  XML text (lines separated by a newline if indent is given, otherwise concatenated).
function libs_slaxml_slaxdom.xml(self, n, opts) end

return libs_slaxml_slaxdom
