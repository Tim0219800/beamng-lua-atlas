# `editor_decalSpline_populate`

*Fichier : `lua/ge/extensions/editor/decalSpline/populate.lua` · VM : Game Engine (GE) · 379 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_decalSpline_populate` : `extensions.load("editor_decalSpline_populate")`, puis la globale `editor_decalSpline_populate`

Module qui peuple une spline de decals avec des instances de decals (DecalData + instances du moteur) le long de sa longueur, pour l'outil Decal Spline. Il échantillonne la spline par abscisse curviligne avec un pas de (4.0 m de longueur de decal + spline.spacing), répartit les composants (matériaux) en alternance ou au hasard selon leur probabilité, oriente chaque decal avec le repère de Frenet, jitter sur Z et rotation préalable, et le place au milieu de sa cellule. Il maintient les templates DecalData partagés dans un SimGroup « DecalSpline - Templates … » sous MissionGroup, avec des compteurs d'instances pour supprimer un template devenu inutile.

## Remarques

- Longueur supposée d'un decal : 4.0 m (constante decalLength). Les decals sont des quads centrés.
- Les templates sont enregistrés auprès de scenetree.decalPersistMan (fichier editor.getDecalDataFilePath()) pour être sauvegardés.
- Les instances sont créées avec editor.addDecalInstanceWithTan(position, haut, tangente, template, échelle, frame, 3, 1).
- Si le dossier de templates n'existe plus, populateDecalSpline le recrée et efface d'abord les decals de toutes les splines passées dans splines, puis réinitialise les tables internes.
- Une spline avec moins de 2 divPoints n'est pas peuplée.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_decalSpline_populate.adopt(spline, kept)` | Reprend les decals libérés par release() encore présents dans la scène (retrouvés par uid via Engine.Render.DecalMgr), avec leurs templates et leur dossier, et rétablit les compteurs. | 291 |
| `editor_decalSpline_populate.hasAny(spline)` | Indique si l'outil détient des decals pour cette spline. | 265 |
| `editor_decalSpline_populate.populateDecalSpline(spline, splines)` | Crée les instances de decals le long de la spline, avec création des templates DecalData au besoin (texRows, texCols, material). | 171 |
| `editor_decalSpline_populate.propagateRowsCols(spline, componentIdx)` | Quand lignes/colonnes (numRows/numCols) changent pour un composant, copie ces valeurs dans les autres composants qui utilisent le même matériau et borne leur frame à numRows*numCols-1. | 313 |
| `editor_decalSpline_populate.release(spline)` | Pour un rechargement Lua : lâche les decals d'une spline verrouillée sans les supprimer et renvoie leurs uid par matériau, avec les templates utilisés et l'id du dossier, pour que adopt() puisse les reprendre. Leurs templates restent comptés. | 275 |
| `editor_decalSpline_populate.removeFolder()` | Supprime le dossier (SimGroup) des templates partagés, sauf si des decals conservés par une spline verrouillée lors d'un rechargement Lua l'utilisent encore. | 160 |
| `editor_decalSpline_populate.tryRemove(spline)` | Supprime de la scène les instances de decals de la spline (editor.deleteDecalInstance), décrémente les compteurs puis supprime les templates dont le compteur tombe sous 1. | 129 |

### Détail des paramètres

#### `editor_decalSpline_populate.adopt(spline, kept)`

Reprend les decals libérés par release() encore présents dans la scène (retrouvés par uid via Engine.Render.DecalMgr), avec leurs templates et leur dossier, et rétablit les compteurs.

- `spline` (*table*) : spline qui reprend ses decals
- `kept` (*table*) : table renvoyée par release()

#### `editor_decalSpline_populate.hasAny(spline)`

Indique si l'outil détient des decals pour cette spline.

- `spline` (*table*) : spline testée
- **renvoie** : boolean true s'il existe au moins une instance

#### `editor_decalSpline_populate.populateDecalSpline(spline, splines)`

Crée les instances de decals le long de la spline, avec création des templates DecalData au besoin (texRows, texCols, material).

- `spline` (*table*) : spline de decals (divPoints, tangents, normals, spacing, jitter, composants 1 à 4…)
- `splines` (*table[]*) : toutes les splines, nettoyées si le dossier de templates doit être recréé

#### `editor_decalSpline_populate.propagateRowsCols(spline, componentIdx)`

Quand lignes/colonnes (numRows/numCols) changent pour un composant, copie ces valeurs dans les autres composants qui utilisent le même matériau et borne leur frame à numRows*numCols-1.

- `spline` (*table*) : spline modifiée
- `componentIdx` (*integer*) : numéro du composant modifié, de 1 à 4

#### `editor_decalSpline_populate.release(spline)`

Pour un rechargement Lua : lâche les decals d'une spline verrouillée sans les supprimer et renvoie leurs uid par matériau, avec les templates utilisés et l'id du dossier, pour que adopt() puisse les reprendre. Leurs templates restent comptés.

- `spline` (*table*) : spline verrouillée
- **renvoie** : table {folderId, uids = {matériau = uid[]}, templates = {matériau = id}}

#### `editor_decalSpline_populate.tryRemove(spline)`

Supprime de la scène les instances de decals de la spline (editor.deleteDecalInstance), décrémente les compteurs puis supprime les templates dont le compteur tombe sous 1.

- `spline` (*table*) : spline dont on retire les decals

## Appels vers le moteur (C++)

- `Engine.` `generateUUID`
- `Sim.` `getUniqueName`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/decalSpline/populate.lua`.*
