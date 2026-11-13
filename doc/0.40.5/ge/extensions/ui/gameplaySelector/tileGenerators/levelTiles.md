# `ui_gameplaySelector_tileGenerators_levelTiles`

*Fichier : `lua/ge/extensions/ui/gameplaySelector/tileGenerators/levelTiles.lua` · VM : Game Engine (GE) · 357 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_gameplaySelector_tileGenerators_levelTiles` : `extensions.load("ui_gameplaySelector_tileGenerators_levelTiles")`, puis la globale `ui_gameplaySelector_tileGenerators_levelTiles`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_gameplaySelector_tileGenerators_levelTiles.onFilterCustomLevelTiles(item, searchText, result)` | *(hook)* | 280 |
| `ui_gameplaySelector_tileGenerators_levelTiles.onFreeroamSelectorOpenedWithItemDetails(itemDetails, backend)` | Hook to handle when freeroam selector is opened with item details *(hook)* | 335 |
| `ui_gameplaySelector_tileGenerators_levelTiles.onGameplaySelectorGetDetails(itemDetails, details, buttonInstance, backend)` | *(hook)* | 185 |
| `ui_gameplaySelector_tileGenerators_levelTiles.onGameplaySelectorGetTiles(items)` | *(hook)* | 43 |
| `ui_gameplaySelector_tileGenerators_levelTiles.openLevelConfigurationPopup(levelData)` | Function to open level configuration popup | 330 |
| `ui_gameplaySelector_tileGenerators_levelTiles.setAlwaysShowDialogue(backendName, newValue)` |  | 321 |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onFreeroamSelectorGetDetails`

**Évènements UI (guihooks.trigger) :** `openLevelConfigurationPopup`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/gameplaySelector/tileGenerators/levelTiles.lua`.*
