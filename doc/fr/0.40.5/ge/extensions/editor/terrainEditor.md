# `editor_terrainEditor`

*Fichier : `lua/ge/extensions/editor/terrainEditor.lua` · VM : Game Engine (GE) · 3379 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_terrainEditor` : `extensions.load("editor_terrainEditor")`, puis la globale `editor_terrainEditor`

Éditeur de terrain du World Editor (mode d'édition « Terrain Tools », terrainToolsEditMode). Il gère les pinceaux de sculpture, de peinture de matériaux et de terraformage (via extensions/editor/terraformTool), le choix du TerrainBlock actif, la bibliothèque de matériaux de terrain du niveau (art/terrain/main.materials.json) sous forme de « proxies », la fenêtre d'import/export de terrain (heightmap, hole map, cartes de texture, meshes, presets) et la sauvegarde du terrain et des matériaux avant l'enregistrement du niveau. Un moddeur s'en sert surtout pour récupérer le TerrainBlock/l'objet TerrainEditor (getTerrainBlock, getTerrainEditor), marquer le terrain modifié (setTerrainDirty) ou manipuler les matériaux peints.

## Exemple

```lua
local te = extensions.editor_terrainEditor
local tb = te.getTerrainBlock()
if tb then
  tb:setHeight(10, 10, 5.0)
  tb:updateGrid(vec3(10,10), vec3(10,10))
  te.setTerrainDirty()
end
```

## Remarques

- Les chemins de matériaux sont /art/terrain/main.materials.json (ou /art/terrains/... pour l'ancien format, détecté par checkForTerrainMaterialFileFormat) ; ils sont lus relatifs à var.levelPath.
- Pinceau : taille 1 à 256 (changeBrushSize), pression/douceur/hauteur en pourcentage dans les préférences terrainEditor.general.* ; terraformage : préférences terrainEditor.terraform.* (DOI, marge, falloff, rugosité, échelle).
- Les indices de matériaux de peinture côté Lua sont à base 1 (k) alors que le TerrainBlock/terrainEditor C++ attend k-1.
- Hooks émis (extensions.hook) autour de la sauvegarde du terrain : onEditorBeforeSaveTerrain puis onEditorAfterSaveTerrain, pour les outils avec un overlay de peinture en direct.
- Migration automatique : si un matériau n'a pas de groundmodelName, il est rempli depuis l'internalName en majuscules (ou 'ASPHALT' pour un matériau neuf), avec avertissement et marquage sale.
- getTerrainBlock() renvoie nil s'il n'y a pas de TerrainBlock actif (ex. niveau smallgrid).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_terrainEditor.beginChangeBrushSizeWithKeys(direction)` | Active l'auto-répétition du changement de taille de pinceau avec les touches [ et ]. | 3376 |
| `editor_terrainEditor.changeBrushSize(value, step)` | Augmente (value == 1) ou diminue (value == 0) la taille du pinceau de `step`, bornée à 1-256, et l'applique au TerrainEditor. Toute autre valeur de value ne change rien. | 2482 |
| `editor_terrainEditor.checkForTerrainMaterialFileFormat()` | Détecte l'emplacement du fichier de matériaux (art/terrain ou ancien art/terrains) et signale le format obsolète (errors.deprecated_material_file). | 2798 |
| `editor_terrainEditor.copyMaterialProxyWithInputs(mtlProxy)` | Copie profonde d'un proxy de matériau en recréant les widgets imgui d'entrée (nom, taille, forces…). Remplit le groundmodelName depuis l'internalName en majuscules s'il est vide. | 621 |
| `editor_terrainEditor.createMaterialProxy(index, pid, mtlObject, name, dirty, isNew)` | Construit un proxy Lua d'un matériau de terrain (cartes diffuse/normal/detail/macro, tailles, forces, distances, side projection, parallaxScale, groundmodelName, uniqueID = nom-persistentId). Appelle fixGroundmodelName ; si dirty est vrai, marque aussi le terrain modifié. | 671 |
| `editor_terrainEditor.deleteMaterialInJson(name)` | Retire de la bibliothèque en mémoire le matériau dont l'internalName est donné (ne modifie pas le fichier). | 3346 |
| `editor_terrainEditor.dragDropTarget(mtlProxy, map, cbData)` | Cible de glisser-déposer imgui pour un asset (payload ASSETDRAGDROP de 2048 octets) : appelle updateMap avec le chemin déposé. À appeler juste après un widget imgui. | 409 |
| `editor_terrainEditor.endChangeBrushSizeWithKeys()` | Arrête l'auto-répétition du changement de taille de pinceau. | 3377 |
| `editor_terrainEditor.fixGroundmodelName(name, mtlObject, isNew)` | Migration : auparavant le groundmodel était stocké dans l'internalName ; maintenant un champ groundmodel dédié existe. Si ce champ est vide, il est rempli depuis l'internalName en majuscules (ou « ASPHALT » pour un matériau neuf), le matériau est marqué sale et un avertissement est logué. | 649 |
| `editor_terrainEditor.fixedFileFormat()` | Efface l'erreur « deprecated_material_file » (à appeler une fois le fichier de matériaux mis à niveau). | 3375 |
| `editor_terrainEditor.getErrors()` | Table des erreurs/avertissements de format détectés (clé -> true). | 3373 |
| `editor_terrainEditor.getLevelPath()` | Chemin du niveau courant (var.levelPath). | 3374 |
| `editor_terrainEditor.getMatFilePath()` | Chemin (relatif au niveau) du fichier des matériaux de terrain, normalement '/art/terrain/main.materials.json'. | 3371 |
| `editor_terrainEditor.getMaterialsInJson()` | Bibliothèque de matériaux du niveau lue dans le JSON. | 3367 |
| `editor_terrainEditor.getMtlIdByName(matName)` | Cherche un matériau d'import par nom (exact, puis insensible à la casse). Renvoie son indice à base 0, son nom et si trouvé ; sinon 0 et le premier matériau avec found=false ; (0, 'unknown', false) s'il n'y en a aucun. | 223 |
| `editor_terrainEditor.getPaintMaterialProxies()` | Liste des proxies des matériaux de peinture du TerrainBlock actif. | 3369 |
| `editor_terrainEditor.getSelectedPaintMaterialProxy()` | Proxy du matériau de peinture sélectionné (ou nil). | 3368 |
| `editor_terrainEditor.getTerrainBlock()` | Renvoie l'objet TerrainBlock actif (recherché par son id) ou nil s'il n'y en a pas. | 3366 |
| `editor_terrainEditor.getTerrainBlockMaterialIndex(name)` | Indice (base 1) du matériau de peinture portant cet internalName, ou -1 s'il n'est pas dans le bloc. | 3355 |
| `editor_terrainEditor.getTerrainBlockProxies()` | Table des proxies de TerrainBlock indexée par nom d'objet. | 3370 |
| `editor_terrainEditor.getTerrainEditor()` | Renvoie l'objet TerrainEditor (C++) utilisé pour les conversions monde/grille, les pinceaux et les actions. | 3365 |
| `editor_terrainEditor.getTerrainFolder()` | Dossier des matériaux de terrain du niveau : '/art/terrain/' ou l'ancien '/art/terrains/'. | 3372 |
| `editor_terrainEditor.getUniqueMtlName(initialName, counter)` | Renvoie un nom de matériau absent de la bibliothèque : initialName, puis initialName0, initialName1… | 721 |
| `editor_terrainEditor.getVars()` | Renvoie la table interne var (état de l'interface, levelPath, brosse courante…). | 3364 |
| `editor_terrainEditor.onClientEndMission()` | Hook appelé à la fin de la mission : vide la bibliothèque de matériaux en mémoire. *(interne)* *(hook)* | 3285 |
| `editor_terrainEditor.onEditorBeforeSaveLevel()` | Hook appelé avant l'enregistrement du niveau : sauvegarde les matériaux de terrain modifiés puis le fichier terrain (en émettant onEditorBeforeSaveTerrain / onEditorAfterSaveTerrain) si des modifications sont en attente. *(interne)* *(hook)* | 3120 |
| `editor_terrainEditor.onEditorDeactivated()` | Hook appelé quand l'éditeur est désactivé ; ne fait rien dans cette version. *(interne)* *(hook)* | 3282 |
| `editor_terrainEditor.onEditorDeleteSelection()` | Hook appelé avant la suppression de la sélection : détache les TerrainBlock sélectionnés du TerrainEditor et vide l'état si c'était le bloc actif, pour éviter des plantages. *(interne)* *(hook)* | 3297 |
| `editor_terrainEditor.onEditorGui()` | Hook de rendu : dessine le dialogue d'import, celui d'export, la fenêtre de peinture, la courbe de douceur et la barre d'outils du terrain. *(interne)* *(hook)* | 2399 |
| `editor_terrainEditor.onEditorInitialized()` | Hook d'initialisation de l'éditeur : enregistre les fenêtres (terrainPainter, import, export, courbe de douceur, modale autoPaint) et le mode d'édition « Terrain Tools », puis appelle initialize(). *(interne)* *(hook)* | 3258 |
| `editor_terrainEditor.onEditorObjectAdded(id)` | Hook appelé à l'ajout d'un objet dans l'éditeur : si c'est un TerrainBlock, rescanne les blocs (updateEditorTerrainBlocks). *(interne)* *(hook)* | 3289 |
| `editor_terrainEditor.onEditorPreferenceValueChanged(path, value)` | Hook appelé quand une préférence change : répercute terrainEditor.general.* (taille, pression, douceur, hauteur, pentes, filtre de sélection douce) et terrainEditor.terraform.* (DOI, marge, falloff, rugosité, échelle) sur le pinceau/terraformeur. *(interne)* *(hook)* | 3145 |
| `editor_terrainEditor.onEditorRegisterPreferences(prefsRegistry)` | Hook d'enregistrement des préférences : crée la catégorie terrainEditor (general, import, terrainMaterialLibrary, terraform) avec leurs valeurs par défaut et bornes. *(interne)* *(hook)* | 3215 |
| `editor_terrainEditor.removeMap(mtlProxy, mapType)` | Vide une carte d'un proxy (updateMap avec un chemin vide). Un TODO du code s'interroge sur l'origine de mtlProxy. | 1026 |
| `editor_terrainEditor.saveMaterials()` | Enregistre les matériaux de terrain modifiés (terrEd_PersistMan:saveDirty). | 1031 |
| `editor_terrainEditor.saveTerrainAndMaterials()` | Enregistre les matériaux puis le fichier terrain (.ter) du TerrainBlock actif, efface les notifications et affiche « Saved TerrainBlock ». | 1036 |
| `editor_terrainEditor.selectPaintMaterial(matProxy)` | Sélectionne un matériau de peinture et règle l'indice de peinture du TerrainEditor (index - 1). | 884 |
| `editor_terrainEditor.setActiveTerrainBlock(id)` | Définit le TerrainBlock sur lequel travaillent les outils (jusqu'à ce que l'utilisateur en choisisse un autre) : l'attache au TerrainEditor, réinitialise le matériau de peinture sélectionné et sélectionne le premier. Sans effet si l'id est introuvable. | 1059 |
| `editor_terrainEditor.setMaterialsDirty()` | Marque les matériaux de terrain comme modifiés (editor.setDirty + notification) ; ils seront sauvegardés avec le niveau. | 530 |
| `editor_terrainEditor.setTerrainDirty()` | Marque le terrain comme modifié (editor.setDirty) et affiche la notification « unsaved terrain changes ». Le terrain sera enregistré à la sauvegarde du niveau. À appeler après toute modification directe de la heightmap. | 525 |
| `editor_terrainEditor.setupVars()` | Voir plus haut : recalcule les variables d'interface. | 2389 |
| `editor_terrainEditor.updateEditorTerrainBlocks(preferredId)` | Rescanne les TerrainBlock du niveau, détache les anciens et attache tous les nouveaux au TerrainEditor, puis réactive le bloc préféré (ou l'actif, ou le premier) ; vide l'état s'il n'y en a plus. | 1108 |
| `editor_terrainEditor.updateMap(mtlProxy, map, path)` | Affecte un chemin de texture à une carte d'un proxy ('diffuse', 'macro', 'detail', 'normal') ou aux champs de l'importeur/exporteur ('heightMap', 'holeMap', 'textureMap', 'mesh', ou table {meshIndex=…}). | 377 |
| `editor_terrainEditor.updateMaterialLibrary()` | Relit le fichier de matériaux JSON du niveau et reconstruit la bibliothèque (materialsInJson). (Un TODO du code indique que cela devrait migrer vers terrainMaterialsEditor.lua.) | 733 |
| `editor_terrainEditor.updatePaintMaterialProxies()` | Reconstruit les proxies des matériaux de peinture du TerrainBlock actif (noms, indices, inTerrainBlock), avertit si le nombre ne correspond pas et resélectionne le matériau précédent. | 900 |
| `editor_terrainEditor.updateTerrainBlockProxies()` | Reconstruit la liste des TerrainBlock du niveau (proxies {selected, id} par nom) et la liste triée des noms pour le combo. | 1046 |

### Détail des paramètres

#### `editor_terrainEditor.beginChangeBrushSizeWithKeys(direction)`

Active l'auto-répétition du changement de taille de pinceau avec les touches [ et ].

- `direction` (*integer*) : Sens du changement (convention de changeBrushSize : 1 agrandir, 0 réduire, déduite du code)

#### `editor_terrainEditor.changeBrushSize(value, step)`

Augmente (value == 1) ou diminue (value == 0) la taille du pinceau de `step`, bornée à 1-256, et l'applique au TerrainEditor. Toute autre valeur de value ne change rien.

- `value` (*integer*) : 1 pour agrandir, 0 pour réduire
- `step` (*number*) : Incrément de taille

#### `editor_terrainEditor.copyMaterialProxyWithInputs(mtlProxy)`

Copie profonde d'un proxy de matériau en recréant les widgets imgui d'entrée (nom, taille, forces…). Remplit le groundmodelName depuis l'internalName en majuscules s'il est vide.

- `mtlProxy` (*table*) : Proxy source
- **renvoie** : table Copie avec champs *Input.

#### `editor_terrainEditor.createMaterialProxy(index, pid, mtlObject, name, dirty, isNew)`

Construit un proxy Lua d'un matériau de terrain (cartes diffuse/normal/detail/macro, tailles, forces, distances, side projection, parallaxScale, groundmodelName, uniqueID = nom-persistentId). Appelle fixGroundmodelName ; si dirty est vrai, marque aussi le terrain modifié.

- `index` (*integer*) : Indice (base 1)
- `pid` (*string|nil*) : persistentId (créé si vide)
- `mtlObject` (*userdata*) : Objet matériau de terrain
- `name` (*string*) : internalName
- `dirty` (*boolean|nil*) : true pour marquer sale
- `isNew` (*boolean|nil*) : true si matériau nouvellement créé
- **renvoie** : table Proxy du matériau.

#### `editor_terrainEditor.deleteMaterialInJson(name)`

Retire de la bibliothèque en mémoire le matériau dont l'internalName est donné (ne modifie pas le fichier).

- `name` (*string*) : internalName du matériau

#### `editor_terrainEditor.dragDropTarget(mtlProxy, map, cbData)`

Cible de glisser-déposer imgui pour un asset (payload ASSETDRAGDROP de 2048 octets) : appelle updateMap avec le chemin déposé. À appeler juste après un widget imgui.

- `mtlProxy` (*table*) : Proxy de matériau
- `map` (*string|table*) : Carte visée
- `cbData` (*any*) : Non utilisé (déduit du code)

#### `editor_terrainEditor.fixGroundmodelName(name, mtlObject, isNew)`

Migration : auparavant le groundmodel était stocké dans l'internalName ; maintenant un champ groundmodel dédié existe. Si ce champ est vide, il est rempli depuis l'internalName en majuscules (ou « ASPHALT » pour un matériau neuf), le matériau est marqué sale et un avertissement est logué.

- `name` (*string*) : internalName
- `mtlObject` (*userdata*) : Matériau
- `isNew` (*boolean|nil*) : true si nouveau

#### `editor_terrainEditor.getErrors()`

Table des erreurs/avertissements de format détectés (clé -> true).

- **renvoie** : table<string, boolean> 

#### `editor_terrainEditor.getLevelPath()`

Chemin du niveau courant (var.levelPath).

- **renvoie** : string|nil 

#### `editor_terrainEditor.getMatFilePath()`

Chemin (relatif au niveau) du fichier des matériaux de terrain, normalement '/art/terrain/main.materials.json'.

- **renvoie** : string 

#### `editor_terrainEditor.getMaterialsInJson()`

Bibliothèque de matériaux du niveau lue dans le JSON.

- **renvoie** : table Matériaux indexés par id/persistentId, avec internalName, etc.

#### `editor_terrainEditor.getMtlIdByName(matName)`

Cherche un matériau d'import par nom (exact, puis insensible à la casse). Renvoie son indice à base 0, son nom et si trouvé ; sinon 0 et le premier matériau avec found=false ; (0, 'unknown', false) s'il n'y en a aucun.

- `matName` (*string*) : Nom du matériau
- **renvoie** : integer Indice (base 0)
- **renvoie** : string Nom retenu
- **renvoie** : boolean true si trouvé

#### `editor_terrainEditor.getPaintMaterialProxies()`

Liste des proxies des matériaux de peinture du TerrainBlock actif.

- **renvoie** : table[] 

#### `editor_terrainEditor.getSelectedPaintMaterialProxy()`

Proxy du matériau de peinture sélectionné (ou nil).

- **renvoie** : table|nil 

#### `editor_terrainEditor.getTerrainBlock()`

Renvoie l'objet TerrainBlock actif (recherché par son id) ou nil s'il n'y en a pas.

- **renvoie** : userdata|nil TerrainBlock

#### `editor_terrainEditor.getTerrainBlockMaterialIndex(name)`

Indice (base 1) du matériau de peinture portant cet internalName, ou -1 s'il n'est pas dans le bloc.

- `name` (*string*) : internalName
- **renvoie** : integer Indice ou -1

#### `editor_terrainEditor.getTerrainBlockProxies()`

Table des proxies de TerrainBlock indexée par nom d'objet.

- **renvoie** : table<string, table> { [nom] = { selected = boolean, id = integer } }

#### `editor_terrainEditor.getTerrainEditor()`

Renvoie l'objet TerrainEditor (C++) utilisé pour les conversions monde/grille, les pinceaux et les actions.

- **renvoie** : userdata TerrainEditor

#### `editor_terrainEditor.getTerrainFolder()`

Dossier des matériaux de terrain du niveau : '/art/terrain/' ou l'ancien '/art/terrains/'.

- **renvoie** : string 

#### `editor_terrainEditor.getUniqueMtlName(initialName, counter)`

Renvoie un nom de matériau absent de la bibliothèque : initialName, puis initialName0, initialName1…

- `initialName` (*string|nil*) : Nom de base (« NewMaterial » par défaut).
- `counter` (*integer|nil*) : Suffixe de départ (récursif, interne).
- **renvoie** : string Nom unique.

#### `editor_terrainEditor.getVars()`

Renvoie la table interne var (état de l'interface, levelPath, brosse courante…).

- **renvoie** : table Table var

#### `editor_terrainEditor.onEditorObjectAdded(id)`

Hook appelé à l'ajout d'un objet dans l'éditeur : si c'est un TerrainBlock, rescanne les blocs (updateEditorTerrainBlocks).

- `id` (*integer*) : Id de l'objet ajouté

#### `editor_terrainEditor.onEditorPreferenceValueChanged(path, value)`

Hook appelé quand une préférence change : répercute terrainEditor.general.* (taille, pression, douceur, hauteur, pentes, filtre de sélection douce) et terrainEditor.terraform.* (DOI, marge, falloff, rugosité, échelle) sur le pinceau/terraformeur.

- `path` (*string*) : Chemin de la préférence
- `value` (*any*) : Nouvelle valeur

#### `editor_terrainEditor.onEditorRegisterPreferences(prefsRegistry)`

Hook d'enregistrement des préférences : crée la catégorie terrainEditor (general, import, terrainMaterialLibrary, terraform) avec leurs valeurs par défaut et bornes.

- `prefsRegistry` (*table*) : Registre de préférences de l'éditeur

#### `editor_terrainEditor.removeMap(mtlProxy, mapType)`

Vide une carte d'un proxy (updateMap avec un chemin vide). Un TODO du code s'interroge sur l'origine de mtlProxy.

- `mtlProxy` (*table*) : Proxy de matériau
- `mapType` (*string*) : Type de carte

#### `editor_terrainEditor.selectPaintMaterial(matProxy)`

Sélectionne un matériau de peinture et règle l'indice de peinture du TerrainEditor (index - 1).

- `matProxy` (*table*) : Proxy de matériau (avec .index à base 1)

#### `editor_terrainEditor.setActiveTerrainBlock(id)`

Définit le TerrainBlock sur lequel travaillent les outils (jusqu'à ce que l'utilisateur en choisisse un autre) : l'attache au TerrainEditor, réinitialise le matériau de peinture sélectionné et sélectionne le premier. Sans effet si l'id est introuvable.

- `id` (*integer*) : Id de l'objet TerrainBlock

#### `editor_terrainEditor.updateEditorTerrainBlocks(preferredId)`

Rescanne les TerrainBlock du niveau, détache les anciens et attache tous les nouveaux au TerrainEditor, puis réactive le bloc préféré (ou l'actif, ou le premier) ; vide l'état s'il n'y en a plus.

- `preferredId` (*integer|nil*) : Id du bloc à activer en priorité.

#### `editor_terrainEditor.updateMap(mtlProxy, map, path)`

Affecte un chemin de texture à une carte d'un proxy ('diffuse', 'macro', 'detail', 'normal') ou aux champs de l'importeur/exporteur ('heightMap', 'holeMap', 'textureMap', 'mesh', ou table {meshIndex=…}).

- `mtlProxy` (*table*) : Proxy de matériau (ignoré pour les cartes d'import)
- `map` (*string|table*) : Type de carte
- `path` (*string*) : Chemin du fichier

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onEditorAfterSaveTerrain`
- `onEditorBeforeSaveTerrain`

## Appels vers le moteur (C++)

- `FS:` `directoryCreate`, `directoryExists`, `fileExists`, `findFiles`, `stat`
- `debugDrawer:` `drawSphere`
- `obj:` `getClassName`, `getField`, `registerObject`, `setField`, `setPosition`
- `scenetree.` `findClassObjects`, `findObject`, `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/terrainEditor.lua`.*
