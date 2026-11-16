# `libs_slaxml_slaxdom`

*File: `lua/common/libs/slaxml/slaxdom.lua` · VM: Common (GE + vehicle) · 131 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("libs/slaxml/slaxdom")`

Extension of SLAXML (third-party library by Gavin Kistner): adds to the SLAXML table a `dom` parser that builds a flat DOM (with nsPrefix, cdata) and an `xml` serializer that rewrites a node or a document as XML text (indentation, attribute sorting, omission of namespaces). The module returns the modified SLAXML table. Used by xlsxlib and by the JUnit writers of the testFramework.

## Example

```lua
local SLAXML = require('libs/slaxml/slaxdom')
local doc = SLAXML:dom('<a x="1"><b>texte</b></a>')
print(doc.root.name, doc.root.attr.x)
print(SLAXML:xml(doc, {indent = 2}))
```

## Notes

- Loading this module replaces `SLAXML.dom` defined in slaxml.lua (the version here adds nsPrefix, cdata and the error on non-blank text at the root) and defines `SLAXML.xml`.
- In `opts.simple` mode, `doc.root` is not set (nil) and the `parent` links / `el` lists are not created.
- Each attribute exists twice: in `element.attr[i]` (list of attribute nodes) and, outside simple mode, in `element.attr[name]` (value).
- Bug: the CDATA serialization writes `<![[CDATA[` instead of `<![CDATA[`; the result is not valid XML.
- The escape function `esc` returns two values (gsub) and does not escape the apostrophe despite its entry in the table.

## Functions

| Function | Description | Line |
|---|---|---|
| `libs_slaxml_slaxdom.dom(self, xml, opts)` | Parses the XML into a flat DOM. Returns a document node {type='document', name='#doc', kids, root}. Elements carry name, nsURI, nsPrefix, kids, attr (list + dictionary) and, outside simple mode, el and parent. Texts have type='text', value and cdata. | 3 |
| `libs_slaxml_slaxdom.xml(self, n, opts)` | Serializes a node (document, element, text, comment, processing instruction) into an XML string. | 52 |

### Parameter details

#### `libs_slaxml_slaxdom.dom(self, xml, opts)`

Parses the XML into a flat DOM. Returns a document node {type='document', name='#doc', kids, root}. Elements carry name, nsURI, nsPrefix, kids, attr (list + dictionary) and, outside simple mode, el and parent. Texts have type='text', value and cdata.

- `self` (*any*) : 
- `xml` (*string*) : XML text.
- `opts` (*table|nil*) : {simple = boolean, stripWhitespace = boolean}.
- **returns**: table DOM document.

#### `libs_slaxml_slaxdom.xml(self, n, opts)`

Serializes a node (document, element, text, comment, processing instruction) into an XML string.

- `self` (*any*) : 
- `n` (*table*) : DOM node to write.
- `opts` (*table|nil*) : indent (number of spaces or string), sort (sort the attributes), omit (list of namespace URIs or values to omit).
- **returns**: string XML text (lines separated by a newline if indent is given, otherwise concatenated).

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/libs/slaxml/slaxdom.lua`.*
