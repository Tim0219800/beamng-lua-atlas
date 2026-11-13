# `editor_heroRoadEditor_placeablesUI`

*Fichier : `lua/ge/extensions/editor/heroRoadEditor/placeablesUI.lua` · VM : Game Engine (GE) · 512 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_heroRoadEditor_placeablesUI` : `extensions.load("editor_heroRoadEditor_placeablesUI")`, puis la globale `editor_heroRoadEditor_placeablesUI`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_heroRoadEditor_placeablesUI.consumeLiveDrag()` | Returns whether a live slider was held last frame, and resets the flag (the tool window is drawn after the drag pipeline<br> runs, so heroRoadEditor reads this at the top of the next frame -- same 1-frame pipeline as its own liveSliderDragging). | 31 |
| `editor_heroRoadEditor_placeablesUI.draw(selGroup, selectedGroupIdx)` | Draws the whole Features tab for the selected road: the unified placeables list, the Add-button row (crossing / repair /<br> pothole / widening / junction / barrier), then the selected item's controls. | 377 |

## Appels vers le moteur (C++)

- `be:` `reloadCollision`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/heroRoadEditor/placeablesUI.lua`.*
