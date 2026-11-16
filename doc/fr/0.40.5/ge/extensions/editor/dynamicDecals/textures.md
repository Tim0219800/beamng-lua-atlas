# `editor_dynamicDecals_textures`

*Fichier : `lua/ge/extensions/editor/dynamicDecals/textures.lua` · VM : Game Engine (GE) · 595 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_dynamicDecals_textures` : `extensions.load("editor_dynamicDecals_textures")`, puis la globale `editor_dynamicDecals_textures`

Navigateur de textures de decals de l'outil Dynamic Decals (interface). Ajoute dans le navigateur les onglets « Textures » (ordre 10) et « Tags » (ordre 20), un inspecteur pour la sélection `editor.selection["dynamicDecalTexture"]` (édition des métadonnées/tags du fichier sidecar), la sélection multiple (Maj = plage, Ctrl = ajout), un menu contextuel pour affecter une texture à une propriété et une notification quand des fichiers de métadonnées manquants ont été créés. La logique de fichiers est dans editor_api_dynamicDecals_textures.

## Remarques

- Les fichiers dont le nom commence par « _ » sont exclus de la liste.
- Préférences `dynamicDecalsTool.textureBrowser` : loadImagesPerFrameCount (int 3), enableVirtualScrolling (bool true : seules les textures visibles sont chargées), texturePreviewSize (float 128, de 32 à 512).
- setup crée le dossier des textures (FS:directoryCreate) et appelle textures.setup() de l'API.
- Le même bloc de notification est dupliqué dans setup et dans onTextureFileAdded.
- onTextureFileDeleted modifie la liste pendant ipairs ; sans conséquence pour un seul fichier supprimé.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_dynamicDecals_textures.dynamicDecals_onTextureFileAdded(filepath)` | Hook appelé quand un fichier texture est ajouté au dossier surveillé : si des fichiers de métadonnées manquants ont été créés, ajoute une notification avec boutons de sélection. *(interne)* | 544 |
| `editor_dynamicDecals_textures.dynamicDecals_onTextureFileDeleted(filepath)` | Hook appelé quand un fichier texture est supprimé : le retire de la sélection `dynamicDecalTexture` (qui devient nil si elle est vide). *(interne)* | 572 |
| `editor_dynamicDecals_textures.editorPreferenceValueChanged(path, value)` | Hook appelé quand une préférence change. Ne fait rien ici. *(interne)* | 257 |
| `editor_dynamicDecals_textures.getTexturesDirectoryPath()` | Renvoie le dossier des textures de decals (délègue à editor_api_dynamicDecals_textures). | 585 |
| `editor_dynamicDecals_textures.registerEditorPreferences(prefsRegistry)` | Enregistre la sous-catégorie `dynamicDecalsTool.textureBrowser` (loadImagesPerFrameCount, enableVirtualScrolling, texturePreviewSize). *(interne)* | 249 |
| `editor_dynamicDecals_textures.setup(tool_in)` | Appelé par l'outil : récupère les modules liés, enregistre les onglets Textures et Tags, la page de doc « Browser / Textures » et l'inspecteur du type dynamicDecalTexture, crée le dossier des textures, initialise l'API de textures et notifie les fichiers de métadonnées manquants. *(interne)* | 492 |

### Détail des paramètres

#### `editor_dynamicDecals_textures.dynamicDecals_onTextureFileAdded(filepath)`

Hook appelé quand un fichier texture est ajouté au dossier surveillé : si des fichiers de métadonnées manquants ont été créés, ajoute une notification avec boutons de sélection.

- `filepath` (*string*) : Chemin du fichier ajouté (non utilisé directement).

#### `editor_dynamicDecals_textures.dynamicDecals_onTextureFileDeleted(filepath)`

Hook appelé quand un fichier texture est supprimé : le retire de la sélection `dynamicDecalTexture` (qui devient nil si elle est vide).

- `filepath` (*string*) : Chemin du fichier supprimé.

#### `editor_dynamicDecals_textures.editorPreferenceValueChanged(path, value)`

Hook appelé quand une préférence change. Ne fait rien ici.

- `path` (*string*) : Chemin de la préférence.
- `value` (*any*) : Nouvelle valeur.

#### `editor_dynamicDecals_textures.getTexturesDirectoryPath()`

Renvoie le dossier des textures de decals (délègue à editor_api_dynamicDecals_textures).

- **renvoie** : string Chemin du dossier de textures.

#### `editor_dynamicDecals_textures.registerEditorPreferences(prefsRegistry)`

Enregistre la sous-catégorie `dynamicDecalsTool.textureBrowser` (loadImagesPerFrameCount, enableVirtualScrolling, texturePreviewSize).

- `prefsRegistry` (*table*) : Registre de préférences de l'éditeur.

#### `editor_dynamicDecals_textures.setup(tool_in)`

Appelé par l'outil : récupère les modules liés, enregistre les onglets Textures et Tags, la page de doc « Browser / Textures » et l'inspecteur du type dynamicDecalTexture, crée le dossier des textures, initialise l'API de textures et notifie les fichiers de métadonnées manquants.

- `tool_in` (*table*) : Référence à l'outil editor_dynamicDecalsTool.

## Appels vers le moteur (C++)

- `FS:` `directoryCreate`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/dynamicDecals/textures.lua`.*
