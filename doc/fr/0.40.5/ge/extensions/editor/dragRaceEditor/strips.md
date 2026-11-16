# `editor_dragRaceEditor_strips`

*Fichier : `lua/ge/extensions/editor/dragRaceEditor/strips.lua` · VM : Game Engine (GE) · 1061 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_dragRaceEditor_strips` : `extensions.load("editor_dragRaceEditor_strips")`, puis la globale `editor_dragRaceEditor_strips`

Gère les strips (pistes de drag) dans l'éditeur de drag race. Un strip est un fichier <id>.strip.json du dossier dragstrips du niveau : id, name, description, endCamera, lanes (voies avec waypoints stage/endLine, boundary, zone) et stripZone. Le module charge, sélectionne, crée, supprime et sauvegarde les strips (avec renommage de fichier si l'id change), dessine les panneaux ImGui (liste, détails, éditeur de voie) et l'aperçu 3D (zones, frontières). Il contrôle aussi que les objets de scène attendus (BeamNGWaypoint, feux, afficheurs) existent avec les noms de la convention <stripId>_<type>_<n°voie> et peut renommer ceux qui portent d'anciens noms (Prestagelight_1, display_time_1_r, BlueLight…).

## Remarques

- Les index commencent à 1 ; -1 = aucune sélection. Les champs _filePath et _dirty d'un strip sont internes à l'éditeur.
- selectStrip écrit dans les réglages de drag courants stripId = "/levels/<niveau>/dragstrips/<id>.strip.json" (ou l'id seul sans niveau), désélectionne les réglages et quitte le mode Edit Drag Zone.
- Un nouveau strip (addStrip) contient deux voies, lane_left (blue) et lane_right (red), chacune avec waypoints stage et endLine à la transformation identité ; le strip est _dirty=true.
- La cible d'édition de zone est {type='stripZone', strip} ou {type='laneZone', strip, laneIndex, lane}.
- Boundary : boîte orientée (position, rotation quaternion, scale demi-dimensions) ; drawBoundariesInWorld la dessine avec un coin = pos - (x+y+z) et des arêtes de longueur 2x.
- drawAxisBox est un doublon de lanes.drawAxisBox ; ses triangles sont dessinés avec plusieurs ordres de sommets (face recto/verso).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_dragRaceEditor_strips.addStrip()` | Ajoute un strip par défaut « New Strip » avec deux voies, non sauvegardé, et le sélectionne. | 227 |
| `editor_dragRaceEditor_strips.beginBoundaryDrag(boundary)` | Mémorise la transformation de départ de la boundary dans M.boundaryDragStart. *(interne)* | 945 |
| `editor_dragRaceEditor_strips.draggingBoundary(boundary)` | Pendant le glisser : recopie position, rotation ou scale du gizmo dans la boundary selon le mode, et marque le strip modifié. *(interne)* | 953 |
| `editor_dragRaceEditor_strips.drawAxisBox(corner, x, y, z, clr)` | Dessine en debug une boîte pleine à partir d'un coin et de trois vecteurs d'arête. | 981 |
| `editor_dragRaceEditor_strips.drawBoundariesInWorld()` | Dessine toutes les boundaries des voies du strip sélectionné (magenta si sélectionnée, sinon couleur de la voie). *(interne)* | 1031 |
| `editor_dragRaceEditor_strips.drawLaneEditor()` | Dessine l'éditeur de la voie sélectionnée (infos, waypoints, boundary, zone ; bouton d'édition de zone dans la scène). *(interne)* | 659 |
| `editor_dragRaceEditor_strips.drawStripDetails()` | Dessine l'édition du strip sélectionné (id, nom, description, caméra de fin, zone, liste des voies, état des objets de scène attendus). *(interne)* | 434 |
| `editor_dragRaceEditor_strips.drawStripsList()` | Dessine la section ImGui « Strips » (Add, Remove, Save, Refresh, liste ; entrées modifiées en orange). *(interne)* | 372 |
| `editor_dragRaceEditor_strips.drawStripsPreview()` | Dessine le nom du strip sélectionné à l'origine et ses zones. *(interne)* | 919 |
| `editor_dragRaceEditor_strips.drawZonesInWorld()` | Dessine en debug 3D (mode « faded ») la zone du strip et celles des voies, hors zone en cours d'édition, avec la couleur de la voie. *(interne)* | 894 |
| `editor_dragRaceEditor_strips.editLane(stripIndex, laneIndex)` | Sélectionne un strip et une voie par index et renvoie la voie. | 639 |
| `editor_dragRaceEditor_strips.enableBoundaryGizmo(boundary)` | Place le gizmo d'axes de l'éditeur sur une boundary et branche les callbacks de glisser. | 927 |
| `editor_dragRaceEditor_strips.endBoundaryDrag(boundary)` | Fin du glisser : efface M.boundaryDragStart. *(interne)* | 977 |
| `editor_dragRaceEditor_strips.getAllStrips()` | Renvoie la liste des strips chargés. | 171 |
| `editor_dragRaceEditor_strips.getSelectedLane()` | Renvoie la voie sélectionnée du strip sélectionné. | 651 |
| `editor_dragRaceEditor_strips.getSelectedStrip()` | Renvoie le strip sélectionné. | 192 |
| `editor_dragRaceEditor_strips.getSelectedStripIndex()` | Index (base 1) du strip sélectionné, -1 si aucun. | 184 |
| `editor_dragRaceEditor_strips.hasSavedStrips()` | Indique si au moins un strip a un fichier sur disque et n'est pas modifié. | 175 |
| `editor_dragRaceEditor_strips.loadAllStrips()` | Charge tous les strips du niveau via dragSaveSystem.getAllStrips(), remet _dirty à false et complète _filePath. | 157 |
| `editor_dragRaceEditor_strips.removeSelectedStrip()` | Retire le strip sélectionné de la liste (fichier non supprimé) et ajuste la sélection. | 313 |
| `editor_dragRaceEditor_strips.saveStrip(strip)` | Sauve le strip dans <dossier dragstrips du niveau>/<id>.strip.json via dragSaveSystem.saveStrip. Crée le dossier si besoin et renomme l'ancien fichier si l'id a changé (échec si le nouveau nom existe). | 327 |
| `editor_dragRaceEditor_strips.selectStrip(index)` | Sélectionne un strip (voir notes : met à jour stripId des réglages courants, quitte l'édition de zone, désélectionne les réglages). | 199 |
| `editor_dragRaceEditor_strips.setSelectedStripIndex(index)` | Fixe l'index sélectionné sans effets de bord. | 188 |

### Détail des paramètres

#### `editor_dragRaceEditor_strips.beginBoundaryDrag(boundary)`

Mémorise la transformation de départ de la boundary dans M.boundaryDragStart.

- `boundary` (*table*) : boundary

#### `editor_dragRaceEditor_strips.draggingBoundary(boundary)`

Pendant le glisser : recopie position, rotation ou scale du gizmo dans la boundary selon le mode, et marque le strip modifié.

- `boundary` (*table*) : boundary

#### `editor_dragRaceEditor_strips.drawAxisBox(corner, x, y, z, clr)`

Dessine en debug une boîte pleine à partir d'un coin et de trois vecteurs d'arête.

- `corner` (*vec3*) : coin
- `x` (*vec3*) : arête X
- `y` (*vec3*) : arête Y
- `z` (*vec3*) : arête Z
- `clr` (*ColorF*) : couleur de remplissage

#### `editor_dragRaceEditor_strips.editLane(stripIndex, laneIndex)`

Sélectionne un strip et une voie par index et renvoie la voie.

- `stripIndex` (*integer*) : index du strip (base 1)
- `laneIndex` (*integer*) : index de la voie (base 1)
- **renvoie** : table|nil voie, nil si index hors bornes

#### `editor_dragRaceEditor_strips.enableBoundaryGizmo(boundary)`

Place le gizmo d'axes de l'éditeur sur une boundary et branche les callbacks de glisser.

- `boundary` (*table|nil*) : boundary avec transform {position, rotation, scale}

#### `editor_dragRaceEditor_strips.endBoundaryDrag(boundary)`

Fin du glisser : efface M.boundaryDragStart.

- `boundary` (*table*) : boundary

#### `editor_dragRaceEditor_strips.getAllStrips()`

Renvoie la liste des strips chargés.

- **renvoie** : table tableau de strips

#### `editor_dragRaceEditor_strips.getSelectedLane()`

Renvoie la voie sélectionnée du strip sélectionné.

- **renvoie** : table|nil voie ou nil

#### `editor_dragRaceEditor_strips.getSelectedStrip()`

Renvoie le strip sélectionné.

- **renvoie** : table|nil strip ou nil

#### `editor_dragRaceEditor_strips.getSelectedStripIndex()`

Index (base 1) du strip sélectionné, -1 si aucun.

- **renvoie** : integer index

#### `editor_dragRaceEditor_strips.hasSavedStrips()`

Indique si au moins un strip a un fichier sur disque et n'est pas modifié.

- **renvoie** : boolean résultat

#### `editor_dragRaceEditor_strips.saveStrip(strip)`

Sauve le strip dans <dossier dragstrips du niveau>/<id>.strip.json via dragSaveSystem.saveStrip. Crée le dossier si besoin et renomme l'ancien fichier si l'id a changé (échec si le nouveau nom existe).

- `strip` (*table*) : strip à sauver
- **renvoie** : boolean succès

#### `editor_dragRaceEditor_strips.selectStrip(index)`

Sélectionne un strip (voir notes : met à jour stripId des réglages courants, quitte l'édition de zone, désélectionne les réglages).

- `index` (*integer*) : index base 1

#### `editor_dragRaceEditor_strips.setSelectedStripIndex(index)`

Fixe l'index sélectionné sans effets de bord.

- `index` (*integer*) : index base 1 ou -1

## Appels vers le moteur (C++)

- `FS:` `directoryCreate`, `directoryExists`, `fileExists`, `renameFile`
- `debugDrawer:` `drawLine`, `drawTextAdvanced`, `drawTriSolid`
- `obj:` `setName`
- `scenetree.` `findObject`
- `worldEditorCppApi.` `getAxisGizmoScale`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/dragRaceEditor/strips.lua`.*
