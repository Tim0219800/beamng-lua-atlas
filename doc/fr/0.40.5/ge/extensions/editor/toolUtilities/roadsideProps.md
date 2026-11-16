# `editor_toolUtilities_roadsideProps`

*Fichier : `lua/ge/extensions/editor/toolUtilities/roadsideProps.lua` · VM : Game Engine (GE) · 538 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_toolUtilities_roadsideProps` : `extensions.load("editor_toolUtilities_roadsideProps")`, puis la globale `editor_toolUtilities_roadsideProps`

Placeur partagé de lignes d'objets en bord de route (glissières, barrières, clôtures, lampadaires, bornes, poubelles, abri-bus…). Une table de préréglages (presets) décrit chaque pièce (forme .dae, rotation, écart entre pièces, mode de normale, pièces alternées, embouts) ; runLine pose une ligne de pièces le long d'un rail, placePoints une pièce à chaque point donné, placeScatter des éléments épars aléatoires. Les pièces vont dans des « pools » identifiés par poolId (scène via kitPlacer), que l'outil peut supprimer, compter ou graver (commitPool) en objets persistants. Les lampadaires créent aussi leur lumière (siteLights).

## Exemple

```lua
local rp = extensions.editor_toolUtilities_roadsideProps
local n = rp.runLine({poolId = 'edgeL', presetKey = 'guardrail', folder = scenetree.findObject('MissionGroup'),
  railPts = pts, railUps = ups})
print(rp.poolCount('edgeL'))
rp.removePool('edgeL')
```

## Remarques

- Préréglages fournis (clé) : jersey, plastic, fence, chainlink, scrap, guardrail, lampMast, lampVictorian, lampSingle, lampTwin, lampStreet, lampHighway, lampSidewalk, bollard, bollardStone, bollardTall, bin, binMetal, binSmall, busShelter. Un préréglage avec reach est un lampadaire (lumière créée). normalMode 'surface' suit la normale du sol/rail, 'global' dresse la pièce à la verticale (props ponctuels, pas de chaînage).
- Les pièces de mobilier cuites par le kit de props ne font pas partie de la version livrée : elles s'enregistrent via addPresets.
- Les pièces d'un pool sont créées transitoires ; commitPool les rend persistantes (canSave=true) et les détache du pool.
- Les noms d'objets sont « HeroProp_ » + poolId (+ _ownerTag) + index : plusieurs tronçons dans un même pool (keepPool) doivent avoir un ownerTag différent, sinon ils écrasent les noms des précédents.
- Pour les props ponctuels, le pas par défaut est preset.pointStepM ou 25 m ; pour les pièces chaînées, longueur de pièce + gapM + extraGapM. Le pas minimum est 0.05 m.
- placeScatter est déterministe pour un opts.seed donné (congruentiel linéaire 1103515245/12345 modulo 2^31).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_toolUtilities_roadsideProps.addPresets(t)` | Fusionne des préréglages supplémentaires dans la table presets (par clé). Utilisé par le kit de props, hors version livrée, pour enregistrer le mobilier et les pièces civiques. | 517 |
| `editor_toolUtilities_roadsideProps.beginPointBatch(minGap)` | Démarre un lot de props ponctuels avec dédoublonnage spatial : tout point à moins de minGap d'un point déjà posé dans ce lot est refusé (désagrège les endroits où des lignes se rejoignent). Sans minGap positif, désactive le dédoublonnage. | 244 |
| `editor_toolUtilities_roadsideProps.commitPool(poolId)` | Grave un pool : rend persistantes (canSave=true) les pièces transitoires et les lumières de ses lampadaires, puis les détache du pool sans les supprimer. | 301 |
| `editor_toolUtilities_roadsideProps.endPointBatch()` | Termine le lot de props ponctuels. | 248 |
| `editor_toolUtilities_roadsideProps.lampLight(presetKey, px, py, pz, q, scale, col, bright, reach)` | Fabrique l'enregistrement de lumière (voir siteLights) d'un lampadaire posé en (px, py, pz) et tourné de q ; la tête est placée sous le haut de la boîte du maillage, au bout du bras s'il y en a un. Renvoie nil si le préréglage n'est pas un lampadaire. | 210 |
| `editor_toolUtilities_roadsideProps.orientation(along, up, preIdx, sideSign)` | Rotation donnée à une pièce posée (voir orient) pour un outil qui dresse ses propres pièces. Quaternion partagé : l'utiliser ou le copier avant l'appel suivant. | 179 |
| `editor_toolUtilities_roadsideProps.placePoints(opts)` | Pose un préréglage à chaque point monde fourni. Remplace le pool sauf si keepPool. Chaque point peut porter ax, ay (direction le long, horizontale) et scl (nombre, ou {x,y,z} dans le repère de la pièce) pour ajuster cette instance. Pour un lampadaire, crée aussi la lumière. | 314 |
| `editor_toolUtilities_roadsideProps.placeScatter(opts)` | Disperse des maillages libres aux points donnés (forme, lacet, inclinaison, taille et enfouissement aléatoires) dans un pool. Déterministe pour opts.seed. Remplace toujours le pool. | 340 |
| `editor_toolUtilities_roadsideProps.poolCount(poolId)` | Nombre de pièces actuellement dans un pool (0 si vide, non construit ou gravé). Lecture en O(1), utilisable à chaque frame. | 289 |
| `editor_toolUtilities_roadsideProps.poolList(poolId)` | Renvoie les pièces posées d'un pool, pour une cuisson qui les relit dans la scène. Lecture seule. | 295 |
| `editor_toolUtilities_roadsideProps.removePool(poolId)` | Supprime le pool de pièces posées par l'appelant (pièces et lumières). | 278 |
| `editor_toolUtilities_roadsideProps.runLine(opts)` | Construit (ou reconstruit) une ligne de props le long d'un rail. keepPool ajoute au pool au lieu de le remplacer, ce qui permet de bâtir une ligne faite de plusieurs rails (un parapet interrompu par des volées arrive en quelques tronçons ouverts). Les props ponctuels (mode global) sont posés à intervalles réguliers, avec lockEnds pour verrouiller les deux extrémités et répartir l'intérieur. | 372 |

### Détail des paramètres

#### `editor_toolUtilities_roadsideProps.addPresets(t)`

Fusionne des préréglages supplémentaires dans la table presets (par clé). Utilisé par le kit de props, hors version livrée, pour enregistrer le mobilier et les pièces civiques.

- `t` (*table<string, table>*) : Préréglages à ajouter ou remplacer.

#### `editor_toolUtilities_roadsideProps.beginPointBatch(minGap)`

Démarre un lot de props ponctuels avec dédoublonnage spatial : tout point à moins de minGap d'un point déjà posé dans ce lot est refusé (désagrège les endroits où des lignes se rejoignent). Sans minGap positif, désactive le dédoublonnage.

- `minGap` (*number|nil*) : Distance minimale entre points, en mètres.

#### `editor_toolUtilities_roadsideProps.commitPool(poolId)`

Grave un pool : rend persistantes (canSave=true) les pièces transitoires et les lumières de ses lampadaires, puis les détache du pool sans les supprimer.

- `poolId` (*string*) : Identifiant du pool.
- **renvoie** : table Liste des identifiants/noms des objets rendus persistants.

#### `editor_toolUtilities_roadsideProps.lampLight(presetKey, px, py, pz, q, scale, col, bright, reach)`

Fabrique l'enregistrement de lumière (voir siteLights) d'un lampadaire posé en (px, py, pz) et tourné de q ; la tête est placée sous le haut de la boîte du maillage, au bout du bras s'il y en a un. Renvoie nil si le préréglage n'est pas un lampadaire.

- `presetKey` (*string*) : Clé du préréglage.
- `px` (*number*) : x du pied.
- `py` (*number*) : y du pied.
- `pz` (*number*) : z du pied.
- `q` (*quat*) : Rotation de la pièce.
- `scale` (*number|nil*) : Échelle (défaut 1).
- `col` (*any|nil*) : Couleur de lueur (défaut siteLights.TONES.warm).
- `bright` (*number|nil*) : Luminosité (défaut celle du préréglage).
- `reach` (*number|nil*) : Rayon de la lumière (défaut celui du préréglage).
- **renvoie** : table|nil { px, py, pz, glow, radius, brightness }.

#### `editor_toolUtilities_roadsideProps.orientation(along, up, preIdx, sideSign)`

Rotation donnée à une pièce posée (voir orient) pour un outil qui dresse ses propres pièces. Quaternion partagé : l'utiliser ou le copier avant l'appel suivant.

- `along` (*vec3*) : Direction le long du rail.
- `up` (*vec3*) : Direction vers le haut.
- `preIdx` (*integer*) : Pré-rotation de la pièce, 0 à 3 (0, 90, 180, 270 degrés autour de Z).
- `sideSign` (*number|nil*) : Côté : valeur négative retourne la pièce de 180 degrés (défaut 1).
- **renvoie** : quat Rotation (instance partagée du module).

#### `editor_toolUtilities_roadsideProps.placePoints(opts)`

Pose un préréglage à chaque point monde fourni. Remplace le pool sauf si keepPool. Chaque point peut porter ax, ay (direction le long, horizontale) et scl (nombre, ou {x,y,z} dans le repère de la pièce) pour ajuster cette instance. Pour un lampadaire, crée aussi la lumière.

- `opts` (*table*) : poolId, presetKey, folder (groupe de scène parent), points ({x,y,z,ax,ay,scl}), sideSign (défaut 1), keepPool, ownerTag, outPositions (reçoit les positions posées), outLights (reçoit les lumières).
- **renvoie** : integer Nombre de pièces posées (0 si préréglage ou points manquants).

#### `editor_toolUtilities_roadsideProps.placeScatter(opts)`

Disperse des maillages libres aux points donnés (forme, lacet, inclinaison, taille et enfouissement aléatoires) dans un pool. Déterministe pour opts.seed. Remplace toujours le pool.

- `opts` (*table*) : poolId, folder, shapePaths (formes au choix), points ({x,y,z}), seed, base (échelle de base, défaut 1), var (variation relative, défaut 0), tiltMax (inclinaison max en radians, défaut 0.2), buryBase (défaut 0.03 m), buryVar (défaut 0.12), collidable (booléen), outPositions.
- **renvoie** : integer Nombre de pièces posées.

#### `editor_toolUtilities_roadsideProps.poolCount(poolId)`

Nombre de pièces actuellement dans un pool (0 si vide, non construit ou gravé). Lecture en O(1), utilisable à chaque frame.

- `poolId` (*string*) : Identifiant du pool.
- **renvoie** : integer Nombre de pièces.

#### `editor_toolUtilities_roadsideProps.poolList(poolId)`

Renvoie les pièces posées d'un pool, pour une cuisson qui les relit dans la scène. Lecture seule.

- `poolId` (*string*) : Identifiant du pool.
- **renvoie** : table|nil Liste d'objets de scène, ou nil.

#### `editor_toolUtilities_roadsideProps.removePool(poolId)`

Supprime le pool de pièces posées par l'appelant (pièces et lumières).

- `poolId` (*string*) : Identifiant du pool.

#### `editor_toolUtilities_roadsideProps.runLine(opts)`

Construit (ou reconstruit) une ligne de props le long d'un rail. keepPool ajoute au pool au lieu de le remplacer, ce qui permet de bâtir une ligne faite de plusieurs rails (un parapet interrompu par des volées arrive en quelques tronçons ouverts). Les props ponctuels (mode global) sont posés à intervalles réguliers, avec lockEnds pour verrouiller les deux extrémités et répartir l'intérieur.

- `opts` (*table*) : poolId, presetKey ('none' = rien), folder, railPts (au moins 2 points), railUps (normales), sideSign, stepM, extraGapM, lockEnds, isLoop, keepPool, ownerTag, outPositions, outLights, rejectFn (renvoie true pour refuser un échantillon).
- **renvoie** : integer Nombre de pièces posées.

## Champs

| Champ | Type | Description |
|---|---|---|
| `presets` | table<string, table> | Table des préréglages de pièces, par clé. Champs usuels : name, shapePath, preRot (0 à 3, quarts de tour autour de Z), gapM (écart entre pièces, négatif = recouvrement), nativeLenM, normalMode ('surface' ou 'global'), altPaths (formes alternées), capMode/capPath/capPreRot (embouts), reach/bright (lampadaires). |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/toolUtilities/roadsideProps.lua`.*
