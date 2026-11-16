---@meta
-- tim19Atlas stub generated from lua/common/libs/slaxml/slaxml.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Third-party library SLAXML v0.8 (Gavin Kistner, MIT license): pure-Lua SAX-type XML parser with namespace handling. You pass it callbacks (pi, comment, startElement, attribute, text, closeElement); it calls them while reading. The game uses it to read XML (e.g. xlsxlib, JUnit writing).
--- Access: `require("libs/slaxml/slaxml")`
---@class libs_slaxml_slaxml
local libs_slaxml_slaxml = {}

--- Parses the XML and returns a flat DOM: document {type='document', name='#doc', kids, root}, elements {type='element', name, kids, el, attr, nsURI, parent}, attributes, texts, comments, processing instructions. With opts.simple, the parent links and `el` are not created. Raises an error if there are several roots or an unexpected closing tag.
---Source: lua/common/libs/slaxml/slaxml.lua:259
---@param self any
---@param xml string XML text.
---@param opts table|nil {simple = boolean, stripWhitespace = boolean}.
---@return table  DOM document.
function libs_slaxml_slaxml.dom(self, xml, opts) end

--- Parses the XML text by calling the parser's callbacks (or SLAXML's if called directly). Handles the standard entities (&lt; &gt; &amp; &quot; &apos;) and numeric references.
---Source: lua/common/libs/slaxml/slaxml.lua:43
---@param self any
---@param xml string XML text.
---@param options table|nil {stripWhitespace = boolean}.
function libs_slaxml_slaxml.parse(self, xml, options) end

--- Creates a parser object {_call, parse} using the given callbacks (or the default ones that print).
---Source: lua/common/libs/slaxml/slaxml.lua:39
---@param self any
---@param callbacks table|nil Callback table: pi(target, content), comment(content), startElement(name, nsURI, nsPrefix), attribute(name, value, nsURI, nsPrefix), text(text, cdata), closeElement(name, nsURI, nsPrefix).
---@return table  Parser with a parse method.
function libs_slaxml_slaxml.parser(self, callbacks) end

return libs_slaxml_slaxml
