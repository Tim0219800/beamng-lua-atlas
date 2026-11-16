# `util_terrainGenerator`

*Fichier : `lua/ge/extensions/util/terrainGenerator.lua` · VM : Game Engine (GE) · 478 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `util_terrainGenerator` : `extensions.load("util_terrainGenerator")`, puis la globale `util_terrainGenerator`

Utilitaire (encore en chantier selon le commentaire du fichier) qui génère un bloc de terrain (TerrainBlock) à partir d'une carte de hauteur : un tableau Lua de hauteurs ou un PNG. Il gère aussi les cartes de trous, les cartes de couches (layerMap) et les matériaux de terrain lus depuis un JSON. Un moddeur l'utilise depuis la console pour créer ou remplacer le terrain d'un niveau (par exemple smallgrid). Le module n'expose que new(data), qui renvoie un objet dont les méthodes sont décrites dans la classe C.

## Exemple

```lua
extensions.load('util/terrainGenerator')
local obj = util_terrainGenerator.new()
local arr = {}
for x = 1, 256 do
  arr[x] = {}
  for y = 1, 256 do arr[x][y] = randomGauss3() / 5 end
end
obj:setBitmapFromArray(arr)
obj:createTerrain()
obj:centerTerrain()
```

## Remarques

- Les dimensions de la carte doivent être multiples de 128 : setBitmapFromArray arrondit la taille au multiple de 128 supérieur et complète avec des 0.
- Les hauteurs sont écrites dans un bitmap GFXFormatR16 : z est ramené à [0, terrainHeight] puis multiplié par 65535. Les hauteurs négatives sont donc écrasées à 0.
- setBitmapFromArray remplace terrainHeight par la hauteur maximale du tableau et sauvegarde le PNG (self.heightMap, par défaut 'temp/temp_heightMap.png').
- init appelle resetUserDir('temp/') : tous les fichiers *heightMap.png, *holeMap.png et *layerMap_*.png du dossier temp/ sont supprimés à chaque création d'objet.
- createTerrain supprime le terrain existant (resetTerrain) avant d'en créer un nouveau, puis sauvegarde le fichier .ter du niveau.
- createTerrain exige autant de matériaux que de cartes de couches ; sinon il supprime le terrain et sort sur une erreur (le terrain est alors perdu).
- Dans init, terrainHeight est initialisé avec getMaxHeight() qui appelle core_terrain.getTerrain() : sans terrain chargé la valeur est 0.
- Dans setUserDir, les fichiers sont recherchés dans le dossier ; la première correspondance de chaque type (*heightMap.png, *holeMap.png, *materials.json) est retenue.
- Incohérence : setPngData ne contrôle pas ses arguments et écrase flipYAxis avec flipY, qui vaut nil si omis.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `util_terrainGenerator.new(data)` | Crée un générateur de terrain et appelle init(data). Renvoie l'objet (classe C) sur lequel on appelle les méthodes. | 468 |

### Détail des paramètres

#### `util_terrainGenerator.new(data)`

Crée un générateur de terrain et appelle init(data). Renvoie l'objet (classe C) sur lequel on appelle les méthodes.

- `data` (*table|nil*) : Options facultatives : terrainScale (taille de maille, 1 par défaut), terrainHeight, name ('temp'), terrainName ('theTerrain'), userDir ('temp/'), heightMap, holeMap, textureMaps, materials.
- **renvoie** : table Instance du générateur de terrain.

## Classe `C`

Objet renvoyé par new(data) : conserve la carte de hauteur (GBitmap), l'échelle, la hauteur max, le dossier utilisateur, les matériaux et les cartes de couches.

| Méthode | Description | Ligne |
|---|---|---|
| `C:centerTerrain()` | Place le terrain pour que l'origine du monde soit au centre du bloc (décalage de -taille/2 en x et y). | 105 |
| `C:createTerrain()` | Crée le terrain à partir des paramètres enregistrés : supprime l'ancien, crée un TerrainBlock, applique le TextureSet éventuel, ajoute les matériaux, importe les cartes (importMaps) et sauvegarde le fichier terrain. Logue une erreur et sort si le PNG de hauteur est introuvable ou si matériaux et cartes diffèrent en nombre. | 380 |
| `C:exportTerrainMaps(dir, prefix)` | Exporte en PNG la carte de hauteur, les cartes de trous et les cartes de couches du terrain actuel (fonctionne sur n'importe quel terrain existant). | 188 |
| `C:getMaxHeight()` | Renvoie la hauteur utilisateur (getHeightScaleUser) du terrain actuel, ou 0 s'il n'y a pas de terrain. | 90 |
| `C:getTextureMap(path, matName)` | Construit l'entrée de données d'une carte de couche pour un matériau (canal R, materialId = nombre de cartes déjà présentes). | 184 |
| `C:init(data)` | Initialise les champs depuis data (échelle, hauteur, noms, chemins, matériaux), crée un GBitmap vide et vide le dossier temp/. Appelée par new(). | 39 |
| `C:loadBitmap(path)` | Charge un PNG de hauteur dans le bitmap, met à jour heightMap et bitmapWidth. | 73 |
| `C:resetTerrain(deleteOnly)` | Supprime le terrain actuel puis, sauf si deleteOnly, crée un nouveau TerrainBlock nommé terrainName, rattaché au dossier du niveau courant et ajouté à MissionGroup. | 172 |
| `C:resetUserDir(dir)` | Supprime dans le dossier les fichiers *heightMap.png, *holeMap.png et *layerMap_*.png. | 159 |
| `C:saveBitmap(path)` | Sauvegarde le bitmap de hauteur en PNG (ajoute .png si absent) et mémorise le chemin dans heightMap. Logue une erreur et sort si la sauvegarde échoue. | 57 |
| `C:setBitmapFromArray(array)` | Construit le bitmap R16 depuis un tableau 2D array[x][y] (indices à partir de 1), complète les trous avec 0, arrondit la taille au multiple de 128 et sauvegarde le PNG. Met terrainHeight à la hauteur max du tableau. | 118 |
| `C:setDefaultMaterial()` | Crée le matériau de terrain 'default' (grille du niveau smallgrid) et en fait le seul matériau de l'objet. | 233 |
| `C:setMaterials(matData)` | Définit les matériaux de terrain avant création. Sans argument, reprend ceux du terrain existant (hors 'warning_material'). Avec matData.filePath, lit un JSON de matériaux et crée les TerrainMaterial correspondants (champs v1 et v1.5, TextureSet). Avec matData.materials, utilise directement la liste. Retombe sur le matériau par défaut si rien n'est défini. | 249 |
| `C:setPngData(path, size, height, scale, flipY)` | Renseigne directement le PNG de hauteur et ses paramètres. | 203 |
| `C:setPoint(x, y, z)` | Écrit un pixel de la carte de hauteur. x et y commencent à 0 ; z est normalisé par terrainHeight et borné à [0, 1]. | 112 |
| `C:setTerrainOffset(vec)` | Déplace le bloc de terrain à la position donnée (vec3(0,0,0) correspond au coin du bloc) et recharge la collision. | 98 |
| `C:setTextureMaps()` | Associe chaque matériau à son PNG *_layerMap_*.png trouvé dans userDir, et génère un PNG vide (blanc pour le matériau par défaut, noir sinon) pour ceux qui n'en ont pas. | 339 |
| `C:setUserDir(dir)` | Définit le dossier de projet et, s'il existe, repère automatiquement le PNG de hauteur, le PNG de trous et le fichier *materials.json (qu'il charge via setMaterials). | 211 |

## Appels vers le moteur (C++)

- `FS:` `directoryExists`, `fileExists`, `findFiles`, `removeFile`
- `be:` `reloadCollision`
- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/util/terrainGenerator.lua`.*
