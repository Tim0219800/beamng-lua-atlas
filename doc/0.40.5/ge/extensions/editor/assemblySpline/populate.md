# `editor_assemblySpline_populate`

*Fichier : `lua/ge/extensions/editor/assemblySpline/populate.lua` · VM : Game Engine (GE) · 538 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_assemblySpline_populate` : `extensions.load("editor_assemblySpline_populate")`, puis la globale `editor_assemblySpline_populate`

Place dans le niveau les meshes TSStatic d'une assembly spline : à partir de la géométrie de la spline (divPoints, tangentes, normales), de la molécule et de la carte de distribution (distribution.computeMeshMap), il positionne les rigides le long de la courbe (espacement, décalage vertical, affaissement, rotation préalable, jitter, graine aléatoire) et étire/oriente les ponts entre deux rigides. Les meshes sont rangés dans des pools par spline et par chemin de mesh pour être réutilisés, et sont enfants du SimGroup de la spline. Gère aussi l'état verrouillé (splineLock) : une spline verrouillée dont les meshes existent n'est pas replacée.

## Remarques

- Constante : minSpacingBetweenMolecules = 3.0 m.
- release/adopt servent au rechargement Lua : une spline verrouillée garde ses meshes dans la scène ; release renvoie leurs ids par chemin de mesh et adopt les reprend.
- Les ponts sont mis à l'échelle en X pour couvrir la distance entre rigides et en Z pour l'affaissement (sag) voulu par l'utilisateur.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_assemblySpline_populate.adopt(spline, ids)` | Reprend les meshes lâchés par release (ceux encore présents dans la scène) tels quels et mémorise l'état de verrouillage. | 516 |
| `editor_assemblySpline_populate.eachObject(spline, fn)` | Appelle fn(mesh, true) pour chaque mesh que l'outil détient pour la spline (le « each » de splineLock). | 54 |
| `editor_assemblySpline_populate.populateAssemblySpline(spline, splineIdx, molecule)` | Met la spline à jour dans la scène. Si la spline est verrouillée (isEnabled faux) et que ses meshes existent, applique seulement l'état de verrouillage sans les déplacer ; sinon (re)place tous les meshes. | 490 |
| `editor_assemblySpline_populate.release(spline)` | Rechargement Lua : l'outil lâche les meshes d'une spline verrouillée sans les supprimer (ils font partie du niveau) et renvoie leurs ids par chemin de mesh. | 500 |
| `editor_assemblySpline_populate.tryRemove(spline)` | Supprime tous les meshes de la spline (objets de la scène et pools) et oublie son état de verrouillage appliqué. | 460 |

### Détail des paramètres

#### `editor_assemblySpline_populate.adopt(spline, ids)`

Reprend les meshes lâchés par release (ceux encore présents dans la scène) tels quels et mémorise l'état de verrouillage.

- `spline` (*table*) : Assembly spline.
- `ids` (*table<string, integer[]>*) : Résultat de release.

#### `editor_assemblySpline_populate.eachObject(spline, fn)`

Appelle fn(mesh, true) pour chaque mesh que l'outil détient pour la spline (le « each » de splineLock).

- `spline` (*table*) : Assembly spline.
- `fn` (*function*) : Callback fn(mesh, true).

#### `editor_assemblySpline_populate.populateAssemblySpline(spline, splineIdx, molecule)`

Met la spline à jour dans la scène. Si la spline est verrouillée (isEnabled faux) et que ses meshes existent, applique seulement l'état de verrouillage sans les déplacer ; sinon (re)place tous les meshes.

- `spline` (*table*) : Assembly spline.
- `splineIdx` (*integer*) : Index de la spline.
- `molecule` (*table*) : Molécule (spline.moleculeDescription).

#### `editor_assemblySpline_populate.release(spline)`

Rechargement Lua : l'outil lâche les meshes d'une spline verrouillée sans les supprimer (ils font partie du niveau) et renvoie leurs ids par chemin de mesh.

- `spline` (*table*) : Assembly spline.
- **renvoie** : table<string, integer[]> Ids des meshes par meshPath.

#### `editor_assemblySpline_populate.tryRemove(spline)`

Supprime tous les meshes de la spline (objets de la scène et pools) et oublie son état de verrouillage appliqué.

- `spline` (*table*) : Assembly spline.

## Appels vers le moteur (C++)

- `Engine.` `generateUUID`
- `obj:` `delete`, `getField`, `registerObject`, `setField`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/assemblySpline/populate.lua`.*
