# `editor_multiSpawnManager`

*Fichier : `lua/ge/extensions/editor/multiSpawnManager.lua` · VM : Game Engine (GE) · 879 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_multiSpawnManager` : `extensions.load("editor_multiSpawnManager")`, puis la globale `editor_multiSpawnManager`

Outil d'éditeur « Vehicle Groups Manager » (menu Gameplay) pour créer, éditer, charger et sauvegarder des groupes de véhicules (fichiers .vehGroup.json) et les faire apparaître dans le monde via core_multiSpawn. Un groupe est de type « custom » (liste de véhicules choisie à la main : modèle, config, peintures) ou « generator » (paramètres : amount, allMods, allConfigs, minPop, modelPopPower, configPopPower, popDecreaseFactor, maxYear, avec lesquels core_multiSpawn.createGroup génère les véhicules). Les groupes trouvés dans vehicleGroups/ et settings/editor/vehicleGroups/ sont chargés automatiquement au premier affichage.

## Exemple

```lua
extensions.load('editor_multiSpawnManager')
editor_multiSpawnManager.loadGroup('vehicleGroups/traffic.vehGroup.json')
editor_multiSpawnManager.onWindowMenuItem()
```

## Remarques

- Modes d'apparition proposés : road, traffic, lineAhead/Behind/Left/Right/Above, raceGrid, raceGridAlt.
- À la sauvegarde, le groupe est nettoyé : les groupes « custom » perdent generator, les véhicules sans modèle sont retirés, les tables de peinture ne sont conservées que si la peinture vaut « (Custom) » ; les groupes generator perdent data. L'ancien type « locked » est converti en « generator ».
- saveGroup ignore son premier paramètre (file) ; seul filePath est utilisé. Elle suppose que options.groupListIdx désigne un groupe existant dans la liste.
- Le bouton « Delete » appelle core_multiSpawn.deleteVehicles(amount) ; « Set Scene Vehicles to Group » remplace les données du groupe par core_multiSpawn.spawnedVehsToGroup().
- L'état d'apparition (spawnState) repasse à 0 quand core_multiSpawn émet onVehicleGroupSpawned (hook appelé avec vehIds, groupId, nom).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_multiSpawnManager.loadGroup(filePath)` | Lit un fichier .vehGroup.json, en fait le groupe courant (après nettoyage), sélectionne son premier véhicule et l'ajoute à la liste des groupes s'il n'y est pas déjà. Écrit un avertissement dans le log si la lecture échoue. | 192 |
| `editor_multiSpawnManager.onEditorGui(dt)` | Hook d'éditeur appelé à chaque frame : dessine la fenêtre « Vehicle Groups Manager » (menus File et Tools, liste des groupes, édition du groupe, options d'apparition). *(interne)* *(hook)* | 757 |
| `editor_multiSpawnManager.onEditorInitialized()` | Hook appelé à l'initialisation de l'éditeur : enregistre la fenêtre principale et trois fenêtres modales (générateur, peinture personnalisée, remplacement du groupe) et l'entrée de menu « Gameplay ». *(interne)* *(hook)* | 863 |
| `editor_multiSpawnManager.onVehicleGroupSpawned()` | Hook émis par core_multiSpawn une fois le groupe apparu ; remet spawnState à 0 (fait disparaître « Please wait... »). *(interne)* *(hook)* | 853 |
| `editor_multiSpawnManager.onWindowMenuItem()` | Handler de l'entrée de menu : initialise les tables au besoin, vide la sélection d'objets de l'éditeur et affiche la fenêtre. *(interne)* *(hook)* | 857 |
| `editor_multiSpawnManager.saveGroup(file, filePath)` | Écrit le groupe courant (traité par processGroup) dans un fichier JSON et mémorise le dossier et le chemin du fichier. | 223 |

### Détail des paramètres

#### `editor_multiSpawnManager.loadGroup(filePath)`

Lit un fichier .vehGroup.json, en fait le groupe courant (après nettoyage), sélectionne son premier véhicule et l'ajoute à la liste des groupes s'il n'y est pas déjà. Écrit un avertissement dans le log si la lecture échoue.

- `filePath` (*string*) : Chemin du fichier .vehGroup.json.

#### `editor_multiSpawnManager.onEditorGui(dt)`

Hook d'éditeur appelé à chaque frame : dessine la fenêtre « Vehicle Groups Manager » (menus File et Tools, liste des groupes, édition du groupe, options d'apparition).

- `dt` (*number*) : Durée de la frame en secondes.

#### `editor_multiSpawnManager.saveGroup(file, filePath)`

Écrit le groupe courant (traité par processGroup) dans un fichier JSON et mémorise le dossier et le chemin du fichier.

- `file` (*any*) : Non utilisé (déduit du code).
- `filePath` (*string*) : Chemin de destination.

## Champs

| Champ | Type | Description |
|---|---|---|
| `filePaths` | string[] | Dossiers explorés pour charger automatiquement les groupes : {"vehicleGroups/", "settings/editor/vehicleGroups/"}. Modifiable avant le premier affichage de l'outil. |

## Appels vers le moteur (C++)

- `FS:` `findFiles`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/multiSpawnManager.lua`.*
