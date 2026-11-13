# `editor_fileDialog`

*Fichier : `lua/ge/extensions/editor/fileDialog.lua` · VM : Game Engine (GE) · 980 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_fileDialog` : `extensions.load("editor_fileDialog")`, puis la globale `editor_fileDialog`

Boîte de dialogue de fichiers ImGui de l'éditeur (ouvrir / enregistrer un fichier ou choisir un dossier) sur le système de fichiers virtuel du jeu (FS). Elle offre navigation, dossiers récents, favoris, tri par colonnes, recherche, filtres par type de fichier, aperçu d'images (jpg, jpeg, png, dds), création de dossier et confirmation d'écrasement. Un moddeur d'outil d'éditeur l'appelle via openFile / saveFile avec un callback.

## Exemple

```lua
extensions.load("editor_fileDialog")
editor_fileDialog.openFile(function(data)
  print(data.filepath)
end, {{"Any files", "*"}, {"JSON", ".json"}}, false, "/art/", false)
```

## Remarques

- Une seule boîte à la fois : si la fenêtre est déjà visible, openFile/saveFile renvoient false (erreur loguée). Le callback doit être une function sinon false.
- defaultPath vide ou nil est remplacé par "/" avec un avertissement.
- filenameSuffix est une liste de paires {libellé, motif} ; le motif est une chaîne (ex. ".json", "*") ou une table d'extensions. Si le premier filtre est "*" et qu'il y en a plusieurs, le deuxième est sélectionné par défaut.
- Le callback reçoit une table {path, action ("Open"/"Save"), filename, filepath, filetype} ; il est appelé via pcall (une erreur dans le callback est interceptée).
- Préférences enregistrées : files.fileDialog.maxFilePreviewSize (128-1024), gridLines, favourites, columns.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_fileDialog.onEditorActivated()` | Hook d'activation de l'éditeur ; vide. *(interne)* *(hook)* | 918 |
| `editor_fileDialog.onEditorDeactivated()` | Hook de désactivation de l'éditeur ; vide. *(interne)* *(hook)* | 921 |
| `editor_fileDialog.onEditorGui()` | Hook appelé chaque frame GUI de l'éditeur : dessine la fenêtre « fileDialog » si elle est visible (la masque si aucun cache de fichiers n'existe), plus la fenêtre de recherche intelligente. *(interne)* *(hook)* | 409 |
| `editor_fileDialog.onEditorInitialized()` | Hook appelé à l'initialisation de l'éditeur : enregistre les fenêtres (fileDialog 640x480, recentDirsWindow, smartSearchItems), les icônes d'images, restaure la visibilité des colonnes et masque la fenêtre. *(interne)* *(hook)* | 924 |
| `editor_fileDialog.onEditorRegisterPreferences(prefsRegistry)` | Hook appelé pour déclarer les préférences de la catégorie « files / fileDialog ». *(interne)* *(hook)* | 956 |
| `editor_fileDialog.onExtensionLoaded()` | Hook de chargement de l'extension ; vide. *(interne)* *(hook)* | 915 |
| `editor_fileDialog.openFile(callbackFn, filenameSuffix, selectFolder, defaultPath, preview, caseSensitivePattern)` | Ouvre la boîte de dialogue en mode « Open ». Appelle callbackFn avec les informations du fichier (ou dossier) choisi. | 907 |
| `editor_fileDialog.saveFile(callbackFn, filenameSuffix, selectFolder, defaultPath, overwriteDialogText)` | Ouvre la boîte de dialogue en mode « Save » (pas d'aperçu). Ajoute l'extension du filtre choisi au nom saisi si elle manque et demande confirmation en cas d'écrasement. | 911 |

### Détail des paramètres

#### `editor_fileDialog.onEditorRegisterPreferences(prefsRegistry)`

Hook appelé pour déclarer les préférences de la catégorie « files / fileDialog ».

- `prefsRegistry` (*table*) : Registre de préférences de l'éditeur.

#### `editor_fileDialog.openFile(callbackFn, filenameSuffix, selectFolder, defaultPath, preview, caseSensitivePattern)`

Ouvre la boîte de dialogue en mode « Open ». Appelle callbackFn avec les informations du fichier (ou dossier) choisi.

- `callbackFn` (*function*) : function(data) ; data = {path, action, filename, filepath, filetype}.
- `filenameSuffix` (*table|nil*) : Filtres {{libellé, motif}, …} ; défaut {{"Any files", "*"}}. Ignoré si selectFolder.
- `selectFolder` (*boolean|nil*) : true pour choisir un dossier.
- `defaultPath` (*string|nil*) : Dossier de départ (défaut "/").
- `preview` (*boolean|nil*) : Afficher un aperçu des fichiers.
- `caseSensitivePattern` (*boolean|nil*) : Filtre de motif sensible à la casse.
- **renvoie** : boolean true si la boîte s'ouvre, false si déjà ouverte ou callback invalide.

#### `editor_fileDialog.saveFile(callbackFn, filenameSuffix, selectFolder, defaultPath, overwriteDialogText)`

Ouvre la boîte de dialogue en mode « Save » (pas d'aperçu). Ajoute l'extension du filtre choisi au nom saisi si elle manque et demande confirmation en cas d'écrasement.

- `callbackFn` (*function*) : function(data), même format que openFile.
- `filenameSuffix` (*table|nil*) : Filtres {{libellé, motif}, …}.
- `selectFolder` (*boolean|nil*) : true pour choisir un dossier.
- `defaultPath` (*string|nil*) : Dossier de départ.
- `overwriteDialogText` (*string|nil*) : Texte de la confirmation d'écrasement (défaut : « Are you sure you want to overwrite this file »).
- **renvoie** : boolean true si la boîte s'ouvre.

## Appels vers le moteur (C++)

- `FS:` `directoryCreate`, `directoryExists`, `fileExists`, `findFiles`, `stat`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/fileDialog.lua`.*
