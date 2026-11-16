# `jbeam_loader`

*Fichier : `lua/common/jbeam/loader.lua` · VM : Commun (GE + véhicule) · 539 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("jbeam/loader")`

Chargeur principal des véhicules jbeam : orchestre toutes les étapes qui transforment les fichiers .jbeam et la configuration choisie en un « bundle » de données véhicule (vdata) prêt pour la physique. Ordre : lecture des fichiers (jbeam/io), choix des pièces par le système de slots, application des variables, unification des pièces, schéma de tables, fusion de sections, résolution des liens et cid, nœuds/poutres, roues, groupes, mise à l'échelle, valeurs par défaut des options, optimisation, interaction. Puis loadBundle crée côté moteur : événements, plaques, couleurs, positions initiales des nœuds, meshes, cordes, matériaux, visages, rétroviseurs. Tourne dans les deux VM (GE et véhicule, vmType). Un moddeur s'en sert surtout pour lire la config chargée ou utiliser les hooks onJbeamLoadingPhase1/2.

## Remarques

- Constantes de types de poutres (définies en C, à ne pas modifier) : NORMAL 0, ANISOTROPIC 1, BOUNDED 2, PRESSURED 3, LBEAM 4, BROKEN 5, HYDRO 6, SUPPORT 7.
- Valeurs par défaut appliquées à vehicle.options si absentes : beamSpring = defaultBeamSpring (4300000), beamDeform = defaultBeamDeform (220000), beamDamp = defaultBeamDamp (580), beamStrength = defaultBeamStrength (math.huge), nodeWeight = defaultNodeWeight (25).
- Hooks émis (extensions.hook) : onJbeamLoadingPhase1(loadingProgress, objID, vehicle, unifyJournal, vehicleConfig, vars) après nœuds/poutres et avant les roues ; onJbeamLoadingPhase2(...) avant l'optimisation.
- Les occupantSlots et la caméra ne sont traités que dans la VM GE (vmType == 'game'). loadBundle crée les objets visibles seulement côté GE (si l'objet véhicule est trouvé), sinon met props et flexbodies à {}.
- Un cache de bundles (clé = SHA256 des dossiers + config) évite de recharger un véhicule identique ; vidé par onFileChanged. Le bundle est stocké encodé et décodé à chaque réutilisation.
- Le paramètre de config additionalVehicleData.indestructible rend toutes les poutres hors roues/torsionbars/rails infinies en résistance (beamStrength = huge) et supprime triggers et actionsEnabled (code marqué TODO: REMOVE TEST CODE).
- Une section gameEngineExtensions des pièces permet de charger automatiquement des extensions GE (name = true, ou name = {args} appelle onVehicleExtensionLoaded(objID, args) sur l'extension).
- Si l'argument de ligne de commande -debugVehicleLoading est présent, des fichiers vehicleDebug_*.json sont écrits dans le dossier du véhicule.
- M.materials et M.materialsMap (issus de particles.getMaterialsParticlesTable()) sont des champs exportés absents de la liste automatique.
- Bug mineur : loadJbeam renvoie nil sans fermer le profilerPush quand findParts échoue (retour avant profilerPopEvent).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `jbeam_loader.cacheVehicleBundleForEditor(vehicleId, vehicleBundle, vehicleObj)` | Si le cache éditeur est activé, enregistre une copie encodée du bundle (en ajoutant temporairement editorTransform aux props) pour l'éditeur. | 73 |
| `jbeam_loader.getCachedVehicleBundle(vehicleId)` | Renvoie une copie décodée du bundle mis en cache pour l'éditeur. | 95 |
| `jbeam_loader.loadBundle(objID, vehicleBundle, loadingProgress)` | Crée côté moteur tout ce qui dépend de l'objet véhicule : événements d'entrée, plaques, couleurs, peintures, positions initiales et collisions des nœuds, nœuds de référence, meshes, cordes visuelles, matériaux, visages d'occupants, rétroviseurs, et charge les extensions listées dans gameEngineExtensions. Sans objet véhicule (VM véhicule), met props et flexbodies à {}. | 367 |
| `jbeam_loader.loadJbeam(objID, loadingProgress, vehicleDirectories, vehicleConfig)` | Charge et assemble en mémoire toutes les données jbeam du véhicule (pièces, variables, tables, liens, cid, roues, groupes, optimisation) sans toucher aux objets 3D. | 144 |
| `jbeam_loader.loadJbeamOnlyConfig(vehicleDirectories, vehicleConfig)` | Comme loadJbeam mais ne fait que choisir les pièces : renvoie la configuration complétée (model, mainPartName, mainPartPath, partsTree). | 132 |
| `jbeam_loader.loadVehicleStage1(objID, vehicleDir, vehicleConfig)` | Point d'entrée de chargement d'un véhicule : normalise le dossier (slash initial et final), ajoute /vehicles/common/, consulte le cache, appelle loadJbeam puis loadBundle et suit la progression dans le LoadingManager (côté GE). *(interne)* | 452 |
| `jbeam_loader.onFileChanged(filename, type)` | Hook appelé quand un fichier change : vide le cache de bundles et le cache éditeur. *(interne)* *(hook)* | 525 |
| `jbeam_loader.setEditorCacheEnabled(enabled)` | Active ou désactive le cache éditeur ; désactiver le vide. | 102 |

### Détail des paramètres

#### `jbeam_loader.cacheVehicleBundleForEditor(vehicleId, vehicleBundle, vehicleObj)`

Si le cache éditeur est activé, enregistre une copie encodée du bundle (en ajoutant temporairement editorTransform aux props) pour l'éditeur.

- `vehicleId` (*integer*) : Identifiant du véhicule.
- `vehicleBundle` (*table*) : Bundle à mémoriser.
- `vehicleObj` (*userdata*) : Objet véhicule moteur (pour lire les transformations des props).

#### `jbeam_loader.getCachedVehicleBundle(vehicleId)`

Renvoie une copie décodée du bundle mis en cache pour l'éditeur.

- `vehicleId` (*integer*) : Identifiant du véhicule.
- **renvoie** : table|nil Bundle ou nil.

#### `jbeam_loader.loadBundle(objID, vehicleBundle, loadingProgress)`

Crée côté moteur tout ce qui dépend de l'objet véhicule : événements d'entrée, plaques, couleurs, peintures, positions initiales et collisions des nœuds, nœuds de référence, meshes, cordes visuelles, matériaux, visages d'occupants, rétroviseurs, et charge les extensions listées dans gameEngineExtensions. Sans objet véhicule (VM véhicule), met props et flexbodies à {}.

- `objID` (*integer*) : Identifiant du véhicule.
- `vehicleBundle` (*table*) : Bundle produit par loadJbeam.
- `loadingProgress` (*table|nil*) : Objet de progression.
- **renvoie** : userdata|nil L'objet véhicule moteur (GE seulement).

#### `jbeam_loader.loadJbeam(objID, loadingProgress, vehicleDirectories, vehicleConfig)`

Charge et assemble en mémoire toutes les données jbeam du véhicule (pièces, variables, tables, liens, cid, roues, groupes, optimisation) sans toucher aux objets 3D.

- `objID` (*integer*) : Identifiant du véhicule.
- `loadingProgress` (*table|nil*) : Objet de progression du LoadingManager (méthode update).
- `vehicleDirectories` (*string[]*) : Dossiers jbeam (le premier est le dossier du véhicule).
- `vehicleConfig` (*table|nil*) : Configuration du véhicule.
- **renvoie** : table|nil Bundle véhicule ; nil si une étape échoue.

#### `jbeam_loader.loadJbeamOnlyConfig(vehicleDirectories, vehicleConfig)`

Comme loadJbeam mais ne fait que choisir les pièces : renvoie la configuration complétée (model, mainPartName, mainPartPath, partsTree).

- `vehicleDirectories` (*string[]*) : Dossiers jbeam.
- `vehicleConfig` (*table|nil*) : Configuration de départ.
- **renvoie** : table|nil vehicleConfig complétée ; nil si aucune pièce principale.

#### `jbeam_loader.loadVehicleStage1(objID, vehicleDir, vehicleConfig)`

Point d'entrée de chargement d'un véhicule : normalise le dossier (slash initial et final), ajoute /vehicles/common/, consulte le cache, appelle loadJbeam puis loadBundle et suit la progression dans le LoadingManager (côté GE).

- `objID` (*integer*) : Identifiant de l'objet véhicule.
- `vehicleDir` (*string*) : Dossier du véhicule (ex. 'vehicles/pickup').
- `vehicleConfig` (*table|nil*) : Configuration (pièces choisies, couleurs/paints, variables, mainPartName...).
- **renvoie** : table|nil Bundle {id, vehicleDirectory, directoriesLoaded, vdata, config, mainPartName, ioCtx} ; nil en cas d'échec.

#### `jbeam_loader.onFileChanged(filename, type)`

Hook appelé quand un fichier change : vide le cache de bundles et le cache éditeur.

- `filename` (*string*) : Fichier modifié.
- `type` (*string*) : Type de changement.

#### `jbeam_loader.setEditorCacheEnabled(enabled)`

Active ou désactive le cache éditeur ; désactiver le vide.

- `enabled` (*boolean*) : true pour activer.

## Champs

| Champ | Type | Description |
|---|---|---|
| `_noSerialize` | boolean | true : le module n'est pas sérialisé lors d'un rechargement de la VM. |
| `data` | table | Table vide créée à l'initialisation (non remplie dans ce fichier). |
| `defaultBeamDamp` | number | Amortissement par défaut (580). |
| `defaultBeamDeform` | number | Seuil de déformation par défaut (220000 N). |
| `defaultBeamSpring` | number | Raideur par défaut des poutres (4300000 N/m). |
| `defaultBeamStrength` | number | Résistance par défaut d'une poutre : math.huge (infinie). |
| `defaultNodeWeight` | number | Masse par défaut d'un nœud (25 kg). |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onJbeamLoadingPhase1` — écouté par 1 module(s)
- `onJbeamLoadingPhase2` — écouté par 1 module(s)

## Appels vers le moteur (C++)

- `Engine.` `getStartingArgs`
- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/jbeam/loader.lua`.*
