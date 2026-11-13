# `ui_apps_minimap_minimap`

*Fichier : `lua/ge/extensions/ui/apps/minimap/minimap.lua` · VM : Game Engine (GE) · 854 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_apps_minimap_minimap` : `extensions.load("ui_apps_minimap_minimap")`, puis la globale `ui_apps_minimap_minimap`

**Dépendances (chargées avant) :** `ui_apps_minimap_topomap`, `ui_apps_minimap_additionalInfo`, `ui_apps_minimap_route`, `ui_apps_minimap_utils`, `ui_apps_minimap_roads`, `ui_apps_minimap_vehicles`, `gameplay_playmodeMarkers`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_apps_minimap_minimap.drawDebugOverlay()` |  | 720 |
| `ui_apps_minimap_minimap.drawOcclusion(offsetX, offsetY)` |  | 668 |
| `ui_apps_minimap_minimap.getDebugSettingsData()` | Getter for debugSettingsData | 832 |
| `ui_apps_minimap_minimap.getMode()` |  | 747 |
| `ui_apps_minimap_minimap.getScale()` |  | 41 |
| `ui_apps_minimap_minimap.hide()` |  | 812 |
| `ui_apps_minimap_minimap.onClientEndMission()` | *(hook)* | 836 |
| `ui_apps_minimap_minimap.onClientStartMission()` | *(hook)* | 844 |
| `ui_apps_minimap_minimap.onInit()` | *(hook)* | 11 |
| `ui_apps_minimap_minimap.onMinimapSettingsChanged(m)` | *(hook)* | 758 |
| `ui_apps_minimap_minimap.resetOcclusionTransform(id)` |  | 803 |
| `ui_apps_minimap_minimap.setBuffers(left, right, top, bottom)` | Function to set custom buffers for each direction | 771 |
| `ui_apps_minimap_minimap.setDrawTransform(x, y, width, height)` |  | 778 |
| `ui_apps_minimap_minimap.setOcclusionTransform(id, x, y, width, height)` |  | 795 |
| `ui_apps_minimap_minimap.toggledebugSettings()` |  | 820 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table |  |
| `onUpdate` | nil |  |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onDrawOnMinimap` — écouté par 2 module(s)
- `onUpdate` — écouté par 186 module(s)

## Appels vers le moteur (C++)

- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/apps/minimap/minimap.lua`.*
