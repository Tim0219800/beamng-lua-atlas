---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/terrainGenerator.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Utilitaire (encore en chantier selon le commentaire du fichier) qui génère un bloc de terrain (TerrainBlock) à partir d'une carte de hauteur : un tableau Lua de hauteurs ou un PNG. Il gère aussi les cartes de trous, les cartes de couches (layerMap) et les matériaux de terrain lus depuis un JSON. Un moddeur l'utilise depuis la console pour créer ou remplacer le terrain d'un niveau (par exemple smallgrid). Le module n'expose que new(data), qui renvoie un objet dont les méthodes sont décrites dans la classe C.
--- Accès : extension `util_terrainGenerator` : `extensions.load("util_terrainGenerator")`, puis la globale `util_terrainGenerator`
---@class util_terrainGenerator
util_terrainGenerator = {}

--- Crée un générateur de terrain et appelle init(data). Renvoie l'objet (classe C) sur lequel on appelle les méthodes.
---Source : lua/ge/extensions/util/terrainGenerator.lua:468
---@param data table|nil Options facultatives : terrainScale (taille de maille, 1 par défaut), terrainHeight, name ('temp'), terrainName ('theTerrain'), userDir ('temp/'), heightMap, holeMap, textureMaps, materials.
---@return table  Instance du générateur de terrain.
function util_terrainGenerator.new(data) end

--- Objet renvoyé par new(data) : conserve la carte de hauteur (GBitmap), l'échelle, la hauteur max, le dossier utilisateur, les matériaux et les cartes de couches.
---@class util_terrainGenerator_C
local util_terrainGenerator_C = {}

--- Place le terrain pour que l'origine du monde soit au centre du bloc (décalage de -taille/2 en x et y).
---Source : lua/ge/extensions/util/terrainGenerator.lua:105
function util_terrainGenerator_C:centerTerrain() end

--- Crée le terrain à partir des paramètres enregistrés : supprime l'ancien, crée un TerrainBlock, applique le TextureSet éventuel, ajoute les matériaux, importe les cartes (importMaps) et sauvegarde le fichier terrain. Logue une erreur et sort si le PNG de hauteur est introuvable ou si matériaux et cartes diffèrent en nombre.
---Source : lua/ge/extensions/util/terrainGenerator.lua:380
function util_terrainGenerator_C:createTerrain() end

--- Exporte en PNG la carte de hauteur, les cartes de trous et les cartes de couches du terrain actuel (fonctionne sur n'importe quel terrain existant).
---Source : lua/ge/extensions/util/terrainGenerator.lua:188
---@param dir string|nil Dossier de sortie ; userDir par défaut. Doit se terminer par '/' (concaténation directe).
---@param prefix string|nil Préfixe des fichiers ; name par défaut.
function util_terrainGenerator_C:exportTerrainMaps(dir, prefix) end

--- Renvoie la hauteur utilisateur (getHeightScaleUser) du terrain actuel, ou 0 s'il n'y a pas de terrain.
---Source : lua/ge/extensions/util/terrainGenerator.lua:90
---@return number  Hauteur maximale en mètres.
function util_terrainGenerator_C:getMaxHeight() end

--- Construit l'entrée de données d'une carte de couche pour un matériau (canal R, materialId = nombre de cartes déjà présentes).
---Source : lua/ge/extensions/util/terrainGenerator.lua:184
---@param path string Chemin du PNG de la couche.
---@param matName string|nil Nom du matériau.
---@return table  {path, selected, material, materialId, channel, channelId}.
function util_terrainGenerator_C:getTextureMap(path, matName) end

--- Initialise les champs depuis data (échelle, hauteur, noms, chemins, matériaux), crée un GBitmap vide et vide le dossier temp/. Appelée par new().
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/terrainGenerator.lua:39
---@param data table|nil Options (voir new).
function util_terrainGenerator_C:init(data) end

--- Charge un PNG de hauteur dans le bitmap, met à jour heightMap et bitmapWidth.
---Source : lua/ge/extensions/util/terrainGenerator.lua:73
---@param path string|nil Chemin du fichier ; self.heightMap par défaut.
function util_terrainGenerator_C:loadBitmap(path) end

--- Supprime le terrain actuel puis, sauf si deleteOnly, crée un nouveau TerrainBlock nommé terrainName, rattaché au dossier du niveau courant et ajouté à MissionGroup.
---Source : lua/ge/extensions/util/terrainGenerator.lua:172
---@param deleteOnly boolean|nil Si vrai, supprime seulement le terrain.
function util_terrainGenerator_C:resetTerrain(deleteOnly) end

--- Supprime dans le dossier les fichiers *heightMap.png, *holeMap.png et *layerMap_*.png.
---Source : lua/ge/extensions/util/terrainGenerator.lua:159
---@param dir string|nil Dossier ; self.userDir par défaut.
function util_terrainGenerator_C:resetUserDir(dir) end

--- Sauvegarde le bitmap de hauteur en PNG (ajoute .png si absent) et mémorise le chemin dans heightMap. Logue une erreur et sort si la sauvegarde échoue.
---Source : lua/ge/extensions/util/terrainGenerator.lua:57
---@param path string|nil Chemin du fichier ; self.heightMap par défaut.
function util_terrainGenerator_C:saveBitmap(path) end

--- Construit le bitmap R16 depuis un tableau 2D array[x][y] (indices à partir de 1), complète les trous avec 0, arrondit la taille au multiple de 128 et sauvegarde le PNG. Met terrainHeight à la hauteur max du tableau.
---Source : lua/ge/extensions/util/terrainGenerator.lua:118
---@param array table<integer, table<integer, number>> Hauteurs en mètres. Modifié en place (remplissage).
function util_terrainGenerator_C:setBitmapFromArray(array) end

--- Crée le matériau de terrain 'default' (grille du niveau smallgrid) et en fait le seul matériau de l'objet.
---Source : lua/ge/extensions/util/terrainGenerator.lua:233
function util_terrainGenerator_C:setDefaultMaterial() end

--- Définit les matériaux de terrain avant création. Sans argument, reprend ceux du terrain existant (hors 'warning_material'). Avec matData.filePath, lit un JSON de matériaux et crée les TerrainMaterial correspondants (champs v1 et v1.5, TextureSet). Avec matData.materials, utilise directement la liste. Retombe sur le matériau par défaut si rien n'est défini.
---Source : lua/ge/extensions/util/terrainGenerator.lua:249
---@param matData table|nil {filePath = chemin JSON} ou {materials = liste de noms}.
function util_terrainGenerator_C:setMaterials(matData) end

--- Renseigne directement le PNG de hauteur et ses paramètres.
---Source : lua/ge/extensions/util/terrainGenerator.lua:203
---@param path string Chemin du PNG de hauteur.
---@param size integer Largeur du bitmap en pixels.
---@param height number Hauteur maximale du terrain.
---@param scale number Taille de maille.
---@param flipY boolean Inverse l'axe Y des cartes.
function util_terrainGenerator_C:setPngData(path, size, height, scale, flipY) end

--- Écrit un pixel de la carte de hauteur. x et y commencent à 0 ; z est normalisé par terrainHeight et borné à [0, 1].
---Source : lua/ge/extensions/util/terrainGenerator.lua:112
---@param x integer Colonne du pixel (à partir de 0).
---@param y integer Ligne du pixel (à partir de 0).
---@param z number Hauteur en mètres.
function util_terrainGenerator_C:setPoint(x, y, z) end

--- Déplace le bloc de terrain à la position donnée (vec3(0,0,0) correspond au coin du bloc) et recharge la collision.
---Source : lua/ge/extensions/util/terrainGenerator.lua:98
---@param vec vec3 Nouvelle position du terrain.
function util_terrainGenerator_C:setTerrainOffset(vec) end

--- Associe chaque matériau à son PNG *_layerMap_*.png trouvé dans userDir, et génère un PNG vide (blanc pour le matériau par défaut, noir sinon) pour ceux qui n'en ont pas.
---Source : lua/ge/extensions/util/terrainGenerator.lua:339
function util_terrainGenerator_C:setTextureMaps() end

--- Définit le dossier de projet et, s'il existe, repère automatiquement le PNG de hauteur, le PNG de trous et le fichier *materials.json (qu'il charge via setMaterials).
---Source : lua/ge/extensions/util/terrainGenerator.lua:211
---@param dir string|nil Dossier ; 'temp/' par défaut. Un '/' final est ajouté si absent.
function util_terrainGenerator_C:setUserDir(dir) end

