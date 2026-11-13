# `editor_crawlEditor_presets`

*Fichier : `lua/ge/extensions/editor/crawlEditor/presets.lua` · VM : Game Engine (GE) · 979 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/editor/crawlEditor/presets")` (fichier sous extensions/ mais pas une extension classique)

## Classe `C`

Le module renvoie un constructeur : `local obj = require("editor_crawlEditor_presets")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:deleteBoundaryComponent(id)` |  | 632 |
| `C:deleteBoundaryPreset(name)` |  | 469 |
| `C:deletePathnodeComponent(id)` |  | 636 |
| `C:deletePathnodePreset(name)` |  | 484 |
| `C:deleteTrailComponent(id)` |  | 628 |
| `C:deleteTrailPreset(name)` |  | 499 |
| `C:drawDialogs()` |  | 791 |
| `C:drawMenu(crawlData, trails, waypoints)` |  | 697 |
| `C:exportPreset(category, name, filepath)` |  | 640 |
| `C:getAllBoundaryComponents()` |  | 543 |
| `C:getAllPathnodeComponents()` |  | 548 |
| `C:getAllTrailComponents()` |  | 538 |
| `C:getBoundaryPresetName()` |  | 693 |
| `C:getBoundaryPresets()` |  | 514 |
| `C:getPathnodePresetName()` |  | 694 |
| `C:getPathnodePresets()` |  | 522 |
| `C:getShowPresetManager()` |  | 687 |
| `C:getShowPresetManagerPtr()` |  | 692 |
| `C:getShowSaveBoundaryDialog()` |  | 681 |
| `C:getShowSavePathnodeDialog()` |  | 683 |
| `C:getShowSaveTrailDialog()` |  | 685 |
| `C:getTrailPresetName()` |  | 695 |
| `C:getTrailPresets()` |  | 530 |
| `C:importPreset(filepath, category)` |  | 657 |
| `C:init()` |  | 36 |
| `C:loadBoundaryComponent(id)` |  | 558 |
| `C:loadBoundaryPreset(name)` |  | 400 |
| `C:loadPathnodeComponent(id)` |  | 563 |
| `C:loadPathnodePreset(name)` |  | 423 |
| `C:loadPresets()` |  | 280 |
| `C:loadTrailComponent(id)` |  | 553 |
| `C:loadTrailPreset(name)` |  | 446 |
| `C:saveBoundaryComponent(name, boundary)` |  | 588 |
| `C:saveBoundaryPreset(name, boundary)` |  | 307 |
| `C:savePathnodeComponent(name, path)` |  | 608 |
| `C:savePathnodePreset(name, path)` |  | 338 |
| `C:savePresets()` |  | 289 |
| `C:saveTrailComponent(name, trail)` |  | 568 |
| `C:saveTrailPreset(name, trail)` |  | 369 |
| `C:setShowPresetManager(show)` |  | 688 |
| `C:setShowSaveBoundaryDialog(show)` |  | 682 |
| `C:setShowSavePathnodeDialog(show)` |  | 684 |
| `C:setShowSaveTrailDialog(show)` |  | 686 |

## Appels vers le moteur (C++)

- `FS:` `directoryCreate`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/crawlEditor/presets.lua`.*
