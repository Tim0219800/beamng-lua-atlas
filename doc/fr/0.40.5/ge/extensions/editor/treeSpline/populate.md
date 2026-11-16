# `editor_treeSpline_populate`

*Fichier : `lua/ge/extensions/editor/treeSpline/populate.lua` · VM : Game Engine (GE) · 96 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_treeSpline_populate` : `extensions.load("editor_treeSpline_populate")`, puis la globale `editor_treeSpline_populate`

Sous-module de l'outil Tree Spline de l'éditeur : plante ou retire les arbres (instances Forest) le long d'une spline. S'appuie sur editor/toolUtilities/foliageScatter (scatterLine, removeItems, ensureForest) et editor/toolUtilities/occupancy (masque d'exclusion). Les instances plantées sont stockées dans spline.items et spline.count.

## Remarques

- populateTreeSpline ne plante rien (et vide la liste) si spline.divPoints a moins de 2 points.
- Le masque d'occupation n'est utilisé que si spline.avoidInfrastructure est vrai ; sans masque construit, il n'a aucun effet.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_treeSpline_populate.adopt(spline, kept)` | Reprend les arbres rendus par release() qui existent encore dans la Forest (retrouvés par clé et position) et met à jour spline.items / spline.count. | 78 |
| `editor_treeSpline_populate.populateTreeSpline(spline)` | (Re)plante la spline : supprime ses anciennes instances puis répartit une nouvelle rangée régulière le long de la ligne centrale (divPoints, binormals) selon les paramètres de feuillage (species, speciesWeights, spacingM, posVariance, scaleVariance, alignToNormal, slopeMaxDeg, seed). Remplit spline.items et spline.count. | 31 |
| `editor_treeSpline_populate.release(spline)` | Utilisé lors d'un rechargement Lua : l'outil lâche les arbres d'une spline verrouillée sans les supprimer (ils appartiennent au niveau) et renvoie leurs clés et positions pour adopt(). | 67 |
| `editor_treeSpline_populate.tryRemove(spline)` | Retire de la Forest les instances précédemment plantées pour cette spline, puis vide spline.items et remet spline.count à 0. Sans effet si spline ou spline.items est nil. | 21 |

### Détail des paramètres

#### `editor_treeSpline_populate.adopt(spline, kept)`

Reprend les arbres rendus par release() qui existent encore dans la Forest (retrouvés par clé et position) et met à jour spline.items / spline.count.

- `spline` (*table*) : Spline qui récupère ses arbres.
- `kept` (*table*) : Liste renvoyée par release().

#### `editor_treeSpline_populate.populateTreeSpline(spline)`

(Re)plante la spline : supprime ses anciennes instances puis répartit une nouvelle rangée régulière le long de la ligne centrale (divPoints, binormals) selon les paramètres de feuillage (species, speciesWeights, spacingM, posVariance, scaleVariance, alignToNormal, slopeMaxDeg, seed). Remplit spline.items et spline.count.

- `spline` (*table*) : Spline d'arbres avec ses paramètres de feuillage.

#### `editor_treeSpline_populate.release(spline)`

Utilisé lors d'un rechargement Lua : l'outil lâche les arbres d'une spline verrouillée sans les supprimer (ils appartiennent au niveau) et renvoie leurs clés et positions pour adopt().

- `spline` (*table*) : Spline verrouillée.
- **renvoie** : table Liste de {clé, x, y, z} pour chaque arbre conservé.

#### `editor_treeSpline_populate.tryRemove(spline)`

Retire de la Forest les instances précédemment plantées pour cette spline, puis vide spline.items et remet spline.count à 0. Sans effet si spline ou spline.items est nil.

- `spline` (*table*) : Spline d'arbres (champs items, count).

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/treeSpline/populate.lua`.*
