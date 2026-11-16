# `editor_meshSpline_populate`

*Fichier : `lua/ge/extensions/editor/meshSpline/populate.lua` · VM : Game Engine (GE) · 508 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_meshSpline_populate` : `extensions.load("editor_meshSpline_populate")`, puis la globale `editor_meshSpline_populate`

Placement des meshes statiques le long d'une mesh spline. À partir de la géométrie de la spline, il échantillonne des positions (période = longueur du mesh + espacement, plancher de 10 % de la longueur ou 0.1 m), choisit les composants (mesh central, capuchons, alias), gère des réserves (pools) de TSStatic dans le dossier de scène de la spline, applique jitter, décalage vertical et rotation, et synchronise l'état verrouillé. Une spline est « discrète » (lampadaires, espacement > 5 m) ou « en tuilage » (barrières bout à bout).

## Remarques

- Un espacement négatif crée un recouvrement ; la période est plancher à max(0.1 m, 10 % de la longueur du mesh) pour éviter un nombre d'instances démesuré.
- Le « Lock ends » (isFixedEnds) ne s'applique qu'aux splines discrètes (spacing > 5) : un élément est posé aux deux extrémités et l'intérieur est réparti uniformément.
- La graine aléatoire est fixée par spline (splineRandomSeed) : le placement est reproductible.
- Une spline verrouillée (isEnabled = false) dont les meshes existent n'est plus déplacée par l'outil, seul son état de verrou est appliqué.
- Le module garde l'état interne (staticMeshes par id de spline) : release/adopt servent à survivre à un rechargement Lua sans détruire les meshes.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_meshSpline_populate.adopt(spline, ids)` | Reprend les meshes lâchés par release() (ceux encore dans la scène), tels quels, et mémorise l'état de verrou de la spline. *(interne)* | 464 |
| `editor_meshSpline_populate.eachObject(spline, fn)` | Appelle fn(mesh, true) pour chaque mesh que l'outil détient pour cette spline (le « each » de splineLock). | 252 |
| `editor_meshSpline_populate.evenFitInfo(spline)` | Pour l'étiquette « Lock ends » : renvoie l'espacement centre à centre effectif (m) et le nombre d'intervalles que produirait l'ajustement uniforme, soit n = max(1, round(longueur / période)) et longueur / n. Renvoie nil si le calcul est impossible (moins de 2 points, pas de longueur de mesh). | 487 |
| `editor_meshSpline_populate.isDiscreteSpline(spline)` | Dit si la spline est « discrète » (éléments posés sur les points d'échantillonnage, comme des lampadaires) plutôt qu'en tuilage : vrai si spacing dépasse 5 m. L'interface s'en sert pour afficher l'option « Lock ends ». | 480 |
| `editor_meshSpline_populate.minSpacingFor(spline)` | Plancher du curseur « Spacing » pour cette pièce : la valeur qui atteint la période minimale autorisée (recouvrement maximal). En dessous, la période serait de toute façon bornée. | 65 |
| `editor_meshSpline_populate.populateMeshSpline(spline, splineIdx)` | Peuple la spline avec des instances de mesh statique sur sa longueur : échantillonne, répartit les composants, ajuste les réserves de meshes puis positionne et oriente chaque instance. Sort sans rien faire si la spline est verrouillée avec ses meshes, si la longueur ou le chemin du mesh central manque, ou si moins de 2 points subdivisés. | 294 |
| `editor_meshSpline_populate.release(spline)` | Pour un rechargement Lua : l'outil lâche les meshes d'une spline verrouillée sans les supprimer (ils appartiennent au niveau) et renvoie leurs ids par composant, pour adopt(). *(interne)* | 449 |
| `editor_meshSpline_populate.tryRemove(spline)` | Supprime de la scène les meshes statiques de la spline (s'ils existent encore) et oublie leur état. | 429 |

### Détail des paramètres

#### `editor_meshSpline_populate.adopt(spline, ids)`

Reprend les meshes lâchés par release() (ceux encore dans la scène), tels quels, et mémorise l'état de verrou de la spline.

- `spline` (*table*) : Mesh spline.
- `ids` (*table<string, integer[]>*) : Table renvoyée par release().

#### `editor_meshSpline_populate.eachObject(spline, fn)`

Appelle fn(mesh, true) pour chaque mesh que l'outil détient pour cette spline (le « each » de splineLock).

- `spline` (*table*) : Mesh spline.
- `fn` (*function*) : Callback appelé avec le mesh et true.

#### `editor_meshSpline_populate.evenFitInfo(spline)`

Pour l'étiquette « Lock ends » : renvoie l'espacement centre à centre effectif (m) et le nombre d'intervalles que produirait l'ajustement uniforme, soit n = max(1, round(longueur / période)) et longueur / n. Renvoie nil si le calcul est impossible (moins de 2 points, pas de longueur de mesh).

- `spline` (*table|nil*) : Mesh spline.
- **renvoie** : number|nil Espacement effectif en mètres.
- **renvoie** : integer|nil Nombre d'intervalles.

#### `editor_meshSpline_populate.isDiscreteSpline(spline)`

Dit si la spline est « discrète » (éléments posés sur les points d'échantillonnage, comme des lampadaires) plutôt qu'en tuilage : vrai si spacing dépasse 5 m. L'interface s'en sert pour afficher l'option « Lock ends ».

- `spline` (*table|nil*) : Mesh spline.
- **renvoie** : boolean|nil true/false, ou nil/false si la spline ou son spacing est absent.

#### `editor_meshSpline_populate.minSpacingFor(spline)`

Plancher du curseur « Spacing » pour cette pièce : la valeur qui atteint la période minimale autorisée (recouvrement maximal). En dessous, la période serait de toute façon bornée.

- `spline` (*table*) : Mesh spline avec extentsL_Center / extentsW_Center et rot.
- **renvoie** : number|nil Espacement minimal en mètres, nil si la longueur du mesh n'est pas encore mesurée.

#### `editor_meshSpline_populate.populateMeshSpline(spline, splineIdx)`

Peuple la spline avec des instances de mesh statique sur sa longueur : échantillonne, répartit les composants, ajuste les réserves de meshes puis positionne et oriente chaque instance. Sort sans rien faire si la spline est verrouillée avec ses meshes, si la longueur ou le chemin du mesh central manque, ou si moins de 2 points subdivisés.

- `spline` (*table*) : Mesh spline à peupler.
- `splineIdx` (*integer*) : Indice de la spline dans la liste (base 1).

#### `editor_meshSpline_populate.release(spline)`

Pour un rechargement Lua : l'outil lâche les meshes d'une spline verrouillée sans les supprimer (ils appartiennent au niveau) et renvoie leurs ids par composant, pour adopt().

- `spline` (*table*) : Mesh spline verrouillée.
- **renvoie** : table<string, integer[]> Ids des meshes par identifiant de composant.

#### `editor_meshSpline_populate.tryRemove(spline)`

Supprime de la scène les meshes statiques de la spline (s'ils existent encore) et oublie leur état.

- `spline` (*table*) : Mesh spline.

## Appels vers le moteur (C++)

- `Sim.` `getUniqueName`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/meshSpline/populate.lua`.*
