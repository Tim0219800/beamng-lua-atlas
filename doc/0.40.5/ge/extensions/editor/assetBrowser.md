# `editor_assetBrowser`

*Fichier : `lua/ge/extensions/editor/assetBrowser.lua` · VM : Game Engine (GE) · 5849 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_assetBrowser` : `extensions.load("editor_assetBrowser")`, puis la globale `editor_assetBrowser`

Fenêtre « Asset Browser » de l'éditeur de monde : explore l'arborescence des assets du niveau courant (dossier du niveau), de art/ commun et de vehicles/, affiche miniatures, matériaux, meshes et jeux de textures, et permet de les glisser dans la scène. L'objet sélectionné est stocké dans editor.selection["asset"] et affiché par l'inspecteur (type « asset »). Un moddeur s'en sert surtout via selectFileByPath / getAssetByPath pour localiser un fichier depuis un autre outil (ex. menu « Locate in Asset Browser » de l'arbre de scène pour les TSStatic).

## Remarques

- Les chemins passés à selectFileByPath/getAssetByPath sont des chemins virtuels du jeu commençant par 'levels/...' (niveau courant), ou par le nom d'un des dossiers racines chargés (var.allDirs).
- selectFileByPath ne fait rien si la racine n'est pas trouvée ; si le chemin ne contient pas le préfixe de la racine, string.match(path, rootPath.."(.+)") renvoie nil et l'appel suivant string.match(filepath, ...) lèverait une erreur (pas de garde dans le code).
- onFileChanged ne traite que les chemins /levels/<niveau courant>/... et /art/... une fois le chargement terminé (var.state == loading_done) ; les fichiers sans extension sont ignorés (considérés comme des dossiers, TODO dans le code).
- Les préférences sont sous 'assetBrowser.general.*' (thumbnailSize, skipImposters, fullPathSearch, instantiateMeshInFrontOfCamera, scrollSpeed, dragDropRotationMultiplier, etc.).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_assetBrowser.clearSelectedAsset()` | Désélectionne l'asset courant : remet selectedInABView (et selected si l'asset a un type) à false, vide editor.selection["asset"] et oublie l'entrée d'historique de sélection correspondante. | 813 |
| `editor_assetBrowser.getAssetByPath(path)` | Retrouve l'asset de l'arborescence chargée correspondant à un chemin virtuel (ex. 'levels/<niveau>/art/shapes/x.dae'). Détermine la racine (dossier du niveau ou dossier racine du même nom que le premier segment), descend jusqu'au dossier puis cherche le fichier. | 1736 |
| `editor_assetBrowser.getSelectedAsset()` | Renvoie l'asset actuellement sélectionné dans l'Asset Browser (editor.selection["asset"]). | 809 |
| `editor_assetBrowser.moveSelectionIndex(up)` | Déplace l'index de sélection dans la liste affichée d'un cran vers le haut ou le bas (borné entre 1 et var.maxListIndexVal) ; sert à la navigation au clavier (action map AssetBrowser). Sans effet si aucun index courant. | 5819 |
| `editor_assetBrowser.onEditorActivated()` | Hook appelé à l'activation de l'éditeur. Si l'asset sélectionné est un mesh ou un matériau, rafraîchit l'aperçu (meshPreview / matPreview). *(interne)* *(hook)* | 5255 |
| `editor_assetBrowser.onEditorGui()` | Hook appelé à chaque frame d'interface de l'éditeur : dessine la fenêtre Asset Browser, la fenêtre d'inspection d'image et les dialogues modaux de collections. *(interne)* *(hook)* | 5407 |
| `editor_assetBrowser.onEditorInitialized()` | Hook appelé à l'initialisation de l'éditeur : enregistre le gestionnaire d'inspecteur 'asset', les fenêtres (assetBrowser, image inspector, dialogues de collections), le mode d'édition assetBrowserEditMode, le menu Window > Asset Browser et l'entrée « Locate in Asset Browser » de l'arbre de scène (valide pour les TSStatic). *(interne)* *(hook)* | 5213 |
| `editor_assetBrowser.onEditorPreferenceValueChanged(path, value)` | Hook appelé quand une préférence de l'éditeur change ; recopie les valeurs 'assetBrowser.general.*' (taille des miniatures, filtres, tri, regroupement, vitesse de défilement, etc.) dans les options internes. *(interne)* *(hook)* | 5595 |
| `editor_assetBrowser.onEditorRegisterPreferences(prefsRegistry)` | Hook appelé pour déclarer les préférences de l'Asset Browser (catégorie 'assetBrowser', sous-catégorie 'general') : skipMainFolder, skipImposters, fullPathSearch, thumbnailSize, scrollSpeed, etc. *(interne)* *(hook)* | 5651 |
| `editor_assetBrowser.onEditorToolWindowGotFocus(windowName)` | Hook appelé quand une fenêtre d'outil prend le focus ; si c'est l'Asset Browser, empile l'action map 'AssetBrowser'. *(interne)* *(hook)* | 5624 |
| `editor_assetBrowser.onEditorToolWindowLostFocus(windowName)` | Hook appelé quand une fenêtre d'outil perd le focus ; si c'est l'Asset Browser, retire l'action map 'AssetBrowser'. *(interne)* *(hook)* | 5630 |
| `editor_assetBrowser.onFileChanged(path, type)` | Hook appelé quand un fichier change sur disque. Une fois l'arborescence chargée, met à jour le dossier concerné pour les fichiers sous /levels/<niveau courant>/ ou /art/ : 'modified' ajoute/rafraîchit l'asset (imposters, .cdae et .dae.png ignorés), 'deleted' le retire. *(interne)* *(hook)* | 5313 |
| `editor_assetBrowser.selectFileByPath(path)` | Interface publique : ouvre le dossier du fichier dans l'Asset Browser, sélectionne le fichier et fait défiler jusqu'à lui. Ouvre la fenêtre si elle n'est pas visible. | 1673 |

### Détail des paramètres

#### `editor_assetBrowser.getAssetByPath(path)`

Retrouve l'asset de l'arborescence chargée correspondant à un chemin virtuel (ex. 'levels/<niveau>/art/shapes/x.dae'). Détermine la racine (dossier du niveau ou dossier racine du même nom que le premier segment), descend jusqu'au dossier puis cherche le fichier.

- `path` (*string*) : Chemin virtuel complet du fichier
- **renvoie** : table|nil Entrée d'asset de l'Asset Browser, ou nil si la racine est introuvable (suite de la recherche : déduit du code)

#### `editor_assetBrowser.getSelectedAsset()`

Renvoie l'asset actuellement sélectionné dans l'Asset Browser (editor.selection["asset"]).

- **renvoie** : table|nil Asset sélectionné ou nil

#### `editor_assetBrowser.moveSelectionIndex(up)`

Déplace l'index de sélection dans la liste affichée d'un cran vers le haut ou le bas (borné entre 1 et var.maxListIndexVal) ; sert à la navigation au clavier (action map AssetBrowser). Sans effet si aucun index courant.

- `up` (*boolean*) : true pour monter (index - 1), false/nil pour descendre (index + 1)

#### `editor_assetBrowser.onEditorPreferenceValueChanged(path, value)`

Hook appelé quand une préférence de l'éditeur change ; recopie les valeurs 'assetBrowser.general.*' (taille des miniatures, filtres, tri, regroupement, vitesse de défilement, etc.) dans les options internes.

- `path` (*string*) : Chemin de la préférence, ex. 'assetBrowser.general.thumbnailSize'
- `value` (*any*) : Nouvelle valeur

#### `editor_assetBrowser.onEditorRegisterPreferences(prefsRegistry)`

Hook appelé pour déclarer les préférences de l'Asset Browser (catégorie 'assetBrowser', sous-catégorie 'general') : skipMainFolder, skipImposters, fullPathSearch, thumbnailSize, scrollSpeed, etc.

- `prefsRegistry` (*table*) : Registre de préférences de l'éditeur

#### `editor_assetBrowser.onEditorToolWindowGotFocus(windowName)`

Hook appelé quand une fenêtre d'outil prend le focus ; si c'est l'Asset Browser, empile l'action map 'AssetBrowser'.

- `windowName` (*string*) : Nom de la fenêtre

#### `editor_assetBrowser.onEditorToolWindowLostFocus(windowName)`

Hook appelé quand une fenêtre d'outil perd le focus ; si c'est l'Asset Browser, retire l'action map 'AssetBrowser'.

- `windowName` (*string*) : Nom de la fenêtre

#### `editor_assetBrowser.onFileChanged(path, type)`

Hook appelé quand un fichier change sur disque. Une fois l'arborescence chargée, met à jour le dossier concerné pour les fichiers sous /levels/<niveau courant>/ ou /art/ : 'modified' ajoute/rafraîchit l'asset (imposters, .cdae et .dae.png ignorés), 'deleted' le retire.

- `path` (*string*) : Chemin virtuel du fichier
- `type` (*string*) : 'modified' ou 'deleted' (seules valeurs traitées)

#### `editor_assetBrowser.selectFileByPath(path)`

Interface publique : ouvre le dossier du fichier dans l'Asset Browser, sélectionne le fichier et fait défiler jusqu'à lui. Ouvre la fenêtre si elle n'est pas visible.

- `path` (*string*) : Chemin virtuel du fichier, ex. 'levels/<niveau>/art/shapes/x.dae'

## Appels vers le moteur (C++)

- `FS:` `directoryCreate`, `directoryExists`, `directoryRemove`, `fileExists`, `findFiles`, `removeFile`, `stat`
- `Sim.` `deserializeObjectsFromText`, `findObjectById`, `getUniqueName`
- `obj:` `getPosition`, `serialize`
- `scenetree.` `findObject`, `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/assetBrowser.lua`.*
