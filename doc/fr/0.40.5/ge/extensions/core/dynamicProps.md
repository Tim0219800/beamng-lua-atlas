# `core_dynamicProps`

*Fichier : `lua/ge/extensions/core/dynamicProps.lua` · VM : Game Engine (GE) · 324 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `core_dynamicProps` : `extensions.load("core_dynamicProps")`, puis la globale `core_dynamicProps`

Remplace à la volée des objets de la forêt (théForest) par de vrais véhicules « props » physiques (ex. lampadaire, poubelle) quand le joueur s'en approche, pour qu'ils puissent être heurtés et déformés. Un pool de véhicules désactivés est créé ; à chaque image, les emplacements de forêt les plus proches du joueur (dans spawnInViewRange) reçoivent un véhicule du pool et l'objet de forêt est déplacé sous la carte (z = -999) ; les emplacements trop loin sont rendus à la forêt. Module expérimental : il contient des appels dump() de débogage.

## Exemple

```lua
extensions.load('core_dynamicProps')
core_dynamicProps.createDynamicProps({forestItemName = 'postbox_blue', propName = 'trashbin', poolSize = 9, spawnInViewRange = 150, spawnOffset = vec3(0,0,0)})
-- ... plus tard
core_dynamicProps.unloadAll()
```

## Remarques

- Paramètres de createDynamicProps : name (défaut « DynamicPropsId<n> »), forestItemName (nom de la donnée de forêt à remplacer), propName (modèle de véhicule à spawner), poolSize (défaut 10), spawnInViewRange en mètres (défaut 100), spawnOffset vec3 (défaut 0,0,0), artifacts (table, non utilisée).
- onUpdate suppose que le joueur 0 a un véhicule (getPlayerVehicle(0):getPosition()) et que core_camera existe ; sans véhicule joueur, erreur Lua.
- Bugs/incohérences : unloadAll renseigne tempCopy = deepcopy(...) puis DynamicProps:unload fait tempCopy[self] = nil (clé objet qui n'existe pas dans une liste) ; l'appel d'unload() après deepcopy reconstruit dynamicPropsObjs depuis cette copie, donc l'état n'est pas vraiment vidé. spawnProp/despawnProp appellent dump("Spawning"/"Despawning") à chaque bascule. checkVisibility (local, inutilisée) est pleine de dump().
- Les props sont des véhicules : ils apparaissent dans les listes de véhicules et sont nommés <propName><i> (avec licenseText identique).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `core_dynamicProps.createDynamicProps(data)` | Crée un gestionnaire de props dynamiques : indexe les objets de forêt portant forestItemName dans un quadtree, spawne poolSize véhicules désactivés (setActive(0)), recharge la collision (be:reloadCollision) et l'ajoute à la liste mise à jour par onUpdate. | 91 |
| `core_dynamicProps.onUpdate()` | Hook par image : mémorise la position de la caméra et du joueur 0, puis met à jour chaque gestionnaire (échange objets de forêt <-> props). *(interne)* *(hook)* | 278 |
| `core_dynamicProps.unloadAll()` | Renvoie tous les objets de forêt échangés à leur place, supprime les véhicules props du pool et recharge la collision (voir notes sur l'état conservé). | 286 |
| `core_dynamicProps.westCoastBin()` | Préréglage pour West Coast USA : remplace « postbox_blue » par le véhicule « trashbin » (pool 9, portée 150 m). | 306 |
| `core_dynamicProps.westCoastPole()` | Préréglage pour West Coast USA : remplace « pole_city1 » par le véhicule « streetlight » (pool 1, portée 100 m, décalage z -0.22). | 296 |

### Détail des paramètres

#### `core_dynamicProps.createDynamicProps(data)`

Crée un gestionnaire de props dynamiques : indexe les objets de forêt portant forestItemName dans un quadtree, spawne poolSize véhicules désactivés (setActive(0)), recharge la collision (be:reloadCollision) et l'ajoute à la liste mise à jour par onUpdate.

- `data` (*table*) : forestItemName, propName, poolSize, spawnInViewRange, spawnOffset, name, artifacts (voir notes). Une table vide est refusée (journal d'erreur, aucun objet créé).

## Classe `DynamicProps`

Un gestionnaire (pool) de props dynamiques pour un type d'objet de forêt. Champs : name, forestItemName, propName, poolSize, spawnInViewRange, spawnOffset, props (table<vehId, boolean> : true = utilisé), locationsInfo (liste d'emplacements {forestItem, switched, originPos, distance, linkedPropId, id}), forestQt (quadtree).

| Méthode | Description | Ligne |
|---|---|---|
| `DynamicProps:__tostring()` | Texte « Pool name : ... Forest item : ... Prop Item : ... ». | 63 |
| `DynamicProps:despawnProp(locationInfo)` | Remet le véhicule à neuf (resetBrokenFlexMesh), le désactive et rend l'objet de forêt à sa position d'origine. | 164 |
| `DynamicProps:findForestItems()` | Cherche l'objet « theForest », liste ses items dont le nom de donnée vaut forestItemName et construit le quadtree des emplacements (journal si pas de forêt). | 111 |
| `DynamicProps:getFirstPropAvailable()` | Prend le premier véhicule libre du pool et le marque utilisé. | 139 |
| `DynamicProps:new(data)` | Constructeur ; renvoie nil (journal d'erreur) si data est vide. | 67 |
| `DynamicProps:onUpdate()` | Choisit les emplacements dans la portée du joueur, les trie par distance, rend à la forêt ceux qui sortent de portée ou excèdent le pool, et donne un véhicule aux plus proches. | 178 |
| `DynamicProps:spawnProp(locationInfo, propId)` | Cache l'objet de forêt (le déplace sous la carte), active le véhicule et le place à la position d'origine + spawnOffset avec la rotation de l'objet de forêt. | 149 |
| `DynamicProps:spawnProps()` | Spawne poolSize véhicules propName (nommés propName..i, désactivés, sans entrer dedans) et les marque libres. | 99 |
| `DynamicProps:unload()` | Rend tous les emplacements échangés puis supprime les véhicules du pool (retire aussi de l'éditeur si présent). | 254 |

## Appels vers le moteur (C++)

- `be:` `reloadCollision`
- `debugDrawer:` `drawLine`
- `obj:` `findForestItems`, `spawnProps`
- `scenetree.` `findObject`, `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/core/dynamicProps.lua`.*
