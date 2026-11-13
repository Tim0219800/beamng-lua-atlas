# `ui_gameplaySelector_tileSorting`

*Fichier : `lua/ge/extensions/ui/gameplaySelector/tileSorting.lua` · VM : Game Engine (GE) · 292 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_gameplaySelector_tileSorting` : `extensions.load("ui_gameplaySelector_tileSorting")`, puis la globale `ui_gameplaySelector_tileSorting`

Tile Sorting Module for Gameplay Selector

  This module provides centralized sorting functionality for gameplay tiles.
  It supports multiple sort modes and handles complex sorting rules for different
  gameplay systems.

  Sort Modes:
  - Name: Alphabetical sorting with "Other..." items last
  - System: Sort by gameplay system (Freeroam, Challenges, etc.)
  - GameplayAutomatic: Complex multi-criteria sorting for gameplay items
  - Date: Sort by date (newest first)

  UI Integration:
  - Maps UI display values to internal sort modes
  - Provides validation and error handling
  - Supports fallback to default sorting

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_gameplaySelector_tileSorting.convertUIValueToSortMode(uiValue)` |  | 246 |
| `ui_gameplaySelector_tileSorting.getSortFunction(sortMode)` | Public API | 227 |
| `ui_gameplaySelector_tileSorting.isValidSortMode(sortMode)` |  | 242 |
| `ui_gameplaySelector_tileSorting.sortByDate(a, b)` |  | 282 |
| `ui_gameplaySelector_tileSorting.sortByGameplayAutomatic(a, b)` |  | 278 |
| `ui_gameplaySelector_tileSorting.sortByNameButOtherAlwaysLast(a, b)` |  | 270 |
| `ui_gameplaySelector_tileSorting.sortBySystem(a, b)` |  | 274 |
| `ui_gameplaySelector_tileSorting.sortGroup(group, sortMode)` | Group-level sorting function for general sorting cases | 287 |
| `ui_gameplaySelector_tileSorting.sortTiles(tiles, sortMode)` |  | 265 |
| `ui_gameplaySelector_tileSorting.sortTilesFromUIValue(tiles, uiSortValue)` |  | 260 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `SORT_MODE_TO_UI` | table | Reverse mapping for debugging/logging |
| `SYSTEM_ORDER` | table | Centralized system order for consistent sorting across the module |
| `UI_TO_SORT_MODE` | table | Mapping from UI display values to internal sort modes |
| `VALID_SORT_MODES` | table | Valid sort modes for validation |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/gameplaySelector/tileSorting.lua`.*
