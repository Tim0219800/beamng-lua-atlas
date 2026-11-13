# `editor_perfProfiler`

*Fichier : `lua/ge/extensions/editor/perfProfiler.lua` · VM : Game Engine (GE) · 558 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_perfProfiler` : `extensions.load("editor_perfProfiler")`, puis la globale `editor_perfProfiler`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_perfProfiler.loadFile(data)` |  | 426 |
| `editor_perfProfiler.onEditorGui(dt)` | *(hook)* | 461 |
| `editor_perfProfiler.onEditorInitialized()` | *(hook)* | 549 |
| `editor_perfProfiler.show()` |  | 545 |

## Appels vers le moteur (C++)

- `FS:` `fileExists`, `findFiles`
- `obj:` `delete`

**Charge les extensions :** `test_util_camPosDataToBucket`, `test_util_fpsCamRecorder`, `util_stepHandler`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/perfProfiler.lua`.*
