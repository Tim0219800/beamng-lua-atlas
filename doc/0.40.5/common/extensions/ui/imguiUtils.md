# `ui_imguiUtils`

*Fichier : `lua/common/extensions/ui/imguiUtils.lua` · VM : Commun (GE + véhicule) · 616 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_imguiUtils` : `extensions.load("ui_imguiUtils")`, puis la globale `ui_imguiUtils`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_imguiUtils.CreateKeyValApp(window, section, tbl, callback)` | Creates a simple Key/Value app with a lua table | 305 |
| `ui_imguiUtils.CreateSampleFloatDisplay(sampleTimeInSeconds, startingValue, precision)` | local flag = false | 548 |
| `ui_imguiUtils.DropdownButton(label, size, items, icon, horizontal)` |  | 61 |
| `ui_imguiUtils.DropdownItem(label, icon, func, tooltip)` |  | 43 |
| `ui_imguiUtils.DropdownSelect(label, size, selectedItem, items, horizontal, excludeCurrent)` |  | 194 |
| `ui_imguiUtils.DropdownSelectable(label, items, icon, iconSize, popupWidth, onChangeFunc, tooltip, itemsRMB)` |  | 114 |
| `ui_imguiUtils.DropdownSelectableItem(label, active, func, tooltip)` |  | 52 |
| `ui_imguiUtils.IsWindowHovered(windowPos, windowSize)` | check if a window with given pos and size is hovered<br> local windowPos = im.GetWindowPos()<br> local windowSize = im.GetWindowSize() | 276 |
| `ui_imguiUtils.SampleFloatDisplay(id, value, sampleTimeInSeconds, precision)` | imguiUtils.SampleFloatDisplay('engineLoad' .. device.name, device.engineLoad, 0.8) | 607 |
| `ui_imguiUtils.addRecursiveTreeTable(data, fullpath, noColumns, highlightCallback, itemCallback)` |  | 418 |
| `ui_imguiUtils.cell(a, b)` |  | 487 |
| `ui_imguiUtils.changeUIScale(uiscale)` |  | 10 |
| `ui_imguiUtils.displayKeyValues(tbl)` | displays key/values aof a lua table | 286 |
| `ui_imguiUtils.drawCursorPos(posX, posY)` |  | 26 |
| `ui_imguiUtils.keyValueTable(data, fullpath, highlightCallback, itemCallback)` |  | 351 |
| `ui_imguiUtils.texObj(path)` |  | 33 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `sampleFloatDisplayState` | table |  |

## Classe `ValueSampler`

| Méthode | Description | Ligne |
|---|---|---|
| `ValueSampler:get(sample)` |  | 523 |
| `ValueSampler:reset()` |  | 534 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/extensions/ui/imguiUtils.lua`.*
