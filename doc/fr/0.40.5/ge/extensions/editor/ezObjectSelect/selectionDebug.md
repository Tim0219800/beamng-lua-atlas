# `editor_ezObjectSelect_selectionDebug`

*Fichier : `lua/ge/extensions/editor/ezObjectSelect/selectionDebug.lua` · VM : Game Engine (GE) · 284 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_ezObjectSelect_selectionDebug` : `extensions.load("editor_ezObjectSelect_selectionDebug")`, puis la globale `editor_ezObjectSelect_selectionDebug`

Dessin de debug et de retour visuel de l'outil Easy Select dans le monde 3D (debugDrawer) : boîtes des objets découverts, de la pile de candidats, de l'objet choisi, des objets sélectionnés ou en cours de glisser, objets filtrés car trop grands, axes de la sélection (X rouge, Y vert, Z bleu) et anneau de distance maximale autour de la caméra. Le dessin 2D de debug est délégué au module selectionScreenDebug.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_ezObjectSelect_selectionDebug.drawScreen(snapshot, options)` | Délègue à selectionScreenDebug.draw(snapshot, options) le debug en overlay 2D. | 275 |
| `editor_ezObjectSelect_selectionDebug.drawWorld(snapshot, options)` | Dessine dans le monde les boîtes et axes décrits par le snapshot de sélection et les options. Les boîtes sont tracées en lignes si options.outlineMode == 1 (sinon remplies). | 177 |
| `editor_ezObjectSelect_selectionDebug.reset()` | Réinitialise l'état de selectionScreenDebug. | 279 |

### Détail des paramètres

#### `editor_ezObjectSelect_selectionDebug.drawScreen(snapshot, options)`

Délègue à selectionScreenDebug.draw(snapshot, options) le debug en overlay 2D.

- `snapshot` (*table|nil*) : Snapshot
- `options` (*table*) : Options

#### `editor_ezObjectSelect_selectionDebug.drawWorld(snapshot, options)`

Dessine dans le monde les boîtes et axes décrits par le snapshot de sélection et les options. Les boîtes sont tracées en lignes si options.outlineMode == 1 (sinon remplies).

- `snapshot` (*table|nil*) : État de sélection : discovery, candidates, pick, filteredLarge, camera
- `options` (*table*) : outlineMode, selectedIds, draggingIds, depthTest, dragDepthTest, selectedDepthTest, showFilteredLarge, debugEnabled, maxDiscoveryOutlines, maxStackOutlines, showSelectionAxes, axisLocal, axisLengthScale, axisLineWidth, showDistanceRing, maxDistance

## Appels vers le moteur (C++)

- `debugDrawer:` `drawLineInstance`, `drawTextAdvanced`, `drawTriSolid`
- `obj:` `getPosition`, `getTransform`, `getWorldBox`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/ezObjectSelect/selectionDebug.lua`.*
