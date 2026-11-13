# `core_vehicles`

*Fichier : `lua/ge/extensions/core/vehicles.lua` · VM : Game Engine (GE) · 3330 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `core_vehicles` : `extensions.load("core_vehicles")`, puis la globale `core_vehicles`

Catalogue et apparition des véhicules côté GE. Il lit les dossiers /vehicles/<modèle>/ (info.json, fichiers .pc, images, peintures, jbeam) pour construire la liste des modèles et des configurations avec leurs agrégats de filtrage (cache invalidé quand les fichiers changent), et fournit les fonctions de spawn/remplacement/suppression de véhicules (y compris les configurations multi-véhicules, format .pc 4 : remorques, etc.). Il suit aussi les couplages (attelages) entre véhicules, les « collections de véhicules » (véhicule principal + remorques à replacer ensemble), qui conduit quel véhicule (vehiclePlayersMap) et la plaque d'immatriculation. Un moddeur l'utilise pour lister les modèles (getModelList, getConfig), faire apparaître ou remplacer une voiture (spawnNewVehicle, replaceVehicle) et changer la plaque (setPlateText).

## Exemple

```lua
-- faire apparaître une pickup avec sa configuration par défaut, puis changer la plaque
local veh = core_vehicles.spawnNewVehicle('pickup', {config = 'd15_4wd_A', autoEnterVehicle = true})
if veh then core_vehicles.setPlateText('BEAM-123', veh:getID()) end

-- lire les infos d'un modèle
local m = core_vehicles.getModel('etk800')
print(m.model.Name, tableSize(m.configs))
```

## Remarques

- Format de getModel(key) : {model = table d'infos du modèle (Name, Brand, Type, preview, logo, key, default_pc, paints, aggregates…), configs = table indexée par clé de configuration (Name, key, model_key, preview, aggregates, pcFilename…)}. Une clé inconnue renvoie {} (et journalise une erreur).
- Le résultat de getModel est mis en cache (clearCache vide tout). Le cache est invalidé automatiquement par onFileChanged/onFileChangedEnd si un fichier .json, .jbeam, .pc, .jpg ou .png de /vehicles/ ou /mods/ change, et par onLanguageChanged.
- Le modèle par défaut (defaultVehicleModel) est 'pickup', ou 'etk800' si beamng_appname contient 'tech'.
- Options usuelles de spawn (opt) : config (nom ou chemin .pc, ou table au format 4), model, paint/paint2/paint3, pos, rot, licenseText, vehicleName, autoEnterVehicle (true par défaut pour le premier véhicule, false pour les véhicules suivants d'une collection), canSpawnAnotherVehicleCheck (false pour ignorer la limite), safeSpawn, additionalVehicleData.
- Collections de véhicules : vehCollections[idPrincipal] = {mainVehData, vehsData, resetState…} ; initVehCollections garde l'état initial ; vehIdToVehCollection retrouve la collection d'un véhicule. Les tables sont reconstruites (buildVehCollectionCache) après onDeserialized, et vehsData est retiré avant la sérialisation.
- Plaque : le texte est stocké dans les dynData du véhicule (licenseText, licenseDesign, licenseFormats). Un guillemet double '"' rend le texte invalide (isLicensePlateValid). Le texte est tronqué à design.vars.plate.maxLength (32 par défaut) en comptant les caractères UTF-8. Si le fichier settings/cloud/forceLicencePlate.txt existe, son contenu est utilisé comme texte.
- Bug : M.removeAllWithProperty = removeAllWithProperty référence une variable locale jamais définie : le champ vaut nil.
- Bug : dans spawnNewVehicle, `opt.canSpawnAnotherVehicleCheck` est lu avant `opt = deepcopy(opt) or {}` : appeler spawnNewVehicle(model) sans table opt provoque une erreur Lua (idem replaceVehicle n'a pas ce problème car la copie est faite avant).
- spawnNewVehicle renvoie false si la limite de véhicules est atteinte, nil si le modèle ou le spawn échoue, sinon (premier véhicule, liste de tous les véhicules créés).
- Le code du chargement du véhicule par défaut dans VariableRegistry (loadDefaultVehicle, etc.) est commenté ou en bloc commenté : « no longer used ». getDefaultVehicleParams reste exportée et lit parseArgs.args.vehicleConfig, $beamngVehicleArgs et le fichier de collection par défaut.
- extractProperties et extractVehicles sont des outils de développement (impression de clés de traduction, liste des configurations dont les peintures du .pc ne correspondent pas à info) : ils ne servent pas en jeu.
- Les clés listées dans getAttributesWhiteList (Drivetrain, Type, Transmission, Country, Value, Brand…) sont les attributs agrégés pour les filtres ; getAttributesConvertToRange et getAttributesConvertToDict indiquent lesquels sont convertis en plage (Value, Weight, Top Speed, 0-100 km/h…) ou en dictionnaire (Region, InsuranceClass).

**Dépendances (chargées avant) :** `core_vehiclePaints`, `core_locales`, `core_skiaTemplate`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `core_vehicles.changeMeshVisibility(delta)` | Appelé par les touches de visibilité des meshes : change la transparence des pièces surlignées via core_vehicle_partmgmt. Ne pas utiliser ailleurs. *(interne)* | 2943 |
| `core_vehicles.clearCache()` | Vide tous les caches (fichiers, modèles, données de modèles) ; ils sont reconstruits à la demande. | 2019 |
| `core_vehicles.cloneCurrent()` | Fait apparaître une copie du véhicule du joueur 0 (même modèle, config, peintures), émet onPlayerVehicleCloned. Refuse si pas de véhicule, si la limite de véhicules est atteinte ou si le joueur marche. | 1986 |
| `core_vehicles.convertVehicleInfo(info, infoFilename)` | Convertit un info.json au nouveau format : les couleurs textuelles (colors) deviennent des peintures (paints), les anciennes couleurs par défaut (default_color…) deviennent defaultPaintName1/2/3. | 572 |
| `core_vehicles.createFilters(list)` | Construit les filtres de l'interface (plage min/max ou ensemble de valeurs possibles par attribut) à partir des agrégats d'une liste de modèles ou de configurations. | 966 |
| `core_vehicles.enterFreecamIfNoVehicles()` | Passe en caméra libre s'il n'y a plus de véhicule enterable (sauf si le joueur est l'unicycle). | 1900 |
| `core_vehicles.extractProperties()` | Outil de développement : affiche les valeurs de propriétés de tous les modèles/configurations et les lignes de traduction correspondantes. | 3149 |
| `core_vehicles.extractVehicles()` | Outil de développement : parcourt tous les modèles et configurations pour comparer les peintures des fichiers .pc et des infos. | 3227 |
| `core_vehicles.generateAttachedVehiclesTree(vehId)` | Construit l'arbre des véhicules attelés à partir d'un véhicule (parents et enfants via les attelages). | 1504 |
| `core_vehicles.getAttributesConvertToDict()` | Liste des attributs convertis en dictionnaire pour les agrégats (Region, InsuranceClass). | 2953 |
| `core_vehicles.getAttributesConvertToRange()` | Liste des attributs convertis en plage pour les agrégats (Value, Weight, Top Speed, 0-100 km/h, 0-60 mph, Weight/Power, Off-Road Score). | 2954 |
| `core_vehicles.getAttributesWhiteList()` | Liste des attributs autorisés comme filtres de la liste de véhicules (Drivetrain, Type, Transmission, Country, Brand, Body Style, Source…). | 2952 |
| `core_vehicles.getConfig(modelName, configKey)` | Renvoie la configuration d'un modèle par sa clé. | 1057 |
| `core_vehicles.getConfigList(array)` | Liste toutes les configurations de tous les modèles, avec les filtres associés. | 1038 |
| `core_vehicles.getCouplerOffset(vehId, couplerTag)` | Décalage (x, y, z) des noeuds d'attelage d'un véhicule par rapport à son noeud de référence, filtré par tag. | 1510 |
| `core_vehicles.getCurrentVehicleDetails()` | Détails du véhicule du joueur 0 (équivalent à getVehicleDetails(be:getPlayerVehicleID(0))). On peut aussi utiliser playerVehicle:getJBeamFilename(). | 961 |
| `core_vehicles.getDefaultVehicleParams()` | Détermine le véhicule par défaut à lancer au démarrage : argument de ligne de commande vehicleConfig, sinon $beamngVehicleArgs, sinon la configuration par défaut du dossier vehicles, sinon la pickup (ou etk800). *(interne)* | 2312 |
| `core_vehicles.getFilesJson()` | Cache des fichiers info JSON des véhicules (calculé au premier appel). | 388 |
| `core_vehicles.getFilesParsed()` | Cache des fichiers JSON/PC déjà lus, indexé par chemin (par ex. /vehicles/pickup/info.json). | 404 |
| `core_vehicles.getModel(key)` | Toutes les infos d'un modèle : fiche du modèle, configurations, peintures, aperçus, agrégats. Résultat mis en cache. Un nom invalide (non chaîne) renvoie {} ; un modèle inconnu journalise une erreur et renvoie {}. | 771 |
| `core_vehicles.getModelList(array)` | Liste de tous les modèles disponibles avec les filtres et les informations d'affichage. | 1002 |
| `core_vehicles.getModelsData()` | Scanne /vehicles et renvoie les modèles trouvés avec leurs fichiers (info, .pc, jbeam, images). Résultat mis en cache jusqu'à clearCache. | 433 |
| `core_vehicles.getPaintFiles()` | Cache des fichiers de peintures trouvés. | 410 |
| `core_vehicles.getVehicleDetails(id)` | Détails d'un véhicule : clé du modèle, fichier .pc, position, couleur, clé de configuration, fiche du modèle et de la configuration. | 939 |
| `core_vehicles.getVehicleLicenseText(veh)` | Texte actuel de la plaque d'un véhicule (dynData licenseText). | 2152 |
| `core_vehicles.getVehicleList()` | Liste des véhicules (fiches complètes de chaque modèle) et filtres, format utilisé par l'ancienne interface (ui2). | 1167 |
| `core_vehicles.getVehiclePersona(vehId)` | Id de persona (profil de joueur) associé à un véhicule. | 2644 |
| `core_vehicles.isLicensePlateValid(text)` | Vérifie qu'un texte de plaque est acceptable (nil accepté ; le guillemet double est interdit). | 2160 |
| `core_vehicles.isModelListLoaded()` | Indique si tous les modèles sont déjà dans le cache de getModel. | 1029 |
| `core_vehicles.isModelsDataLoaded()` | Indique si getModelsData a déjà été calculé. | 546 |
| `core_vehicles.loadCustomVehicle(modelName, data)` | Écrit le modèle et la config dans les variables $beamngVehicle et $beamngVehicleConfig du VariableRegistry (démarrage avec un véhicule donné). *(interne)* | 2302 |
| `core_vehicles.loadModelListNoGarbage()` | Charge en cache tous les modèles (getModel pour chacun) sans construire de grosse liste. | 1021 |
| `core_vehicles.makeVehicleLicenseText(veh, designPath)` | Détermine le texte de plaque d'un véhicule : texte forcé (forceLicenceStr ou fichier settings/cloud/forceLicencePlate.txt), texte déjà stocké (licenseText), nom Steam si l'option useSteamName est active en freeroam (une seule fois), sinon texte généré par core_skiaTemplate.generateText. | 2100 |
| `core_vehicles.onCouplerAttached(objId1, objId2, nodeId, obj2nodeId)` | Hook appelé quand un attelage s'attache : enregistre le couple dans attachedCouplers et vehsCouplings. *(interne)* *(hook)* | 2829 |
| `core_vehicles.onCouplerDetached(obj1id, obj2id, nodeId, obj2nodeId)` | Hook appelé quand un attelage se détache (de n'importe quelle façon) : retire le couple des tables de suivi. *(interne)* *(hook)* | 2910 |
| `core_vehicles.onDeserialized(data)` | Hook appelé après un rechargement des extensions : restaure les tables de suivi (joueurs, personas, attelages, collections) et reconstruit les caches de collections. *(interne)* *(hook)* | 2988 |
| `core_vehicles.onFileChanged(filename, type)` | Hook appelé quand un fichier change sur le disque : marque le cache comme obsolète si le fichier est un .json, .jbeam, .pc, .jpg ou .png sous /vehicles/ ou /mods/. *(interne)* *(hook)* | 2069 |
| `core_vehicles.onFileChangedEnd()` | Hook appelé après une série de changements de fichiers : vide le cache si un fichier pertinent a changé. *(interne)* *(hook)* | 2082 |
| `core_vehicles.onInstabilityDetected(vid, returnData)` | Hook appelé quand la physique d'un véhicule devient instable : si le réglage pauseGameOnInstability est actif (et hors multijoueur), réinitialise le véhicule, met le jeu en pause et marque returnData.instabilityHandled = true. *(interne)* *(hook)* | 3010 |
| `core_vehicles.onLanguageChanged()` | Hook appelé au changement de langue : vide le cache (noms traduits). *(interne)* *(hook)* | 2096 |
| `core_vehicles.onLocalParticipantsChanged()` | Hook appelé quand les participants locaux (multi-sièges) changent : resynchronise la persona de chaque véhicule occupé. *(interne)* *(hook)* | 2681 |
| `core_vehicles.onPersonaSettingsChanged(persona)` | Hook appelé quand les réglages d'une persona changent : demande aux véhicules qui l'utilisent de relire leurs réglages (onSettingsChanged côté véhicule). *(interne)* *(hook)* | 2669 |
| `core_vehicles.onPreVehicleSpawned(vehId)` | Hook appelé avant l'apparition d'un véhicule : initialise les tables d'attelage (couplings, couplerCache, couplerTags, couplerOffset) à partir des noeuds du véhicule ayant un couplerTag ou tag, et vehiclePlayersMap. *(interne)* *(hook)* | 2599 |
| `core_vehicles.onSerialize()` | Hook appelé avant un rechargement des extensions : renvoie les tables de suivi des joueurs, personas, attelages et collections (sans vehsData). *(interne)* *(hook)* | 2956 |
| `core_vehicles.onSettingsChanged()` | Hook appelé quand les réglages changent : la logique showStandalonePcs est figée à true dans le code (la comparaison ne déclenche en pratique qu'au premier appel). *(interne)* *(hook)* | 2088 |
| `core_vehicles.onVehicleDestroyed(vid)` | Hook appelé à la destruction d'un véhicule : retire ses attelages, couplings, collections et entrées de suivi des joueurs. *(interne)* *(hook)* | 2709 |
| `core_vehicles.onVehicleSwitched(oldId, newId, player)` | Hook appelé quand un joueur change de véhicule : met à jour vehiclePlayersMap et playerVehicleMap et resynchronise les personas. *(interne)* *(hook)* | 2687 |
| `core_vehicles.openPartsSelectorUI()` | Ouvre l'écran de configuration des pièces (route pause.vehicle.configurationcombined ou module vehicleconfig). Ne fait rien dans le menu principal ou sans véhicule joueur ; peut renvoyer false si la première conduite guidée l'interdit. | 1079 |
| `core_vehicles.openSelectorUI()` | Ouvre le sélecteur de véhicule (nouvelle interface selon le menu pause V2 ou non). Ne fait rien dans le menu principal. | 1067 |
| `core_vehicles.openSelectorUI_legcay()` | Ouvre l'ancien sélecteur de véhicule (guihook MenuOpenModule 'vehicleselect'). Le nom contient une faute (legcay). | 1101 |
| `core_vehicles.paintSignature(paint)` | Texte JSON identifiant une peinture (baseColor, clearcoat, clearcoatRoughness, metallic, roughness, à 5 décimales), utile pour comparer des peintures. | 3131 |
| `core_vehicles.regenerateVehicleLicenseText(veh)` | Génère un nouveau texte de plaque aléatoire pour un véhicule sans modifier le texte stocké. | 2140 |
| `core_vehicles.reloadVehicle(playerId)` | Appelé au rechargement du véhicule d'un joueur : libère SteamLicensePlateVehicleId si c'était ce véhicule (pour qu'un autre puisse porter le nom Steam). *(interne)* | 2935 |
| `core_vehicles.removeAll()` | Supprime tous les véhicules ; passe d'abord en caméra libre si le joueur 0 avait un véhicule. | 2009 |
| `core_vehicles.removeAllExceptCurrent()` | Supprime tous les véhicules sauf celui du joueur 0. | 1976 |
| `core_vehicles.removeCurrent()` | Supprime le véhicule du joueur 0 (journalise une erreur s'il n'y en a pas) ; passe en caméra libre s'il n'y a plus de véhicule enterable. | 1888 |
| `core_vehicles.replaceVehicle(modelName, opt, otherVeh, replaceWholeCollection)` | Remplace un véhicule (celui du joueur 0 par défaut) par un autre modèle/config, en réutilisant l'objet véhicule existant. Si aucun véhicule n'existe, en crée un (sous réserve de la limite). Supprime les véhicules restants de la collection remplacée. Appelée directement par l'interface. | 1908 |
| `core_vehicles.requestList()` | Envoie la liste des modèles et configurations à l'interface (guihook sendVehicleList). En carrière dans le menu « myCars » de garage, envoie les véhicules de l'inventaire à la place des configurations. *(interne)* | 1114 |
| `core_vehicles.requestListEnd()` | Termine le profilage de la liste de véhicules (appelée par l'interface à la fin). *(interne)* | 1161 |
| `core_vehicles.setMeshVisibility(alpha)` | Appelé par les boutons de visibilité des meshes de la configuration : fixe la transparence des pièces surlignées via core_vehicle_partmgmt. Ne pas utiliser ailleurs. *(interne)* | 2948 |
| `core_vehicles.setPlateText(txt, vehId, designPath, formats)` | Définit le texte, le design et les formats de la plaque d'un véhicule, puis rend les textures de plaque via core_skiaTemplate (sauf si SkipGenerateLicencePlate, licenseNoGen ou mode headless : plaque par défaut « BEAMNG »). Émet onLicensePlateChanged(txt, vehId, designPath, formats). Les valeurs nil conservent les valeurs actuelles. | 2197 |
| `core_vehicles.setVehiclePersona(vehId, persona)` | Associe une persona (profil) à un véhicule et en informe le véhicule (setPlayerPersona + onSettingsChanged côté véhicule). | 2635 |
| `core_vehicles.spawnDefault(options)` | Fait apparaître le véhicule par défaut de l'utilisateur (fichier pathDefaultConfig) ou, sinon, le modèle par défaut du jeu ; remplace le véhicule actuel s'il y en a un. Émet onSpawnDefaultVehicle. | 2574 |
| `core_vehicles.spawnNewVehicle(modelName, opt)` | Fait apparaître un nouveau véhicule (ou plusieurs pour une configuration multi-véhicules). Passe en caméra de jeu s'il n'y avait pas de véhicule joueur. Appelée directement par l'interface. | 1854 |

### Détail des paramètres

#### `core_vehicles.changeMeshVisibility(delta)`

Appelé par les touches de visibilité des meshes : change la transparence des pièces surlignées via core_vehicle_partmgmt. Ne pas utiliser ailleurs.

- `delta` (*number*) : Variation de visibilité.

#### `core_vehicles.cloneCurrent()`

Fait apparaître une copie du véhicule du joueur 0 (même modèle, config, peintures), émet onPlayerVehicleCloned. Refuse si pas de véhicule, si la limite de véhicules est atteinte ou si le joueur marche.

- **renvoie** : table|boolean|nil Résultat de spawnNewVehicle (objet véhicule) ou false si refusé.

#### `core_vehicles.convertVehicleInfo(info, infoFilename)`

Convertit un info.json au nouveau format : les couleurs textuelles (colors) deviennent des peintures (paints), les anciennes couleurs par défaut (default_color…) deviennent defaultPaintName1/2/3.

- `info` (*table*) : Contenu d'un info.json (modifié sur place).
- `infoFilename` (*string*) : Chemin du fichier (pour les messages).
- **renvoie** : table La même table convertie.

#### `core_vehicles.createFilters(list)`

Construit les filtres de l'interface (plage min/max ou ensemble de valeurs possibles par attribut) à partir des agrégats d'une liste de modèles ou de configurations.

- `list` (*table|nil*) : Liste ou dictionnaire d'éléments possédant un champ aggregates.
- **renvoie** : table<string, table> Filtres indexés par nom d'attribut.

#### `core_vehicles.generateAttachedVehiclesTree(vehId)`

Construit l'arbre des véhicules attelés à partir d'un véhicule (parents et enfants via les attelages).

- `vehId` (*integer*) : Id du véhicule de départ.
- **renvoie** : table|nil Entrée racine de l'arbre (déduit du code).

#### `core_vehicles.getAttributesConvertToDict()`

Liste des attributs convertis en dictionnaire pour les agrégats (Region, InsuranceClass).

- **renvoie** : string[] Noms d'attributs.

#### `core_vehicles.getAttributesConvertToRange()`

Liste des attributs convertis en plage pour les agrégats (Value, Weight, Top Speed, 0-100 km/h, 0-60 mph, Weight/Power, Off-Road Score).

- **renvoie** : string[] Noms d'attributs.

#### `core_vehicles.getAttributesWhiteList()`

Liste des attributs autorisés comme filtres de la liste de véhicules (Drivetrain, Type, Transmission, Country, Brand, Body Style, Source…).

- **renvoie** : string[] Noms d'attributs.

#### `core_vehicles.getConfig(modelName, configKey)`

Renvoie la configuration d'un modèle par sa clé.

- `modelName` (*string*) : Clé du modèle (nom du dossier dans /vehicles).
- `configKey` (*string*) : Clé de la configuration (nom du .pc sans extension).
- **renvoie** : table|nil Données de la configuration, nil si absente.

#### `core_vehicles.getConfigList(array)`

Liste toutes les configurations de tous les modèles, avec les filtres associés.

- `array` (*boolean|nil*) : true : liste en tableau ; sinon indexée par « modèle_clé ».
- **renvoie** : table {configs, filters, displayInfo}

#### `core_vehicles.getCouplerOffset(vehId, couplerTag)`

Décalage (x, y, z) des noeuds d'attelage d'un véhicule par rapport à son noeud de référence, filtré par tag.

- `vehId` (*integer*) : Id du véhicule.
- `couplerTag` (*string|nil*) : Tag recherché (couplerTag ou tag) ; vide ou nil = tous.
- **renvoie** : table<integer, table>|nil Table indexée par id de noeud : {x, y, z, couplerTag, tag}.

#### `core_vehicles.getCurrentVehicleDetails()`

Détails du véhicule du joueur 0 (équivalent à getVehicleDetails(be:getPlayerVehicleID(0))). On peut aussi utiliser playerVehicle:getJBeamFilename().

- **renvoie** : table {current = {key, pc_file, position, color, config_key}, model, configs, userDefault}

#### `core_vehicles.getDefaultVehicleParams()`

Détermine le véhicule par défaut à lancer au démarrage : argument de ligne de commande vehicleConfig, sinon $beamngVehicleArgs, sinon la configuration par défaut du dossier vehicles, sinon la pickup (ou etk800).

- **renvoie** : table|boolean|nil {modèle, {config = chemin .pc}} ou true/nil selon les cas (valeur de retour hétérogène).

#### `core_vehicles.getFilesJson()`

Cache des fichiers info JSON des véhicules (calculé au premier appel).

- **renvoie** : table Liste de chemins de fichiers (déduit du code).

#### `core_vehicles.getFilesParsed()`

Cache des fichiers JSON/PC déjà lus, indexé par chemin (par ex. /vehicles/pickup/info.json).

- **renvoie** : table<string, table> Contenu décodé des fichiers.

#### `core_vehicles.getModel(key)`

Toutes les infos d'un modèle : fiche du modèle, configurations, peintures, aperçus, agrégats. Résultat mis en cache. Un nom invalide (non chaîne) renvoie {} ; un modèle inconnu journalise une erreur et renvoie {}.

- `key` (*string*) : Clé du modèle (nom du dossier dans /vehicles).
- **renvoie** : table {model = table, configs = table<string, table>}, ou {} si introuvable.

#### `core_vehicles.getModelList(array)`

Liste de tous les modèles disponibles avec les filtres et les informations d'affichage.

- `array` (*boolean|nil*) : true : tableau ; sinon table indexée par clé de modèle.
- **renvoie** : table {models, filters, displayInfo}

#### `core_vehicles.getModelsData()`

Scanne /vehicles et renvoie les modèles trouvés avec leurs fichiers (info, .pc, jbeam, images). Résultat mis en cache jusqu'à clearCache.

- **renvoie** : table<string, table> Données brutes par clé de modèle.

#### `core_vehicles.getPaintFiles()`

Cache des fichiers de peintures trouvés.

- **renvoie** : table Fichiers de peintures (déduit du code).

#### `core_vehicles.getVehicleDetails(id)`

Détails d'un véhicule : clé du modèle, fichier .pc, position, couleur, clé de configuration, fiche du modèle et de la configuration.

- `id` (*integer*) : Id de l'objet véhicule.
- **renvoie** : table {current = {key, pc_file, position, color, config_key}, model, configs, userDefault (true si .pc est la config par défaut de l'utilisateur)}

#### `core_vehicles.getVehicleLicenseText(veh)`

Texte actuel de la plaque d'un véhicule (dynData licenseText).

- `veh` (*userdata|nil*) : Objet véhicule.
- **renvoie** : string Texte de la plaque, chaîne vide sans véhicule.

#### `core_vehicles.getVehicleList()`

Liste des véhicules (fiches complètes de chaque modèle) et filtres, format utilisé par l'ancienne interface (ui2).

- **renvoie** : table {vehicles, filters}

#### `core_vehicles.getVehiclePersona(vehId)`

Id de persona (profil de joueur) associé à un véhicule.

- `vehId` (*integer*) : Id du véhicule.
- **renvoie** : string|nil Id de persona ou nil.

#### `core_vehicles.isLicensePlateValid(text)`

Vérifie qu'un texte de plaque est acceptable (nil accepté ; le guillemet double est interdit).

- `text` (*string|nil*) : Texte à vérifier.
- **renvoie** : boolean true si valide.

#### `core_vehicles.isModelListLoaded()`

Indique si tous les modèles sont déjà dans le cache de getModel.

- **renvoie** : boolean true si la liste est entièrement chargée.

#### `core_vehicles.isModelsDataLoaded()`

Indique si getModelsData a déjà été calculé.

- **renvoie** : boolean true si en cache.

#### `core_vehicles.loadCustomVehicle(modelName, data)`

Écrit le modèle et la config dans les variables $beamngVehicle et $beamngVehicleConfig du VariableRegistry (démarrage avec un véhicule donné).

- `modelName` (*string*) : Clé du modèle.
- `data` (*table*) : Table avec le champ config (chemin du .pc).

#### `core_vehicles.loadModelListNoGarbage()`

Charge en cache tous les modèles (getModel pour chacun) sans construire de grosse liste.

- **renvoie** : boolean true.

#### `core_vehicles.makeVehicleLicenseText(veh, designPath)`

Détermine le texte de plaque d'un véhicule : texte forcé (forceLicenceStr ou fichier settings/cloud/forceLicencePlate.txt), texte déjà stocké (licenseText), nom Steam si l'option useSteamName est active en freeroam (une seule fois), sinon texte généré par core_skiaTemplate.generateText.

- `veh` (*userdata|integer|nil*) : Objet ou id du véhicule (joueur 0 par défaut).
- `designPath` (*string|nil*) : Chemin du design de plaque (sktemplate).
- **renvoie** : string Texte de la plaque ('' sans véhicule).

#### `core_vehicles.onCouplerAttached(objId1, objId2, nodeId, obj2nodeId)`

Hook appelé quand un attelage s'attache : enregistre le couple dans attachedCouplers et vehsCouplings.

- `objId1` (*integer*) : Id du premier véhicule.
- `objId2` (*integer*) : Id du second véhicule.
- `nodeId` (*integer*) : Noeud d'attelage du premier véhicule.
- `obj2nodeId` (*integer*) : Noeud d'attelage du second véhicule.

#### `core_vehicles.onCouplerDetached(obj1id, obj2id, nodeId, obj2nodeId)`

Hook appelé quand un attelage se détache (de n'importe quelle façon) : retire le couple des tables de suivi.

- `obj1id` (*integer*) : Id du premier véhicule.
- `obj2id` (*integer*) : Id du second véhicule.
- `nodeId` (*integer*) : Noeud du premier véhicule.
- `obj2nodeId` (*integer*) : Noeud du second véhicule.

#### `core_vehicles.onDeserialized(data)`

Hook appelé après un rechargement des extensions : restaure les tables de suivi (joueurs, personas, attelages, collections) et reconstruit les caches de collections.

- `data` (*table*) : Données de onSerialize.

#### `core_vehicles.onFileChanged(filename, type)`

Hook appelé quand un fichier change sur le disque : marque le cache comme obsolète si le fichier est un .json, .jbeam, .pc, .jpg ou .png sous /vehicles/ ou /mods/.

- `filename` (*string*) : Chemin du fichier modifié.
- `type` (*string*) : Type de modification (non utilisé).

#### `core_vehicles.onInstabilityDetected(vid, returnData)`

Hook appelé quand la physique d'un véhicule devient instable : si le réglage pauseGameOnInstability est actif (et hors multijoueur), réinitialise le véhicule, met le jeu en pause et marque returnData.instabilityHandled = true.

- `vid` (*integer*) : Id du véhicule instable.
- `returnData` (*table|nil*) : Table de retour où instabilityHandled est mis à true.

#### `core_vehicles.onPersonaSettingsChanged(persona)`

Hook appelé quand les réglages d'une persona changent : demande aux véhicules qui l'utilisent de relire leurs réglages (onSettingsChanged côté véhicule).

- `persona` (*table|string*) : Persona ou son id.

#### `core_vehicles.onPreVehicleSpawned(vehId)`

Hook appelé avant l'apparition d'un véhicule : initialise les tables d'attelage (couplings, couplerCache, couplerTags, couplerOffset) à partir des noeuds du véhicule ayant un couplerTag ou tag, et vehiclePlayersMap.

- `vehId` (*integer*) : Id du véhicule.

#### `core_vehicles.onSerialize()`

Hook appelé avant un rechargement des extensions : renvoie les tables de suivi des joueurs, personas, attelages et collections (sans vehsData).

- **renvoie** : table Données restaurées par onDeserialized.

#### `core_vehicles.onVehicleDestroyed(vid)`

Hook appelé à la destruction d'un véhicule : retire ses attelages, couplings, collections et entrées de suivi des joueurs.

- `vid` (*integer*) : Id du véhicule détruit.

#### `core_vehicles.onVehicleSwitched(oldId, newId, player)`

Hook appelé quand un joueur change de véhicule : met à jour vehiclePlayersMap et playerVehicleMap et resynchronise les personas.

- `oldId` (*integer*) : Ancien véhicule (-1 si aucun).
- `newId` (*integer*) : Nouveau véhicule (-1 si aucun).
- `player` (*integer*) : Index du joueur.

#### `core_vehicles.openPartsSelectorUI()`

Ouvre l'écran de configuration des pièces (route pause.vehicle.configurationcombined ou module vehicleconfig). Ne fait rien dans le menu principal ou sans véhicule joueur ; peut renvoyer false si la première conduite guidée l'interdit.

- **renvoie** : boolean|nil false si refusé par la session de première conduite.

#### `core_vehicles.paintSignature(paint)`

Texte JSON identifiant une peinture (baseColor, clearcoat, clearcoatRoughness, metallic, roughness, à 5 décimales), utile pour comparer des peintures.

- `paint` (*table*) : Peinture {baseColor = {r,g,b,a}, metallic, roughness, clearcoat, clearcoatRoughness}.
- **renvoie** : string Chaîne JSON.

#### `core_vehicles.regenerateVehicleLicenseText(veh)`

Génère un nouveau texte de plaque aléatoire pour un véhicule sans modifier le texte stocké.

- `veh` (*userdata|nil*) : Objet véhicule.
- **renvoie** : string Texte généré ('' sans véhicule).

#### `core_vehicles.reloadVehicle(playerId)`

Appelé au rechargement du véhicule d'un joueur : libère SteamLicensePlateVehicleId si c'était ce véhicule (pour qu'un autre puisse porter le nom Steam).

- `playerId` (*integer*) : Index du joueur.

#### `core_vehicles.replaceVehicle(modelName, opt, otherVeh, replaceWholeCollection)`

Remplace un véhicule (celui du joueur 0 par défaut) par un autre modèle/config, en réutilisant l'objet véhicule existant. Si aucun véhicule n'existe, en crée un (sous réserve de la limite). Supprime les véhicules restants de la collection remplacée. Appelée directement par l'interface.

- `modelName` (*string*) : Clé du modèle.
- `opt` (*table|nil*) : Options de spawn (config, paint, pos, rot, licenseText, autoEnterVehicle…).
- `otherVeh` (*userdata|nil*) : Véhicule à remplacer (joueur 0 par défaut).
- `replaceWholeCollection` (*boolean|nil*) : true : réutilise tous les véhicules de la collection (remorques).
- **renvoie** : userdata|boolean|nil Premier véhicule ; second retour : liste de tous. false si la limite de véhicules est atteinte, nil en cas d'échec.

#### `core_vehicles.setMeshVisibility(alpha)`

Appelé par les boutons de visibilité des meshes de la configuration : fixe la transparence des pièces surlignées via core_vehicle_partmgmt. Ne pas utiliser ailleurs.

- `alpha` (*number*) : Opacité.

#### `core_vehicles.setPlateText(txt, vehId, designPath, formats)`

Définit le texte, le design et les formats de la plaque d'un véhicule, puis rend les textures de plaque via core_skiaTemplate (sauf si SkipGenerateLicencePlate, licenseNoGen ou mode headless : plaque par défaut « BEAMNG »). Émet onLicensePlateChanged(txt, vehId, designPath, formats). Les valeurs nil conservent les valeurs actuelles.

- `txt` (*string|nil*) : Texte (généré si nil ; sans guillemet double).
- `vehId` (*integer|nil*) : Id du véhicule (joueur 0 par défaut).
- `designPath` (*string|nil*) : Chemin du .sktemplate.json (valeur actuelle, puis design du niveau, puis design par défaut en repli).
- `formats` (*string[]|nil*) : Formats à rendre (« 30-15 » par défaut).

#### `core_vehicles.setVehiclePersona(vehId, persona)`

Associe une persona (profil) à un véhicule et en informe le véhicule (setPlayerPersona + onSettingsChanged côté véhicule).

- `vehId` (*integer*) : Id du véhicule.
- `persona` (*table|string|nil*) : Persona ou son id (nil pour retirer).
- **renvoie** : boolean false si la persona était déjà celle-là, true si elle a changé.

#### `core_vehicles.spawnDefault(options)`

Fait apparaître le véhicule par défaut de l'utilisateur (fichier pathDefaultConfig) ou, sinon, le modèle par défaut du jeu ; remplace le véhicule actuel s'il y en a un. Émet onSpawnDefaultVehicle.

- `options` (*table|nil*) : Options de spawn (config et licenseText sont ajoutés).
- **renvoie** : userdata|boolean|nil Véhicule créé, false si la limite est atteinte.

#### `core_vehicles.spawnNewVehicle(modelName, opt)`

Fait apparaître un nouveau véhicule (ou plusieurs pour une configuration multi-véhicules). Passe en caméra de jeu s'il n'y avait pas de véhicule joueur. Appelée directement par l'interface.

- `modelName` (*string*) : Clé du modèle.
- `opt` (*table*) : Options de spawn : config, paint, paint2, paint3, pos, rot, licenseText, vehicleName, autoEnterVehicle, canSpawnAnotherVehicleCheck, safeSpawn, additionalVehicleData… (ne pas passer nil, voir notes).
- **renvoie** : userdata|boolean|nil Premier véhicule créé ; second retour : liste de tous. false si limite atteinte, nil en cas d'échec.

## Champs

| Champ | Type | Description |
|---|---|---|
| `attachedCouplers` | table[] | Liste des attelages actuellement attachés : {idVéhicule1, idVéhicule2, noeud1, noeud2}. Mise à jour par onCouplerAttached/onCouplerDetached. |
| `couplerTagsOptions` | table<string, string|boolean> | Tags d'attelage connus (tow_hitch, fifthwheel, gooseneck_hitch, pintle = 'autoCouple' ; fifthwheel_v2 = true). |
| `defaultVehicleModel` | string | Modèle par défaut : 'pickup' (ou 'etk800' pour la version tech). |
| `dependencies` | string[] | core_vehiclePaints, core_locales, core_skiaTemplate. |
| `finalRanges` | string[] | Attributs que l'interface doit lire comme plages (Years, Value, Weight, Top Speed, 0-100 km/h, 0-60 mph, Weight/Power, Off-Road Score). |
| `initVehCollections` | table | Collections de véhicules dans leur état initial, indexées par id du véhicule principal. |
| `initVehIdToVehCollection` | table | Id de véhicule -> collection initiale (défini mais non rempli dans ce fichier). |
| `playerVehicleMap` | table<integer, integer> | Index de joueur -> id du véhicule qu'il occupe. |
| `removeAllWithProperty` | nil | Toujours nil (référence non définie). ⚠ référence `removeAllWithProperty` non définie dans le fichier (vaut probablement nil) |
| `resetVehCollectionEnabled` | boolean | true : réactive le replacement des collections de véhicules au reset (sérialisé). |
| `vehCollections` | table | Collections de véhicules actuelles, indexées par id du véhicule principal. |
| `vehIdToVehCollection` | table | Id de véhicule -> collection à laquelle il appartient. |
| `vehiclePersonaMap` | table<integer, string> | Id de véhicule -> id de persona (profil) du joueur qui l'occupe. |
| `vehiclePlayersMap` | table<integer, table<integer, boolean>> | Id de véhicule -> ensemble des index de joueurs qui l'occupent. |
| `vehsCouplerCache` | table | [idVéhicule][idNoeud] = copie des données du noeud d'attelage (couplerTag, tag, cid…). |
| `vehsCouplerOffset` | table | [idVéhicule][idNoeud] = vec3 de décalage du noeud d'attelage par rapport au noeud de référence. |
| `vehsCouplerTags` | table | [idVéhicule][idNoeud] = couplerTag. |
| `vehsCouplings` | table | Adjacence des véhicules attelés : vehsCouplings[id][autreId] = true. |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onBeforeVehicleReplaced` — écouté par 3 module(s)
- `onLicensePlateChanged`
- `onPlayerVehicleCloned` — écouté par 1 module(s)
- `onSpawnDefaultVehicle` — écouté par 1 module(s)
- `onVehicleCollectionReset`
- `onVehicleReplaced` — écouté par 6 module(s)

**Évènements UI (guihooks.trigger) :** `MenuOpenModule`, `Message`, `sendVehicleList`

## Appels vers le moteur (C++)

- `FS:` `directoryExists`, `directoryList`, `fileExists`, `findFiles`, `getFileOriginInfo`, `getGamePath`
- `be:` `enterNextVehicle`, `enterVehicle`, `getEnterableObjectCount`, `getObject`, `getObjectCount`, `getPlayerVehicleID`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/core/vehicles.lua`.*
