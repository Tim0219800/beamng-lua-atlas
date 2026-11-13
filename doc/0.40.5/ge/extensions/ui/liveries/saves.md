# `ui_liveries_saves`

*Fichier : `lua/ge/extensions/ui/liveries/saves.lua` · VM : Game Engine (GE) · 186 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_liveries_saves` : `extensions.load("ui_liveries_saves")`, puis la globale `ui_liveries_saves`

Gère les sauvegardes de livrées (éditeur de décalcomanies dynamiques) dans settings/dynamicDecals/*.dynDecals.json. Permet de lister, créer, renommer, supprimer, enregistrer et recharger une pile de calques, et mémorise le nom de la sauvegarde courante de la session d'édition. S'appuie sur l'extension editor_api_dynamicDecals pour la sérialisation réelle.

## Remarques

- Les noms de fichier doivent correspondre à ^[a-zA-Z0-9_-]+$ (lettres, chiffres, _ et -) ; sinon save/create/load/rename renvoient false avec un avertissement dans le log.
- Les fichiers sont stockés dans settings/dynamicDecals/ avec l'extension .dynDecals.json.
- exists et delete n'appellent pas la validation du nom : ils testent directement le chemin construit.
- create et save renvoient le chemin du fichier (string) en cas de succès, et false en cas d'échec ; load, rename et delete renvoient un booléen.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_liveries_saves.clearCurrentSave()` | Oublie la sauvegarde courante et la skin préparée (stagedApplySkinName). | 115 |
| `ui_liveries_saves.consumeStagedApplySkin()` | Renvoie le nom de la skin préparée par un save avec applySkin et l'efface (lecture unique, prévue à la sortie de l'éditeur). | 120 |
| `ui_liveries_saves.create(filename)` | Écrit la pile de calques actuelle dans un nouveau fichier via editor_api_dynamicDecals.saveLayerStackToFile. Ne vérifie pas si le fichier existe déjà et ne change pas la sauvegarde courante. | 52 |
| `ui_liveries_saves.delete(filename)` | Supprime le fichier de sauvegarde. Si c'était la sauvegarde courante, réinitialise l'état de session via clearCurrentSave (la skin préparée n'est plus appliquée). | 90 |
| `ui_liveries_saves.exists(filename)` | Indique si une sauvegarde portant ce nom existe dans settings/dynamicDecals/. | 32 |
| `ui_liveries_saves.getAll()` | Liste toutes les sauvegardes présentes. Chaque entrée contient name, location (chemin), created, modified et fileSize. | 36 |
| `ui_liveries_saves.getCurrentSaveName()` | Renvoie le nom de la sauvegarde chargée ou enregistrée en dernier dans cette session d'édition. | 111 |
| `ui_liveries_saves.getFilename(file)` | Extrait le nom de sauvegarde (sans dossier ni extension .dynDecals.json) d'un chemin de fichier. | 19 |
| `ui_liveries_saves.load(filename)` | Charge une sauvegarde dans l'éditeur via editor_api_dynamicDecals.loadLayerStackFromFile (appelée sous pcall). Définit la sauvegarde courante et efface la skin préparée. | 163 |
| `ui_liveries_saves.rename(filename, newFilename)` | Renomme une sauvegarde. Échoue si le nouveau nom est invalide, si l'ancien fichier n'existe pas, si le nouveau nom est déjà pris ou si le renommage échoue. Met à jour le nom de la sauvegarde courante s'il s'agissait de ce fichier. | 62 |
| `ui_liveries_saves.save(filename, applySkin)` | Enregistre la livrée : refuse un nom invalide ou déjà pris par une autre sauvegarde que la courante, exige un véhicule joueur, écrit la pile de calques puis exporte la skin (exportSkin) sous le même nom. Définit ensuite la sauvegarde courante et, si applySkin est vrai, prépare la skin pour la sortie de l'éditeur. | 137 |

### Détail des paramètres

#### `ui_liveries_saves.consumeStagedApplySkin()`

Renvoie le nom de la skin préparée par un save avec applySkin et l'efface (lecture unique, prévue à la sortie de l'éditeur).

- **renvoie** : string|nil Nom de la skin à appliquer, ou nil.

#### `ui_liveries_saves.create(filename)`

Écrit la pile de calques actuelle dans un nouveau fichier via editor_api_dynamicDecals.saveLayerStackToFile. Ne vérifie pas si le fichier existe déjà et ne change pas la sauvegarde courante.

- `filename` (*string*) : Nom sans extension (validé).
- **renvoie** : string|boolean Chemin du fichier écrit, ou false si le nom est invalide.

#### `ui_liveries_saves.delete(filename)`

Supprime le fichier de sauvegarde. Si c'était la sauvegarde courante, réinitialise l'état de session via clearCurrentSave (la skin préparée n'est plus appliquée).

- `filename` (*string*) : Nom sans extension.
- **renvoie** : boolean true si le fichier existait et a été supprimé.

#### `ui_liveries_saves.exists(filename)`

Indique si une sauvegarde portant ce nom existe dans settings/dynamicDecals/.

- `filename` (*string*) : Nom sans extension.
- **renvoie** : boolean true si le fichier existe.

#### `ui_liveries_saves.getAll()`

Liste toutes les sauvegardes présentes. Chaque entrée contient name, location (chemin), created, modified et fileSize.

- **renvoie** : table[] Tableau d'entrées {name, location, created, modified, fileSize}.

#### `ui_liveries_saves.getCurrentSaveName()`

Renvoie le nom de la sauvegarde chargée ou enregistrée en dernier dans cette session d'édition.

- **renvoie** : string|nil nil pour une nouvelle livrée non enregistrée.

#### `ui_liveries_saves.getFilename(file)`

Extrait le nom de sauvegarde (sans dossier ni extension .dynDecals.json) d'un chemin de fichier.

- `file` (*string*) : Chemin complet d'un fichier de sauvegarde.
- **renvoie** : string Nom sans extension.

#### `ui_liveries_saves.load(filename)`

Charge une sauvegarde dans l'éditeur via editor_api_dynamicDecals.loadLayerStackFromFile (appelée sous pcall). Définit la sauvegarde courante et efface la skin préparée.

- `filename` (*string*) : Nom sans extension (validé).
- **renvoie** : boolean true si le chargement a réussi.

#### `ui_liveries_saves.rename(filename, newFilename)`

Renomme une sauvegarde. Échoue si le nouveau nom est invalide, si l'ancien fichier n'existe pas, si le nouveau nom est déjà pris ou si le renommage échoue. Met à jour le nom de la sauvegarde courante s'il s'agissait de ce fichier.

- `filename` (*string*) : Nom actuel.
- `newFilename` (*string*) : Nouveau nom (validé).
- **renvoie** : boolean true si le renommage a réussi.

#### `ui_liveries_saves.save(filename, applySkin)`

Enregistre la livrée : refuse un nom invalide ou déjà pris par une autre sauvegarde que la courante, exige un véhicule joueur, écrit la pile de calques puis exporte la skin (exportSkin) sous le même nom. Définit ensuite la sauvegarde courante et, si applySkin est vrai, prépare la skin pour la sortie de l'éditeur.

- `filename` (*string*) : Nom sans extension (validé).
- `applySkin` (*boolean|nil*) : Si vrai, la skin exportée sera appliquée à la sortie de l'éditeur (voir consumeStagedApplySkin).
- **renvoie** : string|boolean Chemin du fichier écrit, ou false en cas d'échec (nom invalide, doublon, pas de véhicule).

## Appels vers le moteur (C++)

- `FS:` `fileExists`, `findFiles`, `removeFile`, `renameFile`, `stat`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/liveries/saves.lua`.*
