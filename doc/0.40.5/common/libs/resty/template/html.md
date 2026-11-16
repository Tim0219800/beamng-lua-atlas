# `libs_resty_template_html`

*File: `lua/common/libs/resty/template/html.lua` · VM: Common (GE + vehicle) · 52 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("libs/resty/template/html")`

Third-party library lua-resty-template: small HTML tag generator. `html.name(attributes)(content)` or `html.name(content)` produces `<name attr="...">content</name>` with HTML escaping of the content and attribute values. It also registers itself as `template.html`.

## Example

```lua
local html = require('resty.template.html')
print(html.a{href = '/x'}('lien'))   -- <a href="&#47;x">lien</a>
print(html.br())                       -- <br />
```

## Notes

- The file does `require "resty.template"` (dot separator) while the module is in libs/resty/template: this name must be resolvable by the require search path.
- If the content is not a string, the tag is self-closing (` />`). Attributes with a numeric key are written as is (escaped), the others as key="value".
- Attribute values are escaped with template.escape: '/' becomes &#47;.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/libs/resty/template/html.lua`.*
