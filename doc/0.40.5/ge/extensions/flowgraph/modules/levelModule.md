# `flowgraph_modules_levelModule`

*Fichier : `lua/ge/extensions/flowgraph/modules/levelModule.lua` · VM : Game Engine (GE) · 70 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/modules/levelModule")` (fichier sous extensions/ mais pas une extension classique)

## Classe `C`

| Méthode | Description | Ligne |
|---|---|---|
| `C:afterTrigger()` |  | 41 |
| `C:beginLoadingLevel()` |  | 25 |
| `C:clear()` |  | 16 |
| `C:delayOrInstantFunction(fun)` | this function will delay another function until finishedLevelLoading is called, or will call it instantly if not level is being loaded. | 49 |
| `C:executionStopped()` |  | 66 |
| `C:finishedLevelLoading()` |  | 29 |
| `C:init()` |  | 7 |
| `C:prefabLoaded(id)` |  | 57 |

## Appels vers le moteur (C++)

- `be:` `reloadCollision`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/modules/levelModule.lua`.*
