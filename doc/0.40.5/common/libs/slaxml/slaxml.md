# `libs_slaxml_slaxml`

*File: `lua/common/libs/slaxml/slaxml.lua` · VM: Common (GE + vehicle) · 307 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("libs/slaxml/slaxml")`

Third-party library SLAXML v0.8 (Gavin Kistner, MIT license): pure-Lua SAX-type XML parser with namespace handling. You pass it callbacks (pi, comment, startElement, attribute, text, closeElement); it calls them while reading. The game uses it to read XML (e.g. xlsxlib, JUnit writing).

## Example

```lua
local SLAXML = require('libs/slaxml/slaxml')
local p = SLAXML:parser{ startElement = function(name) print('<'..name..'>') end }
p:parse('<a><b/></a>', {stripWhitespace = true})
```

## Notes

- Without custom callbacks, `SLAXML:parser()` uses default callbacks that print (print/io.write) each event.
- `parse` raises an error if no element is found ("Parsing did not discover any elements"), if elements remain open, if a namespace prefix is unknown, or if the content of a tag cannot be read.
- Option `options.stripWhitespace`: removes leading/trailing whitespace from the text (default false).
- `SLAXML:dom` is defined here (simple version) and redefined by libs/slaxml/slaxdom (which adds nsPrefix and the `xml` serialization): loading slaxdom replaces this version.

## Functions

| Function | Description | Line |
|---|---|---|
| `libs_slaxml_slaxml.dom(self, xml, opts)` | Parses the XML and returns a flat DOM: document {type='document', name='#doc', kids, root}, elements {type='element', name, kids, el, attr, nsURI, parent}, attributes, texts, comments, processing instructions. With opts.simple, the parent links and `el` are not created. Raises an error if there are several roots or an unexpected closing tag. | 259 |
| `libs_slaxml_slaxml.parse(self, xml, options)` | Parses the XML text by calling the parser's callbacks (or SLAXML's if called directly). Handles the standard entities (&lt; &gt; &amp; &quot; &apos;) and numeric references. | 43 |
| `libs_slaxml_slaxml.parser(self, callbacks)` | Creates a parser object {_call, parse} using the given callbacks (or the default ones that print). | 39 |

### Parameter details

#### `libs_slaxml_slaxml.dom(self, xml, opts)`

Parses the XML and returns a flat DOM: document {type='document', name='#doc', kids, root}, elements {type='element', name, kids, el, attr, nsURI, parent}, attributes, texts, comments, processing instructions. With opts.simple, the parent links and `el` are not created. Raises an error if there are several roots or an unexpected closing tag.

- `self` (*any*) : 
- `xml` (*string*) : XML text.
- `opts` (*table|nil*) : {simple = boolean, stripWhitespace = boolean}.
- **returns**: table DOM document.

#### `libs_slaxml_slaxml.parse(self, xml, options)`

Parses the XML text by calling the parser's callbacks (or SLAXML's if called directly). Handles the standard entities (&lt; &gt; &amp; &quot; &apos;) and numeric references.

- `self` (*any*) : 
- `xml` (*string*) : XML text.
- `options` (*table|nil*) : {stripWhitespace = boolean}.

#### `libs_slaxml_slaxml.parser(self, callbacks)`

Creates a parser object {_call, parse} using the given callbacks (or the default ones that print).

- `self` (*any*) : 
- `callbacks` (*table|nil*) : Callback table: pi(target, content), comment(content), startElement(name, nsURI, nsPrefix), attribute(name, value, nsURI, nsPrefix), text(text, cdata), closeElement(name, nsURI, nsPrefix).
- **returns**: table Parser with a parse method.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/libs/slaxml/slaxml.lua`.*
