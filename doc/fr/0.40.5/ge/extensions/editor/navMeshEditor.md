# `editor_navMeshEditor`

*Fichier : `lua/ge/extensions/editor/navMeshEditor.lua` · VM : Game Engine (GE) · 979 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_navMeshEditor` : `extensions.load("editor_navMeshEditor")`, puis la globale `editor_navMeshEditor`

Éditeur du navmesh Recast (maillage de navigation de l'IA) dans le World Editor, modelé sur l'éditeur de rivières : un mode d'édition « Navigation Mesh », une barre d'outils, une interaction dans la vue 3D et deux fenêtres (« NavMesh Overview » : grille 2D des tuiles et formes de la tuile courante ; « navMeshTileView »). Six outils : tiles (sélection et verrouillage des tuiles pour qu'une reconstruction ne les change pas), outline (polygone de couverture), areas (volumes convexes typés Exclude/Ground/Road/Sidewalk/Water), links (liaisons hors maillage jump/drop/climb/teleport), test (recherche de chemin A vers B) et crowd (agents IA vivants). Tout est annulable. Il pilote les fonctions C++ navmeshEditor* (navmeshEditorBuild, navmeshEditorSave/Load, navmeshEditorFindPath, navmeshEditorCrowd*, etc.). Le navmesh est enregistré avec le niveau (onEditorAfterSaveLevel) et rechargé à l'ouverture.

## Remarques

- Si la fonction navmeshEditorGetState n'existe pas (moteur sans cette API), la fenêtre affiche « NavMesh engine API not found. Rebuild the game (C++)... » et l'outil est inutilisable.
- Raccourcis : clic gauche = sélectionner/placer, Alt+clic = ajouter un nœud, clic droit = supprimer un nœud ou une liaison. Sans polygone d'outline, tout le niveau est couvert ; avec un outline, le navmesh extérieur est retiré à la construction.
- Types de liaisons (flags) : walk 1, swim 2, jump 4, ledge 8, drop 16, climb 32, teleport 64. Types d'aire : 0 Exclude, 1 Ground, 2 Road, 3 Sidewalk, 4 Water.
- Les paramètres de construction éditables incluent cs, ch, walkableSlopeAngle, walkableHeight/Climb/Radius (en voxels), tileSize, maxEdgeLen, minRegionArea, maxPolysPerTile, etc. (voir CONFIG_FIELDS).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_navMeshEditor.allowGizmo()` | Indique si le gizmo de transformation est autorisé : vrai uniquement quand le mode d'édition courant est « Navigation Mesh ». | 971 |
| `editor_navMeshEditor.onEditorAfterOpenLevel()` | Hook appelé après l'ouverture d'un niveau dans l'éditeur : réinitialise polygones, aires, sélection, tuiles et liaisons ; le navmesh sera rechargé à la prochaine activation du mode. *(interne)* *(hook)* | 964 |
| `editor_navMeshEditor.onEditorAfterSaveLevel()` | Hook appelé après la sauvegarde d'un niveau dans l'éditeur : enregistre le navmesh avec le niveau. *(interne)* *(hook)* | 963 |
| `editor_navMeshEditor.onEditorGui()` | Hook d'éditeur appelé à chaque frame : dessine les fenêtres Overview et vue de tuile quand le mode navmesh est actif (ou le message d'API manquante). *(interne)* *(hook)* | 900 |
| `editor_navMeshEditor.onEditorInitialized()` | Hook appelé à l'initialisation de l'éditeur : enregistre les deux fenêtres, le gestionnaire d'inspecteur « navMesh », le mode d'édition navMeshEditMode et l'entrée de menu « Navigation Mesh » (groupe Gameplay). *(interne)* *(hook)* | 942 |
| `editor_navMeshEditor.show()` | Sélectionne le mode d'édition « Navigation Mesh ». | 920 |

### Détail des paramètres

#### `editor_navMeshEditor.allowGizmo()`

Indique si le gizmo de transformation est autorisé : vrai uniquement quand le mode d'édition courant est « Navigation Mesh ».

- **renvoie** : boolean Vrai si le mode d'édition courant est celui du navmesh.

## Appels vers le moteur (C++)

- `debugDrawer:` `drawLine`, `drawSphere`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/navMeshEditor.lua`.*
