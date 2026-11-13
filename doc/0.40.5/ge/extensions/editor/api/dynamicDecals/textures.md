# `editor_api_dynamicDecals_textures`

*Fichier : `lua/ge/extensions/editor/api/dynamicDecals/textures.lua` · VM : Game Engine (GE) · 298 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_api_dynamicDecals_textures` : `extensions.load("editor_api_dynamicDecals_textures")`, puis la globale `editor_api_dynamicDecals_textures`

Gestion des textures du système de decals dynamiques de l'éditeur. Scanne /art/dynamicDecals/textures (*.jpg et *.png), lit/écrit pour chacune un fichier « sidecar » <texture>.dynDecalTexture.json (version, type, isSdfCompatible, tags, vehicle), tient les index de tags et migre les sidecars anciens via editor_api_dynamicDecals_sidecarFileMigration. Un sidecar manquant est créé à partir d'un modèle par défaut.

## Remarques

- Version actuelle du sidecar : 2. Extension : .dynDecalTexture.json.
- reloadTextureFiles contient un « if true then return end » avant le tri : textureFiles n'est donc jamais trié ni les tags triés par usage (code mort derrière).
- getAndFlushMissingSidecarFiles met missingSidecarFiles à nil après lecture ; si appelé avant tout scan, shallowcopy(nil) peut échouer (déduit du code).
- addTexture (via onFileChanged) crée le sidecar par défaut mais ne l'ajoute pas aux index de tags (jsonWriteFile direct).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_api_dynamicDecals_textures.getAndFlushMissingSidecarFiles()` | Renvoie une copie de la liste des textures dont le sidecar manquait au dernier scan, puis vide la liste interne. | 282 |
| `editor_api_dynamicDecals_textures.getSidecarTemplate()` | Modèle de sidecar par défaut (version 2, type color, isSdfCompatible=false, tags vide, vehicle vide). | 281 |
| `editor_api_dynamicDecals_textures.getTags()` | Liste des tags distincts connus. | 290 |
| `editor_api_dynamicDecals_textures.getTagsWithRefs()` | Table tag -> liste des textures portant ce tag. | 291 |
| `editor_api_dynamicDecals_textures.getTextureFiles()` | Liste des chemins de textures connues (nil avant le premier scan). | 280 |
| `editor_api_dynamicDecals_textures.getTexturesDirectoryPath()` | Dossier des textures avec slash final : /art/dynamicDecals/textures/. | 292 |
| `editor_api_dynamicDecals_textures.onFileChanged(filepath, type)` | Hook de surveillance de fichiers. Pour un png/jpg sous le dossier des textures : 'added'/'modified' ajoute la texture (crée son sidecar si absent) et émet dynamicDecals_onTextureFileAdded(filepath) ; 'deleted' retire ses tags et la texture, et émet dynamicDecals_onTextureFileDeleted(filepath). *(interne)* *(hook)* | 244 |
| `editor_api_dynamicDecals_textures.readSidecarFile(textureFilepath)` | Lit le sidecar JSON d'une texture, nil s'il n'existe pas. | 76 |
| `editor_api_dynamicDecals_textures.reloadTextureFiles()` | Redécouvre toutes les textures, reconstruit les tags, migre les sidecars de version < 2 et crée les sidecars manquants (listés dans missingSidecarFiles). | 111 |
| `editor_api_dynamicDecals_textures.reloadTextureFilesAsync(callbacks)` | Équivalent yieldant de reloadTextureFiles, pour un job : la découverte et chaque texture traitée appellent callbacks.yield. | 162 |
| `editor_api_dynamicDecals_textures.setup()` | Récupère l'extension de migration, scanne les textures (bloquant) et crée le dossier de textures s'il manque. | 229 |
| `editor_api_dynamicDecals_textures.setupAsync(callbacks)` | Version de setup() à exécuter dans un job (jobsystem) : le scan est réparti sur plusieurs frames. Les callbacks sont transmis à reloadTextureFilesAsync. | 237 |
| `editor_api_dynamicDecals_textures.sidecarFileExists(textureFilepath)` | Teste l'existence du sidecar d'une texture. | 72 |
| `editor_api_dynamicDecals_textures.updateSidecarFile(textureFilepath, data)` | Écrit le sidecar et met à jour les index de tags (retire les anciens tags de la texture, ajoute les nouveaux). | 84 |

### Détail des paramètres

#### `editor_api_dynamicDecals_textures.getAndFlushMissingSidecarFiles()`

Renvoie une copie de la liste des textures dont le sidecar manquait au dernier scan, puis vide la liste interne.

- **renvoie** : string[] Chemins de textures

#### `editor_api_dynamicDecals_textures.getSidecarTemplate()`

Modèle de sidecar par défaut (version 2, type color, isSdfCompatible=false, tags vide, vehicle vide).

- **renvoie** : table Modèle (table partagée, à copier avant modification)

#### `editor_api_dynamicDecals_textures.getTags()`

Liste des tags distincts connus.

- **renvoie** : string[]|nil Tags (nil avant le premier scan)

#### `editor_api_dynamicDecals_textures.getTagsWithRefs()`

Table tag -> liste des textures portant ce tag.

- **renvoie** : table<string, string[]>|nil Index des tags

#### `editor_api_dynamicDecals_textures.getTextureFiles()`

Liste des chemins de textures connues (nil avant le premier scan).

- **renvoie** : string[]|nil Chemins

#### `editor_api_dynamicDecals_textures.getTexturesDirectoryPath()`

Dossier des textures avec slash final : /art/dynamicDecals/textures/.

- **renvoie** : string Chemin

#### `editor_api_dynamicDecals_textures.onFileChanged(filepath, type)`

Hook de surveillance de fichiers. Pour un png/jpg sous le dossier des textures : 'added'/'modified' ajoute la texture (crée son sidecar si absent) et émet dynamicDecals_onTextureFileAdded(filepath) ; 'deleted' retire ses tags et la texture, et émet dynamicDecals_onTextureFileDeleted(filepath).

- `filepath` (*string*) : Fichier modifié
- `type` (*string*) : 'added', 'modified' ou 'deleted'

#### `editor_api_dynamicDecals_textures.readSidecarFile(textureFilepath)`

Lit le sidecar JSON d'une texture, nil s'il n'existe pas.

- `textureFilepath` (*string*) : Chemin de la texture
- **renvoie** : table|nil Contenu du sidecar

#### `editor_api_dynamicDecals_textures.reloadTextureFilesAsync(callbacks)`

Équivalent yieldant de reloadTextureFiles, pour un job : la découverte et chaque texture traitée appellent callbacks.yield.

- `callbacks` (*table*) : yield(section) pendant la découverte et après chaque fichier ; onTotal(total) nombre de textures trouvées ; onProgress(count) textures traitées depuis le dernier appel

#### `editor_api_dynamicDecals_textures.setupAsync(callbacks)`

Version de setup() à exécuter dans un job (jobsystem) : le scan est réparti sur plusieurs frames. Les callbacks sont transmis à reloadTextureFilesAsync.

- `callbacks` (*table*) : yield, onTotal, onProgress (voir reloadTextureFilesAsync)

#### `editor_api_dynamicDecals_textures.sidecarFileExists(textureFilepath)`

Teste l'existence du sidecar d'une texture.

- `textureFilepath` (*string*) : Chemin de la texture
- **renvoie** : boolean true si le sidecar existe

#### `editor_api_dynamicDecals_textures.updateSidecarFile(textureFilepath, data)`

Écrit le sidecar et met à jour les index de tags (retire les anciens tags de la texture, ajoute les nouveaux).

- `textureFilepath` (*string*) : Chemin de la texture
- `data` (*table*) : Contenu du sidecar (voir getSidecarTemplate)

## Champs

| Champ | Type | Description |
|---|---|---|
| `textureType` | table<string, integer> | greyscale=0, color=1, sdf=2 (obsolète), fillTexture=3 |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `dynamicDecals_onTextureFileAdded`
- `dynamicDecals_onTextureFileDeleted`

## Appels vers le moteur (C++)

- `FS:` `directoryCreate`, `fileExists`, `findFiles`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/api/dynamicDecals/textures.lua`.*
