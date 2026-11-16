# `editor_roadArchitect_importFile`

*Fichier : `lua/ge/extensions/editor/roadArchitect/importFile.lua` · VM : Game Engine (GE) · 136 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_roadArchitect_importFile` : `extensions.load("editor_roadArchitect_importFile")`, puis la globale `editor_roadArchitect_importFile`

Utilitaires d'import de fichiers pour Road Architect, pensés pour un usage sans interface (pont tech/BeamNGpy). Ils lisent un fichier depuis un chemin virtuel ou natif, le copient si besoin dans /temp/roadArchitectImport, préparent les API de l'éditeur (historique, préférences) sans ouvrir l'UI, puis finalisent les routes (DecalRoads, collisions, navgraph).

## Exemple

```lua
local imp = extensions.editor_roadArchitect_importFile
local chemin, stage = imp.stageText('C:/x/route.json', contenu)
local data = imp.readTextFile(chemin)
imp.ensureEditorHistory()
imp.maybeFinalise({finalize = true})
```

## Remarques

- readTextFile essaie dans l'ordre : readFile avec séparateurs normalisés, readFile avec le chemin brut, conversion FS:native2Virtual, puis io.open en mode binaire.
- stageText ne copie rien si fileContent est nil ou vide : il renvoie alors le chemin d'origine et false.
- maybeFinalise renvoie false, nil quand options.finalize n'est pas exactement true, sans rien faire.
- ensureEditorHistory lève une erreur (error) si editor_main, editor.history ou editor.getPreference restent indisponibles.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_roadArchitect_importFile.ensureEditorHistory()` | Prépare les API du World Editor nécessaires à l'import et à la finalisation sans ouvrir l'interface : charge editor_main si besoin, appelle editor.initializeModules pour créer l'historique, puis editor.ensurePreferencesApi ou editor.loadPreferences pour les préférences (nécessaires à roadRiver.getPreference lors de la finalisation des DecalRoads). | 84 |
| `editor_roadArchitect_importFile.maybeFinalise(options)` | Si options.finalize est true, pose les DecalRoads et meshes, recharge les collisions et reconstruit le navgraph, comme la bascule Render/finalise de Road Architect. Déjà finalisé (objet « Road Architect » existant) : appelle d'abord roads.unfinalise() pour éviter les doublons. | 114 |
| `editor_roadArchitect_importFile.readTextFile(filePath)` | Lit le contenu d'un fichier à partir d'un chemin virtuel ou natif absolu. Essaie readFile, la conversion native vers virtuel, puis io.open en binaire. Renvoie nil si le chemin est invalide ou si le fichier est introuvable. | 16 |
| `editor_roadArchitect_importFile.stageText(filePath, fileContent)` | Écrit le contenu fourni dans /temp/roadArchitectImport/<nom du fichier> (dossier créé si nécessaire) afin que le jeu puisse le lire dans son système de fichiers virtuel. Convertit fileContent en string avec tostring s'il n'en est pas une. Lève une erreur si l'écriture échoue. | 60 |

### Détail des paramètres

#### `editor_roadArchitect_importFile.maybeFinalise(options)`

Si options.finalize est true, pose les DecalRoads et meshes, recharge les collisions et reconstruit le navgraph, comme la bascule Render/finalise de Road Architect. Déjà finalisé (objet « Road Architect » existant) : appelle d'abord roads.unfinalise() pour éviter les doublons.

- `options` (*table|nil*) : Options d'import ; seul le champ finalize (boolean) est lu.
- **renvoie** : boolean true si la finalisation a eu lieu.
- **renvoie** : string|nil Message d'erreur, par exemple « finalize requires a loaded level (MissionGroup missing) ».

#### `editor_roadArchitect_importFile.readTextFile(filePath)`

Lit le contenu d'un fichier à partir d'un chemin virtuel ou natif absolu. Essaie readFile, la conversion native vers virtuel, puis io.open en binaire. Renvoie nil si le chemin est invalide ou si le fichier est introuvable.

- `filePath` (*string*) : Chemin virtuel ou natif (les antislashs sont normalisés en /).
- **renvoie** : string|nil Contenu du fichier, ou nil.

#### `editor_roadArchitect_importFile.stageText(filePath, fileContent)`

Écrit le contenu fourni dans /temp/roadArchitectImport/<nom du fichier> (dossier créé si nécessaire) afin que le jeu puisse le lire dans son système de fichiers virtuel. Convertit fileContent en string avec tostring s'il n'en est pas une. Lève une erreur si l'écriture échoue.

- `filePath` (*string*) : Chemin d'origine, dont seul le nom de fichier est conservé (import.bin par défaut).
- `fileContent` (*string|nil*) : Contenu à déposer ; si nil ou vide, rien n'est écrit.
- **renvoie** : string Chemin utilisable : le fichier déposé, ou filePath si rien n'a été écrit.
- **renvoie** : boolean true si le fichier a été déposé.

## Appels vers le moteur (C++)

- `FS:` `directoryCreate`, `native2Virtual`
- `scenetree.` `findObject`

**Charge les extensions :** `editor_main`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/roadArchitect/importFile.lua`.*
