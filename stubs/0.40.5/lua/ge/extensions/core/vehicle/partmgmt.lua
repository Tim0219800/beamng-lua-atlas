---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/vehicle/partmgmt.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Extension GE `core_vehicle_partmgmt` : gestion des pièces et de la configuration d'un véhicule en cours de jeu (menu de configuration, tuning). Lit/modifie la config de `core_vehicle_manager.getVehicleData(id).config` (partsTree, vars, paints) et réapparaît le véhicule (`respawn`) pour appliquer les changements, sauvegarde/charge/supprime des configs .pc locales (format 2, avec fichier info_<nom>.json et miniature .jpg), enregistre des collections de véhicules (format 4), envoie les données du configurateur à l'UI (VehicleConfigChange) et gère la mise en surbrillance des pièces (rendu « rayons X » avec fondu). Le véhicule visé est celui de core_vehicle_configTarget (sinon le véhicule du joueur 0) ; la plupart des fonctions acceptent un id explicite.
--- Accès : extension `core_vehicle_partmgmt` : `extensions.load("core_vehicle_partmgmt")`, puis la globale `core_vehicle_partmgmt`
---@class core_vehicle_partmgmt
---@field dependencies string[] core_locales, core_vehicle_configTarget, core_vehicle_thumbnail, core_vehicle_partFocusCamera, gameplay_achievement.
---@field xrayFadeRate number Vitesse du fondu des meshes pour la surbrillance rayons X, en alpha par seconde (5 par défaut). Modifiable depuis la console : core_vehicle_partmgmt.xrayFadeRate = 5.
core_vehicle_partmgmt = {}

--- Construit la table de config d'un véhicule à partir d'une donnée de config : table de config, chaîne sérialisée commençant par '{', ou chemin de fichier .pc. Sans config valide, retombe sur default_pc du fichier info du modèle. Les fichiers de format 2 sont fusionnés dans le résultat, sinon le contenu devient `parts`. Appelée par core_vehicle_manager au spawn.
---Source : lua/ge/extensions/core/vehicle/partmgmt.lua:245
---@param vehicleDir string dossier du modèle (ex. 'vehicles/pickup/')
---@param configData table|string|nil config, chaîne sérialisée ou chemin .pc
---@param onlyReturnChosenConfig boolean|nil si true, renvoie (nil, false) plutôt que de se rabattre sur la config par défaut
---@return table|nil  config {partConfigFilename, parts|…, vars, paints…}
---@return boolean  true si la config demandée a bien été utilisée (pas le repli par défaut)
function core_vehicle_partmgmt.buildConfigFromString(vehicleDir, configData, onlyReturnChosenConfig) end

--- Modifie la transparence des pièces en surbrillance d'un delta (résultat borné 0..1).
---Source : lua/ge/extensions/core/vehicle/partmgmt.lua:1591
---@param deltaAlpha number variation
---@param inVehID integer|nil véhicule
function core_vehicle_partmgmt.changeHighlightedPartsVisiblity(deltaAlpha, inVehID) end

--- Supprime immédiatement l'état rayons X (rétablit l'alpha) pour le véhicule donné ou tout.
---Source : lua/ge/extensions/core/vehicle/partmgmt.lua:1369
---@param inVehID integer|nil véhicule ; nil = tous
function core_vehicle_partmgmt.clearVehicleHighlights(inVehID) end

--- Transforme un arbre de véhicules attelés (core_vehicles.generateAttachedVehiclesTree) en liste de configs de véhicules : calcule les décalages relatifs ('default' : x,y,z,rx,ry,rz ; 'coupledNodes' : rotations seulement), numérote les parents et sauvegarde la config de chaque véhicule (ou un linkedPCFile si issu d'un .pc).
---Source : lua/ge/extensions/core/vehicle/partmgmt.lua:419
---@param collectionTree table arbre de véhicules {vehId, offsetData, children}
---@return table[]  liste de configs de véhicules (format 4)
function core_vehicle_partmgmt.compileVehicleCollection(collectionTree) end

--- Config courante du véhicule visé.
---Source : lua/ge/extensions/core/vehicle/partmgmt.lua:981
---@return table|nil  config ; nil sans véhicule
function core_vehicle_partmgmt.getConfig() end

--- Liste les fichiers .pc du dossier du modèle du véhicule visé.
---Source : lua/ge/extensions/core/vehicle/partmgmt.lua:1074
---@return table[]|nil  entrées {fileName, name, displayName?, official, player, thumbnailPath?} ; nil sans véhicule
function core_vehicle_partmgmt.getConfigList() end

--- Config courante d'un véhicule (vehicleData.config).
---Source : lua/ge/extensions/core/vehicle/partmgmt.lua:974
---@param vehicleId integer id du véhicule
---@return table|nil  config (pas une copie) ; nil si inconnu
function core_vehicle_partmgmt.getConfigOfVehicle(vehicleId) end

--- Résout l'id du véhicule à configurer (alias de core_vehicle_configTarget.resolveVehicleId).
---Source : lua/ge/extensions/core/vehicle/partmgmt.lua:25
---@param explicitVehicleId integer|nil id demandé ; nil = cible de configuration, sinon joueur 0
---@return integer|nil  id valide, nil sinon
function core_vehicle_partmgmt.getConfigVehicleId(explicitVehicleId) end

--- Texte de plaque du véhicule visé.
---Source : lua/ge/extensions/core/vehicle/partmgmt.lua:1145
---@return string  texte ou ''
function core_vehicle_partmgmt.getCurrentLicensePlate() end

--- Nom de base (sans dossier ni .pc) de la config chargée dans le véhicule visé.
---Source : lua/ge/extensions/core/vehicle/partmgmt.lua:1048
---@return string|nil  nom de base
function core_vehicle_partmgmt.getCurrentLocalConfigName() end

--- Indique si une sauvegarde est possible (pas en marche à pied, véhicule présent).
---Source : lua/ge/extensions/core/vehicle/partmgmt.lua:605
---@return table  {canSave = boolean, reason = 'walking'|'noVehicle'|nil}
function core_vehicle_partmgmt.getSaveAvailability() end

--- Champs de métadonnées éditables pour la sauvegarde (d'après saveConfigUtils) pour le modèle du véhicule visé.
---Source : lua/ge/extensions/core/vehicle/partmgmt.lua:1061
---@param targetConfigName string|nil config cible (basename)
---@return table  champs ; {} si pas de véhicule
function core_vehicle_partmgmt.getSaveMetadataFields(targetConfigName) end

--- Traduit un nom d'UI : texte avec préfixe de traduction par défaut, ou table {txt, ctx} traduite avec contexte. Une autre table donne nil.
---Source : lua/ge/extensions/core/vehicle/partmgmt.lua:151
---@param name string|table clé de traduction ou {txt, ctx}
---@param prefix string|nil préfixe de repli, défaut 'ui.vehicleconfig.title.'
---@return string|nil  texte traduit
function core_vehicle_partmgmt.getTranslation(name, prefix) end

--- Indique si une pièce existe dans le contexte jbeam du véhicule visé.
---Source : lua/ge/extensions/core/vehicle/partmgmt.lua:846
---@param partName string nom de pièce
---@return boolean|nil  nil si partName est vide
function core_vehicle_partmgmt.hasAvailablePart(partName) end

--- Définit les pièces mises en surbrillance (clic sur l'œil de l'UI) et applique la transparence correspondante.
---Source : lua/ge/extensions/core/vehicle/partmgmt.lua:1613
---@param parts table<string, boolean> [chemin de pièce] = true pour les pièces visibles
---@param inVehID integer|nil véhicule ; nil = joueur
function core_vehicle_partmgmt.highlightParts(parts, inVehID) end

--- Remplace le véhicule visé par la config donnée (core_vehicles.replaceVehicle avec {config = filename}).
---Source : lua/ge/extensions/core/vehicle/partmgmt.lua:991
---@param filename string chemin ou nom de config .pc
---@param respawn boolean|nil non utilisé dans le code
function core_vehicle_partmgmt.loadLocal(filename, respawn) end

--- Hook : restaure les données de onSerialize.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/vehicle/partmgmt.lua:1902
---@param data table données
function core_vehicle_partmgmt.onDeserialized(data) end

--- Hook : l'extension est déchargée ; rétablit l'alpha des meshes.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/vehicle/partmgmt.lua:1856
function core_vehicle_partmgmt.onExtensionUnloaded() end

--- Hook : des fichiers ont changé ; vide le cache saveConfigUtils et invalide le cache des partpacks si un .partpacks.json a changé.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/vehicle/partmgmt.lua:1881
---@param files table[] liste {filename, …}
function core_vehicle_partmgmt.onFilesChanged(files) end

--- Hook : la langue change ; vide les caches de traduction.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/vehicle/partmgmt.lua:1860
function core_vehicle_partmgmt.onLanguageChanged() end

--- Hook : les traductions sont rechargées ; vide les caches.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/vehicle/partmgmt.lua:1865
function core_vehicle_partmgmt.onReloadLocales() end

--- Hook : sauvegarde les données de surbrillance avant rechargement Lua.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/vehicle/partmgmt.lua:1894
---@return table  {vehsPartsData, vehsRichPartInfo}
function core_vehicle_partmgmt.onSerialize() end

--- Hook par frame : applique le debounce du sélecteur de pièces et anime le fondu rayons X.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/vehicle/partmgmt.lua:1870
---@param dt number temps écoulé (s)
function core_vehicle_partmgmt.onUpdate(dt) end

--- Hook (core_vehicle_configTarget) : la cible de configuration change ; efface les rayons X et envoie les données du nouveau véhicule à l'UI.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/vehicle/partmgmt.lua:1849
---@param current table|nil nouvelle cible {vehId, playerId, returnRoute}
function core_vehicle_partmgmt.onVehicleConfigTargetChanged(current) end

--- Hook : un véhicule est détruit ; libère ses données de surbrillance.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/vehicle/partmgmt.lua:1841
---@param vehID integer véhicule
function core_vehicle_partmgmt.onVehicleDestroyed(vehID) end

--- Hook : un véhicule apparaît ; réinitialise l'état rayons X concerné et le cache d'informations de pièces.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/vehicle/partmgmt.lua:1826
---@param vehID integer véhicule
function core_vehicle_partmgmt.onVehicleSpawned(vehID) end

--- Hook : le joueur cible change de véhicule ; efface l'état rayons X.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/vehicle/partmgmt.lua:1834
---@param oldID integer ancien véhicule
---@param newID integer nouveau véhicule
---@param player integer joueur
function core_vehicle_partmgmt.onVehicleSwitched(oldID, newID, player) end

--- Ouvre dans l'explorateur de fichiers le dossier des configs du modèle (le crée s'il n'existe pas).
---Source : lua/ge/extensions/core/vehicle/partmgmt.lua:1312
function core_vehicle_partmgmt.openConfigFolderInExplorer() end

--- Appelée par l'UI quand la sélection du sélecteur de pièces change ; retarde de 0,1 s l'application (debounce) via highlightParts.
---Source : lua/ge/extensions/core/vehicle/partmgmt.lua:1734
---@param state table {vehID, partsSorted, partsHighlightedIdxs}
function core_vehicle_partmgmt.partsSelectorChanged(state) end

--- Aplatit un arbre de pièces résolu en dictionnaire slotId -> nom de pièce choisie (format `parts` des .pc). Les slots de même id à des chemins différents sont enregistrés sous leur chemin complet.
---Source : lua/ge/extensions/core/vehicle/partmgmt.lua:322
---@param partsTree table config.partsTree
---@return table<string, string>  [slotId ou chemin] = chosenPartName
function core_vehicle_partmgmt.partsTreeToPartsMap(partsTree) end

--- Génère et applique un nouveau texte de plaque aléatoire.
---Source : lua/ge/extensions/core/vehicle/partmgmt.lua:1164
---@return string  texte généré
function core_vehicle_partmgmt.regenerateCurrentLicensePlate() end

--- Rend la caméra au joueur (core_vehicle_partFocusCamera.clear).
---Source : lua/ge/extensions/core/vehicle/partmgmt.lua:1517
function core_vehicle_partmgmt.releasePartFocusCamera() end

--- Supprime <dossier>/<filename>.pc et sa miniature .jpg puis prévient l'UI (VehicleconfigRemoved).
---Source : lua/ge/extensions/core/vehicle/partmgmt.lua:1000
---@param filename string nom de config sans extension
function core_vehicle_partmgmt.removeLocal(filename) end

--- Réenvoie les données à l'UI (sendDataToUI).
---Source : lua/ge/extensions/core/vehicle/partmgmt.lua:901
function core_vehicle_partmgmt.reset() end

--- Recharge la config d'origine (partConfigFilename) du véhicule visé.
---Source : lua/ge/extensions/core/vehicle/partmgmt.lua:1776
function core_vehicle_partmgmt.resetAllToLoadedConfig() end

--- Vide parts et vars de la config du véhicule visé et recrée le véhicule.
---Source : lua/ge/extensions/core/vehicle/partmgmt.lua:1772
function core_vehicle_partmgmt.resetConfig() end

--- Bouton Reset des pièces : relit les parts du .pc d'origine et appelle setPartsConfig (obsolète, voir notes).
---Source : lua/ge/extensions/core/vehicle/partmgmt.lua:1786
function core_vehicle_partmgmt.resetPartsToLoadedConfig() end

--- Remet les variables de tuning à celles du .pc d'origine (vide si aucun) et recrée le véhicule.
---Source : lua/ge/extensions/core/vehicle/partmgmt.lua:1806
function core_vehicle_partmgmt.resetVarsToLoadedConfig() end

--- Efface les surbrillances (pièces, transparence, caméra) en refondant vers le véhicule opaque.
---Source : lua/ge/extensions/core/vehicle/partmgmt.lua:1741
---@param onlyIfVehChanged boolean|nil true : n'efface que si le modèle du véhicule a changé
---@param inVehID integer|nil véhicule
function core_vehicle_partmgmt.resetVehicleHighlights(onlyIfVehChanged, inVehID) end

--- Sauvegarde la config du véhicule visé sous un chemin complet (alias de savePartConfigFile → format 2).
---Source : lua/ge/extensions/core/vehicle/partmgmt.lua:713
---@param filename string chemin du .pc
---@param saveSettings table|boolean|nil voir notes
---@param saveMetadata table|nil métadonnées pour le fichier info
---@return boolean  true si sauvegardé
function core_vehicle_partmgmt.save(filename, saveSettings, saveMetadata) end

--- Écrase une config existante du joueur (pas une config officielle).
---Source : lua/ge/extensions/core/vehicle/partmgmt.lua:1277
---@param fileName string nom de fichier (avec ou sans .pc)
---@param configurationName string|nil nom affiché ; vide = nom existant
---@param saveSettings table|boolean|nil voir notes
---@param saveMetadata table|nil métadonnées
---@return table  {success, reason?, …} (reasons possibles : configNotFound, notPlayerConfig, …)
function core_vehicle_partmgmt.saveExistingLocalConfig(fileName, configurationName, saveSettings, saveMetadata) end

--- Sauvegarde la config sous <dossier du modèle>/<fn>.
---Source : lua/ge/extensions/core/vehicle/partmgmt.lua:726
---@param fn string nom de fichier relatif, avec extension .pc
---@param saveSettings table|boolean|nil voir notes
---@param saveMetadata table|nil métadonnées
---@return boolean  true si sauvegardé ; false sans véhicule
function core_vehicle_partmgmt.saveLocal(fn, saveSettings, saveMetadata) end

--- Étape 1 d'une capture de miniature : passe en caméra libre, FOV 35, déclenche saveLocalScreenshot_stage1 côté UI.
---Source : lua/ge/extensions/core/vehicle/partmgmt.lua:746
---@param fn string nom de fichier (non utilisé à cette étape)
function core_vehicle_partmgmt.saveLocalScreenshot(fn) end

--- Étape 2 : prend la capture jpg dans le dossier du modèle puis déclenche saveLocalScreenshot_stage3.
---Source : lua/ge/extensions/core/vehicle/partmgmt.lua:756
---@param fn string nom de fichier de la capture
---@return boolean|nil  false sans véhicule
function core_vehicle_partmgmt.saveLocalScreenshot_stage2(fn) end

--- Sauvegarde la config sous un nouveau nom de fichier dérivé de configurationName (en minuscules, suffixe numérique si déjà pris), génère la miniature et débloque le succès VEHICLE_CONFIG_SAVED.
---Source : lua/ge/extensions/core/vehicle/partmgmt.lua:1268
---@param configurationName string nom affiché de la configuration
---@param saveSettings table|boolean|nil voir notes
---@param saveMetadata table|nil métadonnées
---@return table  {success, reason?, fileName?, displayName?, configSaved?, thumbnailCopied?}
function core_vehicle_partmgmt.saveNewLocalConfig(configurationName, saveSettings, saveMetadata) end

--- Sauvegarde la config du véhicule visé au format 2 dans `filename` (+ fichier info_<nom>.json + peintures selon saveSettings), prévient l'UI et vide les caches de sélecteur. Voir les notes sur l'alias.
---Source : lua/ge/extensions/core/vehicle/partmgmt.lua:631
---@param partsCondition any conditions de pièces (nil dans les appels actuels)
---@param filename string chemin du .pc (ex. 'vehicles/pickup/ma_config.pc')
---@param saveSettings table|boolean|nil voir notes
---@param saveMetadata table|nil métadonnées à écrire dans le fichier info
---@return boolean  true si le .pc a été écrit
function core_vehicle_partmgmt.savePartConfigFileStage2(partsCondition, filename, saveSettings, saveMetadata) end

--- Écrit une collection de véhicules au format 4 dans un fichier JSON et prévient l'UI (VehicleconfigSaved, message).
---Source : lua/ge/extensions/core/vehicle/partmgmt.lua:503
---@param collectionTree table arbre de véhicules
---@param filename string fichier .pc de sortie
function core_vehicle_partmgmt.saveVehicleCollection(collectionTree, filename) end

--- Sauvegarde la config du véhicule visé comme véhicule par défaut (settings/default.pc) et affiche un message.
---Source : lua/ge/extensions/core/vehicle/partmgmt.lua:767
function core_vehicle_partmgmt.savedefault() end

--- Sélection temporaire (survol d'une pièce dans l'UI) : met ces pièces à pleine visibilité et recadre la caméra de pièces.
---Source : lua/ge/extensions/core/vehicle/partmgmt.lua:1645
---@param parts table<string, boolean> pièces survolées
---@param inVehID integer|nil véhicule
---@param cameraParts table|nil pièces à cadrer ; défaut = parts
---@param cameraOptions table|nil options de partFocusCamera.focusOnParts (ex. immediate)
function core_vehicle_partmgmt.selectParts(parts, inVehID, cameraParts, cameraOptions) end

--- Envoie à l'UI (guihook brut VehicleConfigChange) toutes les données du configurateur : id, modèle, arbre de pièces choisi, variables de tuning traduites, valeurs par défaut du .pc, catalogue de partpacks, pièces en surbrillance, infos enrichies des pièces.
---Source : lua/ge/extensions/core/vehicle/partmgmt.lua:792
---@param explicitVehicleId integer|nil véhicule ; nil = cible
function core_vehicle_partmgmt.sendDataToUI(explicitVehicleId) end

--- Envoie à l'UI (guihook PartsSelectorUpdate) la liste triée des pièces et les indices en surbrillance.
---Source : lua/ge/extensions/core/vehicle/partmgmt.lua:1711
function core_vehicle_partmgmt.sendPartsSelectorStateToUI() end

--- Comme setConfigOfVehicle pour le véhicule visé (ou explicitVehicleId).
---Source : lua/ge/extensions/core/vehicle/partmgmt.lua:945
---@param inData table données à fusionner
---@param respawn boolean|nil voir setConfigOfVehicle
---@param explicitVehicleId integer|nil véhicule ; nil = cible
function core_vehicle_partmgmt.setConfig(inData, respawn, explicitVehicleId) end

--- Fusionne `inData` dans la config du véhicule donné (voir notes sur respawn).
---Source : lua/ge/extensions/core/vehicle/partmgmt.lua:905
---@param veh userdata objet véhicule
---@param inData table ex. {paints = …}, {vars = …}, {partsTree = …}, {parts = …}
---@param respawn boolean|nil true (défaut) : recrée le véhicule ; false : mise à jour en direct des peintures
function core_vehicle_partmgmt.setConfigOfVehicle(veh, inData, respawn) end

--- Fusionne une liste de peintures dans la config ({paints = data}).
---Source : lua/ge/extensions/core/vehicle/partmgmt.lua:957
---@param data table[] peintures (1..3)
---@param respawn boolean|nil true = recréer le véhicule
---@param explicitVehicleId integer|nil véhicule ; nil = cible
function core_vehicle_partmgmt.setConfigPaints(data, respawn, explicitVehicleId) end

--- Fusionne des variables de tuning ({vars = data}) dans la config du véhicule visé.
---Source : lua/ge/extensions/core/vehicle/partmgmt.lua:961
---@param data table<string, number> [nom de variable] = valeur
---@param respawn boolean|nil true = recréer le véhicule
function core_vehicle_partmgmt.setConfigVars(data, respawn) end

--- Fixe le nom affiché (Configuration) dans la config du véhicule visé (sans sauvegarder).
---Source : lua/ge/extensions/core/vehicle/partmgmt.lua:735
---@param configurationName string nom
---@return boolean  false sans véhicule
function core_vehicle_partmgmt.setCurrentConfigurationName(configurationName) end

--- Applique un texte de plaque au véhicule visé (core_vehicles.setPlateText).
---Source : lua/ge/extensions/core/vehicle/partmgmt.lua:1157
---@param text string texte de plaque
---@return boolean  false sans véhicule
function core_vehicle_partmgmt.setCurrentLicensePlate(text) end

--- Fixe la transparence des pièces en surbrillance.
---Source : lua/ge/extensions/core/vehicle/partmgmt.lua:1580
---@param alpha number 0 (invisible) à 1 (opaque)
---@param inVehID integer|nil véhicule
function core_vehicle_partmgmt.setHighlightedPartsVisiblity(alpha, inVehID) end

--- Met à jour les données de surbrillance après un changement de pièces : les pièces existantes gardent leur état, les nouvelles prennent celui de leur parent.
---Source : lua/ge/extensions/core/vehicle/partmgmt.lua:1656
---@param inVehID integer|nil véhicule
---@param silent boolean|nil true : ne pas notifier l'UI
function core_vehicle_partmgmt.setNewParts(inVehID, silent) end

--- Obsolète : logue une erreur demandant d'utiliser setPartsTreeConfig. N'applique rien.
---Source : lua/ge/extensions/core/vehicle/partmgmt.lua:965
---@param data table ignoré
---@param respawn boolean|nil ignoré
function core_vehicle_partmgmt.setPartsConfig(data, respawn) end

--- Applique un nouvel arbre de pièces au véhicule visé (fusion de {partsTree = dataTree}) et émet le hook onPartsTreeConfigChanged(dataTree, respawn, part) avant.
---Source : lua/ge/extensions/core/vehicle/partmgmt.lua:969
---@param dataTree table arbre de pièces (chosenPartName, children…)
---@param respawn boolean|nil true = recréer le véhicule
---@param part any pièce à l'origine du changement (transmise au hook seulement)
function core_vehicle_partmgmt.setPartsTreeConfig(dataTree, respawn, part) end

--- Applique un skin : choisit la pièce '<modèle>_skin_<skin>' dans le slot 'paint_design' puis remplace le véhicule. skin vide retire le skin.
---Source : lua/ge/extensions/core/vehicle/partmgmt.lua:859
---@param skin string|nil nom du skin
function core_vehicle_partmgmt.setSkin(skin) end

--- Revient à l'affichage des pièces en surbrillance (après un survol).
---Source : lua/ge/extensions/core/vehicle/partmgmt.lua:1603
---@param inVehID integer|nil véhicule
---@param cameraParts table|nil pièces que la caméra garde cadrées
---@param cameraOptions table|nil options caméra
function core_vehicle_partmgmt.showHighlightedParts(inVehID, cameraParts, cameraOptions) end

--- Copie les variables de tuning en traduisant title, description, category et subCategory.
---Source : lua/ge/extensions/core/vehicle/partmgmt.lua:167
---@param tuningData table|nil vdata.variables
---@return table  copie traduite
function core_vehicle_partmgmt.translateTuningData(tuningData) end

--- Compare les peintures actuelles du véhicule visé avec celles du modèle/de la bibliothèque (core_vehiclePaints.validatePcPaints) et ajoute les réglages de sauvegarde par défaut.
---Source : lua/ge/extensions/core/vehicle/partmgmt.lua:1128
---@return table  résultat de validatePcPaints + defaults ; {} sans véhicule
function core_vehicle_partmgmt.validatePaints() end

