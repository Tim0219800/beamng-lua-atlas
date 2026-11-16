# `editor_rallyEditor_drivelineEditSurface`

*Fichier : `lua/ge/extensions/editor/rallyEditor/drivelineEditSurface.lua` · VM : Game Engine (GE) · 326 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_rallyEditor_drivelineEditSurface` : `extensions.load("editor_rallyEditor_drivelineEditSurface")`, puis la globale `editor_rallyEditor_drivelineEditSurface`

Boîte à outils d'édition de la spline de driveline (ligne de conduite de rallye) pour l'éditeur de rallye. Toutes les fonctions prennent un « host » (la fenêtre qui possède host.drivelineV3, host.selectedNodeIdx, host.dragState, host.path) et une table optionnelle opts de callbacks (onBeforeMutation, onSplineMutated, onCommit, onHistoryRestore, inputBlocked/isInputBlocked, generateFinal). handleSplineInteraction gère la souris : survoler/déplacer un nœud (clic glissé), insérer un nœud sur la courbe, ajouter un nœud au début ou à la fin (le plus proche), supprimer le nœud sélectionné avec la touche Suppr (si plus de 2 nœuds). Chaque modification est enregistrée dans editor.history avec une copie profonde avant/après de la spline (nodes, widths, nmls).

## Remarques

- Un nœud déplacé est recollé à la surface via zSnap.snapDrivelineInPlace (options useRaycast et vertRayRaise des propriétés du driveline).
- La tolérance de sélection d'un nœud au rayon souris est 0.5 + 0.15 × racine(distance caméra) mètres.
- Un nouveau nœud inséré reçoit la largeur drivelineUtil.defaultSplineWidth et la normale moyenne des deux nœuds voisins ; un nœud ajouté en bout reprend la largeur et la normale du nœud d'extrémité.
- saveFinalDriveline échoue (journal E, renvoie false) s'il y a moins de 2 nœuds, pas de host.path ou pas de dossier de mission.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_rallyEditor_drivelineEditSurface.commitSplineEdit(host, actionName, oldSpline, opts)` | Enregistre dans editor.history une action avec l'ancienne spline et une copie de l'actuelle ; l'annulation et le rétablissement appellent onHistoryRestore(host, actionName, 'undo'\|'redo') s'il est fourni. Appelle ensuite opts.onCommit. | 82 |
| `editor_rallyEditor_drivelineEditSurface.createFinalDriveline(host)` | Génère le driveline final à partir de la spline (drivelineV3:createDrivelineFromSpline). | 135 |
| `editor_rallyEditor_drivelineEditSurface.handleSplineInteraction(host, opts)` | À appeler à chaque frame : gère la souris sur la spline (survol, glisser d'un nœud, insertion, ajout, suppression avec Suppr). Ne fait rien si ImGui capture la souris, si l'entrée est bloquée ou si la souris n'est pas sur la carte. | 162 |
| `editor_rallyEditor_drivelineEditSurface.redoSplineEdit(host, data)` | Rétablit une édition : restaure data.new. | 77 |
| `editor_rallyEditor_drivelineEditSurface.refreshSplineGeometry(host, opts)` | Si la spline est sale et a au moins 2 nœuds, recalcule sa géométrie, régénère le driveline final (sauf si opts.generateFinal == false) et appelle onSplineMutated. | 100 |
| `editor_rallyEditor_drivelineEditSurface.restoreSpline(host, saved)` | Remplace le contenu de la spline du host (nodes, widths, nmls) par une copie sauvegardée, la marque sale puis recalcule la géométrie et le driveline final. | 48 |
| `editor_rallyEditor_drivelineEditSurface.saveFinalDriveline(host)` | Enregistre la spline dans un fichier du dossier de mission du carnet de notes (drivelineV3:saveSplineToFile) après vérification des prérequis. | 140 |
| `editor_rallyEditor_drivelineEditSurface.simplifySpline(host, tolerance, opts)` | Simplifie la spline (algorithme Ramer-Douglas-Peucker sur nœuds, largeurs et normales) avec une tolérance, met à jour la géométrie et enregistre l'action « Simplify Spline ». Sans effet avec 2 nœuds ou moins. | 115 |
| `editor_rallyEditor_drivelineEditSurface.undoSplineEdit(host, data)` | Annule une édition : restaure data.old. | 72 |

### Détail des paramètres

#### `editor_rallyEditor_drivelineEditSurface.commitSplineEdit(host, actionName, oldSpline, opts)`

Enregistre dans editor.history une action avec l'ancienne spline et une copie de l'actuelle ; l'annulation et le rétablissement appellent onHistoryRestore(host, actionName, 'undo'|'redo') s'il est fourni. Appelle ensuite opts.onCommit.

- `host` (*table*) : Objet portant drivelineV3.
- `actionName` (*string*) : Nom de l'action d'historique.
- `oldSpline` (*table*) : Copie de la spline avant modification.
- `opts` (*table|nil*) : Callbacks optionnels.

#### `editor_rallyEditor_drivelineEditSurface.createFinalDriveline(host)`

Génère le driveline final à partir de la spline (drivelineV3:createDrivelineFromSpline).

- `host` (*table*) : Objet portant drivelineV3.
- **renvoie** : boolean Résultat de la génération ; false si host.drivelineV3 est absent.

#### `editor_rallyEditor_drivelineEditSurface.handleSplineInteraction(host, opts)`

À appeler à chaque frame : gère la souris sur la spline (survol, glisser d'un nœud, insertion, ajout, suppression avec Suppr). Ne fait rien si ImGui capture la souris, si l'entrée est bloquée ou si la souris n'est pas sur la carte.

- `host` (*table*) : Objet portant drivelineV3 (spline.nodes/widths/nmls, updateSplineGeometry…), selectedNodeIdx, dragState, deletePressed.
- `opts` (*table|nil*) : Callbacks : onBeforeMutation, onSplineMutated, onCommit, onHistoryRestore, inputBlocked, isInputBlocked, generateFinal.

#### `editor_rallyEditor_drivelineEditSurface.redoSplineEdit(host, data)`

Rétablit une édition : restaure data.new.

- `host` (*table*) : Objet portant drivelineV3.
- `data` (*table|nil*) : Données d'action {old, new}.

#### `editor_rallyEditor_drivelineEditSurface.refreshSplineGeometry(host, opts)`

Si la spline est sale et a au moins 2 nœuds, recalcule sa géométrie, régénère le driveline final (sauf si opts.generateFinal == false) et appelle onSplineMutated.

- `host` (*table*) : Objet portant drivelineV3.
- `opts` (*table|nil*) : Callbacks optionnels.
- **renvoie** : boolean true si la géométrie a été mise à jour.

#### `editor_rallyEditor_drivelineEditSurface.restoreSpline(host, saved)`

Remplace le contenu de la spline du host (nodes, widths, nmls) par une copie sauvegardée, la marque sale puis recalcule la géométrie et le driveline final.

- `host` (*table*) : Objet portant drivelineV3.
- `saved` (*table*) : Spline sauvegardée {nodes, widths, nmls} (par drivelineV3:deepCopySpline).

#### `editor_rallyEditor_drivelineEditSurface.saveFinalDriveline(host)`

Enregistre la spline dans un fichier du dossier de mission du carnet de notes (drivelineV3:saveSplineToFile) après vérification des prérequis.

- `host` (*table*) : Objet portant drivelineV3 et path (avec getMissionDir()).
- **renvoie** : boolean true si la sauvegarde a réussi.

#### `editor_rallyEditor_drivelineEditSurface.simplifySpline(host, tolerance, opts)`

Simplifie la spline (algorithme Ramer-Douglas-Peucker sur nœuds, largeurs et normales) avec une tolérance, met à jour la géométrie et enregistre l'action « Simplify Spline ». Sans effet avec 2 nœuds ou moins.

- `host` (*table*) : Objet portant drivelineV3.
- `tolerance` (*number*) : Tolérance de simplification (mètres, déduit du code).
- `opts` (*table|nil*) : Callbacks optionnels.
- **renvoie** : boolean true si la spline a été simplifiée.

#### `editor_rallyEditor_drivelineEditSurface.undoSplineEdit(host, data)`

Annule une édition : restaure data.old.

- `host` (*table*) : Objet portant drivelineV3.
- `data` (*table|nil*) : Données d'action {old, new}.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/rallyEditor/drivelineEditSurface.lua`.*
