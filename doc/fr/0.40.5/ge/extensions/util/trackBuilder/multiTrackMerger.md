# `util_trackBuilder_multiTrackMerger`

*Fichier : `lua/ge/extensions/util/trackBuilder/multiTrackMerger.lua` · VM : Game Engine (GE) · 367 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `util_trackBuilder_multiTrackMerger` : `extensions.load("util_trackBuilder_multiTrackMerger")`, puis la globale `util_trackBuilder_multiTrackMerger`

Construit le mesh de raccord (intersection) entre plusieurs segments de piste du Track Builder qui se rejoignent à un même point. Il prend l'extrémité de chaque segment, relie les extrémités consécutives par des courbes de Bézier (bords), génère pour chacune une pseudo-segment (centre 'halfRegular' + bordure) à l'aide de basicCenters et basicBorders, ajoute un remplissage central s'il y a plus de deux segments, puis crée un objet ProceduralMesh dans MissionGroup.

## Remarques

- setReferences doit être appelé avant mergeMultiTrack : il injecte les modules basicCenters et basicBorders (list.basicCenters, list.basicBorders) ; sinon l'appel échoue sur des références nil.
- mergeMultiTrack dessine des sphères de débogage (debugDrawer:drawSphere rouge pour chaque extrémité, verte pour le centre) au moment de l'appel.
- Le nom de l'objet est 'procMerger-' suivi de [r]index x sub de chaque segment ; un nom identique pour la même intersection peut entrer en conflit.
- L'objet créé a canSave = false.
- Chaque entrée de segments est une table {segment, reverse, index, sub} ; si reverse est vrai, le premier point est utilisé avec orientation, bank et pitch inversés.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `util_trackBuilder_multiTrackMerger.mergeMultiTrack(segments, centerMat, borderMat, borderMesh)` | Crée l'objet ProceduralMesh qui raccorde les segments donnés. Matériaux par défaut : 'track_editor_A_center', 'track_editor_A_border', bordure 'regular'. | 352 |
| `util_trackBuilder_multiTrackMerger.setMaterials(intersection, centerMat, borderMat)` | Change les matériaux d'un raccord déjà créé : un matériau de centre par segment, un de bordure par segment, et le matériau de remplissage s'il y a plus de deux segments. | 338 |
| `util_trackBuilder_multiTrackMerger.setReferences(list)` | Enregistre les modules dont ce fichier dépend. *(interne)* | 360 |

### Détail des paramètres

#### `util_trackBuilder_multiTrackMerger.mergeMultiTrack(segments, centerMat, borderMat, borderMesh)`

Crée l'objet ProceduralMesh qui raccorde les segments donnés. Matériaux par défaut : 'track_editor_A_center', 'track_editor_A_border', bordure 'regular'.

- `segments` (*table[]*) : Liste d'entrées {segment, reverse, index, sub} décrivant les extrémités à raccorder.
- `centerMat` (*string|nil*) : Matériau du centre.
- `borderMat` (*string|nil*) : Matériau de la bordure.
- `borderMesh` (*string|nil*) : Nom du profil de bordure (voir basicBorders).
- **renvoie** : userdata L'objet ProceduralMesh créé.

#### `util_trackBuilder_multiTrackMerger.setMaterials(intersection, centerMat, borderMat)`

Change les matériaux d'un raccord déjà créé : un matériau de centre par segment, un de bordure par segment, et le matériau de remplissage s'il y a plus de deux segments.

- `intersection` (*table*) : Table contenant .segments (liste) et .obj (le ProceduralMesh renvoyé par mergeMultiTrack).
- `centerMat` (*string|nil*) : Matériau du centre ; ignoré si nil.
- `borderMat` (*string|nil*) : Matériau de la bordure ; ignoré si nil.

#### `util_trackBuilder_multiTrackMerger.setReferences(list)`

Enregistre les modules dont ce fichier dépend.

- `list` (*table*) : Table {basicCenters = module, basicBorders = module}.

## Appels vers le moteur (C++)

- `debugDrawer:` `drawLine`, `drawSphere`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/util/trackBuilder/multiTrackMerger.lua`.*
