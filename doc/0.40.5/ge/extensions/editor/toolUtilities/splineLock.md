# `editor_toolUtilities_splineLock`

*Fichier : `lua/ge/extensions/editor/toolUtilities/splineLock.lua` · VM : Game Engine (GE) · 150 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_toolUtilities_splineLock` : `extensions.load("editor_toolUtilities_splineLock")`, puis la globale `editor_toolUtilities_splineLock`

État de verrouillage partagé par les outils de splines personnalisés de l'éditeur. Une spline verrouillée (isEnabled == false) reste dans son outil, mais les objets générés appartiennent au niveau : ils sont sauvegardés (canSave = true) et collisionnent. Une spline déverrouillée produit des objets d'aperçu transitoires (canSave = false, sans collision). Chaque outil appelle sync() depuis sa reconstruction, et fournit un itérateur `each(fn)` qui appelle fn(obj, collides, isParked) pour chaque objet qu'il possède. Tant que c'est verrouillé, l'outil ne déplace ni ne refait les objets existants : les retouches manuelles restent.

## Exemple

```lua
local lock = require('editor/toolUtilities/splineLock')
local applied = {}
local function each(fn) for _, o in ipairs(myObjs) do fn(o, true, false) end end
lock.sync(applied, spline, 'myTool', each)
```

## Remarques

- `each` reçoit fn(obj, collides, isParked) ; isParked = objet possédé mais hors résultat (caché pour réutilisation), laissé tel quel.
- capture/restore ignorent les DecalRoad, MeshRoad et River (posés par leurs nœuds, pas par une transformation).
- Tous les objets taggués avec les champs dynamiques sourceTool, sourceSplineId et sourceSplineName.
- sync ne fait rien si l'état de verrouillage n'a pas changé depuis le dernier appliqué ; une spline neuve non verrouillée est considérée déjà en état « live ».

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_toolUtilities_splineLock.applyObject(obj, isLocked, collides)` | Met un objet généré dans l'état de verrouillage : canSave = isLocked, et collisionType = 'Collision Mesh' si verrouillé et `collides`, sinon 'None'. | 38 |
| `editor_toolUtilities_splineLock.capture(each)` | Enregistre l'état éditable à la main des objets d'une spline (transformation, échelle, forme pour les TSStatic, dossier), indexé par id d'objet. À prendre avant un déverrouillage qui les réinitialise, pour pouvoir annuler. | 100 |
| `editor_toolUtilities_splineLock.dropDeleted(list)` | Retire d'une liste les références à des objets qui n'existent plus (par ex. supprimés à la main dans l'arbre de scène). Compacte la liste en place. | 18 |
| `editor_toolUtilities_splineLock.hasAny(each)` | Vrai si l'outil possède encore au moins un objet vivant (non parqué) pour la spline. | 46 |
| `editor_toolUtilities_splineLock.restore(rec, each)` | Remet une capture en place après le re-verrouillage qui annule un déverrouillage : forme (shapeName + postApply), transformation, échelle, dossier. Les objets créés entre-temps et absents de la capture sont supprimés. Appelle be:reloadCollision(). | 118 |
| `editor_toolUtilities_splineLock.sync(applied, spline, toolName, each)` | Aligne les objets générés d'une spline sur son état de verrouillage. N'agit que si l'état diffère du dernier appliqué (table `applied` id -> isLocked). Met à jour le dossier de scène (canSave, tag), les objets (applyObject, tag, remise dans le dossier si déplacé à la main). Au déverrouillage, supprime les objets du dossier portant le tag de la spline mais non possédés par l'outil. Appelle be:reloadCollision(). | 62 |
| `editor_toolUtilities_splineLock.tag(obj, toolName, spline)` | Marque un objet généré avec la spline d'origine (champs dynamiques sourceTool, sourceSplineId, sourceSplineName) pour le retrouver dans l'arbre de scène ou l'inspecteur. | 31 |

### Détail des paramètres

#### `editor_toolUtilities_splineLock.applyObject(obj, isLocked, collides)`

Met un objet généré dans l'état de verrouillage : canSave = isLocked, et collisionType = 'Collision Mesh' si verrouillé et `collides`, sinon 'None'.

- `obj` (*userdata*) : Objet de scène.
- `isLocked` (*boolean*) : Spline verrouillée.
- `collides` (*boolean|nil*) : Collision une fois verrouillé ; nil laisse la collision inchangée.

#### `editor_toolUtilities_splineLock.capture(each)`

Enregistre l'état éditable à la main des objets d'une spline (transformation, échelle, forme pour les TSStatic, dossier), indexé par id d'objet. À prendre avant un déverrouillage qui les réinitialise, pour pouvoir annuler.

- `each` (*function*) : Itérateur de l'outil.
- **renvoie** : table id -> { xf, scale, shape, groupId }.

#### `editor_toolUtilities_splineLock.dropDeleted(list)`

Retire d'une liste les références à des objets qui n'existent plus (par ex. supprimés à la main dans l'arbre de scène). Compacte la liste en place.

- `list` (*table*) : Tableau d'objets de scène, modifié en place.

#### `editor_toolUtilities_splineLock.hasAny(each)`

Vrai si l'outil possède encore au moins un objet vivant (non parqué) pour la spline.

- `each` (*function*) : Itérateur de l'outil.
- **renvoie** : boolean Un objet vivant existe.

#### `editor_toolUtilities_splineLock.restore(rec, each)`

Remet une capture en place après le re-verrouillage qui annule un déverrouillage : forme (shapeName + postApply), transformation, échelle, dossier. Les objets créés entre-temps et absents de la capture sont supprimés. Appelle be:reloadCollision().

- `rec` (*table*) : Résultat de capture.
- `each` (*function*) : Itérateur de l'outil.

#### `editor_toolUtilities_splineLock.sync(applied, spline, toolName, each)`

Aligne les objets générés d'une spline sur son état de verrouillage. N'agit que si l'état diffère du dernier appliqué (table `applied` id -> isLocked). Met à jour le dossier de scène (canSave, tag), les objets (applyObject, tag, remise dans le dossier si déplacé à la main). Au déverrouillage, supprime les objets du dossier portant le tag de la spline mais non possédés par l'outil. Appelle be:reloadCollision().

- `applied` (*table<any, boolean>*) : Table id de spline -> dernier état appliqué ; modifiée.
- `spline` (*table*) : Spline (id, name, isEnabled, sceneTreeFolderId).
- `toolName` (*string*) : Nom de l'outil, utilisé pour le tag.
- `each` (*function*) : Itérateur de l'outil.
- **renvoie** : boolean Vrai si une action a été menée.

#### `editor_toolUtilities_splineLock.tag(obj, toolName, spline)`

Marque un objet généré avec la spline d'origine (champs dynamiques sourceTool, sourceSplineId, sourceSplineName) pour le retrouver dans l'arbre de scène ou l'inspecteur.

- `obj` (*userdata*) : Objet de scène.
- `toolName` (*string*) : Nom de l'outil.
- `spline` (*table*) : Spline avec .id et .name.

## Appels vers le moteur (C++)

- `be:` `reloadCollision`
- `obj:` `getClassName`, `getField`, `getGroup`, `getId`, `getScale`, `getTransform`, `postApply`, `setDynDataFieldbyName`, `setField`, `setScale`, `setTransform`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/toolUtilities/splineLock.lua`.*
