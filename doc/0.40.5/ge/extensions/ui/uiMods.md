# `ui_uiMods`

*Fichier : `lua/ge/extensions/ui/uiMods.lua` · VM : Game Engine (GE) · 381 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_uiMods` : `extensions.load("ui_uiMods")`, puis la globale `ui_uiMods`

Fournit à l'interface (Vue) la liste des mods d'UI, des apps UI et des listes d'images, et surveille les changements de fichiers pour prévenir l'UI en direct (rechargement à chaud). Il suit aussi des révisions de fichiers d'exécution (« runtime ») servis à l'UI pour le développement. onFilesChanged déclenche les évènements UiModsChanged, UiAppsChanged, UiImageListChanged et UiRuntimeFileChanged, et rappelle sendUIModules() quand /ui/modModules/ change.

## Remarques

- L'extension reste chargée (setExtensionUnloadMode « manual » dans onExtensionLoaded).
- getImageList enregistre le dossier comme surveillé : les changements ultérieurs y déclenchent UiImageListChanged. Les images `nom_blur.ext` sont rattachées à `nom` dans le champ `blur`.
- Extensions d'image reconnues : jpg, jpeg, jfif, png, gif, webp, avif.
- Les fonctions « runtime » ne font rien tant que setUiRuntimeBundled n'a pas été appelé avec une config valide (`includes` non vide).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_uiMods.bumpUiRuntimeRevision(path)` | Incrémente la révision d'un chemin pour forcer un rechargement manuel. Renvoie 0 si le service d'exécution n'est pas configuré ou si path n'est pas une chaîne. | 341 |
| `ui_uiMods.getImageList(path)` | Liste les images d'un dossier (récursif), triées par nom, en associant l'image normale et sa variante _blur. Le dossier est ajouté à la surveillance. | 108 |
| `ui_uiMods.getUiApps()` | Renvoie, depuis extensions.ui_apps.getUIAppsData(), une copie filtrée des métadonnées des apps UI (appName, directive, folder, appJsonPath, jsSource, vueFile, types, category, version, essential, devonly, official, preview = première prévisualisation, etc.). Table vide si ui_apps est indisponible. | 53 |
| `ui_uiMods.getUiRuntimeFileList(withMtime)` | Liste les fichiers d'exécution servis (sous les dossiers `includes`, de type suivi, et non intégrés au bundle sauf les styles). | 347 |
| `ui_uiMods.getUiRuntimeRevisions()` | Renvoie la table chemin -> numéro de révision des fichiers d'exécution (référence directe, pas une copie). | 336 |
| `ui_uiMods.getVueMods()` | Parcourt /ui/ui-vue/mods et regroupe les fichiers par mod (premier dossier sous mods/). | 31 |
| `ui_uiMods.onExtensionLoaded()` | Hook appelé au chargement de l'extension : passe le mode de déchargement en « manual ». *(interne)* *(hook)* | 7 |
| `ui_uiMods.onFilesChanged(files)` | Hook appelé par le moteur quand des fichiers changent. Pour chaque fichier : appelle sendUIModules() pour /ui/modModules/, déclenche UiModsChanged pour /ui/ui-vue/mods/, UiAppsChanged (avec files et apps concernées) pour /ui/modules/apps/, UiImageListChanged pour les dossiers d'images surveillés, et UiRuntimeFileChanged {path, rev, change} pour les fichiers d'exécution servis. *(interne)* *(hook)* | 274 |
| `ui_uiMods.setUiRuntimeBundled(cfg)` | Configure le service de fichiers d'exécution de l'UI : dossiers inclus, exclus, extensions suivies (statExts) et extensions de style (styleExts). Ignoré si cfg n'est pas une table ou si cfg.includes est vide. | 208 |

### Détail des paramètres

#### `ui_uiMods.bumpUiRuntimeRevision(path)`

Incrémente la révision d'un chemin pour forcer un rechargement manuel. Renvoie 0 si le service d'exécution n'est pas configuré ou si path n'est pas une chaîne.

- `path` (*string*) : Chemin du fichier.
- **renvoie** : integer Nouvelle révision.

#### `ui_uiMods.getImageList(path)`

Liste les images d'un dossier (récursif), triées par nom, en associant l'image normale et sa variante _blur. Le dossier est ajouté à la surveillance.

- `path` (*string*) : Dossier virtuel du jeu ; les '\' sont normalisés en '/'.
- **renvoie** : {normal: string|nil, blur: string|nil}[] Entrées d'images ; {} si le chemin est vide.

#### `ui_uiMods.getUiApps()`

Renvoie, depuis extensions.ui_apps.getUIAppsData(), une copie filtrée des métadonnées des apps UI (appName, directive, folder, appJsonPath, jsSource, vueFile, types, category, version, essential, devonly, official, preview = première prévisualisation, etc.). Table vide si ui_apps est indisponible.

- **renvoie** : table<string, table> Apps par nom.

#### `ui_uiMods.getUiRuntimeFileList(withMtime)`

Liste les fichiers d'exécution servis (sous les dossiers `includes`, de type suivi, et non intégrés au bundle sauf les styles).

- `withMtime` (*boolean|nil*) : Si true, ajoute `mtime` à chaque entrée (et mémorise les mtimes).
- **renvoie** : {path: string, mtime: number|nil}[] Fichiers servis ; {} si non configuré.

#### `ui_uiMods.getUiRuntimeRevisions()`

Renvoie la table chemin -> numéro de révision des fichiers d'exécution (référence directe, pas une copie).

- **renvoie** : table<string, integer> Révisions.

#### `ui_uiMods.getVueMods()`

Parcourt /ui/ui-vue/mods et regroupe les fichiers par mod (premier dossier sous mods/).

- **renvoie** : table<string, {path: string, files: string[]}> Par nom de mod : dossier et chemins relatifs des fichiers.

#### `ui_uiMods.onFilesChanged(files)`

Hook appelé par le moteur quand des fichiers changent. Pour chaque fichier : appelle sendUIModules() pour /ui/modModules/, déclenche UiModsChanged pour /ui/ui-vue/mods/, UiAppsChanged (avec files et apps concernées) pour /ui/modules/apps/, UiImageListChanged pour les dossiers d'images surveillés, et UiRuntimeFileChanged {path, rev, change} pour les fichiers d'exécution servis.

- `files` (*table[]*) : Liste d'objets {filename, type} (type « deleted » pour une suppression).

#### `ui_uiMods.setUiRuntimeBundled(cfg)`

Configure le service de fichiers d'exécution de l'UI : dossiers inclus, exclus, extensions suivies (statExts) et extensions de style (styleExts). Ignoré si cfg n'est pas une table ou si cfg.includes est vide.

- `cfg` (*table*) : { includes = string[], excludes = string[]|nil, statExts = string[]|nil, styleExts = string[]|nil }

**Évènements UI (guihooks.trigger) :** `UiAppsChanged`, `UiImageListChanged`, `UiModsChanged`, `UiRuntimeFileChanged`

## Appels vers le moteur (C++)

- `FS:` `findFiles`, `stat`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/uiMods.lua`.*
