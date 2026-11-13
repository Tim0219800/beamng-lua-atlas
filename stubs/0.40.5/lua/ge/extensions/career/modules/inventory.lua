---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/inventory.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Inventaire de véhicules de la carrière : la table vehicles (inventoryId -> infos : model, config, niceName, owned, partConditions, timeToAccess, loanType, owningOrganization...), la correspondance inventoryId <-> id d'objet véhicule dans le monde, le véhicule courant, le dernier et le favori. Il gère l'ajout et la suppression de véhicules, leur apparition/entrée (spawnVehicle, enterVehicle), la sauvegarde (un fichier JSON et une miniature par véhicule dans career/vehicles/ plus career/inventory.json), le menu « Mes véhicules » de l'ordinateur, la vente, les plaques, les permissions et les POI de la grande carte.
--- Accès : extension `career_modules_inventory` : `extensions.load("career_modules_inventory")`, puis la globale `career_modules_inventory`
---@class career_modules_inventory
---@field dependencies table<integer, string> Extensions chargées avant : career_career, career_modules_log, gameplay_tutorial_setup.
career_modules_inventory = {}

--- Ajoute un véhicule du monde à l'inventaire : enregistre modèle, config, nom, plaque, valeur de base (configBaseValue), initialise les conditions de pièces, attribue un inventoryId libre si absent, définit le favori s'il est le premier et débloque GARAGE_STARTER à 3 véhicules possédés.
---Source : lua/ge/extensions/career/modules/inventory.lua:299
---@param vehId integer Id d'objet du véhicule.
---@param inventoryId integer|nil Id d'inventaire imposé, sinon le premier libre.
---@param options {owned: boolean|nil, finalPrice: number|nil}|nil owned vaut true par défaut ; finalPrice sert au succès FLIP_PROFIT.
---@return integer|nil  inventoryId, nil si l'objet ou ses données sont introuvables.
function career_modules_inventory.addVehicle(vehId, inventoryId, options) end

--- Réapplique au véhicule en jeu les conditions de pièces sauvegardées (initPartConditions).
---Source : lua/ge/extensions/career/modules/inventory.lua:428
---@param inventoryId integer Id d'inventaire.
---@param vehId integer|nil Id d'objet ; sinon déduit de l'inventaire.
function career_modules_inventory.applyPartConditions(inventoryId, vehId) end

--- Exécute le callback du bouton de choix d'indice buttonIndex pour le véhicule donné.
---Source : lua/ge/extensions/career/modules/inventory.lua:1111
---@param inventoryId integer Id d'inventaire choisi.
---@param buttonIndex integer Indice du bouton (à partir de 1).
---@param repairPrevVeh any Transmis au callback.
function career_modules_inventory.chooseVehicleFromMenu(inventoryId, buttonIndex, repairPrevVeh) end

--- Ferme tous les menus de la carrière.
---Source : lua/ge/extensions/career/modules/inventory.lua:1032
function career_modules_inventory.closeMenu() end

--- Debug : met à jour les conditions de pièces du véhicule courant puis le refait apparaître (replaceOption 2).
---Source : lua/ge/extensions/career/modules/inventory.lua:1370
function career_modules_inventory.debugRespawnCurrentVehicle() end

--- Rend un véhicule inaccessible pendant `delay` secondes (timeToAccess) avec une raison (bought, repair). Ignoré si delay <= 0.
---Source : lua/ge/extensions/career/modules/inventory.lua:1193
---@param inventoryId integer Id d'inventaire.
---@param delay number Durée en secondes.
---@param reason string Raison ("bought" ou "repair" produisent un message à la fin).
function career_modules_inventory.delayVehicleAccess(inventoryId, delay, reason) end

--- Fait entrer le joueur dans un véhicule de l'inventaire (nil = passer à pied). Sans effet si le véhicule est inaccessible (timeToAccess). Met d'abord à jour les conditions de pièces des véhicules apparus, sauf loadOption 1.
---Source : lua/ge/extensions/career/modules/inventory.lua:538
---@param newInventoryId integer|nil Id d'inventaire.
---@param loadOption integer|nil 1 : ne pas recharger le véhicule ; 2 : forcer le rechargement ; nil : entrer dans l'objet existant ou le faire apparaître.
---@param callback function|nil Appelée après l'entrée.
function career_modules_inventory.enterVehicle(newInventoryId, loadOption, callback) end

--- Accélère une réparation d'assurance payante (insurance.expediteRepair), sauvegarde et rafraîchit l'UI.
---Source : lua/ge/extensions/career/modules/inventory.lua:1187
---@param inventoryId integer Id d'inventaire.
---@param price number Prix de l'accélération.
function career_modules_inventory.expediteRepairFromInventory(inventoryId, price) end

--- Renvoie le garage dont la première zone est la plus proche de pos (position du joueur par défaut) dans le niveau courant.
---Source : lua/ge/extensions/career/modules/inventory.lua:36
---@param pos vec3|nil Position de référence.
---@return table|nil  Installation garage.
function career_modules_inventory.getClosestGarage(pos) end

--- Id d'inventaire du véhicule que le joueur conduit (nil à pied). Listé dans les fonctions « Debug » du fichier.
---Source : lua/ge/extensions/career/modules/inventory.lua:674
---@return integer|nil  inventoryId courant.
function career_modules_inventory.getCurrentVehicle() end

--- Id d'objet (monde) du véhicule courant de l'inventaire.
---Source : lua/ge/extensions/career/modules/inventory.lua:698
---@return integer|nil  Id d'objet véhicule.
function career_modules_inventory.getCurrentVehicleId() end

--- Renvoie l'ensemble des inventoryId modifiés depuis la dernière sauvegarde.
---Source : lua/ge/extensions/career/modules/inventory.lua:1343
---@return table<integer, boolean>  Ensemble des ids.
function career_modules_inventory.getDirtiedVehicles() end

--- Renvoie l'id d'inventaire du véhicule favori.
---Source : lua/ge/extensions/career/modules/inventory.lua:1214
---@return integer|nil  inventoryId favori.
function career_modules_inventory.getFavoriteVehicle() end

--- Convertit un id d'objet du monde en id d'inventaire (nil si le véhicule n'est pas dans l'inventaire).
---Source : lua/ge/extensions/career/modules/inventory.lua:688
---@param vehId integer|nil Id d'objet véhicule.
---@return integer|nil  Id d'inventaire.
function career_modules_inventory.getInventoryIdFromVehicleId(vehId) end

--- Liste les véhicules de l'inventaire présents dans le garage le plus proche (zone intersectée), triés par distance au joueur. Avec onlyFirst, renvoie un seul id (le premier trouvé par next, voir notes).
---Source : lua/ge/extensions/career/modules/inventory.lua:973
---@param onlyFirst boolean|nil Ne renvoyer qu'un id.
---@return integer[]|integer|nil  Liste d'ids, ou un id si onlyFirst.
function career_modules_inventory.getInventoryIdsInClosestGarage(onlyFirst) end

--- Id d'inventaire du dernier véhicule dans lequel le joueur est entré.
---Source : lua/ge/extensions/career/modules/inventory.lua:678
---@return integer|nil  inventoryId.
function career_modules_inventory.getLastVehicle() end

--- Renvoie la table inventoryId -> id d'objet pour les véhicules présents dans le monde (par référence).
---Source : lua/ge/extensions/career/modules/inventory.lua:694
---@return table<integer, integer>  Correspondance.
function career_modules_inventory.getMapInventoryIdToVehId() end

--- Nombre d'emplacements libres (20 moins les véhicules owned qui occupent de la place).
---Source : lua/ge/extensions/career/modules/inventory.lua:286
---@return integer  Emplacements libres.
function career_modules_inventory.getNumberOfFreeSlots() end

--- Enregistre les conditions de pièces reçues du véhicule (ignorées avec un avertissement si ce n'est pas une table), finalise un ajout en attente (hook onVehicleAdded) et synchronise l'inventaire de pièces.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/inventory.lua:395
---@param partConditions table|boolean Conditions, ou false si non initialisées.
---@param inventoryId integer Id d'inventaire.
function career_modules_inventory.getPartConditionsCallback(partConditions, inventoryId) end

--- Renvoie les infos d'un véhicule de l'inventaire.
---Source : lua/ge/extensions/career/modules/inventory.lua:1152
---@param inventoryId integer Id d'inventaire.
---@return table|nil  Infos du véhicule.
function career_modules_inventory.getVehicle(inventoryId) end

--- Convertit un id d'inventaire en id d'objet du monde (nil si non apparu).
---Source : lua/ge/extensions/career/modules/inventory.lua:682
---@param inventoryId integer|nil Id d'inventaire.
---@return integer|nil  Id d'objet.
function career_modules_inventory.getVehicleIdFromInventoryId(inventoryId) end

--- Nom d'affichage traduit du véhicule.
---Source : lua/ge/extensions/career/modules/inventory.lua:833
---@param inventoryId integer Id d'inventaire.
---@return string|nil  Nom.
function career_modules_inventory.getVehicleNiceNameTranslated(inventoryId) end

--- Chemin de la miniature du véhicule : fichier de la sauvegarde si une capture existe, sinon aperçu par défaut de sa configuration.
---Source : lua/ge/extensions/career/modules/inventory.lua:760
---@param inventoryId integer|nil Id d'inventaire.
---@return string|nil  Chemin d'image.
function career_modules_inventory.getVehicleThumbnail(inventoryId) end

--- Prépare les données d'un véhicule pour l'UI : valeur (et valeur réparée), prix de réparation express, distance, présence au garage/stockage, besoin de réparation, favori, assurance, permissions (réparation, vente, favori, stockage, plaque, retour de prêt), mise en vente et données de performance.
---Source : lua/ge/extensions/career/modules/inventory.lua:839
---@param inventoryId integer Id d'inventaire.
---@param inventoryIdsInGarage table<integer, boolean>|nil Véhicules du garage le plus proche (calculé si nil).
---@return table|nil  Données pour l'UI.
function career_modules_inventory.getVehicleUiData(inventoryId, inventoryIdsInGarage) end

--- Renvoie la table complète des véhicules de l'inventaire (par référence).
---Source : lua/ge/extensions/career/modules/inventory.lua:1148
---@return table<integer, table>  inventoryId -> infos du véhicule.
function career_modules_inventory.getVehicles() end

--- Indique s'il reste au moins un emplacement libre.
---Source : lua/ge/extensions/career/modules/inventory.lua:294
---@return boolean  true si oui.
function career_modules_inventory.hasFreeSlot() end

--- Indique si l'inventaire ne contient aucun véhicule.
---Source : lua/ge/extensions/career/modules/inventory.lua:1347
---@return boolean  true si vide.
function career_modules_inventory.isEmpty() end

--- Valide un texte de plaque via core_vehicles.isLicensePlateValid.
---Source : lua/ge/extensions/career/modules/inventory.lua:1351
---@param text string Texte.
---@return boolean  Validité.
function career_modules_inventory.isLicensePlateValid(text) end

--- Indique si le joueur est dans un véhicule de l'inventaire (currentVehicle défini), possédé ou non.
---Source : lua/ge/extensions/career/modules/inventory.lua:702
---@return boolean  true si assis dans un véhicule de l'inventaire.
function career_modules_inventory.isSeatedInsideOwnedVehicle() end

--- Valide un nom de véhicule : non vide et sans guillemet, antislash ni caractère de contrôle (\b \f \n \r \t).
---Source : lua/ge/extensions/career/modules/inventory.lua:1355
---@param text string|nil Nom.
---@return boolean  Validité.
function career_modules_inventory.isVehicleNameValid(text) end

--- Hook : met à jour les conditions de pièces du véhicule courant et envoie à l'UI s'il a besoin de réparation (gameContextPlayerVehicleDamageInfo).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/inventory.lua:1200
function career_modules_inventory.onAvailableMissionsSentToUi() end

--- Hook : sortir du véhicule (mode marche) fait entrer dans « aucun véhicule » ; monter dans un véhicule de l'inventaire l'enregistre comme courant.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/inventory.lua:964
---@param enabled boolean true si on passe en mode marche.
---@param vehicleInFrontVehId integer|nil Id du véhicule devant le joueur.
function career_modules_inventory.onBeforeWalkingModeToggled(enabled, vehicleInFrontVehId) end

--- Hook : à l'ouverture de la grande carte, crée un instantané de conditions de pièces « beforeReset » pour le véhicule courant.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/inventory.lua:662
function career_modules_inventory.onBigMapActivated() end

--- Hook : vend les véhicules si la sauvegarde est trop ancienne, puis prépare l'inventaire (réapparition des véhicules, entrée dans le véhicule courant, équipement de départ pour une nouvelle carrière).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/inventory.lua:636
---@param active boolean Rien si false.
function career_modules_inventory.onCareerActive(active) end

--- Hook de permissions : pour les véhicules non possédés, interdit vente, réparation, mission, peinture, achat de pièces, plaque, tuning, stockage, échange de pièces, remorquage au garage et favori ; interdit aussi réparer/vendre un véhicule inaccessible, mettre en favori le favori ou un fichier manquant, stocker un véhicule absent du monde.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/inventory.lua:1270
---@param tags string[] Tags demandés.
---@param permissions table[] Liste à compléter ({permission}).
---@param additionalData {inventoryId: integer}|nil Contexte (inventoryId).
function career_modules_inventory.onCheckPermission(tags, permissions, additionalData) end

--- Hook de l'ordinateur : ajoute la fonction « Mes véhicules » (ordre 1), désactivée tant que le véhicule de départ n'est pas acheté.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/inventory.lua:1218
---@param menuData table Données du menu.
---@param computerFunctions table Fonctions à compléter (general).
function career_modules_inventory.onComputerAddFunctions(menuData, computerFunctions) end

--- Hook : mémorise le véhicule dans lequel on est entré comme dernier véhicule.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/inventory.lua:1142
---@param inventoryId integer|nil Id d'inventaire.
function career_modules_inventory.onEnterVehicleFinished(inventoryId) end

--- Hook : l'écran d'inventaire est fermé.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/inventory.lua:1137
function career_modules_inventory.onExitVehicleInventory() end

--- Hook : si la carrière est active, charge les fichiers de career/vehicles/ et inventory.json (véhicule courant, dernier, favori, positions, position à pied) ; décrémente timeToAccess du temps écoulé depuis la sauvegarde.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/inventory.lua:54
function career_modules_inventory.onExtensionLoaded() end

--- Hook de la liste de POI : ajoute un marqueur de grande carte pour chaque véhicule de l'inventaire présent dans le monde (autre que celui du joueur), avec description (distance, plaque, odomètre) et miniature.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/inventory.lua:1299
---@param levelIdentifier string Niveau (non utilisé).
---@param elements table[] Liste de POI à compléter.
function career_modules_inventory.onGetRawPoiListForLevel(levelIdentifier, elements) end

--- Hook de sauvegarde : écrit inventory.json, met à jour les conditions de pièces, puis écrit chaque véhicule (JSON + miniature si demandée) et supprime les fichiers de véhicules disparus ; à la fin, émet onVehicleSaveFinished.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/inventory.lua:247
---@param currentSavePath string Dossier de sauvegarde.
---@param vehiclesThumbnailUpdate integer[]|nil Ids des véhicules dont la miniature doit être refaite.
function career_modules_inventory.onSaveCurrentProfile(currentSavePath, vehiclesThumbnailUpdate) end

--- Hook : enregistre l'inventaire comme extension de sauvegarde asynchrone (career_saveSystem.registerAsyncSaveExtension).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/inventory.lua:177
function career_modules_inventory.onSaveCurrentProfileAsyncStart() end

--- Hook : quand le fondu d'écran est complet (state 1), supprime les véhicules marqués puis exécute l'action différée (apparition d'un véhicule).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/inventory.lua:1001
---@param state integer État du fondu.
function career_modules_inventory.onScreenFadeState(state) end

--- Hook de frame : sauvegarde initiale d'une nouvelle carrière (après 10 frames), toasts de véhicule mis en stockage ou prêt rendu, décompte de timeToAccess avec messages de livraison/réparation.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/inventory.lua:923
---@param dtReal number Temps réel (s).
---@param dtSim number Temps simulé (s).
---@param dtRaw number Temps brut (s).
function career_modules_inventory.onUpdate(dtReal, dtSim, dtRaw) end

--- Ouvre l'inventaire pour choisir un véhicule à mettre en vente (action addListing côté UI), toutes les autres actions désactivées.
---Source : lua/ge/extensions/career/modules/inventory.lua:1115
function career_modules_inventory.openInventoryMenuForChoosingListing() end

--- Ouvre l'écran d'inventaire (career.computer.vehicleInventory) avec des boutons de choix configurables et met à jour les conditions de pièces des véhicules apparus.
---Source : lua/ge/extensions/career/modules/inventory.lua:1009
---@param _chooseButtonsData table[]|nil Boutons {callback, buttonText, repairRequired, insuranceRequired, ownedRequired...}.
---@param header string|nil Titre du menu.
---@param _buttonsActive table|nil repairEnabled, sellEnabled, favoriteEnabled, storingEnabled, returnLoanerEnabled (true par défaut).
---@param _backTarget string|nil Route de retour.
function career_modules_inventory.openMenu(_chooseButtonsData, header, _buttonsActive, _backTarget) end

--- Ouvre l'inventaire depuis l'ordinateur du garage avec trois boutons : récupérer au garage, remplacer le véhicule actuel, ouvrir l'indice de performance.
---Source : lua/ge/extensions/career/modules/inventory.lua:1082
---@param _originComputerId string Id de l'ordinateur d'origine.
function career_modules_inventory.openMenuFromComputer(_originComputerId) end

--- Achète un changement de plaque : paie, applique le texte, débloque NOW_ITS_MINE, joue le son et marque le véhicule modifié. Ne fait rien si le joueur ne peut pas payer.
---Source : lua/ge/extensions/career/modules/inventory.lua:1243
---@param inventoryId integer Id d'inventaire.
---@param text string Texte de plaque.
---@param money number Prix.
function career_modules_inventory.purchaseLicensePlateText(inventoryId, text, money) end

--- Supprime le véhicule de l'inventaire et du monde, émet onVehicleRemoved et réassigne le favori si besoin.
---Source : lua/ge/extensions/career/modules/inventory.lua:378
---@param inventoryId integer Id d'inventaire.
function career_modules_inventory.removeVehicle(inventoryId) end

--- Supprime seulement l'objet véhicule du monde (le véhicule reste dans l'inventaire, en stockage) ; passe le joueur en mode marche s'il le conduisait. Émet onInventoryPreRemoveVehicleObject.
---Source : lua/ge/extensions/career/modules/inventory.lua:360
---@param inventoryId integer Id d'inventaire.
---@param skipPartConditions boolean|nil Non utilisé dans le corps (reste un TODO).
function career_modules_inventory.removeVehicleObject(inventoryId, skipPartConditions) end

--- Renomme le véhicule (niceName) s'il est valide et le marque modifié.
---Source : lua/ge/extensions/career/modules/inventory.lua:1360
---@param inventoryId integer Id d'inventaire.
---@param name string Nouveau nom.
---@return boolean  false si le nom est invalide.
function career_modules_inventory.renameVehicle(inventoryId, name) end

--- Quitte le sélecteur : navigue vers la route de retour (career.computer par défaut).
---Source : lua/ge/extensions/career/modules/inventory.lua:1036
---@return any  Résultat de ui_router.navigate.
function career_modules_inventory.requestPickerExit() end

--- Rend un véhicule prêté (career_modules_loanerVehicles.returnVehicle) puis sauvegarde et rafraîchit l'UI.
---Source : lua/ge/extensions/career/modules/inventory.lua:1180
---@param inventoryId integer Id d'inventaire.
function career_modules_inventory.returnLoanedVehicleFromInventory(inventoryId) end

--- Vend un véhicule : émet onBeforeVehicleSell, crédite le prix (ou la valeur calculée par valueCalculator), supprime le véhicule, joue le son d'achat, débloque FLIP_PROFIT si revendu au-dessus du prix d'achat final, et journalise.
---Source : lua/ge/extensions/career/modules/inventory.lua:1156
---@param inventoryId integer Id d'inventaire.
---@param price number|nil Prix imposé (sinon valeur calculée).
---@return boolean|nil  true si vendu, nil si le véhicule n'existe pas.
function career_modules_inventory.sellVehicle(inventoryId, price) end

--- Vend depuis l'écran d'inventaire : vend, sauvegarde la carrière et renvoie les données à l'UI.
---Source : lua/ge/extensions/career/modules/inventory.lua:1173
---@param inventoryId integer Id d'inventaire.
function career_modules_inventory.sellVehicleFromInventory(inventoryId) end

--- Envoie à l'UI (guihooks vehicleInventoryData) tous les véhicules, les boutons de choix, l'en-tête, le nombre d'emplacements libres et l'argent du joueur.
---Source : lua/ge/extensions/career/modules/inventory.lua:903
function career_modules_inventory.sendDataToUi() end

--- Définit le véhicule favori (ignoré si l'id est inconnu).
---Source : lua/ge/extensions/career/modules/inventory.lua:1208
---@param inventoryId integer Id d'inventaire.
function career_modules_inventory.setFavoriteVehicle(inventoryId) end

--- Change le texte de plaque du véhicule dans le monde et dans sa config.
---Source : lua/ge/extensions/career/modules/inventory.lua:1235
---@param inventoryId integer Id d'inventaire.
---@param text string Texte de plaque.
function career_modules_inventory.setLicensePlateText(inventoryId, text) end

--- Marque un véhicule comme modifié : il sera réécrit (avec nouvelle dirtyDate) à la prochaine sauvegarde.
---Source : lua/ge/extensions/career/modules/inventory.lua:146
---@param inventoryId integer Id d'inventaire.
function career_modules_inventory.setVehicleDirty(inventoryId) end

--- Fait apparaître un véhicule de l'inventaire depuis sa config (liste de pièces aplatie), restaure ses conditions de pièces et réconcilie l'inventaire de pièces. Retourne nil si le modèle ou le fichier de config n'existe plus.
---Source : lua/ge/extensions/career/modules/inventory.lua:436
---@param inventoryId integer Id d'inventaire.
---@param replaceOption integer|nil 1 : remplace le véhicule courant du joueur ; 2 : remplace l'objet ayant le même inventoryId ; autre : nouveau véhicule sans y entrer.
---@param callback function|nil Appelée quand les conditions de pièces sont synchronisées.
---@return userdata|nil  Objet véhicule créé.
function career_modules_inventory.spawnVehicle(inventoryId, replaceOption, callback) end

--- Appelé après une téléportation depuis la grande carte : sauvegarde la carrière si le joueur est dans un véhicule de l'inventaire et si l'autosauvegarde est active.
---Source : lua/ge/extensions/career/modules/inventory.lua:668
function career_modules_inventory.teleportedFromBigmap() end

--- Demande au véhicule ses conditions de pièces (getPartConditions) et les stocke dans l'inventaire puis dans l'inventaire de pièces.
---Source : lua/ge/extensions/career/modules/inventory.lua:406
---@param vehId integer|nil Id d'objet ; sinon déduit de inventoryId.
---@param inventoryId integer Id d'inventaire.
---@param callback function|nil Appelée une fois la valeur reçue.
function career_modules_inventory.updatePartConditions(vehId, inventoryId, callback) end

--- Marque tous les véhicules apparus comme modifiés et met à jour leurs conditions de pièces ; callback est appelé quand tous sont traités (ou tout de suite s'il n'y en a aucun).
---Source : lua/ge/extensions/career/modules/inventory.lua:150
---@param callback function|nil Appelée à la fin.
function career_modules_inventory.updatePartConditionsOfSpawnedVehicles(callback) end

