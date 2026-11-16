# `gameplay_rally_notebook_noSelectionPreview`

*Fichier : `lua/ge/extensions/gameplay/rally/notebook/noSelectionPreview.lua` · VM : Game Engine (GE) · 517 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_rally_notebook_noSelectionPreview` : `extensions.load("gameplay_rally_notebook_noSelectionPreview")`, puis la globale `gameplay_rally_notebook_noSelectionPreview`

Aperçu de l'éditeur de notes de rallye (pacenotes) quand aucune note n'est sélectionnée. Loin de la route (au-delà de overviewDistance), dessine toute la route en dégradé arc-en-ciel avec un marqueur par note ; près de la route, dessine seulement la fenêtre autour du point visé par la caméra, avec les étiquettes des notes voisines. Un modèle (points, distances, entrées de notes triées) est mis en cache dans pacenoteToolsState.

## Remarques

- Cache : pacenoteToolsState._noSelectionPreviewModel (invalidé si path, snaproad ou points changent) et _noSelectionPreviewRaycastCache ; invalidate() les supprime tous les deux.
- Écrit pacenoteToolsState._pacenoteLabelRaycastCursorPos (point visé) en vue proche.
- Vue d'ensemble : la route est découpée en au plus 700 segments (overviewMaxRouteSegments). Couleur arc-en-ciel = position le long de la route (0 rouge, 1 bleu).
- opts.labelMode == 'all' affiche toutes les étiquettes ; sinon seules celles des notes autour du pivot (opts.nearCameraCount, défaut 3).
- La recherche du pivot est limitée à overviewDistance * 1.25 autour de la caméra, du dernier pivot et d'un point en avant sur le rayon.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_rally_notebook_noSelectionPreview.draw(path, snaproad, pacenoteToolsState, globalOpacity, prismWidth, drawOnTop, opts)` | Dessine l'aperçu sans sélection (route et notes via pacenote:drawDebugPacenoteNoSelectionRainbow). | 460 |
| `gameplay_rally_notebook_noSelectionPreview.invalidate(pacenoteToolsState)` | Supprime le modèle et le cache de rayon de l'aperçu ; à appeler quand le notebook ou le snaproad change. | 200 |
| `gameplay_rally_notebook_noSelectionPreview.nearWindow(path, snaproad, pacenoteToolsState, opts)` | Renvoie la fenêtre de route proche de la caméra utilisée par la vue proche, sans dessiner. | 490 |

### Détail des paramètres

#### `gameplay_rally_notebook_noSelectionPreview.draw(path, snaproad, pacenoteToolsState, globalOpacity, prismWidth, drawOnTop, opts)`

Dessine l'aperçu sans sélection (route et notes via pacenote:drawDebugPacenoteNoSelectionRainbow).

- `path` (*table*) : Notebook (path.pacenotes.sorted).
- `snaproad` (*table*) : Snaproad.
- `pacenoteToolsState` (*table*) : État de l'outil (sert de cache).
- `globalOpacity` (*number|nil*) : Opacité globale (défaut 1).
- `prismWidth` (*number|nil*) : Largeur des prismes en mètres (défaut 1.945).
- `drawOnTop` (*boolean|nil*) : true pour dessiner sans test de profondeur.
- `opts` (*table|nil*) : {overviewDistance = 650, labelMode = 'all'|autre, nearCameraCount = 3}.
- **renvoie** : boolean true si quelque chose a été dessiné, false si les données sont insuffisantes.

#### `gameplay_rally_notebook_noSelectionPreview.invalidate(pacenoteToolsState)`

Supprime le modèle et le cache de rayon de l'aperçu ; à appeler quand le notebook ou le snaproad change.

- `pacenoteToolsState` (*table|nil*) : État de l'outil.

#### `gameplay_rally_notebook_noSelectionPreview.nearWindow(path, snaproad, pacenoteToolsState, opts)`

Renvoie la fenêtre de route proche de la caméra utilisée par la vue proche, sans dessiner.

- `path` (*table*) : Notebook.
- `snaproad` (*table*) : Snaproad.
- `pacenoteToolsState` (*table*) : État de l'outil.
- `opts` (*table|nil*) : {overviewDistance = 650}.
- **renvoie** : table|nil {startDistance, endDistance, pivotDistance, pivotPos} ou nil (aucune note, caméra trop loin ou données manquantes).

## Appels vers le moteur (C++)

- `debugDrawer:` `drawSquarePrism`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/rally/notebook/noSelectionPreview.lua`.*
