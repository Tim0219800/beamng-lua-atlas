# `core_vehicle_partmgmt`

*Fichier : `lua/ge/extensions/core/vehicle/partmgmt.lua` · VM : Game Engine (GE) · 1979 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `core_vehicle_partmgmt` : `extensions.load("core_vehicle_partmgmt")`, puis la globale `core_vehicle_partmgmt`

Extension GE `core_vehicle_partmgmt` : gestion des pièces et de la configuration d'un véhicule en cours de jeu (menu de configuration, tuning). Lit/modifie la config de `core_vehicle_manager.getVehicleData(id).config` (partsTree, vars, paints) et réapparaît le véhicule (`respawn`) pour appliquer les changements, sauvegarde/charge/supprime des configs .pc locales (format 2, avec fichier info_<nom>.json et miniature .jpg), enregistre des collections de véhicules (format 4), envoie les données du configurateur à l'UI (VehicleConfigChange) et gère la mise en surbrillance des pièces (rendu « rayons X » avec fondu). Le véhicule visé est celui de core_vehicle_configTarget (sinon le véhicule du joueur 0) ; la plupart des fonctions acceptent un id explicite.

## Exemple

```lua
-- Changer des variables de tuning du véhicule du joueur sans respawn complet
core_vehicle_partmgmt.setConfigVars({['$camber_F'] = 0.1}, true)
-- Sauvegarder une config locale
local res = core_vehicle_partmgmt.saveNewLocalConfig('Ma config', {generateThumbnail = true, savePaints = true}, nil)
print(res.success, res.fileName)
-- Lire la config d'un véhicule
local cfg = core_vehicle_partmgmt.getConfigOfVehicle(be:getPlayerVehicleID(0))
dump(cfg.partsTree.chosenPartName)
```

## Remarques

- Réglages de sauvegarde (saveSettings, table) : generateThumbnail (défaut true), saveLicenseplate (false), savePaints (true), overridePaints (false : écrit les peintures comme peintures explicites dans le fichier info), useThumbnailFile + thumbnailFile (miniature fournie), thumbnailCaptureId (id d'une capture temporaire de core_vehicle_thumbnail). Un booléen à la place de la table est accepté (ancien argument withThumbnail). Les métadonnées (saveMetadata) sont validées par ge/extensions/vehicles/saveConfigUtils.
- Les fonctions saveNewLocalConfig / saveExistingLocalConfig renvoient une table {success, reason?, fileName?, displayName?, configSaved?, thumbnailCopied?, metadataError?}. Raisons : walking, noVehicle, invalidFilename, invalidMetadata, saveFailed, thumbnailCopyFailed, configNotFound, notPlayerConfig.
- Les chemins de config sont relatifs au dossier du modèle (vehicleDirectory, ex. 'vehicles/pickup/'). Après sauvegarde, core_vehicles.clearCache() et ui_vehicleSelector_general.clearCache() sont appelés.
- setConfig / setConfigOfVehicle fusionnent (tableMerge) les données dans la config du véhicule. Avec respawn (true par défaut quand nil), le véhicule est recréé via veh:respawn(serialize(config)) ; avec respawn=false, seules les peintures sont mises à jour en direct (liveUpdateVehicleColors) et le champ partConfig est réécrit. La première modification déclenche le succès VEHICLE_MODIFIED hors carrière.
- setPartsConfig est obsolète : il se contente de logger une erreur et de demander d'utiliser setPartsTreeConfig. resetPartsToLoadedConfig l'appelle pourtant encore, donc ce bouton « Reset » ne change rien (incohérence du jeu).
- BUG probable : dans buildConfigFromString, la fonction interne preprocessPartConfig ne renvoie rien à la fin du cas format 4 (elle n'a de return que pour l'échec d'un fichier lié et pour le cas non format 4) ; une config de format 4 passée directement retombe donc sur la config par défaut du modèle.
- saveVehicle (collections) lit une variable `partsCondition` jamais définie dans sa portée : data.partsCondition vaut toujours nil.
- M.savePartConfigFileStage2 pointe sur savePartConfigFileStage2_Format2 (signature partsCondition, filename, saveSettings, saveMetadata) et non sur la fonction du même nom (format 4) définie plus haut, qui n'est pas exportée.
- Pas de fonction publique pour appeler isOfficialConfig/isPlayerConfig (locales) : ces valeurs sont retournées par getConfigList (champs official, player).
- Fonctions de surbrillance : si inVehID est nil, c'est le véhicule visé par core_vehicle_configTarget (ou le joueur 0) qui est utilisé. 'highlight' = œil cliqué dans l'UI (partsHighlighted), 'select' = survol temporaire d'une pièce.

**Dépendances (chargées avant) :** `core_locales`, `core_vehicle_configTarget`, `core_vehicle_thumbnail`, `core_vehicle_partFocusCamera`, `gameplay_achievement`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `core_vehicle_partmgmt.buildConfigFromString(vehicleDir, configData, onlyReturnChosenConfig)` | Construit la table de config d'un véhicule à partir d'une donnée de config : table de config, chaîne sérialisée commençant par '{', ou chemin de fichier .pc. Sans config valide, retombe sur default_pc du fichier info du modèle. Les fichiers de format 2 sont fusionnés dans le résultat, sinon le contenu devient `parts`. Appelée par core_vehicle_manager au spawn. | 245 |
| `core_vehicle_partmgmt.changeHighlightedPartsVisiblity(deltaAlpha, inVehID)` | Modifie la transparence des pièces en surbrillance d'un delta (résultat borné 0..1). | 1591 |
| `core_vehicle_partmgmt.clearVehicleHighlights(inVehID)` | Supprime immédiatement l'état rayons X (rétablit l'alpha) pour le véhicule donné ou tout. | 1369 |
| `core_vehicle_partmgmt.compileVehicleCollection(collectionTree)` | Transforme un arbre de véhicules attelés (core_vehicles.generateAttachedVehiclesTree) en liste de configs de véhicules : calcule les décalages relatifs ('default' : x,y,z,rx,ry,rz ; 'coupledNodes' : rotations seulement), numérote les parents et sauvegarde la config de chaque véhicule (ou un linkedPCFile si issu d'un .pc). | 419 |
| `core_vehicle_partmgmt.getConfig()` | Config courante du véhicule visé. | 981 |
| `core_vehicle_partmgmt.getConfigList()` | Liste les fichiers .pc du dossier du modèle du véhicule visé. | 1074 |
| `core_vehicle_partmgmt.getConfigOfVehicle(vehicleId)` | Config courante d'un véhicule (vehicleData.config). | 974 |
| `core_vehicle_partmgmt.getConfigVehicleId(explicitVehicleId)` | Résout l'id du véhicule à configurer (alias de core_vehicle_configTarget.resolveVehicleId). | 25 |
| `core_vehicle_partmgmt.getCurrentLicensePlate()` | Texte de plaque du véhicule visé. | 1145 |
| `core_vehicle_partmgmt.getCurrentLocalConfigName()` | Nom de base (sans dossier ni .pc) de la config chargée dans le véhicule visé. | 1048 |
| `core_vehicle_partmgmt.getSaveAvailability()` | Indique si une sauvegarde est possible (pas en marche à pied, véhicule présent). | 605 |
| `core_vehicle_partmgmt.getSaveMetadataFields(targetConfigName)` | Champs de métadonnées éditables pour la sauvegarde (d'après saveConfigUtils) pour le modèle du véhicule visé. | 1061 |
| `core_vehicle_partmgmt.getTranslation(name, prefix)` | Traduit un nom d'UI : texte avec préfixe de traduction par défaut, ou table {txt, ctx} traduite avec contexte. Une autre table donne nil. | 151 |
| `core_vehicle_partmgmt.hasAvailablePart(partName)` | Indique si une pièce existe dans le contexte jbeam du véhicule visé. | 846 |
| `core_vehicle_partmgmt.highlightParts(parts, inVehID)` | Définit les pièces mises en surbrillance (clic sur l'œil de l'UI) et applique la transparence correspondante. | 1613 |
| `core_vehicle_partmgmt.loadLocal(filename, respawn)` | Remplace le véhicule visé par la config donnée (core_vehicles.replaceVehicle avec {config = filename}). | 991 |
| `core_vehicle_partmgmt.onDeserialized(data)` | Hook : restaure les données de onSerialize. *(interne)* *(hook)* | 1902 |
| `core_vehicle_partmgmt.onExtensionUnloaded()` | Hook : l'extension est déchargée ; rétablit l'alpha des meshes. *(interne)* *(hook)* | 1856 |
| `core_vehicle_partmgmt.onFilesChanged(files)` | Hook : des fichiers ont changé ; vide le cache saveConfigUtils et invalide le cache des partpacks si un .partpacks.json a changé. *(interne)* *(hook)* | 1881 |
| `core_vehicle_partmgmt.onLanguageChanged()` | Hook : la langue change ; vide les caches de traduction. *(interne)* *(hook)* | 1860 |
| `core_vehicle_partmgmt.onReloadLocales()` | Hook : les traductions sont rechargées ; vide les caches. *(interne)* *(hook)* | 1865 |
| `core_vehicle_partmgmt.onSerialize()` | Hook : sauvegarde les données de surbrillance avant rechargement Lua. *(interne)* *(hook)* | 1894 |
| `core_vehicle_partmgmt.onUpdate(dt)` | Hook par frame : applique le debounce du sélecteur de pièces et anime le fondu rayons X. *(interne)* *(hook)* | 1870 |
| `core_vehicle_partmgmt.onVehicleConfigTargetChanged(current)` | Hook (core_vehicle_configTarget) : la cible de configuration change ; efface les rayons X et envoie les données du nouveau véhicule à l'UI. *(interne)* *(hook)* | 1849 |
| `core_vehicle_partmgmt.onVehicleDestroyed(vehID)` | Hook : un véhicule est détruit ; libère ses données de surbrillance. *(interne)* *(hook)* | 1841 |
| `core_vehicle_partmgmt.onVehicleSpawned(vehID)` | Hook : un véhicule apparaît ; réinitialise l'état rayons X concerné et le cache d'informations de pièces. *(interne)* *(hook)* | 1826 |
| `core_vehicle_partmgmt.onVehicleSwitched(oldID, newID, player)` | Hook : le joueur cible change de véhicule ; efface l'état rayons X. *(interne)* *(hook)* | 1834 |
| `core_vehicle_partmgmt.openConfigFolderInExplorer()` | Ouvre dans l'explorateur de fichiers le dossier des configs du modèle (le crée s'il n'existe pas). | 1312 |
| `core_vehicle_partmgmt.partsSelectorChanged(state)` | Appelée par l'UI quand la sélection du sélecteur de pièces change ; retarde de 0,1 s l'application (debounce) via highlightParts. | 1734 |
| `core_vehicle_partmgmt.partsTreeToPartsMap(partsTree)` | Aplatit un arbre de pièces résolu en dictionnaire slotId -> nom de pièce choisie (format `parts` des .pc). Les slots de même id à des chemins différents sont enregistrés sous leur chemin complet. | 322 |
| `core_vehicle_partmgmt.regenerateCurrentLicensePlate()` | Génère et applique un nouveau texte de plaque aléatoire. | 1164 |
| `core_vehicle_partmgmt.releasePartFocusCamera()` | Rend la caméra au joueur (core_vehicle_partFocusCamera.clear). | 1517 |
| `core_vehicle_partmgmt.removeLocal(filename)` | Supprime <dossier>/<filename>.pc et sa miniature .jpg puis prévient l'UI (VehicleconfigRemoved). | 1000 |
| `core_vehicle_partmgmt.reset()` | Réenvoie les données à l'UI (sendDataToUI). | 901 |
| `core_vehicle_partmgmt.resetAllToLoadedConfig()` | Recharge la config d'origine (partConfigFilename) du véhicule visé. | 1776 |
| `core_vehicle_partmgmt.resetConfig()` | Vide parts et vars de la config du véhicule visé et recrée le véhicule. | 1772 |
| `core_vehicle_partmgmt.resetPartsToLoadedConfig()` | Bouton Reset des pièces : relit les parts du .pc d'origine et appelle setPartsConfig (obsolète, voir notes). | 1786 |
| `core_vehicle_partmgmt.resetVarsToLoadedConfig()` | Remet les variables de tuning à celles du .pc d'origine (vide si aucun) et recrée le véhicule. | 1806 |
| `core_vehicle_partmgmt.resetVehicleHighlights(onlyIfVehChanged, inVehID)` | Efface les surbrillances (pièces, transparence, caméra) en refondant vers le véhicule opaque. | 1741 |
| `core_vehicle_partmgmt.save(filename, saveSettings, saveMetadata)` | Sauvegarde la config du véhicule visé sous un chemin complet (alias de savePartConfigFile → format 2). | 713 |
| `core_vehicle_partmgmt.saveExistingLocalConfig(fileName, configurationName, saveSettings, saveMetadata)` | Écrase une config existante du joueur (pas une config officielle). | 1277 |
| `core_vehicle_partmgmt.saveLocal(fn, saveSettings, saveMetadata)` | Sauvegarde la config sous <dossier du modèle>/<fn>. | 726 |
| `core_vehicle_partmgmt.saveLocalScreenshot(fn)` | Étape 1 d'une capture de miniature : passe en caméra libre, FOV 35, déclenche saveLocalScreenshot_stage1 côté UI. | 746 |
| `core_vehicle_partmgmt.saveLocalScreenshot_stage2(fn)` | Étape 2 : prend la capture jpg dans le dossier du modèle puis déclenche saveLocalScreenshot_stage3. | 756 |
| `core_vehicle_partmgmt.saveNewLocalConfig(configurationName, saveSettings, saveMetadata)` | Sauvegarde la config sous un nouveau nom de fichier dérivé de configurationName (en minuscules, suffixe numérique si déjà pris), génère la miniature et débloque le succès VEHICLE_CONFIG_SAVED. | 1268 |
| `core_vehicle_partmgmt.savePartConfigFileStage2(partsCondition, filename, saveSettings, saveMetadata)` | Sauvegarde la config du véhicule visé au format 2 dans `filename` (+ fichier info_<nom>.json + peintures selon saveSettings), prévient l'UI et vide les caches de sélecteur. Voir les notes sur l'alias. | 631 |
| `core_vehicle_partmgmt.saveVehicleCollection(collectionTree, filename)` | Écrit une collection de véhicules au format 4 dans un fichier JSON et prévient l'UI (VehicleconfigSaved, message). | 503 |
| `core_vehicle_partmgmt.savedefault()` | Sauvegarde la config du véhicule visé comme véhicule par défaut (settings/default.pc) et affiche un message. | 767 |
| `core_vehicle_partmgmt.selectParts(parts, inVehID, cameraParts, cameraOptions)` | Sélection temporaire (survol d'une pièce dans l'UI) : met ces pièces à pleine visibilité et recadre la caméra de pièces. | 1645 |
| `core_vehicle_partmgmt.sendDataToUI(explicitVehicleId)` | Envoie à l'UI (guihook brut VehicleConfigChange) toutes les données du configurateur : id, modèle, arbre de pièces choisi, variables de tuning traduites, valeurs par défaut du .pc, catalogue de partpacks, pièces en surbrillance, infos enrichies des pièces. | 792 |
| `core_vehicle_partmgmt.sendPartsSelectorStateToUI()` | Envoie à l'UI (guihook PartsSelectorUpdate) la liste triée des pièces et les indices en surbrillance. | 1711 |
| `core_vehicle_partmgmt.setConfig(inData, respawn, explicitVehicleId)` | Comme setConfigOfVehicle pour le véhicule visé (ou explicitVehicleId). | 945 |
| `core_vehicle_partmgmt.setConfigOfVehicle(veh, inData, respawn)` | Fusionne `inData` dans la config du véhicule donné (voir notes sur respawn). | 905 |
| `core_vehicle_partmgmt.setConfigPaints(data, respawn, explicitVehicleId)` | Fusionne une liste de peintures dans la config ({paints = data}). | 957 |
| `core_vehicle_partmgmt.setConfigVars(data, respawn)` | Fusionne des variables de tuning ({vars = data}) dans la config du véhicule visé. | 961 |
| `core_vehicle_partmgmt.setCurrentConfigurationName(configurationName)` | Fixe le nom affiché (Configuration) dans la config du véhicule visé (sans sauvegarder). | 735 |
| `core_vehicle_partmgmt.setCurrentLicensePlate(text)` | Applique un texte de plaque au véhicule visé (core_vehicles.setPlateText). | 1157 |
| `core_vehicle_partmgmt.setHighlightedPartsVisiblity(alpha, inVehID)` | Fixe la transparence des pièces en surbrillance. | 1580 |
| `core_vehicle_partmgmt.setNewParts(inVehID, silent)` | Met à jour les données de surbrillance après un changement de pièces : les pièces existantes gardent leur état, les nouvelles prennent celui de leur parent. | 1656 |
| `core_vehicle_partmgmt.setPartsConfig(data, respawn)` | Obsolète : logue une erreur demandant d'utiliser setPartsTreeConfig. N'applique rien. | 965 |
| `core_vehicle_partmgmt.setPartsTreeConfig(dataTree, respawn, part)` | Applique un nouvel arbre de pièces au véhicule visé (fusion de {partsTree = dataTree}) et émet le hook onPartsTreeConfigChanged(dataTree, respawn, part) avant. | 969 |
| `core_vehicle_partmgmt.setSkin(skin)` | Applique un skin : choisit la pièce '<modèle>_skin_<skin>' dans le slot 'paint_design' puis remplace le véhicule. skin vide retire le skin. | 859 |
| `core_vehicle_partmgmt.showHighlightedParts(inVehID, cameraParts, cameraOptions)` | Revient à l'affichage des pièces en surbrillance (après un survol). | 1603 |
| `core_vehicle_partmgmt.translateTuningData(tuningData)` | Copie les variables de tuning en traduisant title, description, category et subCategory. | 167 |
| `core_vehicle_partmgmt.validatePaints()` | Compare les peintures actuelles du véhicule visé avec celles du modèle/de la bibliothèque (core_vehiclePaints.validatePcPaints) et ajoute les réglages de sauvegarde par défaut. | 1128 |

### Détail des paramètres

#### `core_vehicle_partmgmt.buildConfigFromString(vehicleDir, configData, onlyReturnChosenConfig)`

Construit la table de config d'un véhicule à partir d'une donnée de config : table de config, chaîne sérialisée commençant par '{', ou chemin de fichier .pc. Sans config valide, retombe sur default_pc du fichier info du modèle. Les fichiers de format 2 sont fusionnés dans le résultat, sinon le contenu devient `parts`. Appelée par core_vehicle_manager au spawn.

- `vehicleDir` (*string*) : dossier du modèle (ex. 'vehicles/pickup/')
- `configData` (*table|string|nil*) : config, chaîne sérialisée ou chemin .pc
- `onlyReturnChosenConfig` (*boolean|nil*) : si true, renvoie (nil, false) plutôt que de se rabattre sur la config par défaut
- **renvoie** : table|nil config {partConfigFilename, parts|…, vars, paints…}
- **renvoie** : boolean true si la config demandée a bien été utilisée (pas le repli par défaut)

#### `core_vehicle_partmgmt.changeHighlightedPartsVisiblity(deltaAlpha, inVehID)`

Modifie la transparence des pièces en surbrillance d'un delta (résultat borné 0..1).

- `deltaAlpha` (*number*) : variation
- `inVehID` (*integer|nil*) : véhicule

#### `core_vehicle_partmgmt.clearVehicleHighlights(inVehID)`

Supprime immédiatement l'état rayons X (rétablit l'alpha) pour le véhicule donné ou tout.

- `inVehID` (*integer|nil*) : véhicule ; nil = tous

#### `core_vehicle_partmgmt.compileVehicleCollection(collectionTree)`

Transforme un arbre de véhicules attelés (core_vehicles.generateAttachedVehiclesTree) en liste de configs de véhicules : calcule les décalages relatifs ('default' : x,y,z,rx,ry,rz ; 'coupledNodes' : rotations seulement), numérote les parents et sauvegarde la config de chaque véhicule (ou un linkedPCFile si issu d'un .pc).

- `collectionTree` (*table*) : arbre de véhicules {vehId, offsetData, children}
- **renvoie** : table[] liste de configs de véhicules (format 4)

#### `core_vehicle_partmgmt.getConfig()`

Config courante du véhicule visé.

- **renvoie** : table|nil config ; nil sans véhicule

#### `core_vehicle_partmgmt.getConfigList()`

Liste les fichiers .pc du dossier du modèle du véhicule visé.

- **renvoie** : table[]|nil entrées {fileName, name, displayName?, official, player, thumbnailPath?} ; nil sans véhicule

#### `core_vehicle_partmgmt.getConfigOfVehicle(vehicleId)`

Config courante d'un véhicule (vehicleData.config).

- `vehicleId` (*integer*) : id du véhicule
- **renvoie** : table|nil config (pas une copie) ; nil si inconnu

#### `core_vehicle_partmgmt.getConfigVehicleId(explicitVehicleId)`

Résout l'id du véhicule à configurer (alias de core_vehicle_configTarget.resolveVehicleId).

- `explicitVehicleId` (*integer|nil*) : id demandé ; nil = cible de configuration, sinon joueur 0
- **renvoie** : integer|nil id valide, nil sinon

#### `core_vehicle_partmgmt.getCurrentLicensePlate()`

Texte de plaque du véhicule visé.

- **renvoie** : string texte ou ''

#### `core_vehicle_partmgmt.getCurrentLocalConfigName()`

Nom de base (sans dossier ni .pc) de la config chargée dans le véhicule visé.

- **renvoie** : string|nil nom de base

#### `core_vehicle_partmgmt.getSaveAvailability()`

Indique si une sauvegarde est possible (pas en marche à pied, véhicule présent).

- **renvoie** : table {canSave = boolean, reason = 'walking'|'noVehicle'|nil}

#### `core_vehicle_partmgmt.getSaveMetadataFields(targetConfigName)`

Champs de métadonnées éditables pour la sauvegarde (d'après saveConfigUtils) pour le modèle du véhicule visé.

- `targetConfigName` (*string|nil*) : config cible (basename)
- **renvoie** : table champs ; {} si pas de véhicule

#### `core_vehicle_partmgmt.getTranslation(name, prefix)`

Traduit un nom d'UI : texte avec préfixe de traduction par défaut, ou table {txt, ctx} traduite avec contexte. Une autre table donne nil.

- `name` (*string|table*) : clé de traduction ou {txt, ctx}
- `prefix` (*string|nil*) : préfixe de repli, défaut 'ui.vehicleconfig.title.'
- **renvoie** : string|nil texte traduit

#### `core_vehicle_partmgmt.hasAvailablePart(partName)`

Indique si une pièce existe dans le contexte jbeam du véhicule visé.

- `partName` (*string*) : nom de pièce
- **renvoie** : boolean|nil nil si partName est vide

#### `core_vehicle_partmgmt.highlightParts(parts, inVehID)`

Définit les pièces mises en surbrillance (clic sur l'œil de l'UI) et applique la transparence correspondante.

- `parts` (*table<string, boolean>*) : [chemin de pièce] = true pour les pièces visibles
- `inVehID` (*integer|nil*) : véhicule ; nil = joueur

#### `core_vehicle_partmgmt.loadLocal(filename, respawn)`

Remplace le véhicule visé par la config donnée (core_vehicles.replaceVehicle avec {config = filename}).

- `filename` (*string*) : chemin ou nom de config .pc
- `respawn` (*boolean|nil*) : non utilisé dans le code

#### `core_vehicle_partmgmt.onDeserialized(data)`

Hook : restaure les données de onSerialize.

- `data` (*table*) : données

#### `core_vehicle_partmgmt.onFilesChanged(files)`

Hook : des fichiers ont changé ; vide le cache saveConfigUtils et invalide le cache des partpacks si un .partpacks.json a changé.

- `files` (*table[]*) : liste {filename, …}

#### `core_vehicle_partmgmt.onSerialize()`

Hook : sauvegarde les données de surbrillance avant rechargement Lua.

- **renvoie** : table {vehsPartsData, vehsRichPartInfo}

#### `core_vehicle_partmgmt.onUpdate(dt)`

Hook par frame : applique le debounce du sélecteur de pièces et anime le fondu rayons X.

- `dt` (*number*) : temps écoulé (s)

#### `core_vehicle_partmgmt.onVehicleConfigTargetChanged(current)`

Hook (core_vehicle_configTarget) : la cible de configuration change ; efface les rayons X et envoie les données du nouveau véhicule à l'UI.

- `current` (*table|nil*) : nouvelle cible {vehId, playerId, returnRoute}

#### `core_vehicle_partmgmt.onVehicleDestroyed(vehID)`

Hook : un véhicule est détruit ; libère ses données de surbrillance.

- `vehID` (*integer*) : véhicule

#### `core_vehicle_partmgmt.onVehicleSpawned(vehID)`

Hook : un véhicule apparaît ; réinitialise l'état rayons X concerné et le cache d'informations de pièces.

- `vehID` (*integer*) : véhicule

#### `core_vehicle_partmgmt.onVehicleSwitched(oldID, newID, player)`

Hook : le joueur cible change de véhicule ; efface l'état rayons X.

- `oldID` (*integer*) : ancien véhicule
- `newID` (*integer*) : nouveau véhicule
- `player` (*integer*) : joueur

#### `core_vehicle_partmgmt.partsSelectorChanged(state)`

Appelée par l'UI quand la sélection du sélecteur de pièces change ; retarde de 0,1 s l'application (debounce) via highlightParts.

- `state` (*table*) : {vehID, partsSorted, partsHighlightedIdxs}

#### `core_vehicle_partmgmt.partsTreeToPartsMap(partsTree)`

Aplatit un arbre de pièces résolu en dictionnaire slotId -> nom de pièce choisie (format `parts` des .pc). Les slots de même id à des chemins différents sont enregistrés sous leur chemin complet.

- `partsTree` (*table*) : config.partsTree
- **renvoie** : table<string, string> [slotId ou chemin] = chosenPartName

#### `core_vehicle_partmgmt.regenerateCurrentLicensePlate()`

Génère et applique un nouveau texte de plaque aléatoire.

- **renvoie** : string texte généré

#### `core_vehicle_partmgmt.removeLocal(filename)`

Supprime <dossier>/<filename>.pc et sa miniature .jpg puis prévient l'UI (VehicleconfigRemoved).

- `filename` (*string*) : nom de config sans extension

#### `core_vehicle_partmgmt.resetVehicleHighlights(onlyIfVehChanged, inVehID)`

Efface les surbrillances (pièces, transparence, caméra) en refondant vers le véhicule opaque.

- `onlyIfVehChanged` (*boolean|nil*) : true : n'efface que si le modèle du véhicule a changé
- `inVehID` (*integer|nil*) : véhicule

#### `core_vehicle_partmgmt.save(filename, saveSettings, saveMetadata)`

Sauvegarde la config du véhicule visé sous un chemin complet (alias de savePartConfigFile → format 2).

- `filename` (*string*) : chemin du .pc
- `saveSettings` (*table|boolean|nil*) : voir notes
- `saveMetadata` (*table|nil*) : métadonnées pour le fichier info
- **renvoie** : boolean true si sauvegardé

#### `core_vehicle_partmgmt.saveExistingLocalConfig(fileName, configurationName, saveSettings, saveMetadata)`

Écrase une config existante du joueur (pas une config officielle).

- `fileName` (*string*) : nom de fichier (avec ou sans .pc)
- `configurationName` (*string|nil*) : nom affiché ; vide = nom existant
- `saveSettings` (*table|boolean|nil*) : voir notes
- `saveMetadata` (*table|nil*) : métadonnées
- **renvoie** : table {success, reason?, …} (reasons possibles : configNotFound, notPlayerConfig, …)

#### `core_vehicle_partmgmt.saveLocal(fn, saveSettings, saveMetadata)`

Sauvegarde la config sous <dossier du modèle>/<fn>.

- `fn` (*string*) : nom de fichier relatif, avec extension .pc
- `saveSettings` (*table|boolean|nil*) : voir notes
- `saveMetadata` (*table|nil*) : métadonnées
- **renvoie** : boolean true si sauvegardé ; false sans véhicule

#### `core_vehicle_partmgmt.saveLocalScreenshot(fn)`

Étape 1 d'une capture de miniature : passe en caméra libre, FOV 35, déclenche saveLocalScreenshot_stage1 côté UI.

- `fn` (*string*) : nom de fichier (non utilisé à cette étape)

#### `core_vehicle_partmgmt.saveLocalScreenshot_stage2(fn)`

Étape 2 : prend la capture jpg dans le dossier du modèle puis déclenche saveLocalScreenshot_stage3.

- `fn` (*string*) : nom de fichier de la capture
- **renvoie** : boolean|nil false sans véhicule

#### `core_vehicle_partmgmt.saveNewLocalConfig(configurationName, saveSettings, saveMetadata)`

Sauvegarde la config sous un nouveau nom de fichier dérivé de configurationName (en minuscules, suffixe numérique si déjà pris), génère la miniature et débloque le succès VEHICLE_CONFIG_SAVED.

- `configurationName` (*string*) : nom affiché de la configuration
- `saveSettings` (*table|boolean|nil*) : voir notes
- `saveMetadata` (*table|nil*) : métadonnées
- **renvoie** : table {success, reason?, fileName?, displayName?, configSaved?, thumbnailCopied?}

#### `core_vehicle_partmgmt.savePartConfigFileStage2(partsCondition, filename, saveSettings, saveMetadata)`

Sauvegarde la config du véhicule visé au format 2 dans `filename` (+ fichier info_<nom>.json + peintures selon saveSettings), prévient l'UI et vide les caches de sélecteur. Voir les notes sur l'alias.

- `partsCondition` (*any*) : conditions de pièces (nil dans les appels actuels)
- `filename` (*string*) : chemin du .pc (ex. 'vehicles/pickup/ma_config.pc')
- `saveSettings` (*table|boolean|nil*) : voir notes
- `saveMetadata` (*table|nil*) : métadonnées à écrire dans le fichier info
- **renvoie** : boolean true si le .pc a été écrit

#### `core_vehicle_partmgmt.saveVehicleCollection(collectionTree, filename)`

Écrit une collection de véhicules au format 4 dans un fichier JSON et prévient l'UI (VehicleconfigSaved, message).

- `collectionTree` (*table*) : arbre de véhicules
- `filename` (*string*) : fichier .pc de sortie

#### `core_vehicle_partmgmt.selectParts(parts, inVehID, cameraParts, cameraOptions)`

Sélection temporaire (survol d'une pièce dans l'UI) : met ces pièces à pleine visibilité et recadre la caméra de pièces.

- `parts` (*table<string, boolean>*) : pièces survolées
- `inVehID` (*integer|nil*) : véhicule
- `cameraParts` (*table|nil*) : pièces à cadrer ; défaut = parts
- `cameraOptions` (*table|nil*) : options de partFocusCamera.focusOnParts (ex. immediate)

#### `core_vehicle_partmgmt.sendDataToUI(explicitVehicleId)`

Envoie à l'UI (guihook brut VehicleConfigChange) toutes les données du configurateur : id, modèle, arbre de pièces choisi, variables de tuning traduites, valeurs par défaut du .pc, catalogue de partpacks, pièces en surbrillance, infos enrichies des pièces.

- `explicitVehicleId` (*integer|nil*) : véhicule ; nil = cible

#### `core_vehicle_partmgmt.setConfig(inData, respawn, explicitVehicleId)`

Comme setConfigOfVehicle pour le véhicule visé (ou explicitVehicleId).

- `inData` (*table*) : données à fusionner
- `respawn` (*boolean|nil*) : voir setConfigOfVehicle
- `explicitVehicleId` (*integer|nil*) : véhicule ; nil = cible

#### `core_vehicle_partmgmt.setConfigOfVehicle(veh, inData, respawn)`

Fusionne `inData` dans la config du véhicule donné (voir notes sur respawn).

- `veh` (*userdata*) : objet véhicule
- `inData` (*table*) : ex. {paints = …}, {vars = …}, {partsTree = …}, {parts = …}
- `respawn` (*boolean|nil*) : true (défaut) : recrée le véhicule ; false : mise à jour en direct des peintures

#### `core_vehicle_partmgmt.setConfigPaints(data, respawn, explicitVehicleId)`

Fusionne une liste de peintures dans la config ({paints = data}).

- `data` (*table[]*) : peintures (1..3)
- `respawn` (*boolean|nil*) : true = recréer le véhicule
- `explicitVehicleId` (*integer|nil*) : véhicule ; nil = cible

#### `core_vehicle_partmgmt.setConfigVars(data, respawn)`

Fusionne des variables de tuning ({vars = data}) dans la config du véhicule visé.

- `data` (*table<string, number>*) : [nom de variable] = valeur
- `respawn` (*boolean|nil*) : true = recréer le véhicule

#### `core_vehicle_partmgmt.setCurrentConfigurationName(configurationName)`

Fixe le nom affiché (Configuration) dans la config du véhicule visé (sans sauvegarder).

- `configurationName` (*string*) : nom
- **renvoie** : boolean false sans véhicule

#### `core_vehicle_partmgmt.setCurrentLicensePlate(text)`

Applique un texte de plaque au véhicule visé (core_vehicles.setPlateText).

- `text` (*string*) : texte de plaque
- **renvoie** : boolean false sans véhicule

#### `core_vehicle_partmgmt.setHighlightedPartsVisiblity(alpha, inVehID)`

Fixe la transparence des pièces en surbrillance.

- `alpha` (*number*) : 0 (invisible) à 1 (opaque)
- `inVehID` (*integer|nil*) : véhicule

#### `core_vehicle_partmgmt.setNewParts(inVehID, silent)`

Met à jour les données de surbrillance après un changement de pièces : les pièces existantes gardent leur état, les nouvelles prennent celui de leur parent.

- `inVehID` (*integer|nil*) : véhicule
- `silent` (*boolean|nil*) : true : ne pas notifier l'UI

#### `core_vehicle_partmgmt.setPartsConfig(data, respawn)`

Obsolète : logue une erreur demandant d'utiliser setPartsTreeConfig. N'applique rien.

- `data` (*table*) : ignoré
- `respawn` (*boolean|nil*) : ignoré

#### `core_vehicle_partmgmt.setPartsTreeConfig(dataTree, respawn, part)`

Applique un nouvel arbre de pièces au véhicule visé (fusion de {partsTree = dataTree}) et émet le hook onPartsTreeConfigChanged(dataTree, respawn, part) avant.

- `dataTree` (*table*) : arbre de pièces (chosenPartName, children…)
- `respawn` (*boolean|nil*) : true = recréer le véhicule
- `part` (*any*) : pièce à l'origine du changement (transmise au hook seulement)

#### `core_vehicle_partmgmt.setSkin(skin)`

Applique un skin : choisit la pièce '<modèle>_skin_<skin>' dans le slot 'paint_design' puis remplace le véhicule. skin vide retire le skin.

- `skin` (*string|nil*) : nom du skin

#### `core_vehicle_partmgmt.showHighlightedParts(inVehID, cameraParts, cameraOptions)`

Revient à l'affichage des pièces en surbrillance (après un survol).

- `inVehID` (*integer|nil*) : véhicule
- `cameraParts` (*table|nil*) : pièces que la caméra garde cadrées
- `cameraOptions` (*table|nil*) : options caméra

#### `core_vehicle_partmgmt.translateTuningData(tuningData)`

Copie les variables de tuning en traduisant title, description, category et subCategory.

- `tuningData` (*table|nil*) : vdata.variables
- **renvoie** : table copie traduite

#### `core_vehicle_partmgmt.validatePaints()`

Compare les peintures actuelles du véhicule visé avec celles du modèle/de la bibliothèque (core_vehiclePaints.validatePcPaints) et ajoute les réglages de sauvegarde par défaut.

- **renvoie** : table résultat de validatePcPaints + defaults ; {} sans véhicule

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | string[] | core_locales, core_vehicle_configTarget, core_vehicle_thumbnail, core_vehicle_partFocusCamera, gameplay_achievement. |
| `xrayFadeRate` | number | Vitesse du fondu des meshes pour la surbrillance rayons X, en alpha par seconde (5 par défaut). Modifiable depuis la console : core_vehicle_partmgmt.xrayFadeRate = 5. |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onPartsTreeConfigChanged`

**Évènements UI (guihooks.trigger) :** `Message`, `PartsSelectorUpdate`, `VehicleconfigRemoved`, `VehicleconfigSaved`, `saveLocalScreenshot_stage1`, `saveLocalScreenshot_stage3`

## Appels vers le moteur (C++)

- `FS:` `directoryCreate`, `fileExists`, `findFiles`, `removeFile`
- `be:` `getObjectCount`, `getPlayerVehicleID`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/core/vehicle/partmgmt.lua`.*
