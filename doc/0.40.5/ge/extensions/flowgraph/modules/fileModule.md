# `flowgraph_modules_fileModule`

*Fichier : `lua/ge/extensions/flowgraph/modules/fileModule.lua` · VM : Game Engine (GE) · 68 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/modules/fileModule")` (fichier sous extensions/ mais pas une extension classique)

## Classe `C`

| Méthode | Description | Ligne |
|---|---|---|
| `C:afterTrigger()` |  | 51 |
| `C:clear()` |  | 14 |
| `C:executionStarted()` |  | 64 |
| `C:executionStopped()` |  | 60 |
| `C:forceReload(file)` |  | 19 |
| `C:getFile(file)` |  | 23 |
| `C:init()` |  | 10 |
| `C:read(file, field)` |  | 47 |
| `C:write(file, field, value)` |  | 40 |

## Appels vers le moteur (C++)

- `FS:` `fileExists`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/modules/fileModule.lua`.*
