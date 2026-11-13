# `editor_flowgraph_properties`

*Fichier : `lua/ge/extensions/editor/flowgraph/properties.lua` · VM : Game Engine (GE) · 1325 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/editor/flowgraph/properties")` (fichier sous extensions/ mais pas une extension classique)

## Classe `C`

| Méthode | Description | Ligne |
|---|---|---|
| `C:_drawDataTable(path, cdata, v, savePath, saveCallback, keysEditable)` |  | 158 |
| `C:_drawInputField(path, cdata, type, v, savePath, saveCallback, enterOnly, padRight, pin)` |  | 24 |
| `C:customPropertyColor(item, customName, cdata)` |  | 199 |
| `C:draw(dt)` |  | 1020 |
| `C:drawCustomInPins(item)` |  | 397 |
| `C:drawCustomOutPins(item)` |  | 610 |
| `C:drawGraphProperties(graph)` |  | 1156 |
| `C:drawHardTemplates(pin, item)` |  | 745 |
| `C:drawInPins(item)` |  | 804 |
| `C:drawItemHeader(item)` |  | 231 |
| `C:drawItemProperties(itemType, item)` |  | 976 |
| `C:drawOutPins(item)` |  | 934 |
| `C:getFirstAllowedType(types)` |  | 388 |
| `C:init()` |  | 18 |
| `C:initCustomProperties(item)` |  | 211 |
| `C:showAvailableMacroTags()` |  | 1133 |
| `C:unselect()` |  | 1124 |

## Appels vers le moteur (C++)

- `FS:` `findFiles`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/flowgraph/properties.lua`.*
