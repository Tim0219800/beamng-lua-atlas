# `editor_toolUtilities_kitPlacer`

*Fichier : `lua/ge/extensions/editor/toolUtilities/kitPlacer.lua` · VM : Game Engine (GE) · 647 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_toolUtilities_kitPlacer` : `extensions.load("editor_toolUtilities_kitPlacer")`, puis la globale `editor_toolUtilities_kitPlacer`

Placeur partagé de pièces de kit (fichiers .dae cuits) pour les outils de construction de l'éditeur (rues, bâtiments, ponts). Une pièce peut être un TSStatic (aperçu transitoire, canSave = false) ou un item Forest (bien moins coûteux : une transformation et un pointeur vers un ForestItemData). Gère la réutilisation des pièces d'une reconstruction à la suivante, le « burn » (rendre les pièces persistantes dans le niveau), l'écriture des datablocks dans art/forest/managedItemData.json et le retrait des pièces vivantes du forest pendant une sauvegarde de niveau.

## Exemple

```lua
local kp = require('editor/toolUtilities/kitPlacer')
local sink = kp.newSink(folder, 'monOutil', true)
kp.beginReuse(sink.list)
kp.placeOriented(sink, 'art/shapes/.../piece.dae', x, y, z, ax, ay, az, ux, uy, uz, 1)
kp.endReuse(sink.list)
local manifest = kp.commitSink(sink) -- burn
```

## Remarques

- Repère d'une pièce : X local = direction 'along' (ax, ay, az), Z local = 'up' (ux, uy, uz), Y local = up x along. L'échelle est soit un nombre (uniforme) soit une table {x, y, z} par axe.
- Une forme non cuite (fichier absent) est signalée une fois par chemin dans le log (E 'kit piece is not baked') et la pièce n'est pas créée ; l'entrée reste dans la liste avec obj = nil pour que les comptes restent justes.
- Le forest limite les entrées de matrice : newItem divise la matrice jusqu'à ce qu'aucune colonne ne dépasse 1.08 (le forest recharge sinon une matrice > 1.1 comme cassée) et reporte le facteur dans l'échelle de l'item.
- Trois familles de datablocks : 'burned' (préfixe massingKit_, collision conservée), 'live' (liveKit_, collidable = 0) et 'solid' (liveSolid_, collision active). Seuls les massingKit_ sont écrits dans managedItemData.json.
- Les pièces vivantes doivent être retirées du forest avant une sauvegarde (liftLive) puis remises (relayLive, à appeler chaque frame), sinon elles partiraient dans le niveau avec des datablocks 'live' qui ne sont pas persistés.
- Un sink est { folder, ownerId, collidable, list, n } ; avec un champ emitFrame, placeOriented lui passe le repère au lieu de créer un objet (outils qui cuisent leur sortie).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_toolUtilities_kitPlacer.beginReuse(list)` | Met de côté les pièces du dernier passage pour le suivant : une file par forme, rendues dans l'ordre. La liste est vidée mais rien n'est supprimé. Un reconstruction identique retrouve chaque pièce à sa place sans travail. | 133 |
| `editor_toolUtilities_kitPlacer.burnItem(fd, entry)` | Remet au niveau une pièce vivante : même pose sur le datablock propre de la forme (celui qui collisionne), retire l'item vivant. Nil pour une entrée qui n'est pas un item Forest. | 468 |
| `editor_toolUtilities_kitPlacer.burnList(fd, list, out)` | Burn de toutes les entrées vivantes d'un pool : leurs items sont ajoutés à out et le pool est vidé. | 481 |
| `editor_toolUtilities_kitPlacer.commitSink(sink)` | Burn d'un sink : passe ses TSStatic en persistants (canSave = true), applique la collision 'Collision Mesh' si le sink est collidable, marque l'éditeur modifié et renvoie les noms d'objets comme manifeste. Ne supprime ni ne détache rien (l'appelant détache son pool). Les noms survivent à la sauvegarde. | 317 |
| `editor_toolUtilities_kitPlacer.deleteList(list)` | Efface les pièces placées d'une liste : supprime chaque TSStatic, retire chaque item Forest, vide la liste (termine aussi une réutilisation abandonnée). | 285 |
| `editor_toolUtilities_kitPlacer.dropLive(fd, t, k)` | Retire l'emplacement k de t du forest et de la table. fd peut être nil (le forest où la pièce se trouve est alors retrouvé). | 452 |
| `editor_toolUtilities_kitPlacer.endReuse(list)` | Supprime ce que le passage n'a pas redemandé (ce qui reste dans les files) et renvoie combien ont disparu. | 118 |
| `editor_toolUtilities_kitPlacer.isLive(e)` | Indique si un emplacement de pool est une pièce vivante Forest plutôt qu'un TSStatic. | 449 |
| `editor_toolUtilities_kitPlacer.itemDataFor(shapePath, kind)` | Renvoie le ForestItemData d'une forme de kit, créé au premier usage : celui du niveau ('burned', par défaut) ou une copie d'outil pour les pièces vivantes ('live', collidable = 0, ou 'solid'). Volontairement créé sans passer par editor.createDataBlock pour ne pas être confié au gestionnaire de persistance (writeItemDatas s'en charge). Le nom vient du chemin complet de la forme. | 383 |
| `editor_toolUtilities_kitPlacer.liftLive()` | Sort du forest toutes les pièces vivantes avant une sauvegarde de niveau (les leurs et celles qu'un outil aurait perdues de vue, identifiées par le préfixe liveKit_/liveSolid_ du datablock). À appeler depuis le hook de sauvegarde de chaque outil : le premier fait le travail, les suivants constatent que c'est déjà fait. | 500 |
| `editor_toolUtilities_kitPlacer.liveForestData()` | Renvoie les données du forest du niveau, en créant un Forest s'il n'y en a pas (foliageScatter.ensureForest). | 633 |
| `editor_toolUtilities_kitPlacer.markDirty()` | Marque l'éditeur modifié pour que la sauvegarde soit proposée. Suffit pour un outil dont le burn est fait de statiques seules (objets de scène sauvegardés avec le niveau) ; un outil qui plante des items Forest doit aussi appeler writeItemDatas. | 611 |
| `editor_toolUtilities_kitPlacer.moveOriented(entry, ox, oy, oz, ax, ay, az, ux, uy, uz, scl)` | Déplace une pièce déjà dans la scène sur un nouveau repère, bien moins cher que la supprimer et la reconstruire. Pour un item Forest : retire puis replante (plus rapide que updateItem). Pour un TSStatic : setPosRot, l'échelle n'est réécrite que si elle a changé. | 259 |
| `editor_toolUtilities_kitPlacer.newSink(folder, ownerId, collidable, list)` | Construit un « sink » pour un propriétaire. Un ownerId nil produit des pièces sans nom, pour un appelant qui ne les retrouve jamais par nom. | 98 |
| `editor_toolUtilities_kitPlacer.placeOriented(sink, shapePath, ox, oy, oz, ax, ay, az, ux, uy, uz, scl)` | Place une pièce de kit selon un repère local (origine, direction along, direction up). Un sink portant emitFrame reçoit le repère au lieu d'un objet de scène et sa valeur de retour est renvoyée. | 241 |
| `editor_toolUtilities_kitPlacer.placeTs(sink, shapePath, px, py, pz, qx, qy, qz, qw, scl)` | Place une instance (position + quaternion) et ajoute son entrée à la liste du sink, en reprenant une pièce réutilisable de même forme si possible (ne réécrit la transformation que si elle a changé). Forme absente ou pas de dossier : entrée avec obj = nil. | 164 |
| `editor_toolUtilities_kitPlacer.plantOriented(fd, shapePath, ox, oy, oz, ax, ay, az, ux, uy, uz, scl)` | Plante une pièce vivante selon un repère local, comme item Forest. Renvoie l'entrée que garde la liste, ou nil s'il n'y a pas de forest ou pas de forme cuite, pour que l'appelant pose un TSStatic à la place. | 412 |
| `editor_toolUtilities_kitPlacer.plantStatic(fd, obj)` | Plante une pièce en item Forest directement depuis la pose d'un TSStatic (échelle par axe cuite dans les colonnes de la matrice), sur le datablock 'burned' de sa forme. | 529 |
| `editor_toolUtilities_kitPlacer.poseLive(fd, list, i, shapePath, solid, px, py, pz, qx, qy, qz, qw, sx, sy, sz)` | Pose l'emplacement i d'une liste en pièce vivante Forest : forme à une position, un quaternion et une échelle par axe ; solid pour une pièce qui collisionne comme son TSStatic. Un emplacement dont forme et pose n'ont pas changé est laissé tel quel. Une forme non cuite garde son emplacement sans item. | 427 |
| `editor_toolUtilities_kitPlacer.relayLive()` | À appeler chaque frame par chaque outil : le premier appel après une sauvegarde remet ce que liftLive avait retiré. Seulement dans une entrée qui tient toujours l'item levé, et seulement dans le forest d'où il est sorti. | 516 |
| `editor_toolUtilities_kitPlacer.removeBurned(nameManifest)` | Supprime par nom toutes les pièces burnées listées dans le manifeste (issu de commitSink), puis marque l'éditeur modifié. Manifeste nil ou vide : sans effet. | 338 |
| `editor_toolUtilities_kitPlacer.safeName(prefix, id)` | Compose prefix + id avec tout caractère non alphanumérique de l'id remplacé par '_'. Attention : string.gsub renvoie deux valeurs mais l'opérateur .. n'en garde qu'une. | 305 |
| `editor_toolUtilities_kitPlacer.setGlow(obj, glow, night)` | Colore une pièce lumineuse (instanceColor). Avec night, la confie aussi à la passe jour/nuit de core_environment (nightEmissive), qui met la couleur à noir de jour et la rétablit au crépuscule : un panneau ou une lentille de lampe est du verre sombre le jour. La couleur est écrite aussi ici. | 594 |
| `editor_toolUtilities_kitPlacer.shapeOf(path)` | Renvoie le chemin d'une forme de kit si le fichier existe (résultat mis en cache), sinon nil avec un message d'erreur unique dans le log. | 38 |
| `editor_toolUtilities_kitPlacer.spawnOriented(folder, shapePath, name, collidable, ox, oy, oz, ax, ay, az, ux, uy, uz, scl)` | Crée une pièce isolée (TSStatic), hors de tout sink, pour un appelant qui gère ses propres emplacements. Remplace tout objet de même nom. | 251 |
| `editor_toolUtilities_kitPlacer.trimLive(fd, list, n)` | Retire du forest et de la liste tous les emplacements après le n-ième. | 462 |
| `editor_toolUtilities_kitPlacer.writeItemDatas()` | Écrit les datablocks du kit dans art/forest/managedItemData.json du niveau, à appeler à la sauvegarde. Les clés massingKit_ sont reconstruites d'après ce qui est posé (ajout des nouvelles formes burnées, retrait de celles que rien n'utilise) ; le reste du fichier, propriété du Forest Editor, est laissé tel quel. Sans cela, un bâtiment burné se recharge avec des pièces pointant vers des datablocks inexistants. Ne touche pas au fichier s'il n'y a rien de ce kit. | 561 |

### Détail des paramètres

#### `editor_toolUtilities_kitPlacer.beginReuse(list)`

Met de côté les pièces du dernier passage pour le suivant : une file par forme, rendues dans l'ordre. La liste est vidée mais rien n'est supprimé. Un reconstruction identique retrouve chaque pièce à sa place sans travail.

- `list` (*table|nil*) : Liste du sink (la clé de réutilisation est la liste, pas le sink).

#### `editor_toolUtilities_kitPlacer.burnItem(fd, entry)`

Remet au niveau une pièce vivante : même pose sur le datablock propre de la forme (celui qui collisionne), retire l'item vivant. Nil pour une entrée qui n'est pas un item Forest.

- `fd` (*userdata*) : ForestData.
- `entry` (*table*) : Entrée vivante.
- **renvoie** : userdata|nil Nouvel item burné.

#### `editor_toolUtilities_kitPlacer.burnList(fd, list, out)`

Burn de toutes les entrées vivantes d'un pool : leurs items sont ajoutés à out et le pool est vidé.

- `fd` (*userdata*) : ForestData.
- `list` (*table|nil*) : Pool d'entrées.
- `out` (*table*) : Liste recevant les items burnés.

#### `editor_toolUtilities_kitPlacer.commitSink(sink)`

Burn d'un sink : passe ses TSStatic en persistants (canSave = true), applique la collision 'Collision Mesh' si le sink est collidable, marque l'éditeur modifié et renvoie les noms d'objets comme manifeste. Ne supprime ni ne détache rien (l'appelant détache son pool). Les noms survivent à la sauvegarde.

- `sink` (*table|nil*) : Sink ou { list = ... }.
- **renvoie** : string[] Manifeste des noms d'objets.

#### `editor_toolUtilities_kitPlacer.deleteList(list)`

Efface les pièces placées d'une liste : supprime chaque TSStatic, retire chaque item Forest, vide la liste (termine aussi une réutilisation abandonnée).

- `list` (*table|nil*) : Liste d'entrées.

#### `editor_toolUtilities_kitPlacer.dropLive(fd, t, k)`

Retire l'emplacement k de t du forest et de la table. fd peut être nil (le forest où la pièce se trouve est alors retrouvé).

- `fd` (*userdata|nil*) : ForestData.
- `t` (*table*) : Liste.
- `k` (*integer*) : Indice.

#### `editor_toolUtilities_kitPlacer.endReuse(list)`

Supprime ce que le passage n'a pas redemandé (ce qui reste dans les files) et renvoie combien ont disparu.

- `list` (*table|nil*) : Liste du sink.
- **renvoie** : integer Nombre d'objets supprimés.

#### `editor_toolUtilities_kitPlacer.isLive(e)`

Indique si un emplacement de pool est une pièce vivante Forest plutôt qu'un TSStatic.

- `e` (*table|nil*) : Entrée.
- **renvoie** : boolean true si c'est une pièce Forest suivie.

#### `editor_toolUtilities_kitPlacer.itemDataFor(shapePath, kind)`

Renvoie le ForestItemData d'une forme de kit, créé au premier usage : celui du niveau ('burned', par défaut) ou une copie d'outil pour les pièces vivantes ('live', collidable = 0, ou 'solid'). Volontairement créé sans passer par editor.createDataBlock pour ne pas être confié au gestionnaire de persistance (writeItemDatas s'en charge). Le nom vient du chemin complet de la forme.

- `shapePath` (*string|nil*) : Chemin du .dae.
- `kind` (*string|nil*) : 'burned' (défaut), 'live' ou 'solid'.
- **renvoie** : userdata|nil ForestItemData.

#### `editor_toolUtilities_kitPlacer.liveForestData()`

Renvoie les données du forest du niveau, en créant un Forest s'il n'y en a pas (foliageScatter.ensureForest).

- **renvoie** : userdata|nil ForestData.

#### `editor_toolUtilities_kitPlacer.moveOriented(entry, ox, oy, oz, ax, ay, az, ux, uy, uz, scl)`

Déplace une pièce déjà dans la scène sur un nouveau repère, bien moins cher que la supprimer et la reconstruire. Pour un item Forest : retire puis replante (plus rapide que updateItem). Pour un TSStatic : setPosRot, l'échelle n'est réécrite que si elle a changé.

- `entry` (*table*) : Entrée { obj } ou { item, data }.
- `ox` (*number*) : Origine x.
- `oy` (*number*) : Origine y.
- `oz` (*number*) : Origine z.
- `ax` (*number*) : Along x.
- `ay` (*number*) : Along y.
- `az` (*number*) : Along z.
- `ux` (*number*) : Up x.
- `uy` (*number*) : Up y.
- `uz` (*number*) : Up z.
- `scl` (*number|table|nil*) : Échelle.
- **renvoie** : boolean true si la pièce a été déplacée.

#### `editor_toolUtilities_kitPlacer.newSink(folder, ownerId, collidable, list)`

Construit un « sink » pour un propriétaire. Un ownerId nil produit des pièces sans nom, pour un appelant qui ne les retrouve jamais par nom.

- `folder` (*userdata*) : SimGroup recevant les pièces.
- `ownerId` (*string|nil*) : Identifiant du propriétaire, base des noms 'ownerId_N'.
- `collidable` (*boolean|nil*) : Les pièces doivent collisionner (appliqué au commit pour les statiques).
- `list` (*table|nil*) : Liste existante à remplir (partagée entre sinks) ; sinon nouvelle.
- **renvoie** : table Sink { folder, ownerId, collidable, list, n }.

#### `editor_toolUtilities_kitPlacer.placeOriented(sink, shapePath, ox, oy, oz, ax, ay, az, ux, uy, uz, scl)`

Place une pièce de kit selon un repère local (origine, direction along, direction up). Un sink portant emitFrame reçoit le repère au lieu d'un objet de scène et sa valeur de retour est renvoyée.

- `sink` (*table*) : Sink.
- `shapePath` (*string*) : Chemin du .dae.
- `ox` (*number*) : Origine x.
- `oy` (*number*) : Origine y.
- `oz` (*number*) : Origine z.
- `ax` (*number*) : Direction along x.
- `ay` (*number*) : Direction along y.
- `az` (*number*) : Direction along z.
- `ux` (*number*) : Direction up x.
- `uy` (*number*) : Direction up y.
- `uz` (*number*) : Direction up z.
- `scl` (*number|table|nil*) : Échelle.
- **renvoie** : any Résultat de sink.emitFrame, sinon rien.

#### `editor_toolUtilities_kitPlacer.placeTs(sink, shapePath, px, py, pz, qx, qy, qz, qw, scl)`

Place une instance (position + quaternion) et ajoute son entrée à la liste du sink, en reprenant une pièce réutilisable de même forme si possible (ne réécrit la transformation que si elle a changé). Forme absente ou pas de dossier : entrée avec obj = nil.

- `sink` (*table*) : Sink.
- `shapePath` (*string|nil*) : Chemin du .dae.
- `px` (*number*) : Position x.
- `py` (*number*) : Position y.
- `pz` (*number*) : Position z.
- `qx` (*number*) : Quaternion x.
- `qy` (*number*) : Quaternion y.
- `qz` (*number*) : Quaternion z.
- `qw` (*number*) : Quaternion w.
- `scl` (*number|table|nil*) : Échelle uniforme ou {x, y, z}.

#### `editor_toolUtilities_kitPlacer.plantOriented(fd, shapePath, ox, oy, oz, ax, ay, az, ux, uy, uz, scl)`

Plante une pièce vivante selon un repère local, comme item Forest. Renvoie l'entrée que garde la liste, ou nil s'il n'y a pas de forest ou pas de forme cuite, pour que l'appelant pose un TSStatic à la place.

- `fd` (*userdata*) : ForestData.
- `shapePath` (*string*) : Chemin du .dae.
- `ox` (*number*) : Origine x.
- `oy` (*number*) : Origine y.
- `oz` (*number*) : Origine z.
- `ax` (*number*) : Along x.
- `ay` (*number*) : Along y.
- `az` (*number*) : Along z.
- `ux` (*number*) : Up x.
- `uy` (*number*) : Up y.
- `uz` (*number*) : Up z.
- `scl` (*number|table|nil*) : Échelle (par axe possible : la matrice du forest la porte).
- **renvoie** : table|nil Entrée { item, data, shape }.

#### `editor_toolUtilities_kitPlacer.plantStatic(fd, obj)`

Plante une pièce en item Forest directement depuis la pose d'un TSStatic (échelle par axe cuite dans les colonnes de la matrice), sur le datablock 'burned' de sa forme.

- `fd` (*userdata*) : ForestData.
- `obj` (*userdata*) : TSStatic source.
- **renvoie** : userdata|nil Item créé, ou nil.

#### `editor_toolUtilities_kitPlacer.poseLive(fd, list, i, shapePath, solid, px, py, pz, qx, qy, qz, qw, sx, sy, sz)`

Pose l'emplacement i d'une liste en pièce vivante Forest : forme à une position, un quaternion et une échelle par axe ; solid pour une pièce qui collisionne comme son TSStatic. Un emplacement dont forme et pose n'ont pas changé est laissé tel quel. Une forme non cuite garde son emplacement sans item.

- `fd` (*userdata*) : ForestData.
- `list` (*table*) : Pool d'entrées.
- `i` (*integer*) : Indice de l'emplacement.
- `shapePath` (*string*) : Chemin du .dae.
- `solid` (*boolean*) : Datablock avec collision.
- `px` (*number*) : Position x.
- `py` (*number*) : Position y.
- `pz` (*number*) : Position z.
- `qx` (*number*) : Quaternion x.
- `qy` (*number*) : Quaternion y.
- `qz` (*number*) : Quaternion z.
- `qw` (*number*) : Quaternion w.
- `sx` (*number*) : Échelle x.
- `sy` (*number*) : Échelle y.
- `sz` (*number*) : Échelle z.
- **renvoie** : table L'entrée de l'emplacement.

#### `editor_toolUtilities_kitPlacer.removeBurned(nameManifest)`

Supprime par nom toutes les pièces burnées listées dans le manifeste (issu de commitSink), puis marque l'éditeur modifié. Manifeste nil ou vide : sans effet.

- `nameManifest` (*string[]|nil*) : Noms d'objets.
- **renvoie** : integer Nombre d'objets supprimés.

#### `editor_toolUtilities_kitPlacer.safeName(prefix, id)`

Compose prefix + id avec tout caractère non alphanumérique de l'id remplacé par '_'. Attention : string.gsub renvoie deux valeurs mais l'opérateur .. n'en garde qu'une.

- `prefix` (*string*) : Préfixe.
- `id` (*any*) : Identifiant (converti par tostring).
- **renvoie** : string Nom sûr.

#### `editor_toolUtilities_kitPlacer.setGlow(obj, glow, night)`

Colore une pièce lumineuse (instanceColor). Avec night, la confie aussi à la passe jour/nuit de core_environment (nightEmissive), qui met la couleur à noir de jour et la rétablit au crépuscule : un panneau ou une lentille de lampe est du verre sombre le jour. La couleur est écrite aussi ici.

- `obj` (*userdata*) : TSStatic.
- `glow` (*number[]*) : Couleur {r, g, b} (défaut 1 par composante).
- `night` (*boolean|nil*) : Enregistrer pour l'émissif nocturne (siteLights.markDirty).

#### `editor_toolUtilities_kitPlacer.shapeOf(path)`

Renvoie le chemin d'une forme de kit si le fichier existe (résultat mis en cache), sinon nil avec un message d'erreur unique dans le log.

- `path` (*string|nil*) : Chemin du .dae cuit.
- **renvoie** : string|nil Le chemin, ou nil s'il est absent ou non cuit.

#### `editor_toolUtilities_kitPlacer.spawnOriented(folder, shapePath, name, collidable, ox, oy, oz, ax, ay, az, ux, uy, uz, scl)`

Crée une pièce isolée (TSStatic), hors de tout sink, pour un appelant qui gère ses propres emplacements. Remplace tout objet de même nom.

- `folder` (*userdata*) : SimGroup parent.
- `shapePath` (*string*) : Chemin du .dae.
- `name` (*string|nil*) : Nom d'objet de scène.
- `collidable` (*boolean|nil*) : Collision 'Collision Mesh' sinon 'None'.
- `ox` (*number*) : Origine x.
- `oy` (*number*) : Origine y.
- `oz` (*number*) : Origine z.
- `ax` (*number*) : Along x.
- `ay` (*number*) : Along y.
- `az` (*number*) : Along z.
- `ux` (*number*) : Up x.
- `uy` (*number*) : Up y.
- `uz` (*number*) : Up z.
- `scl` (*number|table|nil*) : Échelle.
- **renvoie** : userdata|nil TSStatic créé, ou nil.

#### `editor_toolUtilities_kitPlacer.trimLive(fd, list, n)`

Retire du forest et de la liste tous les emplacements après le n-ième.

- `fd` (*userdata|nil*) : ForestData.
- `list` (*table*) : Liste.
- `n` (*integer*) : Nombre d'emplacements à garder.

## Champs

| Champ | Type | Description |
|---|---|---|
| `MASSING_ITEM_PREFIX` | string | Préfixe 'massingKit_' des ForestItemData des pièces burnées (persistantes). |

## Appels vers le moteur (C++)

- `FS:` `fileExists`
- `Sim.` `getDataBlockSet`
- `obj:` `getField`, `getTransform`, `setField`, `updateInstanceRenderData`
- `scenetree.` `findClassObjects`, `findObject`
- `worldEditorCppApi.` `createObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/toolUtilities/kitPlacer.lua`.*
