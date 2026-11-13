# `libs_ezSVG_EzSVG`

*Fichier : `lua/common/libs/ezSVG/EzSVG.lua` · VM : Commun (GE + véhicule) · 963 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("libs/ezSVG/EzSVG")`

Copyright (c) 2012 Patrick Borgeat

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

Except as contained in this notice, the name(s) of the above copyright holders
shall not be used in advertising or otherwise to promote the sale, use or
other dealings in this Software without prior written authorization.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

via https://github.com/BeamNG/EzSVG
 example usage:

local svg = require('libs/EzSVG/EzSVG')
local line = svg.Polyline({0, 0, 100, 100}, {
  fill = 'none',
  stroke = svg.rgb(255, 0, 0),
  stroke_width = 1,
  stroke_opacity=0.4,
})
svg:add(line)
svg:writeTo('test.svg')

--

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `libs_ezSVG_EzSVG.Circle(cx, cy, r, style)` |  | 421 |
| `libs_ezSVG_EzSVG.Document(width, height, bgcolor, style)` |  | 850 |
| `libs_ezSVG_EzSVG.Ellipse(cx, cy, rx, ry, style)` |  | 430 |
| `libs_ezSVG_EzSVG.Group(style)` |  | 709 |
| `libs_ezSVG_EzSVG.Image(href, x, y, width, height, style)` |  | 641 |
| `libs_ezSVG_EzSVG.Line(x1, y1, x2, y2, style)` |  | 440 |
| `libs_ezSVG_EzSVG.LinearGradient(x1, y1, x2, y2, userSpaceUnits, spread, style)` |  | 750 |
| `libs_ezSVG_EzSVG.Mask(x, y, width, height, maskUnits, maskContentUnits, style)` |  | 817 |
| `libs_ezSVG_EzSVG.Path(style)` |  | 450 |
| `libs_ezSVG_EzSVG.Pattern(x, y, width, height, preserveAspectRatio, patternUnits, patternContentUnits, viewbox, style)` |  | 800 |
| `libs_ezSVG_EzSVG.Polygon(points, style)` |  | 624 |
| `libs_ezSVG_EzSVG.Polyline(points, style)` |  | 620 |
| `libs_ezSVG_EzSVG.RadialGradient(cx, cy, r, fx, fy, userSpaceUnits, spread, style)` |  | 764 |
| `libs_ezSVG_EzSVG.Rect(x, y, width, height, rx, ry, style)` |  | 628 |
| `libs_ezSVG_EzSVG.SVG(x, y, width, height, style)` |  | 901 |
| `libs_ezSVG_EzSVG.Symbol(preserveAspectRatio, viewBox, style)` |  | 791 |
| `libs_ezSVG_EzSVG.Text(text, x, y, style)` |  | 664 |
| `libs_ezSVG_EzSVG.TextRef(href, style)` |  | 702 |
| `libs_ezSVG_EzSVG.Use(href, x, y, width, height, style)` |  | 779 |
| `libs_ezSVG_EzSVG.clearStyle()` |  | 379 |
| `libs_ezSVG_EzSVG.gray(v)` |  | 919 |
| `libs_ezSVG_EzSVG.hsv(h, s, v)` |  | 923 |
| `libs_ezSVG_EzSVG.popStyle()` |  | 399 |
| `libs_ezSVG_EzSVG.pushStyle()` |  | 386 |
| `libs_ezSVG_EzSVG.rgb(r, g, b)` |  | 915 |
| `libs_ezSVG_EzSVG.setStyle(key, value, tag)` |  | 407 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `knownTags` | table |  |
| `styleStack` | table |  |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/libs/ezSVG/EzSVG.lua`.*
