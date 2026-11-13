# `util_screenshotCreator_thumbnailPaths`

*Fichier : `lua/ge/extensions/util/screenshotCreator/thumbnailPaths.lua` · VM : Game Engine (GE) · 44 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `util_screenshotCreator_thumbnailPaths` : `extensions.load("util_screenshotCreator_thumbnailPaths")`, puis la globale `util_screenshotCreator_thumbnailPaths`

Calcul des chemins de sortie des vignettes de véhicules pour le compositeur de vignettes. Tous les fichiers vont dans vehicles/<modelKey>/ au format .jpg ; la vignette d'une config s'appelle <config>.jpg, et default.jpg pour la config par défaut en mode « defaults ». Les noms sont assainis (caractères autres que lettres, chiffres, _, . et - remplacés par _).

## Remarques

- captureMode vaut « defaults » (seule la config par défaut est écrite, sous le nom default.jpg) ou « all » (une vignette par config ; la config par défaut est aussi copiée en default.jpg via paths.defaultFinal).
- makeOutputPaths crée le dossier de sortie (FS:directoryCreate) : il a un effet de bord sur le disque.
- hasThumbnail teste <config>.jpg puis <config>.png dans vehicles/<modelKey>/ (chemin relatif, c'est-à-dire dossier utilisateur et dossier du jeu via le système de fichiers virtuel).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `util_screenshotCreator_thumbnailPaths.getFinalOutputPath(item, captureMode)` | Calcule le chemin final d'une vignette et son dossier. | 12 |
| `util_screenshotCreator_thumbnailPaths.hasThumbnail(item)` | Indique si une vignette (.jpg ou .png) existe déjà pour l'élément. | 19 |
| `util_screenshotCreator_thumbnailPaths.makeOutputPaths(item, captureMode)` | Crée le dossier de sortie et renvoie les chemins à utiliser pour la capture. | 24 |
| `util_screenshotCreator_thumbnailPaths.safePathPart(value)` | Assainit un morceau de nom de fichier : remplace tout caractère hors [A-Za-z0-9_.-] par _ ; renvoie « unknown » si le résultat est vide. | 7 |

### Détail des paramètres

#### `util_screenshotCreator_thumbnailPaths.getFinalOutputPath(item, captureMode)`

Calcule le chemin final d'une vignette et son dossier.

- `item` (*table*) : Élément {modelKey, configName, isDefaultConfig}.
- `captureMode` (*string*) : « defaults » ou « all ».
- **renvoie** : string Chemin du fichier, ex. vehicles/pickup/d15_4wd.jpg.
- **renvoie** : string Dossier de sortie, ex. vehicles/pickup/.

#### `util_screenshotCreator_thumbnailPaths.hasThumbnail(item)`

Indique si une vignette (.jpg ou .png) existe déjà pour l'élément.

- `item` (*table*) : Élément {modelKey, configName}.
- **renvoie** : boolean true si le fichier existe.

#### `util_screenshotCreator_thumbnailPaths.makeOutputPaths(item, captureMode)`

Crée le dossier de sortie et renvoie les chemins à utiliser pour la capture.

- `item` (*table*) : Élément {modelKey, configName, isDefaultConfig}.
- `captureMode` (*string*) : « defaults » ou « all ».
- **renvoie** : table {outputFolder, final, defaultFinal = chemin default.jpg à copier (mode « all », config par défaut)}.

#### `util_screenshotCreator_thumbnailPaths.safePathPart(value)`

Assainit un morceau de nom de fichier : remplace tout caractère hors [A-Za-z0-9_.-] par _ ; renvoie « unknown » si le résultat est vide.

- `value` (*any*) : Valeur convertie en chaîne.
- **renvoie** : string Nom sûr.

## Appels vers le moteur (C++)

- `FS:` `directoryCreate`, `fileExists`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/util/screenshotCreator/thumbnailPaths.lua`.*
