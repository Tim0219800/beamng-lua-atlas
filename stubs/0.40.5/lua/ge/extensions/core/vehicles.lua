---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/vehicles.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Catalogue et apparition des véhicules côté GE. Il lit les dossiers /vehicles/<modèle>/ (info.json, fichiers .pc, images, peintures, jbeam) pour construire la liste des modèles et des configurations avec leurs agrégats de filtrage (cache invalidé quand les fichiers changent), et fournit les fonctions de spawn/remplacement/suppression de véhicules (y compris les configurations multi-véhicules, format .pc 4 : remorques, etc.). Il suit aussi les couplages (attelages) entre véhicules, les « collections de véhicules » (véhicule principal + remorques à replacer ensemble), qui conduit quel véhicule (vehiclePlayersMap) et la plaque d'immatriculation. Un moddeur l'utilise pour lister les modèles (getModelList, getConfig), faire apparaître ou remplacer une voiture (spawnNewVehicle, replaceVehicle) et changer la plaque (setPlateText).
--- Accès : extension `core_vehicles` : `extensions.load("core_vehicles")`, puis la globale `core_vehicles`
---@class core_vehicles
---@field attachedCouplers table[] Liste des attelages actuellement attachés : {idVéhicule1, idVéhicule2, noeud1, noeud2}. Mise à jour par onCouplerAttached/onCouplerDetached.
---@field couplerTagsOptions table<string, string|boolean> Tags d'attelage connus (tow_hitch, fifthwheel, gooseneck_hitch, pintle = 'autoCouple' ; fifthwheel_v2 = true).
---@field defaultVehicleModel string Modèle par défaut : 'pickup' (ou 'etk800' pour la version tech).
---@field dependencies string[] core_vehiclePaints, core_locales, core_skiaTemplate.
---@field finalRanges string[] Attributs que l'interface doit lire comme plages (Years, Value, Weight, Top Speed, 0-100 km/h, 0-60 mph, Weight/Power, Off-Road Score).
---@field initVehCollections table Collections de véhicules dans leur état initial, indexées par id du véhicule principal.
---@field initVehIdToVehCollection table Id de véhicule -> collection initiale (défini mais non rempli dans ce fichier).
---@field playerVehicleMap table<integer, integer> Index de joueur -> id du véhicule qu'il occupe.
---@field removeAllWithProperty nil Toujours nil (référence non définie).
---@field resetVehCollectionEnabled boolean true : réactive le replacement des collections de véhicules au reset (sérialisé).
---@field vehCollections table Collections de véhicules actuelles, indexées par id du véhicule principal.
---@field vehIdToVehCollection table Id de véhicule -> collection à laquelle il appartient.
---@field vehiclePersonaMap table<integer, string> Id de véhicule -> id de persona (profil) du joueur qui l'occupe.
---@field vehiclePlayersMap table<integer, table<integer, boolean>> Id de véhicule -> ensemble des index de joueurs qui l'occupent.
---@field vehsCouplerCache table [idVéhicule][idNoeud] = copie des données du noeud d'attelage (couplerTag, tag, cid…).
---@field vehsCouplerOffset table [idVéhicule][idNoeud] = vec3 de décalage du noeud d'attelage par rapport au noeud de référence.
---@field vehsCouplerTags table [idVéhicule][idNoeud] = couplerTag.
---@field vehsCouplings table Adjacence des véhicules attelés : vehsCouplings[id][autreId] = true.
core_vehicles = {}

--- Appelé par les touches de visibilité des meshes : change la transparence des pièces surlignées via core_vehicle_partmgmt. Ne pas utiliser ailleurs.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/vehicles.lua:2943
---@param delta number Variation de visibilité.
function core_vehicles.changeMeshVisibility(delta) end

--- Vide tous les caches (fichiers, modèles, données de modèles) ; ils sont reconstruits à la demande.
---Source : lua/ge/extensions/core/vehicles.lua:2019
function core_vehicles.clearCache() end

--- Fait apparaître une copie du véhicule du joueur 0 (même modèle, config, peintures), émet onPlayerVehicleCloned. Refuse si pas de véhicule, si la limite de véhicules est atteinte ou si le joueur marche.
---Source : lua/ge/extensions/core/vehicles.lua:1986
---@return table|boolean|nil  Résultat de spawnNewVehicle (objet véhicule) ou false si refusé.
function core_vehicles.cloneCurrent() end

--- Convertit un info.json au nouveau format : les couleurs textuelles (colors) deviennent des peintures (paints), les anciennes couleurs par défaut (default_color…) deviennent defaultPaintName1/2/3.
---Source : lua/ge/extensions/core/vehicles.lua:572
---@param info table Contenu d'un info.json (modifié sur place).
---@param infoFilename string Chemin du fichier (pour les messages).
---@return table  La même table convertie.
function core_vehicles.convertVehicleInfo(info, infoFilename) end

--- Construit les filtres de l'interface (plage min/max ou ensemble de valeurs possibles par attribut) à partir des agrégats d'une liste de modèles ou de configurations.
---Source : lua/ge/extensions/core/vehicles.lua:966
---@param list table|nil Liste ou dictionnaire d'éléments possédant un champ aggregates.
---@return table<string, table>  Filtres indexés par nom d'attribut.
function core_vehicles.createFilters(list) end

--- Passe en caméra libre s'il n'y a plus de véhicule enterable (sauf si le joueur est l'unicycle).
---Source : lua/ge/extensions/core/vehicles.lua:1900
function core_vehicles.enterFreecamIfNoVehicles() end

--- Outil de développement : affiche les valeurs de propriétés de tous les modèles/configurations et les lignes de traduction correspondantes.
---Source : lua/ge/extensions/core/vehicles.lua:3149
function core_vehicles.extractProperties() end

--- Outil de développement : parcourt tous les modèles et configurations pour comparer les peintures des fichiers .pc et des infos.
---Source : lua/ge/extensions/core/vehicles.lua:3227
function core_vehicles.extractVehicles() end

--- Construit l'arbre des véhicules attelés à partir d'un véhicule (parents et enfants via les attelages).
---Source : lua/ge/extensions/core/vehicles.lua:1504
---@param vehId integer Id du véhicule de départ.
---@return table|nil  Entrée racine de l'arbre (déduit du code).
function core_vehicles.generateAttachedVehiclesTree(vehId) end

--- Liste des attributs convertis en dictionnaire pour les agrégats (Region, InsuranceClass).
---Source : lua/ge/extensions/core/vehicles.lua:2953
---@return string[]  Noms d'attributs.
function core_vehicles.getAttributesConvertToDict() end

--- Liste des attributs convertis en plage pour les agrégats (Value, Weight, Top Speed, 0-100 km/h, 0-60 mph, Weight/Power, Off-Road Score).
---Source : lua/ge/extensions/core/vehicles.lua:2954
---@return string[]  Noms d'attributs.
function core_vehicles.getAttributesConvertToRange() end

--- Liste des attributs autorisés comme filtres de la liste de véhicules (Drivetrain, Type, Transmission, Country, Brand, Body Style, Source…).
---Source : lua/ge/extensions/core/vehicles.lua:2952
---@return string[]  Noms d'attributs.
function core_vehicles.getAttributesWhiteList() end

--- Renvoie la configuration d'un modèle par sa clé.
---Source : lua/ge/extensions/core/vehicles.lua:1057
---@param modelName string Clé du modèle (nom du dossier dans /vehicles).
---@param configKey string Clé de la configuration (nom du .pc sans extension).
---@return table|nil  Données de la configuration, nil si absente.
function core_vehicles.getConfig(modelName, configKey) end

--- Liste toutes les configurations de tous les modèles, avec les filtres associés.
---Source : lua/ge/extensions/core/vehicles.lua:1038
---@param array boolean|nil true : liste en tableau ; sinon indexée par « modèle_clé ».
---@return table  {configs, filters, displayInfo}
function core_vehicles.getConfigList(array) end

--- Décalage (x, y, z) des noeuds d'attelage d'un véhicule par rapport à son noeud de référence, filtré par tag.
---Source : lua/ge/extensions/core/vehicles.lua:1510
---@param vehId integer Id du véhicule.
---@param couplerTag string|nil Tag recherché (couplerTag ou tag) ; vide ou nil = tous.
---@return table<integer, table>|nil  Table indexée par id de noeud : {x, y, z, couplerTag, tag}.
function core_vehicles.getCouplerOffset(vehId, couplerTag) end

--- Détails du véhicule du joueur 0 (équivalent à getVehicleDetails(be:getPlayerVehicleID(0))). On peut aussi utiliser playerVehicle:getJBeamFilename().
---Source : lua/ge/extensions/core/vehicles.lua:961
---@return table  {current = {key, pc_file, position, color, config_key}, model, configs, userDefault}
function core_vehicles.getCurrentVehicleDetails() end

--- Détermine le véhicule par défaut à lancer au démarrage : argument de ligne de commande vehicleConfig, sinon $beamngVehicleArgs, sinon la configuration par défaut du dossier vehicles, sinon la pickup (ou etk800).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/vehicles.lua:2312
---@return table|boolean|nil  {modèle, {config = chemin .pc}} ou true/nil selon les cas (valeur de retour hétérogène).
function core_vehicles.getDefaultVehicleParams() end

--- Cache des fichiers info JSON des véhicules (calculé au premier appel).
---Source : lua/ge/extensions/core/vehicles.lua:388
---@return table  Liste de chemins de fichiers (déduit du code).
function core_vehicles.getFilesJson() end

--- Cache des fichiers JSON/PC déjà lus, indexé par chemin (par ex. /vehicles/pickup/info.json).
---Source : lua/ge/extensions/core/vehicles.lua:404
---@return table<string, table>  Contenu décodé des fichiers.
function core_vehicles.getFilesParsed() end

--- Toutes les infos d'un modèle : fiche du modèle, configurations, peintures, aperçus, agrégats. Résultat mis en cache. Un nom invalide (non chaîne) renvoie {} ; un modèle inconnu journalise une erreur et renvoie {}.
---Source : lua/ge/extensions/core/vehicles.lua:771
---@param key string Clé du modèle (nom du dossier dans /vehicles).
---@return table  {model = table, configs = table<string, table>}, ou {} si introuvable.
function core_vehicles.getModel(key) end

--- Liste de tous les modèles disponibles avec les filtres et les informations d'affichage.
---Source : lua/ge/extensions/core/vehicles.lua:1002
---@param array boolean|nil true : tableau ; sinon table indexée par clé de modèle.
---@return table  {models, filters, displayInfo}
function core_vehicles.getModelList(array) end

--- Scanne /vehicles et renvoie les modèles trouvés avec leurs fichiers (info, .pc, jbeam, images). Résultat mis en cache jusqu'à clearCache.
---Source : lua/ge/extensions/core/vehicles.lua:433
---@return table<string, table>  Données brutes par clé de modèle.
function core_vehicles.getModelsData() end

--- Cache des fichiers de peintures trouvés.
---Source : lua/ge/extensions/core/vehicles.lua:410
---@return table  Fichiers de peintures (déduit du code).
function core_vehicles.getPaintFiles() end

--- Détails d'un véhicule : clé du modèle, fichier .pc, position, couleur, clé de configuration, fiche du modèle et de la configuration.
---Source : lua/ge/extensions/core/vehicles.lua:939
---@param id integer Id de l'objet véhicule.
---@return table  {current = {key, pc_file, position, color, config_key}, model, configs, userDefault (true si .pc est la config par défaut de l'utilisateur)}
function core_vehicles.getVehicleDetails(id) end

--- Texte actuel de la plaque d'un véhicule (dynData licenseText).
---Source : lua/ge/extensions/core/vehicles.lua:2152
---@param veh userdata|nil Objet véhicule.
---@return string  Texte de la plaque, chaîne vide sans véhicule.
function core_vehicles.getVehicleLicenseText(veh) end

--- Liste des véhicules (fiches complètes de chaque modèle) et filtres, format utilisé par l'ancienne interface (ui2).
---Source : lua/ge/extensions/core/vehicles.lua:1167
---@return table  {vehicles, filters}
function core_vehicles.getVehicleList() end

--- Id de persona (profil de joueur) associé à un véhicule.
---Source : lua/ge/extensions/core/vehicles.lua:2644
---@param vehId integer Id du véhicule.
---@return string|nil  Id de persona ou nil.
function core_vehicles.getVehiclePersona(vehId) end

--- Vérifie qu'un texte de plaque est acceptable (nil accepté ; le guillemet double est interdit).
---Source : lua/ge/extensions/core/vehicles.lua:2160
---@param text string|nil Texte à vérifier.
---@return boolean  true si valide.
function core_vehicles.isLicensePlateValid(text) end

--- Indique si tous les modèles sont déjà dans le cache de getModel.
---Source : lua/ge/extensions/core/vehicles.lua:1029
---@return boolean  true si la liste est entièrement chargée.
function core_vehicles.isModelListLoaded() end

--- Indique si getModelsData a déjà été calculé.
---Source : lua/ge/extensions/core/vehicles.lua:546
---@return boolean  true si en cache.
function core_vehicles.isModelsDataLoaded() end

--- Écrit le modèle et la config dans les variables $beamngVehicle et $beamngVehicleConfig du VariableRegistry (démarrage avec un véhicule donné).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/vehicles.lua:2302
---@param modelName string Clé du modèle.
---@param data table Table avec le champ config (chemin du .pc).
function core_vehicles.loadCustomVehicle(modelName, data) end

--- Charge en cache tous les modèles (getModel pour chacun) sans construire de grosse liste.
---Source : lua/ge/extensions/core/vehicles.lua:1021
---@return boolean  true.
function core_vehicles.loadModelListNoGarbage() end

--- Détermine le texte de plaque d'un véhicule : texte forcé (forceLicenceStr ou fichier settings/cloud/forceLicencePlate.txt), texte déjà stocké (licenseText), nom Steam si l'option useSteamName est active en freeroam (une seule fois), sinon texte généré par core_skiaTemplate.generateText.
---Source : lua/ge/extensions/core/vehicles.lua:2100
---@param veh userdata|integer|nil Objet ou id du véhicule (joueur 0 par défaut).
---@param designPath string|nil Chemin du design de plaque (sktemplate).
---@return string  Texte de la plaque ('' sans véhicule).
function core_vehicles.makeVehicleLicenseText(veh, designPath) end

--- Hook appelé quand un attelage s'attache : enregistre le couple dans attachedCouplers et vehsCouplings.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/vehicles.lua:2829
---@param objId1 integer Id du premier véhicule.
---@param objId2 integer Id du second véhicule.
---@param nodeId integer Noeud d'attelage du premier véhicule.
---@param obj2nodeId integer Noeud d'attelage du second véhicule.
function core_vehicles.onCouplerAttached(objId1, objId2, nodeId, obj2nodeId) end

--- Hook appelé quand un attelage se détache (de n'importe quelle façon) : retire le couple des tables de suivi.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/vehicles.lua:2910
---@param obj1id integer Id du premier véhicule.
---@param obj2id integer Id du second véhicule.
---@param nodeId integer Noeud du premier véhicule.
---@param obj2nodeId integer Noeud du second véhicule.
function core_vehicles.onCouplerDetached(obj1id, obj2id, nodeId, obj2nodeId) end

--- Hook appelé après un rechargement des extensions : restaure les tables de suivi (joueurs, personas, attelages, collections) et reconstruit les caches de collections.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/vehicles.lua:2988
---@param data table Données de onSerialize.
function core_vehicles.onDeserialized(data) end

--- Hook appelé quand un fichier change sur le disque : marque le cache comme obsolète si le fichier est un .json, .jbeam, .pc, .jpg ou .png sous /vehicles/ ou /mods/.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/vehicles.lua:2069
---@param filename string Chemin du fichier modifié.
---@param type string Type de modification (non utilisé).
function core_vehicles.onFileChanged(filename, type) end

--- Hook appelé après une série de changements de fichiers : vide le cache si un fichier pertinent a changé.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/vehicles.lua:2082
function core_vehicles.onFileChangedEnd() end

--- Hook appelé quand la physique d'un véhicule devient instable : si le réglage pauseGameOnInstability est actif (et hors multijoueur), réinitialise le véhicule, met le jeu en pause et marque returnData.instabilityHandled = true.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/vehicles.lua:3010
---@param vid integer Id du véhicule instable.
---@param returnData table|nil Table de retour où instabilityHandled est mis à true.
function core_vehicles.onInstabilityDetected(vid, returnData) end

--- Hook appelé au changement de langue : vide le cache (noms traduits).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/vehicles.lua:2096
function core_vehicles.onLanguageChanged() end

--- Hook appelé quand les participants locaux (multi-sièges) changent : resynchronise la persona de chaque véhicule occupé.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/vehicles.lua:2681
function core_vehicles.onLocalParticipantsChanged() end

--- Hook appelé quand les réglages d'une persona changent : demande aux véhicules qui l'utilisent de relire leurs réglages (onSettingsChanged côté véhicule).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/vehicles.lua:2669
---@param persona table|string Persona ou son id.
function core_vehicles.onPersonaSettingsChanged(persona) end

--- Hook appelé avant l'apparition d'un véhicule : initialise les tables d'attelage (couplings, couplerCache, couplerTags, couplerOffset) à partir des noeuds du véhicule ayant un couplerTag ou tag, et vehiclePlayersMap.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/vehicles.lua:2599
---@param vehId integer Id du véhicule.
function core_vehicles.onPreVehicleSpawned(vehId) end

--- Hook appelé avant un rechargement des extensions : renvoie les tables de suivi des joueurs, personas, attelages et collections (sans vehsData).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/vehicles.lua:2956
---@return table  Données restaurées par onDeserialized.
function core_vehicles.onSerialize() end

--- Hook appelé quand les réglages changent : la logique showStandalonePcs est figée à true dans le code (la comparaison ne déclenche en pratique qu'au premier appel).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/vehicles.lua:2088
function core_vehicles.onSettingsChanged() end

--- Hook appelé à la destruction d'un véhicule : retire ses attelages, couplings, collections et entrées de suivi des joueurs.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/vehicles.lua:2709
---@param vid integer Id du véhicule détruit.
function core_vehicles.onVehicleDestroyed(vid) end

--- Hook appelé quand un joueur change de véhicule : met à jour vehiclePlayersMap et playerVehicleMap et resynchronise les personas.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/vehicles.lua:2687
---@param oldId integer Ancien véhicule (-1 si aucun).
---@param newId integer Nouveau véhicule (-1 si aucun).
---@param player integer Index du joueur.
function core_vehicles.onVehicleSwitched(oldId, newId, player) end

--- Ouvre l'écran de configuration des pièces (route pause.vehicle.configurationcombined ou module vehicleconfig). Ne fait rien dans le menu principal ou sans véhicule joueur ; peut renvoyer false si la première conduite guidée l'interdit.
---Source : lua/ge/extensions/core/vehicles.lua:1079
---@return boolean|nil  false si refusé par la session de première conduite.
function core_vehicles.openPartsSelectorUI() end

--- Ouvre le sélecteur de véhicule (nouvelle interface selon le menu pause V2 ou non). Ne fait rien dans le menu principal.
---Source : lua/ge/extensions/core/vehicles.lua:1067
function core_vehicles.openSelectorUI() end

--- Ouvre l'ancien sélecteur de véhicule (guihook MenuOpenModule 'vehicleselect'). Le nom contient une faute (legcay).
---Source : lua/ge/extensions/core/vehicles.lua:1101
function core_vehicles.openSelectorUI_legcay() end

--- Texte JSON identifiant une peinture (baseColor, clearcoat, clearcoatRoughness, metallic, roughness, à 5 décimales), utile pour comparer des peintures.
---Source : lua/ge/extensions/core/vehicles.lua:3131
---@param paint table Peinture {baseColor = {r,g,b,a}, metallic, roughness, clearcoat, clearcoatRoughness}.
---@return string  Chaîne JSON.
function core_vehicles.paintSignature(paint) end

--- Génère un nouveau texte de plaque aléatoire pour un véhicule sans modifier le texte stocké.
---Source : lua/ge/extensions/core/vehicles.lua:2140
---@param veh userdata|nil Objet véhicule.
---@return string  Texte généré ('' sans véhicule).
function core_vehicles.regenerateVehicleLicenseText(veh) end

--- Appelé au rechargement du véhicule d'un joueur : libère SteamLicensePlateVehicleId si c'était ce véhicule (pour qu'un autre puisse porter le nom Steam).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/vehicles.lua:2935
---@param playerId integer Index du joueur.
function core_vehicles.reloadVehicle(playerId) end

--- Supprime tous les véhicules ; passe d'abord en caméra libre si le joueur 0 avait un véhicule.
---Source : lua/ge/extensions/core/vehicles.lua:2009
function core_vehicles.removeAll() end

--- Supprime tous les véhicules sauf celui du joueur 0.
---Source : lua/ge/extensions/core/vehicles.lua:1976
function core_vehicles.removeAllExceptCurrent() end

--- Supprime le véhicule du joueur 0 (journalise une erreur s'il n'y en a pas) ; passe en caméra libre s'il n'y a plus de véhicule enterable.
---Source : lua/ge/extensions/core/vehicles.lua:1888
function core_vehicles.removeCurrent() end

--- Remplace un véhicule (celui du joueur 0 par défaut) par un autre modèle/config, en réutilisant l'objet véhicule existant. Si aucun véhicule n'existe, en crée un (sous réserve de la limite). Supprime les véhicules restants de la collection remplacée. Appelée directement par l'interface.
---Source : lua/ge/extensions/core/vehicles.lua:1908
---@param modelName string Clé du modèle.
---@param opt table|nil Options de spawn (config, paint, pos, rot, licenseText, autoEnterVehicle…).
---@param otherVeh userdata|nil Véhicule à remplacer (joueur 0 par défaut).
---@param replaceWholeCollection boolean|nil true : réutilise tous les véhicules de la collection (remorques).
---@return userdata|boolean|nil  Premier véhicule ; second retour : liste de tous. false si la limite de véhicules est atteinte, nil en cas d'échec.
function core_vehicles.replaceVehicle(modelName, opt, otherVeh, replaceWholeCollection) end

--- Envoie la liste des modèles et configurations à l'interface (guihook sendVehicleList). En carrière dans le menu « myCars » de garage, envoie les véhicules de l'inventaire à la place des configurations.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/vehicles.lua:1114
function core_vehicles.requestList() end

--- Termine le profilage de la liste de véhicules (appelée par l'interface à la fin).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/vehicles.lua:1161
function core_vehicles.requestListEnd() end

--- Appelé par les boutons de visibilité des meshes de la configuration : fixe la transparence des pièces surlignées via core_vehicle_partmgmt. Ne pas utiliser ailleurs.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/vehicles.lua:2948
---@param alpha number Opacité.
function core_vehicles.setMeshVisibility(alpha) end

--- Définit le texte, le design et les formats de la plaque d'un véhicule, puis rend les textures de plaque via core_skiaTemplate (sauf si SkipGenerateLicencePlate, licenseNoGen ou mode headless : plaque par défaut « BEAMNG »). Émet onLicensePlateChanged(txt, vehId, designPath, formats). Les valeurs nil conservent les valeurs actuelles.
---Source : lua/ge/extensions/core/vehicles.lua:2197
---@param txt string|nil Texte (généré si nil ; sans guillemet double).
---@param vehId integer|nil Id du véhicule (joueur 0 par défaut).
---@param designPath string|nil Chemin du .sktemplate.json (valeur actuelle, puis design du niveau, puis design par défaut en repli).
---@param formats string[]|nil Formats à rendre (« 30-15 » par défaut).
function core_vehicles.setPlateText(txt, vehId, designPath, formats) end

--- Associe une persona (profil) à un véhicule et en informe le véhicule (setPlayerPersona + onSettingsChanged côté véhicule).
---Source : lua/ge/extensions/core/vehicles.lua:2635
---@param vehId integer Id du véhicule.
---@param persona table|string|nil Persona ou son id (nil pour retirer).
---@return boolean  false si la persona était déjà celle-là, true si elle a changé.
function core_vehicles.setVehiclePersona(vehId, persona) end

--- Fait apparaître le véhicule par défaut de l'utilisateur (fichier pathDefaultConfig) ou, sinon, le modèle par défaut du jeu ; remplace le véhicule actuel s'il y en a un. Émet onSpawnDefaultVehicle.
---Source : lua/ge/extensions/core/vehicles.lua:2574
---@param options table|nil Options de spawn (config et licenseText sont ajoutés).
---@return userdata|boolean|nil  Véhicule créé, false si la limite est atteinte.
function core_vehicles.spawnDefault(options) end

--- Fait apparaître un nouveau véhicule (ou plusieurs pour une configuration multi-véhicules). Passe en caméra de jeu s'il n'y avait pas de véhicule joueur. Appelée directement par l'interface.
---Source : lua/ge/extensions/core/vehicles.lua:1854
---@param modelName string Clé du modèle.
---@param opt table Options de spawn : config, paint, paint2, paint3, pos, rot, licenseText, vehicleName, autoEnterVehicle, canSpawnAnotherVehicleCheck, safeSpawn, additionalVehicleData… (ne pas passer nil, voir notes).
---@return userdata|boolean|nil  Premier véhicule créé ; second retour : liste de tous. false si limite atteinte, nil en cas d'échec.
function core_vehicles.spawnNewVehicle(modelName, opt) end

