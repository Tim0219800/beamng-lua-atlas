# `util_asyncBulkLoader`

*Fichier : `lua/ge/extensions/util/asyncBulkLoader.lua` · VM : Game Engine (GE) · 333 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `util_asyncBulkLoader` : `extensions.load("util_asyncBulkLoader")`, puis la globale `util_asyncBulkLoader`

Chargeur asynchrone de gros jeux de données (véhicules, missions, sélecteur de gameplay, niveaux, profils de sauvegarde carrière). Chaque loadXxx lance un job (core_jobsystem, intervalle 1/30 s) qui exécute le chargement lourd en cédant la main au fil des étapes, publie la progression dans le flux 'asyncBulkLoaderProgress' et signale la fin par guihooks et extensions.hook. Les variantes xxxDirect chargent de façon synchrone avec mesure du temps.

## Exemple

```lua
local r = util_asyncBulkLoader.loadVehicles()
-- r vaut 'alreadyLoaded', 'alreadyLoading' ou 'startLoading'
-- la fin est annoncée par le hook asyncVehicleLoadComplete
```

## Remarques

- Valeurs de retour des loadXxx : 'alreadyLoaded' (données déjà chargées), 'alreadyLoading' (un autre chargement est en cours, erreur loggée avec trace) ou 'startLoading'. Un seul chargement à la fois (isLoading).
- Flux 'asyncBulkLoaderProgress' : {count, total, inProgress, percent}. percent : 0 à 100 = déterminé, -1 = indéterminé. Seul loadVehicles réinitialise percent à -1.
- Fin de chargement : loadVehicles émet guihooks 'asyncVehicleLoadComplete' et le hook du même nom ; loadMissions émet seulement le guihook 'asyncMissionLoadComplete' (pas de hook extensions) ; loadGameplaySelector émet 'asyncGameplaySelectorLoadComplete' (guihook et hook) ; loadLevels émet 'asyncLevelLoadComplete' (guihook et hook).
- Le seuil de profilage tooLongLoadingThreshold vaut math.huge : le profilage (startProfiling, profileLow, profileHigh, stopProfiling) est remplacé par nop. En le baissant, un rapport asyncBulkLoader_report.json est écrit pour les chargements trop longs.
- Bug probable : loadLevels met M.yield à nil à la fin ; tout appel ultérieur à M.yield sans nouveau setupYield provoquerait une erreur (les autres chargements remettent nop ou un nouveau yield).
- sendAllCareerSaveSlotsDataAsync ne charge rien lui-même (le code de test est commenté) : il lance un job puis appelle career_career.sendAllCareerProfilesData() et ne renvoie que 'startLoading'.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `util_asyncBulkLoader.addCount(count)` | Ajoute au nombre d'éléments déjà traités et publie la progression. | 30 |
| `util_asyncBulkLoader.addTotal(total)` | Ajoute au total d'éléments à charger et publie la progression. | 23 |
| `util_asyncBulkLoader.isGameplaySelectorLoaded()` | Indique si les données du sélecteur de gameplay sont chargées. | 102 |
| `util_asyncBulkLoader.isLevelsLoaded()` | Indique si la liste des niveaux est chargée (core_levels.isListLoaded). | 106 |
| `util_asyncBulkLoader.isLoading()` | Indique si un chargement asynchrone est en cours. | 135 |
| `util_asyncBulkLoader.isMissionsLoaded()` | Indique si toutes les missions sont chargées. | 98 |
| `util_asyncBulkLoader.isVehiclesLoaded()` | Indique si les données des modèles de véhicules sont chargées (core_vehicles.isModelsDataLoaded). | 94 |
| `util_asyncBulkLoader.loadGameplaySelector()` | Construit en asynchrone les données du sélecteur de gameplay, puis émet 'asyncGameplaySelectorLoadComplete'. | 228 |
| `util_asyncBulkLoader.loadGameplaySelectorDirect()` | Construit les tuiles du sélecteur de gameplay de façon synchrone et affiche le temps. | 122 |
| `util_asyncBulkLoader.loadLevels()` | Charge en asynchrone la liste des niveaux, puis émet 'asyncLevelLoadComplete'. | 268 |
| `util_asyncBulkLoader.loadLevelsDirect()` | Charge la liste des niveaux de façon synchrone et affiche le temps. | 128 |
| `util_asyncBulkLoader.loadMissions()` | Charge en asynchrone toutes les missions, puis émet le guihook 'asyncMissionLoadComplete'. | 193 |
| `util_asyncBulkLoader.loadMissionsDirect()` | Charge toutes les missions de façon synchrone et affiche le temps. | 116 |
| `util_asyncBulkLoader.loadVehicles()` | Charge en asynchrone les données des modèles de véhicules, puis émet 'asyncVehicleLoadComplete' (UI et extensions). Utilisé par le sélecteur de véhicules. | 155 |
| `util_asyncBulkLoader.loadVehiclesDirect()` | Charge la liste des modèles de véhicules de façon synchrone (core_vehicles.loadModelListNoGarbage) et affiche le temps. | 110 |
| `util_asyncBulkLoader.reportScanPercent(percent)` | Met à jour le pourcentage de l'analyse de fichiers (décodage des véhicules) et publie la progression. | 18 |
| `util_asyncBulkLoader.reportStream()` | Envoie l'état de progression courant dans le flux 'asyncBulkLoaderProgress'. | 13 |
| `util_asyncBulkLoader.sendAllCareerSaveSlotsDataAsync()` | Dans un job, envoie à l'UI les données de tous les emplacements de sauvegarde carrière (career_career.sendAllCareerProfilesData). | 304 |
| `util_asyncBulkLoader.setupYield(job)` | Prépare M.yield à partir d'un job : job.yield, ou une version avec profilage si le seuil est abaissé. *(interne)* | 139 |

### Détail des paramètres

#### `util_asyncBulkLoader.addCount(count)`

Ajoute au nombre d'éléments déjà traités et publie la progression.

- `count` (*number*) : Éléments traités à ajouter.

#### `util_asyncBulkLoader.addTotal(total)`

Ajoute au total d'éléments à charger et publie la progression.

- `total` (*number*) : Éléments à ajouter au total.

#### `util_asyncBulkLoader.isGameplaySelectorLoaded()`

Indique si les données du sélecteur de gameplay sont chargées.

- **renvoie** : boolean true si chargées.

#### `util_asyncBulkLoader.isLevelsLoaded()`

Indique si la liste des niveaux est chargée (core_levels.isListLoaded).

- **renvoie** : boolean true si chargée.

#### `util_asyncBulkLoader.isLoading()`

Indique si un chargement asynchrone est en cours.

- **renvoie** : boolean true si en cours.

#### `util_asyncBulkLoader.isMissionsLoaded()`

Indique si toutes les missions sont chargées.

- **renvoie** : boolean true si chargées.

#### `util_asyncBulkLoader.isVehiclesLoaded()`

Indique si les données des modèles de véhicules sont chargées (core_vehicles.isModelsDataLoaded).

- **renvoie** : boolean true si chargées.

#### `util_asyncBulkLoader.loadGameplaySelector()`

Construit en asynchrone les données du sélecteur de gameplay, puis émet 'asyncGameplaySelectorLoadComplete'.

- **renvoie** : string 'alreadyLoaded', 'alreadyLoading' ou 'startLoading'.

#### `util_asyncBulkLoader.loadLevels()`

Charge en asynchrone la liste des niveaux, puis émet 'asyncLevelLoadComplete'.

- **renvoie** : string 'alreadyLoaded', 'alreadyLoading' ou 'startLoading'.

#### `util_asyncBulkLoader.loadMissions()`

Charge en asynchrone toutes les missions, puis émet le guihook 'asyncMissionLoadComplete'.

- **renvoie** : string 'alreadyLoaded', 'alreadyLoading' ou 'startLoading'.

#### `util_asyncBulkLoader.loadVehicles()`

Charge en asynchrone les données des modèles de véhicules, puis émet 'asyncVehicleLoadComplete' (UI et extensions). Utilisé par le sélecteur de véhicules.

- **renvoie** : string 'alreadyLoaded', 'alreadyLoading' ou 'startLoading'.

#### `util_asyncBulkLoader.reportScanPercent(percent)`

Met à jour le pourcentage de l'analyse de fichiers (décodage des véhicules) et publie la progression.

- `percent` (*number*) : 0 à 100 déterminé, -1 indéterminé.

#### `util_asyncBulkLoader.sendAllCareerSaveSlotsDataAsync()`

Dans un job, envoie à l'UI les données de tous les emplacements de sauvegarde carrière (career_career.sendAllCareerProfilesData).

- **renvoie** : string 'startLoading'.

#### `util_asyncBulkLoader.setupYield(job)`

Prépare M.yield à partir d'un job : job.yield, ou une version avec profilage si le seuil est abaissé.

- `job` (*table*) : Job de core_jobsystem.

## Champs

| Champ | Type | Description |
|---|---|---|
| `yield` | function|nil | Fonction de cession (job.yield) posée par setupYield ; nop au départ. Appelée par le code de chargement pour laisser respirer le jeu. |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `asyncGameplaySelectorLoadComplete`
- `asyncLevelLoadComplete`
- `asyncVehicleLoadComplete`

**Évènements UI (guihooks.trigger) :** `asyncGameplaySelectorLoadComplete`, `asyncLevelLoadComplete`, `asyncMissionLoadComplete`, `asyncVehicleLoadComplete`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/util/asyncBulkLoader.lua`.*
