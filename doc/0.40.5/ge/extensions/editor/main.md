# `editor_main`

*Fichier : `lua/ge/extensions/editor/main.lua` · VM : Game Engine (GE) · 794 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_main` : `extensions.load("editor_main")`, puis la globale `editor_main`

Cœur du World Editor : définit la globale `editor` (editor = M). Il charge toutes les extensions de lua/ge/extensions/editor/ (celles qui contiennent « M.onEditor » ou « M.onExtension », sauf editor_main), initialise les modules editor/api/*, gère les préférences (settings/editor/preferences.json), l'état (settings/editor/currentState.json) et l'activation/désactivation de l'éditeur (caméra libre, action maps, CEF masqué, layout, audio). Les autres extensions d'éditeur ajoutent leurs fonctions à la table `editor`.

## Exemple

```lua
editor_main.toggleActive()          -- ouvre/ferme l'éditeur
editor.logInfo("message")
local v = editor.getPreference("camera.general.freeCameraMoveSpeed")
```

## Remarques

- setEditorActive ne bascule pas immédiatement : il pose une requête traitée dans onUpdate après 3 frames d'écran de chargement (splash).
- La fermeture de l'éditeur est refusée (retour silencieux) si editor.anyToolDirty() est vrai.
- Mode sans échec (safeMode) : seules les extensions de la liste safeModeExtensionNames sont chargées.
- Une extension peut être désactivée via settings/editor/extensions.json (clé = nom court, champ disabled).
- editor.setPreference et editor.getPreference ne sont définis qu'après le premier loadPreferences().
- Le même script gère aussi le lancement automatique avec l'argument -worldEditor (onFirstUpdate) et la réactivation après un rechargement Lua (onSerialize/onDeserialized).

**Dépendances (chargées avant) :** `core_camera`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_main.initializeModules()` | Charge et initialise les modules editor/api/* (gui, core, assets, camera, dataBlock, decal, gizmo, material, navigation, object, roadRiver, sketch, terrain, forest, proceduralContentGenerator), puis émet onEditorModulesInitialized. Sans effet si déjà fait. *(interne)* | 294 |
| `editor_main.isEditorActive()` | Indique si l'éditeur est actif. | 594 |
| `editor_main.loadEditorExtension(name)` | Charge une extension d'éditeur à chaud : enregistre ses préférences, puis appelle ses onEditorRegisterApi, onEditorInitialized et onEditorActivated. | 140 |
| `editor_main.loadEditorExtensions(names)` | Charge plusieurs extensions d'éditeur d'un coup (préférences enregistrées avant, puis hooks RegisterApi/Initialized/Activated pour chacune). | 171 |
| `editor_main.loadExtensionsSettings()` | Lit settings/editor/extensions.json dans editor.extensionsSettings (table vide si absent). | 85 |
| `editor_main.loadPreferences()` | Recharge les préférences depuis settings/editor/preferences.json, définit editor.setPreference/getPreference et migre les anciennes préférences. | 74 |
| `editor_main.loadState(filePath)` | Lit le fichier d'état de l'éditeur (avertit si la version du format diffère). | 368 |
| `editor_main.log(msg)` | Écrit un message de niveau Info dans le log, tag « editor ». | 50 |
| `editor_main.logDebug(msg)` | Message de niveau Debug, tag « editor ». | 54 |
| `editor_main.logError(msg)` | Message de niveau Error, tag « editor ». | 58 |
| `editor_main.logInfo(msg)` | Alias de log (niveau Info, tag « editor »). | 50 |
| `editor_main.logWarn(msg)` | Message de niveau Warning, tag « editor ». | 62 |
| `editor_main.onClientEndMission()` | Appelé à la fin d'un niveau : sauvegarde l'état, réaffiche les apps (ShowApps), propose de sauvegarder si modifié, puis shutdown(). *(interne)* *(hook)* | 623 |
| `editor_main.onClientStartMission()` | Appelé au démarrage d'un niveau : remet initialized et modulesInitialized à false et réapplique l'état actif courant. *(interne)* *(hook)* | 608 |
| `editor_main.onDeserialized(data)` | Appelé après un rechargement Lua : restaure active/dirty/headless/mode d'édition et expose les données dans editor_main.serializedData. *(interne)* *(hook)* | 733 |
| `editor_main.onExit()` | Appelé à la sortie du jeu : met editor.active à false et sauvegarde l'état. *(interne)* *(hook)* | 678 |
| `editor_main.onExtensionLoaded()` | Hook de chargement. Corps vide. *(interne)* *(hook)* | 683 |
| `editor_main.onExtensionUnloaded()` | Appelé au déchargement : editor.shutdown(). *(interne)* *(hook)* | 686 |
| `editor_main.onFirstUpdate()` | Appelé à la première mise à jour : réactive l'éditeur s'il l'était avant le rechargement, et l'ouvre automatiquement si le jeu a été lancé avec -worldEditor. *(interne)* *(hook)* | 747 |
| `editor_main.onPreExit()` | Appelé avant la sortie du jeu. Corps vide. *(interne)* *(hook)* | 620 |
| `editor_main.onPreWindowClose()` | Appelé avant la fermeture de la fenêtre du jeu : editor.checkDirtyAndSave() si disponible. *(interne)* *(hook)* | 614 |
| `editor_main.onSerialize()` | Appelé avant un rechargement Lua : sauvegarde caméra, état actif, dirty, headless, mode d'édition, positions des fenêtres et préférence cleanExit ; désactive l'éditeur. *(interne)* *(hook)* | 690 |
| `editor_main.onUpdate()` | Appelé chaque frame : traite la requête d'activation/désactivation (affiche l'image de chargement editorSplash.png pendant 3 frames, puis applique). *(interne)* *(hook)* | 634 |
| `editor_main.saveExtensionsSettings()` | Écrit editor.extensionsSettings dans settings/editor/extensions.json. | 89 |
| `editor_main.savePreferences()` | Écrit les préférences dans settings/editor/preferences.json. | 81 |
| `editor_main.saveState(filePath)` | Sauvegarde l'état de l'éditeur : émet onEditorSaveState(state) puis écrit le JSON. Sans effet si l'éditeur n'a pas été initialisé dans cette session. | 356 |
| `editor_main.setEditorActive(activate, safeMode)` | Demande l'activation ou la désactivation de l'éditeur ; appliquée dans onUpdate après quelques frames de splash. | 587 |
| `editor_main.shutdown()` | Ferme l'éditeur, émet onEditorShutdown, décharge toutes les extensions d'éditeur et remet initialized/active à false. | 598 |
| `editor_main.toggleActive(safeMode)` | Inverse l'état actif de l'éditeur (via setEditorActive). | 674 |
| `editor_main.unloadEditorExtension(extName)` | Décharge une extension d'éditeur chargée : appelle son onEditorDeactivated puis onEditorShutdown, puis extensions.unload. | 213 |

### Détail des paramètres

#### `editor_main.isEditorActive()`

Indique si l'éditeur est actif.

- **renvoie** : boolean editor.active.

#### `editor_main.loadEditorExtension(name)`

Charge une extension d'éditeur à chaud : enregistre ses préférences, puis appelle ses onEditorRegisterApi, onEditorInitialized et onEditorActivated.

- `name` (*string*) : Nom de l'extension, par ex. « editor_monOutil ».
- **renvoie** : table|nil La table de l'extension, ou nil si le chargement a échoué.

#### `editor_main.loadEditorExtensions(names)`

Charge plusieurs extensions d'éditeur d'un coup (préférences enregistrées avant, puis hooks RegisterApi/Initialized/Activated pour chacune).

- `names` (*table<integer, string>*) : Noms des extensions.

#### `editor_main.loadState(filePath)`

Lit le fichier d'état de l'éditeur (avertit si la version du format diffère).

- `filePath` (*string|nil*) : Fichier source ; settings/editor/currentState.json par défaut.
- **renvoie** : table L'état lu, ou une table vide.

#### `editor_main.log(msg)`

Écrit un message de niveau Info dans le log, tag « editor ».

- `msg` (*string*) : Message.

#### `editor_main.logDebug(msg)`

Message de niveau Debug, tag « editor ».

- `msg` (*string*) : Message.

#### `editor_main.logError(msg)`

Message de niveau Error, tag « editor ».

- `msg` (*string*) : Message.

#### `editor_main.logInfo(msg)`

Alias de log (niveau Info, tag « editor »).

- `msg` (*string*) : Message.

#### `editor_main.logWarn(msg)`

Message de niveau Warning, tag « editor ».

- `msg` (*string*) : Message.

#### `editor_main.onDeserialized(data)`

Appelé après un rechargement Lua : restaure active/dirty/headless/mode d'édition et expose les données dans editor_main.serializedData.

- `data` (*table*) : Table renvoyée par onSerialize.

#### `editor_main.onSerialize()`

Appelé avant un rechargement Lua : sauvegarde caméra, état actif, dirty, headless, mode d'édition, positions des fenêtres et préférence cleanExit ; désactive l'éditeur.

- **renvoie** : table Données restituées à onDeserialized.

#### `editor_main.saveState(filePath)`

Sauvegarde l'état de l'éditeur : émet onEditorSaveState(state) puis écrit le JSON. Sans effet si l'éditeur n'a pas été initialisé dans cette session.

- `filePath` (*string|nil*) : Fichier cible ; settings/editor/currentState.json par défaut.

#### `editor_main.setEditorActive(activate, safeMode)`

Demande l'activation ou la désactivation de l'éditeur ; appliquée dans onUpdate après quelques frames de splash.

- `activate` (*boolean*) : true pour ouvrir, false pour fermer.
- `safeMode` (*boolean|nil*) : true pour démarrer en mode sans échec.

#### `editor_main.toggleActive(safeMode)`

Inverse l'état actif de l'éditeur (via setEditorActive).

- `safeMode` (*boolean|nil*) : Mode sans échec à l'ouverture.

#### `editor_main.unloadEditorExtension(extName)`

Décharge une extension d'éditeur chargée : appelle son onEditorDeactivated puis onEditorShutdown, puis extensions.unload.

- `extName` (*string*) : Nom de l'extension chargée.

## Champs

| Champ | Type | Description |
|---|---|---|
| `active` | boolean | Vrai quand l'éditeur est actif (ouvert). |
| `additionalActionMaps` | table | Action maps supplémentaires empilées à l'activation et dépilées à la désactivation de l'éditeur. |
| `allExtensionNames` | table<integer, string> | Noms courts de toutes les extensions d'éditeur trouvées sur disque. |
| `dependencies` | table<integer, string> | {"core_camera"}. |
| `extensionNames` | table<integer, string> | Noms (editor_xxx) des extensions d'éditeur actuellement chargées. |
| `initialized` | boolean | Vrai quand les extensions d'éditeur sont chargées et initialisées. |
| `preferencesRegistry` | any | Registre des préférences (editor/api/preferencesRegistry). |
| `safeMode` | boolean|nil | Vrai si l'éditeur a été lancé en mode sans échec. |

**Globales affectées :** `editor`

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onEditorActivated` — écouté par 29 module(s)
- `onEditorDeactivated` — écouté par 26 module(s)
- `onEditorInitialized` — écouté par 121 module(s)
- `onEditorLoadState` — écouté par 2 module(s)
- `onEditorModulesInitialized`
- `onEditorRegisterApi` — écouté par 1 module(s)
- `onEditorSaveState` — écouté par 2 module(s)
- `onEditorShutdown` — écouté par 1 module(s)

**Évènements UI (guihooks.trigger) :** `ShowApps`

## Appels vers le moteur (C++)

- `Engine.` `getNeedCollisionRebuild`
- `FS:` `findFiles`
- `obj:` `setSelected`
- `scenetree.` `findObject`, `findObjectById`
- `worldEditorCppApi.` `enableEditor`, `enableSimSetAndSimObjectSignals`, `hideIconForObject`, `mustOpenEditorOnStart`, `setHoveredObjectId`, `setOpenEditorOnStart`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/main.lua`.*
