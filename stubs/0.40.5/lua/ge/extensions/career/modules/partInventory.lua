---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/partInventory.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Inventaire des pièces de la carrière. Chaque pièce (installée sur un véhicule de l'inventaire ou en stockage, location = 0) est une entrée de la table partInventory indexée par un partId entier. Le module génère les pièces d'un véhicule depuis son arbre de pièces (partsTree), les réconcilie avec le véhicule réel après modification, vend les pièces stockées, alimente l'écran « Mes pièces » de l'ordinateur de garage et sauvegarde le tout dans career/partInventory.json (sérialisé).
--- Accès : extension `career_modules_partInventory` : `extensions.load("career_modules_partInventory")`, puis la globale `career_modules_partInventory`
---@class career_modules_partInventory
---@field dependencies table<integer, string> Extensions chargées avant : career_career.
career_modules_partInventory = {}

--- Ajoute une pièce sous le plus petit partId libre (à partir de 1).
---Source : lua/ge/extensions/career/modules/partInventory.lua:121
---@param part table Pièce à ajouter.
function career_modules_partInventory.addPartToInventory(part) end

--- Ferme l'écran : si l'autosauvegarde est active et des véhicules sont modifiés, les sauvegarde d'abord (la fermeture se fait dans onSaveFinished), sinon retourne directement à l'ordinateur ou ferme les menus.
---Source : lua/ge/extensions/career/modules/partInventory.lua:508
function career_modules_partInventory.closeMenu() end

--- Renvoie la table de toutes les pièces (partId -> pièce), par référence.
---Source : lua/ge/extensions/career/modules/partInventory.lua:548
---@return table<integer, table>  Inventaire des pièces.
function career_modules_partInventory.getInventory() end

--- Cherche la pièce installée dans un slot d'un véhicule.
---Source : lua/ge/extensions/career/modules/partInventory.lua:467
---@param inventoryId integer Id d'inventaire du véhicule (location).
---@param path string Chemin du slot (containingSlot).
---@return table|nil  La pièce.
function career_modules_partInventory.getPart(inventoryId, path) end

--- Renvoie la table inventoryId -> partPath -> partId (véhicules seulement).
---Source : lua/ge/extensions/career/modules/partInventory.lua:544
---@return table  Table des chemins de pièces.
function career_modules_partInventory.getPartPathToPartIdMap() end

--- Renvoie la table location -> containingSlot -> partId.
---Source : lua/ge/extensions/career/modules/partInventory.lua:540
---@return table  Table des slots.
function career_modules_partInventory.getSlotToPartIdMap() end

--- Indique si la pièce doit être cachée dans l'UI : auxiliaire (description.isAuxiliary) et de valeur nulle.
---Source : lua/ge/extensions/career/modules/partInventory.lua:129
---@param part table Pièce.
---@return boolean|nil  true si masquée.
function career_modules_partInventory.isHiddenInUI(part) end

--- Hook de l'ordinateur : ajoute la fonction « Mes pièces » (ordre 5), désactivée tant que le véhicule de départ n'est pas acheté.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/partInventory.lua:552
---@param menuData table Données du menu.
---@param computerFunctions table Fonctions à compléter (general).
function career_modules_partInventory.onComputerAddFunctions(menuData, computerFunctions) end

--- Hook : planifie la mise à jour des tables d'index lors de l'entrée dans un véhicule.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/partInventory.lua:438
---@param currentVehicle integer|nil Id d'inventaire du véhicule courant.
function career_modules_partInventory.onEnterVehicleFinished(currentVehicle) end

--- Hook : charge partInventory.json (désérialisé), vend les pièces en stockage si la sauvegarde est d'une version plus ancienne, recharge les descriptions JBeam, supprime les pièces cachées en stockage et reconstruit les tables d'index.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/partInventory.lua:399
function career_modules_partInventory.onExtensionLoaded() end

--- Hook : après un achat de pièces, supprime les pièces cachées en stockage et reconstruit les index.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/partInventory.lua:445
function career_modules_partInventory.onPartShoppingTransactionComplete() end

--- Cycle de vie du routeur UI : renvoie les données de l'inventaire une fois la vue montée si le menu est ouvert.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/partInventory.lua:493
---@param context any Contexte du routeur.
---@param toRoute any Route cible.
---@param fromRoute any Route précédente.
---@param data table routeData.
function career_modules_partInventory.onRouteMount(context, toRoute, fromRoute, data) end

--- Hook de fin de sauvegarde : ferme le menu si closeMenu l'attendait.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/partInventory.lua:529
function career_modules_partInventory.onSaveFinished() end

--- Hook de frame : ajoute les pièces d'un véhicule nouvellement ajouté et met à jour les tables d'index après un changement de véhicule, dès que partConditions est disponible.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/partInventory.lua:282
function career_modules_partInventory.onUpdate() end

--- Hook : mémorise le véhicule dont il faudra ajouter les pièces dans onUpdate.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/partInventory.lua:450
---@param inventoryId integer Id d'inventaire.
function career_modules_partInventory.onVehicleAdded(inventoryId) end

--- Hook : supprime toutes les pièces localisées sur le véhicule retiré.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/partInventory.lua:454
---@param inventoryId integer Id d'inventaire.
function career_modules_partInventory.onVehicleRemoved(inventoryId) end

--- Hook de sauvegarde : écrit partInventory.json dans <save>/career/ (sans le champ description, via serialize).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/partInventory.lua:355
---@param currentSavePath string Dossier de sauvegarde.
function career_modules_partInventory.onVehicleSaveFinished(currentSavePath) end

--- Ouvre l'écran des pièces : choisit le véhicule courant ou celui du garage le plus proche, met à jour ses conditions de pièces puis navigue vers career.computer.partInventory.
---Source : lua/ge/extensions/career/modules/partInventory.lua:476
---@param _originComputerId string|nil Id de l'ordinateur d'origine.
function career_modules_partInventory.openMenu(_originComputerId) end

--- Notifie que l'UI de l'inventaire est fermée (partInventoryOpen = false).
---Source : lua/ge/extensions/career/modules/partInventory.lua:536
function career_modules_partInventory.partInventoryClosed() end

--- Point d'entrée du bouton retour du routeur UI : appelle closeMenu pour conserver le comportement d'autosauvegarde.
---Source : lua/ge/extensions/career/modules/partInventory.lua:525
function career_modules_partInventory.requestExit() end

--- Vend des pièces en stockage : crédite la somme de leurs valeurs, joue le son d'achat, les supprime et rafraîchit l'UI si le menu est ouvert.
---Source : lua/ge/extensions/career/modules/partInventory.lua:24
---@param partIds integer[] Ids des pièces à vendre (location 0 obligatoire).
function career_modules_partInventory.sellParts(partIds) end

--- Envoie à l'UI (guihooks partInventoryData) la liste des pièces visibles (hors pièces principales), leur valeur finale, leur accessibilité (non installées sur un véhicule) et les données des véhicules.
---Source : lua/ge/extensions/career/modules/partInventory.lua:316
function career_modules_partInventory.sendUIData() end

--- Recopie dans chaque pièce la condition (partCondition) connue du véhicule qui la contient.
---Source : lua/ge/extensions/career/modules/partInventory.lua:110
function career_modules_partInventory.updatePartConditionsInInventory() end

--- Relit les pièces du véhicule actuellement présent et les réconcilie avec l'inventaire : met à jour vehicle.config, conserve condition, tags, année, repairCount et primered des pièces existantes (même slot), ajoute les nouvelles (condition par défaut intégrité 1, odomètre 0, visuel 1) et supprime celles disparues. Marque le véhicule comme modifié.
---Source : lua/ge/extensions/career/modules/partInventory.lua:152
---@param inventoryId integer Id d'inventaire du véhicule.
---@return {added: table[], removed: table[], changed: {old: table, new: table}[]}  Différences détectées.
function career_modules_partInventory.updatePartsToMatchSpawnedVehicle(inventoryId) end

