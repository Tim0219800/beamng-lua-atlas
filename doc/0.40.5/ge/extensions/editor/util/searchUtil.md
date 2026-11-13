# `editor_util_searchUtil`

*Fichier : `lua/ge/extensions/editor/util/searchUtil.lua` · VM : Game Engine (GE) · 193 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/editor/util/searchUtil")` (fichier sous extensions/ mais pas une extension classique)

## Classe `C`

Le module renvoie un constructeur : `local obj = require("editor_util_searchUtil")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:beginSearchableSimpleCombo(im, string_label, string_preview_value, elementsAsList, ImGuiComboFlags_flags)` |  | 131 |
| `C:finishSearch()` |  | 77 |
| `C:getFrecencyData()` |  | 98 |
| `C:getFrecencyScore(fId)` |  | 122 |
| `C:init()` | initializes stuff for the helper. | 48 |
| `C:queryElement(elem, scoringFunction)` |  | 69 |
| `C:setFrecencyData(frecencyData)` |  | 94 |
| `C:setSameScoreResolvingFunction(fun)` |  | 59 |
| `C:setScoringFunction(fun)` |  | 55 |
| `C:startSearch(matchString)` |  | 63 |
| `C:updateFrecencyEntry(fId)` | 10s auto undo for frecency | 103 |

## Classe `self`

Objet `self` construit dans le module (par ex. par `new`), avec ces méthodes :

| Méthode | Description | Ligne |
|---|---|---|
| `self.sameScoreResolvingFunction(a, b)` |  | 43 |
| `self.scoringFunction(element, match)` |  | 38 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/util/searchUtil.lua`.*
