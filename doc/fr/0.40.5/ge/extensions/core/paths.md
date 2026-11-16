# `core_paths`

*Fichier : `lua/ge/extensions/core/paths.lua` · VM : Game Engine (GE) · 530 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `core_paths` : `extensions.load("core_paths")`, puis la globale `core_paths`

Extension GE `core_paths` : gestion des chemins de caméra (fichiers *.camPath.json) utilisés par la caméra 'path' et par l'éditeur de trajectoires. Elle charge, crée, sauvegarde et supprime des chemins, les joue via core_camera, et fournit l'évaluation des pistes de transformation (position, orientation, FOV) avec courbes de Bézier temporelles. Au démarrage d'un niveau, elle charge tous les camPaths du dossier `camPaths` à côté du fichier de niveau.

## Exemple

```lua
local p = core_paths.loadPath('/levels/gridmap_v2/camPaths/intro.camPath.json')
if p then core_paths.playPath(p, 0) end
-- plus tard
core_paths.stopCurrentPath()
```

## Remarques

- Un chemin est une table { name, markers = {...}, looped, loopTime, filename, id, dirty, manualFov, transformTracks, advancedMode, replay }. Chaque marker a pos (vec3), rot (quat), time, fov, positionSmooth, bullettime, cut, movingStart, movingEnd, trackPosition, attachToVehicle, trackOffset, plus les familles Bézier <prefix>In/Out/InTime/OutTime.
- À la sauvegarde, pos et rot sont convertis en tables {x,y,z[,w]}, la version écrite est "6", et les valeurs par défaut (positionSmooth 0.5, Bézier 1 et 1/3, bullettime 1) sont retirées pour garder des fichiers compacts. savePath ne gère pas marker.pos ou marker.rot nil.
- loadPath réutilise un chemin déjà chargé avec le même `filename`. Il inverse le signe d'un quaternion si le produit scalaire avec le précédent est négatif (évite le chemin long). Il ne vérifie pas que `markers` existe dans le JSON.
- Les pistes de transformation (transformTracks) sont des listes de clés { t, v, slopeIn, slopeOut, timeIn, timeOut } par canal (voir transformChannels). Les angles yaw et roll sont en degrés, interpolés par le plus court chemin lors du bouclage.
- Une marque `cut` est un saut net : les clés avant et après la coupure ne sont pas interpolées entre elles.
- getPath (ancien, nommé getPath_Deprecated dans le code) lit un objet SimPath de la scène, pas un fichier camPath ; sans argument il prend le premier SimPath. Il ne renvoie rien si aucun SimPath n'existe. Boucle `for i = 0, res.nodeCount` : parcourt un indice de plus que le nombre de nœuds (déduit du code).
- onClientStartMission : remplace la liste des chemins ; les doublons de nom reçoivent un suffixe '(n)'. Elle plante si loadPath renvoie nil pour un fichier (path.name sur nil).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `core_paths.addPath(path)` | Ajoute un chemin à la liste et lui attribue le plus petit id libre (champ path.id modifié). | 241 |
| `core_paths.cloneTransformTracks(tracks)` | Copie propre des pistes de transformation, en ne gardant que les canaux de transformChannels et les champs t, v, slopeIn, slopeOut, timeIn, timeOut. | 132 |
| `core_paths.createPath(name)` | Crée un chemin vide { name, markers = {}, manualFov = true, dirty = true } et l'ajoute. | 246 |
| `core_paths.deletePath(path)` | Retire de la liste le premier chemin portant le même name que celui donné. Ne supprime aucun fichier. | 251 |
| `core_paths.evalTransform(path, t)` | Évalue tous les canaux (pos, yaw/pitch/roll, fov) du chemin au temps t. | 166 |
| `core_paths.evalTransformTrack(keys, t, wrap, cuts)` | Évalue une piste de clés { t, v, ... } au temps t par interpolation Bézier entre clés, avec gestion des coupures (cuts) et du bouclage (wrap). | 98 |
| `core_paths.getEndIdx(path)` | Indice du dernier segment jouable : nombre de marqueurs si le chemin boucle, sinon nombre moins 1. | 269 |
| `core_paths.getMarkerIds(path, idx)` | Renvoie les 4 indices de marqueurs (précédent, courant, suivant, suivant+1) utilisés pour interpoler le segment idx. Gère le bouclage (modulo) et les coupures (`cut`), qui dupliquent l'indice voisin. | 223 |
| `core_paths.getPath(pathName)` | Ancienne fonction (getPath_Deprecated) : lit un SimPath de la scène et renvoie ses marqueurs. Sans argument, prend le premier SimPath du niveau. | 439 |
| `core_paths.getPaths()` | Renvoie la table interne des chemins chargés (pas une copie). | 265 |
| `core_paths.getUniquePathName(name)` | Renvoie un nom non utilisé par les chemins chargés : le nom tel quel, sinon avec suffixe numérique (name1, name2...). | 208 |
| `core_paths.invertCubicBezier(a, b, u)` | Inverse d'une Bézier cubique monotone x(t) = cubicBezier(a, b, t) sur [0, 1], par Newton (8 itérations). Exacte aux bornes : u<=0 donne 0, u>=1 donne 1. | 31 |
| `core_paths.loadPath(pathFileName)` | Charge un chemin depuis un fichier camPath.json et l'ajoute à la liste ; renvoie le chemin existant si ce fichier est déjà chargé. | 329 |
| `core_paths.loopDuration(path)` | Durée de la transition de bouclage d'un chemin : 0 si le chemin n'est pas `looped`, sinon loopTime (min 0), ou 2 s si loopTime est absent. | 65 |
| `core_paths.onClientStartMission()` | Hook appelé au démarrage d'un niveau : vide la liste et charge tous les fichiers *.camPath.json du dossier 'camPaths' voisin du fichier de niveau. *(interne)* *(hook)* | 415 |
| `core_paths.onDeserialized(data)` | Hook de restauration après rechargement Lua : remet les chemins sauvegardés. *(interne)* *(hook)* | 411 |
| `core_paths.onExtensionLoaded()` | Hook appelé au chargement de l'extension ; ne fait rien. *(interne)* *(hook)* | 402 |
| `core_paths.onSerialize()` | Hook de sauvegarde avant rechargement Lua : renvoie une copie profonde des chemins. *(interne)* *(hook)* | 405 |
| `core_paths.playPath(path, offset, initData)` | Joue un chemin avec la caméra 'path' (core_camera.setByName(0, 'path', ...)). initData reçoit useJsonVersion, hasIntro, path, offset, et des reset/getNextPath par défaut. | 491 |
| `core_paths.savePath(cameraPath, filename)` | Écrit le chemin dans un fichier JSON (version 6) et met à jour cameraPath.filename et dirty = false. | 277 |
| `core_paths.stopCurrentPath()` | Si la caméra active est 'path', passe en caméra libre (commands.setFreeCamera). | 503 |

### Détail des paramètres

#### `core_paths.addPath(path)`

Ajoute un chemin à la liste et lui attribue le plus petit id libre (champ path.id modifié).

- `path` (*table*) : Chemin à ajouter.

#### `core_paths.cloneTransformTracks(tracks)`

Copie propre des pistes de transformation, en ne gardant que les canaux de transformChannels et les champs t, v, slopeIn, slopeOut, timeIn, timeOut.

- `tracks` (*table|nil*) : Table canal -> liste de clés.
- **renvoie** : table|nil Copie, ou nil si tracks n'est pas une table.

#### `core_paths.createPath(name)`

Crée un chemin vide { name, markers = {}, manualFov = true, dirty = true } et l'ajoute.

- `name` (*string*) : Nom du chemin (non rendu unique automatiquement).
- **renvoie** : table Le chemin créé.

#### `core_paths.deletePath(path)`

Retire de la liste le premier chemin portant le même name que celui donné. Ne supprime aucun fichier.

- `path` (*table*) : Chemin (comparé par name).

#### `core_paths.evalTransform(path, t)`

Évalue tous les canaux (pos, yaw/pitch/roll, fov) du chemin au temps t.

- `path` (*table|nil*) : Chemin avec transformTracks.
- `t` (*number*) : Temps en secondes.
- **renvoie** : table|nil Table canal -> valeur ; nil si le chemin n'a pas de pistes ou si aucun canal ne donne de valeur.

#### `core_paths.evalTransformTrack(keys, t, wrap, cuts)`

Évalue une piste de clés { t, v, ... } au temps t par interpolation Bézier entre clés, avec gestion des coupures (cuts) et du bouclage (wrap).

- `keys` (*table[]*) : Clés triées par t.
- `t` (*number*) : Temps en secondes.
- `wrap` (*table|nil*) : { duration, fromT, unwrapDeg } pour la transition de fin vers la première clé.
- `cuts` (*number[]|nil*) : Temps des coupures nettes.
- **renvoie** : number|nil Valeur, ou nil si la piste est vide ou t est nil.

#### `core_paths.getEndIdx(path)`

Indice du dernier segment jouable : nombre de marqueurs si le chemin boucle, sinon nombre moins 1.

- `path` (*table*) : Chemin de caméra.
- **renvoie** : integer Dernier indice de segment.

#### `core_paths.getMarkerIds(path, idx)`

Renvoie les 4 indices de marqueurs (précédent, courant, suivant, suivant+1) utilisés pour interpoler le segment idx. Gère le bouclage (modulo) et les coupures (`cut`), qui dupliquent l'indice voisin.

- `path` (*table*) : Chemin de caméra.
- `idx` (*integer*) : Indice (base 1) du marqueur de début de segment.
- **renvoie** : integer index1, index2, index3, index4 (quatre valeurs).

#### `core_paths.getPath(pathName)`

Ancienne fonction (getPath_Deprecated) : lit un SimPath de la scène et renvoie ses marqueurs. Sans argument, prend le premier SimPath du niveau.

- `pathName` (*string|nil*) : Nom de l'objet SimPath.
- **renvoie** : table|nil { markers, looped, nodeCount }, ou nil si introuvable.

#### `core_paths.getPaths()`

Renvoie la table interne des chemins chargés (pas une copie).

- **renvoie** : table[] Liste des chemins.

#### `core_paths.getUniquePathName(name)`

Renvoie un nom non utilisé par les chemins chargés : le nom tel quel, sinon avec suffixe numérique (name1, name2...).

- `name` (*string*) : Nom souhaité.
- **renvoie** : string Nom unique.

#### `core_paths.invertCubicBezier(a, b, u)`

Inverse d'une Bézier cubique monotone x(t) = cubicBezier(a, b, t) sur [0, 1], par Newton (8 itérations). Exacte aux bornes : u<=0 donne 0, u>=1 donne 1.

- `a` (*number*) : Premier point de contrôle (abscisse).
- `b` (*number*) : Second point de contrôle (abscisse).
- `u` (*number*) : Valeur cible, bornée à [0, 1].
- **renvoie** : number Paramètre t dans [0, 1].

#### `core_paths.loadPath(pathFileName)`

Charge un chemin depuis un fichier camPath.json et l'ajoute à la liste ; renvoie le chemin existant si ce fichier est déjà chargé.

- `pathFileName` (*string|nil*) : Fichier à lire ; nil renvoie nil.
- **renvoie** : table|nil Le chemin, ou nil si le fichier est introuvable (erreur dans le log).

#### `core_paths.loopDuration(path)`

Durée de la transition de bouclage d'un chemin : 0 si le chemin n'est pas `looped`, sinon loopTime (min 0), ou 2 s si loopTime est absent.

- `path` (*table|nil*) : Chemin de caméra.
- **renvoie** : number Durée en secondes.

#### `core_paths.onDeserialized(data)`

Hook de restauration après rechargement Lua : remet les chemins sauvegardés.

- `data` (*table*) : Table renvoyée par onSerialize.

#### `core_paths.onSerialize()`

Hook de sauvegarde avant rechargement Lua : renvoie une copie profonde des chemins.

- **renvoie** : table { paths = ... }

#### `core_paths.playPath(path, offset, initData)`

Joue un chemin avec la caméra 'path' (core_camera.setByName(0, 'path', ...)). initData reçoit useJsonVersion, hasIntro, path, offset, et des reset/getNextPath par défaut.

- `path` (*table*) : Chemin à jouer.
- `offset` (*number|nil*) : Décalage de départ (0 par défaut ; unité déduite : secondes).
- `initData` (*table|nil*) : Options supplémentaires pour la caméra ; modifié en place.

#### `core_paths.savePath(cameraPath, filename)`

Écrit le chemin dans un fichier JSON (version 6) et met à jour cameraPath.filename et dirty = false.

- `cameraPath` (*table*) : Chemin à sauvegarder.
- `filename` (*string*) : Fichier de destination (ex. .camPath.json).

## Champs

| Champ | Type | Description |
|---|---|---|
| `motionPrefixes` | string[] | Familles de Bézier temporelles : 'motion' (position), 'rotMotion' (orientation entière), puis 'yawMotion', 'pitchMotion', 'rollMotion' (un axe d'Euler chacun). |
| `transformChannels` | string[] | Canaux des pistes de transformation : posX, posY, posZ, yaw, pitch, roll, fov. |

## Appels vers le moteur (C++)

- `FS:` `findFiles`
- `scenetree.` `findClassObjects`, `findObject`, `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/core/paths.lua`.*
